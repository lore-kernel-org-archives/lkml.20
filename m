Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB44A4EE7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154769; cv=none; b=uVtlqyqUizRI4w79hewzRX7FTYD6MbxYHv6OTHYfXvdq9f60wrVLer1ePn22Ipq8osgnifx6EAZ3RmGcpXmeHXXHYVdKEwH5p0Rhe0SaLKN2+XDMUN/2wg2xBOlSfRsIqUuws4z5D+Vho80DEJbtUEQOQaFkKi5bopp+1brpsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154769; c=relaxed/simple;
	bh=lKAkidrvbBJ/vTXYNpqVpCG9VNbWjHMk4s8lEayu9QY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8hZ+Qb8vjovJ4P3+9oZr2QMY46vKw+Wgq0MyYOT2lEBo8suGZ6wg6dU/UdYhbe5KNLA8rBkCvBlnX4/Hvi4KkXfym6C2HOudiQkMXHnqx8C2O8FVdpmerDVXS62hj9/mNxC6TihhWpKzLL+3pe9yRspb55AWd9oXdYxIrgz0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boDcVw12; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boDcVw12"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2574019a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154767; x=1792759567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=boDcVw12UrVWhMkX6Y79s5SYBhSnNzOYML/hJzXJsU7wbdaUQYiv9Kfl2zjUzvuZL2
         tc6Ijo4lF9PJiXKns5vs1ctbNfcC41qzmYtWwg6WhPWjS49NaQCtB3+YfI0YuF9sEOB/
         mxNeY5YMajRUhe2cePGZPfXmhgijhEfAI+2boCtjKLpXCr6QH+97Ps4dyjaMULOLhcfw
         wg6wpT4O8OzJaHHrQucvw5kfjXnCKbwcfjGM6G3LXvSEqDLGP95zMcX+qPXawzuUCAiK
         fQRPIpN/x41dYlp14jtKhUwph1eQy6t1o63dVhOQObxCFHJd6Q1Xzct0zCjrAkcvAmje
         ypNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154767; x=1792759567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrslgNHse2Dg20EAEUVpp54Hl92z5vT+wdBvkKVG3Qo=;
        b=kdLK2eDDBIKmZFPzvBcHwocZkQ4yyMQS1WHuBnY19GN3A25wqwqfXZq7EEpIWS7/3G
         hC/tlK+ILu316djvGRGnZt8br9ygq04h8JLZwhXC+osN28GlzD9XkBtVpJu6MawmBUNc
         pZ3zcjyrdv+YVVtHUeO2lRRUwo+vbbZckq6oJWqLfihlhvMbaUY/xammRWAcXi5gsH9Z
         Mg9VR7/gMCp+ncu3qHMNjPhtljpNs7TRqyNJaZDk+ONDMEUwx1eek8acKI8y9SF+5UAA
         yYK6bMB3B6TB5V/loEfIz21qqgqPM3wxJsJ0pWiP8e0/6UE6tj2vO5K9SN0GeNUP6nJk
         mn3g==
X-Forwarded-Encrypted: i=1; AKwUvBwuYXVZuMTJf47dhcNXAK+wUm+IVSBW6p+wX+hLCoJ80TUL+yhFP74s0nPUh3uawVqjtgCQzl+Ow48w7Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfea1CBjn3YyMn9ndoH8pNJH6qrBfe1Rru+byK8DiXEZBbegea
	ECcUS7OM3/rjQaJ1cD4xlfBnflIpEUU8GcXHoRFX4M23OzPmGJ8cQVvX
X-Gm-Gg: AYBFou2bzSf0cZL+kwyoddNE9lGZYR7b2OLjImn9Y3zCNqChSwcFREBDIAxczneroJ3
	ECv0DeWs3MNgTFT4TIV/XdOYd7zgJ/iwsdK9GH/8hQrQSH3EM5lcdFriYzVeyVIRMOsQeWfNHsj
	1ZUh9QMzbPAwagINr2Iu+G3vySk5cY906zZlnCe73UnMAocpXjdCXWeC+tH2W3zpTWKeAnMHZ9T
	Posc5eg6F6pghAiUW8hYTEoC89CcUSTA/cDxFxsxRY63rMeGmNF4+vlvk/r+iftYXOG9mNSd34v
	F3LX+vf+9BprHgI40sgXJ1/D7VKoVvLja3L3QbXZ5Ic29CVB2S2/7wwmtSfGCi6Bh05gTXw8Bi0
	dVDAYp2thZKa4/gyCfTJkExFsULfelGYNc3rzlq/TPxWfz1E5wMIYvtVQmyAYD2mFtVn+S8jXxe
	/XdtGufWtUh+qDq3mzfC1+v9Fh0e1uO9MybrWtistYQ2HlygORHO6vnBsugGJdUU6pnIbpZhGzc
	XkSb1q4Xw/P/A==
X-Received: by 2002:a17:90a:d604:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ac8af94f17mr5664608a91.42.1792154767359;
        Fri, 16 Oct 2026 05:46:07 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ace34c8d9asm753751a91.5.2026.10.16.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:46:06 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 21:45:59 +0900
Message-ID: <20261016124600.31-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register"), qrtr_node_enqueue() returns -EAGAIN for every packet but
HELLO until our HELLO has gone out to the node. The HELLO is retried,
but the NEW_SERVER announcements sent in reply to the remote's HELLO
are not, so a service registered before the remote came up is never
announced to it.

On Kaanapali the modem sends its HELLO before it accepts ours. With
rmtfs started first, the modem never learns about rmtfs and its
watchdog resets the SoC about 40 s later.

Retry each announcement for up to 10 s while it fails with -EAGAIN.
announce_servers() runs from the name service worker, which can sleep.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Cc: stable@vger.kernel.org
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 (out-of-tree board support)
with rmtfs started before the modem: without this patch the SoC resets;
with it the announcement goes out on the first retry and the modem
stays up. Starting rmtfs after the modem avoids the problem, but
distribution units start rmtfs first and let it boot the modem.

 net/qrtr/ns.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..33a9c4449d6f 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020, Linaro Ltd.
  */
 
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/qrtr.h>
 #include <linux/workqueue.h>
@@ -226,7 +227,13 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 
 	/* Announce the list of servers registered in this node */
 	xa_for_each(&node->servers, index, srv) {
+		unsigned long timeout = jiffies + 10 * HZ;
+
 		ret = service_announce_new(sq, srv);
+		while (ret == -EAGAIN && time_before(jiffies, timeout)) {
+			msleep(100);
+			ret = service_announce_new(sq, srv);
+		}
 		if (ret < 0) {
 			if (ret == -ENODEV)
 				continue;
-- 
2.43.0

