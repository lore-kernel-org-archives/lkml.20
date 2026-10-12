Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD7306776
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797834; cv=none; b=AvGBpL2ulh20PaV64+Oye9DxO7bhCebVHfO25x4cWmbLVLE/KKgnwVaCdQb8MVafT6JN0TjZ+kQFh/NCimjQuCeEWGrvGnjNWlRkogen2p6ARQ9HAHyddSwh1WgFZ5tiR8h6k5gg2F8N7YaoZoDGrx2ioGMUp8MO05vE7yGHfdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797834; c=relaxed/simple;
	bh=70pPnT/EtjQEEDK1e1qoEJz1Davnlnoo+1/hv2+cdw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gJ1PCJL6N6hak2ujnn09CzEW9HDSZnjO1narvNJmfV4Uuq6oLRiNAyNoRqg6Buf8Xv7Dumv4vQcqXkYtYMAsJDwkUVuaPppvGl/t2zSu9/o4ZgAEiPSC2YzrCHPlevmi0kN2+Oon/GtQ813c3qsMRCYuhMWEDMiaaCFc6zZYIJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G63k9hLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgqKgUJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G63k9hLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgqKgUJs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KfNW1192614
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8D
	NqiiPkxY=; b=G63k9hLYDwAOLTRefluPoEskB4O8lcIHdEcSHJa8p5iMt+IkduT
	v4fauCGH2b+q08IRy74X60wqgnTbBosmAQDCEAr7lQaJJgx6+H61fP7t1VV3nXhM
	Te9VtSmSuUYlYs37EO5h+7vJaGVAp4OEbdfo/N1GJf2FkGgoP1ALAheU2fM8zGXl
	2JyE43Mk0fvCQrq5oR8izzSmfRsxrOiGcl5tJSA6kETn7fGp9lBySrCIllGV3Tq1
	XM3+ZU4UxkVCEzfV+ozahdXCFt+a9SXJ4grU1UKzFca58rEOilXsyW65Y3p5Z8Q8
	5zsQs5vqT+bd5RSImV1leKYsmfxgJeHV3Mw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eds78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:37:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so1573623a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797832; x=1792402632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8DNqiiPkxY=;
        b=cgqKgUJsCCdNwaPJmVrcxvgrn4soYwl3IHC5/BbgI4yoOrJHY4Z1BVG+9O7lR898De
         k3ttrnqMXEcQnuXerkymPvpzN0igBkJbGdy8QekPwY9sIbS8WsuRwt4lc9MN5KLdXBbq
         2pddlOWmgRsPj2ahIgEdclH5KolcH+eKF8ApH/CTGgF6zUEhd8hqzWDTAUuf86TVQNlj
         whybzFTp+qCgt/K7r/QXoFU87CnBHtGDcb1uEfZUrphkO3Fy2ut7b3RAC5y0FGNnPSXU
         2iPgtfiF98SAuOJrhVohJLPRMokWX8KbBHscWQK7xFxgu+D1iW/zlYRKRCJVrXuN+HOS
         1FXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797832; x=1792402632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+I5f9T/y6bonaL2H05XMwEcoDN9TAEPi8DNqiiPkxY=;
        b=iZmVQc5lkUpK0cZhbbYxb63paZAsylML5Epbajvptg+4ErPXAPbSonxtHkQUB2Ofo8
         tXbUlQNFnVCGT9YwmgUGMByh+/QWvv6FuSvRkqtvX54q/Ztmk4TpkNQRpNqOPG0rVUDq
         2t1i4Jf+iaL/IU1pWl9MIuc7AvHGRUTghhPVQkD9RU/oK1NItLd4Au7rYvBOcyHOeVGt
         m+mnkl+Dz6gZEFbRzDkBSZIbVtYtOuANi6cB5Gm/T8JXzgmIkodYnfK7WsBcLAFJtcKE
         IHY0qT41D1/Yi8Nr67eDZe3EmQpMAA0spigSvD8SKEe9pZRTWVWlh89YryiIV4dgWQPr
         NOqw==
X-Forwarded-Encrypted: i=1; AKwUvBx5qmf0GiBPqYFbpHk13gvcxXO7GWihCAZUWZthOg48Symlq753rTKCQw3eSrkhC3BuX/UJtjX1GEskGo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYINNlyD2jjm5ITrbiw6l7ln0NUkkdvdNU6Xa1BJ02g9CE/Y4b4U
	K7E73HouZbLa3/rKNK2Aw62dU6JtLNaluf0gKMZT+IJ/ccwmIyioVcmc0+d+USknlKSCJyY9rK4
	pFqLagB++FG0pqJjnivFktoxp5Yk6PZi29j9ZRutuum15k0x+THz45pqKsBkDyD4kAqw=
