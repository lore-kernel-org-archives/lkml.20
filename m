Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1C38237B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790457511; cv=none; b=eygcpPtchPRogatpOLT0fhvLTj3OI1Q/o+dNZcV8valDGqOPWcQ+T3qwKhwepzoDjg/Mfs14qogHaz1HphRYVHggbJBR1+G7R34+5d8GchYaz9iXSZ0aCVODiLpSegWdaXeydQO2ltDj01E0JzXnt5boCVOh6SbDLbh96vGm4Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790457511; c=relaxed/simple;
	bh=ryFFIZQwlBWdWNo+Aacx5hmk4ccvP3E8KncHVG8204E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASkldHCmUGRX8+39H9X6kYrzIC16uNDHSS3jZVhQ9Qto6z1vuJfcVpJVO16Vixin93JmVYxDXALjzugj2BNeauFWB946b8kRLJBbQmAqZ5lylCWO/qK0M2jJyHps3l6J6ea+1VhIgvKZCgwONYs8zepab/zRO/rGfTLDs+u8Vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evk6PTdr; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evk6PTdr"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so805980a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790457509; x=1791062309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hKYUvU1uRkOorxf0eC/LBTf/LKSxA/wOyNWUbMTeLQ=;
        b=evk6PTdrpwiQSRs3v41tdlNFVEL96ueR7KvkP4k9ZK53NQLz+5bk1QMFZ13QBgsRAv
         9yhLNAABLoLmdqYycDTRhrLGx1gk2+2u9UdowVC2Hrz8Zncz9QRTJJ/HuRryu398watO
         SeHKylb4OjYzJyqbY3v4NTgSPYUy30veRsnu2LaezgoQL88792MDZnQp1hHLBmlzFd8k
         KrwFdEuVUMOTAYdoc24nw53TENOYCN92sfTq/p1vAU9PIJHgURYxagOvzfQC56QQ7k8p
         8df15NGREK30edp8bdUw9PnKQ5MadwTndsqpztbV1MFDubNzg1wBwVSN3Uc1Ud2qiN2m
         adaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790457509; x=1791062309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hKYUvU1uRkOorxf0eC/LBTf/LKSxA/wOyNWUbMTeLQ=;
        b=igC+1EPUxpwBHJkTBIDwYhlhSKJa+8az+GF1DKWaV+loYkkfoLugl2oAp7XW6pRkrw
         G5HkBdA02+oX3tYpQTOzxdN+wcintkufjB1fAkVuQxqe+t0HJYkNWyQZRO7hmi2WGLLQ
         D5TT9nyWk9SIBD21FvB+KvQ6WDcFt3rMKAcGlnqStkrf2xLylKfwfT7i7pCXaYwOgF4c
         Fd747W8pwV4326pHowq33DU43VPu1oIIyNeXwu8RjTU2eu/r9m8DUDsRA+QSjB/1bkrT
         h8a2w7jEXSLlP4UpnfhYMzCLLGYdBRjLmh4fHISzRskDRLsRugl71rFaPlRTPPTYsnlx
         sDNg==
X-Forwarded-Encrypted: i=1; AKwUvBxxU4FWIrIurXPj6+4zf9U6JMDE481myFS4kixgmfLpvuO3Q8Xg9cz6nxWg0zy3NkXfj+7B47j6fuyDecA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbbOmejxfq6fqOhWVD6wvldIpL/IC1XGmvIhKI3xJ71G37ynME
	bxkvk+eXt2nMm/f7/PfFL0kmPx71X0if7zzlRbXWpPaMazTfGCVeE9gy
X-Gm-Gg: AYBFou0Vwj0pRAsnLa+Jc4KphZdvNnwvSBErltJCNHM88iGwR+9IqbYfu70YKD5rpsS
	HqM+bNwOHRDW1gRHi5twmqdajgiHjTPQJ+HWSBHRY8EY6hB5CER1R/go5CNR2St0JK+XfGGOYk8
	YJkVW86jKrWDFmf9yxv5YDLceOu7lFy60pHirh4d+dHFPR01u0IofoKFElxjk/hKWCU3RQvrCZJ
	nfsTn2STS7McbrFJZsdZo+Y6S45GvCrgvWXe14HuCI8Piv703d0UzsaR63PXlKemxqxkX+TZ3bE
	VzbP2aIht83d480JeJcnPAudlUyKDicp1vtGOXLBPUPSHDj56opAciuZVIwEMBmXLeHbLqDN2hf
	xHHYBP25iBt5U6lJpo4AoHhbvT87eRuelFRm7jVSBboTiNKIp2hGREpHsZyujT8bR2SHCalf80E
	/OM1o5ts2mjm88BxIdVngt3Qx6dwBauYS8TL746IaoGBCcn7B6G9+qPmUR0NP5toC0MfzuhgwF+
	T+8CjLKfX4KB8RylRedwETW
X-Received: by 2002:a17:90b:28cc:b0:3a0:d440:7950 with SMTP id 98e67ed59e1d1-3a0d440b3f7mr3243034a91.4.1790457509496;
        Sat, 26 Sep 2026 14:18:29 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0c3f74e5bsm9473204a91.5.2026.09.26.14.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:18:29 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/6] net: dsa: motorcomm: Use NSEC_PER_SEC
Date: Sun, 27 Sep 2026 05:17:31 +0800
Message-ID: <20260926211813.935723-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260926211813.935723-1-mmyangfl@gmail.com>
References: <20260926211813.935723-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of magic numbers.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 38dd4ec60bbc..7717f1e17923 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -28,14 +28,14 @@ static u32 rate2token(u64 rate, unsigned int slot_ns, int unit, int C)
 {
 	int e = 2 * unit + C + YT921X_TOKEN_RATE_C;
 
-	return div_u64(ldexpu64(slot_ns * rate, -e), 1000000000);
+	return div_u64(ldexpu64(slot_ns * rate, -e), NSEC_PER_SEC);
 }
 
 static u64 token2rate(u32 token, unsigned int slot_ns, int unit, int C)
 {
 	int e = 2 * unit + C + YT921X_TOKEN_RATE_C;
 
-	return div_u64(ldexpu64(mul_u32_u32(1000000000, token), e), slot_ns);
+	return div_u64(ldexpu64(mul_u32_u32(NSEC_PER_SEC, token), e), slot_ns);
 }
 
 /* burst = 2^C * token * 4^unit */
@@ -86,7 +86,7 @@ yt921x_marker_tfm(struct yt921x_marker *marker, u64 rate, u64 burst,
 	}
 
 	/* Check for matching burst */
-	burst_est = div_u64(slot_ns * rate, 1000000000);
+	burst_est = div_u64(slot_ns * rate, NSEC_PER_SEC);
 	burst_sug = burst_est;
 	if (flags & YT921X_MARKER_PKT_MODE)
 		burst_sug++;
-- 
2.53.0

