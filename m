Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626542;
	b=oWw2KF4tBAfi8kn/tkWceC2wexDGZiig+JOx5zTs7coeV7k570acxttXRfTqFf3mEo0m
	 HgLQvyzUO4nGWIVL2spl1DewPNz8OAsfnbBPFPrvrHUyi+Gir475zoEHgP4niOt54bS2j
	 E8NzMa4NC8g4qkBNo1tCz8eHqvtU0KRiIXTbcxC+2C74eHsYnPxCv6DvEcPAI7o4MBvH/
	 V3BRezS+BxSe7ZaqcdR6ns6zSggyoWNhXLlYVTQCcu/7BELyjc9ngVrBcuYKo5d8p6w+b
	 CIxD3dI8cIoV4rQlmqrVd8mw0bGTw8hsAqQ3y70lXDGQHmuPP5Gof2Z8fOxa0bSBAbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
	b=rm3UlW1e0FBFLHeKTJNUSaN0LXKaN/QCrqYdrwIj0hF7uM1QcOu9u95dcwqC3BqH2kl7
	 hJ/q8gK1g/D6bkC9oscvk1HCXAzx5MCgHcTyQ7wHM7BHsvfnKKnKYB0YcnHe1Mi5v0Tlx
	 6all69Z69D9URj8+KaPio1+qh7IZVufl1LcpbtTehI1d1oUqCmmDNI8NHNQwC9+CotvYa
	 QWupF5KG0MmFWMMdPGz+ImWLf5a1gm5OyqMYj48yAiYxBXYxrUwodxDACIxFvDdZ/t2pW
	 ZFbC3H3hNAaguzEIcGkWVOhqpHKBx8GK4XRLLKRndfTl7d8KmFb2Hc4U0rI9iK60ySw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oK8oKKu0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uymdf/T1";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD55606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD55606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oK8oKKu0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uymdf/T1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAZc4364852
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9i
	xnt0d+aE=; b=oK8oKKu0rFXM2ZFabfeVVZtnlJ7fJTk55hbhrnPPEbaF9O2J7iP
	PGrdBd7YKK+lsjlhRzfEe2gi6b1y7vzEVsK1MKyUZAi2js/ASSANFbwAz95efkdA
	yPeJx/2YU189XU+mYFDfSNcJfIB9FSDOf2r4O7kTvt71rFC+jOaV/6RArBILG33y
	8Y8LrE3Hjz6hZL8zkuIGDfJZRzygyfTYD7z8uEmTU6GMkBLjZRUa6hFdhtEO8wAX
	b5fIPkdiw5O7nP/vT8d7+cvRwTGcQZ1JZ7TqVK9bivON8bpcFXEibs9Ca7NKnprE
	0YUfFxM8HluIEGR2QuAh3iQHPG8l9X/eyIA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rgnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:35:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo570626241.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626540; x=1794231340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
        b=Uymdf/T1D1Fuw1di9UJVR5b6DMc/khWnw4pWNa3c0ugQuRL4bFCgXyaqho0ojreXBP
         azulPLtUCO/TgXuqfWAIFwIsQOGsioRFC71pn9+fIejyOxYS3K30S11yVw/muDqmhNq3
         Xqcbou1/svdXgiAzcNBLXO7+8SX2gwP6frP13pCQg3Sc5Luz/PfkogZRfYSRoVe9/C0E
         OMHMyoGGonO2NtQqykmL6WCAV3qSH+Knc4ype929bM1EHtFzhxtA7heLGbAHcW5aPSVh
         154FkSnD+xXESdc7L1igdFlHCDZZ8g8Y60OCFWp9lGcyltULDbeEokZXxDMIiFGKBu58
         Pc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626540; x=1794231340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIMmsiSDNZ0JUi1xX3+JR0WwpjhKXlWnp9ixnt0d+aE=;
        b=lr7DRFidavvRjZwQQNGqNabCKaij0YvmTA+NdVDSZKTBy3oTq+rieYdHwXzjSy2jVy
         YMUNSilaR4nNrhtNAjOkjRA0B5UvF7vkLVF6mXAHrbm7F+X3MKpB8gR3ml9Fqf+eZMZq
         qGTqn+srveKgTpk73loSl5ONfsyypfhEVptTpAkT14KcW6jQNq9aTfq1vDl/5zxjLqcs
         UKEtHscYE/EJcNsa9VaXtC8P7OmF++AhzFFfi33v0hYnfw2BfKxJR50Itx+lUN+4MB6B
         3RihhuAK4FsCXwlGcogmU8iRT2OJMjrdhZIekujhmrrbiLmPxInG4tE7X8BVNgVlpMpq
         zKag==
