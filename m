Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873760;
	b=vcyhERJFtNSZtBpJOUa3oSyRxMYVtnNzqWqlnmVG5DHFcj0YwuN/b5uNY3bxzDSbkYjV
	 HpL2R4Dp1VVjkRAbvWhcUdyYr4rrBSozrc6fdFjaO6b5SwrITV3qf98KGAvmcJrQ5n/+C
	 3D8p2FiQz1UM+uZwlRIZWtIJ1yLDmCAwRDvCfl95ENcM2DkAQJP7PASDzln8BiZaq1Kja
	 /E3ZVlETQNujMjrO2J4irV9xJasqHUdAP/ZaCHGyrqcNk+DrT7lRvDym7Gon0f5WE8Fi+
	 A+jcdWKdhJ0qTZIZzPgL9z9yEG7+HrDNaoHJg6vaF8wScuAJp/+GnouUwNvXSOCajHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
	b=zOJcDa8JzPDFoEHzl6gwuMabgtNDiKcJ/PZ+1goBxbJrRKR3gFhRVBva7QEL7cgvuRU1
	 nTdZcwf+Nrq2t6UB7uJXxhi0AtwEqDi1dF4Kn82XdMfqT9gNpftAvoRljWz3sx7/F81xv
	 qMOlXwXlZKbkUy6RzYRxWtXv1pAsFvzFzt+utsMbHTKWP8qzXxJJ9A3frawi7bzEJx4LP
	 JZxA+1pmfwS48OCUidJijyZIuqMBIZWYWL8gV7RhS5Ct2vW9H5sqgXZTA+qze6wDurM4s
	 d1rlcprcoB2PtrUPfCL2HaoCEjp2ZjVQWKR7dm6yaubYqe/2gzEq1DW0N0Ju40YN0xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMReMmE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUcZgWkg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C220606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C220606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMReMmE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUcZgWkg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tEmV444505
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9
	fvg9+ork=; b=IMReMmE9YwT0NbY2NpYhYrw4BX7aFXtdbaCFMsCCyPXzAY6Bces
	9vMWiLYdYn4vh/mNvIwBJqKI0qTVXB1JMSR2CCLjnHmcCM13xYSi8IzLE2K75ZGA
	M+mf2UKfwiYYG3W3eXpU78w52bNM6ykaS1w46UGEjW+iQ/CR4inCgdB6XHjLnnAA
	vS80EAGYrytOiwUwF2TFpHGEeenXgS2GRiC1JA1JlzDmBRtNXj7lS6ug1yqFORwn
	uFbOsXC/z6ZIpZIQoAX/GcftvXMLQen99/4ahos0hcCnXqPuY5+qc5ihM32i8zdc
	88OTq42pQJZWMsH1e4Hoo0RCa1O5az1pfMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaagecf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:15:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso972168a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873758; x=1794478558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
        b=SUcZgWkgyx3CAdh83tx8kQAf5Zd/7WHKxn/h7qUfJnIBAgMkBfZSKrSwRZfjjm4RXB
         8BTg7NE8y1EmRBEr3UjFW++kjZIuGINBKiEWthBKMYtSb/cwMWdpDF9ooJcdmk9KZPZc
         ideZQZjvxeTFleUoY72b3EuCOLDTVcK4Z9eLVNrlXiwrqvQVqf+NIKrhXH4trAxEfQvK
         9QKaNkz60so7IIQi95SQgr2XbbQHIEbMDQJT5kLo3zu3AB3mpbr2ELO8hfmMj8IEtLnN
         hQrO9KjVb9PwlQMltZ/lQsVbdT05ZyhPMjSvDye9k7CzabeCVZjqodmi1N50EzxDvB+d
         TgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873758; x=1794478558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
        b=09gG8hBubNv91xYJMDto+44z5kB/2/kK4+r70hkgZSX7BfY9LmiIFweTbz/Spskc69
         benkNvLtHMA9XHUsP8P0uF9DP/dfb6mVG32MybgONArXMkleygWoUCuwZwMenfixwJbU
         D9L05IkJa6BbdwarfX5jfDqkIB5HqgxeIBB3v0gmn6FsvxN+Jk9Js416qVmEo+zkd6W2
         UTBu/YxzER0Q2gwZxQNBQaiG7R8R06BcIPuKQgyHjQXgq5h/yvt5/xCQH2QsA33vvA+9
         GECUnODWlVw3NxG2xXMyFC90KlAZhqZ7+R6ukrs1UTrPuAUkkU826UE9sGRazKtK5MXB
         G4ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxqbTaKIVtFKODEzOD29PPYrjYtYDjLCpzb1xXu7ior9wKugMroPMyIxyNw85O/gGgacCnlbCm++VltRhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9btNv2rTTv3hV8Pby3fESpgyBgNoawPeK1y7ngzvCc+hiHm4+6
	oudk9/n8lMSvC15U17BdkTiBGGNG/RCDlFLphfMvcoFQrc+O9wyAIzdl3p2aGho0PtHBe8hAYmM
	+4GtcN7gjuFRKeaI+ng2/Q5Olry0DuDvE+Qgnsd2y9JuS6eEVGsClJbmKaEMsTw+Yw70=
