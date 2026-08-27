Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A9C38B127
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850581; cv=none; b=r0KQXebYm0sZC3M1pmv4ZkH1ua9i48Brw88GfIGFN1Q2L9AsdYL7yKpfDLaC+z+k2q6hWfEy8UHBMuBa7lJr1Do6pafGnVAZJZfrAsx+CNZgTjfRP+m5CnHFBcOK1EF3WW1nVcuN3ZxxLvesGkZ9e0GRg+Q6aloHw5YdBu4mkUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850581; c=relaxed/simple;
	bh=ab2ZLhXK2ZtzK1pxldMxYVte6a8fivRQLA8LoNYMtiw=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZEBORLu5jH1AttZREOona8xqjS5BJyXMIs5GhiX1FaAI260rREvg2KR7VI7dp5HGCxB8Djj9P4AFuS1HHb3Jebkodyx4w+MlE4zBSvkBkNE0p0L227Yhw9z9Vo3BqhptnTOgIkASHi3AfTd+unj045AZyFYKvd5eW0Z9ug8JkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dVEQDR67; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lLoqgyU3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dVEQDR67";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lLoqgyU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787850578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hKHPpv93xvylGFEF20RemjGdz/fmhRpr/jVoce2dxu4=;
	b=dVEQDR67FS0lnL8jFEDPw6vrTUV/RK7Phd6LptBjyMUMKcSRQe80FcFPO+iI9Vau3rf3/g
	jjDMcFP0olvWXfYPHTNrvONExgo+2SE7pzfKoS+j1vjmLDWhOfZk98VxKbs8VC+6+ewF02
	BgoOQ4Gp6UKl5mzcmGx0Ly6aVAMp5t8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-GQum81IqPHud0yv6uZQWaA-1; Thu, 27 Aug 2026 13:09:35 -0400
X-MC-Unique: GQum81IqPHud0yv6uZQWaA-1
X-Mimecast-MFC-AGG-ID: GQum81IqPHud0yv6uZQWaA_1787850574
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f39a46efd9so12873476d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787850574; x=1788455374; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:cc:to
         :subject:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKHPpv93xvylGFEF20RemjGdz/fmhRpr/jVoce2dxu4=;
        b=lLoqgyU3DiepQ9wh17LkpmfvhoE5xPGhBVX2kG3Ma1aUJLNbMU20wnV3VxNhGOqmoY
         KXpL7qyLUf7/Cq3+Plrb0ADJCOiJm34L+wuOSpsKXAJbLedgLIF9CojadDl82uHrpyRM
         P2jTXsOB/D6DJMUvGWg7lOkp+3t+4D7N0D9Ml6z+ykdrZruxCVE0lh/xwrcm5ZsOSu0R
         3sJs+PMKoXepRv9CdtUAYDrTSMX0WS7FLWxGSnbj5Iscd9EsyOHiCR1gQ88EpYQGFLt3
         cCHdbCn3a1Pn+kUdJp86xDhQiWGZBToGvWjaDQ0CwRiZ2WxRLsG+og0EvhHlnMmSPVjJ
         RYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850574; x=1788455374;
        h=content-type:mime-version:references:in-reply-to:message-id:cc:to
         :subject:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKHPpv93xvylGFEF20RemjGdz/fmhRpr/jVoce2dxu4=;
        b=Hxuw1EsNfZ3w0h0KePGSob2P6es8WR0qzMbVebnVhkL62k6AwoTSRG1cqqKcb/7tsQ
         rUkbfpGTeyayd+OaRZb5TY+y57oOysXhoHen7wVf4y7+ASXXBHu53njZA+wG6wWpEzen
         Qy8f0EXCDUU1mSZLVAgiEvgBCkqHHZAA0W3INOAIvCO4x/VLhsIDj/werXOVq2hUHLO0
         uE3NK3XOyHopWQyeylorjYQZzmsJ+/E8aPHp8WB/cACvE4RiFU9+Rt6U6sAkpCkQlSJW
         vmboRAoo/Nx1jA0IQmwL9jaHzG1L4bIAC/JYZCyuyEMFvFy8Z0bZLGatzYpW7jxL0hUG
         LvEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYOtMM4mwIfocVheH63Io8vofRytTjgc4COrKtWPRBaI6GxS8mUzuWTuaidOB9j9N5GdXICBR/cQ+6lew=@vger.kernel.org
