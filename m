Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC5408629
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798365; cv=none; b=YtHEmuxvEIAzNDYcqRXWyMWyjrxJ5nPqr8uhpFfYlXsLgbXj8AXta3BhuBs5iNIDF7nvUc7Q+g9ut/E28juoniWLr67JOSgTVKXNmNe2iPGzGg6F9Kws1ja0Lht6YuEuOmcc+6eduEslnJHd5PouxBzeoajDamEjXBtJGiU1UxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798365; c=relaxed/simple;
	bh=IxDoNCli60KtOg3+odC/CQMJTv6w8XvqkxAtEahBsgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN6HdbCUXELNBbPBkFkqFt5KqpRQBrApB8FllJ0WND9Y2tN0ob723ZpV34gxIuL8ZLbaIHmdMENOLW9eXs2BRRFbdZMmTthhhIP0kcKcdEIptyEqcLXXv5OK6DbsN84+KGD4sEgUgfCIjDx79kh2HYCI+u3H5TdZhuZQU0khWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkZ84HK0; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkZ84HK0"
Received: by mail-vs2-f36.google.com with SMTP id 71dfb90a1353d-5d47358f856so736964e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790798363; x=1791403163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J5spSizosrOmpK8SzSSYeLKeSXZf2rKWRXHBMWYBveo=;
        b=dkZ84HK0bri1q2vaczZMGxz7cb5I4HK12p1QwpM3cTJb9DUO6YpY68MKcnwQZkoUp8
         GQXcq/QzArVdEkRcueS29tzD67xZozNh4wZq3ZcabrSX8OOM+fbKTNZXvQLSQN0UuiM7
         Ev1Q6BxSjcnrNqM/Iyruaklwz6yzknC5X3E7mAq0YxQYRYlXEv374td5pGKaFJLSne8L
         VPkUY93sbpVmeM/vXTMsevi8yp0p9VwhGNuoagdKmaQylcuih5A+4QZHfNUQ8Xk8KTD2
         Rqw5oY6QNiiPgYdN/S0Fm0D/30jWG2OCzURae/YYkbbadWYkPst+0ntaDo2Iu3O3izXY
         LUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798363; x=1791403163;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5spSizosrOmpK8SzSSYeLKeSXZf2rKWRXHBMWYBveo=;
        b=qNSwRNAbvINEtSfVnkxQ3tU6J42xrIIn1XOLxOOlkv6YyO61KsHvEXRPaEy+bcOB9i
         FdsVOCu0YbLpaFkYda8xgBZ7L02Y6IK3H99JaNRjCr7DF3l+DJ46AG0id2CaE5bpqkMP
         tzoPfUZbcPXlIWicImfIy9HAIf0vC3WcRvb6JPiJLv3b0pOpSd4WUoHn6QiPYZOpGxik
         Fz+L08UJZwykmIwsNZL3CfNsoCNc+FH5pqzr79FCMonx1u/6SGFQJPv9HsYoZ2DEKX6E
         JLEkUzXqkTB+KllwkjRMxCwsZNH/EnHBsZ4VJeCxuU9HTNHAHCM3UkdRVyuOIlJIqeOJ
         X9gA==
X-Forwarded-Encrypted: i=1; AKwUvBzTpm7qfCrNJEhkVrxCjO5rRMIs9Ec5Jf11zjH0H3rM425x+LAl3Ev9QvfwVGnxGGAlkF8r9hmipRLVEwk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMNhd7lju3em+YFYlTYwD6YaTXU12LSMgJKd4LbZggJatPkNOn
	Ha267M3cDkulneZ6BuFlQCKyCD0qeJg0T9OtWCZV1SgrGl5Fm3pB+84S
X-Gm-Gg: AYBFou0gmc7w/WSVpi+tj44CI8s+edSQ7Frbq4iislDJfRWyDooV4y7StR0e03cbbjd
	cQUE8hvLzMbdPExyFtkbDqVDZCyzVzLvUb76vdrkiJT5bp4ATZReDZitOKJhBMOHT3vDXzujsLx
	q3PmBBtsBKUxM2EC8JCX8wmXe/3cxM1mx9Kea/rJ8/Ojz8O4C0erncU8VPvLhl9gKNBMtmsbesb
	7myRRo1TsBiatgphYFroMk41Auh+iVh+oQzR2tH1z/XQ1RKLeqDScEwa6Ky6eAyyde9pK6DJt1x
	LuCyT7G0UPkOoAbqY06EktIVhLHiiwymsD3A6ydlQlpUVeUR5A0zFnq5DxqoY+LVWC1QetA2GTZ
	EIF5ZvYdSCoU23S3Q9ZrMc+dmHz2geJPxfoNJnq3i5RI7/WB9FfAsqGN9hsXgiGl9R0wLceOREh
	lG8bVTHaL0zMG3CcWdoW8ZHrrdRWIiHGSQCRWShbE+uNj1PxD0ITrULWqmcf5MbMiyyZur3RI7K
	zGMpgkeJOOuy/A=
X-Received: by 2002:a05:6122:e26d:b0:5c9:c60e:f4b5 with SMTP id 71dfb90a1353d-5d67ee922b4mr906149e0c.19.1790798363052;
        Wed, 30 Sep 2026 12:59:23 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d7fa498cc4sm481660e0c.6.2026.09.30.12.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:59:22 -0700 (PDT)
Date: Wed, 30 Sep 2026 16:59:35 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 12/13] iio: adc: ad4134: Support high-speed data
 capture
Message-ID: <ar1qJ8LaNaiYF3a5@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <60682dd6c61806bf0d024d242c62b39a349db4f1.1790719425.git.marcelo.schmitt@analog.com>
 <20260929231610.BA7C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929231610.BA7C31F000FF@smtp.kernel.org>

On 09/29, sashiko-bot@kernel.org wrote:
...
> > +#define AD4134_OFFLOAD_CHANNEL(_index) {					\
> > +	.type = IIO_VOLTAGE,							\
> > +	.indexed = 1,								\
> > +	.channel = (_index),							\
> > +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),				\
> 
> [Severity: Low]
> Is it intentional to expose the raw voltage attribute for offload channels?
> 
> The IIO_CHAN_INFO_RAW bit is set in the info_mask_separate here, exposing
> the sysfs attribute. However, ad4134_read_raw() is modified later in this
> patch to unconditionally return -EPROTONOSUPPORT for raw reads when offload
> is enabled. Does this clutter the interface with an attribute that is
> guaranteed to always fail?

Oh, I should've done that. Will change accordingly.


> > +	if (!in_range(freq_Hz, AD4134_MIN_ODR_FREQ_HZ,
> > +		      AD4134_MAX_ODR_FREQ_HZ - AD4134_MIN_ODR_FREQ_HZ))
> > +		return -ERANGE;
> 
> [Severity: Medium]
> Does this validation check inadvertently reject the maximum supported
> frequency?
> 
> The in_range(val, start, len) macro strictly checks if val < start + len.
> If a user requests exactly AD4134_MAX_ODR_FREQ_HZ, the condition evaluates
> to MAX < MAX (which is false) and incorrectly returns -ERANGE.
> 
For cases where the range doesn't start with 0 or 1, in_range() becomes a
bit harder to read.

if (freq_Hz < AD4134_MIN_ODR_FREQ_HZ || freq_Hz > AD4134_MAX_ODR_FREQ_HZ)
	return -ERANGE;

would have been simpler, IMHO.
Anyways, will fix this and all other issues reported.
