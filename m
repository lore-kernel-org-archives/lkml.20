Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C152BE54
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867494; cv=none; b=Gn+x9e9ZUzx0tGX+YLiQAzu3N8bzRGpjtSprX9xZvHsucfEeOPHSJQJ6CzCaa21fctfuasdOdxpT+f21flfcJSfYUYptmdVC3oxp5cEAPR6bJM7V8YFop5sjPUDMCJCWRQmPgvC+1ZPiVGepfZwc66YZ3cMBWgzho5OZ/YZXgtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867494; c=relaxed/simple;
	bh=vSBe8LceVVKpPMYgu4L3tld4R2oYmbP4ywIrrausTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqVUEmuAhSpuMWy0gumsGftcpzzT+DezcXIeOCvnElGd/TGbob08IvE418FL+V3apzKAY4KsaBX0Fz/xRro5Y1vLpHTrpKkVIfKL6Yr/nI0jUA8byCukTmypPfcKusPxtG31A64qs0tszT9BztMRji84aheaJIZlM8VWbXNi+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAYDpwxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDfIKtyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAYDpwxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDfIKtyy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Diqow3070966
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=; b=aAYDpwxbm12RBMyN
	PGp6usachhNQava4MNLnJcr3KYoEo9HcN703zCxZ0EM7goiT8wv9uGxVG9wz/jVS
	aIm/E3nlYMsFzjRo7jbO9E/NKRJCFN7qDOFqnvWy8IJOFJelYPutuodza7U9NgP1
	bM9x/plsNOGpTx+Kmfugsv3rkMqh6lt1eyEIDy8KXWop8sveNXj6F4K+9LZTcLjB
	vmWXvG4l01K3hhDqO6ylwlSpDSSRWCXUG+AdMwERClAvlkVIRoPv1LUtK5fDtWds
	o2swiNxdHC3iS9ufsmck5qgjL283YEgbviLYcEdktBqY6yXOmt+EXHoNRNECLT5T
	Jx0pQA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nthmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so7190535c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867491; x=1791472291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=UDfIKtyyB0BeT1eCW1y0GRdhaQaTU6cIQ6tE9KxvuSUE/pzvMSXd7hjaMgIr84eE+D
         zM7dNGvdgNEVoAbvD4KM4iw/0ErnthNdmkYC0JbfrpBb09hZgip2cqvwuDBJKJIxnTcQ
         FdijJi0hYMQGwP//9u+YVEhN0fWtqk1F11qlkGKlYpk3cmCR3cV+6s6ejvok2IKAKwjh
         3tmANOgxtesIQhAZ4YRK7p+0JRzagirovNVYyLcLujw+v634fA7R9+MC6WUL+enB0lDC
         cqACuYF6swdI0hXNgv/sAGBRaRGZl/3MW449KOwyX1qvHGbdqQeltpMXbZAm18kTCSaF
         aB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867491; x=1791472291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=MRnHIiKtI26DsglDrsAtqXW7USbQm55MOcbnkqVqDgN2lFkiFG1AfIFLJQXPgRMrNB
         Ht+mK1EocXPwv3VfrJQp05OIyW4vexe+Ju2lP5lg8bfY7Udh/2rkJQsizJIATPIlvzbR
         jPago4g54NgHuDppQxE7/IYdXuGb3xJi65RqxEVkpLh1v/wJ5vUNGQ1/hkppC6Li07A6
         8pV6DdTpghHDcOVzAEMgyrcwBPDzxuMGKb/QDptHPPHf99JSxHCmxBPXdvEuqjaf1AU0
         SmPE0jYih0w8c96qk0Nb3fCyAlaed+T8qk04Zz9+gS422fLEOGYmjebXyzaIWMB/UWLd
         H6bA==