X-Gm-Gg: AYBFou3x83Ude1T7E0LPPgroMMuLlb+0r21nFkmlRr33pwYev0tfeQxGbfSi1ydy6VS
	sxUwGd/gMqrszuJ5hhGaQSV4YLcAi28sq8C7isrNvEhOZKpuvLHa8VFl901R2t5C1ISc+WpKcVi
	eAHqe9dGcHcaZq1AQQQ7vgyG8YymfwyihWx6phCnVVnnUFGs7SW+pGejKwIVYDoT3EolChUwaeD
	E98U6x0nC0LRqwVh0PMFvP85WMISfbDbVo2OP5YMjUEAHhcGxXAL6MWQeaAt5z9JeFX+OrahTsz
	QhIiCyKJkEOr0d1RfQtCIBFelFcXDtm3LvMsrKfUhryDow0JXEnkqXJDfIT3MhAjBtRr3dA/2eN
	p1unYNc2uufh2yQAfiyjVbld4odVSlSDTg5pRUcVsO6p3OJHFzhnWFdnW9lChUH//Ik/pAJ9Pan
	GrzMfO42JFBBA=
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr13699080a91.48.1793873757930;
        Thu, 05 Nov 2026 02:15:57 -0800 (PST)
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr13699063a91.48.1793873757320;
        Thu, 05 Nov 2026 02:15:57 -0800 (PST)
Received: from QCOM-yK68p0sug9.qualcomm.com ([183.160.126.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b099189fb6sm4027532a91.2.2026.11.05.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:15:56 -0800 (PST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: mani@kernel.org, linux-pci@vger.kernel.org
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, krishna.chundru@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, deepti.jaggi@oss.qualcomm.com,
        yadu.mg@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH] PCI: qcom: Power on pwrctrl devices for firmware-managed hosts
Date: Thu,  5 Nov 2026 18:15:21 +0800
Message-ID: <20261105101521.434361-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX/G02/8cGuFK2
 0dv5Zrqd4FQi07ZK7SnbZ/z5LD6l0+TLVyYg2HwSDiAIHWtKk342o2odhS0UdCC+MNhcqNhQbvi
 dwmA0wzlzyw2rD1NLL4E5TYh7Ky7yNhH6YcU/+8ALDYbhUz/TwEBs4RBqlfmQoSNiSxkA/ZCh/x
 4LLuYlFDmHbQPY1DarhD4tS1DXbI7QLNLlsxWmI1dKiCIaxiy7174j3y8DxhFZiz/CnIEEPHkCt
 JoFCYxYZHh/lbhzfQZiB6eknpQNfAw6oFe82wa0jg7lvOSIXrtob+jfhcSGDL5vbdzgquEXJAKC
 zi07kCxVwCv151fVxCvTRic30ZRV+C9h6VoGJxCkml7cUuP4rJJlAl/33r/DkNL2JBMMFt0uzPb
 dAvvAIbZyAm+kFKGyVJYaFrPjxeh1ES5kEMovuSAhzrZ4nKZ54bEkNXxzQ0TKMw3KEvn/XO7p9C
 kCn1Bc2Oml2e6t1bV2A==
X-Proofpoint-GUID: 3PwULFVeSdetweeq80RiqwHK-lP4No-B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX6MXS7e+Uyyqo
 cGh5ROm855pyEQbnxRzZvaK98Qaj3rIOkZjhspHb1fJxKo2HsbTnLf+xNzQJXBZ9Tkhl89btEOB
 wQkxi+fQGFq2pRWrasacJmWJ7UUhFWM=
X-Proofpoint-ORIG-GUID: 3PwULFVeSdetweeq80RiqwHK-lP4No-B
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec575e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=cl6WQ9rKrKu23RIucH9P8w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CABk0tZIDWUp0Uuloh0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050040

commit b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power
on/off, destroy APIs") switched PCI pwrctrl users to explicit create and
power control APIs, but only added the calls to the regular DesignWare
host initialization path.

Firmware-managed hosts bypass that path and probe the ECAM host bridge
directly. Endpoints already powered by firmware, such as NVMe devices,
remain discoverable. Endpoints that rely on Linux pwrctrl and pwrseq,
such as WCN7850, remain powered off and cannot be discovered.

Create and power on pwrctrl devices before probing the host bridge, and
release them on errors.

Fixes: b921aa3f8deca ("PCI/pwrctrl: Switch to pwrctrl create, power on/off, destroy APIs")
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 0d56051b5de3..7313acd7e480 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2308,11 +2308,27 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
 
+		ret = pci_pwrctrl_create_devices(dev);
+		if (ret)
+			goto err_fw_pwrctrl_destroy;
+
+		ret = pci_pwrctrl_power_on_devices(dev);
+		if (ret)
+			goto err_fw_pwrctrl_destroy;
+
 		ret = pci_host_probe(bridge);
 		if (ret)
-			goto err_pm_runtime_put;
+			goto err_fw_pwrctrl_power_off;
 
 		return 0;
+
+err_fw_pwrctrl_power_off:
+		pci_pwrctrl_power_off_devices(dev);
+err_fw_pwrctrl_destroy:
+		if (ret != -EPROBE_DEFER)
+			pci_pwrctrl_destroy_devices(dev);
+
+		goto err_pm_runtime_put;
 	}
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
-- 
2.43.0

