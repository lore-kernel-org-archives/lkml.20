Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472447;
	b=v8cwtYin1/Xad2YuQm+HYDwCN0JANEVR/JTWSjlGRRsrSDwT9oS68Llt8D6DpljOG00x
	 l+4cennNg5JLY8Xu1QhhjSAKMQLYZ5Hz5sVMY8B6+mkMpGZaztazBfP/hok6NViku+hip
	 z78PgV2P7uFAxxa2DWN9fOENjTu+v2nIoxrnUPRX3HJNp3Gs+bKM2zAcQ+bBTXQjZyUV1
	 X88PX6icGPrHebU60CYtESZzrWU7wBha2NZnsQnJNrC2AmoLaE6TcQXlrsNnbJUp6iIgO
	 YH23Dl/lYFDbJ9kBZODc6X1wbnzpTSr2Z9+1j7QgIPKhXCw7HcxN3k3uu8hRo2iuW7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472447;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
	b=NhxfUQkZ3BZfNom1hataTOVytuV37NwWtrZLq3NyUlPN8ZwxutMfDvMXwy6uGSrws3o4
	 qbggmTY1ho1OBO8KAuOitBbZoKW59fASm9pnGUk4e9CFwrBQwObeHnaYU8nCmWTnCvwpV
	 b4MEMVQWo3z6hA9/FCUDnTq4yJ8iIlVIZ8c3wj4RLZsivj3tQJGBkrHJGCyzLMcP58GYZ
	 nLmRX5yP4qL1sRLxBMQLvKQ+VPv/pxk6EqPNWkUqGuxV/gGVhzQFWe5bJaHPnj3yqD5DM
	 Gn1ShLR4yjEq2WmdNFotPYQceefE94BZRoOfXLjKy12UtWMh0yzm7m+Ikhtd5PD/BZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Uh4ZYP/d";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754560A261B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7754560A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTXSISnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh4ZYP/d
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZZJD2514210
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRP
	WG+4Um8c=; b=LTXSISnD2o29P/Ymftsq5P9ISlcV2UZZa3dUIrogaFsG6fK8yk1
	7fI9xFKg55kb1Jop+i18dbSwbFvRZdaGqeBdTta1ArDT0BspNlwoeSQ85T2uwNwl
	Jk7Mhljz29L6/3cIrPTnb8/BUJ9Dg58lHZzYUM5FuzH126RD8+efgfV18vzSJQdc
	Ft2Vdwk75XawrOlBSeu5iEjYMx6h11EVRMGzlqLEWFlSVgwU0YBRDT1plZIauIcT
	zsP7Ps9ii4k1RHUSRMH+Z//o7jFbUCeRJmiQMdhhjM/gXQR6uyDmoMYpr4yzlIxb
	M82zRNSFQzOpWfnE0jo+o8qzKlwELmfr85w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1tq3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdab8a72e2dso159510a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472446; x=1795077246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=Uh4ZYP/dw65r95/KGsFsQwrtbvyghA3vs56A0kWWWqcgd0lBP37JF1KgiO1Cfpbs8N
         lrVhpCVV5skaYk7J96Q/6MQBa1aCQAj8JEBJXm0WXTOWY4VFAnWIvNJf0Iq2cQ0oTwD7
         mXQqHL5egItEZKE6BGXGfjLQJ9tASKIoBVd/Xv0CKqJsVDpzJp1wHso+IvrpHJE0mfgz
         8GzohC8DHUQ0VMDxXpt92r5xrtv7MRoE/QnfFft6QnziNcFuY7Dv+TNQl7eGQFof5X+z
         mw1RewSCBn+3znOEVUZSIa/+IF9vGA8HyvDTmuFQzgDFNox+nTUDmEEEpg/hA0TUtH0B
         OkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472446; x=1795077246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA2MLM/kSRhbbemzPOhXyM8O6zmbUZeLkRPWG+4Um8c=;
        b=kBnxV0FHtVyTONfXiZ79MiSsXptAp4Rt+aYMleMlR5/B6x2/6rYISpJaPgNWZnLZ4D
         MhqlxernhXGBIIKkis9mdLRyioBUZ+qLTl6S0goS4G8NA+fl2aWiKUDtlnYGgWmmMdCt
         myX3VsCcNzBLnTs7zfLr7ciPBdRLSaACM0ChTReom1GvDuDYAjujepeV1Uouww+KVJ52
         L2IXofBqieaOE6wbJp7/7PARsCI9r4bvnq894Kbg1k3VSLbtSYWLygIvRBoIlXehQCi3
         vKHqL7d0QRKIco18U69OdsfyEc+fYeb5FRquzLXz0L/890j4yVOfrwbOPGyGNdnxWP4J
         znNw==
X-Forwarded-Encrypted: i=1; AL+hErGaJM2NRyxiWgBAXgZss4v/o2giPeJ4pmtey8ZKrUpAnaL1QoVz9/fAM5/+PH+p7CqQbVER1x3tk0LHkPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h7X8kNoHgBAhmpI24CRR7Ys1uIpxI1+vnRlL0QBEwCvlmU3rj
	jyKIxIthEFcNqtuaK0HHgdqlSzdUHfrYKKg8Q3Ft1Zn5So9TZnybDxyibvk756lYQLwv6G61364
	gVqO0ambG29HSpJ/y9ITBOHo82iW2CXZWvZtDb+eSPkDgKw2+kCODl+WmYXue0p1tOgM=