X-Gm-Gg: AYBFou2bkqETX5WEcmGB6JWyRMXBlSu7cfRRaDtTkyhvoYew2r48F7j93p3b6+NJv+O
	h+aqmvfFjNPib/7f26ua0EwUBpLES4o46ugfKSTVQDeaBdv+r8LqWWEtjxtl8EbT5TXXK22hymd
	OLHC/7eozHAX+gOjtXBEVnJysH01b7lJYQB1xZzrWRzrra6lCRr6z1hSg7wLNO6fxnPdREL2CK5
	6VAjYcgPCkg2JFUU96q8ohC/ohD4XhhAIkw9NyqWEsNHFa6fiMgA8gOJCP1Q3XWAk70WzgEv0ZC
	My8widnXrs9zbE6xO5CyN7cLZN8oRh0up07zBz1lkNCaZkhtCfGrWSM6t1Qb52IkFOxSR0JnHHU
	bDqflFdniUvyyS2ooG3SVgi1QGMzK
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6677802a91.0.1791797832083;
        Mon, 12 Oct 2026 02:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr6677788a91.0.1791797831577;
        Mon, 12 Oct 2026 02:37:11 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0ce7sm16637814a91.15.2026.10.12.02.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:37:11 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
Date: Mon, 12 Oct 2026 15:07:04 +0530
Message-Id: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX3JxkttFtZyz+
 mVWDxGrCoWVML+zRaxF/luycLrNxoLGpAd36ZvQdp6Pp7KGNvGYl7ZxJICs32y/u0kG0R3N8Akn
 +rUCHH3re5uDqGajyJp0ZdqLWzhjrl/snG0EWY996vUI6TdB3738pgY2I5Rue74D7rskANW2QxW
 SJAr1lhGpT40/iiNeLoZsxsG9j359nTksm5vuJpyk3sOnLN+YXAflxBhVuwGYMutZQWAizcY0ix
 eNejtcTpVl03b6bfPVqpTIcUVu1p/y74rkFbNqivfRQJBOOVDtzWy9JsZu3Vdy5wAZiaM2D0ujI
 htfbLBhVvgAPWcF/9oKC3za5xeWb2N4HWlziup6a2dYoPjiHetoZp2+Q/fgBusopWfkoqVL+kaN
 lILnz5MCfUN9vHnih58uVWKa5u5vMWXUYBp1Wi/BxQurpwmUtuPWw6R+snQKl+q9hJV2jNzTBHt
 gI7etm0SL2uZI+4vdxw==
X-Proofpoint-ORIG-GUID: _HcYcVo8dl8oHm9-BDJgQFh3BeMce9VG
X-Proofpoint-GUID: _HcYcVo8dl8oHm9-BDJgQFh3BeMce9VG
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6accaa48 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=g4LtLXktVRgdyDEntd0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX3S+tmd1g0mjd
 IPJgBtVO8x67/eqm21B3OtWOkbkMKizM8jpYxAc6hEhxuV+HprsyxMvfiyhGt/7RpLADZ0o24LJ
 SdjtBzIdl4R3pLy9vAbbMAALmQKLY78=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

DWC3 currently configures USB3 PHYs with PHY_MODE_USB_HOST when
switching the controller to host mode. Even though usb_add_hcd()
sets the flag corrrectly, it gets overwritten in DWC3 layer.

Some PHY drivers distinguish between USB2 and SS host modes and
expect USB3 PHYs to be configured with PHY_MODE_USB_HOST_SS. Using
PHY_MODE_USB_HOST may result in incorrect PHY programming. Fix this
by using PHY_MODE_USB_HOST_SS for USB3 PHYs.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..1bb87a370725 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -251,7 +251,7 @@ static void __dwc3_set_mode(struct work_struct *work)
 			for (i = 0; i < dwc->num_usb2_ports; i++)
 				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
 			for (i = 0; i < dwc->num_usb3_ports; i++)
-				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
 
 			if (dwc->dis_split_quirk) {
 				reg = dwc3_readl(dwc, DWC3_GUCTL3);
@@ -1643,7 +1643,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 		for (i = 0; i < dwc->num_usb2_ports; i++)
 			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
 		for (i = 0; i < dwc->num_usb3_ports; i++)
-			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
+			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);
 
 		ret = dwc3_host_init(dwc);
 		if (ret)
-- 
2.34.1

