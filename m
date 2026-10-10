Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD52BE7DC
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596660; cv=pass; b=GKGOEWA5qXy24FSqZR2cB4RFTwVGqCAqzyaoFRs1FJvgqXpm9MMIKyNfHRry/1CdJqBPenW2E3FY8PD9fH3udf3N35ghqb7GR3cI7bbY0ZEiG1LhFVnbhaYdODPUP81v2oqcOEoclKb1eZQMWgIcJ7PwmJ/M+wjyDhSSsL656AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596660; c=relaxed/simple;
	bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiupSMG8qBsw+0NZLlHBNGUuUzHGE3zXQGHxOdZPJxOynQFB7nIbz1YfYNCFo9tkOQjOxcvQdxCteV0HrOVKI5nIIEmbYqUUC21mnnN+6RUjLR5PHlKqoCICfNgxVU9rd/eE2CAbTpbUrrJQCJLAPKqIEYmri9pxWnXv9wsldWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZJj8Sip; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZJj8Sip"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbd8df6fdso155219e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596657; cv=none;
        d=google.com; s=arc-20260327;
        b=C4kSMNP2OMOqnWaKOqpx7OYHPGZnIIXWrtD/c064TOCCjpDvPNR+W33LWLxx15KleU
         vvgA4Fr89wj8qK/z1FXDdfS58dv2byhxC+FbmhEFxCRkttxEWMmnR7FDLlYCs58pcWXB
         qrEKMrLmIpc3t51cw+Tr07d4kG/HY7hEnUmQcNlLY2CqZwtSIMop+vKRWL6z9QY/PZqf
         6CLAsMsWtEMDkiTy9uhlz59sVHKoJiIs9sz5hSREvq3JcVhxZRmLr1KufZVfFyEY+ZRR
         REh/LaTHsfgHLdBPYETVWJ5KKfy2RiuOwBoyp6CtoPrBW4zELDPT0Pdb7ipANKoMg0q7
         cRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        fh=4hpIuQeoBpuDlKv+kVlGNAvrEoWvmdtmeMugUhIX4oc=;
        b=YidzqvPplahPmGjyVSTvV/9Az7nxjIXCHsQOip4ex9ng/oEI4iGN+u9vFvC8VTAcXV
         r/zzL7KAwLO9TXkr3wRrd8Gkd2USILRtWs3FHNQrWxCn+mwTR64+u+3fYd8GjAxNeCe/
         91En8yqIU0UXNy0QGGtjShVqqguUyQbcIZfEOj5f3Yl9ojbm/1FNw3ExFynISooD7rvW
         fq2mVXQhEwy7ZokuAqtVD27D0JAnCefANbHzJsZ1CJQvB7rhjMAt2+gOxXaEFHitqFkM
         2giZqDvbfdPy2C+00wXWHhqP9pp/rOAPqlofpfOjHftiRmRIHZkO8bZfShtdyVNbPQUT
         xQfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596657; x=1792201457; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        b=jZJj8SipIH32RFYVrE8+5zxNiO4nUL3TzN8to81Zk+518X19iX9NYpTuBX02C10SEu
         B7BmwYqhO9Bb/pp4/wr5636mIHQ7pGyGCFHEG0wVN3sQlBYHPc2ExjrUj5Uh5vW123Sa
         wsbU6VFG/LYX7VF7K0gf95/OUJvOZ0X85/3dk1/sOG79pxZ2kUjU9ail1xMUxC1Sfdzb
         9bK2GgyAQ/e61yb3tflwno7tKrJGzWF28g9wUsIBM48PO7P+Hq1JS8PebVen0frk4FS/
         X9dHET50o2wk1B6qG8V3QtJn9Yy5hC9YAIV3RrSf/pKRMmHoplGI0wOGEmd7brxNr6vw
         vMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596657; x=1792201457;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PjXhq1bwf1IsoZVyd2lMtLh7MWQTYMfimRSXqhCMkbg=;
        b=mMD00FaBZwfTV6j6RdrO7JoUrUpW2/MyS7prcTJXVNM91q4xH9/uwDhQN1FiP0DxBL
         gUP0nQdBulBpcE2X9fKSZ/7Lvv3zDqf/CbqVj1P6Cs65WA5FLu51aj43EHjJEN1meQbe
         WE0p+TVKioY/n1mOUBERr2YkNwncpkbuzgAn7AsmBaT7bQhEwMBHjuzVYWu8T85T0ccQ
         8K3H/D3Md9+oMecvIQdT+x3m2u2NtgE5IU1rCWOk2aWdxgk3RhwvWhcNwSPolKuNgGxB
         Gs5SECcxGNMy+jaLuDleWk4RrsFPrywofHyNKZ7LtbRSrP3c+VdpTeIHnQJT4eGOEWQQ
         r/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6qloP2Q2Jvox657o3v7AeP6ZUnimwc1VMcIj2KEyXnZ9SfSp1FdQjqc2APkj1CnMQYd3N7wVAIvcwadw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUGUz6FwZ/QhSF6QWEeoznkbAkb4yflHSaznai43SKWQ4DkEiy
	sBdeHIVwYvVMVMcKvdjynxIe/2bZpXiA3DQ6eIUElfMZLZo0inRXOJjGOXH4MrelLEEoHACc1rY
	484zX2UKsaJKaKal1oyHWLbQhMGnhsLGizru2
X-Gm-Gg: AYBFou0fD391TDD8rJzJoCdWJPZYPjjxBDYFZ+jvUpUdw0uLSnLHJqae4bYANKGRMbt
	yyGaCY2H5tAxdyqEzypRvvgf3+ehHN6wkEPEVvELvwEd1tUsckbBBLnVSBMu0BgavPpuTrZX3fr
	eSgBCjwQ9GDev+DAwlcKJu4rDuBcutN81iKZTdasEKZ7LYZiHW0P2PWGoR1PQO40BWWnzYIO4hl
	rww0kXUVnahm+9VzphXMHQMZ2p+QD+U8KTjcymAMcSe5GCWQZ88NlwvTfxAUR0GRSJz6xlSnh4E
	8epF53SsamYiDm8/mtAyXsHeYOtdpsiShJcPzYPYyQqL9FQQw03RyaYbHL+5ZCXfO5qhm9IvtpP
	ooqC2GFBa+ac1x5ZuhwwI2ytlTL4kPkgFBeH4EAY412fWV9uhlDfGFj7uUnS5zDr0w25Razg=
X-Received: by 2002:a05:6512:4012:b0:5b8:d8ec:bee5 with SMTP id
 2adb3069b0e04-5bcde6c6fbbmr1252328e87.24.1791596656639; Fri, 09 Oct 2026
 18:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com> <20261009210449.971057-5-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:44:04 -0400
X-Gm-Features: AclHuK_zId0_yh9bj0LvR21b7Dyfnsf-U5B4cO_z-cljbb_gEYRCPqonHzDk6DU
Message-ID: <CAEdQ38EpOApGeo15BAppLF+rV4-qxXo2VUfeA8W0fx-o12x0BQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] alpha: invalidate the local context in flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:49PM +0200, Magnus Lindholm wrote:
> Add this before changing the
> current->active_mm test to current->mm: that change will also send lazy
> callers here, so their local invalidate must already be in place.

Thanks, this is the order I wanted. With only this patch applied a lazy
caller still does the old targeted tbi(), so no step is worse than the
one before it.