X-Gm-Message-State: AFuF++l37S6F784SNb/4Ii6snOvnPZpd25CNMPpUwKlpzZ0baOay2XAo
	OTsEvVLNnY4uz6L+xP52iLt94WaFN0DHuBDkfZAfmmWzpBhAcfKDRhNcm38+MkR6s1H5vM9NCtV
	l7AFtDhKfcT+Su5iE9dT3MyYaMsPDZo30DPD1+ndJxNFOXMMq4iOrakJmUa5xvDoKOymSuoeU9Q
	==
X-Gm-Gg: AR+sD13xfjJhZ0m/RlUNNg7vV1dwVvTgHsj7Dps5pBAKq7soj5GLAMTMgyUloGHKD4r
	mo2ylFX7pRc0JyXQU1HwlKXN5Wz1AoB1o0psuLFI0i8y5yONer0K4zlyAETmCBTpYK5yEZZ51iv
	irzAwN4rylfVkNtljhaySDH/cU3xk620uW/XsZEynTNwc19HjH2mIBUh6MNO6OfJ9v5KZnmh1Pw
	eRJmM1ZZbTRHURB4S5FRYtMJvd98dVCqGUsAjX8cS99nOBbpU6JI1mwk0/v3/Re8VpLZE6eWcmn
	nYvmE2NVmdN2Bf5nuXHM0smUL8cF+TnH4riywtcv2VILh5q6LWnizpAJU2C41t6PtXWP7cPfElt
	nIvy5SyjFOMstejGaZSY8qowZAm9CGDSdk92Ax2nJhOkv9ystSgR9GF4WxRQcbLrLLTU=
X-Received: by 2002:a05:6214:3bc5:b0:8ee:756a:bc32 with SMTP id 6a1803df08f44-90ce0ede144mr8863196d6.15.1787850574223;
        Thu, 27 Aug 2026 10:09:34 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc5:b0:8ee:756a:bc32 with SMTP id 6a1803df08f44-90ce0ede144mr8861956d6.15.1787850573595;
        Thu, 27 Aug 2026 10:09:33 -0700 (PDT)
Received: from [192.168.1.59] (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd7028a16sm21380456d6.13.2026.08.27.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:09:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:09:25 -0600
From: chaithco@redhat.com
Subject: Re: [PATCH] Differentiate scenarios when watchdog is closed
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Message-Id: <QBUFKT.6XP2A9BR6LRO3@redhat.com>
In-Reply-To: <2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
References: <20260824205051.4117285-2-chaithco@redhat.com>
	<2bd566ca-2696-46d3-aeec-57db66fa1902@roeck-us.net>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed



On Thu, Aug 27 2026 at 09:01:47 AM -07:00:00, Guenter Roeck 
<linux@roeck-us.net> wrote:
> Presently
> [...]
> Also, the subject should start with the subsystem name ("watchdog:")
> [...]
> deliberately

Thank you for catching these! Please accept my apologies. I can fix 
those up in the next submission.

> [...] Also, while technically userspace may close the
> watchdog deliberately while it is running, that is not what happens
> on a regular basis.

This is actually what initiated a bug report at 
https://bugzilla.redhat.com/show_bug.cgi?id=1991285 it turns out 
systemd explicitly does this to help ensure a system shutting down 
actually eventually goes down even if the shutdown process hits some 
snags. It does this on every shutdown. Given the prevalence of systemd, 
this is a regular occurrence. The end result is that, when using iTCO, 
it shows an error on every shutdown when systemd is in use as init.

> If you want to make a change, I would suggest to add an error message
> into watchdog_stop() to report an error if the stop callback returns
> an error. That would distinguish 2/3 without making functional 
> changes.

Thank you! So something like this?

        if (wdd->ops->stop) {
                clear_bit(WDOG_HW_RUNNING, &wdd->status);
                err = wdd->ops->stop(wdd);
+               if (err < 0)
+                       pr_info("watchdog%d: closed while still 
enabled!\n");
                trace_watchdog_stop(wdd, err);
        } else {
                set_bit(WDOG_HW_RUNNING, &wdd->status);


While responding to this, an additional thought occurred to me; given 
the primary reason a user would see this is because systemd is shutting 
down a system, it may be more worth while to have systemd log something 
about closing the watchdog without disarming it to at least explain a 
pr_crit kernel log line. Otherwise, it just looks like "something bad 
happened" with watchdog. I am additionally unsure of what would be best 
to go in watchdog_stop that helps differentiate intentional closing of 
the watchdog without disabling vs malicious/accidental closing. The 
intent would lie within the entity closing the watchdog; "closed while 
still enabled!" still seems like "something bad happened" with info on 
if it was intentional or not.

Thank you!
- Charles


