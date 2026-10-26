Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017331;
	b=jQFZkpwVBJBSBmC7NPTZdBTd5PquLSI8diCq+C64az8DIw23uPacSu+P8URIh+oIESkZ
	 6va/7/psJutXUKOyj3smZwowf3jY9CKnK4ExrDgpl5700WT7uf4PLqi0Hx8SFqmRLFV9O
	 axqlStLgfoPLUbszH628X5RE6srb4GPhRCKJVwYNZRbb+RbEf784t3N2m0jLuEg0mq5Xj
	 KKI+ndy+x206aRV4CRmec4Umhn0hfXjf7ihCEZ8kO6jnq8gxP6YvNk1f2cQbCFO3z6EQV
	 eTXL6bxyUN8Mhqr0wPn4HxZBlEVE26nmm/zvleLd9NIBu5rFEGipickdBosHR8QyHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7qLl5/5viFxEYIRHoiFrY+7Gr6BdKzbzbBWkJ49w5PE=;
	b=DLmp9LGgnnh2bFYClAsxSsnBdZBX03NpNGlQI4/IRZf/j05psGQsig3JeVS0Tv5RilB6
	 VSvs0CL07SGO92E8y9P9vYQp35J3T9lp01WoJyYHiEfv42e7Xsj8ZuQBaSjtAOlhkANWd
	 9QmpdnKyG9Nhj3nTQkc8MZFujVXNX5FIOo7SxpH5LvGS2gOx40GtNus/afq5GzdAIp5iQ
	 /5BizEQArJt/SB8O/0COhxVTCKlKCT0jGr65tJ1HJpLND58G0l2tVDbyicHB1KM48etDE
	 UUEWeMMHh1n4qN1SnZaP52juKkWCNUzsxAJu2+BZMaV/XwBrWgl50+otpsgYA5eaicg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0FqK9IX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsyULzmp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EBA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5EBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0FqK9IX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsyULzmp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMRK2009940
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7qLl5/5viFxEYIRHoiFrY+
	7Gr6BdKzbzbBWkJ49w5PE=; b=A0FqK9IXSCbn+6OS0VxpMn+yCoBTDqfG0mMfUy
	iem7rThdrA0XyyA/RveUBfujsuqXFBcUNLQ2840WfGrvmBcj32yzkmJQ7rP6Zns3
	QCEZ1rhzxImmy03wa47JXo0SvWVGl0GFVxAYuJc5cjAffVSNG5rAfMVy6QTgafWY
	iujaTunDh1QSr75G1jFwH1vmgpAxjgo7ee9JkAt0Gl2bqWFIP8o0NkvVOCoOLqlY
	uOTzEpYsQAyl/nhAtZK4prIK9mIDHnhm9Iq15yHnVL4KsLHTdwj5u1ckpIrL+hl9
	pVHHzlyJs7QeNsWLxvVhpbGfPw7R2QVWoilPgpQ6ntW9JoNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xb0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:22:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so375157985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793017329; x=1793622129; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7qLl5/5viFxEYIRHoiFrY+7Gr6BdKzbzbBWkJ49w5PE=;
        b=AsyULzmpZoB24LBjPN/4IG+FAGUv2fHqQQjKvQ4ECS77/LICmwyYey4gi758E2QhVb
         h/9gLwLUFg7G8KuImXBNc7vXacGRN0zGc7rNoCFSbZKGTETnj4RIwYZGWwb7hy1WVDYB
         QekjSoB9/xaiK+7xAT8VFOYeQA/ccZ2uz8/yI7vxW6UMozU0X0HRahp4coadbEwlBUE8
         mlQE3/yg//I42C0OVl6uW93bbkNdKqF54HXMS6feS/gtIV/0jeors1qX8YS4vmF4MEfe
         bujTITgVi6u5Am4sWiD6nBopF+Xnb6/Rcf4Zt/0dch7m0ythqbF/unyB9ce9cPQI0OoT
         4I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017329; x=1793622129;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7qLl5/5viFxEYIRHoiFrY+7Gr6BdKzbzbBWkJ49w5PE=;
        b=syrtWX/YSPPvUIocDO3FoJG26s/UiLv5SXo91/6Qn0NJdMRnmPJ+/LJatuciLHEOVn
         2M4sQbH7CuYEgAhsoVnp/aY0sYYMWfshtn1XCRXIbYQ7pXWpD7rPZWuJME9VzsuqzPwS
         eukhuXnslga+1Igmlh+JcV+oWxsudZ+8ml7nCrUgZmd+t9OBktoezkCpuuN2oHvS8UAw
         D1shHfn9j8r3ANEHQ3r7Ih7kuI9auRLfzQfIPgClIuRjM+5nhWmuOSPvYb5LlWE+l56W
         VRJf9GOmUpFXhXIlcECBvc2Z7qibbOLTQTRoZulQ+BsMI1m03onBfisd2TuJuSMhmLoa
         H34A==
