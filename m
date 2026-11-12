Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519803;
	b=cYg1TbuFmNIP47OxNd4ZrlW1DBMNSTMxfxjKwaPxn4/l4Bac1vB/iB+Q4X+aKyPwA/UK
	 VM8ddNLILNd0rD2ctHhk2IgpT2MFSzM3hWvRHRk4RFwiwcQgfG6wDKoVLAGTg3s5fQrVs
	 SxLXbMe72ms4TmJ+92VqVSOs1a3Ne9io6KKyPuvssp+N8fOQBs2Hjwv/sjKkVynAmpOLU
	 DhsBU5QnzXDR3cJIZJqseR/6XJzz3UitigR60GxCGSvfW8izXPLpT6jzqrr8iFaJP+mmL
	 Uh500GOYVDc6MIq74/ofIgEydWnsBff37O1eRCXOdr77aj6wSNh5MLI4nN9MyD4yAcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D0q4/bumRjYNT1+Q9z7QLzpTICqzesgJk/uGL7R0qDI=;
	b=fWgrUI92f0xuJ/HrQ+EbQqbNQfyfuZeo/rGWZX7onvemY2+6dJ6REFurApb8gEgxlqyx
	 gHkzpktdSEi0S2grbQhZlX4O7/UKDjehxQVXYztBHNTR9lDMOkXyvatQykCLaUjOhb33A
	 PGzTOHFbSEhVbQUjEACC4SDy/UPjQx936e3pd+xu4JAnquxo9PeYiFFyBK/57aiXzA26F
	 +CeKCaKRztRihc3rf/tnPX9auX3de2CJK5CnIbHYn15KnLmiKyQsU3jiuHTRPvv6OCtou
	 ATLWpsUsO9Am7pkEmjJYDwHzc+/s8Cg8d9pc3R2dZuPslvRtO4oG+XgOQDrmHqRco3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFrW04aB;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E411606A894
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E411606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFrW04aB
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36d73027aedso145141eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519802; x=1795124602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0q4/bumRjYNT1+Q9z7QLzpTICqzesgJk/uGL7R0qDI=;
        b=dFrW04aBSJdGv7VbqabmWizLmUUhasV7olMq+x77CqBJYj8Z+WtPQSwOdSNGqRCZSh
         WPdYPxei05M/El++MwHv7t7Vq62dNUCfUXXg+w+FUvNxRN/uIo2DkR2IvNLkgtZUxb5c
         xwQJaArgZX4QsxtotB+OnygDaGPrUSxN57JNOOd5ZBDTw6BK6BkXAAooWaqNzs2MZ4OZ
         5eeXwdzuCWHKdLTcdkqLdXy7psmDUivEJyDJzmKPWBT4cWHgFN5LhTeW7qeDMjHABbR3
         Aqp9qW1xwTvuGGWp396z40dHTHmXx/ynT/H9Dg6n7O/53ByrUtfrS6gJ2TGSaKYZkDZe
         ZUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519802; x=1795124602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0q4/bumRjYNT1+Q9z7QLzpTICqzesgJk/uGL7R0qDI=;
        b=z5bYVragu5gwO1EVdZOZznoB53e+6HQK3v7fDKDCOPNMXhPC3QdslyX4RUObmKzKrm
         84BbdoKGWkWzFjlX4+HLBtdcaTjBfPriUje7YeRyqazNTye3A2PKg4qxFWUt4ZdDxsc/
         zpuMbOPFNNiVggYiIou2XBn1F7gtlbT7+D6Gsi+4Knd1IOV8xSHa9E3+v9hMlc9mbCLX
         nAlzN2NMK5XhClmXPMLZhMGbNDf9w//rlXsdr8XKjqdbqwAhaVeL1wa08LiyzquD9jpO
         NLUn7yNbM979Snl/kJ1skhMoIOMQ2KowhJU3MRETH8654ptGltI+kQ9Nbnb7MItV+fnp
         7Sew==
X-Forwarded-Encrypted: i=1; AL+hErFb5fz5cT0XXnL6RR5l+VzM9OaLCWTXNgGqwpiVADn8Sma1zlBJyaJuXhoPcMp2zt3GdG5p/4721iyvgUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RLrFjVA38X7aoYV7BvHYBRrSHfs8rZmGeAiFZOvR1T7xKinUn
	Q+dITgjHdmDMQjNdC8IXykUMl9ulb4NO68TV/WngHrYLn6CQo/+X0UzzN91zgCCSyuO7dw==
X-Gm-Gg: AYBFou1WyHTgNT6qwr9F5cd58pLr1ig9LfRyErK9QvlOR/RFkMpuc6OdSebxoOb+CAG
	bobfUx9LO3Q/octozMv/eG95sqnE/l/QoXriWAEN3XWoE/35TAN6leGWJS+z8BuDxQR2T/tS/R6
	pf5UYJqT2/hGUlqVqYviU7SjcLDK9HCIX4qf/P+eEvUBz1lkml+GaTcB+mQpJl58I+rcFqUUc5j
	ne6QrweSeZvtzrPWqcg7Fh8QhjN4NiuwADTKj+R+JiiBQJ/s0D3PQB2fLXuOR/MODK/4ezakP7p
	FsMLffOFahok3M2ROwuPTM7NRHQhko1fZXwxkVvP1xSuGAEd+DiZZXwzkKgx33Mm3gHf1CB8Y4K
	TlODrvcnV+/FVAkISzuGTV7g1gzh8k+DldRPlV2koITepuq9dcZbI8mNn1X/AG/oDP493ZuTBDY
	R/RuJQKOb6/5UitZo4f3r0TvQDGCNaxDlcPswbgQNd1Ei+W4cOu7b1E6gOTJE2JqScC/pvX/Q7/
	i2U3EUTi4hRxYa3N6x3Fnemb2RFsd3JAaad4jbcboJBapKhUyvvqO47uWaChT1VvwvcpgUMV4AP
	MkLZ78b1ZFqF1D2a23dmhjyr6QCzhIb57U7pbJ4CkacCAu8GwVytHqO8Hr1jOOvGpbNHHMWR3Ru
	niesIqiRkb+fVzCDxyIwLc1LzHKBLpW8mIRzLoA==
X-Received: by 2002:a05:7300:cc82:b0:36c:9b35:5d46 with SMTP id 5a478bee46e88-379681c811dmr418553eec.26.1794519802105;
        Thu, 12 Nov 2026 13:43:22 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm1194466eec.27.2026.11.12.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:43:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 4/4] f2fs: require write permission for F2FS_IOC_IO_PRIO
Date: Thu, 12 Nov 2026 21:43:03 +0000
Message-ID: <20261112214303.16198-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112214303.16198-1-dennylin0707@gmail.com>
References: <20261112214303.16198-1-dennylin0707@gmail.com>
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

F2FS_IOC_IO_PRIO does not check who the caller is, so any user who can
open a file, even read-only, can set its write I/O priority hint.

Require write permission on the inode.

Fixes: 5f95c1812a65 ("f2fs: add ioctl to get IO priority hint")
Suggested-by: Chao Yu <chao@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9d09ce597f72..e25c7166c367 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3985,6 +3985,9 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
 	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
 		return -EINVAL;
 
+	if (inode_permission(file_mnt_idmap(filp), inode, MAY_WRITE))
+		return -EACCES;
+
 	inode_lock(inode);
 	F2FS_I(inode)->ioprio_hint = level;
 	inode_unlock(inode);
-- 
2.43.0

