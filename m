Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0242439A066
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878758; cv=none; b=KlDd0QobhsWi0/ZBkAB5nYhBvR2bb55IiqSNwpsVrQPgMi5yckO4FFIm21j+SBdZCfk/d5d6eqERcXy1zvqqKv7S+d97XR8MC387bpwoEIJbnx2+jHBJC7PTvNhY/IYOiRVN5YT3IFyQ8bCDvZZfjyPUDPm2lc6PveXgV+563wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878758; c=relaxed/simple;
	bh=iZuYzeq/Pgw/waHMPd+MrVY4hlQ1wtwOfa4qhLhrd1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRwMaFRk/wSsYJQdvoCgFRGdO4zXX5EOFVa8MCIUIWkqVWpFuOuohlYHb0TmZlD4Jn6XzKEWUrRr98hNcxNZ70cn9brEtQhkQjLy0Bm/cHkURqJB2TvMnl0sFO3c0kNJQs1S/dkzccPYdAPgnGfg1fiy44c7HozAbAwkAyIuGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XZYkOQeb; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OO2N4opm; arc=none smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XZYkOQeb";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OO2N4opm"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D85iSY1656882;
	Tue, 13 Oct 2026 01:05:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pfptdkimsnps; bh=mKcTMAd1
	XwsbHycxYfTit9ic9kDSKXGHFUBYQRkuwsc=; b=XZYkOQebUuzxqpOD3aFs8cvp
	BRPLMWb5eyG8/vUd+gcv1kgEBoc/3nJgMFRkUuBNFLHmWRSMroijrjuTTtRN58pJ
	Lj0yd/NmNO1uYKSlwWmgOud4xmTlFScCd9QlDmYQbO5s+3aO0IpzgcsTrBDIRryo
	8Rnu1foYdc4I+ozeJ01z4iTQRxo++ZzgGAJCrHrppF0HQTH7uwzclYGzER5TDlMP
	iguMd3L3hkqbe7rstooGjvrpuabdK6igk2l5w5rh4aY8/O10vLj7RC7Cs3pADmz0
	D97UEal148gNLG1et+7y5PPtkA4mmUETaXRn7e2UQ3RC0w/7AISwRt8ZBOmMgA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4h950nkpdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 01:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791878745; bh=iZuYzeq/Pgw/waHMPd+MrVY4hlQ1wtwOfa4qhLhrd1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OO2N4opmPSFhs/MfPmWu0aNK4PwOrUXN0v+WZbG1c62RrgaZqO0LCjoGgJs9hCasi
	 XtGRE/A0i+3g/1bBygPgf9KvTRcYV3eXGmpAeT89cbyu0nZRtBxa1Bg9R6Hwc19FNR
	 Dl4AjKGvCtedPnkvDxk3XSJr6w6OZNhAx20Mo5A7SfrzD9LJMKokWLbtyozYhBtpQT
	 U3VHzVUMAuqA88uFBBzp29ZX2iLz/JIlGnlueCS8i2XCoxtm6K6u5hKXnInGXfmt/m
	 DgKC1g9mzGz0ipUHZOikMrVt8WEvzrRzGiSSO0rSIEEYsm/aLfDT95bo9an4LzvRsP
	 ziucJkjtReazw==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2939D401BC;
	Tue, 13 Oct 2026 08:05:45 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.7.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 8EC44C142F;
	Tue, 13 Oct 2026 08:05:42 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
        linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH 1/2] i3c: Add HDR_BT mode to the I3C framework
Date: Tue, 13 Oct 2026 13:34:12 +0530
Message-Id: <20261013080413.7470-2-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013080413.7470-1-parame@synopsys.com>
References: <20261013080413.7470-1-parame@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xX8rBn_LiuVgiXnfAXQmWWqh-vrwS9wi
X-Authority-Analysis: v=2.4 cv=OKGyTiaB c=1 sm=1 tr=0 ts=6acde65a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22 a=jIQo8A4GAAAA:8
 a=28-qNoQkZLshCx57FeAA:9 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX+f0wNh70CIwT
 O+6jjp8hbcHbHZAPG2SA3Zh3dw2l7ozneM56OQ4nT2nJGIowfLCXFRaNZ3Ger4+83j27vg3lEqz
 Dobnoy1cIc0fAF+X6wraATT8yB5jztU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfXwUkYNtQ0eKXj
 zRG0lLgFbg31xoWZov1U6roExF6wbRWbTVWudcXIDoCsTUtbaFROOb8RUXN/8i8pZEJGwrbRO9Z
 Y5gNaqQXBObr7gF+eU0YeoKDNwq7fTj6mU5Mqsc+PjwdWd/mvYc2XRKBevTIq7cc8MqxSjGoLA2
 Z0Nmi9UZbUxF+g/1N2f0O2cFO90iM9hLdSycGOL2up3F3fYMxnrfY9xeh/GgW1GVTOgAfC0DAEH
 w7af5e0GzxAa05hQCxf5WQSVSNDUlEFedoFCYczyXdlHoWhESEulZPjQCwgpMWUiesuAdgtsy0s
 /zVJCed+YWM2oxXWcL3NxCqjoTvK81mXTpaAoxQoRpCItAPBsThcKkckiQBibFmWqxhLrR78bBe
 hMmdX0expoNyS27saVlSDj3+CoxcHy42BV8Ndfh4V9Rmf7qwuWyHehI2Z+8ZSo2lIAYSUMkPQ8/
 zSuWDHtSFeTNDD4RaZQ==
X-Proofpoint-GUID: xX8rBn_LiuVgiXnfAXQmWWqh-vrwS9wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610130031

Enables representing HDR-BT capability in the core transfer mode
definitions.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
 include/linux/i3c/device.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index e30ea2cb13cb..87aa6bfab69d 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -43,13 +43,15 @@ enum i3c_error_code {
  * @I3C_HDR_DDR: DDR mode
  * @I3C_HDR_TSP: TSP mode
  * @I3C_HDR_TSL: TSL mode
+ * @I3C_HDR_BT: BT mode
  * @I3C_SDR: SDR mode (NOT HDR mode)
  */
 enum i3c_xfer_mode {
-	/* The below 3 value (I3C_HDR*) must match GETCAP1 Byte bit position */
+	/* The below 4 value (I3C_HDR*) must match GETCAP1 Byte bit position */
 	I3C_HDR_DDR = 0,
 	I3C_HDR_TSP = 1,
 	I3C_HDR_TSL = 2,
+	I3C_HDR_BT = 3,
 	/* Use for default SDR transfer mode */
 	I3C_SDR = 31,
 };
-- 
2.34.1

