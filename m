Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBB3612F8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838913; cv=none; b=lBot2N0g3ccr1kZmldcNax6bof7PvpNlNAtocNmMfhWbD/bRCyWkA7drWnbe9B4VYm2x8hKWV2K7hJP7FZUl3uq44v0k7Lof0Yz71hwm/LtcFjb6BGh5lvRN87MTICgo0FHVBVnhEIiRPtWViCXgRAEr2qURmu9ZuFrSSJbpmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838913; c=relaxed/simple;
	bh=QdkH1sPnplYF6Fo3zBu8sx+rSVQr006cwjiCJc5/pmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DML1xoor9t9iykWLmDLOByerbMWYbbTeYhEVELsGn+q2gz+arsfwejFgSu6QkQlV+05AztDFyH5EkWCfV0hHpSkqRypUj4DWC7iFxsR9VRLZpU4MeUHunI16cq9gKFQu+L0IQhgkWiw+iKQ+eFCDUAkqurXKtNw8JeRSeh3yU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZvt7WS/; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZvt7WS/"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2dae660f31bso27718655ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788838894; x=1789443694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THA2lQIDtN1IMSLerCBySjfz7rEAuxrQfCu6ehzIHp8=;
        b=YZvt7WS/kKG+JPZ5uDZxg0GabMQ6ijuvwA0X9IDjZbeISE39Zo1E+bPFyeqDn8JyQW
         l30SjXA6gs/IBn9S1Mz4jkWBYmimO2GfY6Bgby6eGme7fjLg+/lB+/m07iC0hZ203hBc
         Zvy2wjqrT6HHyzHFWmk09gBFP7zVX+DU3dQ3hYE2mXeSm6LkPNRNMQwLQ55i73VYskU6
         HrBVfDV7hWz+06pZx1VlfZu9JRkJeXIZEjYz5iVM8rytLakPx6idjiGln/A7Gh6orr10
         hOZt3j4ABLBp3qeGJN9jh5jJV7fvl2u5nxgQNiUPnV+GHudM5jmDvmUrfQkAqD5UFwk/
         b92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788838894; x=1789443694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THA2lQIDtN1IMSLerCBySjfz7rEAuxrQfCu6ehzIHp8=;
        b=Z/w4IOKIlibZxb3jUKneGjGU02tegtq+rUYjcmLLjIzfO1vWzOQ065DiSzQq7m1Cwh
         x/0I/WYye1a2BK5BviovRhCrCChZ+Ld7bPEcyFtvI8BpDdkAmXh0MKAlB1rQXK1wO7O5
         jImRv3EQ+pH7RK2y0ZPW/5md+kvgDAJuwXi1MyXKaiUD2Rgb9e7i/xRNClrr6/t7kpuG
         sg97kTp/++LCJqpSMXUxQm61YTDQyKiSaiXhhKXPPC2/CWqX490Y3xEDGcs1X6boY/Mg
         hTt77Nv3ykWrX8y9UrbPggMNpxy6fC/ubBiTRK3Z9ZJX4hAfOOBC8f0bMTwA/gCiqgvU
         Y+cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5xAtyo73wqIaBCoatKjjtYe+87rzbmXr1wfx59UYwwDNcLlKc6zhEN+S9dKj2/NftqmVqEdcNLDSu9cc=@vger.kernel.org
X-Gm-Message-State: AFuF++lADHypI7KNrnnBouQQzeUJ9DpQSKzXBSfyqdwaAQU51/o/qBmq
	GC7DTuRse05fAVc7YSKD372NDQLclBcoyW8ooLCBmOh4zepxMpBON9Z/
X-Gm-Gg: AYBFou2ll78srkoRGvDKsGE57x2D32w8lDaRAt7Ypiy3vyYXPjBnIvNe/yOa/yzo0Oh
	rlfqmw2uiGyZ54mW/sHFjwocqw/9dxVlIbi04qN0oPlW0qZ0oSBbVj0PW+r48etROy0SaTuXm3i
	CeNX7TauzzcwnK9bxUpZtjV6o61I96vwEUj53WSmCuZZhK0MmvtaeeJy0EB3LwluValBu0YDkzg
	Ik4t+tF0DPHsEDVHVNRHV626ZZzlVi8mdmC4kWi+9781UQSaM3xvSnnRN7EZ96N+3DWJvjqd51U
	GT5IyOEBvPESKJNcSWFXU0heuJt+Vd4Rkh2bqV3rkoxbRy6y+798ALXvoE7xY1XKfPtT27gAMh6
	m4XInP6KbDftHTWuZD8U8Bcb3ERGHfVYhEVsx112Ya8L6O5pd8JLXq7zOVHJUzyZ6H9Pvvaw+Tc
	OYYOzB6wAh+ixnU3tD43tpYqouOAbrOifMMDvD/3R0VMutgoFPVgBWRmvm0LMPLCGDh8H9Pbn09
	wWf1pzOp7Kac3r1YLhi2LEPYw==
X-Received: by 2002:a17:903:26cc:b0:2db:56da:6a0b with SMTP id d9443c01a7336-2db56da6ebbmr159927625ad.13.1788838893763;
        Mon, 07 Sep 2026 20:41:33 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ccf2esm51691435ad.73.2026.09.07.20.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 20:41:33 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: extend folio state for large folio write path
Date: Tue,  8 Sep 2026 11:41:26 +0800
Message-ID: <20260908034126.3251396-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
References: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 13:51:06 -0700, Daeho Jeong wrote:
> ...
>> +	ffs = kzalloc(struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
>> +			GFP_NOIO | __GFP_NOFAIL);

I think I can use f2fs_kmalloc() with __GFP_ZERO here, so that I can
exercise the failure path with FAULT_KMALLOC injection during debugging?

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2616,5 +2616,7 @@
-	ffs = kzalloc(struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
-			GFP_NOIO | __GFP_NOFAIL);
+	ffs = f2fs_kmalloc(F2FS_F_SB(folio),
+			struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
+			GFP_NOFS | __GFP_ZERO);
+	if (!ffs)
+		return NULL;

Thanks,
Nanzhe Zhao
