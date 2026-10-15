Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7C2463B69
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.150.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095396; cv=none; b=MXbAZM764uQNWU8zoJFvQ65YxrsbYz80MQkjZCpQTunqmIdBbCupUkivpzfeq3LJ1BAGxIG3G7kI/gao+118EX3OCSVwrQZWIleZ9f2olHBHD7pyUnKj72Qnd/Dk9Ik+Nhj5dkmrKXgdS2hFMhsc73P/4dOLS7DExG2quCa3+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095396; c=relaxed/simple;
	bh=eN1x+5Hn6/e2k3mEyta1N57gMIq5bpaCU1jvBuWBEeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oPXgKfhWzbXdcKmE+bhtZFjwtZeg5GFvgzqhgXXkj0ClXMViFJz4yGmGaDtKbKldTo6o1t2ZGtclYcRkWu+KH7Qw55Lozon7pTWRfGd5i1mbJlSSc0nnzOw3mmyzVd9OA16205q4bbYJ2Vqlr1W585TL6BL/5+2rgpuFyvFx4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=MuT2+ad3; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=tWKLfW5V; arc=none smtp.client-ip=148.163.150.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="MuT2+ad3";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="tWKLfW5V"
Received: from pps.filterd (m0355795.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FHwBcv974085
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=6VqrsXHmAsu6I4kcwECb7Utlh4Uu8hmgdnqU
	Zz4xiKY=; b=MuT2+ad3r0Jf8a0TjBJe9yd2yEN/v+ndU5HoYCOlyoK+q958MDIJ
	6p8YjiGaHkTxMrzobeqoviEIlWpB8eemABDKTJNx/onEpDrcS9VHDi+mnxbuJKns
	+qu6EcU2LjFqfR/QVHRQCR/c4IIVEZf+hcMWXt0c95gbAACwbrH6Y6d9Jtgkb/96
	ooFh2wP6xFDzbLbGkchqJaqMvmr8xXjP+obmCRmUBaR486541Iskbtvfawp320hP
	MgCp7IRDFSmH7s1vqM4hLrMqws9l5VMuHbffjP+obMDBc5wW9y7pv8NKcCOOlX4B
	hLnGVHMlcYd3WGDO59Akvb+Z8iBxVaJbdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hb3putqdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:16:27 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53380b67cfdso138789601cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792095387; x=1792700187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VqrsXHmAsu6I4kcwECb7Utlh4Uu8hmgdnqUZz4xiKY=;
        b=tWKLfW5VSLv42JkOCHr4Q557mtwn/poZXoUTgjz18SFsueeaS7/RqY9gnhEnmNs4vi
         hdLgHbE5WZ54D60L9JOUebvp9+eBD1HlTf/DZqh0qMvuakLvg4ii7b7wtpHfvYzPEhdA
         5ntbuu/lxKXblTlo9JxplwvzXtAt5FAHCx4y+5zpZ185/y/nPm/jtpr2v0WeEJNzpYlU
         Ligj+qCHWkAOoDUB5VFaHYt94i+QXxH0WjD+F4ThAksAurlgKImgX2k/OMl7HsS4BydF
         x1haHKI3nYqyCQP79lX3BICgIy9v7OFJnySkRiBdlSRyzMS3pqz21RiRcc8hiW3CkCNW
         tN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792095387; x=1792700187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VqrsXHmAsu6I4kcwECb7Utlh4Uu8hmgdnqUZz4xiKY=;
        b=D5I/q3fZez3v/BI4F49BVVh6tYf8HqywMDFg0VKS1ffcvozLiBGgknFJNUNZj0pIVx
         DUSRDYHCXa0rKoV2Y4P/ZRGhTqSu2ifalhlcp4KZ5Ii1n690IHYZ5rzCvNWXONj/fSJe
         IPbG6ftD/2IouhLsxmi7tzKvKXLfAYk2m+6Croteyn/c5e7pgMpdHrtd/HbFqEFHJgmj
         4c4Ng4co6IqGDMyStMRYaoH3rAgwvTgLrP4CpJ3WWa5ZDjYepprj7HPJiJv+7TSbUqRF
         pgIp1NhmDWyxSWyUDdR+/OXocrfH1P/CSZZzqf9GlOcP7XjumrAZ3X48lrvgB53saV3i
         Mi6A==
X-Forwarded-Encrypted: i=1; AKwUvByqR62BNwvH9H+B3+auwD+g8qse9yNjvEcIDA5b6qqRCpV2oIpkmwDlNt66Bj5ZUHMx5KQiahBpqng2tyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN4OxVfsskiHOM3AEzE5TQZMmGbYMHY4mUn/+KlCkxjJG6GSKd
	QlRPiqiO9qpIDfJtHfkoeIN73xrpiYoHfBprb6F+a9lWZZqWBK26RSru2Dw8+lHptUyFTDwzEtR
	lp/A2BBksqd0IWcfCxMeWabufR8ECNsiyDo0I+pMXkf8T5PxNkB/tPOOJhYYQG2k=
X-Gm-Gg: AYBFou1h7lTo1sBabRMM2duglIxqwC88bkpvOuicWv1qDgCeJJqtesdSemLMFz9MvV4
	6wMJ37IOfeX8fPINa/OF+aRgCMcUrNeAvESAglhFGoECwM8U4netTLSc7rB5To3j0xklw/cZtlb
	sqjEk11/9L9Mfc4foxrx6FHuN8dufK7YNjpGXq23YxrZRASm78rRZXJy7VrjAPa5d1owsyOnHQl
	2qoR0fOva+2Z8frObgZIWDpyGus3U7GFmuNwNPn13p5iyCLVwWnCqyWJ59aCIM1FVTgO+AR1DU8
	KgmfJp1AcPmB97tqsLMmMcEBHfX8uPHn+nSAUx/MQa1KH3AzAKzb4VoU8PRbG3oofRE1B2asYof
	OL31MoHIe/v+4D7e4qRRgKWGrvbW3ahVS5Lvz
X-Received: by 2002:ac8:5d8b:0:b0:535:859c:b6ff with SMTP id d75a77b69052e-5359fac6320mr338755671cf.20.1792095386193;
        Thu, 15 Oct 2026 13:16:26 -0700 (PDT)
X-Received: by 2002:ac8:5d8b:0:b0:535:859c:b6ff with SMTP id d75a77b69052e-5359fac6320mr338754681cf.20.1792095384885;
        Thu, 15 Oct 2026 13:16:24 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-175.natpool.nyu.edu. [216.165.95.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa19a3asm2389211cf.24.2026.10.15.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:16:24 -0700 (PDT)
From: Kaho Jiang <kj2864@nyu.edu>
To: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+71b6509cb791e531@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH net v3] net: ipv4: add zero check for snd_cwnd_clamp
Date: Thu, 15 Oct 2026 16:15:50 -0400
Message-ID: <20261015201549.4023-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4MCBTYWx0ZWRfXyunA1IHqc2XJ
 dj8rWy6mfzft8aYq0NZfR1Ay5qRzZ+tUovukHPdREDhSWBkxJttH6hyWgVdBZhHQqmIW9x+ANEr
 JWsAZYuLPvdd1UnRv/FoRVrz9HVYqZI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4MCBTYWx0ZWRfX6Jl11qfMljBi
 z3jCARUfgpXiaVKaFLYc3tBL4D3BcqRuK6aftVl7QQb/DYO6f5N2/s5JiVRIuGr52YO2a6MeSqo
 OVI4UlbKzPAabX0JfQS24y7VxD8zHiv1SHvFW4U8Y2FsZ0NPt8SlV2oUtb0hYdILqlPPoQpti5M
 pS5dibmUWznaQXE8nV4WKgSKYB14rb55w+eZ0fMyebHvV0QIu4x4+AZboQNMgGHnIbZoUcntTdu
 1Lccb8P5oPdwJNtpT1jJ7EPNGlYg3JImBhK0SGzVXl1JG0UVCinGrQlkEvmpeuoU+yp8H1cyTZi
 xftaWExe3H6VO8kTShPQq3n2tMTssFvO/ZeJw7HSH4eSm6nu/gUbsPOyZwx7/iwpOZQG5pRGLMl
 fmxwoPQSLQsJYbqZKGTLG+EeFvOWqaTDqYyCZQzZ571yq/BLaOsAAvID5DLjxdfbnBeDJ5uSKxa
 jQ13v6vce7UJbdz3Eng==
X-Proofpoint-ORIG-GUID: z1c1B2LXyrqOmy3Rlu-QBuuMxtGcUmiq
X-Proofpoint-GUID: z1c1B2LXyrqOmy3Rlu-QBuuMxtGcUmiq
X-Authority-Analysis: v=2.4 cv=ZZGIpcVA c=1 sm=1 tr=0 ts=6ad1349b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=HR2R1zjsIcTlYEo9jw4mrw==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=Lu3rmdZLeA08KL8VqJdF:22
 a=VwQbUJbxAAAA:8 a=qtVHbROC6xTCA7o1MbIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Orig-IP: 209.85.160.200
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150080

User can pass zero to snd_cwnd_clamp via RTAX_CWND type.
This could lead to division of zero error if not checked properly.

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

Fix by checking if user pass in zero as parameter,
if so reject the value zero.

Fixes: 814d488c6126 ("tcp: fix the timid additive increase on stretch ACKs")
Cc: stable@vger.kernel.org
Reported-by: co+71b6509cb791e531@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 net/ipv4/metrics.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ipv4/metrics.c b/net/ipv4/metrics.c
index ad40762a8b38..e83a129a25b6 100644
--- a/net/ipv4/metrics.c
+++ b/net/ipv4/metrics.c
@@ -54,6 +54,10 @@ static int ip_metrics_convert(struct nlattr *fc_mx,
 			NL_SET_ERR_MSG(extack, "Unknown flag set in feature mask in metrics attribute");
 			return -EINVAL;
 		}
+		if (type == RTAX_CWND && val == 0) {
+			NL_SET_ERR_MSG(extack, "RTAX_CWND must be greater than zero");
+			return -EINVAL;
+		}
 		metrics[type - 1] = val;
 	}
 
-- 
2.43.0

