Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7454C224C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677081; cv=none; b=bCeEuN16EQXW5RAsJTK5RJBkIoY6BpasNzt23QnX3+qDrH9bdxWLU6+2HBHKVDd+TbVrFN+JAVXu15Sy97OviApRiHtrWe8KnAnzzaQzIioVEfYLSaGyK0ipnarG3LZmq+xzvmFUx+weYKpzgQb/UzxIe0nrZeEp2k9Qn4IgRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677081; c=relaxed/simple;
	bh=An6mkPZDYZWrG8lcKKYm9brAuxjDgA3tyL1/ir2SVvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2X7k18FYzqjwI/tGT3WhlEe3bOrgdZFLJMbsrVeQHWlLLNeamZwSvbiMoF0VP58NfFhNOfVj14f644/BqMbA9rMdJEKAA9sIeB16nrYU0Iy/E+OyyS3IBD72jw6hSN0ll0g/+pKRw6qexO0Cf9H/KyrRtcMfhpy8qi6ShfC9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVNRMy1W; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVNRMy1W"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so1823289c88.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677071; x=1791281871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBxqqrX6VFrTTZg5kn1+eJIOqRCLIYMSYIE031U9CBQ=;
        b=KVNRMy1W82VMa6evEJQFwzBGvqNAdhkM9STuV5kF8qrXpCrnfcn9pb/HdkajfYbcDo
         1fSwlCWD+3WPj3JKwI4bHH5P5mmFlbDvzyGKe5eYQkggUtmRBY6o0Nvelcx/1bBUbZab
         7PDvyxXzVdpB524q5eqrYYpxQJ3ui2HfR1xwfUpQWhBL53x+YFgyo3+sDEp2BEyA9GHc
         SKwih4f+aF9w5JVd5yuO0v9Nqo4Zz6kfh6J5pi87Skj4rsK/Rug6xpHcJHFgRxNQrX45
         9EBod4pDP4PnCx5Bnghe3KC+OuUoSwo9P/KxfNS26LLyPEGNXTxZePvJelzN4MdU6KH9
         z9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677071; x=1791281871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBxqqrX6VFrTTZg5kn1+eJIOqRCLIYMSYIE031U9CBQ=;
        b=ywYCQF0bFzXK6piKPdAjAM7/umZBKCMnUHYZGlWc8DMoaYX91Ly4FJT3h8+Kxi418w
         t4Za94bH5OIZc/gVIGSogrWh1vWXLJErmeJ+K+2iND5QPRTqRx/yL8jkK8R18v8m1yQX
         IBMs5gO3xQAUky+ZOzC3x8BBBq+7jkUD6prhefWIRK8Z7XxJ91Tqe/xGdYgyHa1M53+E
         KwVN/UidQheHUdeSYVS63nKdSwJ3qkzF0tbIpK+eMdGdgAmGYWMr38cQ7Pnb7Qyp3YzD
         kRX/jLavvvhCke632yQCFMThzkd/SpetFncKz2S3gLUyfejQV95v9Uh/eMeJS4GP5czC
         ddOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwse/X0LlhjKNi9fdKoqDI2YN3Lm8AkoAG7xQ780Zxe7H8i+ukQsyPg11hBFnO6FEG/KKrNsEg7RWAPp+0=@vger.kernel.org
X-Gm-Message-State: AFuF++lFKWng4j4cjb1kMT5wcRzKyxQdSBoxAy7fjwO5j3OFzVseFKu6
	xrFE6S8pVXVTiZzyjgg+iVKJjTqg79XYCQtAxW4Q69jL4kpFE8JLameV
X-Gm-Gg: AYBFou3e0BfpxZXjehln9bxS0lF8IGpN6PbLbAAAfmtNgTFlr7EE2TST7uOfKTdb4wr
	CMvL+/Gh+XdRZJDnRkEjhYwmf6HnlTGxzC3Q7BPrNq1C+msYfkL+llab77kxNgW5upQDaufFNVb
	/T8ZxJfUsB4/mnFzDMkhJXcs7pvG5iIZmA3ALBcN/DikKnox6LpUkMqdQU+R9dqECHIPFjatrS4
	rx7FC6AsbubCo3Dole/DgG3UWzmw9zLdNkKNoAk6jN16ahlYR9Yy7Y3+0/gUwZPcfhNU+1lBYW+
	sa+BUUK7lEWJBnJ5JQVEtkRFFedUXhZXQNWozGORKOEetJBT4vNzw1EL+5f2abJb2U2U93frwZ0
	CN/lkW1KjXORMfHGt5kfJNTAHJiCphmZsUoL/qHOpetLePIT/QdZ7QAxnxQUXe6aL8huFptgkck
	8FJbpfR2ywd9kbiWEJHwjomgpP5hC7nwCg50XEUmwyjDxDw+9mAG5XsL7+MQ==
X-Received: by 2002:a05:701b:4344:b0:144:fc5b:2121 with SMTP id a92af1059eb24-146ce67fa31mr13579743c88.17.1790677071222;
        Tue, 29 Sep 2026 03:17:51 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm34324648c88.13.2026.09.29.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:17:50 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] atlx: fix kernel-doc description for atlx_tx_timeout
Date: Tue, 29 Sep 2026 15:47:13 +0530
Message-ID: <20260929101714.51579-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing @txqueue parameter description to atlx_tx_timeout

to eliminate kernel-doc warning.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atlx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/atheros/atlx/atlx.c b/drivers/net/ethernet/atheros/atlx/atlx.c
index e8cfbf4ff1b5..0a6205e5c19d 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.c
+++ b/drivers/net/ethernet/atheros/atlx/atlx.c
@@ -182,6 +182,7 @@ static void atlx_clear_phy_int(struct atlx_adapter *adapter)
 /**
  * atlx_tx_timeout - Respond to a Tx Hang
  * @netdev: network interface device structure
+ * @txqueue: transmit queue index
  */
 static void atlx_tx_timeout(struct net_device *netdev, unsigned int txqueue)
 {
-- 
2.53.0

