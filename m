Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541433;
	b=nynsfw0wyJwnjuOiQuSwR9q4UwoFr/8ayQ/mSllikJFG16lMQZS6IkZQyoEMqmxtUa+3
	 ErW+uhx29e6vbguNKW1o3Xt0x3TQuautgvLZsjdDJN8QztAgf3Jufs2eniDB4JAzBCP62
	 5TR8VkyQr2oDPkOBCJWfzVNkOxuZBk44wLg9FDNcD/qcFddypduqjEDGhmt0bFgoDayGb
	 Rt9KchkG/aKlvoY8T3ITOPcUH4T+RpH3q6zrO8BxsOBXvqBPADcRKFDRuA+1h0H6S5fXM
	 SHobITsEOKuVZSsC4IsJAYQBgOf2Qlyu3yu22GO2uV3/Wjesi+KoUflHt83KyC8oRZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jl1CsF9NMZircnSwAYemIaX1sWHDdB1YRVfnBFy5nVA=;
	b=KtW8y5ztYZvm2PGQOiaL+UcKRM+PqmzMxoJd+x3bgOlBS7YFHvGVnI7UvJeEgfdklsnA
	 NrFyrvPgGMtw1xa9ZvCm/kbW/Mtadld7F+cvc/2D4UXgEsVmCBqhvpx3hEnLvkbCN0ChZ
	 LSZ36Ne0RGOKlCcZxC5BshrpfVKPP6d+9xohulGJgx8Z2HeODZPMM03TNRhM0Tx6jvGT0
	 e0zl/JR3cFMwTkdUh0a3Jz6t3bNui3UDuzlH6Vi7jNvg7m0I+cji/6UOD4Zus0/3fGQ6z
	 iYfg6e7yv3fQlsQEz9Q66YYCnoUIJg2FoEgeIU8uK4s6yFwv8JKP6wK0DtnFR+b7cKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCW2iAr9;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4D606A336
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08F4D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCW2iAr9
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1055759f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793541431; x=1794146231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jl1CsF9NMZircnSwAYemIaX1sWHDdB1YRVfnBFy5nVA=;
        b=DCW2iAr9pveRgGBm1fPspT78eBs0vJbllx09Cgcx/eVXPBdkpCWAIkPpPPw1wlNf8Z
         C0r3WKJ8SAZEXOuSdqD7g2UbMRdCyH3YOTdfXUo+vghYW8C6HdMjw+e44LzcdzcZA41U
         aEyNX9+UOTjhMAR/hWtcik56Uj1wrlw3j7lcAtR8cG5+iA2tzI5TZUu91pARVbDsK/qI
         U8fiUtQEQsYATSbQAQfZsXUqS0oh/WQhuul1jYwiWRXfccuXUIMN2bDqvQUYBRdOomfd
         nX2bXXE43Q0FvMvDeOwqyjB7v3KIQfnyg/dL/Qi7DRu7CpRf+GxgtPlfEa1uNv8nj5M+
         iFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541431; x=1794146231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jl1CsF9NMZircnSwAYemIaX1sWHDdB1YRVfnBFy5nVA=;
        b=Rs4Zz0KZlPBgeGPQU4VTgQsANFXzIoberwMXvysOkPC2xmaNe4lk2PMgk0kt2Jgj7+
         Kpf+x/AMTRosnUbYR+pE8eHYOWjEQQYs91ELOWh6hXunZDEia6yjzq/lz6WEOZTGrlcS
         1ub8Y8V30/hTBVEDXjYIv/76zFhoc0aNY9hHG7Ouza4io0nZCHSkP/mi5t7A84jCU7C2
         RSP5hw6veATeDjz16prERFbCdVDrChrwGtz84hggtoj0iKxeNAWcksE+N+kuAJEenYNx
         s6KECDw+dt+5d/IM7YLPDj00htSUG80Va41bzb0j8ZqirVF02GiOGDwdGKxQaT68F//t
         OF3w==
X-Forwarded-Encrypted: i=1; AKwUvBx8wX20jI803NfDGGFqVBFSjzA2I9gPfrmTHKyoANQB1oZComPM1wO3dcnVDSUqtLHaW5DGOAuGuczG4vk=@vger.kernel.org
X-Gm-Message-State: APuU4Z816+ke4e6Y8jfO0j9Ij7TO8je6+P/5DS6eICgL///kbZV/cdzI
	Z4T4L3MZxj6ipdxoPeOmlVEwhxOFPimUHc3hqbld2L7LKK70IvWAv/Et
