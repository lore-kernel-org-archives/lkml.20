Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBE40DB20
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140915; cv=none; b=ghgdaLGBcZZtRtMM6qmsntEUnxouLJUimR2Ga/XAWd5sBETBihBx5PpzzRmY29P9VYSXwJ9bQoryh/FJow+3J0RI09+if2L2KTFe9EKUFre10cvC5kEFQ3JqApkJDQrL8bWtTiQ59PHw9RADHriMd9jWNqIJ2qJraRAEdwL0gKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140915; c=relaxed/simple;
	bh=+eVTntLT3QqtMFBinH1XAX836tRZHGdYO7FwdM01I4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ivTb9fpamkjFLCyD1Oo8iMM4iIYKhIPWr0ZjEZ74FaBSkASO9CUgVBrIs8jPuEtdOPROwZGY5ETSRdfi8amSoBHOw/vMj6cry7jvhaS8QGHCs9WwMzR9oTX5LqjvKQ6wVR0RE8za13AFHfEj4yyE4S7Y7KELdNy/lxB89MKM/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ATdN7VjF; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ATdN7VjF"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso3275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789140909; x=1789745709; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ukXt4wICo81B+vDlkvqsOUSCqK9dAPsJMwYOIeIlNzs=;
        b=ATdN7VjFLhiS5vx9CcprLrWzedYeVK+2G12zisTwGwHMfneAp84v8qNi+iTmrFIQw9
         39Hm2qqdqb9vOJllzG8eH14RGqxOcKmx0GOrvYvb786OWyaq198pbzT+7RvE1lSeLFpO
         zAZElmzlFEJx5knfJ4f6d2EFjXKi29jpX1ojio9LX3ttS27637owowcOsrsN9PfhvDNh
         lsb6gf/fvUMjesg+zb7bcGlvap7C8lI67Q+EwLpwsp7cMIg89hrGJaP7agXhdr70wj2q
         AtwKrlQ1hhnpO8OduOObp8ftBcD5Bmm2+1UFHFrnqE0szzfikPvuuyeL/HE5ZxLukADr
         MLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140909; x=1789745709;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ukXt4wICo81B+vDlkvqsOUSCqK9dAPsJMwYOIeIlNzs=;
        b=li2ELMqXtX61T3aIYlxheaPcWoMdmlr0XVLLeSfbKcO/rCBAQCuX8+8Z3TXNaqu2JP
         qG0ATOhmH4NEBFX2os3PK86K8hrrLfa6ytf2zYvHzo21cW+th7G13JEUpkzOIUyngVhF
         l22cpwneZadXXyRtfh5sVrwMZgdPb4sDej/D3r8PWHbd4zTPUVUeXHQzAy1/VBqfBkK6
         YxPgiNJNZ1TtgN/r2OXuIGl3PdNSxXJ6dINGYIcW0TEJKiP8XO1+GDB7CmgYIpVMhn+f
         IoDzRd0an7jg3zW0nTKNzp7G77rSW7hkvuLyiPeY5MiYKSSJ4CqnUXqmqRCIjeoeQY3v
         QLHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHLsDO+FvjPBiqGh2EkqPYuur6Z2AlDb7Rt+NHAb7WoyXNozNgxTNr0V9bFuzebyPfpdfjuAN301uMvfo=@vger.kernel.org
X-Gm-Message-State: AFuF++lKfUhetEtknepYorgZ6M167gsfzEpuE/gJmYRXUv8oqd/KDWqF
	eOoKsWAImTP8XgUEaGW5vTvjxnQ/Kd0KPo+2BOY/vThnlWyVg5VVAHwmXJHdJumHCw==
