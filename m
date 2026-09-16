Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0D3E5ED7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538669; cv=none; b=jl5pAJDbRV/g6kDbZTSuOVvZMZ4QR3SFbpqyClse2zF89fJ++Hlp6DwYYejM2qlshh+f+V2rvZDeGIyxObSkHO3HPtUcRj2TaHLYGiDgeKE4+49wNBezRYN09Ocej5YkegrpsCFeAiShXikzdDOBvmfUDXq5dqYXzfD4iaz9RL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538669; c=relaxed/simple;
	bh=Q85aXDMwvbpzbdqQZSLnN+pKhKHeKEyGsGA98e+i4Hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eGwTLuoByEfbzC4s1xkcncV4lnitNfdaIwl2C/h9RgUhYCrJ8dpf/Hblfe3hU1MNq0Nu6hD5dpBqaNmnNrNRLsOoGjNMrNI4ShI4jHGzN2u0kP1RO5wLdcvWUl3c9QXfpwWPTW/uPqqZyWYFWawcbdRyx2jsAz5k07e2NTU6wGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UFPzLsee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bh9G9aWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UFPzLsee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bh9G9aWM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G61fus1668198
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i6NubhOqBeR4m4IZ+gOEWa
	U7x0g1qp2eT/RMv5Jw9Y4=; b=UFPzLseeIOAJq+Vja9kHL9KYBg6mDP98pw+Z5L
	FVD3SChuuaVEomK1FoYjLsxZn2qfB+DOjjJPeJx9cB6cKASft7IVjqyWTnWXDay0
	gFzvn3khV+e81OxXp4p0OLRujQLJ/4HgYZa7kF5HKa3jNrTaWzSt8ACq9NA9Uvm1
	udpmV5H+AzJHFx9/7AWc2upWv4K5zvB9XwibfMTLGc7kQ6L0GDQ+8Z42P0wJZf1/
	GVEFdWqe7xhmMZEivKPIVseZZvdqTs9P28J0GFWXtu0U2ZwGKySW1XQ90G3QkXm3
	xWSkEVZX9mMIbq1RGW/xTopm5WcrcElQCnQkCwtsDzYp9fQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc47c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:04:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso5542166a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538667; x=1790143467; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6NubhOqBeR4m4IZ+gOEWaU7x0g1qp2eT/RMv5Jw9Y4=;
        b=Bh9G9aWMIpaZq9s4xddkURfXeeiAgAou7AmT7fhkQ3aexhzYhhLIFUMGwvFIegt7r4
         gl5NA2K7dJHYj0/nfodVJFAhgmzMuzC9G/PLYoTMk8dwuSzLugSgURnAk22XBwqjwNn8
         tUTiSfedwQPtvbva9D8WzmVmnvBCluHbm9S6Bl117xsP8VrtgT6STFqB5MD4GtTly3vi
         bQXnDqIhs+6jxVouWCbpr78lE4pN/EjruBsmtB4cUdXAZCXwQa6g/iU/RGPnVQg3NGLj
         ZcITdg5P9OpnsWk22SN7WAwKbCRrpk4dnZKFnbU2PVUst2xh1UD6MvSeq44BechxnyFl
         omSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538667; x=1790143467;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6NubhOqBeR4m4IZ+gOEWaU7x0g1qp2eT/RMv5Jw9Y4=;
        b=ps+USaWj5bKuZndgESO17NJpyQ1Egk7oj+JzxkcMMZap3ZmRTLUvDOK7alYMGjp3en
         rCf+7OdiraD1gp9zQpU5gbI2te7SDtunrUkZrptgARi5HLLr3q2QZK4cs5uGMgAD0aU1
         8nJJyAaLTtPm2BvLiYpxpNORbVsigd6LHZBuw0OyKwPj13Oc+WO84Iix5J49P720El+d
         qQLChI+grr3kpz0H1l66723O91tyr8jimHdw1lDcfl8jWL7ZmDwqDY57aPdJCJNpZ+YS
         ZpZJL6QiUW20652oJol617kCxcNSu2/NopXFNZiGWl8o6cEWUDr4L03LDZs2GNWQkJJK
         dgGw==
X-Forwarded-Encrypted: i=1; AKwUvBzJwqY4KQQ2/LHeLmqLA3bEX1iYbwuzgunkTcu98TOsFmPsnRFOH7FkTMVK8htHyBuK4fZTiSP0wOVNwtw=@vger.kernel.org
X-Gm-Message-State: AFuF++k/KUYqt0LvGAbXYEk0f8FDZZJtQ29uZyI0lcUMJxNq6/Et2ENR
	O3dEs/dS/U78DettPrGx/omNRPdL7Mo/bloPvip/G4BBnvYvZp9eW0nEaiRotQtGBlj0Gn8T43t
	pZuXIpaVz8GYXcENG8HnLbCWshxsowdWBy7dCh6K1AKZtSZRAH9t5B/qX19e8RyBIJS4=
X-Gm-Gg: AYBFou3oeeoXdBnlvx2Rd5307o7C2UO48CNk5jVaK6A6Npns570+qyQLaBYDuqF6DRZ
	uRc/S/u0hHjkNKjvNgYDNcslDtu59Dw66Uf/IuDkH8wXW8G8ZT5PBSoKlSs6F5cq78TofXhCyFJ
	1AC2S7bktXlbqhJXIVCux0MTqv6QVZZ5+o3stj6WxIgIy7/NG7osB9chlF8A7Ijrj0nm1qwjFgS
	5pOXZofgLO1867L+EU5WvV865v7M0IrPf+Ow6S6EgU+Ft3Jq+Yy8Xu34yWOzZv1/wXjCBXRiRe7
	7XikBjzt3XxknApsCzA6VNcefYS8tgoGXO4KvjOQEGYNnM+o6CDFY61A7N6JEyVYUtZuRa/Efq5
	BpFQ22I3rb5bEC+C9f3Dzo4Foiy5kjaX/4cPXq+azQsPzT4w=
