Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BDB35B636
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790544944; cv=none; b=HjRfgk9+KHDmjkZoMFYOS6hyfWGJuBuug/yYxitxHRrqYkK8tLG9kBr83QOE4OBUI18HCdzD1AV0FNQhibVQodB8R9PKOP3pHT6TKS0k8Tg/AvutmyyJgC3OSZI8jfeL8NhhZF6srjkxrg8dpR4SzR0MZomw9pPCJzh+tQJro+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790544944; c=relaxed/simple;
	bh=kNXLRQ4KxcKgSSIc8oLHK8bxZeaP2Chi8O1a8a0k6TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oYIJOpD6Ho9vBZkyorfur00ezswgeioPAa8OrBwxVXbKtmLZu8fJy8m656oAmMU/XHJkHEmIzCZsclcshqwZHdnTZLP2FbsFmq6YjtF1AYMII4dd253jiPVcggLRFR9B5nUri4P3EhWXRRJiWRUHykHqmhDnFe3vGWP/ECzL4nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLtCanNo; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLtCanNo"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7b3311c9bso151235a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790544943; x=1791149743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHG5gy18gjuCwzJfjLviwlZCw2IziSSdFW1ln1v/Sk8=;
        b=NLtCanNoEZ/7pC4V8rJqiVnzlNupa3pm8mgsm/JEFeXP8PdeznKl8XuDqz/0Pt+Okc
         88n8HJla2og3QzlKlHc/hOok497KWsm7OA5qGPaDODlb3qF1cuhBpG9YvY0ZLHtpzFdR
         VlPVolPxjL7I8W2/vFUV1d+JrdIx8FB4b6BdDDLAiQuB0Pw80/ttUWZ9S1qNPUXcbr81
         +3/NQxbCK5d3DlA3x3KpejQ0CAqobVq7jAOvkdTVcr9OBdA5HVMAAGhEZ+POaVbUZg0B
         upy+tqsUpYANYIgEXjSmPGQ293CSRRxA7jMXwbYq6drvMGM+Y0mgV1kZ+KsDvzmxy+a/
         eiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790544943; x=1791149743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHG5gy18gjuCwzJfjLviwlZCw2IziSSdFW1ln1v/Sk8=;
        b=FD5V+njKpRgqLCVyRHICGMhR9M2LBwbG1YDDswl4uWsMfrXAoA3e2tha72niB4SjAl
         T5dut9ls3pX3ywV4QHir8nbkqm1oLS4NevFiuVAv5bqqwfrIOp2iJ13oEupYvgxQ1ZVM
         cI7u6gW+MKd/2eNcwABVb/NnJJeWXckhmNNUzewuMjltwUxigRdfn6W25KT5srH/JaYc
         eiA1ytAOZ9E0m2AplJu7RjvlL35M2xjivBRMjWXz9PFW7+dOGOH8DB83sscquvtmALa5
         suIr2ZdqcOYZBe3tAbB/MQAO1iKBT6Bn7grb0acmLOUv8xfhHpC9u7LEefive/ZF4tVi
         h9GA==
X-Forwarded-Encrypted: i=1; AKwUvBxc/FbIv6OmF1sijEZ58u/IkcoUMgemctccUDjb6agNCjdsXK1nmuyLE9a1DaSMk7jzFEaqr3tZ4lUtoqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJx/qCx234x9Wcc0qtNWTW3D1FcNY8LWM7RPA2keIGYIWf+1+1
	6BzUvD/e8+NEUKFOHDmR/DgykkJMH5XId/Ne/OQI6JtfRJTyJxnAugnt
X-Gm-Gg: AYBFou0fAtc0SEZQ/fyJxMBCBD3H2nnUjvrf6fabX7UuTEN69xq+PXenXch/CzhNPmp
	12amcAM6vcRMNmjrTdvFO1gt/of05hX+hU+rWpL+6FoZnzku9ZO7KMW13dkYSvPC8uNtjYFcpLY
	bhoheFHG08TLNR3GhaIDh4iMw0KZje6KnbJsf06757Rz3r8hG910dSWtdIibhb8XO1F76FL2t3M
	7UIWRtLABhcgJ2bPebEoRKz3nbB8VdR0NqxqFGLrvAD7iRTo9rKS7YxjrCOZITCCdXYNAsXeClQ
	0NoTOPxvuMYGSE8zJbmuuzVoHx3qfm0cTBYrscEYEto6IV6D92XXC0E1Ro/CBfzu5Db3vcJR75X
	b7p8KbUAbphI3ge8gH4fObeR2WIs1em92bbA/0u1VB/+lsfC9PvKhEI0R9WezWYIgcD3yLwXGB8
	OY6b96Q9NwEhFGMlh5cnprgeAf4YNcXycU92k9/ZRf4XJ1a1sFgSlCCZlYlEZmeGPl245s1wx8L
	XSC5ct6S3zen88p99Zz/AgvXbKkJ/QVTL95jp1jjIVwdjMSf2LsquL4DdyCdWmjVR9i2WNPnoUA
	sB8lQkks4nsbHy0Ev88cG56G5x5ctmMCVZqU0sH1RxTmGt/v
X-Received: by 2002:a17:90a:ec83:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a098d453aamr8865147a91.11.1790544942679;
        Sun, 27 Sep 2026 14:35:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm22806038a91.13.2026.09.27.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:35:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc: dts: eiger: add placeholder reg to ndfc node
Date: Sun, 27 Sep 2026 14:35:40 -0700
Message-ID: <20260927213540.132854-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ndfc node of eiger.dts has no reg property, U-Boot fills it in at
runtime.  The new IBM NDFC binding makes it required, so dtbs_check
now reports

  ndfc@1,0 (ibm,ndfc): 'reg' is a required property

Add a zeroed placeholder, as the nor_flash@0,0 node in the same file
already does.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/boot/dts/eiger.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/eiger.dts b/arch/powerpc/boot/dts/eiger.dts
index dc4d74c523ec..7260cdde281a 100644
--- a/arch/powerpc/boot/dts/eiger.dts
+++ b/arch/powerpc/boot/dts/eiger.dts
@@ -196,7 +196,7 @@ partition@3fa0000 {
 
 				ndfc@1,0 {
 					compatible = "ibm,ndfc";
-					/* reg property is supplied by U-boot */
+					reg = <0x00000000 0x00000000 0x00000000>; /* Filled in by U-Boot */
 					ccr = <0x00003000>;
 					bank-settings = <0x80002222>;
 					#address-cells = <1>;
-- 
2.55.0

