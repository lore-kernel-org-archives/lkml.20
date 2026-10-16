Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC0457E69
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141127; cv=none; b=Fy85b4keUFT6LBOy/uVtleHEKu5yzzYOSPMrE+0yrRRx95R8ZXiy2GK24rcR2ep9qilZYwOesxHTdPrDO+b/Ne61hH79+UMJZHqZDr0P49x+cIF7MQewzf+/liGC6w/ekPrt5Q7em2/XRPYp4+J/BGB21n17rzueTgPTnFvvTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141127; c=relaxed/simple;
	bh=8Cg9W/VqDPpxJP1l4PDNRsec1BC+6QLcbtrneiacO90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XegLaGDRbhIeigufA1QG9Os4G92hrKMi+Z4+JQej5PtdGJ2WpFcfNrd24EzR+x11SgFA7TjwFHoXFaOAYLURaWQyBTXIGn0IW7IuXTVWNv1pVhIPHK+1NgbJIWFtP4Rt0Gm7cxqILdeyPi3xLCmp7+/I0RjVH2IIiPNQdCSvR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prY0fydv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZnkJa/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prY0fydv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZnkJa/X"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lwuX2219131
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziNg9NxoSUN4305GBlBnhwtN4upme4eDf/usG7Qbn1U=; b=prY0fydvJbZLkJGc
	rJpuT3zBzeUK5dPt0w/fJ2B+halnt8x4Rg5I+LDjohaJbJpjxWsZRbE6Q7x33ORj
	IezRx3s6BYwrAWkJCjOOxzT3HpvGjU3x/HsoXdmxocdclg0fnUp7YNiifJjKiMUo
	n5MUodR4/PFWVdZAe9vLU7cy5Q3SGNS+jxD759vQngtZLjovmo0R4L2BPNfyvGE2
	nIhRyIr9n5hu8Ljmx9hG+f7mESuYEOrK/u8y5/r1e0BvMwBIUDvMz5s06XmDrNib
	tZxHfdawYSzOOpej0Z4DqS4oMA87kpciKhCQBVO5JQJjghkJ+p9y8uF3m+5Us7HH
	seEx/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3n3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7187183eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141122; x=1792745922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziNg9NxoSUN4305GBlBnhwtN4upme4eDf/usG7Qbn1U=;
        b=aZnkJa/X6ypz8qRwEP4IHd47G/OJ1TbKjbF0y3pol/ApItz73FkNM7l73rrs49Mfh0
         NXQeE+/5nyf/hrnJ6GO96gcB3c/9ypT0k1BSWHETnxka3oakyE+X+Et9Q9P7D531kccn
         wFYiqXaYvpeUWPE/PdpmQV1Y7BfEMREHOzudK4VX98oBrqpcGECPVlA9vbSmPmcSvXHS
         NV7vx0bCht5HVeGH6eX12AnoWQ5SugLlBjT9nK4xbREqk15hmpL9qDUauxJEPXSqTmGe
         vcfop/KCwm3f3uYv5tEDm6Ej+owT/3O9qn/rSI2tVNjfXa0vW6sRz1Tp8T/2sb09qC2M
         y/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141122; x=1792745922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziNg9NxoSUN4305GBlBnhwtN4upme4eDf/usG7Qbn1U=;
        b=EVSkdvNd9sCVMQCaQfRp9Mdcn6HKeWOqxuHOOSY5voL6vzsRNPck2Bxk8oHBA1+Rpt
         G4KA9C3cD6SFfumM0BvZXdq0rSqL9Woaml3lq8wRLuJAxNrk+Kexe6FALhsxAE5Wx3p/
         T4TJxd/gFjBH9eGJYg1zzuYZiqQ77On6rVgvXASyEKItvGoD7PUfRxQTWuaEVXNNh1z1
         60b6qLCR/a17s7H7tVK9BENRQVbTn3h47HiisMwP6DrS0CzQIkqr5mODGuuEPpQ9ud82
         FeEDZodQWdqkmeDhRFFxeT5zfj+xAbzeajo02oTtIOtzfvkXYhdJl+nAow3GE5si/qYe
         P6tg==
