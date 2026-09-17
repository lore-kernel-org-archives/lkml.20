Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B718B486BB5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628928; cv=none; b=BvcfNsHKRC9k9t/WfLBrWiqiyTE/YHM5lMhOwB/9OgSgEV4ANw5V2r7n9S6X/0XX8N7kK/iUZkDH5F0Va6q0vU8kB+SSo7lynMFvlIVpIYrcYkxAPkWWIQL8ZaJjJ9+cYBJEkf5TZj3JSg+7FUw2kLjOFjEDe1ZAD4x77ibEgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628928; c=relaxed/simple;
	bh=mquGpw2Jeks3u4pZSzMvUe6ezLRM/XKipJPSpWcGRsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ahykq2ZQq4/sIdlMYtd9vjk/agzmHREJzA+WdVv7MgLdwZMcVWiuUQERaBWMbbhmBqiN8obaYDdS7+yt4QFoXj0w8Sz2SCbt2yZxBjA8HuaG9aTIicWuHk0+rMFylTWTfhETFIqcXjNjmaP5OBusG35ATdDLxLKlML4fVm2cmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZV2OAd4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+terzDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV2OAd4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+terzDg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61GOY133171
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=; b=ZV2OAd4RrB2ongbN
	cmi2DHPJGVauNJrzFQ5h00OkHa8XHpOTJ22gZtjb70F2qsxVMV26wu2N6fPG/OCz
	z6O7DNzqm2un7iCZ9Th7Hai0El/aMi2Ium7K2e/oVdxrS1XTdtseCzKdm63zcQfU
	iNC24871sqEuxpn/3ce7QZecM9C2kfbJonXuS71uHQqJ+sqEfFH8haRT7CCtd6kl
	dDPdJhEg3K+I/onEKAkWOT1ivAN0HsvgrnAVwGv3L6VQDWqXY5B3FBlaDx42iCfJ
	vXJyRmGX6wPAaheTnx8ZyKEFbjFXfpVElvKCjRWT8GPOfVooBl6l5QpRkyi3h0Dd
	GRncWA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn549n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a41f46d629so1020859b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628924; x=1790233724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=;
        b=a+terzDgEl4vewu1wQoNsApwwnNPivSVm5UITEWbbBMbe0w3OQnn+MwP8bCEu9M+LE
         LruWXTFTBv82aCUO8wdpmZSN4Y9jNfNAagueRdv9fQuY5L+dp0hJo+ozTb/z8p8taEWZ
         QyvjumdGti44+8XcXOEi8Stzuq16T+8VbPEJFcR5ktZVaVYJIGGZO+ahR/4gsXQTQZ8A
         LBmN47tAH4zf1elZK+Ul18i4ldM8h19arc4bBIaQz52fa9Sv+6kUZn5K2Go/WaE3dVdS
         h9IYyMS5camJtN00HUL5pQ0lk7ODXse7cMKuCbSVyZl9WTjn3zFffCvTsP3zxPH1wLIl
         5O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628924; x=1790233724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=;
        b=rkG2RJpRqthN+GruvxtZYNRBrWU/psnzp+ZPyHYrwoGSBr50+qI/LPsmLDVqrpb3uZ
         W067HD1TJZIr8RAsZV2qPtrivZH8UDJEfyvIHmoPjupDhNCuqu0qDwaHSEUMUppmnnhy
         VFeZ37ayvQgKuSXDryMIyCzO2fSVEuX0l612HBH5zDYXYeG4yOEwACEAc04GfSCdarV1
         jUhwrnjsvBZHG0+k2WoSZLArn/3hLtEq1GJHJxevkMGMm5lSi5uN+QyyfKVHt9yZJgpB
         fydVisDZZJ9WyZy40SHDc6+z4FxrtQwOXhxx2sSrNLD2Busxb5uIZcNZSZ0UkFlZMEb6
         aP1A==
X-Forwarded-Encrypted: i=1; AKwUvBzCj1mHQ3LIyW32PgWlwAYjaKNEQwOnazhI4DOXyhC9r0L6bz+uP2jBSuAIFRhrv76olK60Yu2X7XC6fDE=@vger.kernel.org
X-Gm-Message-State: AFuF++lKZM4Uh4zwwBgNBxc7wPI9EhlHG5rVP1LCxx5pRHWP9oJgdMiX
	pZJ08mn/54YwTU9gSjtg1YtHhUDK/1g7xfLF0ZAq4/5MayXl9xchcF5u7IOC15Oy8tSlgzqm2Cn
	Og4M5YGqmUbk2SKVABjboKppuNtZ5aQWirgHpalPx6zoCtriRNBrGqDiI8C2ySOG5moc=
