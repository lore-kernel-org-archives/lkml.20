Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657111;
	b=KcZw5tIWN8o3FH5ayK0yzJfe5Rj5a9cHdlCb/RBVWy+TxwEt7Fx7wobAvgYkguHp2BT4
	 MFv5Nv7k4bGLAUBq4PZGHAgEA1nscIFoQmv2nnTxomtbujgYB9UYyZirST6NwWLzjPzKL
	 kE2gLlVw+QpPR9GUwDUXrbnXvmP3mW2RHMajK/q436LYLNoE9H7G43Rs7iNdGlvqXFlVS
	 b2dQjwZfJ/2WmbFCdIKgjifEJpkTdpBrIBYLCVZ/C2UG2i9vyWNeIHl5/F4xnL9itJ5zX
	 9gJCC+6mPphNpNJgJoQ7SD0vmIw6StbQYXm0pe60XwcoWqcOJZ2J7w5lNj+XCX1UeXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
	b=tcgrT06I7EjU6eu3JOJYS6sn+vaIofMRRzqjYV7tn6peQo6Dgoxx/KIEx/9jDj/paW2U
	 kQB8HhgqTlSt7g1TL1adaWg0yRwphZEE8yM57NJWn1dDi67OPZBnSB3f7JdpSUuXcLmEj
	 RZcYBdmdyzX1KLJ1bLl1C9yWgBwsQwQVONuHCQp2PRQLWxsTXHYrFGYppHS1JIEQ580La
	 F/yB+x73T2eOrXGtuuDXVE4dwQe7uC31eXTqz7eZFbvQ1SKTN6WZ7y1MiNNlCGvMlg+8Z
	 PB5+ovEVixRV6Q0Bukrm7awsllmER2sPI2OjrC1RcLa1udgmHrvGOAwYze4y+8zS4ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qfm7HRpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KNMF3tA7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70896606D816
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70896606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qfm7HRpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KNMF3tA7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K68LT372196
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gIzkbjDhFpI
	59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=; b=Qfm7HRpKQ5VZqEMm+FWJ+oU87zt
	DAXYsKUehoT6EzN6nBis/jo0wPujP/mUDElQijsYDUURNNsL213xNOF9gC48Vj6b
	E8H+gsvwski5SAknyOF6apNL+DtnezzJkzLf2kpSS+s1vYUDNUE7O8pHzFqT6WR8
	GNqP93Vw1DAiSQi1yCAGffHLdrRpfpp6ugmHoskWHDJyHAuXqZpzk2ShnSJWGyNE
	vOETjeXcdNlsd5usYeMv4wMUYHiepbRkgtoJvPlII1OwLip3tFBxPhK1f3P3JMmd
	EmVkGpUex/65EgS0IBGCnPn9I0BS6sXp+eHqiaXi5+T0sAAvzUNzfkQqw9g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r0phd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:05:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso2324996a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657109; x=1794261909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=KNMF3tA7ZyGytjiDOD3Y9W1E3Vc5o5+LTy+qZkuT8NmRrRD7DbbInhgzPNOiXbUved
         6D+xJrDmTEdgMRhKcwMog7iAy6rDPQxJBIBn8KKlL/YrauWUPzrdOEo56pboG1njxniV
         lNSE/zCtbe/uStM/kEqVMM0tJGnZuJV+z2/TteV7d/suFnWamDvyEFF2sBInNtnSfq46
         yZ96SRosB/vJ5nZdnufY93RJdlp8V6CW6gtlpYAIn7ps8Sk6GYzD6POBUDEDWyELlKIs
         aNjmbYKJS03ZBDBzx798NkW+ghu/kkUgqTbLamMnVFxOvgwIPx+0om9QcP+WKzDoPKEI
         LIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657109; x=1794261909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=ezX0PuBghaIRszZogFadj2EBrxbqNa8r6agTB8YoPcylliR1IRHS+WUp7dW36iOJw6
         wYCT/uHt8vmDSq21qTYKB4V8UEEqgHtSexhHRApZNncRTNCe9QxDqaUio4SAwqux7vhS
         5b0ok57Tzi0LL3OJASe3fkpjfk5cFEzEv4eYeJcIfgw+ejH6A4bbnjOs2hy54W/Xr4lN
         0RgBze5wzv1IceToUVYy0376KdjtC/jMyzVZHOpuN2Z4Bbh3JFjAfg7R0UfKS1Cecq66
         qFbwgg18vGg1qQDl5vL50Wt6WPXWI0rNdkl6U7SQWNx3xh5e7xtDpyJ3VV/vInoNFAqf
         uKWg==
