Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6A3AE704
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025926; cv=pass; b=Ppj1bHH9LQBZJJCAHf8jvcAJHJepfIhejIiEJ+L+JkNHU3bImNGrtPGw4ls5v2GqMufZxOnh+gozTaNLoJsgiOO8BT4SqNnRvjLjeDIFPmdHQ4uDwylzY5hosMlEwdkmZcl+1sFoVNPEpsdPCQwx2WIs5r6tV+T+RXhzSLXivU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025926; c=relaxed/simple;
	bh=rLgxAjUxQiSdL6QzfFYoFCwEhfYuwxFVk8+D/cQg3Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHRe8RBxuljNFB3OBNHrIBlD8uwUUEFuKCAS21e+OID3j91l3RIIMLMy6n5QEv8qoCAbigTmvSuDgJMol0U0pH5GiO8eAGdzrTffjzEs1zIuUzazy9zyactI44m9Fli60fv0KCb/cSOsqmXOVCOu+ZnrDL8UuAH4tfKxAJ2NT0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+4vk1OE; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+4vk1OE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e4a341d177so2345205ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025924; cv=none;
        d=google.com; s=arc-20260327;
        b=SgIwE1wGuHNPb3qTZWZsGrHuGZw9bboBsoWUk4mP0cz2xUyiuCWLf3KJDIobZlq057
         l6KHsjFocE2Gbp8ZIxXKOypAN39phcqV3jKXraUF1MP9ybO+sU7XM6bcKDtme0+Dvtcl
         VEE/EGo5S/5WxwWo64NzjcTT1YKTZ20zSXAFFqr2EgPvH3zXTr0oy0/Ko2UMMLcGISlf
         Lobqn76XhXVZTsummhrO74BBj2t+xlqvjfAQcuoW/LgwYB46bsN3EbjPjvUyX6vuVp/s
         Q48gunaIgc+3Er8KTFuUgEzs7tH+DN++yH8my2WVXaD5U55uBO9Fe/n6sOSVRDNnArLF
         ewvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        fh=JNba+Wg7Zu9icl1JL4Cclwbo3qNRBudKafvGK2MiJIA=;
        b=NQp9NFN8PYV7ckCiplsfSxEEsdAX1PkdVHKUtmPIZOyDbWF2Dkjtojh0EjTmgzuDgQ
         2vaVm9JMkVwtSInBY8qeRSVxQLrHp5rPmEZUQ90gQ25X4JAWMeMSlPkXNPpO0thlHyzR
         6sojpxno/iSs0yNUFzjLAq/4k1+soZdQb1Aa1aocSfetSl00+dlrypHXpGXhSK/Khq6L
         DI5/yNULADjmv79PVVeW62VzgUCxDVgDo6XLyVTav0KvBeOVhZIxtB738Fxoxuo4GD9u
         5tLAY16MdE8MIZfinLZn1m6P4e1c1R5ZDkJrkMvwy8DrWaqMYSFAe8yW35yNgIsm2I2Z
         kbxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791025924; x=1791630724; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        b=F+4vk1OEuO9TVU08gykFc9++gSdfE7fGmjpGD+LsXNUdNzr50lJ9naeormHtDMm95E
         Ime8CafGVXmVfsiyACyTtEsV6uig/SaIzSRY0LHeHXk6+lWg/aPICn2iHWekbguQ7Rg0
         Ww0RHS7Fb8OcmDC2vg1EV1NbssItwd0NZKvkb493+aUZIfEqexbdkUQUkKV8+0vqw01l
         euaIxNYx9hhQYt/pcsgMc8UTOBX3XL87MN3WfmTsnc/cfIbnMNRMrSUqlUJvZec+SyhY
         skA2fQjII32ZLII+lSoc9mn7iBcu+Z5C39oXhTdI0/843do8i6xvHipAF0K3EPwBoCJv
         7+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025924; x=1791630724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZOkPI3tXRwTtIn8qocSrw0Y1LMVW42C4jrO7SmDiYa4=;
        b=Tf+/0avEg+HoriksVKcJIaO2QIXbjbatTSobOsjeYZEL9Tb3cqzXHxQXO9lFEeucfc
         uinncGpdzaj896hYyysS0uMBb7lNNWvnH1UbcXwh9Z3PkYYAAxfwpcZ7Ep0qPs0ZPYY6
         hDaFImRI/Tw0Jnp44M+v0AvKz73mzMu0XySCFhBP7VmBgtw9d6XlvqiBLmtxBqWTSPX3
         R2n2AKevOyIehalYNdz2RUtFakIkrGRS56zvnM025UL4+4Uwk3/9sSnOVjDfjmIz+Tzs
         jzw7EGC/Z7qQud+H9TGBy90CZgO1ffprj9GSpdGa3PTH8wGwc8pTa1wK1UyFvdF/tGLd
         uDIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZPZb+/AzuK8XBK7NyTb72+QFa+OHujmG4rkVkwsWR95UGReoTTqqLu+gko4wIeBCmIfoGRKOS7LG1CoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5kzcVGNqqNY3vbdw2pEYTnpAC7kiRcrvcGDgOxp6Ww9MwQxNB
	If8ErExd5kUP6VlzVM6VldHx8nuMKfygXpOUxwzEHgYaL0bZHkOPre/VSDt54gLZrSqSmCep0Gd
	efIdAVadjh/yh6oJUQSFsYQXGvDavTyDpNbfm
