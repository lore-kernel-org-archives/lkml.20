Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793562537;
	b=lCRGqZgsX4sn/uLpqQB0Te8FjpXaaKXX98klO3K1CbLsaf828uZivP0ANuQDU2D6UcTJ
	 lwinl1iSi3rBQi1GA7f5/k9UISACCG5IlGnsRL81o9P40mETx9t4q3eap/O+LK5rdHGRn
	 J2h10hWaKn7VKYYPtSlnpDD+/XwvG+77phQwl29dysYgza6pZNlHHqLvixF2RKZ8Yj+od
	 izwh1IVj5Mp/0XlFquhH5o5Fan2kUnNUQmafAgGISwfgsy+N7/ZTYkDR+s/HvP3z9XnQH
	 P340v23ZnzcEcl3DW+6u6c7OOZmkgV/qoWdBr4ZBYWwAdAkRZyRKguWzWzQt4E/P1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793562537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
	b=KskTQp0vHEommMdT/vgSo1M7kUwKsWKBBjY5QfNECWs12N1MlTdlwLmWKHfmLQpIj/mP
	 fv+Yq53lacjqAYiTBxQIO+C1Th82g1HUW0axp3bQ0+XC3Q7GlayNkUxpcy3mSrautF2Ol
	 o1PIWt4rA2EkADpbbGZZ6s6wYb/hN66k8mnWAFDJJwQMQXmYYSaak50q1VvzVa42IuZkQ
	 2/1ypWM57Q/mGvJWT2rlrqPwpjO4OSpd52oQ9CwwyC9KXkFY7vFegZ1a6wKZehVSADhiX
	 Ksx91YHianfG2D5p5idoOQB4tr2SWq9Z5loKXFJByA4A52TbqscvEshEImFYUb8vOZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFU9xYmU;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B58606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFU9xYmU
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14772655e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793562535; x=1794167335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
        b=QFU9xYmU/L6N9hQKi7stq4UplEV/6r8zefAQp+PjuqRIJisR17AK7U1OftGHMnipEq
         Cl2TA31hOOdiNuVoE7wM+G2S2OJB/QfdSJMfMMG00WQC21DeHkRX4qmiF0pSaXWUdBRx
         Odyq4C5zX7+skq9S6qgpXHuIMwgklqwk9GGkSzz3XgIV+KPY0pp+eIf6Q4000DNIaoAt
         4Oe7KScLKAl/8JkSW5Iyg+oB4TIv17aLhFn2MBhqf1wsCr2+uaIF4mlpVUdlfez68SQZ
         huJzDB83aaTWCtZT50/xAWnTyVPT1rK8FadaAjbuB35XCZe10eOeqo0wgX0bfmj3NUrJ
         LCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793562535; x=1794167335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEeoRplq5LZHzrY456oul/d2PVq9rdUpin7S14J3okI=;
        b=G8/7d3B3D9Y8yBQ1A78I5WXuGb5LBgHPW78toUUk5/sda+chlBy9DRAc7sbt7ZaqX9
         5mAzn2VjQFK/WoBTiVtHejNjXmWa7DYx34wpf1/f9YZg1rFk7hpEgh0lmucS+DlAhP7F
         DWr7hzmJIA5LL+H+TvXrYbHTVX2G9wm4xdo8i6rhyzZGqVimoB0UnX02kY/3Jjxg9AjK
         emNBeW2pxJIZESLC4sdFhfte/Q5SBG1zvC2dvR+iuENbEELtV38Dt4Ghu5Vp0nDfgkAj
         FKWHQcCKhdZOfyqLzpSYJE6ye7FakCz8UyqjzKLogFD/D49xtuiU/3wpWhzS8lqzu0A7
         S1sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz3nZbyqe05HBwp+laTISv2glUA2ViNFMBisP489kPM8i7grEIiAclV25JN0v0n9pbdq9da2p2U25Yj2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK11MIgNBCbHB9PgjYuHytdPLnn/renj/W7zw+fyidxWNHg+1PF
	tqh58zBxx8U+OoqaTW0mOZwTUPvHe2K1H2wIyLGub8yWaGMybfQszZ/b
X-Gm-Gg: AYBFou1p9fxTz0QKZH+A0wX3co8ngGbflOixm8b3fHlekdEZcdjKCvanZ+0gSbXSKWB
	u6D/PQSLHVG0vwDQB727WFSdex2NjXLUKwbRbdr5gBTlsgnaH5YfjSP6QEAU8yg3yzNGyWYJjXa
	8dv5yiJqOtqMCJAFsE469iZAGVKyNqLUwbm908ZA+fMSVGx+clz34AaOVsBT1uJLK+jgWkxZtP9
	gIEzBhfOCV/Gz20uMZsNmXnq0C7YdOUcAafHCw4SsxcbvJYCqaYqmcAMIaOUF2E51rnKsiKSq2c
	znx4j110eEK7KO11ZCAgPgaffv+/vGuG7YpgOdVpqxbwywpiS3dfF2R0j+U7mjhkxpeSZ3inRtV
	DMp7ByJyck5P6QgzuZmWtUHnxOHV0MojZPgeHxrgSEDFgE9eIJiOxyGTkjCalcEqXZLnNDlbZY6
	AM8PsHJQCicipw+8/OogKFEYdCgR1nni2x88rHQObOsPxiGEa19mzw23LojPiiTlmPGdpQBxEBM
	I0uidGsNWxXk7dSVJtLMmQaFFt+m1SAc2X2Yu+PJ/QNOekw2RWSLc9TOwXyR1/vs7uYckYffYZI
	Uzs8ginhRrgfRg6GJd0ZslZRt3SOW2DTYkeDyN7ObX8=
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr194625525e9.32.1793562534985;
        Sun, 01 Nov 2026 11:48:54 -0800 (PST)
Received: from cachyos-x8664.hgw.local ([78.182.223.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm296179535e9.14.2026.11.01.11.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:48:54 -0800 (PST)
From: Muhammed Sariyildiz <asiyee994@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
Date: Sun,  1 Nov 2026 22:48:14 +0300
Message-ID: <20261101194814.188536-1-asiyee994@gmail.com>
X-Mailer: git-send-email 2.56.0
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

dump_queue() finds the message queue's stats by brute-forcing kernel
indexes 0..255 with MSG_STAT and comparing the returned identifier with
msgque->msq_id. This misses queues whose index is 256 or larger, and if
no match is found the loop ends and the code goes on using a stale
or uninitialized struct msqid_ds.

The identifier is already known, so query it directly with IPC_STAT.
This removes the loop and reports a failure if the queue cannot be
queried.

Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
---
 tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index 4b4c1ab..f4168c7 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -130,21 +130,13 @@ err:
 int dump_queue(struct msgque_data *msgque)
 {
 	struct msqid_ds ds;
-	int kern_id;
 	int i, ret;
 
-	for (kern_id = 0; kern_id < 256; kern_id++) {
-		ret = msgctl(kern_id, MSG_STAT, &ds);
-		if (ret < 0) {
-			if (errno == EINVAL)
-				continue;
-			ksft_test_result_fail("Failed to get stats for IPC queue with id %d\n",
-					kern_id);
-			return -errno;
-		}
-
-		if (ret == msgque->msq_id)
-			break;
+	ret = msgctl(msgque->msq_id, IPC_STAT, &ds);
+	if (ret < 0) {
+		ksft_test_result_fail("Failed to get stats for IPC queue with id %d\n",
+				      msgque->msq_id);
+		return -errno;
 	}
 
 	msgque->messages = malloc(sizeof(struct msg1) * ds.msg_qnum);
-- 
2.47.3

