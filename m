Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564666;
	b=m+tdh4MRbeM24rqwyIXbCn3icGTIs5qBI1gXmtiK26XremBM90ndlaDVV6+40qmTNI0v
	 6kn8axm34AOK9n+A/xKme0+Iht1lsLizTk1GoSF0Ycie7gey6vyE1xTXCfIDdcQ26ccpP
	 MVJdq2sDtfYkCFGO7op9YB+AZP+JmWHoGP/4QU9CT++2Oo9oxl1aGKKgXPGtSkaCU9qiV
	 5sNvBo9bSbWpGl4pO6vQykQyfGgalDGv3vV4OcrYRoorwVJgHsnSHPGzwCIoun0qoDQtS
	 9UOR3SvP3A9mENhaPy2L5Jh+fcXlQngecXEqJwDkzWV3djVr7EwpSrr3CI6Srd+aCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A9TexkKdIrs/erjBDlS6fQlf6eDnWbyM9FoQ6Uwz0dE=;
	b=iNFVli2IsWtUpURPJtSAHWxYko+CRw8zy4SyuQ/pp11+kAfDIGBrtVQNHYnH2QV8Zowh
	 vUf9f+OwPxE1IvzVfC+UjQ8bAFAY0Xaav07P5NVd8WyPfGwfXnmjyiZqa6hj037Vzjrci
	 Dc4z7ewRpgejgEiXVHXS1GYSI34rK0ukBVRhN2RwYWDpig5W5XbpX/4QZaitNnpW9HVHl
	 s3ogbeTMkANbl6S2WDUgT59VLtEqA4HkvymBVxVhHnsRpNCHCcew3pVnpfA1eUtu3foyu
	 F7xBxfDAaiLh15Mx7R9tC8GqGUSHCzgpG3ZeOSMijoIhGeFL7Ljwf9flzLv24DwFDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej7EFIWK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFAc2Yeg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E98606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E98606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ej7EFIWK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LFAc2Yeg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK23j2376985
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A9TexkKdIrs/erjBDlS6fQlf6eDnWbyM9Fo
	Q6Uwz0dE=; b=Ej7EFIWKbNSxaSRKOzO0DLKf+c3zY53ARXbJgh15s5jwgiA0LbI
	lOWxNVO+QwyB6AZ0/yGyasCppnXsNqTe8RKlEbagruJS0eaDU8jE56SKGPGCBOrL
	WBzRLizlPEZCLoU/RnGDdA/PyTW1Tg04DwgFfY5LUZ/td/goSPPK6/OV0viktOEs
	SNk08uRZk/MaytbrOMXM0/CDYYzsBzCECf8vFHynmxrexeJhsWDprAwr0nE6kRVA
	g9/9yGGNqD1qG3cgZERf0oSjFJCCUsqFALUpjoGQatyPhHLdCuEIrqJR+b7pJ9wu
	wKo8+i2AzgrLOTfOiT/dqxBQ8pOEPtAya0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6m8ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:24:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so487534885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793564658; x=1794169458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9TexkKdIrs/erjBDlS6fQlf6eDnWbyM9FoQ6Uwz0dE=;
        b=LFAc2YeggggHk2dSNumbdwUaprjuO3KTKuv+Ar/dOcbCaO8dk3FeBMZVStwfgFvK9G
         rnJV//Smlwd5lZniwBDT7Jli+6NSpRIyOHKc30GlBBU5eWXGl3zfshcjQdN4Tc7PXVR7
         o3XZjPCZaqv8dWnw07wt/IMv0Cvwjr/BaGZHuEW4RKSQPO7bbJvJNDnzpJ8Rh9V71/Tj
         FXPRfyjAuDoep/L+WhJjkk4ox28xLae7w/JYmOn1Lfq6cjyjsJT9ZKiQBssXJeUJgGyX
         YA0OSmNukor5N7GwuHEQWs4aD87+aC5PWegb3ZsZ1lvCexFc+T7hI6+Tho/9gt2VxO3/
         QRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564658; x=1794169458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9TexkKdIrs/erjBDlS6fQlf6eDnWbyM9FoQ6Uwz0dE=;
        b=u6J9UeOwn1RixGOwIVQzdgfT+pKHjv82nTCp3cgftGptola0bqtjOHfoXWIQq1S9/e
         WnIXezsnlQwsI+YSmcoJaBlEwMJFOxZ5GZKEgAoHXRQ5ySqEll8C9tFUWF3N/WBRYs9l
         fwvN7NWgNzAH+Bf4RTfqRMIG4CS4BwXfOjrawnKR5E9bh0X7/KlRN9Jz2CvN4pf8TNmH
         9azapEuEyd3p6DUuUusRVj59MeSes9MVq1agawB4oM5qsniD7Kdl890va03w4pnWwrDF
         +jQsI8mDOzSCXMmA9+k3F4xb2hD3oIiG90C4xOmVzwyi7LMvyArb1LD02nzb+TfeqxkI
         9YhA==
