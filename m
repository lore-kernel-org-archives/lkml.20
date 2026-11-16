Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846206;
	b=BOcAfXbLZPcPFIWLpZcT5sMOiFQq/0RMFDP2oSPvO54PA8BrwQ/ikyk0QN65wzZ1+YG+
	 1eDzDf/pRGndOKSdVrWUEKSt8QZFQnXY6k7biQ9wpQER3ZfdM8msPms87QPxP/yxGnYI0
	 48ZPbtJC3O4F9jTej05xG64mOm4kw9AdpGUSIXWWUaI/Qx4Ak8k4w0X20pjckHgaxNsj0
	 OAmTsDjMTN7H+8Xusg5b3RAG/aR15CXysRUgAn9ca/G4OZZXzUUB83mnv38S6jZhicImH
	 pP4jkbznz5N8NCJb4B2jBWV5QFXkqmMYG4BtWVXV2TUjJSGuaAvh7sqkMsVPopVCU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
	b=Z1PJKG/UIQT3ZaUCiBq9dw0efRKdzshJH7MzDKMnF2/Gm+5UKXCNHFH+NqobVcl28gJr
	 hpA4QZvSjNo/ffo3BtD5j/2bSHQL3V5fkjIuTGanxa2Di49lN02SyA5KjZHMaW3k0+SMo
	 thtgzmShiu65l+e1sZLOT1TSdq6AMrLvmvP7J7fsPRnAh4/ZtQ1GVQE9wDeLeHXbVYsG8
	 9TMLFc0jdqfCrV49xa/6dcxPGDGb87v3fzQ8BA78fzrrp+ZhYeSgJVIWavH0JR/NQrrb/
	 sWcZuQwsRHd0SxqCm7dhf+7zJBb1b2oPv1nvIoJSrrGToxd8Wh22jB2zNCDUBBLiIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jT42H1qg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DhJ9SCR7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF2606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FF2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jT42H1qg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DhJ9SCR7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIeGl2055786
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0iSH72bVkOb
	J6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=; b=jT42H1qgiCDlGxRcRtQEi/B2bZF
	tLeo0XIzsD2ZzgGZ1ADa12XsOqaBp9cyGCq2p8uUk9/rm6Ajr+wzl+cz8hcddcZp
	hzpH2Vsnb5uMlvHk44AZdco3mxi6g3/9PHpgZl9fO+Ih+thxJf0sIyf0Z+FZ4ez9
	RhwtNAbAgQb9Nk2HMrAXhEsY4F7bFlhgg/F3Ro31pX9QZG2JTH9erOosOgvrXur0
	mHSqdEjqpV2gdc3j+3jJ/TLHjb7e0iObiLwLdFyHy3jLD4pgLJ1yA66kgMKT7sr+
	1gdxzWxHrdVqc3jen4OUX4MTUHuwz2YmiLSVsvByZIHt40MK+IdJ9javByA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqhdjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so5167071c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846204; x=1795451004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=DhJ9SCR76ZgKZPRLYTnu3OZX2UBOUsU+UufdYChRJlche6uQkCw3kjUw2agMnkz9bl
         rF/Yq3agZ9mg/MkFOr5V2iEXxItTFs63iHz7cgldNUvmiNlqD6t9/AvXC2FYfnlLRGjd
         KAPrz+CPNOfoSAP0ui7ti/gvgurEqKhwbyaL+zFuhqgWkvyNXd8mPjhCxEk6yUcEeqPe
         NcLB2GTdG8nb+aFwL9svZDvpahbAGIe61rvnjkj/mLKx2Mm98LdMdW/RgAGX8znviJr0
         1AJdJAECXN3/igCFV34VYdVpkc0VMPrdlsuvnG/RVhXsK0wbA4icPwsuppXcQCyPjFFM
         UqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846204; x=1795451004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iSH72bVkObJ6XNgFyC1IcqJNSUQhJ9lsse8nsmCQfg=;
        b=hRwLsG2+pm9aoHCdyGVa9n/aPCL4wJCZIUiNamK2AxuQq/RAA9sNRdWfdMrKjeJEt2
         gZ6FN6A2Wf4RRMLFaLYSOKHb6bny+OSKM+v256PrTUdjoZfjfpo4CySk0amL7sG9prF+
         jppt0M4Q2GD5Q6VTqFgoBt4Xf4xat9AsJ5hIy4QmT2ZzyBzxhRRpzH2W5ZIhDqbmFTM+
         76NEBjjyvL7w9khsdvgUBY6kHqd6pE6usOwVZZJeNM3Czx1bYyoiOIWbherHYaIh0nFR
         7cll9j4UntmaBCFkNzQZXBP87jE5LlMDq7//YGD1FtL2q3yw1NHcjsLi8PJj2XwdRINm
         oGTw==
