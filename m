Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7226745199D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523746; cv=none; b=QfD41AXBOReClXBQURsG0pIfayXR0kdEr2jWGEi2DcDVHla8/5tvPE5xrj9AorXNFq01qxCHh47xnVA/19SS0IWT4toGK88j6JgxZB2WT42CD4c+4/aN9X2uzl1SXMzdyJ+VGFKto5JKJrHko61FQa6GtrBrvOVL4NsFefsrMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523746; c=relaxed/simple;
	bh=NcXwWXmhVjryGEnQr581Nhv6ZM+emy6UqygPrXp1ruw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXH+788DvrnndoAuwPNgbsej+IgbXIi/mz1Tn9/Vt3rAwI8z4FiCD9R2JvjSljKxH5ARI1dIBtrqNZcbAda7pRN/m2tdTN/54M/UF94YgP7ivkfGeO7Jwxn6Ulpu3Llj/xDMDwpik0k/hC8Wwch1t/zEq2ipeewfh57BRysYseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu088o7/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu088o7/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9b60c652aso10614295ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523745; x=1789128545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQCIgSCuNjJ7y5qzvIFZL3CGDF0zKBh+R98GPUNlTOY=;
        b=Zu088o7/modtFtpjeXoSKGMun73FoZ//8Pjutg1AWnnAexiRnfVZPmUCDawHiAHJkU
         OTHW1eVQfGsurO2RzO7It9ORvM3/INufMlNqC5HzViKOdCMlttmaKu90H0iip9osCVy/
         Gdo2YDhL0Xm6u9G7k9BD3J1esx8xEzWbiy2gaI3BW9GJYJJDXMtflZhmOf3tS5UKy4i2
         6Z701hjj+ifcOZvbUCTZtTZYJ77M8Cczr2WoRfY3XMWUZO0fkVWPU8f83vzyR5mobPxx
         vAjKCn/1uovJm3H1ZE0JMBKrgEug/hTjEg+pGD0bkJOqhmkqiMN7W6oAMmeD18wnbh/B
         OWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523745; x=1789128545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQCIgSCuNjJ7y5qzvIFZL3CGDF0zKBh+R98GPUNlTOY=;
        b=kp/m2p4iDCaMRIevKNR9JlGeEdHJxqLvKQc3l5MoaXusZm2K1zkeXfOJTVe+leCm6z
         2qlSmupHEquBZFlr9mJBkqlxMJ+wXEWartIlVyHC/bOD+u1OnnGacllQMqXhndMMxWPE
         pDPmNt60oKFEoZ8c+jry91yefQOYffo3ySGJZUOGxw4RCiIgF9qJPsWOrDj7fOughvg3
         ucjR9aITGUGea65g7jFnjCAkVqMS91Z8wJ6p6IsckyKXCHqqlvjRzOTzcyjw0xHn93X7
         2Gb2mmyHkyyxhONdOo6xQM7H5atdXp2fL1GOUdpOUU4GXFOXqPkxPGdGkXjAKVg3XBY4
         sK8A==
X-Gm-Message-State: AFuF++lj0lwjcN/r1u3gXvM8hZ+Vq8PCIVysGOcsptPvycmHpwDg4PDv
	XE0EI6aG3DyRccInXCFNYn9YnK7QKzKmhSEB43NdSO3hRGop18qG/mwFZjQUo1hamwE=
X-Gm-Gg: AYBFou33UPYZbgYzWToLEqyMo5NquWGK4E6nQ2INxYY99Qg/e7eickw9Mld+SvWDf9c
	pA7woey74Yl1RP0OJ181HHE5HgaXySmqtdsI1i1a5Pss2CDV5ZqHKuX87sRcyE6zmOFsAuVsa+3
	3cnn5g4PY+WNR3wI2FNee1XvzGIWyRYkCoUTb31LBiqaxBaTPT0+hOeP1jwKpS7qBx2ogwL6IJL
	X0okuxst8Qa7T9HcWv3blr9qtJcjwSsWi0JDn4ft9fIUhmlXqbeXRI/uinIpR7dOQw7qCNPSNev
	4Sn89QVwdUxoi2LE+orBcsRO27UjYTxCtTkDGZ3e6EHfgKfHZjxGAuCt/gqTw9nR65Q/gbYhQaV
	V8DYeSjRl0A4q5FxF9Ua68Et2xpa7HogbkCWNyCtdUmflv73VpVsUQs6kJZBwFHHTEwGLxsMTnv
	UPaDCxptivRks/vH/ijATiDOr8v5HMEoz8nDojdKOWrVxr5Sk2G/DEpVr1Dnln+nL88EaLwD6Lg
	paESI+k200++z8=
X-Received: by 2002:a17:90b:57cd:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39b2609f356mr9550298a91.4.1788523744553;
        Fri, 04 Sep 2026 05:09:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5730826eec.6.2026.09.04.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:09:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH 1/2] hv: fix typo "substract" in comment
Date: Fri,  4 Sep 2026 17:38:54 +0530
Message-ID: <20260904120857.20431-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120857.20431-1-hemanth.selam@gmail.com>
References: <20260904120857.20431-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "substract" to "subtract", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hv/channel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f4370617deac..c36ec14529b9 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -79,7 +79,7 @@ static inline u32 hv_ring_gpadl_send_hvpgoffset(u32 offset)
 	 * therefore leaving a (PAGE_SIZE - HV_HYP_PAGE_SIZE) gap.
 	 *
 	 * And to calculate the effective send offset in gpadl, we need to
-	 * substract this gap.
+	 * subtract this gap.
 	 */
 	return (offset - (PAGE_SIZE - HV_HYP_PAGE_SIZE)) >> HV_HYP_PAGE_SHIFT;
 }
-- 
2.48.1

