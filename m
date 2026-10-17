Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0101C861D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792197288; cv=none; b=Lg2b8TFtb1CdLVeEs83hiP6TWCxP4tjEYDGMIzGmBlC0TwpgSywQ/0hh7IXv3Y/MLcUBXXRsBuLbXz/VLiFy3N5zxFE98c6nqPbjBkk30islw/vfsJwPdvKISJLldMRolcQJH+2G+Lxt8/IBItafPq0ibZhyo/HdTEO3LNRBftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792197288; c=relaxed/simple;
	bh=Uysk2PPsTqzTyTiZaUpbdBbNf+bTXc4rWQb7gKDcOII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI83r2/vGjXZEJz20HWE1t0VqXHs8qqDLwrmSqxjRzmqhqxwpD43e2vgxg5H63dpJTut70IUGgh+7GXtiSlwPIZgAMiun/Txp+369mxNIRMNvVQhpMVzOLBPVfSCVWxoITmvHo8FAmn9peL2zzHhDzp0TEe/Oaxgd4BLAKB8amo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BtwO4AKj; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BtwO4AKj"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso558652eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792197286; x=1792802086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0aepwILCIIPYy/3iG8trIfjCcCal604FcoCtw2lWda0=;
        b=BtwO4AKjWNCU7Olm6QXFGmR12/0ZFzpxy4YyOeyWcQjd7zO7nnVw5JJ9HpZ+N8vsou
         FHN5QDMYvGo68wHHAZoEZsHyJ6BJ1OSQVRkKH7sNwMde3AaRrzcvVaaM2/ObGbRq6+sc
         tOi0ySPl+1PKz4YWj8A4zIeJLrjPdfxqwNr5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792197286; x=1792802086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0aepwILCIIPYy/3iG8trIfjCcCal604FcoCtw2lWda0=;
        b=lZkYKWWuZEpS6faeeRzkjGgf/eUa/T4ukIYyaQM4UpvPVubEJ29WPtYCwVioH7zo2g
         745pa47MoGvv2u7pPadxzmkazhJvcPTOK3nSTZy26MUxzL8RYaKUNhYizotoiy2IwGEh
         fp1cUcQF1VvzI/Ila+IaQdr4Kq/g1Rxl3Tzt8M+PIYrCk2My6ExgfxvRP22rawAGTif5
         3U3ygcdJjQm41r19KvoUUWan+RvFY+TVf/Z3vV5pzMvw+9A4ixG5miAIvLXaN9wdHmBP
         VsJpEtt5iENhu7pllxj2PjmJlng2FRHCVtnS911LZW1ybbfowX+/93kuQFOVDuDU7W2J
         grmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJmcXPAY9Qgzxyc37uN8JND6IF8ynRQTxJusk3zSMY6AxuOC2Jrp0ybeXB/ZJ7DWqyEHAFovhX/Svx0Co=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe2SRyTSJdiX3p8zh++deHhyfLzMq74ybZdNmX76JctbP9t7uZ
	r6qeHe5D6JEIfmCiDOVs5iR5w39T7rk/9t/lLWqK6en0YhMlDFMFNrT4hFf/R082nQ==
X-Gm-Gg: AYBFou3GuRUsEvXLuccirDA1Xh5jSJkQ4iO75xx/Epg7DiPG4pM2DVjUD95MHaQEro5
	dRib4cR9wf7PpHbPo4/OQ7y7UDA/U46uSux/Lmwm4RXKRxvw4qniS0vrCMxrBMFze0DSb3drabM
	eD79IAegfkGW8wLE8SZ1oyfYxeKJ6G/pl/MktYAk/P9gMYaUhmNwgpFHFvnPzEWwK3y3pSJS+Rm
	Ryurzx9Mn3tSSroMwz4rGHngW0GwwN1qpaUdXC/p2uaETRprq5K3kVh9wEcPbYUYvIBaLcc+FaZ
	hXJGjDYfjYbVA4OWf0DKHDlMaYtjkLS3LxanqQt3fSB6Hm8BLOSIIDL94b+N8pJASoJ8bFTS497
	S7wKFZUmbVjU/wmr8qKEhhS2Ia+L0/3hgElMZ8gT8+M+fhc0quxEqADRZXW2EoUp5h/tzdEDL/a
	v3HqYKdEgUAj0vfnCABrUVFVpVzvqaKmXT9EakVWb8FBpjvD/9sxreouNpubZdGy/iNHIjKSxb0
	PRaYCsENm0DawIicVtVpLxZUX9dURdUZ7bg