X-Gm-Message-State: AFq9FYJPMEVL19klqzrRz51CuyI/NqAqCDuY+Ja+ZybSDxvN93zkUY57
	RIig4E10LqpdPwwbxQNGi2VQC8+WquCCeaEk8JlWIJuzi0VrL8DKgYiTfYOZUegBBGMmejEwZTf
	85rXSSfULm8u2WMLCtYZxJ+Np2xnXPgd1I7FADVaUxeLvAXAE0BuaZq8ivJpACAcu0dvGwAIJY9
	M=
X-Gm-Gg: AYBFou0JkHlVciKJiYsDsTZ+SBJKyxutDU8YC3mWr6zMvyLglYq4gfFC2lmiqNNM4Mc
	4kxnvqvhP0E3d094WF0eZWKoxwKnlR+nMMJIsjZk1xhJdGdsJTlxeeOUCnIejNF+mTNfx5pHD17
	ssZ6V+4KohpGv5hAAuUJL/l5X8DbKVZc1ZM1IVC03YYH5lxisFUA8U2FsKSfYrSVwvGxIxeCodj
	i1jDdvyL1v4qTbWF4Ee44YkJpdRNpHeafRtTBGjfct3mKMFaeBfdO6+aAob9WubafkEl1Nqlbfm
	xkZmElqV1oRYT912l54II42TzjegLHvUR4uug3Uie6BtjsmV6WoFUQrGyJ5mG8dj/ptJBgyeIcb
	nPuTxmgYbbw==
X-Received: by 2002:a05:620a:688f:b0:93f:47fa:b72d with SMTP id af79cd13be357-940ef940013mr909290885a.35.1793017328728;
        Mon, 26 Oct 2026 05:22:08 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:93f:47fa:b72d with SMTP id af79cd13be357-940ef940013mr909283985a.35.1793017327944;
        Mon, 26 Oct 2026 05:22:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm17909131f8f.48.2026.10.26.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:22:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:21:55 +0200
Subject: [PATCH] reset: gpio: Parent the reset-gpio device to the GPIO
 controller
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOJF32oC/yXNQQrDIBBA0auEWXdArQTpVUoXRifplKAy2lIIu
 Xttsnyb/zeoJEwVbsMGQh+unFOHvgwQnj4thBy7wSgzamWuOFkUqtRwKZyxeKHUsOWTIacmeV1
 JcLRKW+eiUz5CrxWhmb/H6f44Xd/Ti0L752Hff5PdhFWLAAAA
X-Change-ID: 20261023-b4-reset-gpio-parent-to-gpio-controller-6401488d80ad
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AaXLAy4MUVXLygO8SVh+4kVYO+RCcf8vtfnn23BPTaE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq30XtFZy5ZDTniY6aPPcMjWgiqvQfi2rg+b/pc
 K4c8eP+qnmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9F7QAKCRAbX0TJAJUV
 Vp/eEACayw1hpGOFFlZWGbMj99BklBzML15yhBDJRK5G8KNU4VwBE3OroZReFooqRdmVu9sWKlJ
 XtNlPuU/OhT4rYt/4c4RRwRwnlgCITZ8f8EZoGO/FMnDb/z+XUsd81YQk82bvY8BPDJa0Jhypvd
 9QWYLA1xRulD2awRQJYP63C8k7k7i5ln1xvlhZgdnVbrHVvcLcx4iEsa/wzUmBnHSng85wg7sBR
 ukG2q/1boHEqjkdWjRMBR4iqicB5gU2tP4miUPYGl7d7Pi8STO8trnfGvdNmJsoMlva99hg39FN
 7e4EbkR7iCs5781H+i1YeUzOTX6FKOnRpev3SNk99M5l3wdWWKvgEFn0RvR/QC0S6f0ZJyCyjo/
 YQAr29ne3Kkzv7ERaZV0XHZo+dgJQzyajF4ru17K7NDVZichOdSFpS+EmlLW1MsoP827F/b8+ff
 xA+cI8hMQJ5lx3gVbmUVxnBOJBB2DGsRSSp9Jlpf/toGkAXkMt8yecFc2BD9z+fIsTUCtfh/oL1
 jOaFbBj3sgC+25tuu3Wz1Tj8a0wwuruv4ud1m8UpZaNdIPHzlTpLCAhW52+lx1bw3+7u8OmLcrf
 LDSq2GqSjqPH/2dK0+LAG/QImbbBKqxG+7c0xG4oD7MksvUXdscO6/SbhQUZYqoTbI+OK5hkT91
 68X1ipblz9qtybg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf45f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ptHPqsTFC9mP6BrMpTwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: b6Pgkjoa_1EnrzqszS1tjbWL8WdT4stG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfX0Z+SWEUntkJp
 STyqRmIkdTeLplKPvzxa7T26GemzWLYm4V8y4nCIG7NKZ3jkCmfdXrR5HWuazoK1M7sDB0b+uOz
 wBQ9wPK67waERpqThZqfzPdz11woy2I=
