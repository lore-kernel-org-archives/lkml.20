Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893610;
	b=DpNEYK8VlH2VYYP/YGD/LSo0ykAvvQaJMvUuodQ8KycobooDdJxDG0Dt62Hr5kPmIFiM
	 mLNI/uKUpLaWzv0S/hzrVootLw1EdZN/ofnekGFi0Rj9Gr3FAXAkVI+koUmBdIA+lZ2sa
	 uGNoKj6NEQSFoiQfJ871487Lp3ssJUpE5ksnS/SCxN8m5tZ3ybAsjJQJBNVAMAHaaBsZ0
	 3XJpqv3jcXVhD0L2u1XtwV/efJsityc/OFW+80tmp6dfK3TyWRuCSiHWqkLZz6y3gJlWk
	 rkGm0PUFFV6jXAaa6ZH1cvnyx0KhwItZZqP0MyyerTer/8eLi2JNpyrsAwD6WI2m9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RN+WEUPp4KINOTOtwDMjWGbdxhennDprUx1GDkbGW6I=;
	b=hjVYtNiJMqDAYwki3+BqmNA3yNeGe+v8TZeDWZU3DC8USwXVZlIAou/lJLXyd7j8XQ3s
	 KmuK8YPLQ1YUYb6GPYg12fvMvtD/HPmgo66bBjM4b/Xz7CfIZl1IW8fbNHuDWFcL3gPA5
	 el4udyFC/6YJIJprpivOq0Y30pJHuz6d7orJSlGr+gOxA6qAE7IT7oPZsJ7J4AWynrtLP
	 0SdsDIs9U6YotyEUTbU6eWMgqh/hm2pR8dR5bo1SmzY1wi6hW6W33Ul00pj6hTLgYsm2I
	 BjxbVuhoTwIFw2M/8ib/tfWrH3JZssh1p/H0whwq4PlkdPNcBOWnbaSyIZE0eL6V+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbgLQfmH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeiuGTIc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E6606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488E6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbgLQfmH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeiuGTIc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQLkK687357
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RN+WEUPp4KINOTOtwDMjWG
	bdxhennDprUx1GDkbGW6I=; b=UbgLQfmHay1X+yLkye7NquJWqU5e0T0xMorbpE
	74Ttkk3IcQCJZwuOfogWU5uXpQKh/oTjnd9cYKbq0bW3rj7XRJDB1tZ3CpwtycAn
	BeZOC//LnRvrAnZ7u7FlUyDLOuQE25ubJNXpbEIEMIOuxl9/M6/W2+Bnm4XSIBze
	oKceZdEID2DXR+k+W5EFVf+Hvo37clM7+TRhEM17pGLdFGC7JxfxvzrXcijSkJVf
	8N9YDYYc5R92tCaQ3JJPnfznxFcQ46sztjBN6p/+92aE6IAAnFuQSQK35wbGUo5c
	hqnW/zSD2V0yeutOmQorrudVCg5uwEG31yCLMWNzjGuuCVHw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p1nb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:46:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc23a549a9so1581121137.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893608; x=1794498408; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RN+WEUPp4KINOTOtwDMjWGbdxhennDprUx1GDkbGW6I=;
        b=NeiuGTIcDa0UFX5v82P4oZ0WJu5KVbWMNDs3GR2L8p1fx7zZcZyrjB6VxrX5NUCB6N
         eHdIDgVXXkiHUpu6/FHKgtE9FvhR1ig7GAEei4+MFiIheIGXYrapXFX15FlVWRgUG008
         2JtuIba77h77V4H2b045mwUGoFGTyholICVyAuLpku78CVH/5uzpOSWqUxixZjXm1aqV
         ud5eIyCvvoXAf0VVQ7jcyQCeBiFkBfIZepROugkZ1Akwv7wapLoXaNuxQrFLGqLra3Zt
         caoI1dEF1whJDIBvf8nDVFBbw7CZPUdJdtoHxPakiSdkasof596lWyN2l4HiqYj0sYe9
         h5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893608; x=1794498408;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RN+WEUPp4KINOTOtwDMjWGbdxhennDprUx1GDkbGW6I=;
        b=hVTmifzHMqGd1d1Lc1/mAnUgj0yLZuy6zA5Vcv8ANgp+AKiq+2KpSAmrItL61sVYhA
         WTStwkQ6OURkmp8iaBJaHdpIeKrEXXm6Uaid+9ln4w7wNn4fnSELoFxMH5Js7y8LdvaF
         w/us3bGGAVNMJNUYst1zRPpjJsSysrqlecIzO09jPx9Gw7y44yhyqGxttJckvkxK9t8g
         iUbjFJEumBQeGhDGgIxLFqpf6BJ3eQTQuCy4YcjGWE+LnwyjE7BaXJIJFvirMDiNTg2d
         c8CmIW+V8zzVjDJtCr/ZSeCInB07EWhllwE4Jnhb5zJ1I9GRUGMJAYBcpgt0wOBw3eMg
         +19w==
