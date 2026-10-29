Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247588;
	b=m52dTCP2/kgGJQ/mQ6Jioa9NpbaxFE16X9yA5k/GMW5Xgc/zYEr3cLliYQsA3R/pe1CQ
	 O7KGN3Kx/VWnUzarSAxbh9Xi/WSDunZ3WTlFtgRTaI2yllLhIIWKPQflxGD7l71hLUbjS
	 SldZ4wb7heVdjrXk/n4fh/8ceMqjye0Mzgrh7uNeJucmkFf2OA4FXloXE+QIvLTaeQTqj
	 CRNHTrHqhqV/jbNguQXK23xev3hGozxEV/p6td0YT4t4ZOxziwzpdGOMcoRskiWhTKYhH
	 EA/yHlZ9YoieETrF4Ge+i3BuKg7oBPv5xH9U8hvAQ/BxiZmT6k8+9M7ezS3PumZskpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
	b=0DRm1vCKyioZmAeSmcXxj5QUwlf/9mbi4cpDaulVX5nXeQ2rSgV3zcmEu+NlqPpStRam
	 nIFZtlwgvOiKYV+caQy/xjIt9+h0pJ4/z/8TKzHKw6BpJkQnP5RjBPi+qev3Gs5D4j/sE
	 +pXfDByGoJOSQnCinyTezTH+bknHG1DzBsEnsi8adVQaCg+6ZY+8O/dGXD0qL6bb2lcRy
	 DVr+v41UrNoTC7+NQ4mdjA1s403uRjuQVS+CwmyednXUzWjUC96VH2/7Kf4b1T4kWK0uJ
	 3n4+efAjDjtfOcXy4RXR3fMSkUKZ1BpSG3fSbUCGY/cOGxNpXp3ucvjgt05f8NcIOFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j3HLayWF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTOXfXHW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B699606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B699606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j3HLayWF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTOXfXHW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jdCf1340386
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=; b=j3HLayWFhlPDjyAj
	j9hwoWTnp0m48SVsdVRhPsqD+ifwAsEo7+UpuiuD4gkOVYZqBYoIShf66N6ATYnB
	CDhqptJGWFq+SxEm1J/MT/4ofbuUDXlpUlLG1mWFNfz0iRq8lj5PQeGjkeBW1DLL
	GV9XNuCeylU6MCOqtQdJvAdC0ZA7K2z6xwAP7tw3RQ3z/wEVB8Br4xGpvSTuM6jt
	ExZOAwGhG+mHTNugz449fwKr7rK6eU3BtLEn0e5JyEzr0slTsYprgl8svC6Ue5rN
	lHuZT3TydThfXI5T9mzBAW92JxBSfPfCw9cVgtroH4HcLXlbzoIYXQH/bA2Z4cMV
	1uLVaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnk90g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so3413268eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793247587; x=1793852387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=cTOXfXHWzTZsbxpvsKTfL1m8HCdQwbZBadnRLQSnw3zedns/N3Lh4aekzMoQ9RJD6n
         9kZXA+5nDsBIJMrJkkl4iKyN2FkQUzB5Fgt4OkmLRmfxNnoH6DXs4do+DeZRtY4zAlrQ
         3RZVWFe8hVqIahL7mkGX8V6ZBDRoQK7cK0vztFX0PWz5dzkX5YowlA7yiUfoGTN07LQK
         vbSXbuLvLJPzaPIhyqfoZI+C+mrAYhjj5qnEKYYWPiO285T/bkggF/XerITGmU08NPg2
         8HmuzVp+T9Wvqi2C3Jpa0eS/2nxIzningD1Wv/rnh+3YY3I+3MKtUIjQk8W4V72y23Si
         x1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247587; x=1793852387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz+6Kcub7kDVCrdSqvP71/UKnkp6RLiDhWqxwmv1ciI=;
        b=tfTooaxezdgZmbK5eWlMY/QGdDHUomaK8lYB72KtSeICRygFJfKuCRwf0KcojG8Eij
         0+8K4FYeXGRkXgIi06iy4A9zgvydC8ZmuAnEmKSCnfy3jEVKREjXCbVgWAvgarjVog47
         vVdcw7NNUkyj8wJb05kFsqKaqaKByZSJyjwsHStV1FyBYWiENIdPgG8bF0eq7W2J5SAL
         zvUuuLBDB8B2EbDQWd3waa/cajRzcbnVw3WK93EgFUX0TEJ5yg/P1LYY8WDXRBqelFXs
         aqQ+AQDLKXJgo8WgkqifrX/xMkcusVDrfyuvU44sDtWuggdLW4OQYhVp95Mh0d0oasgh
         ZdfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ChadMw+1vFy5mMRu2rS6UlWaCdPX23DX/igjYcLuJr9yWqRDssm5YFnb+btKbKAyJq7XRGR6ShPGBYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0VnyuSOpmnEmU3DtvwaxCczF/x1CXra3ReohDKR8pOgegr7bh
	8XQMO1nI/qXUrkg0RqYKELvaI8+bURwedYhzIP56YZ0bnS2iayRUj7Omt/dLGep2qlGnpoQdQEc
	QwhWK6OO7jJY4HjAuNg6q9dpIuXFzxvuFLG4RTQYFbErpGa20CUNxgYlbM0+O8iNj94w=