X-Forwarded-Encrypted: i=1; AL+hErGDgemWyEfNVIL/dcp87kdKUgGQCTGx7vV6fSkYt7Ygz5i7MklM2GHrMu0iKR9M7ejPrVEu9VS6ZEx7stM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/foxndAKNYMLDQtVk7z39CwvIehrnxwdPsfiiJXfLZqVTp4qbr
	QfbfW+qAf+1ZFLRD3K9BSIlRkCZoP0uhT40Ka7ESqPRKuSoz5Xcb01lWQ0VIHMiprKjIrCyu/6s
	9nhfVZSLpUMzAP8h4Zc4us7SrcyihRrL4ZZcMI5HhSy+/m7CiI5CzynJQVsXAG5WTmT4=
X-Gm-Gg: AYBFou2f0WIvP7JSq/D5gr6pqKiYsvgsUn0wdY+UL5uCiiPKWJ7CajUatXbTFDD0Fju
	yeabCIpLjFd8TQiKo20TDDNGx4oxHaaCjQ1F5AQN3JYzO4+4R9zggxMcLG/nyuLjBbhYFMG2yXU
	EHLbVYir10l4fkMCMcKdCFf2CKfQ2XUKM2wCPsLI8SjAq0W9p8Zc4lFcibP5jgamG9aLOATmp5P
	rwLy43JQF/1jkb7N9hXxb4AZhfLUWaGBOivh8x176fJdoJ9qPPRXaB5crYn/LjV49o5Wb+XB8Sq
	2mjEj0MbYcBB8yhYGNIX7UDuwOlT+lJ8omQPQSVkr5fS6+mUFjbgiuahoRfVs6Ps4LUxFDcC2+Y
	NCs0uaI2+azstkaazNMAHkqNeA1B6oLDpjZPV0mjiJobqQJCLxuvaNgjNgkmtNIaFKv88NE0p8M
	ln
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr10284793c88.27.1794846204113;
        Mon, 16 Nov 2026 08:23:24 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr10284757c88.27.1794846203416;
        Mon, 16 Nov 2026 08:23:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:23 -0800 (PST)
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
Subject: [PATCH v3 8/9] soc: qcom: mdt_loader: remove qcom_mdt_load()
Date: Mon, 16 Nov 2026 21:51:47 +0530
Message-ID: <20261116162148.2864501-9-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb2dfd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GTbpKQ6npsRNubDcNtEA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Q6hWZg8mQTWIQpE2jkmSEgy6AV4T5gHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX1g1MYgP0/brG
 0/bLZslHnda6SpK2Sy1LVVJ5XdUOqSBol8xY/WJqnKsG20NIctNck9HcNEcP0AqhtQj7Xo9M1HU
 kuCPvm7K6bs3gDvBJvgCRHrOzWl7yleg4e/bodKlv1UMdGiUG+Qep2TiaM6tqBDZqjugI8cGC9/
 dQzfUTBVcMaFv6V2f59m529gCZg4PiWb0aM7ElIKkbrW81QZnGLmZw2G13ylZTwtocmBajxvxDd
 /9o1aH67fpuCy7REgL24tiATIcUbVQP4AObpUsOYGEayKMAu7FEyweLzaOr5YN66OvV7eykPKll
 QLlVA7ZO67wLNKxjDQDczZS8apFDDFTxEEa8BR/LStDmYj5IsHTOqrGuraQ9EqPfYo77+td04Yo
 ZIWsrY2YeoUjgGKXqJ1U+6OCGtlr2nduh0PPZI3Rs+1xegWQsFKdKGlKSNJqQTB46Uztq69Uppt
 Nni4L0YJF2ky/Liw5wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2wCivl+orKDl
 OQ4diIVbMD1C/QVLTNNZl0z14OE9/ZewjC1u4MxLJz5UobVOo4i//moxRCR+/HcCE/LzzAVo66l
 WpxpcYjEqyS6IWMGSjCWdvRPjYdewaU=
