Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388760;
	b=4hE04kru4wKR8GXwcTPeRTz6MRTnR5qiYnKPB/ikIZomtBNhXU4kEmSnk/Bau9aCJ/YV
	 bQxGst1n0GJdkm/UQH37Ypr705fFH05fMQ8VokRHprnbFtWfiNBBM9dxitOqDX+7U2F4L
	 eQ1exkiBbawnFMe1MN754I3UdfHKLvs/inH/3XbBEsOsTN1uLMJAK4BVIamNV+g7aqMZ9
	 cSsSXueaKZSVhepBpfnbK9epLs+s5oYYquSbuMo3JBHf5Bg5+IlRoXFXETYUp2i9i9XGd
	 qL2lXR0zLJP9GC9t8LuSiOmZ6cXYsl8QeNtKtSmC8RgnVtkbyon4UZ0fjux7mtWiEFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UricF8dhHQUK8+p9bWTkhzvIESEgdx4WPZL4PB3uCxs=;
	b=xVzBZxsmz+T4sT1wXQ4duUOIflEZwIlaqTWtiZZefFhMkn70WTgmFGCXvG39E1f0iIYB
	 o1F0BBAfiJuE1ogPPkoBtAqOw55dNF/8C9QBTQ7BYjbJqOZX8Dc+YlHy6Y5pwONs6PybL
	 EABFX6/+6NsAy5EKKA11+nU7+V2v5kJybtzfpUYsOVMB+fBAZAZzc1IQWrv9SfNTZ9kRd
	 46+TI16yGzVn1372eprXLHJJkBuyK4mkYzyunqMh4p8dRl4AuroRT+sS+ygHOO8vfC3Sw
	 9iX6YpcA17aDQtuwj6yuR/Epzll1S45pho8f4MHgM2LOH0gA+YxjVZ1GGSUDJ+QOSbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcnx4+Rr;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC87606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC87606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcnx4+Rr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so702292f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388759; x=1793993559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UricF8dhHQUK8+p9bWTkhzvIESEgdx4WPZL4PB3uCxs=;
        b=Fcnx4+Rrjm/nDD6WRKlaJ/WARw8uNp8dwMJ8dIK2HrDazIIxcNwGPqJYgQReAIIYZp
         923FMZkGWT45Hw5bE0d3rw0vckjors7BLX52pO+3Td0x4Svb4WybDyyfL5NHykodrDVi
         JvbBN1DstKTvCagQOTCT/doNsjyybEF1DsDxMviyPE1r64cght6GZzG418wE7Ec8dmdb
         nlHm37TVAG0GA/dJCeaikSZbZyFGR+cAG7LZvVQFlMfNSdT797XvhSOgu/TDnM/qLYVd
         mVj2h+9/xRbB8hTYNpl7KHCB9g1lecWiGvIIWU/lIJbGQCMxzgsQv2a3IWkywnhCKDRV
         MZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388759; x=1793993559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UricF8dhHQUK8+p9bWTkhzvIESEgdx4WPZL4PB3uCxs=;
        b=QAMJ6QlCGDYFHwx9wvCiXGmy1wCrJs0l27gxcEottBJvgg73Sp0YOzHxak/pI4HX04
         8cD5WpTsD70VPLWqExwCGJPRGHBKOq2vjaYq6OfkDtfkCqNumX99kamIqxrp/CofJHBR
         BsUOmVGapo9qvSlV15IORcn4InPBVBi8QrGn8KjSbkH5pm9wHKuYl4O/jO0UCOVRI3CX
         9nKfy3oTmPs5cse/vwx60d8kNr8f67aYRLFjv3rvmbwDnfsZpPldOS8Hom21PErY3TOS
         SE5HF0MPHC9ZCe6/Tq8fOo6HEj5VbsU0ot/g/g+FUTFq2jMuWJADFY7IxhmsqdhMjBOC
         ncJg==
X-Forwarded-Encrypted: i=1; AKwUvBzscj9MeH35vh5Qgo299YOJnr09/iBrMvYJeN9fRJgi5KYe5Bqz/vQd8feoAKNenxyqf80rRr9kRwnUgBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLklRXj5IfF0g4WaoB8QwoLNH5KI7mhTbcrgMGSEd1NxnexbM2Z
	1Tpu8g0NHigZKeOn1lFOnTgIgTHsU6hyhVvLupZ5QPpidNyXmorYGaI=
X-Gm-Gg: AYBFou3DaMDFBYu9ihefm4s9uUD9Sy2niIUdnw20819zYvmpup5zpT5CMdwWEWkmAYY
	T6Vqs6Y5png5YeS7XEgnb///qRfMJ4icMaq4/L4K3PcHXrPVz+uEwR90sfzk2Jhfl6+LIMHpsYg
	gKDqpn/e07K55uZmWnKuevgSeaQonsSmzpz03s1IhEXR8KGPuIir2UvqKeB6tcBPc6JOxUzhI/O
	LG8Nn5EzqfFW6NCVwvtNAqgw0BSqaikS6DE6l3zRN0q6nekY4IzHTgaraG7ljXw7NY3bQWQ8w/D
	VFUs3VhBUZ1K7iF5FzxfMK+iCxfDuq0zt7c90zP77ApKZTROW4XFV60guwwJ9WVXN9dIfHV7BqN
	Eo9f3cPH5Hh3pyHkBvDY3941GhT1GMfx0lJ785I28JbcCIjdZ9czn/HcLOPISCjNCpmLxyn/LEq
	jOZZzMQHr5I9BW+8RgLu0taLBB5vWI+vsFf1iDw0itPEC4ULUxqQLjMxroKWgi+xjAp4zeX5/kI
	hC2LofJIqe9Pmxp81UFW2dQJV83KjjU6eypIgttQ6wMH9RqBt7bgVGQVSu+DvpPyZk5r/DdogrM
	DQhTAlo3zRU=
X-Received: by 2002:a05:6000:615:b0:48e:5b50:9c52 with SMTP id ffacd0b85a97d-48e6e4fca88mr7640794f8f.57.1793388758641;
        Fri, 30 Oct 2026 12:32:38 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm4799150f8f.27.2026.10.30.12.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:32:36 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v10 0/2] RDMA/rxe: copy send WQE to kernel buffer (TOCTOU hardening)
Date: Fri, 30 Oct 2026 19:32:33 +0000
Message-ID: <20261030193235.3470653-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoftRoCE (rxe) send queue is mmap-ed into userspace, allowing
the requester and completer to process work queue entries (WQEs)
whose fields can change between kernel reads.

This series copies each WQE to a kernel-private buffer before
processing: patch 1 for the requester, patch 2 for the completer.
Both paths validate opcode bounds and SGE indices after copying,
preserve DMA progress across multi-packet operations, and write
back updated fields to the shared queue via WRITE_ONCE / smp_store_release.

Changes since v9:
  - Patch 1: check dma.resid != sizeof(u64) instead of just > to
    also catch undersized resid that leaks uninitialized pad bytes.
  - Bisection fix: move qp->comp.comp_wqe_valid invalidation from
    patch 1 to patch 2, where the field is first defined.

Tristan Madani (2):
  RDMA/rxe: copy send WQE to kernel buffer before processing
  RDMA/rxe: copy send WQE to kernel buffer in completer path

 drivers/infiniband/sw/rxe/rxe_comp.c  | 76 ++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  2 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 72 +++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_verbs.h | 12 +++++
 4 files changed, 155 insertions(+), 7 deletions(-)

-- 
2.47.3

