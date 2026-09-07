Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054175474E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783698; cv=none; b=Hm4NX+3MnZpqBbNMyvWDHgxZRzHIjl5QQwc8ZISs2/JprFwK+ddUYCpKOUHfaFyh5MayoITt5OBdu+/h8MFR7XWbL7awDzp5N6joa9M595TIFgQSVLYqWZYpdOncoccDqEyUn9d3uQvO4nxBeJpvu1C9a0f7ih8urF0FFqDFI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783698; c=relaxed/simple;
	bh=tsCUG4G2vHEO1kJZHh9TbKKbwT4PYNLjAyL1j5WYM7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FbnaLFLqJjzqPZhflR2BBKHWiOIwLTkOQMdQd3chFXhNKbwsUO+9ZUDTcQnyhp0U8o2EgaSBxYEwfwRGrvPtex8NFJ9U64NLNdNvcUMIiFE2KyJg7Qw8Y8dt5Yl1Teo5gdY72emTBHTsjUHM7ANvM5H0kcgTswO+eVotU9n5HHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPad6QGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4R5Achr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPad6QGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4R5Achr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmuJl3349022
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yJmvlvbp2vZGV7FOACp8bDhpFD+SbgijnhC
	XGHXuwAs=; b=EPad6QGD/mSn02QO/q/SGLV55MT1LQRwhTWXEFyMi5C+8WvsCIY
	HeB72Z6J19O/AIz9vs0rKcksIFd91X02aJRTHn1h7UZt3GcsGJDEJjZ85jGB04nq
	wHBrlXUkvFrTxD6QdQqyJ6DSsmU5LmNozdYtaM2K/FhYTZiwkzks8IClosSLuX6t
	rTRrC3KAerOkClDaPfJ34RszQvlhiljwBtiUH++KTjov5Bi1l2mZdP25//xl9qR1
	+ydV+aFcqZmUWNrtbKgrAA6WghVvHMEWWnm9KzbI3p9LxjFvjk0gVYuFmaVd0WXb
	hweNpUDKwq+2H3RvPQPRuuhY2HWplbqlCPQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0qn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:21:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39af306c795so657514a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788783695; x=1789388495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJmvlvbp2vZGV7FOACp8bDhpFD+SbgijnhCXGHXuwAs=;
        b=G4R5Achr4FWLF4To8daX+z4BE8Ulf/cSaRUHmhblrK2cvpcYsd3pE4CTLaH8yluObA
         mIjcJ7ot2FNvi60UYZzTgBL1S2asISyY1PUrv/OE64+eg73BvOgNG7/Boor0MSzuThj6
         sK4qk0e/g+kQUW4B8sdCjD1qXEzLJabwqjIyBzwiY61t3giDo0OcAlDW61BLT0y7CxBh
         3ifoOypsLaZFjmnmMuVJ5hrtbpnHMdmVLdw40VLY4Mvnh/TidsKKT54Y90uzuNRWQx9G
         8nJ+3QsVf/OddGSHBGOc0V/ciac/t3tj96Y0aw5yPiLoqq7JglRRRhUeBhbzx85be0zO
         JhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783695; x=1789388495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJmvlvbp2vZGV7FOACp8bDhpFD+SbgijnhCXGHXuwAs=;
        b=bJ4WBSeKqPZ63Imrhh3kTyfKxVdNz9fetewfDc/yapyawOROfJ0sIA/CG+z8n2KCNW
         Uatyi2udVXLlJD7ZYPEZM71oW6oStE1DmBWJnkuKQpVAqjTyHgGxzkL8oInmDo27b4lh
         /IcGjatM+2E5R5CuV3FDMhnbHlpnkHYqOuqWolB7KkE82ZZVOlACeZ6q0c0peIo83x+L
         s1HQElDkqKrWfAAosXR1gZTW98ZZR4P38wRiYMCXnHqGlI6E3FgiX/PDKD2Kr9TXPQq1
         91iUe7FkrcrUwtAL2j1h4tuJHAXotF8pmL3ci0yKUJaQYV3zZ6IJ+kaSOlei5h30K+Rq
         rCBw==
X-Forwarded-Encrypted: i=1; AKwUvBx/FilSebBlcB/Z5pD+lzrsOomjiwooSuVvp1WTWhNEF39ryEACs+odiKiuUZ2nlWbhc/EASga87S4JTo0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHFmEDyGLuSZ8rp0Zqx0gd3tg1YsdSIlTYQNvszCuXd8jy8B9m
	y9D3+V1Ube+30u1oBqjwwl/jTB1e8eUW763h2FstXykJa6xVRlNofSFd8awegFBM2VwRInw/DoC
	oPir/aAhJ1onTeN6W6W/3N/fZRGq7WjRZr2bUcaiAPIxm1mEUTFNO5pinmjrIUwNIJAs=
