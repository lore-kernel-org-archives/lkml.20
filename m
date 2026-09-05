Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915636308D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622542; cv=none; b=B3MTBgl/iGYh8d+hmED+M65NYBGiEdAFIJAXUgm/hlbkJ/lBdhWkIDuy+5Ij7Gieg9lfKO9Q+GTX2ClLEuld10Xtg1vkKGoiehxRzJ3fn7T0L44cQ7SJ99DDv/Vl/r7MCiJjEQoSEJNmND/g7j4h8wM+cE94oboIjcj2xEs3JsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622542; c=relaxed/simple;
	bh=gFFdN1ha8Tp79B1B3Zl2oM554MhbhbybYNUFrHskT80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZmEGcpfyFAk7TYO2SxApCMybU18cYHPQtGKK8JW+nZY1UtdzXiUDeoYGNmKhjp1+5ZGKTr5cp4VVvyQUOgqGaAzIA7FB/gZ2cy99jYK0Vr18kA9tikQiu7Ebrm89Q0bOCo1K9Uin/YkLdJ6/j6RtIOTrMJ4WvJXaUwZZ16By+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTjc9zAQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTjc9zAQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9eeso102787a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622541; x=1789227341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=cTjc9zAQMQaP8tfqSHpmUzL9cnJNsB6h4OVB1xtww8CHinZZzYWWVHZ1eAPveRfp/h
         5stKEerJE/JtZyQpsMUxvDmVQyc3QNuA3EWZy+k27x8Zf0nyCvvlxIJScppa+GloAclV
         ubOVFf4gdWqX0IRz7xV4JTT80N+R9lQTS8X6Btp/pBRaaU/s7Fj1IFUFPv+6/g2+0CXM
         WahfTuZOGzkDeZSXDup5YxoKjKMTBSNvvzMHZX/wnJpUt+ywjFydLhUMdTKEODxCdue+
         DJvxQ/6xpyqGu1GeQ5bMnTcdONgvGfR+HR7xnC4WAEN4mv+MrPdbG17zCIucEKMBEDUE
         Ctcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622541; x=1789227341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAz1FDbqTt7J5VIP7BaX6RtKlr+dOf12zCQcqewm6No=;
        b=SMlrzz+aaZEWsxZIHRPyk6Fm0c5Mmk2gqbJjimUXu49So0FYb+LTpp5K2IkHergJ7D
         9Xb0MZYseaPMzkV26UvLwhOaBywIbyvZMP0kRPU8iRbg8oPZBM3zGUvOl1JNKsXo8EjX
         vW1u9yplRZYNQL0XmToYLh5YO35nwOz5wC5jeBF+Lnp5N/3G2eKS21Or4ynTDl2aIA+l
         eLUN/TW390Sqzq6yRCBYrr07SEqxGaIDVDdYcE1JzDJFqTn9aqU8gWVL//4O3G4seSai
         B1cuCL6iyKPscZ30+DFJR4paMye108yoHNRJ97p0s7vuxGSurwAKW5r87zhUibdFunkK
         Ehfw==
X-Forwarded-Encrypted: i=1; AKwUvBx6jo/LyHZXXwvH+HECUODXOBzdKySnT5vOdyNwXghb2TcY1Oec8DOvAvbBNmWHhoRs3tv9swtonVyRs/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kY/yPjMjG/u+XPpp1pwRUtb7pztaX0dw7Ly8FX1MMhpFS8USAf
	fKABhPFZjUoavv3zxUBT/IF43X72URpSuLBkIihP++tuovaHX8xSlsAo
X-Gm-Gg: AYBFou05D1N54W+PNAfSb4vkOe3ufZSN0XrOJy9UNVDJynFahBYcTLDIS0G7CD0D9PQ
	MJn7QYH6EZcTmXXsZSi9at7Uy0zpOp/WL9GhqFWuWBcpUr7y1nqNp1PmutpHkLMo/JTj1gRDVKy
	D75a6cwNxZDgYH5BAzlhYm5mehQ8QRBEPM3Y+xOzJe+eRjr7OBURu2ePxrU64vkMeHLj74lk5H9
	9kC1BtbswZgZ2HJJLYwdHLJKy4LhH1Ksinf0DtM+pT8vjGItMeRpPmgiEHu55qAsLCLE0O8XkqG
	k7Mjt4+kJC+pkBA+FrijPXcB9p+DnIyyRtVR1oBJMvj2O+Yewq/TOwIuGQhZnjqdnp+eHFRAgzL
	O0ZjGuvax/wVzOEC6Ogpf0sZdJWHBAJWLGf17YBo0VLzIGD29aI+KOv2bvhZvraw5H7i9JSVsrS
	MM0Lt6t8AR8hpLtm7D9jYmNzW3aHfkrZa1jW8lyww+GmaoZqHXoSfiTPneIhXySQ7WYtNuGaSZi
	FdLl/qvxiLXzLY9PoqfC91zVeheVy+6FQH4vIuGplOz54KB8YEII5vnP13BEL79X8Q=
X-Received: by 2002:a17:90b:562b:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39b3d5f2c09mr6126052a91.2.1788622540707;
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
Received: from fedora.iiita.ac.in ([103.119.35.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm10493484a91.11.2026.09.05.08.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:35:40 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	ayushmukkanwar@gmail.com,
	sashiko-bot@kernel.org
Subject: [PATCH 1/2] staging: octeon: fix use-after-free in tasklet teardown
Date: Sat,  5 Sep 2026 21:05:29 +0530
Message-ID: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_tx_shutdown() kills the tx cleanup tasklet while
the net devices are still registered. This could lead
to use-after-free when a tasklet is scheduled after the
tasklet_kill() is called which might run after the net
devices are freed.
Fix it by unregistering the net devices before the tasklet
is killed.

Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Note: This patch has only been compile tested. No runtime testing was
performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..98d4e025c301 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -113,7 +113,6 @@ static void cvm_oct_remove_device(int port)
 		cancel_delayed_work_sync(&priv->port_periodic_work);
 
 		cvm_oct_tx_shutdown_dev(dev);
-		unregister_netdev(dev);
 		free_netdev(dev);
 		cvm_oct_device[port] = NULL;
 	}
@@ -694,6 +693,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	struct device_node *pip;
 	int mtu_overhead = ETH_HLEN + ETH_FCS_LEN;
 	struct octeon_ethernet_platform *plat;
+	int port;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
@@ -729,7 +729,6 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
 		int num_ports = cvmx_helper_ports_on_interface(interface);
-		int port;
 
 		for (port = cvmx_helper_get_ipd_port(interface, 0);
 		     port < cvmx_helper_get_ipd_port(interface, num_ports);
@@ -953,8 +952,21 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	return 0;
 
 err_rx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvm_oct_tx_shutdown();
+	goto disable_ipd;
+
 err_tx:
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
+disable_ipd:
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
@@ -984,6 +996,11 @@ static void cvm_oct_remove(struct platform_device *pdev)
 	struct octeon_ethernet_platform *plat = platform_get_drvdata(pdev);
 	int port;
 
+	/* Unregister ethernet devices */
+	for (port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
+		if (cvm_oct_device[port])
+			unregister_netdev(cvm_oct_device[port]);
+
 	cvmx_ipd_disable();
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
-- 
2.54.0

