Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891453;
	b=VJS8LpVEVdAVAPSMupJhyNuRJB3OvI7q3J3zP+zeC/Lzu3Bx2dXVGenwbqpVYnIg98x3
	 RbfwPREnlW5UFhrDl+fFl+oeZacSEFajF6V19zBIM93B5eiO8uAs/YS4lzQOhA7WgRDTm
	 Bt+s42rE9q5TjlJz6kkde8+BjNCePXq2pdOs/xx5n5e63qDZMbmaV/6Ebt5wvbh7VUMCS
	 AGusgXls30F6raG/AquL3swdE3tdoiHnRb5QagrIz7No9nnCaalbwmSKKRBueQafFFTev
	 +PVkJgii/DY8AYrTliipe3RLYZRuS95kD9AMUU3vtpvAcp5ZbKTJXxW1t4E5Fsxy4ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qHw0tCSObWwSykY7n58JOmO4RZlsqTIrlkDPJXZwajg=;
	b=l7Zm3y3nxD77r4EP/MAhD84tf3H56a6NiDaBkn6/I20iy+64LvZitPZexvBJpwaKZH3z
	 4UUiZ0ogddcx8mvJZCcBgHykOF5eBEIJmi32TxzRExtqe8H0S0gLaznoZx105i+b0pnsP
	 2kOrdCfVUMV13oiXoxP1dZ7RJJmobzZpehFhZpJSBfnD2UxIBjs0DUZLT/tFE2cWzjkBm
	 Ine5uLuIwtDyB8IDXUpBgt7NRKTsR3sxcUDnD0NXfPkCuy7H03PhxgcS1tdXFCMLefqc0
	 Sl8ec0rnoTx/6YNsVmaSV3yvHgXZ4nqW8UBXkTlE+euMqXsesYglZnz8k0Si+nYkijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CoNgp/7x";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC8F606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC8F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CoNgp/7x
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5150723eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794891453; x=1795496253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHw0tCSObWwSykY7n58JOmO4RZlsqTIrlkDPJXZwajg=;
        b=CoNgp/7xuB8My566r2d1mJ2RCoEgk/Nd15sY6YVWgTnPAeE8xT8OtulNjEiNrRNoam
         98C8Qw+t+xGIB+cXNqUur7B3lXZYS3QJCzVLaTttv0YgWNmPvhiYM0IhZylUpOZ0WphX
         9bv6zTkPI+bYHJsGteG8dFJsef9gsD7hgKs+5Oec3AVc2p7AaHo/4y1KDrPuB0TRVcXQ
         dX6UiKTXxSHhPhsRwKcf4gNpPx7AC0DpY++pClM62WGnDHMkJPHxlgd4yZgaTvQdhUlu
         jwwf0fQLcqwx9Q7GKiA1PEknlaG0hNCTlh8QqHJbV3Sdpg3BOqRboMrxepU1B/4tS3G5
         K9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891453; x=1795496253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHw0tCSObWwSykY7n58JOmO4RZlsqTIrlkDPJXZwajg=;
        b=MkB3XFPnTpqWowlbJBNzKkaxlYQTVS+Y4oPMxapyCDWe9Ca5uZaIcDm9dgabbIHw+t
         bq+/W/nzzG/QvtfTFbfOkKQJkRzaYeATy0M5QPN6tEecnNvwMdaOXbh3cg3Gq5lnrmTC
         kRlhHvrnuU3HaauwfEjYzv+T5IS0CzCvDSgy7o0NG0fNAJoOwjDmDXi9PYJ6iPxOP84o
         cTra82VS7q1LVj20LvUlhNGWwTsSvoDGOKukfZrFlyh5Z1cnW6DtJ4K+TfxftFmsD5R9
         G41NyAdR6ljRaDTP9iR6zyVzuD+He37K8MNHVYl57XXfZ5xtjV0OPuU94xep3FhA0hR4
         Fg3A==
X-Forwarded-Encrypted: i=1; AL+hErHBaHOPXRlO9d0D5Do6mS5jQaYwDc3A5l+kYf9czCd519uMOuQ5pfyfKXzyhl9u0D75A14jFHkv5HgBJPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MiHLYp52jI+sgVi6z3tOljDPPmOi9R0EeP1fCDRi1m1ZXEsL7
	wnJT/CDFJKXLSVLDAvNdWRsxyjVhuI76WHGzIifIRFy0DDq5aoC3IKMN
X-Gm-Gg: AZFdTZcqe9GK2irBOfUtohhfRRTBXBc553wz1dO2UvK5Cez68QZYMSJ2kcPOaws/xl1
	fb9286ywtZDsRZ2PllXRHhso8lKJRkOItqXAib+F5Zvm0QRO+PZewQEiZpRT0HsAr0mtFtbwk1I
	ZhfhFUDKuvPjuxsngbKTNkNv3XLXDsZ25px12BVlJNFTSV/crJ+hVUghSl9SHGrml5esy1NnZEg
	gmXioS7aifECcNySDWGrZNKGCXABa0uSzzX1bPM5X0g28AKTXYs9qVsbNQJPW8ij1PguHKpFpaz
	iu39qtncX1ePkdtAdoCW+NDzea9TY5xh8b7nBGcwistwVoyARrQZH1KAE5IePLXvM8anHOZRoaD
	L7PxRfxiDZ1A/UQJwbqId2dN9fyZg7hD/YRCVZ838xSQ6GmiAKHkDq9UL1P/gnZPbkbSAdylp8x
	GX3nmEwBhcMw8AwF7RhQGuwIuEF5un3KPIenkyjiIujtckChk3pU0RXawdre4xSNngzFmAKxhtL
	ozkQxHr1j/Gk/UnA7lJRhtfPLdNSOjk9CA8GR0Lr6AyWYSGPHxNrwm0MQsK9LovWkuaOWKh0LJ6
	qvewgBm2O2XI03kvKO49Z0fns7y4QBJejUGAqEmBX5auSlrww8Lrw/EiaEE5zrZXEG1M
X-Received: by 2002:a05:7300:5609:b0:379:4197:5eef with SMTP id 5a478bee46e88-3796676be4amr12497087eec.8.1794891452613;
        Mon, 16 Nov 2026 20:57:32 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm71582962eec.21.2026.11.16.20.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:57:32 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] btrfs: tree-checker: reject file extents with oversized disk_num_bytes
Date: Mon, 16 Nov 2026 20:57:24 -0800
Message-Id: <20261117045725.606165-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <35bcaa47-55c5-4b2f-962a-c3168bdf52a5@suse.com>
References: <20261117023841.467366-1-teel4res@gmail.com> <35bcaa47-55c5-4b2f-962a-c3168bdf52a5@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/11/17 15:01, Qu Wenruo wrote:
> I don't know which agent you're using, but I have seen several ones (not
> only from you) doing this linking-to-older-versions behavior.
>
> It doesn't make much sense.
[...]
> And the full changelog would make more sense, other than letting the
> reviewer to jump to your previous version for history.

The links came from Documentation/process/submitting-patches.rst, which
recommends adding lore links to previous versions after the "---" line.
Its example also lists the changes of every version, though, and I only
listed the v3 changes. That was my mistake.

I'll follow the btrfs style from now on: the full changelog of all
versions, without links to the older ones.

> I think the ram bytes check should apply to both compressed and
> uncompressed extents.
>
> For compressed, it's MAX_UNCOMPRESSED, and for uncompressed it's U32_MAX.

Will do in v4, with max_ram_bytes picked the same way as
max_disk_num_bytes.

Thanks,
Cheng Yongkang