X-Forwarded-Encrypted: i=1; AKwUvBzRdx100GCzclbmxyFn4xODmQyRtRmipq9ikdLaOy9HpHBgt5Yy+i3sBsAguKTp4YLavaOC8XnFHpSqZCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T0B7umLFJ3wAbaHnqn/FV9fZjxv+v6f/fjnuuiMRFQT+mz/D5
	otvXGK2gQjpRyvNQFd5o7ozEYHXO5HRfEpIwkNIf3TDcOM5jSkhSNlxqS1sDHCnWwpjaZQ6bex9
	WLzvThRY70R4/11/goZA63R8zL1V/RbLHkO51WiUXUTndU2KiTpNDBXLDqGQrfJXIsBQ=
X-Gm-Gg: AYBFou1UIvWMAPgXaY/4F6JxX8cscBO+2TJi7kiUyEnr9gluJbzXpwrs5mnnHx/IP9M
	0wF4qCf6lEB+9aBTOzbNUAuzbI5tZBTRxoKPUCJtqpJ7qgUFu5aGO8Ytg9agxlX+sD3TZFOJu9s
	QajXP58PdcZiArmJK/h9bL/GxF4SYWUWxaPlnkVpE6/MuL/s1VQs47fsY0Nqea1I4O1j7XDVmew
	EoF/sDKL0CTesCNysA3e1jF3wUlRaezjqW03WlIUAbS404ZBL+feqIIGieSNSZM0jkIWcLnfZLa
	ocncqnCMQmHF0hYi4orrgX3Tfrok0TBdQBJzrFHqPM2EKrCiOxcL60WY+CAqp7cioK8/2CdO/Lf
	2SgFbWeiJbAjBZYwbI5PzP7m7YwkqfwLo5UQpItRLNBd/q8bEQ2koNai40diIAA==
X-Received: by 2002:a05:6102:3ca6:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7d072770fcfmr2970880137.29.1793626539698;
        Mon, 02 Nov 2026 05:35:39 -0800 (PST)
X-Received: by 2002:a05:6102:3ca6:b0:7a7:19aa:f0d0 with SMTP id ada2fe7eead31-7d072770fcfmr2970871137.29.1793626539185;
        Mon, 02 Nov 2026 05:35:39 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm25735864f8f.53.2026.11.02.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on removal