X-Received: by 2002:a05:701b:4582:20b0:184:19ee:1fdd with SMTP id a92af1059eb24-1850d370592mr1903173c88.5.1792197285806;
        Fri, 16 Oct 2026 17:34:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:d542:736d:a85:f140])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1830f213ba7sm10311484c88.0.2026.10.16.17.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 17:34:45 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:34:43 -0700
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>, Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH v4 2/2] PM: runtime: Add Example Driver Patterns section
Message-ID: <atLCo6LyUmepwg4r@google.com>
References: <20261001155118.1750028-1-briannorris@chromium.org>
 <20261001085009.v4.2.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAJZ5v0hMHutu69acgSR7KsmcLs0McZK+-3OFoiqFrU5GnJzTNQ@mail.gmail.com>
 <as_i5MEz3WfnDQmf@google.com>
 <CAJZ5v0i+77gt-KmMYdxxzS4uGzxFArrYGpoDnjrfknpPOkAuHg@mail.gmail.com>
 <atE9urIHXAJZXu6k@google.com>
 <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>

Hi Rafael,

[ trimming the rest. I appreciate the replies! Will respond later in
  this thread, but largely -- ack. ]

On Fri, Oct 16, 2026 at 07:42:47PM +0200, Rafael J. Wysocki (Intel) wrote:
> On Thu, Oct 15, 2026 at 10:55 PM Brian Norris <briannorris@chromium.org> wrote:
> > On Thu, Oct 15, 2026 at 10:11:04PM +0200, Rafael J. Wysocki (Intel) wrote:
> > > On Wed, Oct 14, 2026 at 10:15 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > Would you be OK with pm_runtime_force_suspend() as an alternative here?
> > > > It seems like some drivers have started using that in remove(), which
> > > > doesn't quite match its docs, but otherwise seems OK to me. I was
> > > > considering that already here, and I even think it might be a good idea
> > > > to do automatically in devm_*, as I noted here:
> > > >
> > > >   https://lore.kernel.org/all/arVWVA3lks7SopQH@google.com/
> > > >
> > > >   (note: there's definitely at least one typo in there; should be
> > > >   !pm_runtime_status_suspended(); and it needs some other adjustments to
> > > >   actually verify the device was suspended at time of enable(); ... so
> > > >   consider it a concept, not a patch.)
> > > >
> > > > But I kinda wanted a maintainer opinion before I went too far on that.
> > >
> > > That shouldn't be necessary as per the above.
> >
> > OK, yes, not necessary in this particular example.
> >
> > But my hope is that devm_pm_runtime_enable() can be made easier to use.
> > It would be nice if we had the property:
> >
> >   If your device was suspended (most resources powered off) when
> >   devm_pm_runtime_enable() is called, the PM helpers will suspend it
> >   (power it back off) on remove().
> 
> I'm not quite convinced that runtime PM is suitable for devm_ type of
> management.
> 
> IIRC, devm_pm_runtime_enable() was introduced to avoid some code
> duplication between drivers, but I don't think that it may be expected
> to be universally applicable.

I also don't think it will be univerally applicable, but:

1) it's reasonably widely used. (220 and growing.)
2) it's commonly used for "simple" drivers.
3) those "simple" drivers still often get it wrong.
4) I don't see a major downside in trying to improve it in the ways I'm
   thinking.

For #3: literally the first (alphabetical git grep) use that calls
devm_pm_runtime_enable() without first marking it active is
drivers/char/hw_random/mtk-rng.c, and it has a bug -- it doesn't balance
clk_prepare_enable() and clk_disable_unprepare(). In fact, it performs
no remove() action, because *normally* a simple driver that uses devm_*
for everything is automatically in good shape. Everything will tear down
in reverse order, correctly.

But runtime PM is crazy, so no, that's not true. Runtime PM allows (via
.../power/control -> on) the device to leave in an ACTIVE state, and for
that clock to be left on. I believe if the driver unbinds and binds
again, the clock may be mismanaged forever.

I think a simple driver like that should be simple, and we can make
devm_* + pm_runtime work correctly for at least the most straightforward
of cases. Is that an outlandish goal?

Brian
