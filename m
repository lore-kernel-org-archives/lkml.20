Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2330FF36
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519729; cv=none; b=OoPCIhxG2kxRNqzv7Zq0BprIfhazuMmLjYS6JkEVQypNibpUy0s3MkbCxKoMyzU4MnmAgdQUgg69WUaRxKT8m9eK6Ib5U5Lsi80XhB2s2mFX6Gpqy3Ls4BPiD2RBCvgU6FnfX02bRDdXBl5cpiexnLDacR7YaST41CWVO74tUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519729; c=relaxed/simple;
	bh=I8XoUrhcmEqz8UUUzqEihbAedAcxK66yyGn4rajR38A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YF/fjY0nWOttapvjg4Wnjn1wqy+bYvt9AJ63zoVDaMTc0DLGHuV/8AjxSoyCZF5zuyWxFaLPzfR7ChHgF5UCTRo2pH1zTg6rx/XB2mtdI9O3OTjDyWfZ3ytBqP4QQrLV8hjWQTiC1bkdLU4oCni/iSJuI0/rln8f2v/9q2Fy2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5QNJ/BA; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5QNJ/BA"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3115c4451c8so1830350eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519727; x=1791124527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=J5QNJ/BAfghCyBDhE21LvEJQ+K6Oryc/FIILTZlyFi3aeedauLBILLYqTCH/3N+Mdq
         KX2G3972Qe6AoPcYaxHXkm669RQ0ZKNTX2qD274Jzs/7ZiPCGqYT1Wqc/C7Tci7PPoLQ
         deyIcZnwQ1zZmYnmVe35qm+vdMToJlFI+t9/wbKMBVddMkyJif9SiKJMgSF/6HQudL7k
         7JDWyy0iWSGaWjY2+LhhYTQ2I2pB2bcQ5+yVB1S+XIZlhySFXlPiX30YZaxGcwcLqcGz
         JNeyPAI6h6+2ZYgmUIq6RN4HGfVzNDbKvz0+JxwiVgpws7bmPBm2/1AdYGXOJxKG4EMd
         d1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519727; x=1791124527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLySA6vQdM6/Jc0fF+x2gAStuP7aq2CXmHJfOM+evZA=;
        b=DmjRLa5SDKIGrsZvbJeDTR0Pl8XAvdOZBR/H7189iVdXAKQ679e2QfjXh2w2yMrbMo
         LMrNOBHkYtYLps09c/Ks4ZIDwIE+rgB93ujoTA83rnTi5PVTCdYIe9nj5nWOifClvd5o
         YqnI0zR2FZWvhP+Lsn+H8WsfDKXRd4h9pWS7W8YHeIW+UW/7pt4cpJss+hOkFkX/JA2X
         sT6yasGdvfok97/t5aY8HuKz8VcYtLu8bV6JikTSR5ON8mFIt1ekmvXCoWERNTWauC2/
         GJee8ahkOQ56DeVclyKbZ5XrNllnu8U2H+O7xjkJ/gx1mSQqWioPcxzkCbmig1/KXKx7
         cexg==
X-Forwarded-Encrypted: i=1; AKwUvByBmWtSGhPefbYv7WB3Qs/DNHUxfsFoCthhxMLZbr7SRpZ4Yng+LEKCFJmG3dCI/TikdFCP8ig8CYOu6Kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWAzLwhqHlk4lbX1IZxDTHfnO3jVQlx/X7p7HNU6rYrgKScyvs
	OLcL/Rwjb+VGVdTugTE3+nHEEzYerIDoU6LO84+BBwIP3jrApvuowRNy
X-Gm-Gg: AYBFou1NMNaeyMaQfASP+n4Ukfxx8YdKOw7zwDaRFoOieOqiiRn/9a3L/XuB4+w0j5I
	w4fKp7Mh3SmtKFuv74Zb4AJhU9hZUeVLZC2+193rZRgBG/0xI6YEQYWZE7/LlcgWvr7ytlgZdej
	HTIJOV9/25ShYNdOjnLXMLq6anCYg7alTRyixFk/Xx0TLTL3E5OUvyPxywbvJE8B5hf/jr95R0e
	Qx8yYlJ3MTxbpqdlOG7YfyG9Y5Y3Ea3kWBFr2z4cLkht1AxddyQdnTCSecNYf/QzxNBnSbY0FDV
	uoghAxdkqZqwgS2yRGBAdqLMClYoWDKOzImMmjpaVZa/9qUaQQowuIRbi9oiezJzSwsVIk1A9eD
	gUaE6N2d2dJ9zcgH7/MF/oeHHORl2zqlbcAeuQgUVfN1pmMNmQDMpCNMCIu7O+940kEqy32qp7r
	b63aoKIwSH0ozS7vhAdC+ylXVOTWrhvMNnDt/JNIr7WG3iiFDnKr6kt6mcErWTSitld3XCtBrBc
	2TtXecfDmBTyhL+ihFxFpffmUn8R6/HyJ/ib2MUe9H1trqOrKwCCJPrb7Of
X-Received: by 2002:a05:7301:1a8a:b0:342:890a:4088 with SMTP id 5a478bee46e88-342890a4424mr6023547eec.2.1790519726936;
        Sun, 27 Sep 2026 07:35:26 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:26 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 12/12] powerpc/powernv: Enable context analysis
Date: Sun, 27 Sep 2026 20:03:53 +0530
Message-Id: <f33a461307440c78ab8abd136529d167ee716164.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

powernv objects now build with Clang context analysis enabled.
Turn it on for the directory.

This checks that each lock taken in this code is dropped on every path.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/powernv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 9e5d0c847ee2..834a56122aaa 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS	:= y
+
 # nothing that deals with real mode is safe to KASAN
 # in particular, idle code runs a bunch of things in real mode
 KASAN_SANITIZE_idle.o := n
-- 
2.39.5

