Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF912FE057
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569349; cv=none; b=eH2qQNaNBwEDRi4QA8fC55PlY+ZhmssXOZohJZgYze/He7jf+HtmjyrNdvu1zusG4BRuLjie13f+QPLAlloOXJrjPZWmF16FYC14ehUf++0zsSK8Itzj1rmcyWzUJcaR+lMQeuYHLuHFyUopCH33l0qC5h3owpTWgd0mNh5OD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569349; c=relaxed/simple;
	bh=sfKd4PUhkaZ7zHvwb28F5e0rQnFuAwMBZcRF6G7zUfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0rM8hNhbW86VT3PSEMhCLAQbx9N5QtXHBmzcqil1lf+qnKuUaUYcsd/F/2RzdO2T1n3uwsVbImMa72+3Uzs4HQ3TdW9PAtkrE/4TjQKICzkYULkKTBkH4ESHHs8bINDSO/hyNccnft7OlG72c6RuqQ1T+tojPIOib0AZYEUQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDy8lWZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMcqfZOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDy8lWZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMcqfZOu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KbmW04083768
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 00:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/eGTfs5qneBn4Tbyp5BqGhdGuEpUcPdVMb1HTDEOI8=; b=fDy8lWZRKS8XNRh5
	sf93DBwIiPCFbrDsOFnbBpFQVSTF2wyXWdma62KOYE1hJ8xAdh53ODt9Y6EQjA9L
	7R1tjv4L+1qDShYI9w2hzLeNMnInv+gf6e8VFxi/qbBJbhmyV3hunP94Wtfr2h23
	vtmDecxaaM3vhZ8c7H84yLoXATheQS2Snc3+ELmG7KgZkZQtvXlJ0V3AZh1G0tug
	uAtJqHqz87s50Q5aV3+OfUrIJml1hTRlgKNxzJhi4tx94XVoLkJ7d00BarmdpW9h
	6sX2oklDAzaE7dcDWZY+xVevhatyKYBmDTm/cdb6071qqRMSoAt5BwmYU+1JL/+r
	FGz16w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yada4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:49:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2045903a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788569344; x=1789174144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/eGTfs5qneBn4Tbyp5BqGhdGuEpUcPdVMb1HTDEOI8=;
        b=WMcqfZOup5n9wQ3FVzggPV2l8u+Lz7nKDbuGMLXiA2iIEAvir/i/c9VhnZLk/DN1Py
         wmTHQ7yLUlPzenXFkKVXVtshRioruwjm8tLyw0Fddwui6Tckk1YLk6zLRtwCCbjZ9Ism
         pK6BRMH0gaBz7GkfI6AB71Zsn1SFQmWnMdhdsLOYvOqqLICLiwjIpj8vnITUAKFZ1q4w
         cQkzRUYj5lF3RU/EMm8TyXuQO+VqtSPajwr0Vquv67U66opmrq+GmkqlDYMocVLYlRX2
         Po4FypxwZJU/x/2ZT7FrwxfXbX/7bzpzEuI9fycf9+zjdMHpkU1KKXSchiZs6hXWgF0w
         g9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569344; x=1789174144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/eGTfs5qneBn4Tbyp5BqGhdGuEpUcPdVMb1HTDEOI8=;
        b=IXVBd5jAtUgZIITiOuJhFKF/MACY9oEZvXx5obqL/gJGaOr8bctrhaC7rwq4OX86R4
         5rhhhHA6HXdJ9HVbjIUySfqj15KdMbsHmRGL1rYb6vCLKzFiKdHIKyrObWK3nF7J7Whx
         +/EFvMvl75W8A7m3cziT++gpvJ1ZRJYegk304nObfc/uFV0Vq18sjVHL4o2C91bxt7p3
         ovVUjx0nSnCXc6fXHd5bhWz2nJytbN2uVk7uwcQZIWedQ3TXCKxJRQKiGzssFHcNqNik
         LEqq3zVUTye+3u/riiJDWln0BwXgYSkHifGC320PJuJG7Wh0SubpAKYWPS+VpcSf/PhW
         TW8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2qpyS7o3VSKhdpkz7UpDMXqPzXytFTofSWin4GDh9xkZflX0rmE1y7MXiGPF4ziPkkc0/zXJ16ShFzFc=@vger.kernel.org
X-Gm-Message-State: AFuF++nfnCEEEQIm3Llj9ZW9el2aqf6vWWt8xs/p4fkfGrZ6Lp8AthgD
	NoMxNOSxxQ5/TTHtBxYOo8KE5powwHFA51X1tHn6c2fMb6xNF3UhGJYfjJg3UXBHbFaVEjaOjNE
	CnA4g04YpffWOGLIAyhb+Ev2yHkZn9EIq28hc8PkhM9NMuNGdmWRsrgPlyGAg7JtWG4c=
