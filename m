Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161121;
	b=lV/snQCBKF/Ot++hHdqRRS9xR1wGH5s8rGNMRDNf/2AwdqlJYNKnYhx12sj+2vPiuTq/
	 9UyEPS2To+iuI740t0+0f3YdDuyzFUsfnAgFak9vCJdRiEoZgnseiFB6OASc+WKyx5TOn
	 JyyorMEbYGLrr2js2DJu07lZItBXd4YOQFTHnFPgEjSjm93GpRkxJIMXsjuYxUelyjbZo
	 ar5lG2YbwfjVBjaC5iMyc0hw2R44Kd6o0/1EuLQ1zgTpQmzdCk30NcynSNhw8ndhe91l+
	 t+Pumy32fMDFoiaDr27pFPjk1bVa8u1yL38ROrCc8rtGx6sKn/K7XAImfNptRqvbOAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161121;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fe+7DTcGBmTBDi8FTxAsffrnfSNL5hvzZQwGUVeOWFQ=;
	b=zWRuUswdHOSU4BQfS+h+OmU5y5lDgDujudmUA5XbnfbjRa7WTHjXJsCegpoEmGqht1Qs
	 NtgKigalNQv8DPeQ0FHhRHp2vc5VFxJQmj/3iaPVzpBeO4rxxTLkoQ+XY1fylqeKMg7/u
	 E7U6HmI6idZA3zoxi9W6J4osqKeSccQ++2jy3avYkwWKMU9n5TjOhsYkKdEWWS9Ekfyst
	 eNHfIXPKel3fEkrBK1qM8wUJBDS+1WljjIKTOBCy1neApZeZ2F7TehpQcb462QqMOOm/p
	 XOh8UAFPh/hmYzey3n7Q0nke11zASpuheKaDelP+9+YQrBqOYf/c67EgJLzUFv5ZZRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtTveKvJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDA606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtTveKvJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794161120;
	b=0E7tP+oxGf36dn5u3MNZvkystTBn3guzdLKnhcpOdt1mKATeZZnN11aPljPAL9bv55P+
	 btzeFVklqrl4YN3fKHEDPXKtQyxKg1lqBzxufzQJ64gr/MFCOE3aKmkG1QXIpW20QU+eE
	 UA8FH8etPosnetDTuTXqvv6I2zjUkwxGq4n/ciw3XFCPtPSOoHmHnsY04q8+Maq8iWi//
	 OaSC1/DdmhZ/+22KYhXSyBw3wbHXEZrcyj6JjkncCosdbzak1ZTw8ZuHpGPw97PwRVCyh
	 WwFmO9QLGDQkCyc4hh6uuvDQ9bV5ANZt4X4C25KkI5cREmNwwlAhB+I3D9kV5iM/Tlw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794161120;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=fe+7DTcGBmTBDi8FTxAsffrnfSNL5hvzZQwGUVeOWFQ=;
	b=opP1CBDAR20EqBhNunwClJndeCUgAygFVcHGF5SlzAPBb+FhQymPrkUWE5B/5kuOBvU4
	 tTM4PZ03L5t7jIwbDoUQyUsqgBW5gvgggXdhEVg690FoMCauhn46rQDfXFHGSti1QMJz8
	 SS+yxgxqroPvm932pROLYDcwSHM74/pkNUfSgbLU11Z1qQMrUS4eM5UlfDJMYrFc9FBvS
	 7TNu3Y+BM5sUCBafVfgSA43/uv+omk8vC5Camo9yVISDorxKMYiYc6TJM9nNEuworgI8+
	 /ge5BS6+m2GQmScc5/805GeaOYgJ46ATKrbP7VWNoIY+9FdYrUF5+R8w1O9MOwAJ19A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 070501F0089F;
	Sun,  8 Nov 2026 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161120;
	bh=fe+7DTcGBmTBDi8FTxAsffrnfSNL5hvzZQwGUVeOWFQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OtTveKvJ4kiNaVg3JKYUKTEkJCIMv7C9RV/3tixGJpKRt4LclZ4RI0zNdV5qWzC8j
	 OHuUXFFdy4atJqHSuQFp4dgU7h6jlOCbKZex/dUdYVbGBan08xfLVMqCsGAp7/G2lE
	 Zfo7810H3vCXA4Z3v2LVAAKAnCc8ApCRXEjgPJcRjWqh2cbCkRSnZsVS186pvGYEtL
	 jZ6RRJwXwarq3rIBM/+Hh4M7qshulacc9MitGk2VoZQcC/4S0CfsmCnwiaWhIDPXUA
	 g0gjINS0MslnGBj5L1xWmZ3LR1Br60tMwjgxdBuKt4xBnDHYt6LPDBbWCnZRtFzDbt
	 H/ehquEn0csWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 794BD48016;
	Sun,  8 Nov 2026 18:05:19 +0000 (UTC)
