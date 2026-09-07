Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0543E9F5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817772; cv=none; b=FXsNpKyaqbIg+KLEw+mLRoNykLjoBCVS8qEZ6wgKOTiGjItd5roo+0QlkXjkQ0B4qWjDh78JepCf6ofkTAkrBh/2m78OTJ6ShfVyG53+j1Vnd0LcxmWxX31g/U94EEmnFyO76GS8Aw5pR1TdH+bQ4dsFdq2kjXPt/b2p134X9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817772; c=relaxed/simple;
	bh=NKh8Znxc/9XIRoZ70jnHk+tI5yLv2a+jvP9go5TtQ00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ab1vdb0IX+3SNAHdYKpmHcnje7utEI4wu4qw+s4mk5GG4PDthsmr/bfaNYagi2B0/aDQxBdrWYVmJcKl3Mby++P9iPl3KgKZNF9CnLeiQ/eGqY168yyUdkjQlyuJjlCxMIG+FT4ZEKWBvYJ3MdPWV6ql0cGJ0Z0eBzQ+xPtoAAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHbwvfjk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHbwvfjk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d8f265cbe6so29557955ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817761; x=1789422561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n1yg1E3bmI7Wbg6fwKJNa02J7OZ0jX9eIVPZOa1Hk3I=;
        b=bHbwvfjk9low55dBKJ8K0RBi1WkYswA7GyHO9EcBOCDeJ953b+WiJwifjS4jElq/7t
         qnYM64gcLIaZYdS/LX9uY9/LnWKv+ACc4pgLYdStn6fBEgIuVeMQR8j6pvsHeMQEn+S5
         fn7zpGfCg5ykHu93SZb4UBRrQFvPzlP1LBd48BBtGrxcTdeN73vUwXkRRxMkkwY2LqBD
         DXro9okrJMenWsshjHjYq1jDuIu2UMnkhRyJmUby53O0zDgLmsH0pC84z2gbNtuyP9bZ
         EpVq8zdyG7T04fGf2fmPpVV99l51LwBMupjrcO7z9M566GVKLNMaG0BR+RBD4gX7THYR
         oVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817761; x=1789422561;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1yg1E3bmI7Wbg6fwKJNa02J7OZ0jX9eIVPZOa1Hk3I=;
        b=KNYfeIhAJ7TgTtO8mkBN45eUWVnGJ3PzRf7Wwe4/eknwuouF64CRWczP2swvFgLNss
         pnhh9a/WddSg/o/pW71eq7HLdg9ZAMPGyUaPkrGnkYxrA6Bu2vpgqGDYTFicLkvOwwgn
         zJ/miSFgQ6hFHGBSTsvwCRlixdI7v8s2uki9HU7YOdoL22i5e3SKuCJJgtSM8pj823Cw
         GkEFQmAGOKHPbS0PUQ43Dn49nxb2mxrTYkWGfCfp9irxw8SIhNvr7RkvXp9S3qWR4L+p
         Lhu8ousvxrBI7QvdJikdkyOFDggcDDSCHu/0140uQCr1k1/FBYFB4fCShcNzFtgfN288
         dQJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPHiwXzEknDEO1X1M1zg6orqXVPG44UY9v2OaFZRqrMWV1XBIV4VqhiQtOEu2ZQBi5bQst6Wy+vwSySQo=@vger.kernel.org
X-Gm-Message-State: AFuF++lFmGPIt5PP+2ZvRHGicI7XIz4qal4Crm6112HyI3Tu7mtWnV9D
	tNQjnF5BDqv6ADKDNE+5utNDSZmlBrGXBfABXcXlXpn5Kdz1K2b/0r1+
