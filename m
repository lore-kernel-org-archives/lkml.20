Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5F284690
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787999772; cv=none; b=psGnkbn4REjfeH7uaL5Cgtzr1SZUYVNxmjix30ZXbLJgUwJom+Yazpi3ARcYV7t3Bu7iGGfmTZ44cQHpb+uOq5fgYGHrjOT1rVU7oxu+leWmvgoN1fJApMOWU99by6Tru7AUCawieDUoRdiWCbEdWRDsINBa0oEHioXXXY9xhUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787999772; c=relaxed/simple;
	bh=KWNj1tfhDTMqgvVWCVcDzYwwxCOrZo/4oWyTTfhVVBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EobjavmNBdCHWjFrjypJdvnX4yoJ/0Dh3+vKvSWRjd/CzXge3rJnLKYB6YfF5FxXeTtVSbnp8R8di7j8uBB6+WBW/xO6G2iI6MPf8CVghL5M9p22ga2g1g9wl3R/qkjfuFeSDXKcQ1Dt7kBhwLGDXpGao2locoFw+zIHP9dTQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKtNDNDQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKtG1sIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKtNDNDQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKtG1sIW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T80OA11355953
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r7oh96XdqBR/wkUfzzw8xK
	GlhF6rxacfqe1Jd7qHA/g=; b=gKtNDNDQiFM3QvU486/S4ZSxmYiTf95ELX3CU3
	CN8fTzikSNC3WH2KShymVmlzb342l30MRa3wZnSqvmac+KcnYzX3xG9xg1qW1Nvc
	zTyCKDe8/OpxrpiHkz6lgBd9hEPOPdHTEw/9hVaswIRa1v5gFXni9OBV7nnMhYyg
	vN7cNxA9JnSTq2l/mZ2WX0gvzUlUeYCisxKJ40MCePccvNVlAomHcuOoFhVmTV2v
	cz5hvO3dnCDwRB70jyTZNgf6tmrFs8SHMPTJ4EBBil3GLAoQfnnYQouecuc64M4X
	hAhotTGI6IXGkFujOBHAUY/2E6e4/GZXxnL4Uf7wF4wFRYjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw8qxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:36:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa5c5a4a6so42472131cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787999769; x=1788604569; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7oh96XdqBR/wkUfzzw8xKGlhF6rxacfqe1Jd7qHA/g=;
        b=RKtG1sIWnMCru5V7uAnaf5t5R051VbKkLbEcnQttwP5A3qzoQYN4tClaR0BUFltHAh
         bRmAe/VqSJgprZdZsrT5T1hc9125/8XIWYpgsR9aFVD1KfU9hs7RfrJqQyJai13G9GYm
         /JW+qgVDQOIuPfEPSFAbzRWpglQnj4HufCA/gELixM/UdU7aaUzFBwQc7DzQJOTHlhDf
         ISV1FluTNUinRnQiTJSmWAGIkUuBehGFuP/hBCDWQ4LyS4FmbbZfnEeRP0t7JOeo/7nj
         +2HGp+KKapE7pZdaK/OwM/OrW3rk6UyM9qXsg+yBSzDE6x16uTjTZbogKEswfQRZJfsU
         gVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787999769; x=1788604569;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r7oh96XdqBR/wkUfzzw8xKGlhF6rxacfqe1Jd7qHA/g=;
        b=dgCibMXxv4Mhx9KqkPstVqOs8DSMkrdUfEUbqYbAJdl1VL1oineqtRuFU1C3p9edtc
         Ig0oyLGTpvD4TJmpxIG3RhdfQVNFJ2vZxYvUvz2T5tQBzoPSed1D8jSFHPwC6ifTIWc+
         TElFjqvGVE/i7jZtpZ5F5AjXVFV1E4e9hy+Tn6E5/YCClJ/nhaZE6LKRnRcaMS3AHiV2
         zZYpbXCwgvZoc5H0N2vQYL4NFMUj1VG1Rih8n2Tf+T99FIecEoZ2m0U7lppHtzP+nSfk
         JmVV082GSVPvMgZxotOxCxR+V+XBQ7A2bPuVoHIaDRlY6L4+nwAWGhEdan0YGaj5CUex
         RsqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiZA89+Ph5ImxXY+8zT0f8fRjuqT+EI3pslgjpctq9JIeah/W6NAh2qsH59x6t3Vnf6frApS2wQn8SW+A=@vger.kernel.org
X-Gm-Message-State: AFuF++kBt8CZpU3//7MjnTdQpowm96moPE+CiPskuL3Xa76AkTt2Omcf
	W+s8F5iSptneJvQMsO+DIO6XnDdRgWRacRyu8/J09W0P2AkrQj06/SZ6O+zXFK46HFq7Ac3QEaw
	7g5E0CeskJkkLClSH3ldZR/IcxcPfBOGxsQz4CJLYr309m2l+EU0nCJB0tQrljhue0tZTNbRtbu
	I=
