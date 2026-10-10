Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D737F30E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596454; cv=pass; b=FV//O2Q84iaXgcrdAL4nnuaH0xWKXUyqiZx9wpgazcgmIEPN3sbPSjEeiItDlq6TR+KAfmW0EB07tl6VcYRY0WKvxBgfL6XYtV+iBatomCDxCaTjeamxT600tHHfcnW/weZ1UAhEDbOQ/XyB1nyfaDKuYR5mnkjKeUoIDtUvBgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596454; c=relaxed/simple;
	bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6kBUuP0mc8J/ak6Rxd/DGoHpjA2uIGk88HAT7PjBhZT4lQuR257kbTe9tuWcETkljXmG4fb4CFPfHejSw5YdJGF9HWvfbyp6YxU2OHwVvG03pgZn8cH6abN0ctu3LlsdmIaUYTSKLQQGHwSi+xU5cTSAVdIVx0yITZYJnN5eSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/sOccez; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/sOccez"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso185479e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596451; cv=none;
        d=google.com; s=arc-20260327;
        b=WNouViHt/wC2dpc3I6PoAY3DeCotvkzGDvUwX8xxldXAZiS0mlNJlVkqx57pdd3YM5
         YNM4bRrfj3rHPEqI8SX+gXslMMT8XoCcQIR6gCBJpR8d0eV8AGkyETH90lCJfaN4gg8d
         sI3SdTuJtiN+fYRE74XUDMzfBmOh4Fbxs/J8lNduIsMValyE5WBA7RNrPIqIa5qdhnUL
         UNHrmsNBHO9WW8j9a8CHObIHj2nvaF3DnJEl4MRWp6X7H/Ye6vUCGp9369Ggo0GWM9nh
         wuZUSNA47d6SAyr5J8Nf4VikaxNTPvdUGf9k44YCNkh9C3bQ8uGyrtZnY1W0jv81s7cq
         J9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        fh=kX4SqFDDLYNJCCJepb5n1yKaCur15wdL7DmTsW3RbnI=;
        b=URlAK70JeWvgoJx2HahEE8lVeCHLWnbztMxlbKcoq+XpZLLPdWw0gSDPklWg2sEysu
         1kStt7WYyRDDkIq0K9lSe4xsJJ/eXHRkVKOQprBJ0LUFTFQ7/8zG7r+Wh7p084yyDQQm
         FLVlBbbK1ct6IE238i1CAf0YayxD3BD4Qn9fw2S1SIMAvz0av+F91mLYr4CiZo+wG76R
         7W9PSuanwTLJttcdjdNTtYuP5AaXhgTGQkLCj/I9rQljXWlX3eiagVzky1v0DYMxGrhe
         bvyNOH1FsR4dAXmh0wKfpI90mUbCKLaownRWoNjJ70eiUKSPlK+nocRYPabZo316Qmop
         uoKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596451; x=1792201251; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        b=F/sOccezD/1MzYMPvqWGchmgKpcKF0CBWVKeoS7C/BdY1ok/4R4vg79+DqOajbte2m
         kVxNyA1BwC19UlY+MVaRXLMoCiyrc0psRVzE1x+appXOb47iioAvsayTPPE+wJD7qSaQ
         fnLQsf3vnfmMpVbwNSUGHHVyZV4dG+DopwNuSgsHW4kDumwA6Y4v0sSwcwFmzluMNNEc
         PCUTCv49stLExYi72RzG1Rvii9Lau5lXcPDtw/A8mFHl9zNOCYh1xzJWWdqjSJ51+u1q
         VnMko7Ybr9nZtnXOkn12xkDsj1dUmUCrnJqoMBGen8TohtbGJj5p9IgWbEjyhHfs22q+
         7rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596451; x=1792201251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P9I9jEru7z33DVV4H8bL0xlg/En68kLgOq9/vrn0XsQ=;
        b=nNTgNtHu/FndnLgPIPW4aeFLefIIxeCKae3+stQpe577LjjePyJpIZUotpEfuTQRvE
         YHLZW1Q4EzxvTaxKpUfC9PNCwAXKtNPnyZRX4KfV68JEio0Bcsm5DrT1Xu64FBn6ehQg
         vcvCCvkV6WCou20ArKfb11VpRdG2t7pGuUFviaH8q5PrZTNlX6r7XCiWRwzqLnkohyKM
         M0IMkyGEnF12IuGAtA8IxQAnc21u7Kzg2SqsfTwKcH0Xvp9h8vQlTpEZsEwzYxjmvwZF
         vsGtJClK+50livLDSn0oio+JKKIoKRdp5HRUuMSSr6CxdVZgOeHz2WZYz3fLTNlLARuD
         nw5A==
