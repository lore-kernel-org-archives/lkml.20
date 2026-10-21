Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.150.240
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627120;
	b=de68new4T/NAj8Jf838PWwKitAOEhwZILtSvlSw3Mg35uJxLuXA8Esu5eqqfhTjRYrHI
	 hUnHnxWnItV541fpHQuTuFxVTqcvIBtbs/hbm+4rC32Yb3He3I9oZEA42FC6haJdAikej
	 Gi2yW2cU/bnGZfy1Qpr1Px1QwZuMhnfu8aCYEKy1V6BSI7XCRQmrQ6YZhh7xScPkZhVVp
	 Tu4TUY4pedd6yWluNLk4PZ7797ZCXj3mYetULJ1T3xzNUXqhsjC/xlBsqKJNmSL3g2DN8
	 i0hoc4wDJVwJ/RnTglSEunXHEUyFexqb3n9OdUORZ8nMWnZ800o/1q9jhp97G5c0glw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Orig-IP:X-Proofpoint-Spam-Details;
	bh=ctT4r30SdHriATAt3tjrtdUslXAqf/DWdqMV6ZVr+/4=;
	b=ld1/uNJjN8zuSfnmMZYT2FYHzGdygXyUN+VUV899X1mQX0Hl5YxJ86bSpm0pphxoEeX1
	 IRumeAsPOBH80aQMHk7Ic4bG/wPvms/RKWHVWfg+k4htyY3+CjTouOhOVAwtfz80pIN1f
	 ZlzI1i7OrztN474OdICUZP368QjV3IMUK9Cj7CNAespqARKEG+7KW9VBQ9Kz0JMZ2+ly0
	 +D5xdi5nLsPdYOaUukQ8K0nCw/rNi00tMivVh7e7pRzggD50FDeZPXE9RowGwfDuJz3Z/
	 Y+mltidZ9h/nzhK/3ZIev5utoVk35HUlR5IM14CVeYDWlfp83Um4ezQF3nz2LEOiVYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nyu.edu;
	spf=pass smtp.mailfrom=nyu.edu;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=a6Fa3OUA;
	dkim=pass header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=iKFmqBiQ;
	arc=none smtp.remote-ip=148.163.150.240
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06D5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=20180315 header.b=a6Fa3OUA;
	dkim=pass (2048-bit key, unprotected) header.d=nyu.edu header.i=@nyu.edu header.a=rsa-sha256 header.s=nyu-googleapps1 header.b=iKFmqBiQ
