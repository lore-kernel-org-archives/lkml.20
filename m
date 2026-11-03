Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702167;
	b=5HsiAh1fqFgCDdsJC9+piIR2o19CNzkRS0qBWRQVfAeE2NWCkEr4964gARW9cGDtFRWR
	 t46W0yUzn+jTyfmOooOnWAA66gRW3f6hjaEh4RMkOprLmGN1PgaVaWp2aWSmASsy/Rtpr
	 vhup84+p3fm/8NjcAOUWzTC3RkfaGlHmNNiX6nw3GlMduUB227DwUx92MgpukEgMoPIgW
	 GGQu6OUOVi+9/LKyv3kETi+8+vA6EDUllPqxZ26ZV2cqYKU0q6SvrQoKGSlWXi9Ok60Jb
	 7shS9hq2E+fqXqUh5CDu7LsDcMlITU+CqHPzidfS2TVkbTKgh7TTE8EXRQNUf+8NgwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
	b=at9omi01QXnEyTsC64Raneqe14MO5Z9yjdKSuxoMLXr69gFUImfuwrkFnSllvEq1cbz2
	 ZkeQjMAsUVkzfLiX5YffveXEiY1FFWH1Z0rzYOT6wvd8XcYcozFa8CujQ22l3X3unW1kg
	 Erj66XaOtPAmkPr9kes3yenrHUGhaIAVo3+DCDi0m7Un33kPyO2+PbmDorFC2ZlqnbEvz
	 JWSN91vdAASPEvL/EUD4mTHNOYo3XwU8oC29qiFEi1j0tZ1fs1UQpNVsY4nmfAkjOPYoo
	 zxOkM8W2QXJQNkluuJlseMVjJUjXITKdNLUHCEzHxUUrNuEr0Qq950OFgbljh8Dsu6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ec2W3F5R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJg9Gxm2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187756071535
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187756071535
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ec2W3F5R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJg9Gxm2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAXDE2201960
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=; b=Ec2W3F5RyrB1AN3+
	ezsFHivj/nmeOlonKuA10UKWUpVRGeqYisRkCVh0w767kEGA/V5CR4HXj4SSEkaM
	K6uLAc1I2SELy+HvSNhfDaRs5ru/BJuYcVeu+GQIco4HuMpSpGegnNAXYI33skF5
	78ZevwGfBpHwghw4ULbDtkf41/3UiQLqD5Ib323BsH4J0HsL9BmsAVyVfL9eqk02
	VFvrUMeOwZo8reIWbDNRV+vQanzrP9hPdKVFUCom4MzwHzm2RauH8fVziFcw2XrH
	Mlfkra2FLk88DMVMtxmpd/yxCWpvMwQofb+sq6UX2TI7uMh5c/QOg0IUadNWSpdd
	lniZxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3a3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:36:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so355930585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702165; x=1794306965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
        b=YJg9Gxm2mDAVNcRkBZ7Gkj4YcfcdheZ6H8+24sU+ag+rcrawWZv6HYtS8BNS3tzMKY
         9A+fFEbF8qR5DF20Fa32OBkGG8LoWdtxq3zUfKXvlERcBjLmn8E3i0yXLUkTu7dCIu3C
         qAVToP0P5FH/Aul3KHLTv6ICCdkgBSP15Y9RdaugvTv6tigkG5yQJyLkLUgv9h4LQmhJ
         o7F3/cu1x714By73e5Ynu7UUOzVUU6vHm0qKqEE3+v6MRYiT8PQVPThwzF2D8aSrrtV+
         jHoNA/MY8nNVKdveWGCXG7P8+6QfJKkYGCzU0tEx6buSBjCHB76wuz75VJVIAsi+gyUr
         8/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702165; x=1794306965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF0ZWdpj5Pv27R79H4400qc2xDr80hGmdAVzUXIJw4w=;
        b=ccyFd1oN3fDuo0S8ZQTWwDwER5HSHK2Q0E4d+VhncCbtDI/fTg+Yfn66IuaoAsw9X8
         SmAhBGVu5UZF/DxfSCUKoCIszLug2ay77ys4zm4Ns6im3mNYQzCaPPqB4uvrBl6HEP+0
         nHh0BlIyUqmef6a7O+VwmRQ5mYc0wpNIYWZLtXYnJpu6e6As2cdLawUH9AUlSmHap4TZ
         7O3N1J9a8GXA4afsdCWKn5rVohIo9v0TPpMTS+Vz8UP1SKw58Po/p+9XgNgFmogaMveg
         J8z9lXPnPA2UWyO9YjGalyzbwfCGo7RYfZsfCExVxc4vYlD5vQR9osjxthyLnaRtKmMp
         Bu7A==