X-Received: by 2002:a17:90b:2f0c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39e1e308bddmr3723940a91.9.1789538666611;
        Tue, 15 Sep 2026 23:04:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0c:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-39e1e308bddmr3723876a91.9.1789538666197;
        Tue, 15 Sep 2026 23:04:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm4740083eec.2.2026.09.15.23.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/4] PCI: qcom: Align PHY init sequence with HPG
Date: Tue, 15 Sep 2026 23:04:20 -0700
Message-Id: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQxqmoC/yXMUQrCMBBF0a2U+TaQFBKpWxEJafqsIzLWTCtC6
 d4b9fNw4a6kKAylU7NSwZuVn1LhDg3lW5IRhodqam0bbOe8SQ8eJU6ZEVl4jorXAsmItQbjj85
 1NvVIPlB9TAVX/vz+58vfuvR35Pk7pW3bAQe4xpuBAAAA
X-Change-ID: 20260915-align_pcie_init_sequence_0916-571190abea56
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789538665; l=2301;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Q85aXDMwvbpzbdqQZSLnN+pKhKHeKEyGsGA98e+i4Hg=;
 b=VanMV8I3b6x/UKi8Pi0uPylqTjCwhgLHtLLspbcP88b+CZT1gM9u0udCt6lZrEVLqwiiDCt3u
 OIkB+RytzmiAGVjxv/dp8txVevQMPr4OSRhvgqLg1w87iUb4GxONhWv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX5W9NSUHS+5Uc
 s7pAa3EtmZbrEtM/wNWT2ctzKb3bP1oXmUU+UxA0a5prq0WHMBlJVQFy8XvGiM7AFkXAzTQKewP
 U+Lud55XFHkVNHpkDhc1T2lsv+ZMKPQ=
X-Proofpoint-GUID: 7Kj0fwCEbPgorTwaBahbkk-ro3JrzJly
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aaa316b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Riq-LXKwlQ56QxmQOhoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7Kj0fwCEbPgorTwaBahbkk-ro3JrzJly
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX0tnBKv16n+tP
 zHpudjWnTV7gZpApbWknoCmhq++mruwF3rW1rnGcI5nKWz6Z1L971lHjArFwCiJc1kW3KS50Rpj
 fIFwXg02EJfNsMZ274VSsgxk/e/CZUKxHuSVrDzIS/F3UsV0wBrxdsvyhCyia3a/3MPWS8WUWig
 IrdmYvOewo15TNmJFXJKbWB1xIdviemyxBBuGdo06GbYqOjMiIAprBYiQ7gxwjf+vMr+CHw+PE5
 hPL6/abQIXhIuXhBhCVdbdoeYCF+ztcZn6LsA6Z3gUP/Y+MYmChYLGRU8L/G92CR2q7i77weoFw
 4DVns+BvGB0lUde3sUTDfKOmQlDbBKo/bzGEwfwsnEd9Q87hzQ37sWaYkYAobxvtGdYu6pNxFJa
 kd4sGeRcE8NFDC/qen0rbe22t0A9rm1xYfWXLqF+FRwzEdRkKd153qxhwNpSSzPHND1zYTyZEGN
 D2aW0nItJPn/y4UK22w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076

HPG requires the controller/PHY GDSCs to be powered up and all
clocks enabled, then the controller's reset and the PHY's reset
toggled together as one group, with PARF_DEVICE_TYPE set right
after. This series adds the callbacks needed on both sides to
realize that sequence: a phy_reset() call the controller makes as
part of its own reset, and matching phy_ops::init/phy_ops::reset on
the PHY side.

Patches 1-2 move phy_init()/phy_exit() into the RC and EP
controllers' own init/deinit paths, add a phy_reset() call grouped
with each controller's own reset, and move the PARF_DEVICE_TYPE
write to right after that reset group.

Patches 3-4 update the two PHY drivers these controllers can use
(phy-qcom-qmp-pcie[-multiphy].c) to implement phy_ops::init/reset,
matching phy_ops::power_on to what's left once
phy_ops::init/phy_ops::reset are pulled out.

phy_init()/phy_reset() are no-ops against a phy_ops without
phy_ops::init/phy_ops::reset, so patches 1-2 don't change behavior
on any platform by themselves; patches 3-4 are what actually change
the sequence for the platforms using those two PHY drivers. Other
PHY drivers this series doesn't touch (phy-qcom-qmp-pcie-msm8996.c,
phy-qcom-uniphy-pcie-28lp.c, phy-qcom-pcie2.c) are either unaffected
(no phy_ops::init/phy_ops::reset) or only see their
phy_init()/phy_exit() call site moved without a sequence change.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (4):
      PCI: qcom: Move PHY init and add PHY reset call to align with HPG
      PCI: qcom-ep: Move PHY init and drive PHY reset to align with HPG
      phy: qcom-qmp-pcie-multiphy: Split phy_ops into init/exit/reset/power_on
      phy: qcom-qmp-pcie: Split phy_ops into init/exit/reset/power_on

 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  26 +--
 drivers/pci/controller/dwc/pcie-qcom.c            | 165 ++++++++++++++-----
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c |  94 ++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c          | 184 ++++++++++------------
 4 files changed, 257 insertions(+), 212 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260915-align_pcie_init_sequence_0916-571190abea56

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