X-Gm-Gg: AYBFou0np060wWPJKzWm0ttP3PS5CXZXaOm338G1VlDArcLsxKgS+mGIZG2+d1/lxiR
	KqNVqc6iSSM2yHZCfrB5RcBJV4g9F1PbDfYuVhFZcycIvbZcb30+GqZ0Cpx13Kwf3iXnCPzTDot
	bZOzkTO7zvl/Y4mza3UE3wA2g0WRhsoloH4dtQIgvTM6CDJp7n0bkZ++m8TimQXE9Mm2Mxv7YN5
	jgmPsBDeGM2RIX3eB36HWN0k4DqrMuDH1Pmj+F7AtMLThHCtfs/uelZEhl++7bo9kvdGhf+vl4Z
	EOK5wkvLyhdhrAGAcD4v3Ulf3/+EUnVeNmqbB7iJYWDWR6aEmcM9KNfamEK5TR4lwMJgZbvWFL9
	YdoZCTew7monw0xqkJJ7HjhwpKpzYwzk8yRQ+ynqOCWIstiey5IR4TjnZk8WwQk4VA5aoqELD/D
	E6FWugWJ40Fdf0+kdr/Z4DsQouD/xWzp9kqFCO2zsTXGzOU7WRFzCINg+DrOLWx4ueMekCSpLHN
	IFtshlWqM9QIN3fp/ZM15T6mLYQb7SLhbYGFk1QcRTbUyvodYN6c4KCOFPl8q4W5L0ycIdZNqk2
	Mi/W/MRPxR9qxm1KoJbXmGs1pn0FWNDgfKEk
X-Received: by 2002:a5d:6f0e:0:b0:48a:ef5c:fc2c with SMTP id ffacd0b85a97d-48e6e515db3mr17552899f8f.48.1793541431219;
        Sun, 01 Nov 2026 05:57:11 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:9c55:89d4:b00d:2bbe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm13856454f8f.29.2026.11.01.05.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:57:10 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Koichiro Den <den@valinux.co.jp>,
	Frank Li <Frank.Li@nxp.com>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 1/2] NTB: epf: serialize memory window parameter writes
Date: Sun,  1 Nov 2026 15:57:05 +0200
Message-ID: <eeb0cfec451d748b2f997c16a0a3a2afb56569e9.1793540847.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793540847.git.thnkslprpt@gmail.com>
References: <cover.1793540847.git.thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntb_epf_mw_set_trans() writes the address and size to shared control
registers before ntb_epf_send_command() acquires cmd_lock. Concurrent
memory window setup requests can overwrite each other's parameters,
causing one window to use another's DMA address.

Hold cmd_lock across the parameter writes and command submission.
Use a locked command helper to preserve the existing serialization
for other command callers.

Fixes: 812ce2f8d14e ("NTB: Add support for EPF PCI Non-Transparent Bridge")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/ntb/hw/epf/ntb_hw_epf.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
index c47607d4f8a7f..da7fbe1800656 100644
--- a/drivers/ntb/hw/epf/ntb_hw_epf.c
+++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
@@ -123,15 +123,14 @@ struct ntb_epf_dev {
 
 #define ntb_ndev(__ntb) container_of(__ntb, struct ntb_epf_dev, ntb)
 
-static int ntb_epf_send_command(struct ntb_epf_dev *ndev, u32 command,
-				u32 argument)
+static int ntb_epf_send_command_locked(struct ntb_epf_dev *ndev, u32 command,
+				       u32 argument)
 {
 	ktime_t timeout;
 	bool timedout;
 	int ret = 0;
 	u32 status;
 
-	mutex_lock(&ndev->cmd_lock);
 	writel(argument, ndev->ctrl_reg + NTB_EPF_ARGUMENT);
 	writel(command, ndev->ctrl_reg + NTB_EPF_COMMAND);
 
@@ -157,6 +156,17 @@ static int ntb_epf_send_command(struct ntb_epf_dev *ndev, u32 command,
 	}
 
 	writew(0, ndev->ctrl_reg + NTB_EPF_CMD_STATUS);
+
+	return ret;
+}
+
+static int ntb_epf_send_command(struct ntb_epf_dev *ndev, u32 command,
+				u32 argument)
+{
+	int ret;
+
+	mutex_lock(&ndev->cmd_lock);
+	ret = ntb_epf_send_command_locked(ndev, command, argument);
 	mutex_unlock(&ndev->cmd_lock);
 
 	return ret;
@@ -494,11 +504,13 @@ static int ntb_epf_mw_set_trans(struct ntb_dev *ntb, int pidx, int idx,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ndev->cmd_lock);
 	writel(lower_32_bits(addr), ndev->ctrl_reg + NTB_EPF_LOWER_ADDR);
 	writel(upper_32_bits(addr), ndev->ctrl_reg + NTB_EPF_UPPER_ADDR);
 	writel(lower_32_bits(size), ndev->ctrl_reg + NTB_EPF_LOWER_SIZE);
 	writel(upper_32_bits(size), ndev->ctrl_reg + NTB_EPF_UPPER_SIZE);
-	ntb_epf_send_command(ndev, CMD_CONFIGURE_MW, idx);
+	ntb_epf_send_command_locked(ndev, CMD_CONFIGURE_MW, idx);
+	mutex_unlock(&ndev->cmd_lock);
 
 	return 0;
 }
-- 
2.43.0

