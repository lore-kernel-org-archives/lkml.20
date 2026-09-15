Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DCF3CBE9C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437591; cv=none; b=B/Y4mxeRxFUJV0LkrLBgS1koLoRhxdfkWRCIUvISTI9ItyPosa7ho9Fnrci2o0kOuDWbk3zZRkkmZ5V1YT9+tzGOFszYoJAMtnrg9d2qMZwNPs6VKSzT7AVw/FGLKWDQeTzUWuhD//IarM97Ui+HXsMGWfrXAAggQTFpjyFBxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437591; c=relaxed/simple;
	bh=+uL7gF2g0/TZv16n3YoEteaP89TWBxkKh2ww7oIIoow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvZzd5qBRDA0d2GESxtLBB2jhvATCp00DTpz4oTrxDhzsQhRYuX9+0AegDlZa0juKop3KzmZcmYXTuWuH9QQbAM9vYwkEqrIwpYU/kIyfzNnrTbNiSpKGA+o3cSbfh3Fbe8ppXdxsHrUZfvTlwuz2asneto3HHySz2nHtOn8iI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wa0tJGb/; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wa0tJGb/"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb4so384716685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437589; x=1790042389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hf+CFdNUbLJ7V2+bEHmHU2ffZSj8H/v1W4UactONX8U=;
        b=Wa0tJGb/EZd20gZAXyj13eRHQdpYXzMv+WKkX2tURKfIT9EJa2cN4pZvaIB0k7iqnM
         EGcCierq2QGs+8S9fpvyHIyIw+Aw+WxF3+PfJ4XGqVPXAJM2srg3sRKfu1KasLgbHB0O
         3OBIP9NEucSippujmyccms7O+REjeawIhP3j9VeuNk4G+Wg206FO3GfyXrXahumNJIT3
         QbjU+1jIiXcO6oCQbXl3Ire/FfUE9zbU5hrzhN/xAHEBkVYeypftntP1dmhPKfsSpzgb
         1JaKUkKxsKr5fB1VvNUXrXQeo3HOFFUHONfptX3wMlUshmCIefCvRr752BM3qGMQzaMi
         r+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437589; x=1790042389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hf+CFdNUbLJ7V2+bEHmHU2ffZSj8H/v1W4UactONX8U=;
        b=SoFXcqTVOmNlf1oYDblg+Gh0YMuP6tyYNIaEhrMVpX44SMHk0O1h6M/eJWKOEyMM6B
         mWKIJBdhpaHb13AfiJ8gZzhX850zgVolIg4kM5DDBufpuOKKhxDZMM1ZvCmUY1/kpmV9
         vOVy+ie4Iaklg1F+KrvFKa/WZsQgooKMcF+BBMv4QMCffOJYle0MK02vRNnAzq1BpzKd
         YmwjJIrJaPk93s6Ki9leX5dTJHw3/M8K9vEE7V6yP8PAOA52tGMLaPvKxa9GnV7gBo5i
         92lRdp/lAIXEm8GQksnskrm45UIvUuwOj/aAoJ7v75cSQ/Vocg9Iw18MvWiOI6OAJ3/A
         BG5Q==
X-Forwarded-Encrypted: i=1; AKwUvByvsg/t+WjhNFTlva5XizbrbsFrvcFexnmTSK5O6/skj6H55oC33zybyp67TRfgGivDOZ+Az0cZJCmnMcM=@vger.kernel.org
X-Gm-Message-State: AFuF++mlTzJD2cwWUtWTw/BAyrb2o9Jygg5jsPgDXdcW6EMj/KPtJqle
	MM2u9LioucRQZzokqD4UKZ/SrDcyHu29niZ1ccrDr9zI7LkVPkvjtLc=
X-Gm-Gg: AYBFou02dRzuHDKfvCxeQu21Pntfe2GSk7g9cBrrolRPx+cTSmaSevqMZCigsO/96t4
	pq7r4cBaNNzHKpl7e7eaCcnnmcMDDwSMMp+RqI7BPwIbk6tndnA0URzp+0eni4dnASbly10adYs
	B/XgXCFrrgAZSIqDCk2irGsinBytGaFtCMpSGs9BnTUu87jQd3LcLTF0xtWF9vXRIBmLWE0fHbN
	9MBZyMv+AvF3FAnlzSe4gnvWGHGQ16wOMnu5BGOpWkWglEwb8uop8vTQ8QJrBDV7XNTLVInfIjk
	TQa3iWh1vzlLsjUxD+Sn7uD/+4QnRbw391yBrpZxmnGKCkvVs+95o/ktoBnOGSfxBDWwHzCU7rJ
	KGnbyj43YLJHWaTXI/Ds/ix4qEPK86kZdsmDqE/xW5PXo+0Jtssrdb/+S3s1VxVnxzcRyZ1CfDw
	CynT9oOQXouGiRCjnzF4N07EGhLkpOF40uYAv24T3fNfY96GNxNw9Z9Xia76E0dPE/uWZaHPD0R
	W8761L9Mgq+GXm5oDHS+N+QkpjeKIrUcTPGCKljvy5dm4dZAoygvozvoe8U5jogFrGM59bIwlsG
	pvhnCxb43D2PK/Ubsj1zq9H+ze3UW1JI9U9tNimUAGuKEUPIZsYzdUxq3GUwc5kdv8DkKw==
X-Received: by 2002:a05:620a:1a06:b0:92e:520a:ffab with SMTP id af79cd13be357-93a29a07d87mr837367585a.38.1789437588673;
        Mon, 14 Sep 2026 18:59:48 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e807eba7sm1137116085a.29.2026.09.14.18.59.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:59:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Kevin Curtis <kevin.curtis@farsite.co.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] net: wan: farsync: Disable PCI device on removal
Date: Mon, 14 Sep 2026 21:59:40 -0400
Message-ID: <20260915015941.86661-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fst_add_one() enables the PCI device and disables it on probe failures,
but fst_remove_one() never releases the successful probe's enable
reference. Disable the PCI device after the existing interrupt, tasklet,
mapping and DMA cleanup has completed.

This issue is already present in the initial Git import; its pre-Git
introduction is unknown.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wan/farsync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 6508c53..0ea6372 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -2561,6 +2561,7 @@ fst_remove_one(struct pci_dev *pdev)
 				  card->tx_dma_handle_card);
 	}
 	fst_card_array[card->card_no] = NULL;
+	pci_disable_device(pdev);
 	kfree(card);
 }
 
