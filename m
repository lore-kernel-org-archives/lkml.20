Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254695;
	b=vsB2ZjQgimcGH9SrsTCxcpJEU4EcGNNTfZvBs1inREyX1qGmAJbZS+toYdZFfGsFCHaC
	 0Ni3IrbnrlJ/n2TevobSkWs0Nkk/jyfSM79E5hpnwnfWktqcahEKjDGwTyPfNrSzRslTW
	 dUp6VJRg6i9g6srCZJBpG5mqYjCn1Grxxfy3y46FvT0AfldLogcjJYkKA8Y7kcWgvaYuW
	 bwg5a+CYyNPgPudPS+cNPv89MZ3QEXrs1C1Ttm1BXKXkAXeZEa7xnhfIIRWJSAPFCBpJp
	 oqtYqRV9FppI/K9Apk11SC+NoeaflJOC/CFLaj4CyZuQMwjaSh4C+G6gfHJLueFr0ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254695;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:Message-Id:Content-Type:
	 Content-Disposition:Received:Content-Transfer-Encoding:References:To:
	 Mime-Version:X-Lms-Return-Path:Cc:Date:In-Reply-To:From:Subject;
	bh=zDDCyxrxLeYzToiYXpVHw73TexT2G2AmhqqhhCFLUjw=;
	b=akHQhBMBvL4BZ9vTD64aAalqXJc4Jyi9XeR5kgNo7X49w/gp2Ohrx469dRMyX/lnL04o
	 0P2g2jqRV0J0q2mjT+7SAL1/ztgWQrQSLTbbFWR19dCZ6Sj7Q2yZA+e9xFoas+zJG//5W
	 0HaZbE9W/4wP81eQhrolSGcNOBaC6z3Rw0z7RrjkyEcqtBZkCGZ9w0sbqnJQA1dAh488S
	 cWIlKJdt7OJ/hX9HHwIQs7DuAkxGeYraetJsUufQb42Fnc+6GS121LUnFHAZqWY0VkCJl
	 5rFERTi+jCrup47bm3csb3VI+XKc5RtuVIFfuU9LIAwoEkq71HtutXx2uPd8oFYfaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=ibi9k6dn;
	arc=none smtp.remote-ip=71.18.227.3
Received: from sg-2-3.ptr.blmpb.com (sg-2-3.ptr.blmpb.com [71.18.227.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6364606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6364606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=ibi9k6dn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1793254682; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zDDCyxrxLeYzToiYXpVHw73TexT2G2AmhqqhhCFLUjw=;
 b=ibi9k6dnbnBh964q0wYidTx9D3rjTK0wJbJUnCVmUZh7x8J8+T70dVtjQdrv9JVY+o3p/T
 OtThO2UGHkg3MOoRmgxKmikvQSyHguVKqSTrqZYFjw3fu1aZyq/IvKVf1IsYwZWxN1i6y1
 e/n/hdxkdsKSxEMrE1OupgmB7PF4K0D2jFoPBojb2XMOwnzBVOr+lNgdmtzrXK5jhQGeFF
 aD4fpzXFQkEy7XgZtGoKKP7E67clpIWIAu3dSdqNc1ZCyo78Joy4vI5cGPmRmFc3TnhF2U
 xk9OmbyXnTmokCMVwzjNeF6WcCH2z7f5ENUqEcnhSgpFMVtIrW/dCuxiSx7CQw==
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Message-Id: <auLlFEHMZvANXUvU@kernel>
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Received: from kernel ([111.42.148.100]) by smtp.feishu.cn with ESMTPS; Thu, 29 Oct 2026 14:17:59 +0800
Content-Transfer-Encoding: quoted-printable
References: <20261029-b4-ntfs-bitmap-writeback-wait-v1-1-e2ba711b2dbf@cherr.cc> <374bf856-f880-4fa2-abec-c4b2a063bf57@163.com>
To: "liubaolin" <liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae2e518+83deb8+vger.kernel.org+me@cherr.cc>
Cc: "Shengzhuo Wei" <me@cherr.cc>, "Namjae Jeon" <linkinjeon@kernel.org>, 
	"Hyunchul Lee" <hyc.lee@gmail.com>, <ntfs@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Date: Thu, 29 Oct 2026 14:17:56 +0800
In-Reply-To: <374bf856-f880-4fa2-abec-c4b2a063bf57@163.com>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: Re: [PATCH] ntfs: wait for bitmap folio writeback before modifying it

On 2026-10-29 10:07, liubaolin wrote:
=20
> Hi Shengzhuo,
>    Could this deadlock during MFT bitmap
> expansion=EF=BC=9Fntfs_mft_bitmap_extend_allocation_nolock() can recurse =
into MFT
> record allocation while holding mftbmp_ni->runlist.lock.
>=20
>   With L being that lock, could we get the following interleaving?
> A and B are $MFT::$BITMAP folios; B is outside the cached iomap.
> Time flows downwards.
>=20
>   Writeback                        Bitmap expansion
>   ---------                        ----------------
>   lock A
>   set PG_writeback(A)
>   map A (take/release L)
>   add A to wpc->wb_ctx
>   unlock A
>   [BIO still unsubmitted]
>                                    take L
>                                    extend bitmap mapping pairs
>                                    need another extent record
>                                    ntfs_mft_record_alloc()
>                                      mft_bitmap_alloc_free_rec()
>                                        lock A
>                                        folio_wait_writeback(A)
>                                    [wait for A's I/O, holding L]
>=20
>   lock B
>   set PG_writeback(B)
>   ntfs_writeback_range(B)
>     __ntfs_write_iomap_begin()
>       down_write(L)
>       [blocked on L]
>=20
>   Cannot reach iomap_add_to_ioend()
>   to submit A's pending BIO.        Cannot release L until
>                                    A's writeback completes.
>=20
>    ntfs_writeback_range() obtains the next mapping before
> iomap_add_to_ioend() can submit the pending BIO.
>    Would we need to submit that BIO before taking the mapping locks?
>=20
> Thanks,
> Baolin.
>=20

Hi Baolin,

Thanks for the analysis. I checked the paths and agree with you.

Following your suggestion, I prepared a change to submit the pending
ioend before obtaining a new mapping in ntfs_writeback_range(), clearing
wpc->wb_ctx even on error to avoid resubmission. I plan to make this a
prerequisite for v2, retaining all six waits.

One concern is that submitting at mapping boundaries may reduce BIO
aggregation, including for ordinary file writeback. The change has
passed object builds, but has not been runtime- or performance-tested.

Does this approach look reasonable to you?

Thanks,
Shengzhuo
