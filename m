Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592E3859C2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231235; cv=none; b=OIoLJuk2FxLMcRdX8aaWEu2KnkZf/+uw7DeIL/U6tHy6si8eYN4Nmu2FEXaw0SHH9QM4ZCRSUqR0+kxWiRt2X+rJQ6c2UqX/UYvh1x50e06xEnpI94S0hoHakVZDOplQso97hRFfad1gIY4YNl78FZArHYsQbnNokzHrzfHwB/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231235; c=relaxed/simple;
	bh=hnhudaSsoqw6ovaSVsUuE3pS2LqCa0PRcmc82+XnLus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJUxMNBC0fxvIpt90tixxaruBK5PrRnIC+f3QIjAvK5Pa+GoR1f9G7PWT7GJwTGT+RpBXYQi2HSh/FjszQxSf0igXlSPPK5a8te2Ft6LWhDzvyuLkuJuM14hoP59dCEUvBPv6Dj/J3Yh///C7hYb1S4YHGpuPkvr03sJqPAENrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ud3WILZP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ud3WILZP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceab75934dso49905285ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231231; x=1788836031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnhudaSsoqw6ovaSVsUuE3pS2LqCa0PRcmc82+XnLus=;
        b=Ud3WILZPbD/PuGdJMqvRuQlDKhYCcwDJHACTfifA/Y6LErrqDNRSguc520+/G1vBwa
         iiCzRNRl1uAyx3wQXORsHzlfvwQNdBQS2h2i1ldZ8IEGX+rcNpm80+C26+EmJ3ZWneau
         1hG54fuw+cJPjSeIynDz/REIGuTBRU8NE6Ve9i6bThakgdKntjlz1I1+3Pn2XA1FMJqi
         Gny/ufvvgrjaZoCfklUtAkfQsg5RcYwkDFAvB+ZSCeOq4BRbiW6cQH5m9iV9jZKfWxr+
         6b7kgNyJ3+77NgVnudxaru6edymQn9bL9Mh0ERvxKgGhpsMWcoPLUmhNFd0bHdObQHVq
         vv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231231; x=1788836031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnhudaSsoqw6ovaSVsUuE3pS2LqCa0PRcmc82+XnLus=;
        b=nC8fxoUdl97E7foDGA0SskO8zvLlw1Ps1K16RHE6qqjsGxWECGdEM7f5IsDu2vyw/p
         0l8lPMRiZBVXxMBOFa2BJnKG+bEMR3ktCs6kBYUZU+tEXxivRCCyrmo+jv685vK//eVy
         oIyifoSxvXrvx9uA1uY5M/TpFIpkiFigyOpvfzg5n1rHAOOFMNShkTv2okj+PU62YDcT
         JIBpQUuVpjFpVtCSNTIfxU0vdjgTh/f8qBo5Z+FPnVuUnHttg3Mhc0RhXRunIRQbWHPQ
         Jl2kuXAhKMbzTrPwrpD8HvAnMXeMcYyVrS13ry4GT6zW244B+JKDbdMY/u43VvOGgg0+
         IZTA==
X-Forwarded-Encrypted: i=1; AKwUvByJCUugyjzlhm3q+Md+bWmXE4K5zcHBR6CB3PQAHXn3bhZ0yZErAUwr7ZnxJ6ZpFMBRgF4vVwCaCr1BTP8=@vger.kernel.org
X-Gm-Message-State: AFuF++nQFB6b2YyFwDCTZ8MSGkodUtxZ36M34Rv4tBUop9jb/ooz2xWo
	DuKJxboY00a/6veeJBWCxur+kEXRrrIAnwFidd8c3/qna/8eyFRv9Sf9
X-Gm-Gg: AYBFou2d0xnZbN1cAWTn9gJilz845ZLZncWWh+Hyopn6j4UUxD+WdO/vH2N5jwl/N1Z
	M5m1pc/WDKARFsQcdR7poMQhUhNpNDM524PP0+jRUjwhJipcwXHLWx/JTp6qNF4Cm0DiXoPCcIq
	sLcIHc6OTlPonMe9MrEL3jlfsKEGdExrcxm1OysxnSw9aAZLzZD9lk9c+38HxBRlLikSmQ/Qqwb
	sca/PmjxPPDLJ+5Vvy1O/QYW4r3edd5upShrFJ07XuPgTv5UeQg/9sYb9PP11gT9Cv4Rg/OlHtW
	bNrWTi18qM1aJUJtUJ70dyz7nGopAYpbHFqAnXujKJmgsAO4fbLDA29QUv7AvuIJCJBCAd2TY58
	ERKM1xuHQzJPHSFrClxCPLdsOeG+KP4knVLN/hBX9hri/5UzJtP3wB7cK3GTJhlWUcJTAFQvxJB
	67mZzi546B6PAz2YJ2M5ubWaOsChunMGCXn8bk3lb6nqUbMQ2X8VRO6RwJ7EKgJvXyzSaxeIy5C
	X/fwo52cdHvHzoW4HMVQ7GZNw==
X-Received: by 2002:a17:90b:33ca:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-396d0a36c74mr43300056a91.0.1788231231053;
        Mon, 31 Aug 2026 19:53:51 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4c2bf7sm3053009a91.12.2026.08.31.19.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:53:50 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: daeho43@gmail.com
Cc: daehojeong@google.com,
	jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Tue,  1 Sep 2026 10:53:44 +0800
Message-ID: <20260901025344.3466776-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_z1UUG0e+LSGmer_mPv+YcYVcjFiMLZ6RwhmYtmrObKXA@mail.gmail.com>
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com> <20260829060524.2656620-2-qiwenjie@xiaomi.com> <20260829060524.2656620-3-qiwenjie@xiaomi.com> <CACOAw_z1UUG0e+LSGmer_mPv+YcYVcjFiMLZ6RwhmYtmrObKXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

The second check is intentional. The first check is only an early
validation before mnt_want_write_file(), but mnt_want_write_file() does
not hold sb->s_umount. A concurrent remount can therefore change
resizable_tail_secno before freeze_super() obtains the exclusive
superblock lock.

A test-only hook pauses resize after the early check and before
mnt_want_write_file(), allowing a concurrent remount to change
resizable_tail_secno before resize continues. Starting with 506 sections
and tail=1, the single-check version let a remount change the tail to
128 and incorrectly returned success. With the second check, resize
returned -EINVAL and preserved 506 sections with
pinned_area_max_secno=378.

The first check is the fast path for invalid requests, while the second
check validates the final geometry after freezing the filesystem and
taking the resize locks. Both checks are needed.

Thanks,
Wenjie