Date: Mon,  2 Nov 2026 14:35:32 +0100
Message-ID: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5139; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JF+5cokNPr5yQXFxct6hhCQ9bMPf+O512f96kwbqAjo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6JGjhvMrZJT+ifBSgQEojLNXwpKUM7rKhDeHh
 hFF00NaHZqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiRowAKCRDBN2bmhouD
 1/mTD/9neLvJVok4DhpGhxjjVyEZ0WSqKavteJD7MtXK/XgdlbsKBR2U0Rvm4Jg7L09nNYFGV+V
 gMZD5w6EOLmk31+49/3ZmEGrlEQAwT+GR1gOeKc/zNEWbqPyi6hZ9TI4g/PliUCXLSUgvY839ZD
 Z4Uy3BCdJLrQ4sFCTC+0xpBjtABo6h5cQwupLJgFSM9/0fTPku69FCVrH5g11gMi7OrTUhUm3fy
 MESp8Umze7UjSrmCH1UcVxDgTXfQk3CPNCrjX/eL3vxUX/ywtG+n6bcJ8FglbYNkLXbgdHouuTS
 Zmin0Qvcly/oTEMfNnJD214H6EbTneF96ttPZq1QwSQ+6JDZhCas9S0uX2cpoSCNe1uMLfNKkYO
 aSpyNXOgqNSr/mzsApCVXtk1p93q9YXx1Z6pStN1VFVrTkMF2JYzo0EDXtCekFOIDxhaLmPzeCv
 gdC+9I5OA4kcwUBcefo5pX5AOfDPwFKWPoZNori+TYDfZtBRvHPqUcgiEQP4wkun9V+4Nt4n619
 blpQXcIKK3r9psGAbBWcS40yrDNiA/Y4zJntW2A1PA02O5jjoA7SiAM4u+tCi+L+h++k7mhHpi3
 iSX5xy5b/qrp8MpyflcpCZtu8aV1KvAsD2fs/VO/Hel4mmurmWqYDQxdk524uFXULogYUUW+Mxk TFvyYeMr0X5Zfgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX20/7DNrL7Jx+
 Y9JdFo2lWNEugVdju+pQcYB5n2PNDB6ZbbxJL/3Yt25IXOSaDw3VP66G+MYwbuQ7FikvCH2EMVt
 Cm6+dozOn2d31PfbOXGPA7wrKcoTh919T8wicNBRKvLO9FYv1KyNHWH+fU3hCmJWb/50eUtv2QJ
 1wfbclJG2naYm1RD6ovb4VwFIsbN/zAJCNWavyTyVoL4pKZWjv2ZhGwbLFX9m985O0TjCqeD+qH
 mmHijKS1aC/H0lXDRfV9ol4c5aidEqkreQAnl4q2QVPKdqJPfUA/fjYqUHRjll66S1KzdSGMgdx
 skEeljFOUM9oVbt1xO8f3GhY1VyuHoAy/VUTxGD9SMtzQtm1xqjsfg6obLLo0IdCZBOR7KhP3Og
 i19XzitH0SYtkfbTIUgBQYuSIl/feZ0yeZvqbDmw3flOnso1xGI1sIJ8ASR5RR90nPUG3GE1/fE
 P/lBsxcitANjl8lSspQ==
X-Proofpoint-GUID: QUbgCQbH6z8FW9eausoqEYZsOB_DA1L-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXz7xWGh/b1C2Y
 LQmHhA+ziJJC64nMF1H325Cl0mN7VwdUVVkc226+O7/zZDoeaOC+SOEVyIO+aFLeRfSx+XF8EiQ
 kkXppWj0hgbMGuPTD8QDoQQqB5nNgJs=
X-Proofpoint-ORIG-GUID: QUbgCQbH6z8FW9eausoqEYZsOB_DA1L-
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae891ac cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BUgfXIRX-Kcuu7gNGJ8A:9
 a=TOPH6uDL9cOC6tEoww4z:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
is freed only after qcom_smp2p_remove() returns or, in the probe error
path, after probe returns.   Both paths, however, explicitly remove the
inbound irq domains, unregister outbound SMEM states and free the
mailbox channel before that.

If the interrupt is triggered in this window, the interrupt handler
would use previously freed data.  Mixing manual probe() cleanup
and resource-managed devm leads to such races, thus just convert
as much as possible to devm to fix the issue and make code simpler.

Note that for_each_available_child_of_node_scoped() loop, before
registering qcom_smp2p_unwind_interfaces_action() cleanup action, still
uses manual unwind, because it allocates the "entry" memory which is
used by the action itself.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-02cea59a-8c4a-460c-aeed-69002ab3e72d
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Register devm_add_action_or_reset() action for unwinding interfaces
   later, to fix use-after-free
---
 drivers/soc/qcom/smp2p.c | 79 ++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 01b8580c9f27..9b6e0627ed0f 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -619,6 +619,31 @@ static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 	return 0;
 }
 