X-Gm-Gg: AR+sD11L3S/K3ZLzWjuoIXKbAaJLv1Ec4nWiwNMsX8pC1EcIkEKtKavlmJaanbxbKTJ
	dE4ot5MLz7Znwt/VmU1ktfB1SHTf4gIYYyHq8WV+nTCAOH3kIvFX7OB8ZDWXEZggYoYa9WZgxwu
	NK65ilcKCRoxMQE4kQ8jHcwgg4ns6gZufwX7dZKj8Osa6k6W7/XD+yNMn4xOqVojXY0IgxU0ruY
	ALvZK+dqrdbZGoRr92m5uAWkuTGQDXSUpXXXXqn/hXbqUAntnxfPx6ki5S1dUujX1+8p85LZQ/L
	uL5PPoX5n5YypR0oIwfXxlo7YpjPzImkSBcb0WWsSrii8o6lDRaXY/OZED8/J3yViahjjzo8m5E
	JrwpHI/vuRA==
X-Received: by 2002:ac8:5996:0:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52fb93746acmr150357041cf.2.1787999768646;
        Sat, 29 Aug 2026 03:36:08 -0700 (PDT)
X-Received: by 2002:ac8:5996:0:b0:51c:1a17:eba0 with SMTP id d75a77b69052e-52fb93746acmr150356591cf.2.1787999768217;
        Sat, 29 Aug 2026 03:36:08 -0700 (PDT)
