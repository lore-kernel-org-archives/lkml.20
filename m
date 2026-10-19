Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193A4DE712
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408395; cv=none; b=qGhIi7ObbaREXt5+2dEiVOgRpikKxu7XHAqcp01ZNjXSh+f1sOthI2kWZdmd9WMwE4ooTNohZHABgQJalLZKCsdLFerlqkd7bT78kKDTxbBdhkkA/9vflPvAIJ8ZKUeDIcdgkHBPs6LrtW0vuEuP+fZMCvcT44ncgQmeo4kNgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408395; c=relaxed/simple;
	bh=06IhMOTiJum8Y6ohwifN320Ejt4xYacngIgHBDWIuLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUV0IPd7yXkMe5u7s0uZ9zWwuS5NlO/UyL6gHmVMt34QA5xXfHvOfjktb7QSiqk2WS2iSg4VhQewvReezbqSgFKZEfn7epnpGM3wfW5UjS7QYWB7abRDLSBpTky+vznmF0HxRhRRcOl4s1K/6n8F0zKAxzaAfJ4xLNtg3KRVr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnxPWWIH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWsHj49D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnxPWWIH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWsHj49D"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuGN723272
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyGQCDxBDck5OVKppEOUmr84isvygZQmpxTsjP6cvvU=; b=jnxPWWIHkmn93ms/
	c5vQ0mEmi0YNCW6F+13cNrRLgc8N6XaVlXNhU/M7fbIs361Wl8IjfdCxss2z1ZHt
	7CEhHNqVgEkBkmld65P3J6TpC3nGyNK6VI1kzRiJv7lVOCx28pvP0+z7KLgCArMk
	99nXf/E6dI1C9E3RA70m8jtWNzej6Jr9sLQS+QMznk46PzfNWt7a29+k6BXmC+TX
	90r8F+8ryvArCXnliikxC3W8MRl2hJv6+FBIq+Bg+du6/vrC+tH180ColJm1tppg
	QCa69NK7P8Hg2TDrjuZkq2OSsS+4HJnM1ySNSVZWKEZr9JkBloZxL4LhI7b3X9Hr
	m1bdIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65grnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:13:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso396941385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408391; x=1793013191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyGQCDxBDck5OVKppEOUmr84isvygZQmpxTsjP6cvvU=;
        b=dWsHj49D7YlJ80l8mR6Mv18nq4OLzztkTInY3nP0BebZAz+sjkCt6aPE2lse8a4/lf
         kANFwvL/uB+7eLa1wsLu6ziCyTBzn6FOj6x39bZvpilJXKkP9WpUFKhNReCSXmR03x85
         wwPv1VisEeUPukP533sCwo2qeUR5XBazmQRVNs9xGMz9kaFTOkjEA0wST7hJjbah2oSy
         dzX0GYysKB3a2pIxOKYxS+WV8PJXEase6S5matb8V7LT90Onjbzsc1m9MSAQ4IlwjbSI
         CcJPwNCmfOnsq/Ac5VGb7KxbbCLCvDgAI9Q8wmcnrehTSRn55Aqm3nTZ5mdNiWAD2G/e
         aZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408391; x=1793013191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyGQCDxBDck5OVKppEOUmr84isvygZQmpxTsjP6cvvU=;
        b=dDo0GpWX4uFkVvV3j+cZDED/dBwEimoUY5Lriz8hsac8e//272umSp2LIhKSnPe7g7
         EKHyiIz+HdMrE8Qk69v8145KvrD2VXjO1O6Y+fUWb+3l9HJM8rfChQpFTGTJSg8ZO1W+
         p2wWNdsaUhsvELCPvcjTNcgjaYdvItn++4UVDDL3q19WGwYIM17xRMaQ+NDartR52RnZ
         FmSJ2Ct5olJXWTQNvV+rxWtqXzGTZlldtQ6XcoPpkeLofVdll9SjRyBeX2FitglvYgSJ
         FYVhLUU2Z41yjKxJ/vlnubpAD4rZCJ1bz8+XM82XVaPOMPaxPPdkCcErtyPGL0O1WYwd
         Jnkg==
X-Forwarded-Encrypted: i=1; AKwUvByNRHvP5dvMF8wyHtbf+E9xK6ZHUdyvaJ/0Ry9m6K5rqbHMtqM6iJcNMQHQnEOHdx7/nn3ggBDoV5AjEeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb/kr4Q04ivt7PX40Sohr5jwYXDNlFkgLKfdE2Axn40+1B6F6w
	8MtpS7JRIg+YJ0hPqTLxB71/zMO6rcseqj1XzIMMY6gbZI+XQAXJG9M+6V/CMyVYmeLq3ETEo1x
	LPkXsgvOIl7btpwfV54rZdwC9Vq5r6uFVVXNBHIvCsUBeBnA83z4r7rYdpHVQTefwnu8=
