Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C603C345D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.150.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854342; cv=none; b=ap4GaTOyKHtABRe1ht/6j9uZn9cEduMkIGQJcmxv35z3bVAagDZBoaZBFB14tigO1Fnic6efgc4t0DeFP1+Pymmm5usNMckioC2aQc8aE+rTouAqA49qbryGDf8t5S20q/euOOKnfvzZnZlQutLk7sFM8hqYEeoNAt3qk3yoh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854342; c=relaxed/simple;
	bh=fJ06K5m6L9LE3/zkbxLQQBUayogIQbPiGfC/8pn63AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KX01lnmmcJxehWgxoWu1XnzpZZI1YsA/WLV5MdS6Fi50A1bENj5zJol19r4S1mL6r+xuwRi2IkWXMrxnsdHP+1KcY0TENz2mRl//CeqTVttk6KnBn4AiYYASK41AiySdcAh0fHIOFSeSPz26fDHitEZyMQnPe1U1BQn3rLRI5mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=aTbPRGJy; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=b9hLp/pT; arc=none smtp.client-ip=148.163.150.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="aTbPRGJy";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="b9hLp/pT"
Received: from pps.filterd (m0142701.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D0FrCt147763
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=shOAHS7eof9rEoprRJ+fSO4ABp9x/j4UaqR/
	F33HHR4=; b=aTbPRGJydGMOo3gZKIuVSABT8mA/1FaYtbPzSnIPqxgtF1e5Grvk
	ZWLt1AFC4D+Nzsbc5NhUYrTsKiM/KmmArlb5oTQi1wbKYrKISHw9ioR155A2QoHe
	x4bDB3at1XiD5CdptzWw/z+qy906fgfq25VhwAe6+ukWCJzWvTley71vfwHfswT8
	7zP/C8WKWs74mMW0RLXeL4Y4z4cnT8FTiomtvDNlxPKVQSwbHFpDMLG+GDM3P+Lr
	elNXIYns4Ge77WeqP24XGs9dkNKOJlVefgy/dEwhIshWWE2Gp7oMKTSsi1XG7LAP
	6/3CCmD8YF6mRQsWjzKOXDYio/+L3LrRVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4h96mgtywp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:03:29 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9195c59ac8cso83245016d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1791853408; x=1792458208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=shOAHS7eof9rEoprRJ+fSO4ABp9x/j4UaqR/F33HHR4=;
        b=b9hLp/pTlqKwDJNbOe1E0TT0bBOQU022PtJDC71WHzjJOJF+VeIjiP8C6Z1QDraitd
         xIRqdWqH5473zHbvmY2GFhemG4gqNX/yk5M1Oi9XmalWnqGhGHepfmWBCsyx5rIg8nHq
         BeudOhsqbZ/S7csic+Ou5G/usWNfuR9xB92hXNA69pclFqzkplLexvgz53I5zs3j8Co8
         fejUrjqzMSsRc0Hcc80Hv71DNNmO/O+cgornGgTaUix/JCjELh6ehx7/m9/8N23cTqZ7
         wPwkmuclINMrK83nwcY6RpSTy6Hg9rq+1Jsk4r0U5Snd4ClDCxS+N1VpYarjwWUPC33E
         kFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853408; x=1792458208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shOAHS7eof9rEoprRJ+fSO4ABp9x/j4UaqR/F33HHR4=;
        b=L/lDgNMQrXClcFAv+C3P0239xn36C9WjruPfWRokW+N4kgi18Mo+8C/bFl9TrXXKAT
         ILtifP98jbxOzjxqrMuQo5udj+HDh04cIbaRtyy4mPdgmmV31z+y4QTIQtNv77srp6Mw
         xf33LbjhQzhc5rV+9rahiRjGu24nLiWvJOobNtCvuh+ba38h07VYtTwsKAKANijhQfMS
         +xWWpRuu6+XCw0YE6cZYuW7jILX6CUJb4cqISs0q9ncUOSwy4JjhRp9I/Xvj6bRfOEGh
         hi8DP6odTbBb5jpBd0biw0fdao2HuGpqdobkrqUwehgPowy1puY09oEa9ejPPRUKHVGM
         Y3RA==
X-Forwarded-Encrypted: i=1; AKwUvBy9f82LS+a22NY29dH8ZX/E5IAPUXa/TvcklQBRsexxUoteAwGFVFivf6MG8xmQQVZ9XjAjndFy9e+lzV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIspue9lrkLI+CzLVV7fXEcCABpSAYGJP26Z+OOUhdkycnQ4h0X
	dou2BT4oRbBc6y7Wi9BNcNl3Vb2SS39bN15ZO1ZTuBLU79VY6kB9wSEG7QXmNSh04VaX3J9BznQ
	59os36KXt+1Rr5duA9RIwLHje41ZqgwbP12hQH26+FITmMd5E+WwatLMuUam8w14=
X-Gm-Gg: AYBFou0Z7gfCJv+/Zso/ZpVO7bfcV91HfGx6ZtS6G5AuvhF0WtXWkZQ5PmmKusv2E4y
	tOhQGpfOdzfc+QM5PV6Vidve9tldBHxSgdr3S4m54PFq92MFoC/aqzE1IogmCDa7cbAV4ueCN9T
	neVKSLXoDZ/e1MRwPQnIq8r7ZY8oDx5XWQ4zQn/BPMgazvDjsAhFAmwukxXGH7jIxBbn8TcL8p9
	CHXCnQLjNKFYCFOl/+diVyXFCGzcYmwuuwZzUoxZ2WyZVxOZFIGuanv6j+AOo1BzlH/YGzVGC+q
	P3v4hsK8f+Dsn/S4PcK+7pVzm/WZj/SLrTi/wY7wtPuvramUaauVM30k26Q6fIXtODzpQ7IYlea
	WIFBXkIvbpYzFSfDjhKB6Unny4XnIRIqvfSQ6
X-Received: by 2002:a05:6214:2dc9:b0:91b:934f:d3ee with SMTP id 6a1803df08f44-91b934fd828mr35837966d6.58.1791853408091;
        Mon, 12 Oct 2026 18:03:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc9:b0:91b:934f:d3ee with SMTP id 6a1803df08f44-91b934fd828mr35837496d6.58.1791853407440;
        Mon, 12 Oct 2026 18:03:27 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-137.natpool.nyu.edu. [216.165.95.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62240sm12455926d6.23.2026.10.12.18.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:03:27 -0700 (PDT)
From: Kaho Jiang <kj2864@nyu.edu>
To: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+71b6509cb791e531@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH net] net: ipv4: add zero check for snd_cwnd_clamp
Date: Mon, 12 Oct 2026 21:03:23 -0400
Message-ID: <20261013010323.1058-1-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OpBvt04fgLQ5NHV82OCBZ351LORuDuRv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAwMyBTYWx0ZWRfX7Ouxkvwr7lHa
 GldnPsTPrKmtHwY1A7WUrQeYjObGF99j1sOPZGJijFdbEl7loqcL4Y89Z1K3NQpKt9nxVSc94Uf
 904iXiUIyQRPcDSyAm1S2tMnQ7p+m7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAwMyBTYWx0ZWRfX1KmQJM5jWXzg
 libqXmRI4BABp50s7jAgSh9y9pLymy06sbPvZNRtYnjyYt3BaD7ywsDi7hJNTPlr7bMngx1Eznh
 ja8EBdVxj23RG2JTH/5jGLA6drd6uLLkKSO0shQpDvrP1QbjJQXzUNB6ohq0tPasbli9ukBM6eF
 wdFnrletD1R1Wf3NF/QGQQ9tL2v02M8WW7PFXKOlbHHGqofTb8G6ti5xKALsGNmt77xo1sFx8oA
 c3Pogpli/AX3CgHvwbrBnCYcm9+7OueQT4+pIO21vfioGkoRC9J3/hdd6H4us6sffZ0oSST3JTy
 0SKnQn0T6kXV9jyeus1iVp0G2KYAYlvb52DEcYYCtSNjZJxD3yb2tFuVaXFPPbQSTEJXjMAmee0
 apqGs2Tq9GESMdqXytjWTpLOmoaH+2lEYJ9qNMnYpcZHffvtSNtiiB3+hQKrLTRleQ/VGiOXc/C
 hakh84T25CRBVGxbtJg==
X-Authority-Analysis: v=2.4 cv=R7yWitRX c=1 sm=1 tr=0 ts=6acd8361 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PTGulf1M+RQ7eJaEhEW9rA==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=CxnIfPQeirmdGRAfp5MW:22
 a=VwQbUJbxAAAA:8 a=NELHbg8bfhRX9QXGN9IA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: OpBvt04fgLQ5NHV82OCBZ351LORuDuRv
X-Orig-IP: 209.85.219.70
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130003

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
if so use the default value of snd_cwnd_clamp.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Cc: stable@vger.kernel.org
Reported-by: co+71b6509cb791e531@bugs.sh
Assisted-by: LLM
Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
---
 net/ipv4/tcp_metrics.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index dc0c081fc1f3..ff41804ad086 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -484,8 +484,11 @@ void tcp_init_metrics(struct sock *sk)
 		goto reset;
 	}
 
-	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
-		tp->snd_cwnd_clamp = tcp_metric_get(tm, TCP_METRIC_CWND);
+	if (tcp_metric_locked(tm, TCP_METRIC_CWND)) {
+		val = tcp_metric_get(tm, TCP_METRIC_CWND);
+		if (val)
+			tp->snd_cwnd_clamp = val;
+	}
 
 	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
 	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
-- 
2.43.0

