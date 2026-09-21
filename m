Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E22E46C823
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000480; cv=none; b=sxJacYo79yfB7VKGN79ZbADlXNCR0+vvO2A2iylIf7Q3tLGzu4Ru7Uz2RE69WPv3GEIKVnwiHh/sAxj9CWLVawb4p3+GXd9s6Smb03Cg2oz6PQCmD+D08XyIyW/Mcq+UAfwvwHEvAgZ7QvTlmXjVq1mXg2m/4Of1WYizI4/w070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000480; c=relaxed/simple;
	bh=YXdltogLgHE/UKFhQ5fzszTnWDc2QfoZ9Ww8AoRrxP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDSf4Hgc8DVnwXTm/wN0Jt/qtuUJUpANj6iOyM2tHOU4ZfOw4cBToPj7eNNayDwma/uFeQCMI91ZsDWnOeChdjLwXKAiStVNFhGZQOQPSrTS1eLYtAMWg1WzpB+pDUgn9x41bIBlyAiD2gUTcU/o2qp1dSfgDNKQlWDQiWFS36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIlIKnDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=al+rcr78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIlIKnDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="al+rcr78"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGknV100761
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xj9cgjyng5YDZxOJSlwipO
	W0qye1AT8gap/mGW9Ugw4=; b=hIlIKnDkJB7NNAaC7UXKap58+sup3g24YRiRhV
	xsMP6CFbpjFE1LxZXy4+tgIH3iA9rZE4fjeiPRgPpowUuIjq8JQseVAk+zybr07X
	YOW55c+Tmsbx7vuEPPm7l3uqVCGL1vXSb0nQg16n4kaESwYode/9SJLgWr4saHsw
	l7HpPV3mlJDEHSMWccLP9fyEoHmIqjQPqIw9BdJh8suwm+GHRn8+kyKGKoZRyTae
	e20am1CNie0TjAONLg+7Dr9uj/VJsyaf99DAIwQNy5mzQF8aQNI7QUxjACiXfqWJ
	QIvWTjWxtdrmsmE4yl5Gsw1nDe0pkctP+yyCFjnvxQrGi2kQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79b2n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:21:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86917d18a02so4971854b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790000477; x=1790605277; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xj9cgjyng5YDZxOJSlwipOW0qye1AT8gap/mGW9Ugw4=;
        b=al+rcr78WDgi/Z/zi5S/USoZjCA3Eh2tvca/+aF1UwpYjVUcq49C3elwD9l929iWOp
         f7lHaKcKUt9nOA2mpYI2BO6iDDcxUhZoMqX7riuXVTGWW2JwqHsJ+2LTffsn4dce9fHd
         sCQqHcdeLsUxrkVMX/BkWh94az0jh7YyGCImq5UhHMW4Mbx1szR3YGJYr/4QmakOZI4a
         ip/PVY5bAOJ/3+EfTz1aGKHQZ+6nb6mmxrd3Q+DVDs06adSXOE+STpYcOwc+3sr5di8k
         S5CTFjuweKFjQjd2wN17PhNnjA1RP8uPuHdmDcELEWFEmm3YvwmH+ewDzKmZpEOSfwE4
         yDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790000477; x=1790605277;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xj9cgjyng5YDZxOJSlwipOW0qye1AT8gap/mGW9Ugw4=;
        b=WP/RmETCWaTzYYCa8WHf0iz4ddH6exAXZBHDt6vEA3jtGT4fvcvGRxVbj7Imb5ClQa
         yWOx5mPg+K0V+pjs46dkgj4HlVaqH5yFMdlJhknPEJcvgHRPROXhrdbzULqKPNGa3GRx
         TGLNUsOMTvgL3NErgU0dABYtxU0EU5ZdnpauyeONjIc4rLxTnSz9/az/pa4RPI+N5OQy
         eBTuAzH6e0g9qSbBC1Txj7T5D/Ff2Yc9bTNVoH0gOXrvroF6sKLmZPC6b/dcmTzvZDIh
         xGpVTB9P1zWrseeYZht/DWf2mGaxdFmlH9ElPs5rtqP2Kwx7NuR0CNmNG5fPB50UdRTT
         Cu+w==
X-Forwarded-Encrypted: i=1; AKwUvBzGvXF5EV9duSxl8qUUhUs5lyrDxJFM2bINQzZQF3rUhFhYxDpfeq3oPy3Q3EMoQLIE9PYS0eJIQw835XE=@vger.kernel.org
X-Gm-Message-State: AFuF++lzDLcTtbBvoLN56AwPAWe2B0sM84EnziQIP3+g8PkvgP63kAnj
	RyPiYBGInXpGEVnnYpjo3Xk2/5A/iiPXBu5KV4KFcRr04OgnN2kBUwKTAx3wUy2kO+HOhTw7U6V
	LbVWLC2H0XAoO4JAzhDQlXAm5JYIsyL4UI1pVLBQmBmZgiOVlAH57uNX9Ao9FMWKFb98=
