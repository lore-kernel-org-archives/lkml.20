Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14C2456E1E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141123; cv=none; b=enPlIxb/QSBpIs1ZacHasnsKWvP5ciVDFkpohscJTjKZsb8vSfp153/J+7BAW7iV0LWsPChxqtz8MRiDU8pV78Tlw1k/l20vhEdeVM6C6SrVknkX5aNoNWpjUtnggq81zteWho7wJ61qObH4+bgjH0oG2tfTmKYmvgFRFL615Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141123; c=relaxed/simple;
	bh=L87IvdKKix8xxEq++XK9yFC3sWWwuRVFN6B+KYf48z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0zKPixrhFOr1aqgT8NFZs2Z2ED9lxpGGn65GH6Reg44ZUIC9Iq0GFBbVZ5tl6fgvP9EF07VJL/yDH8i3F+1XkscRqCSO7+Bniw7VTQajFQm4AefDIhPSRQfZS8+nwgZ+JPLwZqumIldYtF7rqgCBv5kyCOnX2ZLN62f7q2NW3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Md/GAUNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSFx9x1p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md/GAUNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSFx9x1p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lPr7303659
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=; b=Md/GAUNpyf9jOctn
	AiUv3mTuiH0ORDXqTAotgtpjCGy29F8DN1mFQxX3x23gJUqiktNtR4eI579vGuqw
	LKnVgxHljfVWymvC+WTGDubSECw2AWYO20jomfDob9mWrL2LJX3Xag6IdEOjNxSG
	B92ioiHZYr8J8pJYhf1SwdkgDH6qnlBlePEkoZdW+E6eG+KYOW0Ym97a1n/hD6RU
	sBtHSmRzMjSzZ8lXOtOG3jER443ly9pFgr5ahTe/+zaPpEsx/eWsGqJz0j4k+lMr
	3/XsTGK6ZvHzORajbqWZsrzj14XRnmBnlCOK2dDsIDcD2PggzBdaSi12zVxVLiY5
	Q4sy+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt91tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:58:41 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so8188520eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141120; x=1792745920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=;
        b=QSFx9x1p9ADiPNgmA4gZmr8Cw+DFfwCCuo67DSHXsekNGnklec7FuymWdPJulc5EBC
         V3atq23l2c6aKqHtQS2TOzYdl+UE4FaRvxjljt2WXwJrzqErlZi8RkYtJNJt1kf1OFQ8
         PTl/LuBgTnSYyksS6TzlKJkYEa231xxog2umuW6eaOqyCmVU33n4vQvaCr1gks0+o6rV
         TS7OjbkR/pKbDEUfzr847dtLqEhrBSzV3VbKalOcO6o75Ym9FXHmSNxHcTOHOV16rWeR
         sSedGRP+5jrHOY0X0ZneXGqL7Ehkoee40wPK5xpl0qA8EYbeO5jaKDwJEtTXMR0nvXus
         Wsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141120; x=1792745920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsyCfZ26KXRaviU3njQZ1C7Nz+6jkW7YbzWGF+ENXEc=;
        b=lKJLkWcG7/lLP2KKa8FYXqAkZTo3DoMsWo+TK8va8/+jLGeg+HwNwzm2GK/9jwRqBe
         Plf8BRDQeqleUYMWfe24BaGsSEpQfisEOnVZPgWIR7bt7Gi6nut8j343OLl2ht4hb7Bx
         Fz2kT2QQo9G4lPhJDYuvPe06youcPaUgDvyfYhNyppUQEyjy26yvHMSN6D5Vou6bdYQ6
         JCjOuFcf6fg8YFXAhLxgOvxxbxNcgCeunG85utGvCsNT28xYfq1d5HtuKvJXPAh44+Hn
         J1iVSL8/f44to7HyYZrHDjZ6g0kZWENV1kBwsbbjHTRiPJruQ18mdjxC3HFlQfjH5S9q
         1FHg==
X-Forwarded-Encrypted: i=1; AKwUvBxkIoUmd7ZT7hwMe0WixcOd7tv350KNdMj29yod1aZICYFtKChXKgtOM/L/cqrYM6wI0/p92ggbkA2jnV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuAjYKMpr5SunM0ms7RurrypwQdmS9qT6UinN4riScAXRmRD1Y
	Z+487wp9AFjHybx7in021KNr1Tu+oRGjKa+jzFBHshsmifVewdakYrkBrwThe5Sa0rnGGDrrxjc
	pLXL0d3uSHh1da4aaXv4n4vRQp/nuzJAt5RB6Nm//LkuSVsU3LsBPC/pyA8g+bgfGkJ4=