Received: from localhost ([86.149.41.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a8e0657sm90067615e9.13.2026.08.29.03.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 03:36:07 -0700 (PDT)
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 11:36:00 +0100
Subject: [PATCH] PCI: qcom: Only check bridge nodes for PERST# GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-wip-obbardc-drivers-pcie-qcom-rb3gen2-usb-fix-v1-1-337821131a99@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CMAxE0atUXmOpDSoqXAWxSBy3GIkk2LQgV
 b07AZZvFvNXMFZhg1OzgvIiJjlVdLsG6OrTxCixGlzrDu3gjviSgjkEr5EwqiyshoWE8UH5jhr
 2EyeHswUc5Y089n1HRK0fItTPolznX+98+dvmcGN6fiOwbR/pwnzDkQAAAA==
X-Change-ID: 20260829-wip-obbardc-drivers-pcie-qcom-rb3gen2-usb-fix-ef551ccc0a8d
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4029;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=KWNj1tfhDTMqgvVWCVcDzYwwxCOrZo/4oWyTTfhVVBU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqkrYSRy//TWaaxaBgax4wdgFGhAlpr5Z6miRlk
 UsqTcT1FnCJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCapK2EgAKCRBjTcTwaHBG
 +HZ+EACUqmFwJpJnfmXBxaTOcOdqgz37aXn1EK0RqFpeVGuIJfk35AJjhVB5gu+YEt3eC94PI2X
 XfqeKzjSI17X3VLYgG+g8k8+WkFhuWp9IH9JLeOnkACprcSJgzwe/hRSHlXKvArWDGZiOI/KZMG
 TS42frVUq9vWpBpAEZFwkqaQAXdRjaxdfiHqvmuUDESXFu+YPnmVWnphtm9/CnNihP+lD0+FoZQ
 uNZLZIrfcMqGuk4JeQjt24NB6OagLfnr9L65Nbkj59zKaE4u4xeZ+x7aMsF0AUma6JAZKSkxXsQ
 M5k7mfYTkLnw5a4c2Pr/e+uwbGmo2xc13Od1xH03ExD+0vr8km5s7+kCmAOyMbGwdZsnf15JUqJ
 XLc7l8wirgBK8vspDjpm2cWb8FyrnrUSn87+uqaRSpbEC/S1Kncg8wrlMYLNoi5fgKPJABSPfq8
 vh/IehzxdeWu9KpbOibuGGDyMw36BJTzpvgp660K/ogzHbwQ5Ry75YgjN79XOVSZM+Wt4x2G4CK
 +CH+QmzO9Jv60cvRA6GY9JgRevf7aA6E99dIXyriKobtx7/UxHMWWo7NKts+lWQzKmCoJe0w600
 i7vx79Jh+TtqTy90wretWSvozDwstMeQU+CQILxpcRkKBtCFp1skkmo4SgmG44WCHPaXwa9FIkL
 +KuhPbkfdLqaI0Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: jp-o41BVmd9nEFdHisIU0EkasblpMYAa
X-Proofpoint-ORIG-GUID: jp-o41BVmd9nEFdHisIU0EkasblpMYAa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA5MCBTYWx0ZWRfXzVL9ujyoZgVt
 w4PTZkFcXezblNEvJ1lcsmhPHzFUMSqWX6F6pQLNdbJBManbuQZo0/vQkqyEZnhJAmltv5lkxgM
 Vmc0r1PymttXGLW7BrvuiMwyOylZPlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA5MCBTYWx0ZWRfX2I5WjMuLGODs
 Trx5T5zeFOBHKb0ww8Q/MClnfYqgbcnxb05ca/McSB35oxEsrVA6eOYzXIfqVh5Skc5+if6/2yM
 j1h/nqATxazbRx+v7SRZrPdFA17BAv0tj+xz/+exnTlzSzGFL26ERpxg73yjmdTxgK9G/ONLj9L
 v4+5GI3C5CXtpXDzpPywAXDbHUJjsoPg0H3ELoj8M3eklei4ZmV0ITVq3m0m3PFwBg1UX1At6e9
 DjdAuQ0fU5DyK5TYZQjhYiXiR187S3Qa3ZQMGPC0ZARO1cPt4//dopEsNlHa/CqFTEveuv0Hj6j
 MJrD/Zy1dJJxe6P9lQJypkiPNi0FwIsO47K4f3RF1MJREjVWjYHIJjZns7GS1xacnsTjwZZrcMg
 G1Fi0qsY6YpnZEo3mfvu2LXqBuN2uxbu8stWJPwdfIDM9xzd54bXpus4bwy1qns0BOFp7mya+6Y
 tsArnxM8e13GPLkfEPQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a92b619 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1ZqYAqmp+mGnO5v9BrvPnw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FVExEZwIv0vllHUD6gcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290090

qcom_pcie_parse_perst() walks the PCIe hierarchy described in the device
tree below its root port and collects the PERST# GPIOs from each bridge
node so all PERST# lines can be driven in unison during controller
bring-up, reset and power sequencing.

However, the recursive device tree walk currently visits every available
child node without checking that it is a PCI bridge. This allows the walk
to leave the PCI hierarchy and collect reset lines from children of PCI
enfpoitn nodes, where those reset lines belong to other drivers.

This is reproducible on the Qualcomm RB3Gen2, where a Renesas uPD720201
USB host controller sits behind a PCIe switch downstream port. A Genesys
GL3590 USB hub connected to that controller is described as a child of
the PCI endpoint:

	pcie@2,0 {
		device_type = "pci";

		usb-controller@0,0 {
			compatible = "pci1912,0014";

			hub@1 {
				compatible = "usb5e3,610";
				reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
			};
		};
	};

The USB controller is a PCI endpoint, and not a bridge, but the PERST#
walk descends through it and incorrectly claims the hub's reset GPIO:

	$ gpioinfo
	line 162: unnamed output consumer=PERST#

As a result, the onboard-usb-dev driver cannot acquire its reset GPIO
during probe:

	onboard-usb-dev 1c08000.pcie:...:usb-controller@0,0:hub@1: \
	  error -EBUSY: failed to get reset GPIO
	onboard-usb-dev 1c08000.pcie:...:usb-controller@0,0:hub@1: \
	  probe with driver onboard-usb-dev failed with error -16

The GPIO is also added to the root port's PERST# list and is asserted
and deasserted as part of PCIe reset sequencing. On the RB3Gen2 this
causes the USB hub to repeatedly re-enumerate:

	[  116.479598] hub 2-1:1.0: USB hub found
	[  116.488601] hub 2-1:1.0: USB hub found
	[  116.496971] hub 2-1:1.0: USB hub found
	...

This disrupts the hub and devices connected to it.

Restrict the recursive walk to children with device_type "pci", so
PERST# GPIOs are collected only from PCI bridge nodes and the walk
does not descend through endpoints.

qocm_pcie_parse_ports() has made the same distinction since
commit 45df22935bdc ("PCI: qcom: Restrict port parsing only to PCIe
bridge child nodes"), but the PERST# walk added later did not carry over
that check.

This bug is distinct from commit 3edb3a038d42 ("PCI: qcom: Skip PERST#
GPIOs provided by downstream PCIe devices"), which filters PERST# GPIOs
based on their provider. Here the GPIO is provided by the SoC TLMM; the
bug is that reset-gpios is consumed from a non-bridge node at all.

Fixes: 2fd60a2edb83 ("PCI: qcom: Parse PERST# from all PCIe bridge nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
USB/Ethernet issue on RB3Gen2.
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..89a476c37098 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1953,7 +1953,7 @@ static bool qcom_pcie_is_child_node(struct device *dev,
 	return false;
 }
 
-/* Parse PERST# from all nodes in depth first manner starting from @np */
+/* Collect PERST# GPIOs from PCI bridge nodes depth-first, starting at @np */
 static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 				 struct qcom_pcie_port *port,
 				 struct device_node *np)
@@ -2019,6 +2019,9 @@ static int qcom_pcie_parse_perst(struct qcom_pcie *pcie,
 
 parse_child_node:
 	for_each_available_child_of_node_scoped(np, child) {
+		if (!of_node_is_type(child, "pci"))
+			continue;
+
 		ret = qcom_pcie_parse_perst(pcie, port, child);
 		if (ret)
 			return ret;

---
base-commit: 570f7e331f5febb30f1384817463c7e42b65ca7d
change-id: 20260829-wip-obbardc-drivers-pcie-qcom-rb3gen2-usb-fix-ef551ccc0a8d

Best regards,
--  
Christopher Obbard <chris.obbard@oss.qualcomm.com>

