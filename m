Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140CF51596E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787026; cv=pass; b=sop4V7wTu6kU905aknLTjt1o/ueqY5gd4rqW/V5S0uheavqVqcd9mMAGhWWXgGIhEsTQ2vcTmp0r2fDDfxPkir0kfk25hCpKaANJZkKd4xZz8BiVnIovqOsiNLZy/mLkOqteSVkjVjKu7obqiCNfeaH5wKv21r28PiikKvvJJNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787026; c=relaxed/simple;
	bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN8TbPQEhh4l2+itmEGYDffw4bh5QxvDodErfKuLWj/FcAqT0bayZS4lCQ045C5cPpvweglWb/weXt2nSo7WiM9gPTVSOQYsR5RARGhdOGk6zVbToq6/Ji7LEIvCT8FQQSbIqY6o0BFFv1wZkpcCOtNPz0s697tHwEsZsdCycp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeTagFjI; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeTagFjI"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso3067406b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787024; cv=none;
        d=google.com; s=arc-20260327;
        b=hn2ATdFq/+FsazjFE8bJG70BsVUc5D3sCB0vtFp5SB5UwIc5dEld9MjEZ8Nm4Dk0g0
         2BFlmjR6bXml/w90R7FP4+YF/1I+nkM0T3+LuAtaRlsDWBDwQgOZSkvO4vXTT8qN28IK
         16tTrFt/TbumJcOGUTE5CIo5rt/Coppqa9lUyycPIR2ZnKQ9u70f3PNu92KP6UcdPgPK
         axM0wEYns2lJu/5dY5WPK6Ti83bwnI+59ZfhAQK/MbrHTHnIFG1q/tKypgXbMsV3ObkC
         8Vr9f5DpF5qnTwEMdPE/0m/o7sFQA/tt7+6ShWErsgK2ALhQAkhGeKU3tbq7bMVNofcg
         n1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        fh=ZtaQ7DautMqzIrVsb8NZxa0aQfXApM2U0L0BvLh37X4=;
        b=r7OPFNl6feJIdTHbZgQpHRPlt1GbBFRmnNThIW7xCltOzj7uHBKvgTedaMXmUae2sS
         3WHjysUG9PWOK2RnZMDq0hsIHTCVPeKA1bBIftteu0sHztcqB0ocJrggTgiASjBRq5eF
         0MV3fIVUmX2LGtNSkIqY+7atgtZtbz4+7hg6ZgqLF0cReMgOHdhb1GmTjGyExv9l9Rhj
         ehqpsd8pECZi5NDA/0Zip+lLwMxM0wukEWljLYErE6qLsMz0r3hLlXXQ7Ywq2qFFu+d9
         pmwm9XefjR1lxlr1eYqnNrSP7wyzpbrWgvGpN9B724QzX53B/7apgBMwQKkNBsyTrtsf
         CgSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787024; x=1791391824; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        b=eeTagFjIJFzqQk3+seTMYlL7TPZ7zMXEPZbUczBT7D6Kcqw1cNKK6m3dVA+2YTS0Xy
         LG5K4PlwKTc3oIo1g2y6m28zS/i49EhQnSxLRnkdJX8bEf9yr2XM2hemOFTd8Tb7EqRc
         Zw+l2emHXbty+wktfzAlx8RxYDSuE8Sy5xgdvYB0NN1smAMOUd3iLn9PyolM8VVIzxc5
         4cY5TPxn4lzcJw2EAVupluNwmPq/Vo4ez8q3yKGGKXHJpbSwKL1d4NRoLV3tV9S3QxzE
         6TW3IOSNZS5xwRgCi4tL6NhS2TzZXHkjSaFLwfuwQML5LarpzW4RhoVpp8GJT6VleiVt
         pCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787024; x=1791391824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        b=wLpsBPT311nidvdgtLHXx+cDpcUmZ4uMntbYEbxpzI7iCDSS4ILA+4wp1+49Xh+UVr
         XUD4aO8VFU9n/gtaDx9Ctcd2hm5cw54g/160wb8ZTZOBANosjr36IgEXP9EsbSLFJJZn
         FokbNyKaB412GMuuF3L+GY+Hod+90lB1ZFYDdKvUf99WccHXVVTMVjVS9j8U2HF9a78y
         xGCCBHQdwFWCeHMixrkTHLE2+/2Y491FcpjC/cev/zuQxmGq4zFHNFjyaO7s9FT36GRj
         qEj/pJoQOidgE/cYOXMhMsjwV6KuSvpNQb7MXvqEYYxByE13yG5QrIBzb5r17gAKIoTS
         q13w==
X-Forwarded-Encrypted: i=1; AKwUvBy/PGpufBntnASg4OCfVf/0DG4QM6fBi9jYzKrKsWD72oJq7Qzb4VvvZGBbmdXoFmG+iSPzh6+ZfyKoc7k=@vger.kernel.org
X-Gm-Message-State: AFuF++l0YKU6rEkdZ9Fl53Eq3dWLhfNqIXO2k+PgcDtkT6nlDoHz06af
	1uTIeRzD2/zSPQ9jkBgbyIFDkIaO3Ms1VUiA/pAbw0bQ/QsHEUNTSnn1skcnkHJpyt767C0UzCn
	ie/uzugMPSqBpiUFaEHcVPva+7E8+8cg=
X-Gm-Gg: AYBFou1+6Dj4KZq5+Kk/kJRdls8Du0buv250YY75b3RFvurUy5JpFkUJhTO4/8qWmRx
	MX33VIGEv8Q0RRpgr9qKr4CGxYpApTEO7WmunBvcfBMtBkFoDdJ9wsjxQ1ManTZknQXL4mG4u2l
	5x4bs26PPHRUrG7gWepV0Co/KHfwU4HcBr9aorjN12rSf3C8uUQyQbKATWrclw/Ee/iJlS36WB3
	PlSRuQrJC6EpYfjWd2Of15E7nH3MAzE7Gxf9yn+Xoa06OLkgJA4tabh8R5YRlNz2OxMOl+NuRVc
	eg9ChK9V7rhG29yvhj/sq74R4kQepXh1J440CXDJV8cA6LU9zwdNnM/diYkFGbpJE1/oPUBVuFv
	QVNVsa2nInCLZrtHmrYBCPQ==
X-Received: by 2002:a05:6808:5089:b0:4ec:19e3:4072 with SMTP id
 5614622812f47-4f1b688c0afmr2518939b6e.18.1790787023868; Wed, 30 Sep 2026
 09:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801205311.386692-1-devnexen@gmail.com> <ar0r6Ej8JgH5Sj3c@zed>
In-Reply-To: <ar0r6Ej8JgH5Sj3c@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 30 Sep 2026 17:50:12 +0100
X-Gm-Features: AclHuK_54_qV2YHpovcqDJGpG6ks5k27JUE1UKomn9QRor3VmwsO1wi08DR76hQ
Message-ID: <CA+XhMqw3kwpuv=D3Wvco6kGq2crbKyK1ewgcZePhHUMPenuXmw@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Fix frame sequence numbers on dual-pipe hardware
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: dan.scally@ideasonboard.com, mchehab@kernel.org, nayden.kanchev@arm.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo

On ..., Jacopo Mondi wrote:
> I would rather handle this with per-ouput queue counters ?

Right, START(n+1) is processed before the DONE(n) bits when both are
pending.

A per-queue counter would not advance on underflow though, hiding the
dropped frame. Would latching the sequence in
mali_c55_set_next_buffer() work for you instead?

Cheers.