X-Gm-Gg: AYBFou1vOtkdm7IBVNEDFERC+4KgbEy5J/+5JOiGTHQVHlbF+R0gLQwtuq8EJA1MQpx
	mPF2dfH8RyCwX/djuRK31aavZnrl2m1KRyDcBBUlpxXmEPcIEquj7uSjdegEVQXwHZSZgV1Mb6x
	A1V1KDHJAy2mljxuE4QOSjAzhlQUGGcNehts+H0q7hY4+thkSdhyj7JG0aaO5agLBelyiIdLKaS
	jZu63uU6ikp8jsdIACn9rKeJ6sQ886PxLcvWf9FbLCR1ZiLaz5UZCphNb1qopdmGfyEe637EwN9
	jCr2pMTf40dQatY5LeYHhMuuu93oqo0BPc/sFJJWLqkR62vTbxbt08VAyO4N53PwRkgtVDKbLuk
	zhZOKDmxyUTDBoMZuMoSm6bomgDiqOnkQLJABaa1PbSnd
X-Received: by 2002:a05:620a:bce:b0:93e:94f2:ada9 with SMTP id af79cd13be357-93f29d7fb88mr1267633685a.58.1792408390735;
        Mon, 19 Oct 2026 04:13:10 -0700 (PDT)
X-Received: by 2002:a05:620a:bce:b0:93e:94f2:ada9 with SMTP id af79cd13be357-93f29d7fb88mr1267628485a.58.1792408390183;
        Mon, 19 Oct 2026 04:13:10 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-21.cgnat.inetia.pl. [185.164.141.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4256c790adsm211472266b.31.2026.10.19.04.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:13:09 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:12:01 +0200
Subject: [PATCH 1/2] net: qrtr: ns: keep going when an announcement cannot
 be sent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-1-bd420aec171b@oss.qualcomm.com>
References: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
In-Reply-To: <20261019-upstream-qrtr-hello-gate-fix_b4-v1-0-bd420aec171b@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX+OYVmHkpqFmA
 +oAQ3Ent+vQHSHe1QFWdfOxVvG6pS4ga4EF87L4fTdyO2Dclr8vTHF4n67HbEhcorDSpnCI12N0
 VFicc1rcg3JD2xtTQoq+L4mKja3Lvn0=
X-Proofpoint-ORIG-GUID: uusqM3XFw02Xj7dluzTK2XZxJ6LkYrRv
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fb47 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=JsdSkJyxCPcZmfxNhm0PvA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8ZcYjYkWD9nQVPmNhLsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX/xu8D5HvqtKk
 DqgINpFMLYM15kGdY9lvqgxlFQ2v7LonbU+6pl1rbEdgI9V9gSWzMM1A9tYDZi0lF7CZGzqgn9j
 xwlHyldN0IN7DscyDybhi38dRyXI8SD57gfQXk7H+i/TmJQBvbU8mR8Q17aEuCqWggb+IBTX8/c
 Wr0rZVfH8rw+8a4gmIx9QjxXOJ873Mn9RTwcC7lZeDHjsp1kA7WVD1nvj63TkK98/OQ+FSTJrCn
 rxNXrO63oeTUkP8fUHntaPV5hlBNfDLz4RrDbqAqc4jv9XyITZ3ekNuziXtnBv/NB1F6lAE04L2
 N+T9CioR3nrg8vZj5CER6KoJAtAHwoVRUgPsEh5y+6C1W1kQNpKA1sXcr7qSODjlBGZ3wlNNa/f
 NIfByCoYiQfBqVTxLDGsBETjQXFJRj0P5PUqUixl0m6XQwZj3cGUXbFdyI31qPVUpuvimWhfX3o
 9nrphRgxd0IBLIMK3EQ==
X-Proofpoint-GUID: uusqM3XFw02Xj7dluzTK2XZxJ6LkYrRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

announce_servers() answers a HELLO by announcing every local server to
the new node, and stops at the first send error: the node then never
learns about the servers after that one. ctrl_cmd_new_server() returns
before lookup_notify() when the broadcast of a new local server fails,
so lookups already registered for that service, including the ones of
remote nodes, are never told the server exists.

A send failure to one node says nothing about the others. Log it and
carry on in both places.

Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 net/qrtr/ns.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index bcb090ee79d4..dfc2cdad688f 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -232,7 +232,7 @@ static int announce_servers(struct sockaddr_qrtr *sq)
 				continue;
 
 			pr_err("failed to announce new service\n");
-			return ret;
+			/* the remote needs the other servers no less */
 		}
 	}
 	return 0;
@@ -488,10 +488,12 @@ static int ctrl_cmd_new_server(struct sockaddr_qrtr *from,
 
 	if (srv->node == qrtr_ns.local_node) {
 		ret = service_announce_new(&qrtr_ns.bcast_sq, srv);
-		if (ret < 0) {
+		/*
+		 * A failed broadcast must not hide the server from the
+		 * lookups already registered for it.
+		 */
+		if (ret < 0)
 			pr_err("failed to announce new service\n");
-			return ret;
-		}
 	}
 
 	/* Notify any potential lookups about the new server */

-- 
2.53.0

