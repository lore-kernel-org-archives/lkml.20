Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C0329E79
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.150.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007823; cv=none; b=rEhFZYGFt1ky7pNfgop/E4fUXy+WKco+N2/UT7K7cvDZvXgodWdhCawhM1VRbGb+qg5PMgfy7e2O69aSsnpmSQV3NpEdK2Y0a7Lpmnd4f2FZgXgbqGD/JcSZ7xwmK8pSs3onmmu0L4d2ZDvv7cSX6BpPdbuunyQxgc7nnJnSmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007823; c=relaxed/simple;
	bh=VxmCR6RZG34puMftg8s03NryxNCg7LImLRc/GRgXE2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDTZ6iwCbXo2+Q4L1EaSpbgwoAEMFMg/c/5z3JHvrjEYJ7yIKOysW4PrOTmgICmtmBNLxAg3ES7ehOha4QEk9wbSRFwP8aL3vWMPQAowAsIOeyf2gGSbBRKps9eSjJ3b/9pdAwtAhNzYKBGXV6jtmdw+Aq937mTDg+BrVlcBf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu; spf=pass smtp.mailfrom=nyu.edu; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=y4AE6z9P; dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b=K8Gin2S8; arc=none smtp.client-ip=148.163.150.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nyu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nyu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="y4AE6z9P";
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="K8Gin2S8"
Received: from pps.filterd (m0380321.ppops.net [127.0.0.1])
	by mx0b-00256a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EIC3gu3783999
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=20180315; bh=dm3JPEpVSI8PQ0BF6xKoWaANpbsmtysnXtnv
	IY1XHD4=; b=y4AE6z9PwZWkpayV0uaZbMNPd9zqnbW9JVpKQns6vJ3YIzKTM2KG
	epvzum/sRrsdfGAZMWz5gW3/sVjMqH80QYHX3Ugcs91XwchwvwhOAH/FJc4pOfpy
	uHXIlbwY1/xHhqt7keateQ2qfrTRMQu21o0e2WoerRBj65T7DYEDyv+3dsal+pvG
	hUoDdtlbx2+H0lIq6rRZvtxBXhSHoRjcb+Oywisobmg86MwheqbRpfKiNjlpWpj5
	lejiby1ldqwA6mifaSdmYkFcy/KlEX89t7bvZa8e24qMOGuUE/CbL+XKtN0YMWs0
	gpLYxsmqgs5/xqikcDSQyhbGX84OJeC5tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 4hadd1bbku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:56:54 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9196b477c4cso112649706d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu.edu; s=nyu-googleapps1; t=1792007813; x=1792612613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dm3JPEpVSI8PQ0BF6xKoWaANpbsmtysnXtnvIY1XHD4=;
        b=K8Gin2S8QCf9CyY68CWBvqJXFZRrplB04gemjmwcl9qiMSxybuOZPr28cKsuQP14qM
         8AU0cp6Y8wvpIUy4hQk/ccZNRN8ij6yA/4EA0GrG77sNNTYyS1cgZfn2E6fWKTCZAYOG
         Jhu9zsHMnNr1XBg8iSQmZZFD7OPyuiFJR9zja7+p7EFY5Hlkkl2pf5J63cl3/yA9PaYV
         eqnAIs/o6VuQEHLeRSbt6ngboTDQAtHbDA/iCc5+BX6M7g6bJahcGEEiobqtTDCE96Z9
         jY6T76k7Rg0OQvx5m4R6pqCOwNod5GS1MT27nW1hWGByWiRgMerLj2HeQyOASkrkZjxC
         QC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007813; x=1792612613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dm3JPEpVSI8PQ0BF6xKoWaANpbsmtysnXtnvIY1XHD4=;
        b=Z7GQ+W8tXsYDS0JpjgyEsRAVgYfCaoig3Och/mUb5wrgksZWjFkirjLQA80xYt7+Zq
         r+ONHnzXARNvDTdL5Y1zn62GWvvoAxhJig8z7nTjL/txOw5xisZ4DByA1pLTrL4eolaN
         jYSENux5gKRR0ziL+xPUXTIvco8bVyKFvh5f5RHILW1FGa4UOvsKqJB1sasIo5GbsrXA
         fxF4rCp7Y6HAh9nr404rY1xrcDYK7yn0vPzDUJo34MajicDin3MjsfrepdORtUDXa+2I
         5tTAc+EaCy1DAVUr2/anFe0q4yGYo36IHHtnyVchjHAYaeGi0eUrDviViwnN5U5/qOmW
         s7lg==