X-Gm-Gg: AYBFou1dSOFBqEEkg91BeOAqXHfQIJ4zgKMZutu3wEXr5uIpZ890yFcKDlTCKCuVd6S
	NTypjOisQb12OBqNvdAHPXnqPZ0ysYF18qIDh11GVwHtmhiaxDtKOwxpgGApgm5eBEhEfoF4KSt
	IySCVIzIJ5IowhoEc1MZGWQWFaLCVSUGC4C6p8moqXgFTqKf5JaJ1Rl4h+pB+uOwckiAMvwmhhU
	d04+rjremmDmpmVimqFlLfyLTP99+XNkooBC88ehI7gz5OnJIXoJljxvOwL4Rw3lRJPL5XlsqC+
	cMAr5Kr++rxPoi/Gj1Zvn0u78NjgObo2o8fHAuwok28vrxSTTsNqye9RDKeUw4wMGR5SkM6vYRR
	OBNqE5VaBOrDLncHglkTuPDX+7tfQ1z6Zfw2YV+jgGDreIFSggpfMy8NYj9QeltYjet7xOfLHp0
	Sf3g==
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80863365ad.2.1794472446154;
        Thu, 12 Nov 2026 00:34:06 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2ed:630:40ac with SMTP id d9443c01a7336-2edd7751683mr80862985ad.2.1794472445681;
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:05 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v5 0/4] PCI: qcom: add Shikra PCIe and M.2 Wi-Fi/BT support
Date: Thu, 12 Nov 2026 16:33:51 +0800
Message-ID: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af579fe cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=f2qYStR2zr0EFXCAC4wA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: jQZVHpS-eUj4QyovISQUN4rvUWJckM9Y
X-Proofpoint-ORIG-GUID: jQZVHpS-eUj4QyovISQUN4rvUWJckM9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX7A+50+dix6uU
 5Ig08yAdDKkkakS+wLCrMsy2rkkNxZj1zrx35m0BzMCssg3QUyjdc3tWV+gg0874rIMOMw99Oql
 FzBkrrINett//3WRIDZ9BBl0VW2cUKfpsf+C0hCB75lpFoQIPVLa/TKok/9UuF4Y90Fy3j9zhfG
 2pGgIVNZL0Y+mbcMfgiz+G01tnao76Gias2xIbR4WZhnHAvO8Uh1rKiOWRSyonUtF5e9kuWcIL+
 yVKMp1VeWtWvpukOjk4QJVbJ5F/K58AJMdulfOtC3UXxVqYK480uIyYm8N+3M+m+zmxtIpCIvcs
 pyQUGLfbLLQLSrCZMxYNjazznth/Fq47SP5OOMEXSV6enG2L+13UFr3HEuHSGIn2B0JAw1fjgzA
 fEa6ux9bnq3aU4NUYX5CHEVwIDUQGLBH8N0ZRbwPTqvN9wivfR/vvhDAwDHNDCTvxpSqP4rQv0E
 iMRk/5UDyo8AICXeHig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX++AYUrMxz9dx
 JpDT3gbLVK7JesbJrLNcBEXDl1UK7WOd5nPVRyLMsapJG8wscgGnzPUKa5p2MdSr1gjmeMkBUxU
 JPRwIfVMAM7XtyiHUvQNENjwKAgHH7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Add PCIe controller support for the Qualcomm Shikra platform and an
overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Shikra IQS EVK.

The previous overlay revisions depended on PCIe controller and device
tree changes that were only present in the Qualcomm downstream kernel.
Include the required PCIe binding, driver match data and controller/PHY
nodes so the overlay can be reviewed and built against linux-next.

The overlay describes the board variant where hardware rework selects
the M.2 connectivity path instead of the onboard WCN3988 path.

The series has been validated on Shikra hardware.

Changes in v5:
- Rebase the series onto linux-next next-20261111.
- Include the Shikra PCIe binding, driver and DTS prerequisites.
- Make the overlay self-contained on the upstream Shikra device tree.
- Build and validate the base DTB, DTBO and composite DTB.
- Start a new review thread instead of replying to an older revision.

Changes in v4:
- Build a composite DTB to validate that the overlay applies to the base DTB.
- Explain that the product design does not operate the onboard and M.2
  connectivity paths simultaneously.
- Report Bluetooth UART and HCI validation.

Linghui Wu (1):
  arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay

Sushrut Shree Trivedi (3):
  dt-bindings: PCI: qcom: document the Shikra PCIe controller
  PCI: qcom: add support for the Shikra PCIe controller
  arm64: dts: qcom: shikra: add PCIe PHY and controller nodes

 .../devicetree/bindings/arm/qcom-soc.yaml     |   1 +
 .../bindings/pci/qcom,pcie-shikra.yaml        | 192 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 122 +++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 158 ++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 6 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-shikra.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso


base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.43.0
