Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574904;
	b=Gm2NFX/R34feQyJF3pikC7ZWDXiQUYJkR1SVzFV5uREVjKks/gzNde2nobNasXL1b+B1
	 POmdG5P0+zSmGE1m0qkC90WwtYWURTbXkvpIoPZTuFoe2Te654Z3uW1ySAQ4FdDdx6e+Z
	 G3cWsQLsKdlR30l6KTg4EPs3SsS810/Yh5xPitK37jhyUeW+J6oY4rGjupXyOcscm2ERk
	 VPdZIz91odaiDIo6Kiwe9FsHTEN9Es2KGQYyLqvcNB55aphSpcPXkkz/4uNocAFKqBNCT
	 tjfrCxAKp/kQtzmUYDfUR1BLQIhGyDRTrNfDaP4urbnVvIZ+LZgccQrQprSFoKivk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dS9EyPR31sgD5ngavZ4avec13/Y4TPfrqwtVSgg1KpU=;
	b=Dbit4TqpeQOMms0pquU0JyoGM2Czs1zx2KahJGvQmBlYGQNshyhoIXqkWNtq52tNRfrO
	 zPv8uGQM+Phyy8lofnjy70yiK3cIsHRTBYVK/f5y5nEMAlC6AQdoiB3XFtCW6Sa0jM0uw
	 iPirzbgNtQD7OM5OPPLKFLTzwFvHlk/xS5MRFVvlc3OymRIEmI0fVsF32SfJbkfEZuP1u
	 Herq1hNtA+0ugttQ8dsqVQICBqwdYhwvEC+9NW5jYUP/nguq7FPFhR60flYmcbDvmOg+W
	 ziwq4VzYjse6eOV3sob7bmxgPzhQg+Rgk8v+O/v2ZYj14fjiXxev4ZVPgARCJT6tiYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YII6ms0i;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEC8606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEC8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YII6ms0i
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6115235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794574902; x=1795179702; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dS9EyPR31sgD5ngavZ4avec13/Y4TPfrqwtVSgg1KpU=;
        b=YII6ms0iqpD4miklHj44JtXK6mRH8pZXnqxdSEJjbuMPQu5C8q6gUL/p6jdGyzbXMk
         JWx196u9vfQtd42MXsJz4wdmYrcW5655ftKKzJfhrPXsrhUk9Pdqx/0dotPXIruGzf3Y
         XBb4pf6ufxh4Ks34ywqGMlcZ5RjXkYOzjeCtxj5qrytRA10n2yNVw9ALYmxCccrcXY5K
         /bW6q3SBvwOCxdp4yDNfMPihR6fxSXs4uoS212hMg5YN8Dg/FZSHF7xl0U+KODeTRpJI
         ZLiFK7S2okiagl2ghkX5/YPO4uUHziNA51uo+FXimlpVxRR4Wr4Lwj9iGd9xWMwjG2lM
         Owxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574902; x=1795179702;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dS9EyPR31sgD5ngavZ4avec13/Y4TPfrqwtVSgg1KpU=;
        b=N/gzGl7VTRN+1q0Ge9+PP97XqZbJzF7GERg4LYkIp0LG9gJ4p4VLiOm/1yhA5GCx4i
         Qn0X/+1u+Mp30O6UyRd8dJJkfmAeBDI605dCD8CoyeSVRHsPGBSsoLpWc7qG6lcTB20f
         jTj+uiN0TCRmV9mRK99/TRc/U4sjIJjV64IVs3YwGgiGvG4V9+mplkjaO4ht4yxeu6Uj
         SqGV6neTF08vlJnMAXaSVElNCXRVjiInQ1OQpBwmgTgxMe/M4GW5xe96s6yNGs+Eas1d
         ICRfTNXGfEMH0G2V6xv/QTrV3RSuf0DLYDx2IUs9mzKglsNO2kB1CtrnAktJn73Rcs/v
         8iIg==
X-Forwarded-Encrypted: i=1; AL+hErE0dA4xZIS7ckvXJnKRXeAoTG11Jn5R/q4LP51u8b9+s7Z4qbX05hlw1LTU7/H3C1z2ovj/bFO8wg5u5eA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xSKmg9v5cBscoP5+HtPj81pkfbrXLl/Q4HNvyQbYCDFqoUodL
	fL0do5CN7MsjVsIDdwt8YVWLR5q9d1tASCE+q5BV9QtziHP7qdpg/BIc