X-Gm-Gg: AYBFou3ZEGB5EmWwb8Uh2l4hqqpXTmuVYKV8W1Kvmcbhw61brkjoqZtcL/i/IEud3DW
	o3iZk9egyP4sEyhCuvX5QtBmH2L8MVWiaFX1LwhXkHucld1LcTXKaKrv2lkHsw7vAvKSh50J6OR
	h7ErylqRZBb8UhZ6uj77/4WJvX79+04PYmd2xYOCDhwQx+n09doqsb+JVi5YTv4TmBlXIZsB0gS
	nh9+tUt9MZ5evD7bDqkYdEJEFk/tKknSoS6mt3Wy0iadk6ZvPsPn3f4lBrC4rh/PRQUlX1OhfXM
	xOfhJV5GvgNCVj3LB+dRGy2tzEM1KZalSRTP0pLYERAW7cCgBCiAS9lvGo4no6sACiQ7+v4inwQ
	MR2TavWgosi7nxBFc86u7JlxD/XKoUB/7tTjNNzDi4ASFHmFhZuU=
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39b3d5c4449mr13430044a91.1.1788783695155;
        Mon, 07 Sep 2026 05:21:35 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39b3d5c4449mr13429996a91.1.1788783694640;
        Mon, 07 Sep 2026 05:21:34 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm23747143eec.11.2026.09.07.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:21:34 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: [PATCH] power: sequencing: pwrseq-pcie-m2: Support PCIe switch topologies
Date: Mon,  7 Sep 2026 17:51:29 +0530
Message-Id: <20260907122129.1577279-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eac4f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=RVAIDergrmqZ-0WmEXkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aRCWy8xsnRB0wAw_phs6SgAvjJNdgpJz
X-Proofpoint-ORIG-GUID: aRCWy8xsnRB0wAw_phs6SgAvjJNdgpJz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfX/SOcNCzE3C6W
 d8dBkriwo6Q39lCo3gdghvt+ktGMa86/iKXnVC0e0WBMiEgTP2iwOYSu95RayU4RpsS2L7b2CTc
 ahuIwXvvuy5xnDzJQLyuaGEfgtHSz2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzNyBTYWx0ZWRfX8nGbT2BlUyLW
 xtgjR6Mc8t9uWGKeXpb4iqYa6DCFWa9J5bQkOnib15UTud+apVoUkoSy0y3UKqo6o9y8vnpW8mm
 7YVXEUEzVzYk+7o3eWiqq22cXQ9JQ1DHa6dgHijeTCVHKDdnbJ5KkDf0MwSs6eYJUWCSQCkVsZb
 30MbjiMkjQYa+FJQUquWjP896bHFZrv6rJANYAuNvhx6ft+rySagrFRLRWI8pQ+/P721GBAx03/
 Y/0cLHDxXdCc3YY67iNgtctAx0/TsrvbnLmmvY8jEF8C12IVON4BBDQko++/fY5RX2nx4SgKJbH
 rZmmlsR7V8XN839ycxDbjnUrIEzVGr08EwvoPscxJJOgnlEzir+4BYD746rEI7+o37kyINO5Hg+
 5FD6UoxbdsBp6wddX2hc1/ca5kM4qiqavA9fSoOa90uWJjKAjjZuuhEaEU9CeizJUOfPtPmV0kq
 mODNRw5hfJZSLE8FL+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070137

The PCI parent OF node check in pwrseq_pcie_m2_notify() and
pwrseq_pcie_m2_create_serdev() only looks at the immediate parent of the
PCI endpoint device. This fails when a PCIe switch inserts one or more
intermediate bridges between the root port and the endpoint.

For example, on lemans-evk with IFP Mezzanine board, the Toshiba TC9562
PCIe switch creates two bridge devices (upstream and downstream ports)
without OF nodes, so the WCN6855 BT device appears at depth 3 and its
immediate parent has of_node=NULL.

Add a helper pwrseq_pcie_m2_pci_parent_matches() that walks the PCI
parent chain upward until it finds a device whose OF node matches the
expected connector port node, or reaches a non-PCI device. Replace both
single-level checks with this helper to handle arbitrary PCIe switch
depths.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index de9848a9a9f1..82ba309ba5f3 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -376,6 +376,21 @@ static void pwrseq_pcie_m2_remove_serdev(struct pwrseq_pcie_m2_ctx *ctx,
 	mutex_unlock(&ctx->list_lock);
 }
 
+static bool pwrseq_pcie_m2_pci_parent_matches(struct pci_dev *pdev,
+					       struct device_node *pci_parent)
+{
+	struct device *dev = pdev->dev.parent;
+
+	while (dev) {
+		if (dev->of_node == pci_parent)
+			return true;
+		if (!dev_is_pci(dev))
+			break;
+		dev = dev->parent;
+	}
+	return false;
+}
+
 static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
@@ -390,7 +405,7 @@ static int pwrseq_pcie_m2_notify(struct notifier_block *nb, unsigned long action
 	 */
 	struct device_node *pci_parent __free(device_node) =
 			of_graph_get_remote_node(dev_of_node(ctx->dev), 0, 0);
-	if (!pci_parent || (pci_parent != pdev->dev.parent->of_node))
+	if (!pci_parent || !pwrseq_pcie_m2_pci_parent_matches(pdev, pci_parent))
 		return NOTIFY_DONE;
 
 	switch (action) {
@@ -464,7 +479,7 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 
 	/* Create serdev for existing PCI devices if required */
 	for_each_pci_dev(pdev) {
-		if (!pdev->dev.parent || pci_parent != pdev->dev.parent->of_node)
+		if (!pwrseq_pcie_m2_pci_parent_matches(pdev, pci_parent))
 			continue;
 
 		if (!pci_match_id(pwrseq_m2_pci_ids, pdev))
-- 
2.34.1