X-Forwarded-Encrypted: i=1; AKwUvByA+7jlCeOwjnToNhpQDjg4I0MxB6zTBux1Upqi2UuU91og7cHJMIBaEWMkeJ3LBoz2Veag003FT7zrTnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A7tnIHgABpsHaOA/HGbWuhqwBq0aLxgRIC2+W5oooEWcwx5I8
	TG+vjA1Vk42vpe8wTsHG05QbjDJcaIXnBVxicwxS8DRbOB0Ep6nei6LAXjQ5ONuoORVkDpbt8bw
	/Jtf9Z9Iu4KhS/K/RyITmtjCK/Nm8hkLZsgzNXdoTe5ix5A2xsUzWZlTUNxvxnFD9WhDU4urudG
	M=
X-Gm-Gg: AYBFou0VMI7pUOpUKbkfaWkv4HOnrQOXAcK62LQJX6bBGnLPjud+9VFg6Clr4TTGFD3
	Sm3GLJydmd/wwk5Si9pdkrRKXF0ld/C2MWyX65zhbMcmuFB5izmMjC95lC5iCsWdNm3dc/0+dqZ
	lQPtvEb2i10BqAA4CeAHu1Mh4GC05AK91VJ1TFyrb/a3HGKQkAl+11b4g7BqOqU64LH6UO87r+0
	p2niu0dJW4YJCIXnMOGQ2Vo5jWjPjukQxc1JPKlL8IUPYd9MAppmPuR41fmtBAOWNz9PEkZKsf3
	xkdLW0PC10vOBX2tnucbnFxODR3lX+dAYVw08+2D9EyPiY8+/mrwhHCbLXLelTlULs6lodO6VIt
	wcoHoL19rFeT8tVRSOsz3XIEeaA53ftxzswCmzXSpRcw2AA9JLwj6NyzLcXxmMsWD3QoRhJJ1QN
	KA/A==
X-Received: by 2002:a05:620a:261a:b0:93f:32c5:69b0 with SMTP id af79cd13be357-94421778129mr1966768585a.60.1793702165193;
        Tue, 03 Nov 2026 02:36:05 -0800 (PST)
X-Received: by 2002:a05:620a:261a:b0:93f:32c5:69b0 with SMTP id af79cd13be357-94421778129mr1966766685a.60.1793702164689;
        Tue, 03 Nov 2026 02:36:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm55210015e9.1.2026.11.03.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:36:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:35:53 +0100