X-Forwarded-Encrypted: i=1; AKwUvByqRxIakpB6+YYGVZhTpBd46fYHeRwm7rRDBeKJcE3+L1K+Act4iE2QM/qPNn7xC/rsmVbpZPn5PrCNiUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f1zwHu0YkhlAJUdvJE9ZjHCX99urg45zjKu3j+WP97rUwDKs2
	8qbKvEfEcwno0s3wQUliTz6KZVQhBIvG8K4iENlVCJJfC38Y6ToLduXTCEhq6/Y3BxiTCKWlPxJ
	R4RR3cXW9eYxaorLKqWaKruTYRcwkELxxyJD87qTXP6Iqo8h65cEcETVf42I5VScMDwQ=
X-Gm-Gg: AYBFou3fx7xpyI1h2HTlsafvcyZ/pMqFm9xb1K7IdfX2Zb1Zzpfkmut5k4y8pZ2Ds7n
	al88WAmN9j6MacF+tJjLk4+J9kOCPYA5zLy0gOy1dUoYQbqSUFiAsbs+Ybc6zik1r+hfH4kD8ID
	8jIwOiG7a6pgvzvUc6K/OD3iC3BpTsgE0wtgFwxi61YW4vrXEGXY/Pqudt149m98WzbX4SgVDiU
	/oAXXRHqDGjPnfF6YkDz9z7mOI36caQRVOnLDoaf4LDPWhKeB5pWlvy6OyXbMhD33UwNt6enhOE
	y6MxIzBSRBdinD1GpcSIZP3DlDrRtmiwhhfN7TwXCubEVvIQGD/Bncln8nMKONWMX4qvwuVDdW/
	WqARqONgdF2ZLbAXB2Yuqc9vSbD4sxL3WiBJE0+VIOzV3n0ee/kaXbHuuGlDJGhVR7b7BGLJg3q
	qlPQ==
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id ada2fe7eead31-7d072d59168mr9324561137.33.1793893608507;
        Thu, 05 Nov 2026 07:46:48 -0800 (PST)
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id ada2fe7eead31-7d072d59168mr9324517137.33.1793893607880;
        Thu, 05 Nov 2026 07:46:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm10717936f8f.49.2026.11.05.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:46:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:46:45 +0100
Subject: [PATCH] power: sequencing: fix serdev controller reference leak
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
Message-Id: <20261105-pwrseq-pcie-m2-serdev-ref-leak-v1-1-e2e022ca17ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOSk7GoC/x2N0QqDMBAEf0XuuQdJICH4K6UPYjZ6aG2agBbEf
 +/h47DMzkkNVdCo706q2KXJZ1Owj47GedgmsCRlcsYFa43nctSGL5dRwG/HqifsXJF5xbBw9s7
 CxJB8jqQnRRf53YHn67r+lZkypXAAAAA=
