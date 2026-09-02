Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFE494829
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350638; cv=none; b=TOrHZRuY+Dx0zMaoPPrQBgoFD1J6y8NzMyp9/YP8h2sB/eCDAljT3TBxBHTfFoqJnRwXNCIi0bNVYVlGhCNXxUwZyfl9iW7MIHfDPFyAE7kGteRz/BcM0o7IQgbfAT8uB3hSL6TK6eaC+0kS/zp1XmLWb8uhvQtDdaGwkS65svA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350638; c=relaxed/simple;
	bh=++p8uTy85uEeC9izhnaYS/TpksOvvZAoLq/oBuBnOQg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rNcVpZOM77qKklcdO0Y0YOW2Wqpov57pw0C+L0R00ztLBbG0Chhw1LQg6h3x3ILEiBKXPzh8EVI16uNTEBXdaOz383gJT6omgpYKTZWyhBcXnsn4bp7AAaH39USOMLixelro4V90WfZ4p5WUmJH6N0iAym8lqp2GWika8ZCQx1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=W2ljIJah; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=rMAe0vfN; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="W2ljIJah";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="rMAe0vfN"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 25DCF26F7698;
	Wed,  2 Sep 2026 21:03:27 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1788350609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGVX8VBTDF0lI/R/bwqKMzyHuiRwzt6JsfoSvY2IyZ8=;
	b=W2ljIJahwYVA3ozS04zW1K4IaO2NoaDNPn3NlBThMPQ2GPpADd0elEIxAVgpSNnlEh0Pg9
	A765kgY5igOwE7IZYaGbVGPaKsiUpkpPyFWTIOAPs1V/P6wCinVk6VdO+N7GOZQ+4rSpWA
	+qXhqUUFNCNeiqI43ekj+o+ToVjqFALc8kg0qi4oNF6Xla9MqwlyRYJfOhuA/KKSPSvPiG
	wgBED/EL9OaQgxCEmPYh23QzMermEwPHcEPWVIbhaUTIZ+KyUdKDuLjbXESrWn5+aGl9pC
	Xx3i+R2L3h4UB+ov6n47aQFDEGmOlo4VGLM6DuOmSxZsQk0B8QviFpDSqUsnGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1788350609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGVX8VBTDF0lI/R/bwqKMzyHuiRwzt6JsfoSvY2IyZ8=;
	b=rMAe0vfNRpqz8qRT2aYvd8D3JP1F3GG+H2NpLfQWq7WDR9DKG//Lu4zSFSEcrruu4/uDih
	Iirketb/aSvXjsCw==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id A45DAE0025A;
	Wed, 02 Sep 2026 21:03:26 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 90BAF22000B9; Wed, 02 Sep 2026 21:03:26 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: hengyul@cs.unc.edu
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: calculate data area start without overflow
In-Reply-To: <20260902105716.3972118-1-hengyul@cs.unc.edu>
References: <20260902105716.3972118-1-hengyul@cs.unc.edu>
Date: Wed, 02 Sep 2026 21:03:26 +0900
Message-ID: <87cxuvn9m9.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

hengyul@cs.unc.edu writes:

> From: Hengyu Liang <hengyul@cs.unc.edu>
>
> On 32-bit architectures, sbi->fat_length, sbi->dir_start and
> sbi->data_start are unsigned long. The number of FATs is an 8-bit BPB
> field, while the FAT32 length is a 32-bit BPB field. Therefore, the
> calculation
>
>     sbi->fat_start + sbi->fats * sbi->fat_length
>
> can wrap before data_start is checked against total_sectors.

[...]
> -	sbi->dir_start = sbi->fat_start + sbi->fats * sbi->fat_length;
>  	sbi->dir_entries = bpb.fat_dir_entries;
>  	if (sbi->dir_entries & (sbi->dir_per_block - 1)) {
>  		if (!silent)
> @@ -1763,19 +1764,23 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
>  
>  	rootdir_sectors = sbi->dir_entries
>  		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
> -	sbi->data_start = sbi->dir_start + rootdir_sectors;
> +	dir_start = sbi->fat_start +
> +		mul_u32_u32(sbi->fats, sbi->fat_length);
> +	data_start = dir_start + rootdir_sectors;

Maybe, since u32 overflow is always bigger than total_sectors, so we
should use check_*_overflow() instead, and detect early?

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
