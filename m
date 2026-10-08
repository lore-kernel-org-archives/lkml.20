Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E33CFF56
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486689; cv=none; b=UQ62qcQFreviy2erSt40iyiTipN5WyW4XUYuIn67bmjYV7TAWYfPHi0mVu0yRYP4XJXWSjNuK6eM41Fe2zAlz06w6fOaPymd5GcoroseuuGbNichFZrQJsp6nTLB2mCFF2d56X7Vkl6QEpJs8yBiOHevzIEX0Gf2uvNVnrhHIn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486689; c=relaxed/simple;
	bh=NykIrWd2AdW8Yh66jl/kLhWwWN/LxKTYIMH1WlGPx5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G7C+dNrWexhbV5JgUx6kenKqZ6ea2jwchqMJexZu1YtMdWKyQZhl37QeRGXzsixX7J3PN6d3T9oDEBIemDzq8ZHiXxknbjlZ8AJRt410huSrjolgUwzieTO/AD2Umf6byGwzB1tR/PbKqsQ0e38EFtjfYPxs9LJx4NI2/MiEQic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=aJEQBS/z; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="aJEQBS/z"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so1838410a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791486684; x=1792091484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRsY0YEhwi4khCIfQ4VbXvpst8B4Uox65hBINmu+18I=;
        b=aJEQBS/zJqZuvSqE2jLVQ/FgsTKj8mgElBY4hk7vQrdCyY390UDUMLyOviwgVTWqu/
         ddDWb2yl2D9SQ3JFVCMva+OLvFJ5Q5WhPxLyoMFHxLMAAReCB3RFUHv/t/nPoE7zSY0Q
         01R2bODUzkS52fBscTFmLhlIWNbd6Hr0cDoZ51GDfeBLxeUkBP0I/Fz41ghKzhU/T3VD
         pQCM8364GZ1rZa9mMyLNMyd6K/+QKNYXJhkml+yeSQA5zSRlOxrsR/EhZatPMWIjADN+
         yxS7Vf/CEib/tRdNfzHdwURpWlRHiLSKBKWrNqgx4aEYIMMqD+yecofd/Kw39yi9PHZ7
         h41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486684; x=1792091484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRsY0YEhwi4khCIfQ4VbXvpst8B4Uox65hBINmu+18I=;
        b=qjnyttD+/sorwtXozj5lr2yzxFf3xbNJyaklYPh6R/WNbUVdeeJO7PYOhj2pXdhTrV
         iODFKENrSughCTjvUfyaOkXYTmgRHusVG4yTQ3rTwa9uCW8GXRxEbbqxTFR04Dn5827k
         vylvRRN+OnTjZpHB6TrzZVaPvft6zSsZS68UXTOsidXcLtjA0UFjbMCswCarh792ZjUs
         oZadXBUYn1820ip7qGyKWpXHxl74gOXicHASdEwVdygIYwbHCN2PE1fnVGHsRiTx/Whv
         XGst8KST5WGzLHyaeD/05h6D/ROyoNO5wR+VRk+7hw9Lb7ThVo6gG6+b4g8DTzwSa5wS
         vRvw==
X-Forwarded-Encrypted: i=1; AKwUvBw4cbGgFeRRbQaeB9w6tO7i8rOYh13IxH+UHdTXgzvApgm1Wq76B2fLjz7+PUsDrntI9VXdafRN7q82JYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFLmqIr1TNt4x/HdJv069MG5mVQZFbBrL4T5GsltQKgHxM3wNT
	e7YRLEi+nx1NHs/pzlhOMALi0O4TlvtLsKMhcxQIsspFwojfC6phETK4397vRpdKqwM=
X-Gm-Gg: AYBFou2nX0+Snn6Xr+ZfGQ0v4g549AGGr/wxmvul2O3qc17t892b+WqDL4yOtxExXLq
	3kt9AkwNc7cw4fLyfVJtK/gSTSOqoVOr/1r6dozeMAdI46lF6MfnG7+rwPYoc7/iEGwhH0PRfCq
	VoXVVUiPJIDDOIq9Co0zJ0UY3l5jG6yNUIgtLMWrL/5YJe3p0YQyljRcOTWm0KJeKZl5PEnTLOo
	+2ywUWP/06GonKrXzGtU3mSw7F4+h9rmn6Txn/HGTApxEF0YW1xciQy+JQ6FOf07RnnD8C7QFem
	LlSHxE8b0aWl/1TePfMYehUd+tFmW/5STk27mCkzUUzm5BLtHvfV5/ovatHzULBF0vsf3+1OwSw
	Fb0+GCfY343nuBDhk7R719tWdWDFqTG35s2rPFvKsegJOXG2DE5MzsSG5Dp85vDU+vEB5CTSpY8
	afvt/9X2/0GfQYMqLrCKzRABu0QoY4Wv8aCmCfc6gJ8qgns8ytD+AgB1hMdMWnviBg5yHUd+lu4
	sCK8Id7+fcDTesSgOypxAs=
X-Received: by 2002:a17:90b:164d:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab04135113mr2199094a91.41.1791486684425;
        Thu, 08 Oct 2026 12:11:24 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36de3678sm36899a91.17.2026.10.08.12.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:11:23 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net 0/2] bnxt_en: Fix SW USO padding
Date: Thu,  8 Oct 2026 12:11:10 -0700
Message-ID: <20261008191114.3736826-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

As a followup to Eric's fix a51d233ccd48 ("bnxt_en: fix DMA mapping length
for padded small packets") which fixes padding for normal TX, this series
fixes padding for SW USO.

There are two cases I try to address:

  1. The last segment could be shorter than BNXT_MIN_PKT_SIZE. So, add an
     extra BD if needed to pad to that minimum.
  2. The gso_size is so small that every segment would be shorter than
     BNXT_MIN_PKT_SIZE (under 10 bytes with IPv4). This seems exceedingly
     unlikely, but just in case, it is handled by clearing the GSO features
     for these skbs so the stack segments them.

Patch 1 is a small refactor to move code into a helper that patch 2 uses to
avoid duplicating code.

I ran this on a bnxt machine and re-ran the uso.py test and it passed, but
the existing uso.py test doesn't test this specific case, so running the
test was more of a regression test.

Thanks,
Joe

Joe Damato (2):
  bnxt_en: Add helper to fill SW USO payload BDs
  bnxt_en: Pad short SW USO segments to BNXT_MIN_PKT_SIZE

 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 12 ++++
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.c | 56 ++++++++++++++-----
 drivers/net/ethernet/broadcom/bnxt/bnxt_gso.h | 15 +++++
 3 files changed, 70 insertions(+), 13 deletions(-)


base-commit: 6d25ffca055a77787c21a36b66c253f76239411b
-- 
2.53.0-Meta