From: Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 18:05:19 +0000
Subject: [PATCH bluetooth-next] Bluetooth: L2CAP: validate MPS and MTU in
 ECRED connection response
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
Message-Id: <20261108-bt-ecred-mps-fix-v1-1-e7419bff6ee5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN658GoC/x2MQQqDMBQFryJ/3Q9JRLG9SukiJk/9YBNJ0iKId
 ze4nIGZgzKSINOrOSjhL1liqKAfDbnFhhksvjIZZXqt1cBjYbgEz98t8yQ7227Sg3eqb82TarY
 lVH0v3zSuP5QYy8IBe6HPeV54RjcRcgAAAA==
To: joasantonio108@gmail.com, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794161118; l=1814;
 i=joasantonio108@gmail.com; s=20261031; h=from:subject:message-id;
 bh=34wckLfEEjtqROx8Y8etwAGduFSLltsni91dcXOsWjs=;
 b=JOL67+BGboEO0cbR9h/gnaPrmUWK7g9PvIhV/Xd0Z2eTBLZCTyh4DkN/HYheJ51R09XZuflje
 K8MnIj7UoGvCJb+GiP2XSHauO2csQFIIaNgt/cSfZbNWqqcq4FtvXC6
X-Developer-Key: i=joasantonio108@gmail.com; a=ed25519;
 pk=ZxAznJT/FcPPdzLrDDFJQm4LLjjHVGBBqDSG3TXS23w=
X-Endpoint-Received: by B4 Relay for joasantonio108@gmail.com/20261031 with
 auth_id=1371
X-Original-From: Joas Antonio dos Santos <joasantonio108@gmail.com>
Reply-To: joasantonio108@gmail.com
Content-Transfer-Encoding: 7bit

From: Joas Antonio dos Santos <joasantonio108@gmail.com>

l2cap_ecred_conn_rsp() does not validate the MPS and MTU values from
the peer before storing them. All other L2CAP connection paths
(le_connect_req/rsp, ecred_conn_req, ecred_reconf_req) validate these
values against minimums, but the ECRED connection response handler
assigns them directly to chan->remote_mps and chan->omtu.

When a malicious or buggy peer sends MPS=0, l2cap_segment_le_sdu()
computes pdu_len = chan->remote_mps - L2CAP_SDULEN_SIZE, which
underflows the u16, leading to an oversized skb allocation and
potential memory corruption.

Add the same MPS >= L2CAP_ECRED_MIN_MPS and MTU >= L2CAP_ECRED_MIN_MTU
checks that l2cap_ecred_conn_req() already applies, refusing the
channel if the values are below spec minimums.

Found by LLM-assisted manual code review.

Fixes: 15f02b910562 ("Bluetooth: L2CAP: Add initial code for Enhanced Credit Based Mode")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
 net/bluetooth/l2cap_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 4dd56e007..c3b8f0f46 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -5711,6 +5711,16 @@ static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
 				break;
 			}
 
+			/*
+			 * Validate MPS and MTU per BT Core Spec
+			 * Vol 3 Part A Sec 10.2
+			 */
+			if (mtu < L2CAP_ECRED_MIN_MTU ||
+			    mps < L2CAP_ECRED_MIN_MPS) {
+				l2cap_chan_del(chan, ECONNREFUSED);
+				break;
+			}
+
 			chan->ident = 0;
 			chan->dcid = dcid;
 			chan->omtu = mtu;

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261108-bt-ecred-mps-fix-a5f18dc06329

Best regards,
-- 
Joas Antonio dos Santos <joasantonio108@gmail.com>


