Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846176;
	b=tWctk2rJICycuteb754EKFUd+cW0qZUDQavvjpQ/VxP+IsF97r+g6oB6nkayNmCVsNVe
	 YePbOaDKPf5T8QPc5vWmqcbdGGy/zkhf2DFC6Rh66Lpj76lH+duSOHjLlz7MU6tJ2UkWA
	 jxsSZdar7DISclLCfJZFLq0xKm3XfrwzaC54HzLfXuOetwb7wfqXwSir/EbbZxwea5cQV
	 hsJ6gkadbKPge81fF6U1YgjzMUPMU+I7e2uQPsF880trAhjDAAvz8JhHiTbR2c056Ckgw
	 N0QI2ZdVvzT+/fMwab55jLL6o/D9EUQvvHZnsf5ZQSGduTLqE7pk7MWpKJHMgi2HGdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
	b=vSZYXeraEd12o2uhESxGj7OD7FHJQUq+l2AM4dNTDm5qaUSywNEUHLW0qrTSlR5UkBJA
	 XEKyO01QVQdIcn3MqG5bRMoPhgVr6JNHUp0y1eBa8EHMFJkNKnXKlqroyiJp7CnYQDN4H
	 aA0c/j/bjywQJQ5XuJG5B8RpPSR2hMVSMSjbTmFr0VJlK6aQtAwHUUmIymk010vDjQtYk
	 OxzKQMsHY4uqt6i3aQZK9fLIDpN976omgULrwoCBHOjqpBohnWNF/cxD13/ZJhd9ihdQi
	 RgGZxRZaU+WaPct57uH9gCzzybkF4jy4G/rF+RiZO3qSOg7Nb4HVi4bBH63pzGOzHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F9606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374F9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JJXXqVQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d9sgcvnr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIYV7153915
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVUhyr3d7Ss
	o/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=; b=JJXXqVQtYeE7I2LIEKqks+Aj4Og
	6mnE8TIi1ILCOq3qM3zVIKPZcwh5rA41aKqTA6PTkfDdudLi89hQdm0W9KNvl/Se
	V7ZsXAWS9TIyjztwC3XSBW02c2hQsa04UDoTLnpOwWu3P8l3aDQGk3y/heMjTuRT
	nNm5k5Zz+jk+oQGwu5nk/eX64P7cDzS9BS1E6TA2RfiRwgwpbu07xlAIgaXOdyxk
	X76qpzY8fUBZL81X9hbki8jvo2HfuhfgWqE/h0hlG+5IywHykWIzfTG5M6T/EOBv
	s8Vl8bPkaZGplcg+mhacoh3bDccKZF7hLzLP6YotlMs9sona+8iakVmMXyg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghjhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:55 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso3194771c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846174; x=1795450974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=d9sgcvnriVBI0vbCeHhHUbG9IeWuVL+9OJyu51Fdi5gcoe8z603BJyj9wfFvqukxRy
         4GjsBduEkjKRGesd8Cc1O+90jMA7iezGrl7LSY9fVVoTrwUnsl2aQtzHohhDirixDrHM
         lHjv5A6FjURb9pgiWdZSaeyatRB52I5AiTybeNxtdsXMBel3Cm72HaBRtmeYCKT4T1bM
         3xVAaT1lPv2+gjri5iHUg9I8j3rCkaXnjhvVZRRnImzhxJ4a/h4Wr1N/kYx38lR1jJYi
         YhQs5+7R9Y7BcPoa3cn6zT1sH7SP+4CeSn6ooqA6VB9tYo+E5fkmbxQ5GGzHDIUxJz+Q
         21kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846174; x=1795450974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVUhyr3d7Sso/D9NKbMDpNOE2qLCl3mHXm6sLvlZOYA=;
        b=g+hkYgHpPNUaVsDqM66r/ncQZhoKz5MlahJHGjItCFDcfOr+qfnur98kYAfo9viusi
         ry59MfeTMQ7hL3dQPr7agPKGHeJ3LP+SDbp5TdE6M1pDVmlRdClcL/u1WfOsA0MLHLZt
         olz0uxuCy85TN/wTp824Poc56d7kqiB2aWNbXcXe8OnPtNBJ43MVdi4RfqXQgqNbOQpf
         RNM+evZHM0YEecMCH9mf9OW/803FfeYdYQJcWIylt/e+qDx8HnHCmP6x0UX8oKeNf9aw
         dAyois7Zjkj9vZrXL5visd8HXHUxTgV04kHGKWO0krKFjo0mxMn9i5UNG/LLHxpbeun3
         dJ1g==
X-Forwarded-Encrypted: i=1; AL+hErFX9JuTTl52pVJkzToWn/r5Ho5oWFkx5kZ3hwqtmmwXqjcFTv0L4lngxrkY4KMZSL3vXd6J1Z/P2JYGLIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fRSfx3Tc+ImoQ18bJ0dk8NmOtfhjlVnQFon19Z0nX+LzNaV/1
	XBCMVRqIBv0jY1gsxWCAKQl/vo+G6RD7ryen0QFV1Hj0TrHiUfnQsTT6HGOCYtB+bzMSCxg5pjd
	AhP7oV5s/ICAFXIFZwScJgYZLP8czQTPslC7/UBolJTL7f17lhKcSqHq/r7GUrafGHFI=
