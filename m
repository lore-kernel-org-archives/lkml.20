Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596054;
	b=typDJG+odaCXPbGOfSM3Q2WDjsddrvmHPgwbsb9rFYxQmrfOD48QfyrawlunAJaXl9s4
	 V8kgDHA9cRW3fPvWPF3PR+orKXhZkqN2YaQ/NskNgxIvXqQGcSoVVZ9ByYuSrfsZd42qr
	 1ktoBnSFEm8eonyE8xcL2JPchc7xkQFTA4JhmlrHMJeKbqG9r3Lmdqn9Ska5MxkE9keHn
	 1bv6fcmAn1Chxi1tendO5+ejXbDNtXssDG3rEXeBaiP1lKRLUiL6lbaYzPtuZuikWbpKK
	 zVU1+lYtjnGMW2aZ4pgwNaAwIuU8vwDVTanghfSCiwW4LGO2NwAVFWudvxvArrBBQYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=BhT7U1vBQXJxCdKGOtblXjxWbVB9hVyXc/SLUz9cf/fUlMv8/XR3l86FVj3o20Zak4iz
	 N8DVVUt6L2HecEVverKnLZtd05/xP18kOqlqq20QNo22EZLIK7UGPHpSFKo7Nd5TcTLRZ
	 +paBsxSYlsrMucvMWlvK+P5xMKHOgplPx+Jl3LXkINhH/PTdES01g95gYGhaHxv0ECdzs
	 jIXql6eSuCNY8WcPp0fk6tnYnCWtYgX5POWnEr1oE1/DnrtTfrdy4EJzP4ZlsbHGXKAvE
	 gbNF8U/jMF+8sgoKHbRLs9MwYHhDU0xRgGkWWqQQYjCmB/XS0/ggal2Ct7ImcPZPcYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D360A2619
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827D360A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR8AN737249
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=cQLzIrhSoij3Q3A92ujCBOk6ye4
	qmX/+gDp3wbXyaXnThiusMCKD3rVDNtY+4fr8xgyTpKSDW80LvkXAURGHSV25zed
	40dcT1HGZG+naWL+HVAdRSr3QovZKOb+WzNFyd2IfkBdjqdlD1S2oUQpM2GFU6tf
	jOwA4cYLo6OHq0gKz31H3gF5giQ7IhWrVmt2+S7bYLniTn4JqG9BqLikIlUn+RTo
	r8B9Rv85nFDqt9h7zPqSc9FpscA9TNPYOv6GFVawa5StM/DnjRgjX1GykyPffIG/
	fh/LWgFda52/cqPgn++nPXffKiObpwfDeLL+OI8dz51iCIz3A1OFQlHn4hA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jvfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so932191eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596052; x=1795200852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=GNDsz1BrswBSh/IYDUdbKQvcjXkD6p2ePaVWazbQLqgv5suTnG6wFkvO4N+LuOYHSC
         R4pS67i51jOV6DhHfSTnpYjPRcXAH0n6Lp89CSYRH0yR9bW12jtfNnkLgx6eyuvlOtF6
         BYVw450h2NyKR4X9EhSacVxNkQ7GlxdQ9fJGliTH4GVrgRazRsNOBAhtR42yKKvBvGwt
         SIL/2evaXcZrTbkveH16FYWikopVMHqCriRwy1MiMwvDXttaPrPZLkoAstWbpoteL4Ii
         2ASyNfmMT4uHSzKF/PnXGUK/BgQl4xfW69boUfY3l0Cxl8pv6EfUeEzOrw/iPrI/LX0v
         Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596052; x=1795200852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=XqB0Nr0KFLrksDt6Lw0HLczohqXWZ7FtzIu291MOmqAY03D+Hjk4etAUakfi33e7e8
         dnnh3mvvrn5r55wR6x5sof3QHGSWOJXy1iDAhmzmY0zFhr8Vv6EWvPf+xBzXvkl9+qXf
         TyGzw9Z9onj97L35PH5vlGp+kMUPsPlmx4/OHoehgPjwm8znT/HqsCyiYVfvTGTkv3ZP
         cE8ul+w8Dj3kBaEYJeN6Cu0v0a7xW+AokU+xkHnwNLG6BZgtJj9ZeANXg46lV+qny1Fv
         qHiOg8FhizU7QMFBecGSMqyy3f1n6cnWp030RNjA1ikYBHqFqtCFFYLDYDFhDGDrvDKV
         IbFw==
