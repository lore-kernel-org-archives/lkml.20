Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063123D4129
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053321; cv=none; b=e4yA+WIoL45jUPT/2pfRfB8tv4DIZIj9vbANkFNE4DRIdtEzi/wW4ps6bSgve80qDGZmnRP3nhdoix4x6fFrAwAAL+uCaOL5HkeaHRW9tURuHP6Xt1i7mJo2AiSgtcI+vSkdRVFy0IBCkC6datGAe9nGZJm9K+XzFAtphWR+7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053321; c=relaxed/simple;
	bh=lUICuLESBtkM0X7epzoFt1RC37YnkCAQg+0z52o2XIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PuEj4lRN3hd6oghS4RemXDmxopb6Jq12T79UGQFucZVYELIuNBaFoBOnnmjj25Igfg5hoGJKw3lc731lM0Z/JMlrNhzW9/uFePJH0GV8wtTJH+EUQS7LZ0SYu4FiuGXageal7+UIzv54InHARMhkZPPDm6WpWBxN32iGEU+X8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp2YDkX/; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp2YDkX/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5090480eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053319; x=1792658119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tYUrE8fehM3iGmpifaSflPWbnfTAocKBP2BzOPGoLZg=;
        b=Kp2YDkX/EccNxfg63LBfYe3S3h1TE1ff7V6RAVJkwv8pgdYLod5iQnVuaJ+ePlDXDC
         nXZJm4nnzJdqSvxixBp7NNc/Ltr7q5EjkTWuZNb/FR6A2r/gPwIIUbF1i6fb3SSSWfmB
         Y9xZCEph2y7FQ1gQYHi37CIwt1uOgpCWQUmPCk34S4TCuklHAsxnx4DLD4eWp2rZLln5
         PbsKZW0lPVASzBEottDgS/lrJQ9PuMk/k/cqw7kwqQrGRC/8zf6fJjXRoFmcdL2brZnf
         quJZ4e0NyP8Y6mIVxKEGQI1ReeVXKL7f2es4QVMFOvFCI8IPUM0+t3Hop1DY55gzXD3A
         jG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053319; x=1792658119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYUrE8fehM3iGmpifaSflPWbnfTAocKBP2BzOPGoLZg=;
        b=VEJnK7q3VH8e6gRjPozmKVJZiIUBsrvG61RKWqjMb707hvzTBTaC2WBHXQivDE70Ry
         8LF0dU8maOWNfkKNyV1lFjwwcjFVd3plxGCZqXMquy+2PE3pjEAb6JnhUVZCkAKLkOzf
         eAWlpXtpFoz20j9V1Jx12rbDV81PH/VVRT0WQkEkObZz3Q+mLF4U3umv1rgLGsz86v6y
         xS0phw34F3fbEVDCJWYcnqxfrtI/DGZNYSsNe1NOAsxzV66ptVBwIYvk+IBZr8tpVJaP
         DjdNAG5loPCivEIJzOUaIcsxxDY76hn9Inyr/MaBpi9n7t6L70fwo2Jcjlg10cpcerXP
         9QdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfUzK79iXvl3Fnz9vorseDaPaI8trAAgQUKwy7KDgCN3lWItajBN7NwfPqs4kPTL04zYZHac8/dJ+kl38=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+fi6XDrHPGhp6qpGui/wKjbsjoQnXPl3xF6h+R3yh3M7hX55k
	NyKTbq8cXKjr0uwpw7OtLy9n704pj7j+GT8tfzsStKf9yKD8JF2mmG8Y
X-Gm-Gg: AYBFou1tl8+MrVzFHUul5qAWo0hF2g9hv/9bX4MPf7z+5o9bjxA9EujOnbw4YfrNCzc
	sQUue/YPx8lZWEWRWAPLnkSswU00/MmUye+yhQrQupkKzSuLe5XMK4uyRqK9st/CISXpCb5ypGY
	1Ea0ODmXRPkRElwiDmHNSE+jdcuWBntZV9MRi/JTjjGzbwjecJC6JfRY8hgsu1bRJ9WFIWNvdmP
	L+ymoBmnFoCzZY+8Nu6+wTLQla5D3tlufdNODDGMxzmINisxkE97QFCjsFUEthv9s8BOJ95I8Pe
	R3AW3kQKukICGmz7Kn4aEmBILQ9Usoy/qUtehC3BkvmTZQCxhljoDBq+Qz0Gi3tR0iHc88NRLj6
	y5J9ZTqrszOt4hpkZw0htAnFwCp144CsnzE8S0XCQ58Mk0BZ13chccTG301ElU+jSYtUrJt6UDb
	DOXRuwJwc3G8nT9UX1Fdmj2yjuCUl52hB/IZHCj0/KMADrUwSaPajNDsF4gSGWjp40vgx0uCbmf
	gpsUmDATl8gLmsgXVkEnvXvFnyRNgPtFJSe
X-Received: by 2002:a05:7300:e9d6:10b0:354:1db3:674e with SMTP id 5a478bee46e88-3541db367f0mr26577812eec.6.1792053318741;
        Thu, 15 Oct 2026 01:35:18 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm64539101eec.12.2026.10.15.01.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:35:16 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daeho43@gmail.com>,
	Daeho Jeong <daehojeong@google.com>,
	Qiuyang Sun <sunqiuyang@huawei.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v3 0/2] f2fs: fix online resize state
Date: Thu, 15 Oct 2026 16:35:08 +0800
Message-ID: <cover.1792050467.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Online shrink changes both persistent SIT state and the geometry used
by pinned allocation. This series prevents old state from surviving
those changes.

Patch 1 drains the SIT journal during resize even when there are no
new dirty sentries. Its code is unchanged, with Daeho's Reviewed-by
added.

Patch 2 now consumes the reserved tail as sections are removed. This
keeps the pinned boundary fixed while shrinking within the reservation
and limits it to the new main area when the reservation is exhausted.
It restores the old tail and boundary on final checkpoint rollback.

Changes since v2:
- Rebase onto current f2fs/dev.
- Reduce resizable_tail_secno by the removed sections, down to zero.
- Save the current tail after freeze and restore it on rollback.
- Document that online shrink consumes the reservation.
- Retain Daeho's review for patch 1; request a new review for patch 2.

Wenjie Qi (2):
  f2fs: flush SIT journal during filesystem resize
  f2fs: refresh pinned allocation boundary after resize

 Documentation/filesystems/f2fs.rst |  3 ++-
 fs/f2fs/gc.c                       |  6 +++++-
 fs/f2fs/segment.c                  |  2 +-
 fs/f2fs/segment.h                  | 11 +++++++++++
 fs/f2fs/super.c                    | 15 ++-------------
 5 files changed, 21 insertions(+), 16 deletions(-)


base-commit: e455328a66a5f4827d4ba96acfe50dbbb0e13b8d
-- 
2.43.0