X-Change-ID: 20261105-pwrseq-pcie-m2-serdev-ref-leak-f521e086d5f8
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=blvW7P+vdcHikV9wkNkqbWJ4eKvSI0rN+D6MuijpqgY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7KTmd1rI0vmNN85k0PZmqXGbQ8qWCS5DLVv9q
 J9gq1Xa1vCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyk5gAKCRAFnS7L/zaE
 w94KEACA5RwVkTCGlBgYEPF7sW4hDzlNdX/Mkg8SksT9dCIa2v3O3WNBupuy8rIxu3W5/cuYUw1
 c1dzdVJMZYqcH4Mb6pCinkkd5z5+lduqTNLSXtIHVjpiGFL2Ex5lTF1aloa+9FWz1RoHIquisyY
 R/BFEBZ9cyUP39Yx00fnQqnNcgtZwhvcx80PhXqQusGEr2Y9KwzPc3L9GO3OFE7U4WBR3nrB8G+
 4p/ooTTMIJl0yif8KQXors2F0zY/vrLHA4yQyAYiLxoKFck2iSdhu/v75WkX/Li0HMWwx1TjvrJ
 I53v/UQiSfMbWyXATm81qIG8BE188YjxHnlbpowxF1Imif2MuAUUnQUKJb31t7sAhfVdzF3lNet
 meCGbN2bamOhRr+2qtOAmf1QgX9GhUFbLWvP9olvER/nL7JsvrdQrvVFUVMUp28UoWyye98u+CH
 7oqg5T0ge65lwSLsI3DHbMwXLXDwBehf3ypoQ9lq3j+BqJskzc+yi1SHP+J4olgkQxJ9xW9xG2k
 CV5X3Je2nLPFedDOGnIddzjBXP5Dk8D7WBuwVO6Bf9pRH0q4vUjdIbHGD60Gdss5imJnno85qJG
 r12NIf1dbaegpiWbhdb0YRvV46DzaLJdG3iXkZjH0ReHkXBKAhn2Tgukz7k20QTiilC/vRh/vbG
 qzC+9B+9xzd1EwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aeca4e9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vvZYVk8vaF1dF-lsgB0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX5UKEBE/mf6nh
 d9IhqH+KwuwK2mdv9LZkxLAYkOCNHf0SHzavTE/dkyKnPdHkrWlQb3tRGZH1XKER3LOWgaHFsBS
 vC1HIX0KYACGUWnyyhZcOPOWTb3LLzd6ok0WXXN1Rgfjjs8cDs/pM6GkQTfOwvmP0RxkbyfiyqL
 KeqekSt4J1gKFGxGA+KrncskitH7u0tVcYQ2nJvrOiaq2JUW4sZfeEL6xKSxsTU1JHLE9GPxo7Z
 BYniN19CT0Uj5sDfvt66UnT/vq45ULwBeGAx3/Zv6aXYdg2R9nX8U8+a+WNcDelQVBoAa5R0JBl
 kzeQ7PPfKvLKf8MYIKmSiF1IOu2v8eoQHpb5vddQAoOBfx049i+IV5G8jY7PUyyJvHWDiqOcql3
 seKVRoSesDgcgzF/rD8Yj48LrizcRwEB9VcZJcyM3y8w3vFTL/cA1cqgP1f2D1DKZ0XIyqw+4YA
 hxDXzbCiv7YG+sFNyvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX9pxl+gnezEuq
 O64h9XCqtQY4SMvcbHJxiVxy47oHgx9C0poQZyUmebcNuaYwonjW7BffuSPlrqn7NQPgbefFfLZ
 J0N4e6AFXGD+67/lWC/JZufYdWbMeHc=
X-Proofpoint-ORIG-GUID: DegLhAJUfD_BUkAPwUvEDYFKe8ersLJB
X-Proofpoint-GUID: DegLhAJUfD_BUkAPwUvEDYFKe8ersLJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050062

In pwrseq_pcie_m2_create_serdev_one(), if serdev_ctrl->serdev is NULL but
pdev is already tracked in ctx->pci_devices, we return early from the
loop and skip the serdev_controller_put(), leaking the reference.

Initialize ret to 0 and jump directly to the label that ensures the
reference is released.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-07754192-a8ad-42d6-ab1b-cd6f16bec846
Fixes: c4be520907a4 ("power: sequencing: pcie-m2: Create serdev for PCI devices present before probe")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 56c5d51293c10faba6c978265bcd07a6980d2a52..e3bc5ebb1e56666d135c04b23f6d462a0a166df3 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -296,7 +296,7 @@ static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
 	struct serdev_controller *serdev_ctrl;
 	struct device *dev = ctx->dev;
 	struct pwrseq_pci_dev *pci_dev;
-	int ret;
+	int ret = 0;
 
 	struct device_node *serdev_parent __free(device_node) =
 		of_graph_get_remote_node(dev_of_node(ctx->dev), 3, 0);
@@ -308,16 +308,14 @@ static int pwrseq_pcie_m2_create_serdev_one(struct pwrseq_pcie_m2_ctx *ctx,
 		return 0;
 
 	/* Bail out if the device was already attached to this controller */
-	if (serdev_ctrl->serdev) {
-		serdev_controller_put(serdev_ctrl);
-		return 0;
-	}
+	if (serdev_ctrl->serdev)
+		goto err_put_ctrl;
 
 	/* Bail out if the serdev device was already created for the PCI dev */
 	scoped_guard(mutex, &ctx->list_lock) {
 		list_for_each_entry(pci_dev, &ctx->pci_devices, list) {
 			if (pci_dev->pdev == pdev)
-				return 0;
+				goto err_put_ctrl;
 		}
 	}
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-pwrseq-pcie-m2-serdev-ref-leak-f521e086d5f8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