X-Forwarded-Encrypted: i=1; AL+hErFfyg0hXiWkf/dqsm7irfIQYe4r48qxvOhrKJ4GruJjeGJwARevlMbfLfuEqxAEJsI0UuWLirXzBNM6r8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zQ3PKyWDQZ6I/hx+b2hh8mq69brHbUBwcpkirVIPpEAhNM1Bv
	ZepMYI5FVaK4y96gbHwWqTR18PF+hd/a+kzLpjE9+VQIFE1sEvzbwci/fea0I/16Tkx4d4OsfIj
	iiK5aFLYk0GDs71BLZzGMKlnaxyY9uPog2m78JNgUgoH2VXiB+N+zxUrFcwQ4Z4hX+ok=
X-Gm-Gg: AYBFou2NX6x/wcWjMa68qz+6uYgjfkB7uzdv6j42erG7kkKhwqCzKk5uP3gC6+Q0aJ1
	WsxFdKnw0Mn+QzlZtBU4L+ash+gIMrpUESjoigHS3tY10NszgPaW+X1Cm1uyeFAdoik0mk/6HrJ
	7MPNUxH+EwehykPfvfZwFJ7LxPZwPRF9TcVZAgyaug/vsizGPGBi40R/ng17GX2FUIuSfSMU2ot
	vDk+un5PRZaK1Py5v1pWisN7lFUH6Uz+5RYGKA4scEEI2K3rQijC+rsZ2gRio7FCAh8a1RpURbD
	3yPmIzupNw+smpIOFMfFsD7YaTrMCJvWnzQYMWT4ehEFwX13eoGfQiQP2c4rten7+nd296MU/Ro
	9KnT23fZ8/vycZ0Wo+F56JaTdVIMvWu5ieHjOKcD6Hgo0STba0HJT9nDbnH5EAkdzl2MLhH4THY
	w=
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885946eec.13.1794596051411;
        Fri, 13 Nov 2026 10:54:11 -0800 (PST)
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885896eec.13.1794596050515;
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:06 +0530
Message-ID: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyvKBILGA7woJ
 CgQa2GBR3hz/iLdd4xofgLjXZ3XAhDsCfKxxa+ZrvNbaxImZ7sBmL093Mw4/WuoneezfqMEcpUt
 vWgobqJOS3UuO6ZnQVXoo6maY+BCqoE=
X-Proofpoint-ORIG-GUID: QS236YtVpBfGPdZAcr0VVVIlzkQlM1PN
X-Proofpoint-GUID: QS236YtVpBfGPdZAcr0VVVIlzkQlM1PN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX3VRZGNYp+hmm
 o40cKNVjXAWOS8d2m+XoZtW3AaC5CUjFM75PkeClX27+rTlmVYIvc4Q0HwyBs0WTGjJNNk/lgdO
 BjZEhtnKnfuU7CzZs5sUYfjzmTLSvzUhicTGq+CUVTUUq1whLRQU/CM1wS7rGAxEBJfZ46BdAS7
 HsDgyuosM3gY7tykXZZ0VtJfT03+cuA+s0Gaw4Wbow7Oq7CRtsnkDPQar4uUV03vWREn3etMqGk
 NUgT4fpdSvztd72NaR9eAlGDMN4WbAdxI7V09oq5ZnpN7jXy9GfmV6+gzuAZqdem91BFFvVrjc1
 fZTO64XhsdKuNKDKZhAl8fy/SHwCMOk6aGJUJNjlbeWq1k48gfRDGdesIWXgnjj0qk/mSlHA4oW
 cSAXGYGyG4ArWRBW+8ZkYHNQc0RYlvtsKg4dYbu+yH1H9MvAdRwXhO3KJCAdrguy0dxphpee2gi
 LRBXQkYx+hWPlHnYY0w==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75cd4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=PxkB5W3o20Ba91AHUih5:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