X-Forwarded-Encrypted: i=1; AKwUvBy1fp2med7Qovm00UtTYN3AVTj/wW1re1814Mwbhbing/siK6v9QW1MpFmxS1cypyYjoqFjsgHKdv3dP+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIit/Ktr0nyBQYzPM4bF1tWOF84QMijQmWdB7oudOinXzAw/Oa3
	VaNmQ/y/ocU2fscHXOnoUOmbPuG6BMdTlxvSZKFXO6hGHRn1Htmfqe3aUNjwTJqt8XrMpvrGyJi
	R8DcV6SIpYeOYzuDPBlwBF1einxI80nRD9T3s0oj2KQhYim07VYMkZukDj20w0F9c9MRFPbnE/8
	sg5g==
X-Gm-Gg: AYBFou1bazpfJuD4ijJpE465wnHpfEG3+PTlVGesfF0IS9WBIMi6Em2cqt9EABSr+Bb
	4BpyKjvWVUIq0TCIIgDRGQyg1HymgXRhSCwOi5/4OCAcbiEPArAgIzOIuJQZOUsKiTlcto2WeSp
	ydR6g7qKX+Xo4u4knuQNTbmCI56T1KxWYm58X2VDYAkE9NP2l2jF+M2cJQBvtLLK16HbrRkaJn3
	8vmaRGfmUBav1iNNqvt2zhQB5usgbHM0wetzeSEkrg5ndNn1ajkrIm//6bFg85z8IswKc4aUXh/
	uch2PiitWNw9Kg2Q6TBzjS6FVuHHePONCqesqFHO7HjOnCu5A5Gl1Ll7ucqwAHk33ooeqErD7rB
	w/mVXi8x9Z1tRzXiBYOZpTkCtQylw+lPPZizgVz2Qfk4YDsKik7URVOQ=
X-Received: by 2002:a05:693c:66d5:10b0:35c:3dd3:9410 with SMTP id 5a478bee46e88-35c3dd39553mr15036362eec.30.1792141122411;
        Fri, 16 Oct 2026 01:58:42 -0700 (PDT)
X-Received: by 2002:a05:693c:66d5:10b0:35c:3dd3:9410 with SMTP id 5a478bee46e88-35c3dd39553mr15036342eec.30.1792141121926;
        Fri, 16 Oct 2026 01:58:41 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 01:58:20 -0700
Subject: [PATCH net-next 3/3] net: qrtr: implement shutdown()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qrtr-add-shutdown-v1-3-e1cc01ca5919@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=2830;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=8Cg9W/VqDPpxJP1l4PDNRsec1BC+6QLcbtrneiacO90=;
 b=tsbd1XCAahBbSDVdpBUCqEjrx+aW4kI/713JISZRFcHHRo/jjHZMxn8hzGwdxWEZ751VLnnBF
 Oy7cE4cHsVyANV/8uguh/Fu3GH4cNJkrfdOleeF/TjIgI3RGzjXSny4
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1e743 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=m2P955qNnlo4rMcBazoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Qx6verLMGBax5MAp_pklzkh5agYv2BRv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX+SAd5HPD5vzf
 1Ts4Lm19C4Xr9dU67OjhigU0OTzjz73P0GsokhtI02ADrRWDGJiicpXOapfbLcj7ogZPhKYOBKs
 gBaU/pY250k8ppganJ9ad6S7Cr/tMkw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX2X5/4vhV/L75
 f+q8aUt7E8X6Q6p8G2f2osq0KvwApEQc2FYTKsTVbhiHEHGCtMeckoSmfPk2TYgeNeTZcRxz/Le
 cUz0ckHP0ZLVWS6oOa1ijq0tb7e5ppC0OLECTV2rsPduXxSb0InxL+iNw7eXSyAt3nyVtrzSreF
 cpXO3OcXsXKjVjdh4gdSaNkdZO4VbqIreRZEOgMT0B/uZGYkrTestgh2rThh0g+J+OL58B78D5B
 Di4HQtAjGwipRhnvwEi+WreZCBeYlwwJwLCRh8YSNE2cCxkadk8k8q1P7NL1HPq+/F5qiKfe5BS
 isuMryjwFxDM0fnTv6UQCHjqHTMNTRvINQCzdk2jdZkyITGQd3eqO9GHn6MQY4FQro6TeDkFMay
 /q+7y7ly/oWndYpKHTxMbVIL/IEE8ulYQLdTfpLBkrmSb8d1bFUTu69RCom5nllL3nfygH/Wx1q
 aKlC6jq0YhfgJTt4bIQ==