X-Forwarded-Encrypted: i=1; AKwUvBwjdFzrn5ufS9LNZ0fXY8CGbiLbmchhtSdyPqGjXsP+wFVCq5u/HEdZp+FG5iJNIfwvcx7YWDxTrrDUQw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM57QArAyymVAEnnDmCgi7nP2rnYZ57S40Z6DhqCRzkOAw/qVW
	Jfb4xOUs5KggB89vbT285FxLcFlIZfEMnYaoA2nXWRo77cGPnfXetBy1KNbFua20JSfGu0Qov43
	kxp2sXBCHu6EJOHjicQJ/KnxH+6++WfY=
X-Gm-Gg: AYBFou0s8Lop0IfD9GUDRUoN7N52sxAeJKk24494pijz/xI5d70IyYhBTyf0/PAthBm
	C9udSxTMUjeRtO68HjcGm/ElnEeACo+uPdFtZ0ce6VKkjkeY3a4EyRnet6edm1mR7UoCYqF17G6
	oIw4cA2Jc5Dg+P7mdT3+nSLtkuaLGG4GJRhnUVDPUMwfL0/NrLH7tzYdyUptOMShUEyvKvQ1IlL
	W+pxtq86azI1ABk/QWXYOKex4ySdYNHZ0HpS3YYYsMCpOVkf1GcKTKo0PA2PsNhgg8D4SXORhEA
	MQGreKz1TXhnvUjkhGyR5UG2TyHNc4VJWiXOK7o4ifobvUeIPwdgxwxWnhKrfbCQcFxGjWSKI8l
	NV87s5zRXuQUHFdHAfUApl7FIEPIwjr7cBSv/EtSwrpOUwxeaK0VGjkgfvhwHI0wX+4NTzyA=
X-Received: by 2002:a05:6512:2399:b0:5b8:f59c:dba3 with SMTP id
 2adb3069b0e04-5bcde8bc89dmr1125385e87.35.1791596450694; Fri, 09 Oct 2026
 18:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-6-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-6-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:40:37 -0400
X-Gm-Features: AclHuK96QFXn59Dytod4ItuEQL7Xrad0iEBKrBEPVvoPQYB56CGwDVZXR7SW2Fc
Message-ID: <CAEdQ38EGE3sq07jLUv4C0q2-wbc3xAFj4JOkVWiU3G0FgUW-Kw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] alpha: decode Clipper environmental events and
 retain Tsunami console logs
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> +static const char * const CLIPPER_EnvQW5DOOR[] = {
> + "",
> + "Set = System CPU door is open",
> + "Set = System Fan door is open",
> + "Set = System PCI door is open",

The "Set = " looks like it came along from the table in the manual.
"System CPU door is open" reads better in a log.

> + if (!(status & MCHK_DISPOSITION_REPORT))
> + return MCHK_DISPOSITION_DISMISS;

An event with no fault bit set is dropped, so a recovery (door closed,
supply back) is silent unless some other fault bit is still set. If I
read your cover letter right, the "enabled again" report in the PSU test
was only printed because SMIR bit 0 stayed set. Is that intended? I
think I would want to see the recovery.

> +void __init
> +tsunami_init_pci(void)
> +{
> + size_t i;
> +
> + for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
> + cdl_register_subpacket_annotation(&el_tsunami_annotations[i]);
> + cdl_register_subpacket_handler(&tsunami_subpacket_handler);
> + ev6_register_error_handlers();
> + cdl_check_console_data_log();
> + common_init_pci();
> +}

Two things here.

cdl_check_console_data_log() follows console_data_log_pa from the HWRPB
on every Tsunami board now, and this has run on an ES40 only. It is fine
on QEMU's clipper, which I booted, but there the log is empty. I do not
know what older DS10, DS20 or XP1000 firmware leaves in that field, and
a bad pointer would mean a crash during boot. Can anyone on the list try
it on one of those?

It is also odd to have the PCI init hook in the error file. Titan has
titan_register_error_handlers() in err_titan.c and leaves the init_pci
hook in sys_titan.c, which calls cdl_check_console_data_log() itself.
The same split would work here.

The table sizes all match their masks, and the subpacket length checks
look right to me.