X-Gm-Gg: AYBFou3qEoNfIC6Eo4z5eDU56gZFCXSZPdUXZLNNcmRCQkeebAbSxHt6k6YuP0oPnGt
	FBK1dTeRumn8unzoSV/SOD3PEv2QRgayajyycNAN0KAEWrkD0amUx1usS1vZm9DktPa8lmSL5b2
	wZTrF1IdRo4ng4CmsIVb6q+a5OhkF6bfT/SonAV/OFVbi0bGXLJxP9v8RxhcmmEJ73dHJtA8oUB
	bVCZtCG7H36SRWiwFWDfgFzZo5TsVz84ueiH/JoiNh46dS19ctF/H73VOCUQVN/2vcm8GZZwbY0
	3YDHXLR0vLUfL2W8eCc/SaC+GXXAeXQ1Yi4KiiN/XFLMXTBlzee6Yqjhmqm/CD+badMugqBU9Jj
	rftO3/KTQJwt2Pw4BJQGatZH827wHIpYaTjw=
X-Received: by 2002:a05:6808:4f11:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4ca46878257mr7083032b6e.0.1789628923861;
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
X-Received: by 2002:a05:6808:4f11:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4ca46878257mr7083009b6e.0.1789628923419;
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:05 +0530
Subject: [PATCH v3 4/6] bus: mhi: pci_generic: Add support for 64 bit
 register read & write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-4-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=1521;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mquGpw2Jeks3u4pZSzMvUe6ezLRM/XKipJPSpWcGRsY=;
 b=RTgaytB4AD/U8vad/HkXDKJIftkQ19zqM3nTTYNeWMINkQvbsInXOFtlDCi9TfEv6a0cZ1aSc
 +ms9OBxP7SKBF/JBbNgy4kWhzfzA0eYbgun+9opB+BS0yexgvE5FBfn
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX/PHU07oznKDr
 x/Yqn+NUXhXRtZ1j33/4WOwWPLJZA57hbGXRQAslBeYuyM6qgyeNdLj4zoo30OJvmROwDOQONzt
 +Rc+J6Rom4cb2xIEtCyeh4HKQ1mT5qv1y+YQduv84unSJves73ipiarBtXd/7HMfY5g7rN9Y2aF
 pKN/LhLmqUpK9O8kj987ps60+RbWSkSSHD6vy1dX0/ckRX1PSeLb3lWD9KxxJE/1QTrha7nWK2Y
 M87t3z3LXzv5ZN79lpLNhAgMTg6Ky6dbyxUYjmFHyDYuUCGkjR2HFXpmmdNuEmNQ9FVxt3uum2x
 eKzvAmtXdbiHikuD1itUDQY66h9qbtHjKBErCrBuNApmYDxzXFwdmC8b5Aqsi+vcZfhn/OLBKKY
 y/9oiifzP3ojISSwaTJV+/AByL7hdWqOb2cwLfaZhg3TcERH5ZMfMcp8ySqTn7Yw2AW6W5FFKkI
 tKKaQtwJO02hfosJYZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX8/MInfUOQ/FC
 R8CNT1Lx0sfj5Aw6GKRZutzGYORYaN//XVRjb28tQAuUEdw5FY2dpHaSvxH1gaiZw0P233iQbUe
 B7joUZicw7i4HE+v/krBtfnzMCLbWk8=
X-Proofpoint-ORIG-GUID: qynzLtHfaefK3aWIoFMl1HQF258yFLqc
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab91fc cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: qynzLtHfaefK3aWIoFMl1HQF258yFLqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

Add support for reading and writing 64 bit mhi pcie registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f47867ced1d6..0aa5cee49bdc 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1101,6 +1101,27 @@ struct mhi_pci_device {
 	bool reset_on_remove;
 };
 
+#ifdef readq
+static int mhi_pci_read_reg64(struct mhi_controller *mhi_cntrl,
+			      void __iomem *addr, u64 *out)
+{
+	*out = readq(addr);
+	return 0;
+}
+#else
+#define mhi_pci_read_reg64 NULL
+#endif
+
+#ifdef writeq
+static void mhi_pci_write_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *addr, u64 val)
+{
+	writeq(val, addr);
+}
+#else
+#define mhi_pci_write_reg64 NULL
+#endif
+
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
 			    void __iomem *addr, u32 *out)
 {
@@ -1406,6 +1427,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
+	mhi_cntrl->read_reg64 = mhi_pci_read_reg64;
+	mhi_cntrl->write_reg64 = mhi_pci_write_reg64;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;

-- 
2.34.1

