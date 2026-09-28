Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B252F8E93
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571089; cv=none; b=E7hBzjxO/eX0CLDUE8SNh/Q1mjc9LnEcvBEQjCuwiKzwoTGTddiZqFcb4LtCTRqvYpLYfJmFCKTo/Qv+Lc+nADfHywDCrszCixrJCGQ5Q9QFttotp+NReZ1OdmIeAH/9W9d6U7jiHJtof5TyZN0kqnLNUTmXmmvfc3ZL9I/0Pgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571089; c=relaxed/simple;
	bh=/RiLw2SErvUKqOgeJzpySOUxPAqr2XROBbtgzqBp1HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWuJG5Hp5KmJx8m+FUn6JKml7/x/zBwJIpr3MO9cD3rc9nTvyEB9NOsHpQpgo8i0aJKiwEbY4JSrBcLjgk7vTBXeJbqouEtjPUdHPK6mc2PIUxzY7Z2QYRjlaNQv+BdhhsBAvHFsXNBaA6fqXyZbOuellrZ7VTCIH8wu6V984K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7ccztPx; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7ccztPx"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so3185932eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790571087; x=1791175887; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fxBVsadU3CapuSwF1ZwYMR5BhuIaCuGr5O6zle7Zy+0=;
        b=o7ccztPxpxzhKsryUU5W3ki29pXPltPeaqr7hj1j6KqXGcLvALnP0J8kbzDYwDVw/a
         XEgl3Hu37uW8e9r87QEM7N2pRr33Fanvwk2j6kw9YqPjLHWIqZ2QEkrSPa44mMr6v9ms
         Hv2K+bJYOEQiNl/fr5AgpqGCD8m1sKPHF/Uzd2IF5h19Po0wnhQf8dJsQNjnTckDOMX5
         qqUrjif4ryPR1gfsrk3qLyR+U/k+9IMahMkzQav8kuBBn3zIjwYHOBk/VXh9xRchJ77T
         1/1Cue8wGD6DeSrcvV7R034lH9uViAVHLMhgwHkcZNTDbqiVJ8gxva10lAXFI4UIghKX
         6SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790571087; x=1791175887;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxBVsadU3CapuSwF1ZwYMR5BhuIaCuGr5O6zle7Zy+0=;
        b=mhaIMMlxvLgC3mUzWroE1aQ4+b+FdWPsaxg2xCOMCN8Ve1qwizH6NyEoDA8tZnHksj
         N2H3+f8PhinJJ+9q/Zwz1uGLjfI3Bj66ct8p8j2KB/Q1z2lshsu3GiD8NugEoSv2ki5s
         UwodEtpxZv5SUgNjxvjxGtSO/cuxBfP+nyl8VReboo8XCmwMRsomTWANLrYJZ3TyO6rQ
         NX/G3Z+VChE8S2s5M1PblzTWRNdqf/rOSXEYx5DqcBy9yjRzdRR9t2vz8HSGlOgfGSGE
         XqdaqUSX3pEzpABl27m9ttB6/UuiSdb1V3Csw1seDCtyLO/AQjXM0yFhUO5e5SQRe6p5
         pbWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPmK4+IaFfZfrJcnNC0zXVUt8SkHZxd4m2/RLsMAyYst5iOo3VkazGsbSRXSE+6QAjvcxPUlfgkQSEkpo=@vger.kernel.org
X-Gm-Message-State: AFuF++mlxTlRyiXszZS1gua2XcSQpoaFjaVWPSf/VvvVo4E1kxUimSqo
	Dt8+DsabMnDUQ3vPp+avWwm3WHvA/TJ1ywLb2VbX8x2WuPrRw6IZkjhQ
X-Gm-Gg: AYBFou2ncm8fea5LDQ+vD9p+l0sJpLSrM5jGLK+4AH2AgH34kdY5AeZQ5ivO1W3ZNqu
	Jr3e+sGXWnl51rQYPHxiAIoWz1i5tazdIPyDiwkKPCIfTEsvqROt4hiSOTbiwM1kXMgzrGjwqSR
	lElT835jLumAYIVZ+UBokxCP8ZS5FqRlBPFmkgKl4gloe2A0V5Qx5+KWJuh2q074wYzLT9+U1ts
	uulSj61y3P/2dU0Qortci99fqkLNiRDKc0XadxFxgoDIx9tdmh7n89tBj0sUJug0f44Ksuefnw3
	eiWALDTM3d2QBNctDmFW6pL22sn+ZpymwARRJyS7qs5ISHpb88V3k3xVeMcOv3POiu8Lv2kY/u/
	7Z7iJi5iNADFSTDwS5++NtF4iNbGD/enLrrqeWe9pfqpZNLXQxHwwYDOTmlU4ZHfA9MRVpVMHLT
	maapbzMudaYZje3t0ou8EmP1dSde6h6fzehHvqSt6zxPmpAR1V3Nxo0R7lX0AQ7eJoHc0GSpkpT
	IOQixssDYCQdACIISrVclVRQpfAfIlAoue8XWPh
X-Received: by 2002:a05:7301:4201:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-3426fbbeb5dmr8469221eec.5.1790571086738;
        Sun, 27 Sep 2026 21:51:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:526d:2f94:503b:aada])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c166cfsm22840869eec.28.2026.09.27.21.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:51:26 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:51:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "R. Larocque" <rlarocque@disroot.org>
Cc: linux-input@vger.kernel.org, salmundani@gmail.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - limit T440p InterTouch quirk to
 LEN0036
Message-ID: <arnyJnqIpwcwX2nT@google.com>
References: <20260927005810.85971-1-rlarocque@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260927005810.85971-1-rlarocque@disroot.org>

On Sat, Sep 26, 2026 at 08:58:10PM -0400, R. Larocque wrote:
> From: "Raphaël Larocque" <rlarocque@disroot.org>
> 
> The ThinkPad L440 also uses board id 2722, but does not have the SMBus
> initialization problem seen on the T440p. On the L440, the SMBus
> companion becomes available shortly after psmouse probes, allowing the
> touchpad to use SMBus/RMI4 normally.
> 
> The T440p's quirk is currently applied to all Synaptics touchpads with
> board id 2722, unnecessarily disabling SMBus InterTouch on the L440,
> as reported by Daniel Salmun.
> 
> Restrict the quirk to PNP ID LEN0036, which identifies the T440p, so
> that other devices sharing board id 2722 retain their normal
> SMBus/RMI4 operation.
> 
> Reported-by: Daniel Salmun <salmundani@gmail.com>
> Link: https://lore.kernel.org/all/20260925230039.236786-1-salmundani@gmail.com/
> Fixes: 26eb3d92c7a4 ("Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Raphaël Larocque <rlarocque@disroot.org>

Swapped the condition (since integer check is cheaper) and applied,
thank you.

-- 
Dmitry