X-Proofpoint-GUID: Qx6verLMGBax5MAp_pklzkh5agYv2BRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

QRTR uses sock_no_shutdown(), so shutdown() fails with -EOPNOTSUPP and
there is no way to wake up a thread blocked in recv() on the socket.

Implement it the same way as unix_shutdown(): map SHUT_* to the
*_SHUTDOWN bits, set them in sk_shutdown and call sk_state_change().

Do not use lock_sock() here. qrtr_sendmsg() holds it while sleeping in
qrtr_tx_wait() until the remote returns flow control credit, which would
leave shutdown() stuck in an uninterruptible wait. Take sk_lock.slock to
serialize concurrent callers instead, and use WRITE_ONCE() for the
lockless readers. Do the same for the store in qrtr_release().

A sender already sleeping in qrtr_tx_wait() is not woken by SHUT_WR;
later sendmsg() calls fail with -EPIPE.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 09c1cb443f5c..c955c05e71bd 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
  */
 #include <linux/module.h>
+#include <linux/net.h>
 #include <linux/netlink.h>
 #include <linux/qrtr.h>
 #include <linux/termios.h>	/* For TIOCINQ/OUTQ */
@@ -1193,6 +1194,36 @@ static int qrtr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 	return rc;
 }
 
+static int qrtr_shutdown(struct socket *sock, int mode)
+{
+	struct sock *sk;
+
+	if (mode < SHUT_RD || mode > SHUT_RDWR)
+		return -EINVAL;
+
+	/*
+	 * This maps:
+	 * SHUT_RD   (0) -> RCV_SHUTDOWN  (1)
+	 * SHUT_WR   (1) -> SEND_SHUTDOWN (2)
+	 * SHUT_RDWR (2) -> SHUTDOWN_MASK (3)
+	 */
+	mode++;
+
+	sk = sock->sk;
+
+	/*
+	 * Do not use lock_sock() here: sendmsg() holds it while sleeping on
+	 * remote flow control, which would block shutdown() indefinitely.
+	 * The spinlock only serializes concurrent shutdown() callers.
+	 */
+	spin_lock_bh(&sk->sk_lock.slock);
+	WRITE_ONCE(sk->sk_shutdown, sk->sk_shutdown | mode);
+	spin_unlock_bh(&sk->sk_lock.slock);
+	sk->sk_state_change(sk);
+
+	return 0;
+}
+
 static int qrtr_release(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
@@ -1204,7 +1235,7 @@ static int qrtr_release(struct socket *sock)
 	lock_sock(sk);
 
 	ipc = qrtr_sk(sk);
-	sk->sk_shutdown = SHUTDOWN_MASK;
+	WRITE_ONCE(sk->sk_shutdown, SHUTDOWN_MASK);
 	if (!sock_flag(sk, SOCK_DEAD))
 		sk->sk_state_change(sk);
 
@@ -1237,7 +1268,7 @@ static const struct proto_ops qrtr_proto_ops = {
 	.ioctl		= qrtr_ioctl,
 	.gettstamp	= sock_gettstamp,
 	.poll		= datagram_poll,
-	.shutdown	= sock_no_shutdown,
+	.shutdown	= qrtr_shutdown,
 	.release	= qrtr_release,
 	.mmap		= sock_no_mmap,
 };

-- 
2.43.0