X-Forwarded-Encrypted: i=1; AKwUvBw5Lg9qqBf/8WklhdeaFFsa8aIA2RhYrphk9y1LE/EjxEWxJ27HY259h4q76VUM9Khp4x5wSaDe/XXsS8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2PFoOjTVb5zrvq9voWqWXjw/QrSwpBFvUDXLIzflRgJaCDoF8
	AyGasa/YeLMo/YXUOx/4QfmyyqQyHXrbbQU1KlNOEbABuxYBJvgqtvaU4tcIYXfdqDEQej0wnfm
	+pxe0UM1/jf9drcDItmSsJxZbh59qXg+qcVL299X7qxqkMBe0HWQyscLachExVAFV2u0=
X-Gm-Gg: AYBFou3uIRrP5Ui6mB6PwI6HI9fmA7DT4NYxaAYvS4jtYQoH5etZ/WSBFOC9wH5avfq
	oaF2hwN4UpNnuLxEGtZPy3u2gMIkEKP9b4j7Vza/yz3GGwK24OZVmv3wPV16k6zuOQM6wdf5rGC
	p1V2ynTEAPMpTLCI2IkMiNtiTsoQlf5F1Mit6b4WmefbFA/DCzZ8YyGKldBA5D/KRg2FrXi/tqX
	8MiiiaVrD3wpjyKNHgWYezvibn0ca5HupbSchrBtciNh/5J7ljHbsoQKeQBagkn71aojr/OLoi8
	DE+V9wjHUcNe/eMjm6PL9MXZyrCFZsLTTnFuFn+qtmIFtKJJ3Vzc+oup4YqTqkswUT5kSMqwzle
	9NtNAInSHp448FWhvPQtUfTH6XhRFfdutbxT7D2nT37ujiKMWyixVV5Ijv7cDtUm1In0RWwDsY5
	01ne9/nenK6npEOSDgFMOvecY=
X-Received: by 2002:a17:90b:4a11:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ae896f8539mr8634110a91.18.1793657109375;
        Mon, 02 Nov 2026 14:05:09 -0800 (PST)
X-Received: by 2002:a17:90b:4a11:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ae896f8539mr8634079a91.18.1793657108947;
        Mon, 02 Nov 2026 14:05:08 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm9255505a91.0.2026.11.02.14.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Mon,  2 Nov 2026 14:02:59 -0800
Message-ID: <20261102220405.30730-16-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -aNRBlGoB0I7ghphmR9BnoaqhcHgFZuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX0Q3uOme4Q9U9
 7jVDEYL7EmklYMzmyMHohe/vQVoHEV9mX7p5kLFPovzh0gONDFbIAG4pbfkcTfmz9i9EWQDAA6d
 0nosGfWOLpCIsZpdRfVYyraIMeZwK4S9Ha1hOkAwHYGVZXf9N/NBk+2Kkz2RX3xuV744rDbCNvE
 r9KnXWXtf/MyzJF8oU6LhxOJG6310LFQynMcgI91KgZ5ezQ5QcKZisiVOJC3SiF9spO1VBk2ybO
 Ms6GoIFlfIYchnNH/ZZonMPJOnpM2cB/RJn1P3eqXA9FNjsCXh5KEXes0lM+zFmfbOM1ACn0zEP
 v2JY1f2p0N2tGajfNURAZeTzbL7II7/D9Hb/lo0VEw0kQ9NOjRY5T5olpb7f4npcM8UXee2OL0c
 K64XiDdazn68HpyCHhLIiZa/6aPqAKEYJ+j99I2OUmm5Ei/5D2iKNkN6GmUhx57CRk8uKZUCi8T
 BBw0DUjZEFJnQ4uDIFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXxSYGVkx6nOGO
 2BdW+VOFRge9+3vCWx+KOzQwEGBC1bHAtiDsiR9SIclL7hxgfOkvr/vzE8ILogvfiJ8yWU5FVp7
 eAZWQa40dji7jhsablz21NiP9F7fax4=
X-Proofpoint-GUID: -aNRBlGoB0I7ghphmR9BnoaqhcHgFZuC
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae90916 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