X-Forwarded-Encrypted: i=1; AKwUvBwZqr2xyRjceN0lPHjrc6iEiJp9FWotdnF6KagxGhCfwLEaOECG2uUU5gajyRDuLjec/UgYF/hqKpy775g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtlqlkGa34CIulWyq1flG4UXhBug9QNbuPUtgURZ2QmlrvZ8Am
	qQEuXmXedxqILzt9d68vKt8IgUqOsL8bDWq5VvVn8QTSBvnvJnCExLV0/GZSXfruFO0FLu24BHI
	klrVtwdW91dJ6Ow9oVFjUbOLmzpmbiH3A2roFBTyeeh6i1IHFodEgG7QM47awkg4pp2c=
X-Gm-Gg: AYBFou2FHfpH+s2ArvYs5jjsgdK69HzfvMQ7I3icvDKV4P/vZkxCACRvENzC7gBY8ve
	Vz6GBXbvNBsc3JCJAHaWyry4ukDqnDJJxaVB+HC5ZYmzQIYZneEHPgt8CaX+MuQn0YFARmiFfyx
	4yZgYIuyaNeJrOjU1ghMYsqs9eb7jbsOyKFKJEi90nxRHrtv4xgRqtZs0CKj9rlYjeEbGtmtabP
	QH58T1DgGroruJA0mFxw5t8mbAaE9LPZtaYCH8hQQyBXJslmrT/CfnZZUYq2jaJQYVv6WGesI+E
	bFcawzVyFRgDBKMBL/wWsrW/3+WS7hZ5FkklvtRH7WJ7wX4cuAr+ngTR3ydmi3PsVaWMxl+OgLV
	5zDoA6iUJCbzNONrCYGHiB5c5dfBWlSLdoGVVFtq5HvHkmM2Y+mfOsdHcTNSNHQ==
X-Received: by 2002:a05:620a:4890:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-9442175c04amr1361341185a.41.1793564657834;
        Sun, 01 Nov 2026 12:24:17 -0800 (PST)
X-Received: by 2002:a05:620a:4890:b0:93e:90e0:d2f2 with SMTP id af79cd13be357-9442175c04amr1361338285a.41.1793564657261;
        Sun, 01 Nov 2026 12:24:17 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm16796675f8f.52.2026.11.01.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:24:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: smp2p: Fix use-after-free of irq domain on removal
Date: Sun,  1 Nov 2026 21:24:05 +0100
Message-ID: <20261101202404.156522-4-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5533; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=y8sN+/KgCqgq3D4BDX57+whg7OL+4YG4raWX7Iev+w8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq55/kA5cikLvUniaELpmrSDYNmpx0yrcHVFJEG
 9zcBtO8J/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauef5AAKCRDBN2bmhouD
 1x12D/9Gkwp7yqz38ksndZXFshCru7SRGddDUlUOYxD529tPceV+VcxsqhTgHDrPw3DZq/MoH3t
 /SATZF0BknHJWdM9Wv1/cY6U6yBYoRaIhy/IkOVn6qWkhx47MfF9L3z1cXFHEMHXAilwEnuQWvI
 JvVpaAavCm89nXDb0/jXgob1MDz8vNLuizmFgFyLa0JMI8z0AJI4yOSvGaUn53Qlws0I7vd7AXT
 Hw06tlR0Iz5x0mv/z/4PbP5j+VTT6zLg7xeWjLq4A/k1Neqb3OhpAL4I8fa5Ny4kJpOF2lpSNnQ
 wHBYrQyjyaGgDXsT5ZyxrfsWv2wu4T9dx7bduQudTA+M+v/Xxys8jQ5CkBJydmxG8MclbpwQHJl
 oV0GPzmCHHNuM13oZ5Fng46D3PhNhJ5hKJK+jvNfos4qzeD0t/WH7ImseZm4muW5wvP5rmBjnXN
 kPV5PaWjYgwYye4p2xg9JAbGJ/GUD8XjJ4vgqTgI+UKTI0nd9Ji2Dhnf1HrRg8h2DlIczEo6Uy4
 qB229+f5CPUdVopZLh/utHoShFLR1j4FfzHx5XHyaPguGe+WGy957Xq30eahL7+mss8nYqoi2I+
 1V1lpo34BdCqWr8HB2PlUyEFZPhtWkLbMM2aQ+NhDANq+W4l0eV+5J5FLFfKKZlkLklTGiXHT4n yEUggoz/kAPhgYQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UqJlGY-mzt76cuNmwOJrdB5PT-6qtfK7
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae79ff2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WnX-v3NP8wQC7ZxZtDwA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: UqJlGY-mzt76cuNmwOJrdB5PT-6qtfK7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfXxR2UpBnQJOmJ
 GSQmHplWG8f7AYqFYxehWRp4usqTzYf1q/+FuKsQY3htLE7yUvRLdDWGEAFp2G/mPDg9sO4ErNi
 501FD+6w/GPdyegOkxburARpV5gpTYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4MSBTYWx0ZWRfX2Xgeqt24sIEb
 6fm2CpRamoorf2yucLTo2oNfDbteCBkd7eVCqn6BEVD4v7B0PomFj1X5KW5XuunSjo/R3Q6Nvbg
 5W+MNX7D7TtQmaJ9Ou47Cf9KHDW72094i9iqclaS8FOpXwM433R8SDQoHtf363+BhChvcZDm1I9
 yNmcYM0yqaj/m9XAToMhylngjoAmjB0LVjbLntTqkTDKa0/bdAhMfXZnuU8TVTBctTpD9Bnxr2q
 EpHb37PQF3mvESL3jgpDHgbZQZPtFTHpfLOS9hxbP2wkvLgQNxwCfBFqx7HrJUuIOHCawNjP1Ki
 6ZoRAqqr5zqLLzVHspx3rJdAhaD8aoPdh7pUcCqWnYMholpf7o7YZax+gkTLSKpV4BHqKQoRlbm
 Zu5AAuDsGkuNu/pT3GKGqpl/ZFY0g4AcPOj41J8v3FUS9VjPoidu8qWL0nGNBnluCtMpZUY1jgj
 WbiO9HzmFGxrFDjPjfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010081

