Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050C1146D5A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743720; cv=none; b=A6RhXqEk1WMUx1DLlKMe42Fm+ua1DnfzhRNWo1Fk5j01138MPz5erk32DCUMTrK/qobQHwxy8ViFHBw4f3s1KWR5IjJi/ujiiy/wR76xCUZGCqkI8lPPdgz66OPo6j96OowYbHMTvbL5SaQFkS9vTV1zb7yymIXyqrKVHSz+CKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743720; c=relaxed/simple;
	bh=1o03/ndP+4oh6D/3IEGgeqs0/5WU893jqrOxWHnIJBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgTTHMZZ8UbmibjfYQZUJ4TKpNhLNNQzWxh2DZbPUWK/V1GqOOh/KgKs93aXmZvtTCI1oS3ajsdDWdF81umvuT8NHkT9Shuzb5OyG6gfXGcX24tIitAmrUEgzQ48y9lxWrg2DbSsVm5qSH0KaC1pj+DxZcHx52my9EQ/NBAh7Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMYBJ+gd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMYBJ+gd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1543930a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743718; x=1788348518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=HMYBJ+gdUD5F7T04sYU8N08D91Dlp+jaBKsmPQo35QLSpI19857VYNTkosB3fl95F3
         Ms7flQFySmt61/98osNvXB5GZsBwPM6rMfQTyF67V+KZf+nHLKSdelw+e0CDNXoef4ge
         KbqPRz6ZVGvp1hqNvyyTPm63awYgUg4yuqDEDZ3JUWKDBL3tFiKU/ZUAea33fZ1ymJOy
         dk+E7AuDemkIYcb+cvINWXWH2a4xuP2VWTyMANave8S6KvplIMCwi5C3yB2bJvRKbue9
         HSNBXBs15yN6eiXdCAL1NNBGXaDxf2vO9N2xTiEjLtJrUYAVgAiz9lm1D9PEObNmi/kL
         Tfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743718; x=1788348518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=aj2Aqnfy+JdhYwH5ZhoLl59GGwQ6+MECNojh/TTAx68qVsd4ig1wc875fa8h/SJDbM
         LSN1nNftOtmLHCT73RwkCiH4I2o1hMWzbHHrqcTINJba1vI4b/ADsQGlQt9XT6Q9VxSZ
         +RcdrwBfL+Mr/2/yDqBP6DFMa/TfTCbMq7S0np7vHrUSl0JMAeXlbIUYUDh1FdG1ESAk
         LZrFJvKeE6HVBJBwaoKxw29/26erVEGuSy7Rx/6ndKVDJACu2hvmGXcvzBv8mXhxAght
         Z5+p9QviI3iJOjkzoUcUO+LRDvB09wlKYt3uGkY4uZQkSAgMSBOCqEw1hXdQChd5dENq
         Vudw==
X-Forwarded-Encrypted: i=1; AHgh+RoqDWMn8oK9iJ3sVq7JH2WEB+qL6c/mwZru93g8PYGnl1Oh+r4gpfXhsqtGJ0kpBD37WT9n+EpInGDLGHs=@vger.kernel.org
X-Gm-Message-State: AFuF++lVrkPGs3htFgSeLrTSNYvoJ6PWzZMzqFPGjMJaaFjdJZ4zc2mS
	NFUGl0yUGiWb65r06hbwD3wGDRAVIenWhSbTO3HyZXHkeuGTPOGha7ES
X-Gm-Gg: AR+sD12Sqvf8AEzcpAzOgMsxCoR3KXPFW9BcVMiDTBu4SWZG5TB8vvqaVBMQAUDQwCo
	cZVqhC1HAU190Htsx6fGMmuBs3lU5uSFuyc1fdQQpll7dUEXLvvmpj7kOEt+QwttXHr4pDmXOJE
	XF6vBP8U9Qq6s3tGeH0EiX79HS1F8mEQcy8VG9yeoUriy7AuVVHLjDcRztd9jXyGuZklEA7+g2o
	IWQ8Nf/2JRyORgF898mCwvuEf1DQWKXMzP7Iz8n2VarHIkSrKAmVjaHKP/YdhpCkj0LRQZP9TZB
	2peI8ll6xXliQQG4gGHQXq6wDb2YhyzBwaIQnX99cGLrA/HWgKjI4E5C60rb01YX6mEgESCsMfb
	KJZ0qPhNok8Na8aaXFwNEKnzrofHeLybi0XD0CgJKWHmopmSk/mIxaJpjRaG3kpcQ6p0cG61mv9
	05aWCyYLfHIGKj99SuWv2FAdkeD39ndcXcOjAE6SxS1NcR8eQjZdRNCprgoGBIddrTv26jBpyTf
	AB8Ms8IUJ+onlfwAQNLQaRL8Jos7lQjkboBhrpvG9pbLsJxxPBxwQO/NgaxDSZBy0Tw3FFSNMzs
	YGb/pcl95g==
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr12379744a91.9.1787743717901;
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:194c:8843:f38f:1aa8:6d39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm12414919c88.5.2026.08.26.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only
Date: Wed, 26 Aug 2026 12:28:21 +0100
Message-ID: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
from being modified through the MTD partition interface.

The corresponding boot partitions on XSPI0 are already marked
read-only.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 20d0b607ec62..395316c61f33 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -825,11 +825,13 @@ partitions {
 			partition@0 {
 				label = "bl2-1";
 				reg = <0x00000000 0x00060000>;
+				read-only;
 			};
 
 			partition@60000 {
 				label = "fip-1";
 				reg = <0x00060000 0x007a0000>;
+				read-only;
 			};
 
 			partition@800000 {
-- 
2.43.0