X-Gm-Gg: AYBFou2OPUJfEgGiYPZLoPJ4hXwqk/No11X0YakZURr6KYlVX8urATbYR1wb3jASjPh
	97XYp2i+DmP7doIMcRsq62YbgdAkz91iVJ7vIqQlmSksx18NoDfs42zPOHFq5wYCAuAEYAWUlyp
	PLOEOP83AChRKcMQdt1fQH0cZWz/vT++bFi7iPM5SfBKrWwN4X3SpZtFIbaQd3TJCk1aEJbxH65
	THUns6YTsmTD6fmGV+scqELbeqzQ8JfQCHmwp4mBThq1pM5N+asrYJBfIVL1+M2wuhuE5lMttb2
	VoFMlYiUZCnez/RDtuuj+F8Rdab9BOcvk0wurr/gtlMMf+2my8HezY2fJMkFIsjZbSn7lmfTW7r
	QTPy7uF5VYW8XXZKrbv+wOMVgBeDAjuDaQcvKyiC5zE34As//eewcrf3dUgH5s5lc7y6hr0yVeS
	OpZc8Jjnn9PhlTBpGlzbqRSRq3KMkTvU65YAe9nW4kas4xhosZpALMUyp5wy64knZREOP2cHG+D
	knl8nZ32ni0PijyykLXkHvr5Rji4alaQfPGAjtjBY+M
X-Received: by 2002:a17:903:4685:b0:2ca:660:b1d with SMTP id d9443c01a7336-2db126d8c1bmr365754295ad.11.1788817760726;
        Mon, 07 Sep 2026 14:49:20 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841eaasm48794155ad.8.2026.09.07.14.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:49:19 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 3/3] hv_netvsc: Leak send/recv buffers if GPADL teardown fails
Date: Mon,  7 Sep 2026 14:49:02 -0700
Message-Id: <20260907214902.9046-4-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907214902.9046-1-mhklinux@outlook.com>
References: <20260907214902.9046-1-mhklinux@outlook.com>
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If GPADL teardown fails for the send or receive buffers, either
the Hyper-V host retains access to the buffers, or re-encryption of
the buffers failed. In either case, the intent is to be safe by
leaking the buffers instead of freeing them.

The intended behavior existed prior to commit 02400fcee254 ("hv_netvsc:
use RCU to fix concurrent rx and queue changes") because freeing
the buffers was done in the same function as the GPADL teardown.
The "return" statement in the error path effectively skipped freeing
the memory. But commit 02400fcee254 moved the freeing to a separate
function that is called later. It has no knowledge of the GPADL teardown
error, and so frees the memory regardless.

Fix this by calling vmbus_leak_buffer() if the respective GPADL
teardown fails. The later call to vmbus_free_buffer() then skips
freeing of the actual buffer, including any re-encryption required
in a CoCo VM.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hyperv/20260731201210.3653C1F00AC4@smtp.kernel.org/
Fixes: 02400fcee254 ("hv_netvsc: use RCU to fix concurrent rx and queue changes")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/net/hyperv/netvsc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 5cd084e5696c..e9292c3fac92 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -316,9 +316,11 @@ static void netvsc_teardown_recv_gpadl(struct hv_device *device,
 		 * rather than continue and a bugchk
 		 */
 		if (ret != 0) {
+			vmbus_leak_buffer(&net_device->recv_buf,
+					  &net_device->recv_buf_chunks,
+					  &net_device->recv_buf_chunk_cnt);
 			netdev_err(ndev,
 				   "unable to teardown receive buffer's gpadl\n");
-			return;
 		}
 	}
 }
@@ -337,9 +339,11 @@ static void netvsc_teardown_send_gpadl(struct hv_device *device,
 		 * rather than continue and a bugchk
 		 */
 		if (ret != 0) {
+			vmbus_leak_buffer(&net_device->send_buf,
+					  &net_device->send_buf_chunks,
+					  &net_device->send_buf_chunk_cnt);
 			netdev_err(ndev,
 				   "unable to teardown send buffer's gpadl\n");
-			return;
 		}
 	}
 }
-- 
2.25.1

