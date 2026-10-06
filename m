Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF173E410E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284371; cv=none; b=es+tG37TSXh2+vtZEKAyxV6v8uUR3uERmR0baKDhDNI6l1rJ0BYxhUEPZA7qRrjCKpVCs+p+M0loiJHZjmd1lg0gmWe0fAyiUzDtg48VdNB+wpDnR8RtAeyDqk73wC9S36u36WWQMLq4c95NNQ1dwMrZT+Ss37ZcvI+7cdFErL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284371; c=relaxed/simple;
	bh=14z+MaLeD2Gr/LBk6/z+nl8275HrtncLLXQR8FwCBxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUcfFdFDGqsHpiBf5dQaFkRnArpC/kQP9c0yyLZ3tOekMaxI0ZHN+nxUaf6pxuM2QVDtnnBXlQl1Rx3fkJ6bcfxtmVB/x5CEHLIzfoCQr7syCBQIhaJkDXqi0E7klCYO19ixpRy8A7fipFGz+h6u+LPJyACUK87hIvsuhTkLNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P09WfHQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EI197YgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P09WfHQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EI197YgD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARP5H409640
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 10:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzdyEOnj9yAlG8v9zTRJIrbJPlvMjka4vign3Ys9/Nw=; b=P09WfHQZoH7YQR/b
	OC5NTXI2gx7Vlly2gMnrbQcbFi8Jkn5Ju2wSOjo4TAwF3MtICxEbH005dg55m1Mi
	8POn1jj8NlLZMoqxvQxdCWP32kVT+no9APspoGzvfTIHvAZBNeIXU/me13uEJB0q
	Bpvtg1WeJAsda0iomojRmn6IdcXSeW/YbVqNo1YKLteZGj0EEq2aGY6mHM9Crqxz
	VJl28dtQdkpnxYq/MEHW5Cl9uTprsZE6hsrE+doMOIumM1ZQMtSEpRki/Wv9FKvY
	jUt2cJNiJXZ3x1VsZMA8etrVcQt4NonRUOEhFpdaJ7esSvA5e9q5qnuDmXfCfmhe
	lF/1MQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0b7vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 10:59:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3533430a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791284368; x=1791889168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzdyEOnj9yAlG8v9zTRJIrbJPlvMjka4vign3Ys9/Nw=;
        b=EI197YgDgzOuPOjjw/C+mDTmSLPFA7kA5KvvMM85fJOgG/stWMPWlcZHUNTZBAtNkC
         l2O5tpSxj36wKoWXd5M/TACFZ4UGXL2FeLoRYAD5Hl0E5vzzSBzFThPkc/j1uydZxHSu
         AftjdWXIlDkf9bZrPA5GgJffTjzBq+A7ZNTm90rMJxuH/G5H0FrRxllDEnDBoyBhrecz
         JwhQSq6v30GR9vGc3eOOOz0TOoef3P4oSDmFyDGEKlNkkMIfzyvAAEBjglxxkBHmCXfj
         K1j5sXPZm63uPd7Zvff0StAU+RaFtxK1Fnalxl8qjxBeh11JBG4/zvf/KKhEE66vKlKo
         BnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284368; x=1791889168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzdyEOnj9yAlG8v9zTRJIrbJPlvMjka4vign3Ys9/Nw=;
        b=jf4IdY/tm9SdmncrQM6vyaRgEh71ZOma/RewFb+hHRBCYa6X1o5gjNzcB+wX6SwwP3
         8WvQudJulVUlf2eDI/2PhWbXl7QldH9CFr/yt6R+OpfvgVP3PNXjP+yzgdMuuLSAsiN3
         Q7u53ZLafhNseetWGAw7rr+YN2tHD1KKUTtJ+90xc9935teJRr/Ge+zwP0ZORnJIvx8c
         /69u+V4CEJrU/+PiL/HsrRi2UGo+RqXWWoKZy4eRE//bDebY8O7CJszYz7gqaewgFD14
         lGZjjuC3Vqp2aoiRgkazr01/dubiFALJkPEbSBt9sR2WscRTWrmErhdan0g2nT2PchTi
         uCzA==
X-Forwarded-Encrypted: i=1; AKwUvBzoSHh26fcD+AMDYlmJwPFPI+/BQDBsmnXQpkxcFdPxtkYuK+IvvPmdZs3bAHy1NzO48Ad3QNlBOHvWWRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVKSKaGEF0ToT6AuG4ubTFG299bsyEoHD3b2e2y8YkJnSeLPGj
	uPMGr38cu4XPRfp0Xhcmg4112wX9VvYoj4tEpS1Dke2mFTczdjFEZE1RITmHIr9qVUcpu//a4gl
	SCKva2RlAlbXUpbo4C/nHLqtGViNJuxOaJNQJW0fP8XSflRVhE4AcGc8tCftoMrRJ5cQ=