X-Gm-Gg: AYBFou0RiV11G42RhgJtQtVVUJoPpFkAuO0Ip8NhbPXyaS0DQ6ITD7LcSiEwhLAekqd
	HxtFORdA100wgL211qFmhVuAHkp+VD366p/792fNX967xpwlFNbbc/UWMwJcNxMUBGVo+wOvRNN
	QuMMAiZqruwYcJ5DD/1AaLldaHMk/0NKkaiWdBiKWspdpt3jBjshAiDu0I5ImBjHks7MHVLqdJT
	lxlgN1zCNPSAVvhqsHVALudfhPoYWvKjLmAuYv+37F82Wz/e2xIggAQ3Oh9bSIAiTadBNxSJuJg
	neA1hllJr7SrCpIh42cTBtJdkxVIEsZy4SJOU0/d76OATV3NXEbcGTKZlnvXWCiPmuV2RmamJUv
	ScRhdbCj+GXH1vwUs/CYT0OQvSicet070D/XWZ/YimujmWs3gMidv/6E7SBEBK29/D0b4BGcWDV
	gbx6Z8FvQ=
X-Received: by 2002:a05:693c:6016:b0:36a:1add:64aa with SMTP id 5a478bee46e88-36a2036d285mr5438532eec.9.1793247586779;
        Wed, 28 Oct 2026 21:19:46 -0700 (PDT)
X-Received: by 2002:a05:693c:6016:b0:36a:1add:64aa with SMTP id 5a478bee46e88-36a2036d285mr5438496eec.9.1793247586125;
        Wed, 28 Oct 2026 21:19:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27504539eec.2.2026.10.28.21.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:19:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:49:27 +0530
Subject: [PATCH v7 1/3] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
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
Message-Id: <20261029-shutdown-v7-1-3fd7a76a6991@oss.qualcomm.com>
References: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
In-Reply-To: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793247578; l=2329;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Z62C1KjgkUfHo1yhmxjksV4K46Bz6P+GsVAjd37UQdg=;
 b=Iw7LeukSpt3ZcOOgYAGwfrqVem8LSplH+ckiEld+aTBOcm5/X8ru5QHX0hg+feBVnO8nouRWy
 M5L7nVlaI7TA5T3pLpwySqagPe9UYZQ6vEtQbeIgfqLM79bq9UlXSrN
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 9EyEGgdXWa7i6bL9vu5za2eKG1cU5MuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNSBTYWx0ZWRfXzvv0LLGle4uy
 A1oMkGmOTtQYLgJtvwJJJpsYcBTRvU0jGbfDINlZjnmfk9ElRxX0+GPptJYd7ETex/ZM/MIqPCd
 CCnMst5VplgSrOCcB6K5E1nuU4nK++P4gTWalcmBVijGmzhxgPwrH39bksr8WCuE1VFkdEw+NuT
 52KHi2g2KeRGO181iSrbRNoQrvgUZESCNhibMYEt/6KcjgG0ng7tPIbUG3e8WYvaJIiuWG78WlG
 uSwLugycyIvyelTc95QUkrOWAHl7XsiL+fE37nGJrtc8M9iofccFtOO8bA0UDIsYsso0156SZSj
 FKIk0XoxPHWlQQKy5DlwKqN4XtZP6Rb09ec4O0YPNxIq0pE04h7WETUVqTRfmvgtLtpabX+juIm
 CjTVATZynDWXXv28b1L/WKT3/+Jzemde07zctbHecX3DYWYhC6OFOyVln7DLmOXtBmgdceA1GYo
 FqG2jmtLQ79FA4Njyzg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2c963 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 9EyEGgdXWa7i6bL9vu5za2eKG1cU5MuQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNSBTYWx0ZWRfX4A6zdCvZ2sK1
 cOZyvlO7Nu8vsOZezfis4oPz+z6F3/+OwPzEK7gA/H0QDqAknZckly5x91/Q0IUuN7GdtQ4unLJ
 pfRt9REZmNCBZSPlyqcnjNkpe8S41EQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290015

__pci_host_common_d3cold_possible() returns -EOPNOTSUPP for the first
downstream device it finds outside PCI_D3hot, and pci_walk_bus() aborts
the walk as soon as its callback returns nonzero. Any device enumerated
after the disqualifying one -- including a wakeup-enabled, PME-from-D3cold
capable endpoint -- is then never visited, so pme_capable can come back
false even though such a device exists on the bus.

Since pci_host_common_d3cold_possible() already returns false whenever
any device disqualifies D3cold, aborting the walk buys nothing for the
plain suspend path: the overall bool result is unaffected. But it
silently drops pme_capable detection for any device ordered after the
disqualifying one.

This matters for the upcoming shutdown path in particular: unlike plain
suspend, shutdown forces the link into L2/D3cold regardless of whether
pci_host_common_d3cold_possible() itself allows it (see the following
"force_d3cold" changes), so at shutdown time it's common for an
endpoint to still be in D0 and disqualify D3cold while a later,
PME-capable device is never visited. dw_pcie_suspend_noirq() still
uses "pme_capable" to set pci->pp.skip_pwrctrl_off, so an inaccurate
result here can cause Vaux/wakeup support to be dropped for a device
that actually supports PME from D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..c2c852c64aa8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -275,21 +275,16 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 		return 0;
 
 	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 
 	if (device_may_wakeup(&pdev->dev)) {
-		if (!pci_pme_capable(pdev, PCI_D3cold))
-			goto exit;
-		else
+		if (pci_pme_capable(pdev, PCI_D3cold))
 			*flags |= PCI_HOST_PME_D3COLD_CAPABLE;
+		else
+			*flags &= ~PCI_HOST_D3COLD_ALLOWED;
 	}
 
 	return 0;
-
-exit:
-	*flags &= ~PCI_HOST_D3COLD_ALLOWED;
-
-	return -EOPNOTSUPP;
 }
 
 /**

-- 
2.34.1

