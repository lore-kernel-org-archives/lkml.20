Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961A453A54
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141123; cv=none; b=FuohklVAFTfpLCUAl9qOOYsvyZjFNhhZmwoRhN/v9w/CzWCN4WYtwlN70SJRouF2ToMEuXtmF/qiQl+wtciItO5I3tXXYdIQr0xtkslJPXR248m3UVtQTKKCVNq7/wGzH1n1mkhtpVkarnRInQG67eSssqbmbWYfrP9kpdjS1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141123; c=relaxed/simple;
	bh=gdjPnOQrLSM5BuhfTWXU350XcrToK/vEq1DOpk2BN7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hnrJuc7eSeA9+yhGERMUNRp3/+lVwfg6zgf36kYBw0AB9OlA0ubwrH/Lrw2kL6byrKQ+PqDRf7u9uzR18h6pNi6/Z19uUu5Ec+1qmpzfsLX7bU4BUWX4W0gA06TbFUGMmAYcn6WR4vEFymdVCVsuMWLkMdAMyBxWBEwPhlwFoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dU4a78Lm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb2NhC32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dU4a78Lm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb2NhC32"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lvvs1611472
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=; b=dU4a78LmBGbUPN1o
	LtncCJ7NCJGLOKarUsGDTnLULo3/SFSvaejA6QDPCa5gv8O6sONoX/DIwiMgIAgT
	W4HDEIxFtkfIa7X0um6uFF7R/BBOzGDNXW99Xv5ZUIwOtSW7//ggNwoEcw6Wv02M
	Gpw7m/t1HmLivL7anva9svEqEDf2L5omYK9jO6K0Du53HDWH4ocf7cK7qRob26OR
	G/ZjAKrAObVY+T3/AuiEHIykO42TKsBPhLCweHp6wC6GrrRLtieUNtQhZR4ERrAs
	FIvdtg9hkZKj20LjW2g8AQNgpEEW0L4qgh6l4ZNF4+ceK5fl4mKCQSadlr58USEj
	d5lT5Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3setxcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7186981eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141119; x=1792745919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=;
        b=Pb2NhC32ruTwt0D/PWgm1MVoYWeJHqPQKsHGWs7PDL9Epajbp3Kp/rgHx2gZvxZjTF
         idbogUw/gmgo9jOzAYRxFoNxPn9fyEduBH08DzknMfxxm8g3w3JsK0rItc9meRQgKjWv
         Nw5NJMGbn4vsUnWmORxHGIsrsMLyfeytxQw9pWHni+1tbRdXU6gtuiu5WhaQsd13p2Ss
         ooCm+1JNx6DHXxc7ME1qj9E83Ik2cligGL4kd881ugrfhelBacLSp25XKarpitaMc2QH
         /poYbx/bRVXFdX0rV+V9K1eCcfqm35/pej1Fos2Z7n0VJcRifEhznsu4ej0714ypkdRr
         3Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141119; x=1792745919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diZI0o+V3nuL6+l8kxgqaxJ04TAbeJ/sJ6LSIDp2hJQ=;
        b=CI1cEkfVZeh3FFwXit9l/qJLy0lUsKMyP4s4oV5gOOs3Fse7iJrn7KWn7ltiXyW1ua
         NFqQnCn2OfEz9lzwYzqHkv3t3imhJSKwWFa+G+1/Oi5UM7g9mZBS36hZoUwWGBtHA7jU
         s4Q9z99V9bYgKEf8SEsFscnbEYMT4lLhYjg1vhfzk3uWKHisigBzQd7BA9ksapRHgge9
         KMpG+xgZn0TxAzhbY+xlw7/UDX2niHd3P+gbwqHqTc+1J+K6GsukD1t2sEFRcerIFT44
         lv/Shp6Fc6P4y/MSxKiYjCg0Lvreb5OwKUbpYNYPH9EHq0Q5eUkUJdhofr8DqzyvyVEy
         mTyQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0Z3XHj3ClxQAtivra/ggP6q7wiS32y3dePiZ/1dP3m1ImF0gLOe6yc0wEnEu0127ckIHDQe8wTsoeHbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXQlJVl6UM1blItpt15yHSb0S++lwSuXzqtDQiOCfhUbtjaoZf
	eseX/O0uC88OIko1y8THkaBhCMI+cKRws5ss5cJl619XD/EKeQTCphHjmqHKeBtiBr2Y1PY0874
	e7fpr+5HmgCdb3lmvS2x96is0yU5TAsoREAoa/+bF5Z4ASAs1NR6pOWOGaIB8S65aJ2q11sL9gA
	LMiw==