X-Gm-Gg: AYBFou3Q06nSubHKxTf1bx8xMn8pg/FaeqRccU3r5T3SVtmz7dHK4y2XA2wdX/eZfRH
	MeIeV/AZ34fFaCCWBpxe/6LqAC1EfL/dSGCdjus70j2lOAoeBzVySKBVVP/OAHOrGFuA4BrMiG8
	2nbsU6hpSh96QTRClnWfGd8BAXcvPh4/05NOwPRybL0AUhB8HC6W+tZvqtHk6ccRb2kZnB5tSA/
	0XHGJWe6TFIiLpav/QEUe7oESJ0N83vwMa9MCzVXNCO08rg+PkmEaXu4CBOQ6pfCU86aB4+a9ft
	jPUaYZuB2//PBH0pvYZIuKHi5zcigHkxnWsek7LZcx5FBiJy7390yPd4MWcFI7+VMqw7zy9ypWc
	PKOzZiiM1XCp0G/ERpLrx/GzGVKNmubeb+eRbVw==
X-Received: by 2002:a17:90a:e7d0:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a8734ef377mr705907a91.19.1791284367978;
        Tue, 06 Oct 2026 03:59:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d0:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a8734ef377mr705893a91.19.1791284367507;
        Tue, 06 Oct 2026 03:59:27 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6e592a83sm2182343a12.31.2026.10.06.03.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:59:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:29:14 +0530
Subject: [PATCH v2 2/2] mailbox: arm_mhu_db: Remove redundant
 mbox_controller_unregister() on probe failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mbox_double_unregister_fix-v2-2-cd5739b60718@oss.qualcomm.com>
References: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791284356; l=1403;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=14z+MaLeD2Gr/LBk6/z+nl8275HrtncLLXQR8FwCBxg=;
 b=lgjZl8s296FSoXmFYdcGp3V1oY7ITuv7uOCjy/B7MuHPtG/UVCczKl+oLoRfkS+WSrJ4C7rLi
 AUID3OeXLR6C7fysVWCQEldssXbHMvWBBD5hXk4VI6kO1VbHXda3ckw
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX2Nq9BCuL/BaG
 UDTPMb63QLx4zfsUCgvx6Z8ERmZSEttWPa3HE0VqTdbqwfNEOzBtN3wCBEUCDjtcz8pGHUvAsD2
 E9VlCu5YtIgJQRJYnaETOK6+YRG+3dlDSpOXdL8syjEMObXKt8aEC2DJu/WoBBY1+gZTUDizfdx
 GN4HY5Jf9A2Wu+77rxdnNZvArxU2T0z7duDXBAkFavrGakj31rGNM6Q3iCoXyXAiWMbnMUoiTL1
 y6wUTosHm5qM9Hlh3mCl488IJMa8UvuajiwiBmwhmbh6+DH9/XJnnRoxzsTVrCt4V8H+wohPkQ7
 nri+UzXqRJ2UT7sTg5c+yOePWbxSFwIgSEkBEcO3XVKsNbHD9gP/2IDQMvBtGmV8bV2O/zFjpyJ
 PlUopxCwk+5HWJMnv3IducGoQgJZxKPdeHkfd6iHrzCG8gycRqkoPlYH3VS0GdbhD5eBU3f1ywX
 FM6s3M8Jow/YFNgLBbw==
X-Proofpoint-GUID: Uf1oaeks-vPW3Kvjpw2fAwBobJXCTO5R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MyBTYWx0ZWRfX5L4xwWEdxdBw
 HAobbO4wgP3EswCuW5oNelChP5KAlkppnCx0avlo5QtSvZPD0CjaEuu3Mh7bXgL5/ImCJu/2oRf
 eFEHISD2wfSJ65ItA74lECnh+E11qT4=
X-Proofpoint-ORIG-GUID: Uf1oaeks-vPW3Kvjpw2fAwBobJXCTO5R
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4d490 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=U3cdxg4MlDLirErpFykA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060043

mhu_db_probe() registers the mailbox controller via
devm_mbox_controller_register(), which automatically calls
mbox_controller_unregister() through devres when the device is removed
or probe fails. If devm_request_threaded_irq() subsequently fails in
the channel setup loop, the error path also manually calls
mbox_controller_unregister(), resulting in a double call that corrupts
the global mailbox controller list and causes a kernel panic.

Remove the redundant manual call and rely on devres for cleanup.

Fixes: 7002ca237b21 ("mailbox: arm_mhu: Add ARM MHU doorbell driver")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/mailbox/arm_mhu_db.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/arm_mhu_db.c b/drivers/mailbox/arm_mhu_db.c
index a39239e38a47..9f1c7bcfdcb4 100644
--- a/drivers/mailbox/arm_mhu_db.c
+++ b/drivers/mailbox/arm_mhu_db.c
@@ -317,10 +317,8 @@ static int mhu_db_probe(struct amba_device *adev, const struct amba_id *id)
 		err = devm_request_threaded_irq(dev, irq, NULL,
 						mhu_db_mbox_rx_handler,
 						IRQF_ONESHOT, "mhu_db_link", mhu);
-		if (err) {
-			mbox_controller_unregister(&mhu->mbox);
+		if (err)
 			return err;
-		}
 	}
 
 	dev_info(dev, "ARM MHU Doorbell mailbox registered\n");

-- 
2.43.0

