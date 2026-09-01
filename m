Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954D469857
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301030; cv=pass; b=eyH9in9bg1ZMuKJAM+nA7LrE6TkYQrVsbYlLD/vBfeZax1yon+wDnwidwVOyVjLvYDrteyAwO4geAwlBNB+w0eEtBa57plJiYkzYmTTlnmPilMANzCVLQRfUzSPQG5DqBvwI9oC4rYbuxEyEiDb0as4SmzTuSq9mjjChpfDdNEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301030; c=relaxed/simple;
	bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWmX4hv61fXLTQLvQfQ3uZVhP4gfgcaiyrzO5tNcPLxC2RnK0icUxVlErKjb01rQ1AVWTthazqEhUaQJHYTx5eiyt/o9KE1kfNMbIKXFFtKLdwq+RWXGX+CBczb+HdOVGWZiYE5Mh53b6WMYANlWX8szBQMSsNX7Rq2wnx3cjPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUgD14GK; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUgD14GK"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b145a9623fso178580eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301028; cv=none;
        d=google.com; s=arc-20260327;
        b=KbiOwDt238nVo8njmMbHGkFcS/mR45H/6+mmg7bMGEKxiS6WJw3V6WcfeVaL6gE7+J
         dCP52sNq3VX6HxwF0LYWbI7DfcroEaygWE1hH74fN2tkxFuQ4YEW46dusmlqYxMv5MX2
         X42Sz5s5DFaqrAXzunAnSbrYOQ9ZAR46Upvg3bhY/ypBEGn15Ek0GPm0PQbqDMHK8kI4
         YVsdP0uKsZE84BGEG6+pQww35ZdH6k8qEy/wSYkf56kGNCHImCg92GYFk7h/NVnzlklL
         I+H+RiTXHrwpKblOdxthhVl3UsF4DmoQzSaTEXVmn4b3+Qg7hMb2Y/xUnfc9aV0Xy0gD
         rQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        fh=SJdkpyIaDyZt1eHuGzd1xjxp5l+pz2gymoKsRGesaqw=;
        b=DkIyjRm+QHDfxUTJT3X48CbqWfMll7IzEyyWlItcCr7Xgz3O1wSJkcNrENmg2bTuC1
         PnLizsUmMtXUbNDaAKIZN3HvMIRvMyOCMkzcFAkjn4H24eFdiK0LQTGLXez6mJsze1IT
         GmPfnyBdL/4Q9l2w+TcTTUUwuuAoThynWNOqxYFcZy+6QzQ3FlJHPovUfxA1tWfFwan+
         8mhMD9dtM7+dq6KppkEAsKy+MKWCuLCgMiya2+JlkMvKnYovd1vxYQB9kfXTHX5WyQ0/
         9DazKcvnxXsNUKm+nugvZkeVMlB7eWFE6KhY5yPhC4kCK1ignK7IMwSy5NhTV2y2RT+3
         cPcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301028; x=1788905828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=qUgD14GKtLsjimdLEvXiyKMG8CZoDQhYRbZYxSVLxSjpNakmhC2TZQV0Ksq8mgEFHs
         mYFSFOVOI2VfEyhZxTetrqZ94n0akBbIHawKPEmHd0vfMUlcDwUs0NJLQXbcnZMHSGyr
         RiKjgr9utfvSG3lyY7WGVH0GtHTtpKNAnXWXLljikIn41BrnhClY4Tx/Ha5RUgWQiOIS
         SWrA5NGmvOtlcp/k9v7mpRtSTKP2Cmw+VR3u1nGfkoZqHUm37YIgJKJswCR1GROsdFMQ
         nvKPdgf8JvtPaFqv9aB0T8De289TiwxUnEd/YWcQrMhH794yqGq8YJcfoadtVJZq6vsn
         88lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301028; x=1788905828;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=n7Y59gNnziywVmDqUDYWkosTLg3sSNEBhKRRmV0P7wkhitcZNL3CRGarh5b56575aC
         RwzNi0i5vLKioPE3iXriz1qyCU63LKW+lHqoyECkhsYa/ADidUviSwvYdhuzBecaA3nL
         GqKAbzIAj7IzdoR4aP92E8VpiggbjHOuuKaVOpV8ur3N+iaD1fLEwT0wz4nlHxfVpZ92
         w6Q7OAqJOeBO8zCuhx6wgddA5OJLDijL/E0TJQwqKDBCWqdzkWeZ1u7G1wXTtNOwMDRs
         ECqm2VGVOtjqoZYRQKhQUSxkkWsnEa8qUn38sxe8lyo1tFbbXuzaAQYis+VmfAGkYuFV
         enqg==
X-Forwarded-Encrypted: i=1; AHgh+RpqgIjB98jeIQfWZGq2tsY6YP+xkzYHsk0UAKJABvNPYNycwrkhh5c97JkOZ+uOtKl1YPP3XYMYU9+KI7A=@vger.kernel.org
X-Gm-Message-State: AFuF++kXsHfaI3tAvdYKF3wdzmtg5JraB28NHpW/9A/AZmsOfoHbyMDq
	9lEpvYXZnc5q2Ppu3P/DRrkX815wg7OFJLTAKJR0r/SoMI1lxkBwueFCKFvOfk7ueSU5JcDCOhE
	2B66OFjaemTgOrDYgILSxPEV9gP0yRsU=
X-Gm-Gg: AR+sD11kZwu+3ZuZoLO19Y/hf23ryBQFJU4tkjkFQW410x3LXqhQCyqweS3yYcoceYj
	c4EhBpn/sueS+jpJLAEBC7U+/DERc0jhUPL2KcXe6Hwzi5kFshxNctvQSl7o2cZORlcxaDAPvO3
	RORIT0ceB/EPK8HtFO3y0Xr/enx93p8wcf8RBvRkZ91Kw8PxBcukaUjuNhy9rL+AMVbCJ3/nO5G
	8KUTUFSRiekOPaeN7QLNl8B7K4c9tTZjfQoSZLqOf2u9O6RQtvWHjIimiFx5+pSkA23Fdox0hde
	hOQGumWe2PCgHaKw95bk2BSkGdVJa2aayCjJ+02YTToJCZUcPLyJRKOx74ewDtcurdllE75Us63
	chp1NPTxaufZ4MLvdftiWh2hr4VjZH1zuAQ==
X-Received: by 2002:a05:6820:81f:b0:6b1:c841:f8e1 with SMTP id
 006d021491bc7-6b47f821075mr33519eaf.14.1788301027765; Tue, 01 Sep 2026
 15:17:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:17:07 -0700
X-Gm-Features: AcwNN1WBWcn3HnRXXLiiP_T9xHyJKMVOYheIUX-IeYxc7McY8SDCUBfJPf_I32s
Message-ID: <CAO7O_xhD+i6X3YSOPHB9NQUBpfmvg-2JAVojkzVO7Zstnu8cHA@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

The review was posted at:
https://lore.kernel.org/linux-media/apa0cOz4aXZrtHmC@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