X-Gm-Gg: AYBFou1Q5IA8ghQRiOvJRvHTlWqPnER3Wl9JRKGX+3Fw7NguyjRli/uvRqqx6yKyLOb
	W2vnRR5hcrP9eAo9lYBZv++M0+8bxR3t8XFFg8qFQQfKzV/X2Iunh0Qac3PgdHt+khE9F/IKEW3
	FeVUPaylqFIWVt5GsUyXnH+rpeBsVGKdeoRWtSDIQzYKJ+DmTImdlv/a25KlKbDO3C1/gCL+qZl
	paCqV6xZzSJ/Rv60p7v//sdQhoDOZAb66m4kGrHfKv9d6BA3oYuWQqF6xXyRcRlp4aUTRCRdxQ6
	G8sM19C4s3SKG/t8tLqSsZhOCryj23sqMNhNLoUKjHmi+ffde9nzdRINyhqyKaEJusNRdyl4yjZ
	lKmj1mTq3ekcVuTFeVYbfsV3xfOVdj9voP0iP0iC768s4kqYKQinz5sGjYeDEQ7cLWhmR2of4pJ
	nF
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214606c88.33.1794846173943;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr11214575c88.33.1794846173198;
        Mon, 16 Nov 2026 08:22:53 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:52 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 5/9] media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:44 +0530
Message-ID: <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2cujpFT1bKoq
 7cf1+8TrZjhkG13Vh7gbKv7TX3QsIc6+vohIV3CwoaTRq8sOEpV8DKAonJPFhvLh7neG5vX4qhP
 4LUJD1GWR4kxd8QH7l0Yusi/d45N655UHoOY/5TGWnKNBCHUPIMGXz6GXfhzS0e9vIUyZGp7RO/
 1GCHzwlpyTcwfgHuL19pp9shH4bfBubWwOYUzi9zdT6OHTMCcPRtipVv0unI5NimiuUaExSqe3d
 QYR044jVLaVFy+KIBLsoTdnzwPt4CkTupTbjuebHRQJTPlowYrRm7PACKgH2n845oVIpoAqzQE3
 IjNsSMMe38h4O2RnSYm+P09vTgp3pWyg3J4j99vA5gpkAUNp5pUowb6n3X7BUi0gs0/8nXn6Zz6
 kGkqbLhhHvMmH4TFgMTlhJK4c8NSED8FdextoUAiGeGxGlEnr4I1eObEeNVFemy/MjzwB/kTJVu
 xTjsyHCfhugQo3imShg==
X-Proofpoint-GUID: 5ZbT6fl4fv7eYmy7GmRFtO1t9dOpVihu
X-Proofpoint-ORIG-GUID: 5ZbT6fl4fv7eYmy7GmRFtO1t9dOpVihu
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb2ddf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VuDNxQijsV4jnZh2Ru4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX61ObLDaX1Zv7
 5cjVkhN/kAm0Vo3+fbhnYuPAgrC/F/1ozLhWl3RIw/nvIOf36anRBvNv70s5wax7dIaiwj/h85R
 pdyD3VewT01vfIVKNiwTOQ54YL39U04=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

venus_load_fw() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. venus_boot() calls qcom_pas_auth_and_reset()
for TrustZone authentication, which is the intended behaviour. However, a
new qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Embed a struct qcom_pas_context in struct video_firmware and initialize
it with qcom_pas_context_init() inside venus_load_fw() on each call.
Replace qcom_mdt_load() with qcom_mdt_pas_load() for the TZ path and
replace qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
The non-TZ path retains its memremap()/qcom_mdt_load_no_init()/memunmap()
sequence since qcom_mdt_load_no_init() requires a caller-supplied mapping.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.h     |  2 ++
 drivers/media/platform/qcom/venus/firmware.c | 29 ++++++++++----------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 93fa77f05834..84a0d4a8426c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -228,6 +229,7 @@ struct venus_core {
 		size_t mapped_mem_size;
 		phys_addr_t mem_phys;
 		size_t mem_size;
+		struct qcom_pas_context pas_ctx;
 	} fw;
 	struct mutex lock;
 	struct list_head instances;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3a38ff985822..704343e241dc 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		goto err_release_fw;
 	}
 
-	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
-	if (!mem_va) {
-		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	if (core->use_tz)
-		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
-				    mem_va, *mem_phys, *mem_size, NULL);
-	else
+	if (core->use_tz) {
+		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
+				      *mem_phys, *mem_size);
+		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
+	} else {
+		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
+		if (!mem_va) {
+			dev_err(dev, "unable to map memory region %pa size %#zx\n",
+				mem_phys, *mem_size);
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
 					    *mem_phys, *mem_size, NULL);
-
-	memunmap(mem_va);
+		memunmap(mem_va);
+	}
 err_release_fw:
 	release_firmware(mdt);
 	return ret;
@@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
 	core->fw.mem_phys = mem_phys;
 
 	if (core->use_tz)
-		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
+		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-- 
2.55.0

