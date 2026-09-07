Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C7C37C109
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756540; cv=none; b=O2OFVWTL+Jvea6hrFksTLaz2ptdexbRNawbfGgHmsSCI+0bv41Of7+S9Ta4Dh+U/kJDtAVvuPb4BN33UH13CsKK6P9WQ8ApW/c1dutQ6CUK6jkrXznHGeGvy5rMeYiO5tH5TQU/y6bKDIs54/RXwF7dYFW9ltZhe7qGiu53RoY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756540; c=relaxed/simple;
	bh=kxb0B52TSs8B2v8yLzOhr0LRy0+va2v9cTpeFUS5mLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q70dJowrHDPMGijnxpd1QWoZD8P2cBOyaMCLZOZ922yTh/3Tz6YNxrMopZtG/E5Wrxp5RTee2I56Jbkjq27WvhEI00eK6eL7tHvv8hVd2zUC0DeEotMi0/LsMNUOIU5P63BFpI4/V9hReHsJFGkHqlIBxxW8FYU0fYKV4uXzBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmvVhLyg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmvVhLyg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d53197d8b5so26949075ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756538; x=1789361338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbP1O1JK3wh+narhhXUGrCFpR2hK8gzImcIwObPTeik=;
        b=UmvVhLygGseoA4wuEMA6vadeCn4k6t3XwkHYt33qUkFXqYsBni0pUM7NcOicx/HjuT
         SoHrsVH760+jLZVhYVGcxONTykEq1wPuLNJ+kdEAnj6dtS6ZQxhPHdi20IdUCMfIOOH+
         m637vYTHf5Bqj/9nLlJC0E9RjG3Kb+ErtlkRiNaUIzmBD9b6Yzf8e1Hx4DKjTUuH3aIH
         vNnykFrnDNczCsx4+U3iG9JpwqAzTUY5Ol5N1DY3g+Ajg5h9FV2mnWVAN2v9gUQws0gL
         OiweKRVM1lnJgYxTI10ETqJpiy06J2SMQIGEdDJ4vBpuVXTHQitbCpHWQjoKsEgcFCO1
         J+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756538; x=1789361338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbP1O1JK3wh+narhhXUGrCFpR2hK8gzImcIwObPTeik=;
        b=nV4OxSDcX8gboc0b5WjeAifvk6tbv5xUC90NlhUi3GSs8xKIIEpRmYYPDAREhW9N5H
         +ca+Fo1IsR0hWeH0x5fHD/pbbk/yiXRDSdVIUnm3h2Z/3C22HQlAala1+iVVlTM2p6AI
         zXE0QTpChQ0gX9pRYfIHdGQUcLw6RwyQw3Mev7L2m/WenK5UBPnMiz5HYG/3pB4zyLqF
         b+59bExIXb33juM1r08/YEKz3ZA+87eG7r6x4N2m7MG2N7RvOn3+IjJ92tfJOZwQMZw0
         k3V5KImW+y4ClpB4IhvJsH4ZJIJA5thNLpoerCwNt6/Be9NL+itRXCOYGHxYySqj3r2A
         spag==
X-Forwarded-Encrypted: i=1; AKwUvByM8yIUmsM/HFMlX9K8eM1O11PwATdVA6B/mtOSu8qJxr3TYqd7K0TAov1nmRtpjd2LxEunJw/8SGlZ1rU=@vger.kernel.org
X-Gm-Message-State: AFuF++lq4QXLqT+9Xxfi9YykuKMuaoNsqMSGsmoAfVYQmVJunG+pZBn/
	y26ggd9yXgGwhApZ96xmq4M3PIsBRaB0nWcM13efgkChIbyIszB0zb0vsljY9Oh64MM=
X-Gm-Gg: AYBFou3msXOi3UvGVmzqUq50al3MgOpoozqc/6KhM7KEMvJr8Uqtxzj3OqHKdocrDfv
	vUhZoNg/sI4pC7CtipiQNgrTXfLC4/Nkn9aQJmU7+ByTgs2xxEtMCitaenk+WVx5vlrzIvhJDMW
	dZo9AjLo8iV4lefypsBfEm3gI5OC4FLoDxqtiHncahVwxLezhxs7KbcX1Eka4LUMlms4wuxf9fG
	tj5s7qC8+TCixBsnDUOJntN8IVPtG+MwZYk+SrF/0w/Tks+1r55pE9lpAvakaw+Nz3PToGGL+hH
	LJBpQvS8t+dYeiZQmkB/7egy3q1V1pfdatjdSgMh8P59b6RlN/yuVtLcbrJL1DTtV9NlvP3nR5e
	z9rN8cRZTwezmxj6yL8s+VbnTuE0S6dFWAcKBIwg+7EkDNVE6ZBG/B73K+YrRitYJuRcwVzjsRo
	hoCqxTqgGHNpuv39M8ZpNXRuVT92Gjs7J5S6aVLxd7GHGaDVBB4AZTHOn7/lVX09JQgr7q6FmaV
	vpn7T+5rIypLH9cS3+tO7Gz
X-Received: by 2002:a17:902:d2ce:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2db39da9312mr124170685ad.8.1788756538478;
        Sun, 06 Sep 2026 21:48:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm23834001eec.12.2026.09.06.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:48:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jes Sorensen <Jes.Sorensen@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: rtl8xxxu: fix typo "Tranceiver" in comment
Date: Mon,  7 Sep 2026 10:18:50 +0530
Message-ID: <20260907044851.9884-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044851.9884-1-hemanth.selam@gmail.com>
References: <20260907044851.9884-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "Tranceiver" to "Transceiver", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches a
comment, no code changes.

Split out of a single "wifi: realtek:" patch in v1, as Ping-Ke Shih asked.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/wireless/realtek/rtl8xxxu/regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/regs.h b/drivers/net/wireless/realtek/rtl8xxxu/regs.h
index eafaef1438b9..2131d07c5801 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/regs.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/regs.h
@@ -982,7 +982,7 @@
 #define REG_NHM_TH3_TO_TH0_8723B	0x0898
 #define REG_NHM_TH7_TO_TH4_8723B	0x089c
 
-#define REG_FPGA0_XA_LSSI_READBACK	0x08a0	/* Tranceiver LSSI Readback */
+#define REG_FPGA0_XA_LSSI_READBACK	0x08a0	/* Transceiver LSSI Readback */
 #define REG_FPGA0_XB_LSSI_READBACK	0x08a4
 #define REG_FPGA0_PSD_REPORT		0x08b4
 #define REG_HSPI_XA_READBACK		0x08b8	/* Transceiver A HSPI read */
