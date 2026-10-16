Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD4381B0A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166099; cv=none; b=dzXi8/kmtWx2TuMuC64Tehh/NdZl8yVr55QEHgpChwJ9wzcnCo3IL6Ili5V/sn/S3ObZeiNTCK+6ad2891eGaLJmLfmGmPClDE+DCqKGsIIPeM4pLD35+HWLXqY0Kxc65LFm5mYDij2i2p40RxtfDoq7+LMDmnOQ7d5JUDzEGh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166099; c=relaxed/simple;
	bh=Mg0oCODIBACyyTpAxf8sGl7IMM7k1v/BkIjkqVQOlSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdMYypTuTUfb5mdOuS6IOuRO+wEa+baepnwgdyX+mt7auQ99YQ/m11vSx/eOVJyiL7z0/Xb4Zwu7FDWjLAtX5yqKpW/xguu5ptGJ5NhMVmkYHgGXPeJVb4J245wzkzbBtYjoXjoPpiUH2rVpxkbRvwXi8ktx5r2EpOUM/FASxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soGeqLMI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soGeqLMI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so116161a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166097; x=1792770897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DGvHsg3p95DZsVwADiFfgXPnEb5RStlDyPXgePKJCs=;
        b=soGeqLMI+3Du/qsdEmvq1z0rpkLpGxBKvjAwRVTOC8KWjgwR4H906EykDqMphpM8Aq
         8Y3iznh5sVdbpq5XDiDG5tflZKnnct/ZJRFIhByJ5Z8O6Gd4v0G2MwnH0bH571e/2HR2
         CWLV9W29lcR5eoa79QEY9QtjQ6k5u2Do6jjiVVk1lqdYOms9BAWikNnwEGrWvusfxUe+
         u95UF5xqUyxd3pQx7hABVbMrq/GJdffGpXQ2Xj7lByZNiVRVXssNQHOQHYQ/60f57Qsu
         TsTDx5Tm9FevHUg5SdCSe4cRvuFKeDQ104mB8FEeaIv+mW/JR4qV7Oz7iFD8vJnh1p/D
         Q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166097; x=1792770897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DGvHsg3p95DZsVwADiFfgXPnEb5RStlDyPXgePKJCs=;
        b=TzBS1cDf944iqkjqwARb9bnCYq8U7vwAn+c3LoOI/0as+FQXTeQI0wocr1excDXB1n
         5LhN0P5ND1Zr+ZddfGsYkgnZocS/bFSrQpID5iMkaLDn4Xb+CDNCH6v5WQ5HDtCYMgBe
         CPW3Ez4pMPlAqZhQWCMul9pl7UprpT1v7ZBfe5X4BAMfpkVELHQjVzEPH8tNShrJECjS
         hdTc5Gy07iduolM9m9UPMyPVmSqq960HoRL1qfNsoCBijHTB8mB8Gy/+EHgJTcVtXnXq
         4scjhWG+hQMEjfzUp0foHpsw8LE71M9a9PpybHK1Yq26vPhP7h9J5NRmevs8BEo/wjux
         g6fA==
X-Forwarded-Encrypted: i=1; AKwUvBwzxRn9GL3FKusPgV6Cy5ynGOXHpSWrFlp6wWbxK4a6V0VsFfcv7AGcKC2vcKOoO5PRJ8TNIKc1jGZGiqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpDohKR86GMPtExN0ICEOetMU6oaLuEfn9EEbUiZqP+NzdPO2g
	LdS3XE71lB5HhVuuXk+TCiLmn5nJXnVoi4vBS5HNzeRM8YPg40h/VLN0
X-Gm-Gg: AYBFou3E6iWfzGXO+oWdh0xwvw2LaHb/bQsCUK3Xkpz98bJbFMsNFubhy39dlq2hoBp
	ouQnRBCzdhgn/tOz+7q4T/cNL2tMQd+8UY6rOHjRLYcI0pWXvMzpJgbgamM2Y3SHAJN5xmGAF/+
	waSvlFGq40oaixQ5tlKuPOkO8pRjlXfjzQGf+j2WO4S9xNCIBCs+ueqDoxjzhI7LDegJDzzYmAI
	3DSTdRsWYIacHRVAjuRY/0EDWxkMygWnS5xaFLfub0rZ/HlzNDlzuAO+KCzg6S7QwTiNefYEogj
	WlxOgC/1Vmr6k+DmbcWa8SkdwPdWB5AG/ogXPGmGZI17+f/s4QMoBui4ykFDPREFOHZJD/Hd6R8
	FwuSR6a1EulQpGVqpIITCcy4KawVQ/3KIOYrNk0oIuale/9BxhOH9TIXpZ4fvwaV/B71uVJr0iI
	hBxs4tRhGRG2HAIQXJdBuV0ZX47H+RxXIR5R1ITekpGis2YeVNzwPP8XNlqaJ3l4bYfaEQ9pqV4
	KwDnOh40Lw/vdttwJobGvpUkHig97f9X5iFkF6kUyFyLxAq4Uc=
X-Received: by 2002:a17:90b:1c83:b0:3ac:a11a:7c91 with SMTP id 98e67ed59e1d1-3acef55d796mr192926a91.44.1792166097338;
        Fri, 16 Oct 2026 08:54:57 -0700 (PDT)
Received: from casta ([2401:d800:20b:1196:6a2:5930:14e3:f74b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b798d3sm1920946a91.3.2026.10.16.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:54:56 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: paul.ely@broadcom.com
Cc: nareshgottumukkala83@gmail.com,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Subject: [PATCH] nvmet-fc: skip port entry rebinding if already bound to a target port
Date: Fri, 16 Oct 2026 22:54:15 +0700
Message-ID: <20261016155415.10521-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nvmet_fc_portentry_rebind_tgt(), nvmet_fc_tgtlock serializes access to
nvmet_fc_portentry_list, but does not prevent multiple concurrent or
duplicate target port registrations from attempting to rebind to an
already-assigned port entry.

When pe->tgtport is non-NULL, WARN_ON() is triggered and pe->tgtport is
overwritten, leading to kernel warnings and leaking the reference count
acquired by nvmet_fc_tgtport_get().

Fix this by checking if pe->tgtport is already set before acquiring a
reference count and rebinding. If it is bound, skip the entry to prevent
clobbering existing bindings.

Reported-by: syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=be62d4b375542ecebd17
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/nvme/target/fc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..9b7fd8f5bd47 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1324,7 +1324,9 @@ nvmet_fc_portentry_rebind_tgt(struct nvmet_fc_tgtport *tgtport)
 			if (!nvmet_fc_tgtport_get(tgtport))
 				continue;
 
-			WARN_ON(pe->tgtport);
+			if (pe->tgtport)
+				continue;
+
 			tgtport->pe = pe;
 			pe->tgtport = tgtport;
 			break;
-- 
2.55.0

