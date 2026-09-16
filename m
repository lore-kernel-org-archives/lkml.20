Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D4B369D45
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544346; cv=none; b=L+wQWgGOV3bPiNPwCra8IlNIBYJeVeAdYVeXW103PBfIcjeoTYLJntZY38yDbIjGuXMeAK3ec5cHxTZ4bvQ4iIBh/lvqkOIzRQf96Yvcm3XtYH2EjemEsds7biK1helzhKNt3v3F7zWYg/a9WuMuV/0aWiM3jqIzIzqV1D7jZNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544346; c=relaxed/simple;
	bh=hNqVrXfEvLOK+x6ECohdEsHvAi8OpRMWT4YfU9U8wHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBXnhSdACXglVZjWwiUx3JT/gUUunuI2vyUdEZp8Uoh85QugP5GL9ePh0AnPHbwPSBNa7QwVYIMVSe52BDzRDwllhuhco9Sl6AuXRylZWtoG0I+K+bMThhn4iPhNbJAOofCXUwcc/GrGxc0OdzdXBqwvkaoxB8lpfMUUQFyBUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csHwGaEB; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csHwGaEB"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so498151b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544331; x=1790149131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtsFDmMToqDmeLwW8Klcnn0Np/6m/Y9EyWUe22xbd1g=;
        b=csHwGaEBKnKlOGqdXSokA9/WdGIYw42N2ee4SE5wgRYyAqaL0iCmYYWtizcuxCR6Q+
         JsToKtYhuQQRVP41GXe0ILfCSbmxs4agoBWDebNTBlexntp4jB1GQtZb7NXX0TgacTpH
         hi/3g5FdQhNmLwBsdrroKBQezALaQZbBAIqHRQg+warneOfx4hzy3aK0dGfbED2HATp6
         QcjcAAuSnm/LJgedKTcBl5EWIzkEkozwz6OPvzNxREL5G8SEcFdOeKYSm+HJlKPQ7msi
         x7gzjsWtCrfi/tZcpkpv2iPRggYEPF04+hBhnBjTrlbsVgc2RoQTygn4lRfFJkveNJvO
         QfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544331; x=1790149131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtsFDmMToqDmeLwW8Klcnn0Np/6m/Y9EyWUe22xbd1g=;
        b=tcpKMlQpSmjKr5LujPRoTpzLP8jlV4d3u0Z4uw6M8+Iz7YuI/phSeBbFv6AbmlSpfO
         6Ui9yJzRs4tv3bOEh7oV51frk/RyE/0m6u5lOw+ZU7Ud/j43pd+VIOg6bJrj5FMlnZAr
         x7Z8ShhUfJ+5z15gh0Pw0hixC1feXa5sELbl5p7Z6S5i38XABN/fDuw2KMXq7NUqEfMN
         LP0GVXNOh3Bzxog8s51AVMnujitaLDcnPxeqsxM20fPcpwyU3Ntk5uSFhlMO1LBibQTn
         NU8/qA2aR7nf0AKYChKJjP/v72oazCNGrT+uH14W0XBmYfAuJ+HOuo4aZCSamIVeaATQ
         G+gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJHB1tZ2cOVqwqdCIxOSlN4ucBjGh8RhVPzLxX2F8jzIn5n3FY+0VQrnkz5nBnIjzZTnQtxSurNSkntW0=@vger.kernel.org
X-Gm-Message-State: AFuF++nfQLMG6UfJrxv6cNJyAkfMoMeR0D5So+FGJBtgEy1roJ5anFW2
	utJAR1czt/vVQhGYoO3bkd35qYp+mprbE/fEDvSpgLUl7QxmcC7R4Dql
X-Gm-Gg: AYBFou3a7eQ91206ZaPwyI1dkmcpEmEs8Ve43OsuU9upIFRxxutVTS5LlfvCGU+U4yP
	kdn7RG2lDrSHD94aeNonuxCLmFf+TScyYgnOhOgWU58AKBlxHCiBEA58+0vajFei+lsHbGc+YsE
	BFBp5V+1gmpwyiNCZGj5xYUcX+4AjwLSBfCR8gVHbxBzlWFhM4iARxjTHEWzp71koI+3Tdggj5p
	ng0CBSHMRqGBmBnobtkeaC89iSOxe6WAllDx4ezKGhQDLZ3rOPro1Bt8XI655QDdJtRzjAZValF
	XJ4ZoEDj6emV217tFfriaNUgmhFa9SC+LY1ZOgbJkcINEKTHJnzNw4fw+3eyS/z47PsIwCw4lPD
	AJUUuKjoAef34LNyns6ka1RZV+BpGkDnXFVndqg6tT5c4cB5isPNbtoKgF8RL1O0cpLss8D8bxL
	VBOP9a7o4hZZrF8/T9E8HVnvxHc4pABe7PNv7nj/MIoETRgHRLbAT+HKzn8aU+rA==
X-Received: by 2002:a05:6a00:bd93:b0:86a:9be:6bf9 with SMTP id d2e1a72fcca58-87238f95d83mr2981891b3a.12.1789544330818;
        Wed, 16 Sep 2026 00:38:50 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201f07a19sm764818b3a.53.2026.09.16.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:38:50 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:38:47 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH v2 2/5] ntfs: report attribute errors to fsnotify
Message-ID: <aqpHhxKx_xiSoZZQ@hyunchul-PC02>
References: <20260916022345.1151836-1-liubaolin12138@163.com>
 <20260916022345.1151836-3-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916022345.1151836-3-liubaolin12138@163.com>

Hi Baolin, 

>  folio_err_out:
> @@ -3720,7 +3737,8 @@ static int ntfs_attr_update_meta(struct attr_record *a, struct ntfs_inode *ni,
>  static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>  					    s64 from_vcn,
>  					    struct ntfs_inode *locked_ni,
> -					    bool defer_attrlist)
> +					    bool defer_attrlist,
> +					    bool *error_reported)
>  {
>  	struct ntfs_attr_search_ctx *ctx;
>  	struct ntfs_inode *base_ni;
> @@ -4086,8 +4104,11 @@ static int __ntfs_attr_update_mapping_pairs(struct ntfs_inode *ni,
>  	return 0;
>  
>  put_err_out:
> -	if (ctx)
> +	if (ctx) {
> +		if (error_reported && ctx->error_reported)
> +			*error_reported = true;
>  		ntfs_attr_put_search_ctx(ctx);
> +	}
>  	return err;
>  }

__ntfs_attr_update_mapping_pairs() does:

  ntfs_attr_put_search_ctx(ctx);
  ctx = NULL

Therefore any later mapping or other errors can therefore lose report
state and duplicate reports. And The error_reported boolean only tell
us that some lower-level path has already emitted an error. Consequently
a report can incorrectly suppress a separate report for a later rollback
or resotre failure, even though that failure represents an independant
filesystem integrity problem.

Instead of carrying error_reported, would it be simpler to report each
error at its detection point and let fanofify merge repeated error
events? or would there be any alternatives?

-- 
Thanks,
Hyunchul