X-Forwarded-Encrypted: i=1; AKwUvBzsRkJR5O2uScqIMAGzLR1IrwmTf3j8N+E89PFklht47DYxtq1VpufEjrWZIwUUn7zN9PS7r+a/GPyuoVg=@vger.kernel.org
X-Gm-Message-State: AFuF++kDmq+H1THQWsyU1hdnthwQH3BIPgXgSrVKw/GcY9G/zyC6heXG
	C4h2r29Z1jj3VS+a9wzQjZhbAm+cOGUBhuuW7NRQUlg7f1ibR58VFqDFhwIofRabdR6GiKRqMfO
	MAmwXKEYxK6DVpN11oda+uSj16Z5PlnGaPR7eD2y9axzFHaWybHVH3wluPcy4lH/g48I=
X-Gm-Gg: AYBFou0P4/02m/mue9GNnufP3EJA8OXIb1qUd3Bmj9lspkfMx8BKx9JgwKUqIfb1+uI
	enMUEY124vcKxePWbjVnwEJfH6lfavLqg42YzuLoLvI9XbHtz+HvaLfp48ndXr12w8C02tNBgir
	jlXMKbus32r6c6Y/ZGDK7EPGbZW5W76jtpNKuxuwYNJ5sYINb4j9AbBX9hSaswfWDlmxpy/DsV7
	z//u9PeXreNWDiVA3qAlpeHbf+1quu6pFN478hXSazrbgH/nWa8cUDZsuUzHsDoO5i/mecDXeU+
	mmhaKGkc33JKvWSTkXQH554CPyQOWjmNZqyUrLQtY+m+d272X0RYlkNZDEKPaIKD0Gy2mWADC3v
	BIMR1JGAZBIj3poU+33k8F3ZLqIz8EUBU5uiXTObiWSUBh3RQ0ao/hIzQE7zZQYoVPWs9CRGc70
	45MmFgQprSGSktzDense88kkWacp5EbbLybw==
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917854c88.5.1790867491028;
        Thu, 01 Oct 2026 08:11:31 -0700 (PDT)
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917808c88.5.1790867490348;
        Thu, 01 Oct 2026 08:11:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:11 +0530
Subject: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe7824 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX73PcmH99JVXE
 clf25zIN/UjKzMujZZgIuRZbV4TfKbRZxFeymlo7ZFpy2s2ksLO+Th+wsQhrlNCAZAjOgDZhtNo
 tR9ZRuuJi8iADqTBOuGENFEBQOI1iFQ=
X-Proofpoint-ORIG-GUID: 9Cbtu4Hc2ziY-ApdVEfR6f4pZYbCzVrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX26p6IgEJlPlZ
 2gjy9YlZpYcuaaPkrBKQetpMIkoTbr4B7EUlyFmhOoX3WVVidFSitI/qj+B0jBCwjUKOMWgc/gp
 V9a2fXQ7ZRzIb9HsMzPimbznjbg2fmhp686PiTR/xqR9hUR+bdG8SRwaeg9PYtNmC+YDPyJyqRR
 iwQ6Dr375xwx6nsecAbKEFXpacZOE1UwxSeqNncpzc8Slz7cSxzCLxhJLbzlQ+///EC/DBWrHzj
 qg2bfgAPDm36fUGWW9/aWZ/UelvimdT72LKFbzcL/slZaOKjUzCvwLE/IzMVaJe5QMclAw812RA
 FZefrz0kRIZ4R6dXZa/iyo4fFW/Oy/jxJuQxbSL9qG8EjDFsuXiOTjdXjuyNNQ74tW6Hd/BeTi5
 209fsdGsfGIKYd+xVTuvPyigFDcm7CuCn2jPyr+Yp6zwb33FjJjmHw8UwkuGyp9L8oMNjfqqW3C
 2lGW6Wucyxz+uLPoPAg==
X-Proofpoint-GUID: 9Cbtu4Hc2ziY-ApdVEfR6f4pZYbCzVrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..d65696885e6a 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,8 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq9574-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem

-- 
2.34.1