Received: from pps.filterd (m0142701.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LL2t4R1415251
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=ctT4r30SdHriATAt3tjrtdUslXAqf/DWdqMV
	6ZVr+/4=; b=a6Fa3OUALD4rsno1wFvYCWfxol6f93BK/7jIGkuJwPRRVDp7Hg+B
	vHwhuB2quDUiWyHSn3yJYlg8VFiilOkzJhQxgWJKL5P9cymXCeQwT2f0H0S5Q63T
	yz3qDOut/6kqN6f+M1vRPArcNj6eJPmJsbIwPL9SurwsgTGzoPs61rzPiRyiGJFd
	JrJqYRXLwl7y7RzB9q8S2UiXDVNnWvNFoZ/h/P0DEyMkea7bUL1+TBaUpJqZs/6q
	aYu8zsI0KM9WwZU4Ly2Cz5pTSO35wvv2xX4/TUkr/m6cBnz83It91Ki/fphz1+7f
	8mkRf6qq3w3YgL6kKJuHVUh7Q+WLQufbiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hf4ybt3ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:58:33 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso217568985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792627112; x=1793231912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ctT4r30SdHriATAt3tjrtdUslXAqf/DWdqMV6ZVr+/4=;
        b=iKFmqBiQoME4CJZuMCqM9oCLLLOFxRlQAiaFaKGJMkT0DKbt3h5b2Ue/N98cR8h8dX
         lRXQ25clRcBufagsaczVqfYMEa/ZbPfZFRs2SDzwqljVW/4gHlix3iAGX9tNalnwC2gY
         rNxdJQCBywE7HWn3sj1BH686YBFjL0pSZdOrWzOT7T/uLH/oazJgEuXJBugazy0t6tsl
         VQdfVKO1qlPjQD/LZuRJVaNclis6eWCwA/nD53hXsQs/bziuvGKGjNfsd0JrW9gjW72Y
         VYOV2XN0ZTKLkVdzO+eM/m1wF0hLleTF40Q3dSpuHVzjH3/M/ETVR7tol9oDk1ZvEOrU
         ODNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627112; x=1793231912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctT4r30SdHriATAt3tjrtdUslXAqf/DWdqMV6ZVr+/4=;
        b=LMIJ8Bm4t1QliOFwxBIf5dlxneCBGV8Lq8jiqOI5WPjFzOCxeWct/7sBnz8qNs+PCs
         FQZHq302A9EE4JRf3m7Z1FwTQQDVMDvzyNHoXVJIydK3pycyEorx0cCrhpJfnNnaYIXd
         TwTjgvRG2gErfuIFVkQvEAGcHFha3ubSRNFdqBhGghAcig4ija3tiJEt6JtjXMwow8SW
         JBBmICT+fPYw6YMdeowpsTv79tJXr9VBLLvzYQ3gGakrGhQRMR9vcveU07tYzTxKWNkM
         87PTZYDASeMfTic/nFc6PP+/FBXQQOE4BcwjM92hUG/Bx3E1qIX0fVO0+FUPZZ0gvHhy
         08BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgedzCXh9yTponHbHC4Wt9+qmgqRolyl9y/BxiWTSGI/wkZufxTpywKAE9oT8Eg5ckFhwMqxyo2ZfSiNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMWvvUQyRbWg+kv5Uq3bx0iW5xr2QQVwdMTzOncPAgwEnaerOK
	btD/Ama49XQENwxgriFEENCnjMtKl4LVpO9SYwHOiu5+ZIS5zlyhr2Q3KjmOgAa7L8iBdn+zFvY
	3IJH/kMfIxTY4XlGeOBZWBgqA6kwl9GdwLXtYCYdmG9q6m+W4pEfnLI1/xY2HMJ+LbkZWkKOKCg
	==
X-Gm-Gg: AYBFou1Igc3RtlIDuP76TOvdN/beyp7c72z/ydCHKmNhLJe49HhaWXzayKj9h3sfdNK
	OGetaYdUqI1+aBDNWeVo7e1WW191/9YN4GO8ldPcE887y8gYOadivSH6akBlpDnXRqdpGRe5Qbp
	s0AqB6FKCL4f3Ep5SUMkKZxGkho2Wul0eR4ecCIuPgAKaUaD5pkQYS2ECShrY7WqpCg0PGgHX/D
	LkeZsq0HrZMZCGu+l1CJHmQ/hOAvM+82obDd26HCczKvO1/aU3wy1zrwmlFMInQRe3ey4tdVEwd
	rf71lo0IdjFRO5LdiPz0EFN+kvrl2kq+CbLDsyCMWaUBBmpUv/74J5SvZ7DbN8UUoC6Mf5MjzjO
	uMSkKSOpbHZG66tz8qwftYTG+sQ6rtA7/yk3B
X-Received: by 2002:a05:620a:608a:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f57f058fcmr744903285a.27.1792627112592;
        Wed, 21 Oct 2026 16:58:32 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f57f058fcmr744901285a.27.1792627112155;
        Wed, 21 Oct 2026 16:58:32 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-137.natpool.nyu.edu. [216.165.95.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d98e66sm387488585a.11.2026.10.21.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 16:58:31 -0700 (PDT)
From: Kaho Jiang <kj2864@nyu.edu>
To: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+71b6509cb791e531@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net v6] net: ipv4: add zero check for snd_cwnd_clamp
Date: Wed, 21 Oct 2026 19:57:33 -0400
Message-ID: <20261021235732.1313305-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: ftdbFVxtO78CVRDu_HBpZUGBd3soqnWs
X-Proofpoint-ORIG-GUID: ftdbFVxtO78CVRDu_HBpZUGBd3soqnWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5NSBTYWx0ZWRfX4bRm3EA98AlW
 GG5D+Xhcj4E6jRdHU3fsN7wncLfFS2YzXJT7En+H0VdjTD9JO4aWxrlDiuxxPa2nlcyG95udNDw
 B13o69mkMtQosdTGzF/ngUZmlTipHX5mZPm4GjRepmYkOv1EW50ne8UwscnDKMvV85KRF5gAGBt
 xciMcxNq9tj/cI4sarZ2zR2qZHrXfGbkBgEQzsgcPjr1KRZ4eep8l2D3Gkcg5Tclu1ojwtnaMx1
 IWA8PBqYeZt3NYOR7i65L+v8RKi9DdkwNZNC0wZVld3Y3l65myC7bemWShYM0lLLqQ1TfzfRoBs
 GVUK6+vm55VojpdliPPgyvWGQFTGUnRTJHnGMQp+kiByamYU0OpUeZ3bbS0Hbq/0XCKZb/02i/q
 ploGW8b6WRPRkJLSh4HqtcPd+jh9k6knix1etLmZ9FpBMaie7mLu1bEYkYKC+rPBWOVSHp/RpBr
 fKXmT+ulPYWKdLtVaUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5NSBTYWx0ZWRfXzO0zeXnSIvJe
 +FCiQq2byDwQ6M77C52yzqFFS8I62pd7R2qlAkks8bpOs87gWxvxwK3Fn5qs2pVKvpmQzluENMt
 V8ctgseRMUw93NwF5joeO78TwdSfymk=
X-Authority-Analysis: v=2.4 cv=HY+B3SE8 c=1 sm=1 tr=0 ts=6ad951a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PTGulf1M+RQ7eJaEhEW9rA==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=CxnIfPQeirmdGRAfp5MW:22
 a=VwQbUJbxAAAA:8 a=qtVHbROC6xTCA7o1MbIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Orig-IP: 209.85.222.197
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210095

When RTAX_CWND is locked, user is able to pass 0 into it.
This could lead to writing 0 to tp->snd_cwnd, leading to a
division by zero error.

Oops: divide error: 0000 [#1] SMP KASAN NOPTI
Call Trace:
 <IRQ>
 tcp_reno_cong_avoid (net/ipv4/tcp_cong.c:510 (discriminator 1))
 tcp_ack (net/ipv4/tcp_input.c:3517 net/ipv4/tcp_input.c:3873 net/ipv4/tcp_input.c:4440)
 tcp_rcv_established (net/ipv4/tcp_input.c:6685)
 tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
 tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
 ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 1))
 ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator 1))
 ip_local_deliver (./include/linux/netfilter.h:325 ./include/linux/netfilter.h:319 net/ipv4/ip_input.c:262)
 ip_rcv (./include/net/dst.h:481 (discriminator 6) net/ipv4/ip_input.c:492 (discriminator 6) ./include/linux/netfilter.h:325 (discriminator 6) ./include/li)
 __netif_receive_skb_one_core (net/core/dev.c:6297 (discriminator 4))
 __netif_receive_skb (net/core/dev.c:6410)
 process_backlog (net/core/dev.c:6761)
 __napi_poll.constprop.0 (net/core/dev.c:7830)
 net_rx_action (net/core/dev.c:7893 net/core/dev.c:8050)
 handle_softirqs (kernel/softirq.c:645)
 __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softirq.c:758)
 irq_exit_rcu (kernel/softirq.c:775)
 sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discriminator 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
RIP: 0010:tcp_cong_avoid_ai (net/ipv4/tcp_cong.c:482)

Fix by checking if user pass in zero as parameter and if lock is present.

Fixes: 814d488c6126 ("tcp: fix the timid additive increase on stretch ACKs")
Cc: stable@vger.kernel.org
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Reported-by: co+71b6509cb791e531@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 net/ipv4/metrics.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
index ad40762a8b38..4052a90249c6 100644
--- a/net/ipv4/metrics.c
+++ b/net/ipv4/metrics.c
@@ -60,6 +60,11 @@ static int ip_metrics_convert(struct nlattr *fc_mx,
 	if (ecn_ca)
 		metrics[RTAX_FEATURES - 1] |= DST_FEATURE_ECN_CA;
 
+	if ((metrics[RTAX_LOCK - 1] & (1 << RTAX_CWND)) && !metrics[RTAX_CWND - 1]) {
+		NL_SET_ERR_MSG(extack, "Locked cwnd metric must be non zero");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