X-Gm-Gg: AYBFou0CH+Q1xZ/GcknJhyvx2lvUBZw37MRy68RYi1QG9vTZv5JpldQBGjrAmOTx3cu
	c3EwkO2Lwq6vkitFQMdtT/CT7HTtkc9bI2FCeXEaB1QcJOP8ZRuJPNsVjApxbpMfNpOqFa4yv2l
	gevEo0HaYks6TstaFMXXe78L3VNq6E/pAfnX26+DPOIP5q8jOym7b4tFxgImWSRaRq9R4Lwmq/F
	E+h4Yg+tir+/jRkIQJuo4GRNRRJVC7gvB0WLYXQN37vvPBPJF3pYPr9H20gcPsYv1adPnFwSDGJ
	P7IJhN4loOEnIO5XmOIOrKC2Hc0ozf64qKhGOVKJD9ZjS3Kf1Bo9nl8ayyRaCyIBVzKrjLwSRM5
	LM5RNxiD+QLt3+hrbIWKJH1tIiqRu9tlpn45ljTSg79heqg4LtAbFY8VS8wqwFjhLc5sViOAp+m
	/XkKHd0rKla3iw+YE9WFdcwWztPQ==
X-Received: by 2002:a17:903:2406:b0:2d6:ff5f:eeda with SMTP id
 d9443c01a7336-2e4ea0db41amr21785615ad.6.1791025923705; Sat, 03 Oct 2026
 04:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811041934.7609-1-phucduc.bui@gmail.com> <ar_fLAeFU4rmrwiH@willie-the-truck>
 <CAABR9nGqwTGcrr6bKsV5+0GYwkQoP0s_Tu6aTJrhJJW_ZRqFYg@mail.gmail.com> <asCyI2_CNSoDJy1w@willie-the-truck>
In-Reply-To: <asCyI2_CNSoDJy1w@willie-the-truck>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 3 Oct 2026 18:11:52 +0700
X-Gm-Features: AclHuK9Zi1mA9PZ0oSISuDkDrpCS_y9Tgcj6SbSA32DMxp-Ws9T5eeG0iizhVxU
Message-ID: <CAABR9nH3pkFB-htyrD-Z+iBBcYoVX4Z-hFa_binWCXg9_cHU6A@mail.gmail.com>
Subject: Re: [PATCH] perf/arm-smmuv3: Propagate errors from optional IRQ lookup
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

> > > Not sure about this. If it's optional, why should we bail the probe if
> > > we don't manage to get an irq? Surely it's better to continue without
> > > the interrupt in that case?
> > >
> >
> > platform_get_irq_optional() returns -ENXIO when no IRQ is available.
> > Other negative return values indicate errors, including -EPROBE_DEFER.
> > In the case of -EPROBE_DEFER, we should propagate the error so that
> > the probe can be retried later.
>
> Thanks, The -EPROBE_DEFER case seems more compelling, so perhaps we should
> check for the expliitly (because it won't fail the probe altogether)?
>

The idea of the _optional getters is that only the "not present" case
is turned into a special value (-ENXIO here, NULL for
devm_clk_get_optional()), while real errors are still reported to the
caller.

Besides -EPROBE_DEFER, platform_get_irq_optional() can return other
negative error values depending on how the IRQ is obtained. These
indicate an actual error rather than the IRQ simply being absent.
Ignoring them would leave the device running without its interrupt
and no indication of what went wrong.

So I'd rather keep:

-----------------------------------------------------
irq = platform_get_irq_optional(pdev, 0);
if (irq < 0 && irq != -ENXIO)
        return irq;
-----------------------------------------------------

and continue without the IRQ only for -ENXIO. This is also the usual
pattern for platform_get_irq_optional() users.

Best regards,
Phuc
