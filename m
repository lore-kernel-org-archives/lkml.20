Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A604A5ECA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363556; cv=none; b=QGclISRRRUSxT+OzDVxK5CrlwaWzGSGgRAfj1jqpCzipe9R2iajnuBYterVNyjpMcEo6SwiHvTBAWjURs+5vS8MM4fLe76zOBB8l8z5Ib5Hda1LhNLsRxtsndPMjULE2K1Q0MuvH67JVCLtegkoI2YBvPnifdBHtwHzqZsuIM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363556; c=relaxed/simple;
	bh=UUxGn/5w9hFysdUsHxtfyW9vwvZpDJPh1Bk9Jw0Z+RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VV8VRzTr2mB1zFrg48yDGg/7O9cDQceUdOLIQNI2MvwLLGNfIpF2pYC0pA39rIoitoIsAgp7cbMZS7/q415O2VNVYdZhDzOoxErfWrds52qz8T7BL/nH2+kjhVauDN/0VEJylX/tf/TCHNhYmNUw2iUep1NyuQxt1YeFvdHJqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdCOeTnw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdCOeTnw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so8076235e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363551; x=1788968351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bnP5tF3ykHzmCV0dJQ3NV8vi9qDxjN1rUAoABaC0Yc=;
        b=bdCOeTnwdp1xnFCYo8Kkh8xWClsiMBiTr5O9ZYtLhNaidSwptVDuqH4FVcnS4AV4YR
         7BiEsOk9sUak+5V7Bmzhu/8XZUfjUcQ/IjTcD5D0bgXFYjZOaPFVL/LTc9Fu3cZHkvWt
         /yu9i4Tnc3da5f4t4Q/Tp1VbM1pGjFIKzCkFA7TGYeA62g5f4voJvA2HtYXsOYOoWGg7
         O9NPcfLJrA085OxTRRBUCQy6jwVt1yZ1OFfPPEXHvuXsdx+dXgU2wlAFgR1J9RGpSHx5
         trTByjwMJTmtjfO/xq2MWgBNstPQ4/cEFhPLdGJxmKSPEZwl/Ot46ykSYIX1FRD0765B
         LLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363551; x=1788968351;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bnP5tF3ykHzmCV0dJQ3NV8vi9qDxjN1rUAoABaC0Yc=;
        b=MWI0u/0/dRQ5lysDOv2Kz4qZURqjyaAJt4sEpT3Is5qMPr4C4KOFf1GE27qRbs+iCo
         J/RIxjdkP9NfuR/gQqltKbqm+/JV/ZyRdYbywcwNSHSt6RKg7Qngofl7gfefP7VNdhkd
         CNwFGSuE/ZpkxBlOi8cbRPCLq+hMaRWUEhmcAm++PhFuDp7Ds9z8ndqVtcqd5VtJnn97
         vCfcIg4dhjFRNW+313fAyqLXJWVA9D7jKTGuTeHYuJxyXm0UQHIiqP85HzjedH4qx08Z
         d7Nr85SBCaTzStl/0PvTb4i/40bkwyc3k6L1DEwQ4jDopLokFGmvefCs2A8lJHmJgB9q
         +NMw==
X-Forwarded-Encrypted: i=1; AHgh+RpnCT0cuZ0hSVZgHKvnvwn0oYuCuVgOOUZzfweVr+O58pl2gPN6vvbKsEj1D573zX1dvLi0FckmiEmXowY=@vger.kernel.org
X-Gm-Message-State: AFuF++m5slaAhsJ5Ro0tx00pTpOIIwpcE5ntnYlIzSR/VgJd/ryG0tYI
	igwb88BVx0a0nIc3mlgR4PT/3IHWYC8BzYRv3QmfLuBZqA0p2M585m8P
X-Gm-Gg: AR+sD13cQo8zG24pCb+Deyb1yAcZUTx8lYMc8iQP4Z4yOA3J3H+gV0Z1BK9/jsu13uV
	vkWquDguaavloELJGdvCTNpxoohyJJUJY5IlU0PC9VbZX40jXsnLRdrsF+3Ftf2vgzcF2AKYa75
	BNmxCPp9L+CnUXvPGbRQTXhjp9R1mDQ/YxkL/dACMl9OhK2T4Ig5uacWTshalHUSv1Y0HaPskHU
	JC71PahAA5YQPdVs/yyI5QVz9BlQP7GvM6FQvZFhMw62ypK12NRMZEVaH2Koe86FjTQvwCV6+C/
	owl63wujCAA9KN5/CiEacD52ZvtKplmzIbQz9Pha9i93ICbMsh0/ob/Qw2ttv34pdhUXs/j0SH6
	7snF7FJRznLKbQf2RdZen0tzRL2AjgLPFLPl8JjR4J5f2oG7ypCWA//ROv2+dyUPf8QOyAUf3u/
	sJtQbMsSBbIoZpvP5bc9J0ILJK5Dy43Ktw/Qrkd2CaCyU4W/5oJLYLIUsLuQ4PffrxuYULBQ4ZD
	VXZ69AqplK7YLFMCtMN6XiD6g==
X-Received: by 2002:a05:600c:4744:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-49ce5813246mr81035545e9.5.1788363551000;
        Wed, 02 Sep 2026 08:39:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm161888245e9.12.2026.09.02.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:39:10 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:39:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: hengyul@cs.unc.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: calculate data area start without overflow
Message-ID: <20260902163909.15ecb746@pumpkin>
In-Reply-To: <87cxuvn9m9.fsf@mail.parknet.co.jp>
References: <20260902105716.3972118-1-hengyul@cs.unc.edu>
	<87cxuvn9m9.fsf@mail.parknet.co.jp>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 02 Sep 2026 21:03:26 +0900
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> wrote:

> hengyul@cs.unc.edu writes:
> 
> > From: Hengyu Liang <hengyul@cs.unc.edu>
> >
> > On 32-bit architectures, sbi->fat_length, sbi->dir_start and
> > sbi->data_start are unsigned long. The number of FATs is an 8-bit BPB
> > field, while the FAT32 length is a 32-bit BPB field. Therefore, the
> > calculation
> >
> >     sbi->fat_start + sbi->fats * sbi->fat_length
> >
> > can wrap before data_start is checked against total_sectors.  
> 
> [...]
> > -	sbi->dir_start = sbi->fat_start + sbi->fats * sbi->fat_length;
> >  	sbi->dir_entries = bpb.fat_dir_entries;
> >  	if (sbi->dir_entries & (sbi->dir_per_block - 1)) {
> >  		if (!silent)
> > @@ -1763,19 +1764,23 @@ int fat_fill_super(struct super_block *sb, struct fs_context *fc,
> >  
> >  	rootdir_sectors = sbi->dir_entries
> >  		* sizeof(struct msdos_dir_entry) / sb->s_blocksize;
> > -	sbi->data_start = sbi->dir_start + rootdir_sectors;
> > +	dir_start = sbi->fat_start +
> > +		mul_u32_u32(sbi->fats, sbi->fat_length);
> > +	data_start = dir_start + rootdir_sectors;  
> 
> Maybe, since u32 overflow is always bigger than total_sectors, so we
> should use check_*_overflow() instead, and detect early?

Why do the work twice?

David

> 
> Thanks.