X-Proofpoint-GUID: b6Pgkjoa_1EnrzqszS1tjbWL8WdT4stG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0OSBTYWx0ZWRfX753nuvmid0ZV
 vyJl+GezAiXyBPMQmHKF1guKFei7ptEy+GcJzNgzne5wquDeLWTSO5ydltsa/T3aN/7JFhzgjWa
 psXKCE7j2/2yA1pa3LIL2BXprwNWqGkOfK1dP/twboIp3OQxnszYr6NMnczwzgW0nXj7gzNRYZi
 0LSRg9nn1fY2kwlSUCiRgJOb+UPcdJZ8wNTDCG6YJkq7PnxdmtqoM3nJ0PCzb0zKXlTgt1qH6o9
 3YVXu79RI7nMN5VFHEea1HqApsV9AKc8geXHcm7OMLUFp1BY3oo9Xl7PcnySBN3cz7KtuKVs7jq
 9BJ0hUIKt6hrjd9SLUibM8LAu37rrhh0EoI/bmiO9m406H485WLnOibBSh1QHkEoJ5vkgKpHzUB
 PrVRzCLpqhGWVB3J1WsqLjjlWLJmryYJDR8l4XHUD9VRzdbFToot9PLUt4LQTiwbHruSmGsUO1i
 CtkaJvR7HF1y4S914Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260049

The reset-gpio auxiliary device is a child of the GPIO device providing
the reset line. That GPIO device is unregistered when its controller is
unbound, which removes the sysfs directory of the reset-gpio device with
it, while the reset-gpio device itself stays registered. When the
controller is bound again, probing the reset-gpio device fails:

  reset_gpio reset.gpio.0: really_probe: driver_sysfs_add failed

and so do the consumers of its reset line. This happens for example with
the LPASS LPI pin controller, which goes away together with the ADSP.

Make the controller the parent instead, which stays registered while it
is unbound and gets a new GPIO device when it is bound again. Keep using
the GPIO device if it has no parent.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/reset/core.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..a1b82e093915 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1015,7 +1015,7 @@ static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
 	struct property_entry properties[3] = { };
 	unsigned int offset, flags, lflags;
 	struct reset_gpio_lookup *rgpio_dev;
-	struct device *parent;
+	struct device *parent, *aux_parent;
 	int ret, prop = 0;
 
 	/*
@@ -1093,7 +1093,15 @@ static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
 		goto err_put_fwnode;
 	}
 
-	ret = reset_create_gpio_aux_device(rgpio_dev, parent);
+	/*
+	 * The GPIO device goes away when its controller is unbound, which would
+	 * leave the reset-gpio device without a place in sysfs. Hang it off the
+	 * controller instead, which stays around and gets a new GPIO device
+	 * when it is bound again. gpiolib parents the GPIO device to the chip's
+	 * parent device, if any; otherwise fall back to the GPIO device itself.
+	 */
+	aux_parent = parent->parent ?: parent;
+	ret = reset_create_gpio_aux_device(rgpio_dev, aux_parent);
 	if (ret)
 		goto err_del_swnode;
 

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-b4-reset-gpio-parent-to-gpio-controller-6401488d80ad

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