X-Gm-Gg: AYBFou2dsI8EnBAhn0KJ0SNRZOAEjW7D91mZfSTqg/pAhG6o8D5t6xSQ53mAMZsp5XQ
	ARbhqGbaGbM311tVCmadVsNGoqU7XLG+HLq3tR+HIhBrwHaxsSkIHrKJC7CDGz8DHfqfd0RUrBp
	rWhoieDW9z+pmN78TRDcaRp/If77fO85JkuXGsJ7c6hhP+wAIRMHUj7cQgLF19HkFDo5+BFrwY3
	J8c8fiYaeEGgzRhbtXPeEMsa+6Tx6qGdxGxJsPc8zCXyhJBYNJrafUHR0K3B17EgTUWfCMtgQpC
	v0cEfMmUioFonSs+xF3gC7DIYKv/O8bv5wbqzz4vphXNt+TziPo3bdCBNnPNfqCXG+h/kEuIRIY
	m0GvsuknGgsA92FCo9giWn2nB4l+lqY92ALzbtAnZvG68rzuAjl6ZDK0=
X-Received: by 2002:a05:7301:5414:b0:360:cf7c:269a with SMTP id 5a478bee46e88-360cf7c2783mr1463860eec.24.1792141120422;
        Fri, 16 Oct 2026 01:58:40 -0700 (PDT)
X-Received: by 2002:a05:7301:5414:b0:360:cf7c:269a with SMTP id 5a478bee46e88-360cf7c2783mr1463828eec.24.1792141119875;
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm9475436eec.24.2026.10.16.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:39 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 01:58:19 -0700
Subject: [PATCH net-next 2/3] net: qrtr: propagate sock_alloc_send_skb()
 errors from sendmsg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-qrtr-add-shutdown-v1-2-e1cc01ca5919@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792141117; l=1185;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=L87IvdKKix8xxEq++XK9yFC3sWWwuRVFN6B+KYf48z8=;
 b=VYxysI6Kfs4V54IcDWHLy6FoJ8SiSBtuZxlA3iNQbC1wPqucMUHYaEJz4S4JCcZ2xTf0b1hCb
 qnExs+GYA30DquTCznBtZypB05coyeelnMMHB52UB3eiRjdlFAnlMLR
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX0lXFDFmC9Fs9
 /oi7wGf8JaD7C8QE1y4yd8HdVfXJJW0rpdHM3h6MVQXhFMgnrLVZ2WNGMK3Nb9nbZ2FYkHKrYwP
 dnjQb2GsKzyayLKHTFIB6Y2f5wobgr8MHfD1t8RcQM/1VPr5SECv0jHpDMloj2qXXVJdF8qsm+A
 HGMx675jjWvB0HvURc2q43IJBTvYbfYWtQmhDJBBQFWD3ATI/GS632PJiKgM3GErW7fjXcH8epY
 jfgu2WbWkh+O6g/CaFrT4KvRFYmXE72gVErLiM61b7Uo29nVJR8WZW3aLT3J2DQX2io5Xn94Cqt
 ZYUoBo7VlMY6Y3nTfdDu1aCx32YYtbwP9qa7t6KhG3UcC+YY+62WYfJDAgSWxhkYpM3uSfuwK5V
 P52YaYiGf+OixTMZzMI9TahYc4N3+K4QP52U0A/DXr8vy4UDiMZFHVjHYkCaVcE2mpBxn+xQ58b
 Y0Z59yBVd0n6GyL4f3w==
X-Proofpoint-ORIG-GUID: CxbPfV6j7dVmk02t-whfV_p6Z_6NT7x_
X-Proofpoint-GUID: CxbPfV6j7dVmk02t-whfV_p6Z_6NT7x_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX7eNwcdaZTJ6a
 i378k/vetdsHSOW2BgALB0S4chk03YBac3cfezXUJOTcd8LvKbtuFB39s5TNL1uOIuClKCkkapy
 KBXDIa6eI5KE6uu3rw4IyBJvRS7VEQ8=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e741 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=03LRD2XWm70np_qM244A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035

Since commit 179d0ba0c454 ("net: qrtr: fix error return code of
qrtr_sendmsg()"), qrtr_sendmsg() returns -ENOMEM whenever
sock_alloc_send_skb() fails. The helper already sets rc on every failure
path, so this overwrites the real error.

In particular, sock_alloc_send_skb() consumes a pending sk_err, so the
ENETRESET set by qrtr_reset_ports() is lost and userspace never learns
that a new controller came up. -EAGAIN, -EPIPE and signal errors are
hidden as well.

Return the error from sock_alloc_send_skb() as is.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 net/qrtr/af_qrtr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index 2d7339338e460..09c1cb443f5cb 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -959,10 +959,8 @@ static int qrtr_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 	plen = (len + 3) & ~3;
 	skb = sock_alloc_send_skb(sk, plen + QRTR_HDR_MAX_SIZE,
 				  msg->msg_flags & MSG_DONTWAIT, &rc);
-	if (!skb) {
-		rc = -ENOMEM;
+	if (!skb)
 		goto out_node;
-	}
 
 	skb_reserve(skb, QRTR_HDR_MAX_SIZE);
 

-- 
2.43.0