+static void qcom_smp2p_release_mbox(void *data)
+{
+	struct qcom_smp2p *smp2p = data;
+
+	mbox_free_channel(smp2p->mbox_chan);
+}
+
+static void qcom_smp2p_unwind_interfaces(struct qcom_smp2p *smp2p)
+{
+	struct smp2p_entry *entry;
+
+	list_for_each_entry(entry, &smp2p->inbound, node)
+		irq_domain_remove(entry->domain);
+
+	list_for_each_entry(entry, &smp2p->outbound, node)
+		qcom_smem_state_unregister(entry->state);
+
+	smp2p->out->valid_entries = 0;
+}
+
+static void qcom_smp2p_unwind_interfaces_action(void *data)
+{
+	qcom_smp2p_unwind_interfaces(data);
+}
+
 static int qcom_smp2p_probe(struct platform_device *pdev)
 {
 	struct smp2p_entry *entry;
@@ -671,9 +696,13 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, qcom_smp2p_release_mbox, smp2p);
+	if (ret)
+		return ret;
+
 	ret = qcom_smp2p_alloc_outbound_item(smp2p);
 	if (ret < 0)
-		goto release_mbox;
+		return ret;
 
 	for_each_available_child_of_node_scoped(pdev->dev.of_node, node) {
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
@@ -704,6 +733,12 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       qcom_smp2p_unwind_interfaces_action,
+				       smp2p);
+	if (ret)
+		return ret;
+
 	/* Check inbound entries in the case of early boot processor */
 	qcom_smp2p_start_in(smp2p);
 
@@ -715,7 +750,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 					IRQF_ONESHOT,
 					NULL, (void *)smp2p);
 	if (ret)
-		goto unwind_interfaces;
+		return ret;
 
 	/*
 	 * Treat smp2p interrupt as wakeup source, but keep it disabled
@@ -728,27 +763,10 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	 */
 	device_set_wakeup_capable(&pdev->dev, true);
 
-	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
-	if (ret)
-		goto set_wake_irq_fail;
-
-	return 0;
-
-set_wake_irq_fail:
-	dev_pm_clear_wake_irq(&pdev->dev);
+	return devm_pm_set_wake_irq(&pdev->dev, irq);
 
 unwind_interfaces:
-	list_for_each_entry(entry, &smp2p->inbound, node)
-		irq_domain_remove(entry->domain);
-
-	list_for_each_entry(entry, &smp2p->outbound, node)
-		qcom_smem_state_unregister(entry->state);
-
-	smp2p->out->valid_entries = 0;
-
-release_mbox:
-	mbox_free_channel(smp2p->mbox_chan);
-
+	qcom_smp2p_unwind_interfaces(smp2p);
 	return ret;
 
 report_read_failure:
@@ -756,24 +774,6 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	return -EINVAL;
 }
 
-static void qcom_smp2p_remove(struct platform_device *pdev)
-{
-	struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
-	struct smp2p_entry *entry;
-
-	dev_pm_clear_wake_irq(&pdev->dev);
-
-	list_for_each_entry(entry, &smp2p->inbound, node)
-		irq_domain_remove(entry->domain);
-
-	list_for_each_entry(entry, &smp2p->outbound, node)
-		qcom_smem_state_unregister(entry->state);
-
-	mbox_free_channel(smp2p->mbox_chan);
-
-	smp2p->out->valid_entries = 0;
-}
-
 static const struct of_device_id qcom_smp2p_of_match[] = {
 	{ .compatible = "qcom,smp2p" },
 	{}
@@ -782,7 +782,6 @@ MODULE_DEVICE_TABLE(of, qcom_smp2p_of_match);
 
 static struct platform_driver qcom_smp2p_driver = {
 	.probe = qcom_smp2p_probe,
-	.remove = qcom_smp2p_remove,
 	.driver  = {
 		.name  = "qcom_smp2p",
 		.of_match_table = qcom_smp2p_of_match,
-- 
2.53.0