X-Forwarded-Encrypted: i=1; AKwUvBytUNbnKYJwq75ms2utjWyxLewgEUu2fTZ1ATfo7Zt25OQaPBYsLovRXZKjuYQQo+CuWRLYVdovJ6sMCyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxhOWkgB5cEx67GHsv41vUzHOmO1854vP+drhfE0Tiy9pZNGlz
	YrsZ5cXI+Pvcg6D3EKj67lI5guAQwNBBs6DSHc4b/G0jockIAM0fx2QLSbRVPOlI64Fi2n12uJ5
	AvkFkwlz1C1f0YjRmJzBDFnTX4CuOwpLDDWn5v5ezlnZ5Iu+G8R0bSGYsuY9XMx8=
X-Gm-Gg: AYBFou3fPTCoFkdgaukzrl0RhaZontrGwxin4a1rDk/5CKoduI9D0iLCK4u1Rwz9lvQ
	HvcWGR9AvkzgDWdTPSSngvQ02il8YcJU2bhV8pKBB3DaiYasIxdC9OL+aSyDGTLwfA1AlbR+cC4
	3dT6Qs7G/Z/XFxzLfKYza3+GB095Oj+WkAArvITQtJpvVUZKbF+PfuRtNKxUyoUygZ3BUvlBbgA
	hF3bEL0sgOTTXf6ElyA6zN0gwWKX6qmCQvXBgX/zfrUBaQHnRvXhnRaeaYuyp59BQKpsElG+PGQ
	4inmRkP8JizBl9fASniGQNDwRo+6345LrB+75dpJBpks/rOKnmwb4ZYt5m/aOPbEz54KnnFn4Oe
	nktznfdnEjrwtsOiL8Mn+LDAdfjGeAUYsptmz
X-Received: by 2002:a05:6214:4586:b0:917:7cc7:8768 with SMTP id 6a1803df08f44-91b53a5192emr265642736d6.11.1792007813425;
        Wed, 14 Oct 2026 12:56:53 -0700 (PDT)
X-Received: by 2002:a05:6214:4586:b0:917:7cc7:8768 with SMTP id 6a1803df08f44-91b53a5192emr265642296d6.11.1792007812796;
        Wed, 14 Oct 2026 12:56:52 -0700 (PDT)
Received: from jerrythepro.nyu.edu (216-165-95-143.natpool.nyu.edu. [216.165.95.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm61171016d6.8.2026.10.14.12.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:56:52 -0700 (PDT)
From: Kaho Jiang <kj2864@nyu.edu>
To: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
        kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
        edumazet@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        co+71b6509cb791e531@bugs.sh, Kaho Jiang <kj2864@nyu.edu>,
        stable@vger.kernel.org
Subject: [PATCH net v2] net: ipv4: add zero check for snd_cwnd_clamp
Date: Wed, 14 Oct 2026 15:56:41 -0400
Message-ID: <20261014195640.430824-2-kj2864@nyu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX2n/jwmn8xA+C
 0OUCjKFRuPzewj717qER58SDc+zWJ5jiEkzEPNrXiSnBNdrgVW98DcbSgR1BwDXEO5KDtykwH7L
 NdfxWlJpoLPHWf/syMq2Fd41cmhOZyk=
X-Proofpoint-ORIG-GUID: S3xU4VHagw0J6c5H9jtEZ7dRocolwLTK
X-Proofpoint-GUID: S3xU4VHagw0J6c5H9jtEZ7dRocolwLTK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3OSBTYWx0ZWRfX9woOdtdu2fzH
 4NniywHCAaSowdGAWzCNcwulBXecZ3nEsVvWS4NituDyRRjNfY2goQsz6mpqOOJBIkkN0pum8M3
 EsMbcK9MaAm9UxJwhNhGgCg3zQGzAGu4G3afXqRBaVG8v4VUCCbYUxw2IikLyuivhK+vdt+YAJL
 y82Ke4k1PvrLG3wiE4Rnp+YS9RS71VRW9lYNbdzS4r2apk7eC0Ml+xFR9Fs5jh+D2iQU8Dw6xMw
 PJ8GXFf88NBtZYLqwfLGzws5rh+LpYljyo5yks04d2Jpg+Yn5MwfGU0inwVktMOifTVaUBh61xB
 T/yYY6HcvOhQ46tz3dT6lSFFWLGOWGR/ax0fSQgxPGl/tfBWlK2JZkJCyROWDcqMF8a5AH23X3o
 qPkbp3aOLy0mJf9Sdz5qakyF8X3StHcjnOPbc1lgdmFFFyjvri8iXqLC9ETa/oiUwnJM7A98qwu
 CZ0NpkC1NzrTPLDoXBw==
X-Authority-Analysis: v=2.4 cv=IaESymqa c=1 sm=1 tr=0 ts=6acfde86 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=iAeFBqZmEazvcMjDlvn68Q==:17
 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=S0S_EcBMpFAA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Se5WoFf3ZZRiLcel0nel:22 a=Vu6uP2Wp0I46Sktgawq-:22
 a=VwQbUJbxAAAA:8 a=qtVHbROC6xTCA7o1MbIA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Orig-IP: 209.85.219.70
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140079

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

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
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

