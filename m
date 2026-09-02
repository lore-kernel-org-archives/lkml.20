Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE64A9D68
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364922; cv=none; b=fJuNbisIXtIG3GMCd7A1ksSQh84N8n8f26kMv+dTsDAcVunoMFj5dwqCMKkbxN/YPfYebYYw6JJQMsYYxixMvTdbknSnbxl+EglwIa0oFPemxCZy7LNUfvQpFByr2TgxuSXzJlF0/cOAGSBkcvkZslgTIKs8Ixb4E9PkxrxKJ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364922; c=relaxed/simple;
	bh=S9vcJHcV5w6+iWfSBsEE4krX8AdOIhgWtAwVWTkWaJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HV0Ih1hHTLBExXNcjviaPXESmZn0kg5b2OZL9UkPnhUnALYEWxmyZBMKth4lmcUZmfWThAs57xWzlkpkU+NQbZ+LJZsF/FAX+eQTvfL3L9N/kcvFi5fqmFjEKIoQgmbql/WcLUlI9BcQiT8Wmt2h8tUx01Cvj005p3Obg+5UIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=6Cev4CVs; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=yBEm023Z; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="6Cev4CVs";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="yBEm023Z"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id D292626F76A6;
	Thu,  3 Sep 2026 01:01:55 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1788364916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8+3LvJq5wamKLZhupeCtxfSgt3DWUqIKtcuGt772pU=;
	b=6Cev4CVsh+7vLSVT8kbElSRPHDXvf0esdt2B8WyGKLwucjZQLYj1icmv1DCjbSyyzH8bnp
	LDRXqJy2DlFWSu8CYn7U+6JaN95+5eCR1N/BpGcYV+3Izjlma2pn5AjT0d2KDCgU/d9aDm
	9J9Q+teRI/SCABkcRzSKR9QcCQeW9K7pZZaX00NTMVqw8+socw4oioWRjqH3dD8rBSMe3D
	9A0zNydoIN7IbjTg43SKMSPOCYXbQbS9gwyTPbuR0GDN81sCYi98tpHyo0ULzeAS2P18U2
	jpxfaCa/xccJr6pMuUrwSip+6rDJBgFI1KkqHu08PoCZKs3spgbesRLQAfIj4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1788364916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8+3LvJq5wamKLZhupeCtxfSgt3DWUqIKtcuGt772pU=;
	b=yBEm023ZID+A+yTohwTpj2u7ShC6a9F1Uaffjzr2Clo8yu2fsDdwzD0fuwIYJDEMh2I2V+
	gbIZBG5sGiy0y+Cg==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 8D4E7E00378;
	Thu, 03 Sep 2026 01:01:54 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 80F6A22000C9; Thu, 03 Sep 2026 01:01:54 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: hengyul@cs.unc.edu
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fat: calculate data area start without overflow
In-Reply-To: <20260902143858.4092293-1-hengyul@cs.unc.edu>
References: <20260902143858.4092293-1-hengyul@cs.unc.edu>
Date: Thu, 03 Sep 2026 01:01:54 +0900
Message-ID: <878q5jmykt.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

hengyul@cs.unc.edu writes:

> -	sbi->data_start = sbi->dir_start + rootdir_sectors;
> +	if (check_mul_overflow(sbi->fats, sbi->fat_length,
> +			       &dir_start) ||

Looks like unreadable "\n".

	if (check_mul_overflow(sbi->fats, sbi->fat_length, &dir_start) ||

> +	    check_add_overflow(sbi->fat_start, dir_start, &dir_start) ||
> +	    check_add_overflow(dir_start, rootdir_sectors, &data_start))
> +		goto out_invalid;

Maybe, better to add the error detail?

	    check_add_overflow(dir_start, rootdir_sectors, &data_start)) {
		if (!silent)
			fat_msg(sb, KERN_ERR,
                        	"overflow of root dir or data layout");
		goto out_invalid;
	}

Thanks.

>  	total_sectors = bpb.fat_sectors;
>  	if (total_sectors == 0)
>  		total_sectors = bpb.fat_total_sect;
>  
> -	if (total_sectors < sbi->data_start) {
> +	if (total_sectors < data_start) {
>  		if (!silent)
>  			fat_msg(sb, KERN_ERR,
> -				"data area starts beyond volume (%lu > %u)",
> -				sbi->data_start, total_sectors);
> +				"data area starts beyond volume (%u > %u)",
> +				data_start, total_sectors);
>  		goto out_invalid;
>  	}
>  
> -	total_clusters = (total_sectors - sbi->data_start) / sbi->sec_per_clus;
> +	sbi->dir_start = dir_start;
> +	sbi->data_start = data_start;
> +	total_clusters = (total_sectors - data_start) / sbi->sec_per_clus;
>  
>  	if (!is_fat32(sbi))
>  		sbi->fat_bits = (total_clusters > MAX_FAT12) ? 16 : 12;
>

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