X-Gm-Gg: AYBFou1JnTo6IiOnFGUzZADrp+ZXPNL6sxGXZbBwfZsxuWMvBazshw20z++fRFqxHHA
	z2WSOMxpuhCkLULwF0YmD53hiY2Rp7FJ0IbBS5PA1ix8RK1ReUvn6T4lQhGZjGCXmGMZAydkyjh
	AnfJVQkDPfyXVIu+mzHMlvucf5pJhAkd/HIvn5yF4x3yjjiv/lHSTwvxLvodujJRL+4TeXPl+vj
	63Xi8Wa0O/60+sXa+0abhu4uCxV91yZzYUwfsJ55lSetKX6n3a52QUNs0FphzI1sCOzVhOchCLQ
	4IE9Zo9kBq/47rL1OBSYikYW97BJR7M2hGDdZ5yrYgPqDGrRQoJwET3W6w4NhDUdslQ6GQYdnCu
	s6kfaP5I2RQQMVoJUY8Grp3BSLHq8qeeFklIgiqX9Llln1IXYwuCImTQ=
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr13854005eec.3.1792141119418;
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr13853970eec.3.1792141118870;
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:38 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 01:58:18 -0700
Subject: [PATCH net-next 1/3] net: qrtr: do not take the sock lock on
 blocking recv
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qrtr-add-shutdown-v1-1-e1cc01ca5919@oss.qualcomm.com>
References: <20261016-qrtr-add-shutdown-v1-0-e1cc01ca5919@oss.qualcomm.com>
In-Reply-To: <20261016-qrtr-add-shutdown-v1-0-e1cc01ca5919@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: Chunkai Deng <chunkai.deng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, jeff.johnson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=1467;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=gdjPnOQrLSM5BuhfTWXU350XcrToK/vEq1DOpk2BN7U=;
 b=qz+Edq/z5T4C2brJNUdgaVHrcSfqDlWe0eu9Ie9ggtGNVvGh3Mg0QavMvXkIRBK8g7ZeiJQ7c
 kFbAnm7MnB9C166sRYrA5JMtc0Ho2OmV/gLORKGCJjeczGNIw0teJPs
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-ORIG-GUID: _X7nLNVRkN19KEdB7M-Oo4ukPTxRtChF
X-Proofpoint-GUID: _X7nLNVRkN19KEdB7M-Oo4ukPTxRtChF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXxyqQC5DNP7zZ
 WNoUDLE0QM7RVj+340uoYtf88GycYATO8Iv8Gn3mR/MUw18vyWlJlDhBUCFHVKxUZchRld8rPlg
 o92bn+B2AutwCAMD2hTvJpqExImlyA0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX6HbjOCz+PBiT
 F0TEywQrRQ9MYWMfEG3hT1trW51zgkQ3u+PogIPMNhqgPBz7kDM65OeOQlR3sVeB2cvSgxNaxdo
 zvYTjeu7r1DHISNWSknsWXun0YDUtG7HzMvcof8NckU3FRyP7C9VDrW2qo3BqB2JuwcXzKTkOq/
 jkWrVZjlJWKPWV86z8ccJ4ZK4PqYpMc4fxzGgsGsGr67x9xSdhS6SWLQ3O5Z7AvVGWfBtnCBECX
 QgYSuX7DIjC4WcoG7CU+46fE84o8oBUP6TO/qH5YHfai0/n6Yge70zaGla80i3IQu86n3aZOdbI
 fvH5/AEqwlgiDLqeMTuRcfmSKzq1no53k5xXJda00kdtp0lwpuGzy3WwNyLymlObnkbE2moOamJ
 ZVtM1kAxNOEQyzKnz5tRA1IhcYkDLd+cAzqUJOlpY0f/TlzI3rEZIQZPhyuN/DMLoSJ331idYT4
 aTkQYgGsQaR7NsFUTzQ==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1e740 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=k-Ub7f4L2iafiF0gtMUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

qrtr_recvmsg() takes lock_sock() before skb_recv_datagram() and keeps it
while waiting for a datagram. Any other call on the same socket, such as
sendmsg(), bind() or ioctl(), blocks until a packet arrives.

Take the lock only once a datagram has been dequeued. The receive queue
has its own lock and the enqueue path never takes the socket lock. The
lock is still needed around the copy and skb_free_datagram(), since
TIOCINQ peeks the queue under lock_sock() only.

Testing SOCK_ZAPPED without the lock means a recv() racing with bind()
may return -EADDRNOTAVAIL for a port that was just published. There is
no ordering between the two calls anyway.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index d02ef9a74c3ca..2d7339338e460 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -1034,18 +1034,14 @@ static int qrtr_recvmsg(struct socket *sock, struct msghdr *msg,
 	struct qrtr_cb *cb;
 	int copied, rc;
 
-	lock_sock(sk);
-
-	if (sock_flag(sk, SOCK_ZAPPED)) {
-		release_sock(sk);
+	if (sock_flag(sk, SOCK_ZAPPED))
 		return -EADDRNOTAVAIL;
-	}
 
 	skb = skb_recv_datagram(sk, flags, &rc);
-	if (!skb) {
-		release_sock(sk);
+	if (!skb)
 		return rc;
-	}
+
+	lock_sock(sk);
 	cb = (struct qrtr_cb *)skb->cb;
 
 	copied = skb->len;

-- 
2.43.0