X-Gm-Gg: AYBFou1HCbhHURaCdBjyPK48kGg4wFSyl92Wh487lfcqL5L2e2LjRG25HoG+oDCXfoM
	LLQlHzt9SB3rqKnBNMNkW5nt6/fnNg5IPRse0SYjKAeuabELNQzCCgoX5b+ekBFs79XS1DJ5kSx
	jYGrKxphzz0iExTMZOdkxOBGZDr0w+x+Sw/dN+a/BQosmmlBR6Lo898hb9tncTC+Odl2YbYT8T/
	ijrZ9N0CXj4n6WRz4CDj8SoMyBYf1GVPgH681Ycrw82SfALE0Vli5Oriv2juRzTkfN6AkOFHT+N
	xNGtvu8c6nSORM5hlYeACV8ijuonZ2fH/6elNtoDJlQGeHkJ0+cxOmWyUK/ReUIL+xcJT/6h7tl
	w/JfF4BBgVafzx52e160x68Z5OhQHYP9K0D0=
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr13686853a91.23.1788569344143;
        Fri, 04 Sep 2026 17:49:04 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-39b262e4e02mr13686815a91.23.1788569343667;
        Fri, 04 Sep 2026 17:49:03 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm10843907c88.15.2026.09.04.17.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:49:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 06:18:48 +0530
Subject: [PATCH v5 1/3] PCI: host-common: Fix early bus-walk exit in
 d3cold_possible()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-shutdown-v5-1-f0c6bafa1d4f@oss.qualcomm.com>
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788569335; l=2447;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sfKd4PUhkaZ7zHvwb28F5e0rQnFuAwMBZcRF6G7zUfo=;
 b=V2pZFMIR//ke38H/PQM43Qq1j//ZSYODnTwLs3CblZAyWSngbLeq+V1DyVke32R6aaVpc0H5x
 X4ec32p/ADXCdO7tKuEt2ZBGhB//3+6sRB08WZi2ZT+t20OnvKPSTlh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: NDpyEHcy4lFx1NhDMaEoBmLSrm7zP36-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfXwQvp1iIK5V7U
 LbOmmtAmWdQEeZENhOocMWw0HlERkcUHPKGlciLPSfw/DDJRM0U0Ne656vj+NkncPZLRc6Y7ZhB
 UW+yLD5kr3mmiyBn7IokF2BjMYJFajABYZ2lNeemG/GHWqo/A9+FsiJzl4/2Q/LWTZuKv0N57ml
 xLYtUddcjE1jOxGq6T+YP4n9RO5AwtSCAGXHVaw57hte/4hJiGQ6YOp5fZ5tAEYH3YButS0ADpq
 luzObeAUxEQ5cvJGuPxtkSgcJCrRkiWPHoJx3Oh2ciCZsPDpr/Vq8st+ClG+pU2sqHloVQtjEIZ
 /8fvJLhE2tncxFvBNC5VDoTjEhevkj63HPu2nHc+8R6oOLFegpDPAAAJEGdp4XuO6WU14ra9lb2
 4uY70az7rvZCpO4YdYcu+3N29oJE3q7/HSUgT9WaMvDJYu2mJRCQOvGb3BhdE6Z8g2uPUp/Dd2a
 TrS9xL3b5GrzZC+bcJQ==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a9b6700 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RIIKlrP-v3AzcS8hWasA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfX2iiLQ0MBGMRl
 GiLLRCbb3FBTW45x14C6GC++Trztf8lA9JPdTHFsFi1X7wRSuafVVWmB4wcOu8+GdCKk4euletC
 UO9lIYVSuj7OCjzVuZqg9VoDbO49RJY=
X-Proofpoint-GUID: NDpyEHcy4lFx1NhDMaEoBmLSrm7zP36-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050004

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
 drivers/pci/controller/pci-host-common.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..78bc4c8c9656 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -274,22 +274,19 @@ static int __pci_host_common_d3cold_possible(struct pci_dev *pdev,
 	if (!pdev->dev.driver && !pci_is_enabled(pdev))
 		return 0;
 
-	if (pdev->current_state != PCI_D3hot)
-		goto exit;
+	if (pdev->current_state != PCI_D3hot) {
+		*flags &= ~PCI_HOST_D3COLD_ALLOWED;
+		return 0;
+	}
 
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