X-Proofpoint-GUID: Q6hWZg8mQTWIQpE2jkmSEgy6AV4T5gHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

All callers have been migrated to qcom_mdt_pas_load(), which takes an
explicit qcom_pas_context instead of a raw pas_id and delegates memory
setup to the context.  Remove the now-unused qcom_mdt_load() wrapper
along with its EXPORT_SYMBOL_GPL and header declaration.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 59 ++++++++++-------------------
 include/linux/soc/qcom/mdt_loader.h | 12 ------
 2 files changed, 19 insertions(+), 52 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c6ec67e1da09..fd638833b17e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -329,7 +329,8 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw)
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @fw_name:	name of the firmware, for construction of segment file names
- * @mem_region:	allocated memory region to load firmware into
+ * @mem_region:	virtual address of the memory region to load firmware into,
+ *		or NULL to have the region mapped internally with ioremap_wc()
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
  * @reloc_base:	adjusted physical address after relocation
@@ -344,6 +345,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	void __iomem *mapped = NULL;
 	phys_addr_t mem_reloc;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	ssize_t offset;
@@ -353,12 +355,22 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	int ret = 0;
 	int i;
 
-	if (!fw || !mem_region || !mem_phys || !mem_size)
+	if (!fw || !mem_phys || !mem_size)
 		return -EINVAL;
 
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
+	if (!mem_region) {
+		mapped = ioremap_wc(mem_phys, mem_size);
+		if (!mapped) {
+			dev_err(dev, "unable to map memory region: %pa+%zx\n",
+				&mem_phys, mem_size);
+			return -ENOMEM;
+		}
+		mem_region = (__force void *)mapped;
+	}
+
 	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
@@ -437,39 +449,13 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 	if (reloc_base)
 		*reloc_base = mem_reloc;
 
+	if (mapped)
+		iounmap(mapped);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-/**
- * qcom_mdt_load() - load the firmware which header is loaded as fw
- * @dev:	device handle to associate resources with
- * @fw:		firmware object for the mdt file
- * @fw_name:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
- * @mem_region:	allocated memory region to load firmware into
- * @mem_phys:	physical address of allocated memory region
- * @mem_size:	size of the allocated memory region
- * @reloc_base:	adjusted physical address after relocation
- *
- * Returns 0 on success, negative errno otherwise.
- */
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base)
-{
-	int ret;
-
-	ret = __qcom_mdt_pas_init(dev, fw, fw_name, pas_id, mem_phys, NULL);
-	if (ret)
-		return ret;
-
-	return qcom_mdt_load_no_init(dev, fw, fw_name, mem_region, mem_phys,
-				     mem_size, reloc_base);
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_load);
-
 /**
  * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
  * (typically contained in the .mdt file), followed by loading the actual
@@ -489,21 +475,14 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base)
 {
-	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	mem_region = qcom_pas_ctx_map(ctx);
-	if (!mem_region)
-		return -ENOMEM;
-
-	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
-				    ctx->mem_phys, ctx->mem_size, reloc_base);
-	iounmap(mem_region);
-	return ret;
+	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, NULL,
+				     ctx->mem_phys, ctx->mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 74886f772d46..f49de7b388bc 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -15,10 +15,6 @@ struct qcom_pas_context;
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
-int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-		  const char *fw_name, int pas_id, void *mem_region,
-		  phys_addr_t mem_phys, size_t mem_size,
-		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_pas_context *ctx, const struct firmware *fw,
 		      const char *firmware, phys_addr_t *reloc_base);
@@ -37,14 +33,6 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	return -ENODEV;
 }
 
-static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
-				const char *fw_name, int pas_id,
-				void *mem_region, phys_addr_t mem_phys,
-				size_t mem_size, phys_addr_t *reloc_base)
-{
-	return -ENODEV;
-}
-
 static inline int qcom_mdt_pas_load(struct qcom_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
 				    phys_addr_t *reloc_base)
-- 
2.55.0