X-Gm-Gg: AYBFou1AzdabtdAb71f4B5uBGJAZhiPs1ala0AsAZ5bpYdHWvD88/2DYGG5ImSfGtYZ
	D/m9sgkJBFeV3En6XqnX/K0AWmwPfxUHs9NMLm4HjZiLdDf9oIaB861qw5OllJVrpEHBDD5y6mQ
	JkSpZBFSWHPu+eNDdKaanibP16zdt5d1ncd4/LURBkKJQhru8XPinPGkQP7WxvUs9yhkEWjyGT/
	1jd9EFqbh63XbWcU2p/VkiYqhjwS7hwyJLDXRG1J0MQADyuhgKXkh3Q85JfMHLhY7IJjpTgMstw
	NXkub3Un9rCFpvULc23G1PGI8CSBNwK5kBhJzOMbxwtHqNSGhRSjOVUOGFHmCgoNgHcVlKPDEqK
	wbWpObRt85YAQD8sDtV2Fpwlu7TKXLYyu+L/rHI8cmsg90lgpWcKcvUh3QDr0wdzrl8K2YdjM0m
	y9kYuXCeiNOkg6dgc7gdP840y4BpAftEVFqoCYJojGHrjya3fqljMCgB2v3SANSUilwJ1al5mz/
	OTmQQrgtNCX1Jk56V1cYclbquB7BScU6rJqv76cgJP5vJQmhgTi6eTTLFg=
X-Received: by 2002:a05:600c:4f07:b0:49e:65c4:5539 with SMTP id 5b1f17b1804b1-49e65c456e9mr571055e9.6.1789140908788;
        Fri, 11 Sep 2026 08:35:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:d3e5:e8d0:cdd7:470f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62cffaa0sm26798965e9.0.2026.09.11.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:35:07 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:34:40 +0200
Subject: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array
 slot
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
X-B4-Tracking: v=1; b=H4sIAI8fpGoC/yXMMQ6DMAxA0asgz7UUQ0HQq1QMEJxgBlMlASEh7
 t60jG/4/4TIQTjCqzgh8C5RVs2gRwF2HtQzypQNpSkb05HBLYh6dJOoWzGJnxMr0kiW2u5ZV6a
 GnH4COzn+23d/O27jwjb9XnBdXzbFEbp4AAAA
X-Change-ID: 20260910-uring-fdinfo-tighten-1b1c18945305
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominik Maier <dmnk+artist@google.com>, stable+noautosel@kernel.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789140900; l=2305;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=+eVTntLT3QqtMFBinH1XAX836tRZHGdYO7FwdM01I4Y=;
 b=BO11Wx2rzUqTAqS21PQkjVLo1Co0Nv0ZxshMdUrMDm0VuN13vHliNARkHUFC+YwS7M7t9bAyG
 hyPAfKohDn5CuwXAYAjfC9/Z0CEZr948kP5ABTzP5L0k3DlFAEHnyNe
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
contain a cqe32 entry. If the CQ tail points at the last CQ array slot and
the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
the last CQ array slot with a dummy entry and make the tail wrap around.

However, malicious userspace can directly set IORING_CQE_F_32 on the last
CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
half from beyond the CQ array. Change __io_uring_show_fdinfo() to
explicitly ignore the IORING_CQE_F_32 flag in this case.

This is not a real bugfix, just tightening the code a bit, because:

1. the number of CQE slots is always a power of 2, see io_uring_fill_params
2. the ring_region region consists of:
    - a 64-byte header
    - pow(2, N) CQE slots (each 0x10 bytes)
    - optionally, the SQ array
3. the ring_region size must be page-aligned because it is shared memory

Together, these properties imply that the last CQE slot can't be close
before the end of a page, so the "out-of-bounds" data is

Reported-by: Dominik Maier <dmnk+artist@google.com>
Fixes: 82ceb7fcc5ff ("io_uring/fdinfo: handle mixed sized CQEs")
Cc: stable+noautosel@kernel.org # no impact due to memory layout
Signed-off-by: Jann Horn <jannh@google.com>
---
 io_uring/fdinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index 3ae4804765b9..0b656a6c8428 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -155,9 +155,11 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 	for (i = 0; i < cq_entries; i++) {
 		struct io_uring_cqe *cqe;
 		bool cqe32 = false;
+		bool is_last_cqarray_slot = (cq_head == cq_mask);
 
 		cqe = &r->cqes[(cq_head & cq_mask)];
-		if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
+		if ((cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32) &&
+		    !is_last_cqarray_slot)
 			cqe32 = true;
 		seq_printf(m, "%5u: user_data:%llu, res:%d, flags:%x",
 			   cq_head & cq_mask, cqe->user_data, cqe->res,

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-uring-fdinfo-tighten-1b1c18945305

Best regards,
--  
Jann Horn <jannh@google.com>