X-Gm-Gg: AYBFou08xh8OxmJS0CC+U3SB7xifuAgRBsBay3TnJ9s9o8gz+ge9nSsOY9Pcmd7DI0o
	8Mzfd/cC24FfWOjUEyWSMtlSbu6vrNHoXXLUG2NBoYCx2WUfbeSsW14OQJ568C0uuAGMqqYkoP9
	FTx3mQqrFzD2zwUP4NMgF8MvWqPvzWQV9ou+IL/ZPvDihYxmDTbE4cdQCNmvbGHFYcBVJmd/U7Z
	nHOtizoeDxwq7FvjB7IK39GjsAjAsUTjeAKjXdp3L4PtXUGliCKHsOZ1NgvG6RVszfvGQYpfCl1
	HkIlw/qIOYMSkaB29OGQEgzU6iyoLEJPFCWGsXODF1CwV3CXg1+ZZrNU19iHpmPcCDfMezYOIVa
	Mpd0avOFlxxTNDOkcm2X8mYwDPHXAPjGrJzfF
X-Received: by 2002:a05:6a00:23d3:b0:874:705d:f659 with SMTP id d2e1a72fcca58-874df1fbaacmr14780850b3a.39.1790000477422;
        Mon, 21 Sep 2026 07:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:23d3:b0:874:705d:f659 with SMTP id d2e1a72fcca58-874df1fbaacmr14780812b3a.39.1790000476815;
        Mon, 21 Sep 2026 07:21:16 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f4a10sm3369582b3a.22.2026.09.21.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:21:16 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:51:11 +0530
Subject: [PATCH] mailbox: qcom-ipcc: Use dev_name() as IRQ name instead of
 a static counter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-ipcc_static_id_race_upstream-v1-1-6e2163e20523@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFY9sWoC/yXNQQrCMBBA0auUWRtoQhtbryISkumoI1jDTCqF0
 rsbdfk2/2+gJEwKp2YDoTcrv+YKe2gA73G+keGpGlzrfDs6a1JnOCMGLbEwBp6CRKSwZC1C8Wn
 caLvj4FPv3QC1koWuvP4O58vfuqQHYflmYd8/cQ36cYMAAAA=
X-Change-ID: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790000474; l=2114;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=YXdltogLgHE/UKFhQ5fzszTnWDc2QfoZ9Ww8AoRrxP0=;
 b=XDQ7QEG/eiLkha9skhfuR9I4tbE9J+IknU0/7KFTssBM22iHkt4cvBsDD/WA9KWOKW856trKy
 zePU0IkPg2cChQIAmmqKUuSG/V6SEpLjt1KJjXtvdCwbuOOULhxyBD2
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab13d5e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NONAO5duIdG_9b8w44kA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX9LfwvZB/zUYP
 MglJNDAo8OSBl37uvSvAB1zY8CnaW19yM+OWjhmJHQWnip+KIUFnKhcy4dAJ4L4rLQyXwUbr2NK
 3ssWGytdVbLGJucPUJ8q4XtrCMOcSpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwNyBTYWx0ZWRfX9KEwdN1mR04F
 hrAuzwkNJtpXuyJC1iyOVBtWct2UtpjwrkYdU5ZY8R0vIqMnEIfpWbbG31BaYRv5//99hrN4F0X
 7CnHnuScmNF9Q1G7lVFuajW9abvCAbXBRGrHwZ6K+W5DOysP4Ka1o/uNNi3cvvYEr0yrwiCvnG/
 k/w3KcPb3KXYGGxQGJKfVnzSzPR0ekyEfcmjc04VhvjktumUtkacZ4u3Dm66I55vHbPSuAK22pM
 cqYNKFX1DgAJd4Dv5M24NpOHxWbwUgYktdW4uzgWtccyeTWNVs+PfXaHsV/g0xBzxsjwVZe7NrH
 j3fzAuKd6d5JfW3w8l6fTsLD1oFWejZ8vWD1AoX55z/jixJ2CGyOaBdgXGLI2ZZynA8gQXvd6fT
 foY/gvMBny8N3yAPU59hyoUtWei34bJsh97haveBR1CurmtItSwJPF3d6aqxOOfXuqXKhB+bt1M
 y2BvPP926HbqlJMcDbA==
X-Proofpoint-ORIG-GUID: 4qC7ilSdXKyIw17-rCRcJ778KVlGygQD
X-Proofpoint-GUID: 4qC7ilSdXKyIw17-rCRcJ778KVlGygQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210207

qcom_ipcc_probe() uses a function-static int id incremented with
plain id++ to generate unique IRQ names. Under async or deferred
probe, two instances can probe concurrently and read the same value
before either increments, producing duplicate IRQ names.

The device already has a unique name assigned by the platform bus. Use
dev_name(&pdev->dev) directly as the IRQ name. This eliminates the racy
counter, the name buffer, and the devm_kasprintf() allocation entirely,
while providing a more informative IRQ name in /proc/interrupts.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/mailbox/qcom-ipcc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 185b63f724d4..456596569bb5 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -282,8 +282,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc;
 	u32 config_value;
-	static int id;
-	char *name;
 	int ret;
 
 	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
@@ -313,10 +311,6 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (ipcc->irq < 0)
 		return ipcc->irq;
 
-	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
-	if (!name)
-		return -ENOMEM;
-
 	ipcc->irq_domain = irq_domain_create_tree(dev_fwnode(&pdev->dev), &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
@@ -327,7 +321,7 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
 			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
-			       IRQF_NO_THREAD, name, ipcc);
+			       IRQF_NO_THREAD, dev_name(&pdev->dev), ipcc);
 	if (ret < 0)
 		goto err_req_irq;
 

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260921-b4-ipcc_static_id_race_upstream-2914786b5628

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