X-Gm-Gg: AYBFou0AxxWtka6r3xxGAhernS+my/fO4Tdn3+M2Ul6ioc0A18zYt/w9z5JbwYwvULC
	S90dHR5gBB53qNhv+5xNPi7Rkxl0XMRt7hwV/qq1k8Z53ezt5vtzLTxuHi5RBtVITv6k8lf9fhy
	ELt8c1CGyz+dsu77ZTThPsnUgKD2FW5fkIoELZGHpnYZBn7tcjii4OoEiEWLRguKwR20vsDu0yu
	F9Sh5Laf63ltXRmebo3NOOy+qLw8U3SBuSQRw2vDMLds1ESQ16s09FiOs7SCgOONIf7Gy8scsW+
	QKPeznptXqyCSGfinKAgbUHa8yMINmpQwinWquD+ob2dm0NUDa6U+sMWQV4uWrusrvxYV59RGmU
	CdOZdbzN9VmurzpV6MPjCv9zG2wOnN45lXTa0ztRNCIC1tJu45AKi1BjLC/gXrQIw+nCMRBMn41
	CZbQbWvf4DOekVeG0haKsuIeuyDZEG7qCrQkyqFZ3ZeiTnV5axFaStc/XN92tozZw56iNuNPRy+
	ekdYOnN9aJjySF6rDpOvKXb+ak2PHpfOnM70CnIL4nHGi/xb61fs+0V2MxA2H30wn7zT7Xy2iU1
	xXVbbH7JsDtdYS89Fy74KPxCYMFbAJRRa8G2OpZTwW/AdZB1Kz+WA7BcqXj8Y8E067ZMKRwnqcM
	wQn7oZUs=
X-Received: by 2002:a05:600c:c05a:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4bb55a50e9fmr40374425e9.17.1794574901964;
        Fri, 13 Nov 2026 05:01:41 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566cec2esm40477495e9.1.2026.11.13.05.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:01:41 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 13 Nov 2026 17:01:05 +0400
Subject: [PATCH net] net: via-rhine: Stop the NIC on platform device
 shutdown
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-vt8500-rhine-shutdown-v1-1-9448ea9548ec@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSw7CMAwFr1J5XUtJKiDiKohFmhpiFi6K049U9
 e4NdDlPb2YDpcykcG82yDSz8igVbNtATEHehDxUBmfc1Vrb4Vz8xRjMiYVQ01SGcRHsXYg+3Or
 Je6juN9OL13/3AUIFnueoU/+hWH5F2PcDcA2ain4AAAA=
X-Change-ID: 20261113-vt8500-rhine-shutdown-b2ac8a702688
To: Kevin Brace <kevinbrace@bracecomputerlab.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexey Charkov <alchark@gmail.com>, Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2049; i=alchark@gmail.com;
 h=from:subject:message-id; bh=slih1j7uIKXNSsFl43FCfxGqI1wEAtZXMRnxWUVycdI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR95zI24fh6/PurCQZM3rqeYVafV6etKM6PvVt4g/vlw
 bgrsk3yHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1YjHD/6QO/+/uExfOUOCYFRS8UTZEtfP6+pucQlfuHo5YtT6ZbTbDf7+tjnt
 U4u4833uWL/LTYlXDlF8LPLznXM8IFnR2sQ2N5wUA
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Close a running interface on platform device shutdown, so that the chip
stops its receive DMA before kexec hands its memory to the next kernel.
Do it in the driver, as the platform (OF) variant lacks a .shutdown
callback and nothing else stops it, unlike for PCI, where the core
clears bus mastering ahead of kexec.

Keep incoming frames from landing in receive buffers the old kernel had
allocated: on a WonderMedia WM8950 board, broadcast traffic alone
corrupts the next kernel at random points as it decompresses and boots,
hanging about a third of kexec attempts early on, e.g. with
"unrecognized/unsupported processor variant".

Fixes: 2d283862dc62 ("net: via-rhine: add OF bus binding")
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/net/ethernet/via/via-rhine.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index e56ebbdd428d..dbbbaf7f20ac 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -2461,6 +2461,17 @@ static void rhine_remove_one_platform(struct platform_device *pdev)
 	free_netdev(dev);
 }
 
+static void rhine_shutdown_platform(struct platform_device *pdev)
+{
+	struct net_device *dev = platform_get_drvdata(pdev);
+
+	rtnl_lock();
+	netif_device_detach(dev);
+	if (netif_running(dev))
+		dev_close(dev);
+	rtnl_unlock();
+}
+
 static void rhine_shutdown_pci(struct pci_dev *pdev)
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
@@ -2580,6 +2591,7 @@ static struct pci_driver rhine_driver_pci = {
 static struct platform_driver rhine_driver_platform = {
 	.probe		= rhine_init_one_platform,
 	.remove		= rhine_remove_one_platform,
+	.shutdown	= rhine_shutdown_platform,
 	.driver = {
 		.name	= DRV_NAME,
 		.of_match_table	= rhine_of_tbl,

---
base-commit: ead6fa9a0ab194f02a2f36d634b193e9c5f9a1c6
change-id: 20261113-vt8500-rhine-shutdown-b2ac8a702688

Best regards,
--  
Alexey Charkov <alchark@gmail.com>

