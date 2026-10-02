Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE30F2DECD3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945467; cv=none; b=bRbiL7koEwQX9hwwXgq1cJs2aYVjJn9XVd6OyANOO9N5ecRZYbz3ywD6CPKqIgzhEf1fbMFLcyuhuakBZ0De5BdLOk8OCK+b0wLIvu3XbFKR/Y9V9hkHzlgGQpt56I42+S5No6egtVew6BgXx+PaiIuxZykybg3JGORIUk4PseU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945467; c=relaxed/simple;
	bh=OmxZCWplAWwOsu5V/M1uyWdSkiEaQLSRhrieiV1vD1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YzDMEDrV68Y9V17NrOs7AwLYzCzAZU0CmQ6vqbbznDppBtnhEFgKTzjcD6DVJH8jkRsWG88ypKgO4mhm2o05W79IfkZf0VGuAu/BAvt7aIQNmLKAXU4xpZJuAB+otrFVyergqs1E4VX4nLVMh/7GUzsHMdw3jS/H+tdSTWFewRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjaP78s2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6wiJHuc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjaP78s2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6wiJHuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
	b=IjaP78s2zYtq5ZRLduP3gSoVUAV6s0jFAkTpOPueiHzIQKylJ05Wif3BRFwibWSwgchzMu
	IAdIPStuPoGXEtBOkSfGNemsto2YpDHHCilpfcIGmabqm3ieJTQAIc7OAhsif/9Em6Rncg
	x3ROL1sYZaIdkFzocK16ZDh9iPTxudE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-Nkn87hEoMuan8F1kxYBSig-1; Fri, 02 Oct 2026 08:51:03 -0400
X-MC-Unique: Nkn87hEoMuan8F1kxYBSig-1
X-Mimecast-MFC-AGG-ID: Nkn87hEoMuan8F1kxYBSig_1790945462
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a024bce773so20486835e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945462; x=1791550262; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
        b=B6wiJHucA7utfZblKwUs0kDpPnbA3Akm5XpFb98zSz6zjURWrZDkOP/UhRRVPXvi14
         keLzEHSR+tbo+H60ybG6I9+MMExo8lfS3zEhjUxQhWHGbK/1okdPn9HujZyPP8hZ579s
         eg+4O7qZeK7tcfECjAvRk+tltVCrXs34HiW2khuwnIni1776Mq9Haph+GNackLX/fMnm
         6jYCGAfCssnhiaOoWGQL5MHo/W129GbNjgSA8QoIRvmKZhF6+SxkzQ1MD+8AyMrcBlZp
         QIva2+dmaI0ha1snDgTgQm2UKxjHHwW6hlC+sMwNM4wynE+GunENlnLkcuJwVvd6DE7M
         jNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945462; x=1791550262;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uT1TzvdktEC1eT/y91LI9yVzdqB1qQfdlDD+ACCdd3I=;
        b=XuASGGWIl30PFRDl9+LQnMVfuXB0uN7sbU1arVBjlFkj2luJhTOz379NEbU4PwyxFG
         bH4+hjFW8Ms4bPnKoVRx4iRwxik7Ar/kh1VlF/Ij8gDJXoSiv2Lz9vqiKawpoPkiedaU
         bdAxt5T/9Waewtp9t+iFO+7pLbIqfBnhbJaK0RA9iAwzLcWYXbY/FqSyphHCG4aPGkUw
         OarKdrhEWzCXxQnOV/YBMrHK8h997B06XOIhcSAPn56Rsh8cg64S7UNHkNxm9iaxvQmJ
         Pah8UPk2gfNxwNlmmr7or/d0vWmPG9YyoADi5zDsJcaGxyRu+IhU+EWS/Hd5MV6pQil8
         lQfw==
X-Forwarded-Encrypted: i=1; AKwUvBz/RT58CbWWF6w7IDUl8Kr99zcmaeP2GqD3mSD3Zp5Ax5Dd4c+V3cgtLQ2Kwai1yHauDE5z4tAB166a4Ww=@vger.kernel.org
X-Gm-Message-State: AFuF++kyRMnWRcfKmKZwPLkVXgrvywyf24ELqwynWFRHOhCwTsIU7VHJ
	FHyyB5BN4x1YMc9vnC5pNhfXi3pV/EG0tIY+k8z0nILR3SIPqocYXwNGYBzPqCN77yPohBlNMS8
	SM4mCdDUTx8U/dqFLpeszy65ykxO7+aNr/LCAphCIP1ZUB0O4hGeB7UaXkvkOFuTrSg==
X-Gm-Gg: AYBFou02DfZ24V2wkapFa9hcTooZN18xToSQs8H9iUxpGlOqjYCSmowGriVgOp0XTvI
	Mj06orP8tgk9yyPhWnYSZwFxvoeum7JduSFloIM3AP8DgqteTbH+QXudVTMxXUyPmyHYJYVP1ap
	wzBZUhZk+i8c3qZpP32+51RKo3Rq7wSocTexa3w4RkbSdkiCYC7igXphz0bNVax5GQajuGUUJm2
	VgzFNFTSF6NXcCecm7v7ilmH/yPcZ7UCnNdbBxfpCBQ6MtUoMsjSMRvFXmqX7kS6dR4zNE4lSAU
	rQkScnhCwGUTBdBxdWPAxa7Zb+CCCAILKev05RF0ChHpzEe0Ok/BTDFQVo3hx52iX7jyeJ6o/HP
	Pww44GJ9t1BbDFqMe5AlSlirwvPrwMRfQ16ZZoziCxDxGp3ynivK78buVll2ReJfZcw==
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975915e9.30.1790945462138;
        Fri, 02 Oct 2026 05:51:02 -0700 (PDT)
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr44975435e9.30.1790945461642;
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm82137655e9.8.2026.10.02.05.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/7] drm/bridge: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-4-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-4-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:00 +0200
Message-ID: <xlv1h5j46zbf.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The bridge code does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