The SMP2P interrupt is requested with devm_request_threaded_irq(), so it
is freed only after qcom_smp2p_remove() returns or, in the probe error
path, after probe returns.   Both paths, however, explicitly remove the
inbound irq domains, unregister outbound SMEM states and free the
mailbox channel before that.

If the interrupt is triggered in this window, the interrupt handler
would use freed previously freed data.  Mixing manual probe() cleanup
amd resource-managed devm leads to such races, thus just convert
everything to devm to fix the issue and make code simpler.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-02cea59a-8c4a-460c-aeed-69002ab3e72d
Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 96 +++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 50 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 01b8580c9f27..7c1684c65e3b 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -619,6 +619,27 @@ static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 	return 0;
 }
 
+static void qcom_smp2p_release_mbox(void *data)
+{
+	struct qcom_smp2p *smp2p = data;
+
+	mbox_free_channel(smp2p->mbox_chan);
+}
+
+static void qcom_smp2p_unwind_interfaces(void *data)
+{
+	struct qcom_smp2p *smp2p = data;
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
 static int qcom_smp2p_probe(struct platform_device *pdev)
 {
 	struct smp2p_entry *entry;
@@ -671,34 +692,49 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
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
+
+	/*
+	 * Register the cleanup handler, before actual initialization happens in
+	 * qcom_smp2p_inbound_entry() and qcom_smp2p_outbound_entry(), to make
+	 * the code simpler in error paths of below
+	 * for_each_available_child_of_node_scoped)_
+	 * loop. The cleanup handler will handle early failure well, because
+	 * lists will be empty and smp2p->out is already allocated.
+	 */
+	ret = devm_add_action_or_reset(&pdev->dev, qcom_smp2p_unwind_interfaces,
+				       smp2p);
+	if (ret)
+		return ret;
 
 	for_each_available_child_of_node_scoped(pdev->dev.of_node, node) {
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
-		if (!entry) {
-			ret = -ENOMEM;
-			goto unwind_interfaces;
-		}
+		if (!entry)
+			return -ENOMEM;
 
 		entry->smp2p = smp2p;
 		spin_lock_init(&entry->lock);
 
 		ret = of_property_read_string(node, "qcom,entry-name", &entry->name);
 		if (ret < 0)
-			goto unwind_interfaces;
+			return ret;
 
 		if (of_property_read_bool(node, "interrupt-controller")) {
 			ret = qcom_smp2p_inbound_entry(smp2p, entry, node);
 			if (ret < 0)
-				goto unwind_interfaces;
+				return ret;
 
 			list_add(&entry->node, &smp2p->inbound);
 		} else  {
 			ret = qcom_smp2p_outbound_entry(smp2p, entry, node);
 			if (ret < 0)
-				goto unwind_interfaces;
+				return ret;
 
 			list_add(&entry->node, &smp2p->outbound);
 		}
@@ -715,7 +751,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 					IRQF_ONESHOT,
 					NULL, (void *)smp2p);
 	if (ret)
-		goto unwind_interfaces;
+		return ret;
 
 	/*
 	 * Treat smp2p interrupt as wakeup source, but keep it disabled
@@ -728,52 +764,13 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
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
-
-unwind_interfaces:
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
-	return ret;
+	return devm_pm_set_wake_irq(&pdev->dev, irq);
 
 report_read_failure:
 	dev_err(&pdev->dev, "failed to read %s\n", key);
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
@@ -782,7 +779,6 @@ MODULE_DEVICE_TABLE(of, qcom_smp2p_of_match);
 
 static struct platform_driver qcom_smp2p_driver = {
 	.probe = qcom_smp2p_probe,
-	.remove = qcom_smp2p_remove,
 	.driver  = {
 		.name  = "qcom_smp2p",
 		.of_match_table = qcom_smp2p_of_match,
-- 
2.53.0