Subject: [PATCH v18 2/2] phy: qcom: add the SGMII SerDes PHY driver for
 SCMI systems
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
Message-Id: <20261103-sa8255p-eth-phy-v18-2-b00cc2fa0404@oss.qualcomm.com>
References: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
In-Reply-To: <20261103-sa8255p-eth-phy-v18-0-b00cc2fa0404@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5486;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=61whbJ6roe6jnMO29YpKZScWJ7Pcy+oOdtoc98Zj+oM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6bkOCsrgGZK5hRB/SuHx+7t/Xl4LqOwWHcWqd
 vyTyiiDIUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaum5DgAKCRAFnS7L/zaE
 w1PVD/0RMe5hYZbOrd8PyebzfNISPAVLFOoXfPpYKD1HPqGZVhlECZY5VIYAmxljdMEyVWB0/TL
 BU4gXFW5PjhjMM7ZUHVVPv41/BXTvrhR5/Hk3wYkT0heCA8s6vaoOIMdQGd2w8rq37dvxwy7fVH
 RZYvcEdGxJQXp7Jrcuc5MXoZ8nvGKlAyK2wYJ+eRb+7zHBt2yLhDLR28CJP5oXGsgavuNteQoPC
 hNeSbpoQy3gpwv6b30GEuUOsDz7C9TjQHYWlDlfH7tPxaqf+IdaxuEPI/7Aa+MtsmMZbRnTj8pB
 7CiG6NwUYg2X6w/Sq5YOQ4EL9tCDZfCnDqaeEb6Ve6hOvE0Nno9y+S6g4uQSIMxQwtBIJmk8gTA
 Amxjn8vlXdt74U1+FtoSZnv1r419c7rw/SKSJqGoohkDLXFvlsjpQJIhAcZ20L+uWQaTJhP7+JL
 cge2JWPpv1wYncX+i4MMvdQLIB1sE8bTLBM9f+WvzfRZam5BPIPkD3wGe6SSGxDw6I1+ONtVgK4
 ER2kZUHCa3aD9gOsp+Tru7WQhSKZYta1FAnsOHTVFoxZVVZJRP2wxWBaouZR2LV+9D9Wu4cvM+T
 GEExXhjP7LeKOLL8So7J5xuVGYw70y5F/nQbU9lRa0Rs6xDlb7nc4i1tL55g2P4xbRgJPBIc2Jj
 VIqc/UeVH8j5yOw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: W4b57Z3NEU5753VxNHU3EZJKGrA_MoqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXw6f6eo9Sg/uz
 iYh4G9RWCh5zLe2Mn+l+df+VptawJ9qhekwDS47X9fpchcTsir1LxTkWGAu3wsWVPMcfwV0ghLz
 HCWpxyCN7Msam/9ciIknwsEjqsiLYBpZdFlVNweMH4yI6G50Dmc5ASh+tLRkPU90Sk4kioK2BhW
 ajAAlk2xq0YiETfcpnVbcoUicPeslkfmWVFmvcFfphHAXwdQykVwkJKdxYZqU6KPGyMPYVucGxY
 ytuEZoJEfXau99XwQH2aAM5jKT5dVe5nO7AO8SA2MrOu49fJ8K1St/jDdPfoTyhIUVUVwecGwnE
 s9UN6WUF+7FVPyXPiBMahKcwZCKKae0S6ZotOZlYw1xQqn0h//WwssDPL54B6rcEXz8l4BpEC+c
 5Cd2FnBrhA5WuQKiQRd2lcL5sIc63w+PsHOKcHy/S5lleV6WwwlP2JE18Al4Fw5HN8P7tTuhsYQ
 WitzcgfOum5+QLq0QPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfX/ieZ/M0wUNcb
 N1EItOUn6PFeOFoUfEEHUTx9jujQYaAO8EjfgKOgWXHQMD3SXun7i4bgzJ/rWdvB3vFXKww0djc
 aRb6ltClzEYE4K5HhuCkR26khVC0J3w=
X-Proofpoint-GUID: W4b57Z3NEU5753VxNHU3EZJKGrA_MoqU
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9b915 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hTw9fJJfFBl441PWpkgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code. The OPP table is added by
the SCMI DVFS perf power domain driver after being fetched from the
firmware.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 113 +++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 44a805361e35d..2486720b9ffc8 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -260,3 +260,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on PM_GENERIC_DOMAINS
+	depends on PM_OPP
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 4b5e6640a6faa..41f192c9f4182 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000..81bed5702bc17
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int level;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	level = (submode == PHY_INTERFACE_MODE_2500BASEX) ? SPEED_2500 : SPEED_1000;
+
+	return dev_pm_opp_set_level(dev, level);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_drop_level(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_opp_set_opp(dev, NULL);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	ret = dev_pm_opp_get_opp_count(dev);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -ENODEV,
+				     "no performance levels available\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_drop_level, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3

