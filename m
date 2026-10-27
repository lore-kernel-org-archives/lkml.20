Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080024;
	b=5Plc3CfPgt7YeJE7kYXBnkYap1QOv6fFkIxTA0u7IH214HI6mPWFpI2s2kdsUV56pdCK
	 ZVFz7zdRLVGzHDSfJ5zHHEoaeRiCA5je+Nu0devkONd7vI5+JYnUhBzgbynd5u6PWGFZw
	 IcpLXZWwfRWof94tULs9gqeotGAJkLzeXTEa6V/2vJVJXvsKYARaacPmpwrSP9c5W2lj2
	 jI7UOOZ3AmXlwLQO/79FBzyUGyio6Z6778Rr7cC7lJIflaczYMWEYvxr5+CmD0GYyBImn
	 uN0uYGcZpAS4OpMgQw1BDwblYFRsrH8TOrUL/YiyAG/lELq0+Usof8lfbLsV2WvQFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
	b=38rEvIixJhl9H9wmbV89wJVHHENXQi37yhOF9QfuKJusOu7fUSPgh5Ima7LraGxGHOxX
	 VhSao6ftRLLvKt3q/w4BA1hCn1N82kXj94irGSSHE6P0rHR4QgAdTLhdCSnObG3JIqAxG
	 G+S1cQY1RR2mkpQTJ6KNNbUBzjsuw5f9fFsFYqrghIdBeu72CrU2PPhHeRGbxMJ5TczJU
	 osfOvqfhYdbH+lFy2LqQYJiBncDWl/Gj21SqaY+Kx51uNWx+6VAJzrMs12bX7vfhZ70KL
	 PfYjyGhH/oqvKn7/M9rL8Cb6rJaM8AWawKCJrrg3gbgdeEa88BxW3IsKXOzJZC6c2dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dO9dJ7P1;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E0A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dO9dJ7P1
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso19848215ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080024; x=1793684824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
        b=dO9dJ7P1IaOZigc+VWTcVJcJg2YAjubGbgqXr+NMgxqzq8T3W8WagDvDoQAeMn2S7B
         buP7pS8rcPvanIyLER+dRMB5RkG7FxAGwgIfqvCo+afoiL8EnbCfgVPf+EQDhdMw9uR2
         GipztqxRlau+yho2+DvFVSpkQUvZlvf74J9NaJN6dAZR8x9w/8/wHVAYTojIsfEBdN7f
         4DTF5CLjNW5TdnP9EyqPmD4oplbGT4jtOyfBCeoqGfocO9wxVAlZOlYRQ22R2x68LNOF
         Yk2Ecj5kOvzWpJsYrLC7f/SmFxPLb2Aw3vDDpbhC5oHYMolYfTH6MUoqMsZMdWZHhvPh
         SsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080024; x=1793684824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdM+3NvU13EIF1s02O4+z9d0vDNB4xMv1AhgPFsDih8=;
        b=OYNb6HlJPaTf0yJDZqhYY3NgqHI6n3OVSpzC/4VKmi93DiH1pQvGpcPwvkxqKMwghH
         gaq7Q7UNUvqJFiTYxkSmMsIt4eZn9o6EBBOaqMajAmfWF0/VppPDgR68gkOGtEe6msNp
         tHv5+nCwMOrgYohVmRg7fj0A9oOeW9aXVk4k9yx/Qx6rcbL8qdRWOAbvbULcYS7Mmesu
         jW1hxbcsHFSwApsiAAyPpbE51PSTGdsekf5VAD1hxLj5RgqP09yzZ0ponlm0wA5Mt+dC
         m4ejYxc+YGX1amTMqx4TLa7A/xMG653UURlmbsr5rIEhoGOby7+2j695MwQ9LOlMyh2/
         K1dw==
X-Forwarded-Encrypted: i=1; AKwUvBz0zlxvQzvicrCgdSZUHMOzoiSsMoggj/pbxtSZ4vzou9iWTXlV/Gt8l7+g+nvZ+ucxEo2MYqo7cCWudHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMBoIlXw3bxe2saDKg0bPHsfQKGab4cu4fA9I6CkeoSOIXVG1C
	So7Wryo0FZyz5f8CS7Rx83nOD3u007zfHz0+tU2Vh56C7sHPgjiXF6+GNj50QJ5B
X-Gm-Gg: AYBFou2fAOC4XI4rqSkMx4/IMQMAneyc6i1zy3ijk3aNAE5HxkRYEHJH3rA5Ez2Pcsn
	bh20fBc5CWw7ljhal9LMFKxYWnD5ZTM+SEPdCEsO7hQOKmIylDjXTxTy9i7j90DnYSd2T+bPfwM
	cu3i3MFOio+wUtjlmoYKYi1RwIeuOEAQzOIuhu8EzlU8MTNMTagbiyOEKhluy6d7207TyIo29cY
	Q0GouskUhmQXPT7CEHV30KdzRd3sljgXLIYWGrbS5hq1JgTex7lB21pUALsNtUOLJ9/zommzX+4
	49Yb+WaftrnsmvK8kYMb7VNW3CWj0nqjP44c/tk82EH8duAY25W20T+J0LrGHUXM1/HurfpYVM8
	85Nqm94KSRAw2p/AFCe+HwkxZvQqWFLenIn3TfaIt4z1CmlK2gU+fRtizvuVh6vL89Q1F7AJUl8
	dzmekeCLG5eK1Vj++42kHR3KVYZaZEQl3PMM/MYqE5GyWrF2v4yx1UATW32PqT2BwRgBkhh6DUo
	xBnv9liMvLbp9oi41IGRd1/kIoEeNKV/1AE8Pd/wR13mAU=
X-Received: by 2002:a17:903:3d07:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2ea9c03ed08mr77511605ad.2.1793080023467;
        Mon, 26 Oct 2026 22:47:03 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c8f24esm3539175ad.57.2026.10.26.22.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:47:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:46:59 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 04/31] ntfs: preserve attribute search context
 initialization errors
Message-ID: <auA600gtGbVWw_SU@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-5-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020084421.2196486-5-liubaolin12138@163.com>

Hi, 

> @@ -5476,7 +5480,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
>  	ntfs_debug("Entering\n");
>  
>  	ctx = ntfs_attr_get_search_ctx(ni, NULL);
> -	if (!ctx) {
> +	if (IS_ERR(ctx)) {
>  		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
>  				__func__);
>  		return 0;

ntfs_attr_exist() still turns ntfs_attr_get_search_ctx() errors into
'attribute absent'.

> -- 
> 2.51.0
> 

-- 
Thanks,
Hyunchul
