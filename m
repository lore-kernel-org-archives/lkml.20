Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829461;
	b=MHDEnXMV3ZdbBpbU7C0SenQ7FTPcf3Q6YRMUjoYB0hN/mmd2Wx1OWWcq4WNuDmxTmh2V
	 2szPDj92/R7YQ9CMsXa2xp4eehy6v/Cw3TI1h6HOKvgYsPIQDrUCnoKtTCi4d/xiO1trh
	 wHailAGAH+E1Kc+0UR1VVYO9SBRYIEAG2xOIXjvxFvqRuWZZv8Nx+HqHmLBFaXZKFR7+f
	 w5xQSmnSDy7T071JXJjgJGvE9zNBRuY6PBVTQElYp13Q7iNrvT10UBCuUAturi2ctfctV
	 LezyzZ+RkoPurzhjSB2iFZYru2LbggaZ/DX/EHROT1Q0u6nwsYaqCWBzvVKz0Ubhrpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
	b=2JsjJXXRMxc3Oi7c7MqJ14h9VQ/PHuxCjfXnrAmbuoibXP6wG1aWgVWrc/ftxXkPhQ/R
	 hg2S1rk3Oi1uvQ2/cebMfJzCunqxjHarZBcxULNbmlVIX7qWcGl1fMD1ZaGSpbU9KaGlR
	 RuPRD4tCyjIJUUWOvNFMC3pzkyj5OrNQRNZAfitppMu5aU2z7veTx7fLydqEQd04yQ6Bz
	 DtMBMOrmNFXvaHfunNW/zNpQE2oJ2pWg1tiIN5zUME7KkxYxbrWLa1tVyNCVtWIT0TQ4f
	 uTV2dU+qT9W8F3sIXKa+LJJ5gPltgakcbpz19hZD2teb3i6HOg8UYANrm/s2cnSGfww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dol/fOlm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB86606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dol/fOlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fEZFj6Vl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLYRo1016218
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/
	W8WvJjKw=; b=Dol/fOlmqtFTlwG38Eoj03cAsBANyF3zU5yerqX8RZU/ISPd2o9
	+eLzOTaY0AzeLgQ1vksuOPfpd5ac6ZFM8ffWXYeUVcd2/QIftE205P/Uz47z0jDD
	8hsGAn0NQEbPa0IW5q0fHsX6XQARAaqVlyEFfn9lxaPugACT3oVpYfBLRDte/ssF
	flfX4IvuEAmHhz4O0Ch6d+/LbylQTbkZ1Se1hLI410oqVopwwidguyKrStI4kBA4
	QVBfHv6MoOiVmzP28U8GtwhVAD+MuWmw2VXn89W2NqXJZSdaoKc0X6md2shkG7qc
	C+tGtDdMJcu9/Lim9K6TKaG6EY9OSEyVnuQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g98k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:44:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4052888eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829459; x=1795434259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=fEZFj6VlLBDG3NefQ6ZJEC/X8f9ZlkmiknefqJn/39PVzu18+xAyPesTvneGbCsSuN
         ABJEf5ugs4MLj5UD5ps+axU/pJwaCw0hnfzuHLMxnZ45JaiAeX0D3m5bDGRPmhGYO1Pw
         npD9ztDSKZfFWKzN/UnfE8EtCpHGwZWJuoBBT28aNSTh0KHWmf3lOFGEbArJ5g/Y0xsD
         3nPSAGcF/OLRd09/wScbBVctsEdnDcS+/WjPiysgFkMBnHznjElmnaQnSRxJ4SYBXxZl
         N74q6RHTsMBNn7EcShDkK4cXMuNhqPRNhHZ7/JayFFmczrBJcs7RiqfpGq4PWkIeoJp2
         GeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829459; x=1795434259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LsuRMF8I3UTLsNP00lfbzXKTPj+7G1u/hh/W8WvJjKw=;
        b=vtnCkKatiuvd5OIVQ4XeOjxBFldZaHt4s1P7S79gtES3etCafILUu9uQ8A46d9Gwpd
         TtAPBu3M42HWcZijtU989BtNZEQwsxquSuzLAgfIzKymxm+ZbNivFgOOJfDywL49+5ra
         rivUxEzR/SF7VSUi5rQBzIo6/hmH4AE9ilbmIUGQj/ipubwMFhldwVDtvlnhdCuBT6Iw
         IatM7oSDNKHtY2YUZFtrapL2f8D+R/PRJmDxq5Ul3Yvs7r8gARITkuwnnXbSXGWywBrS
         EToVClfMkbnnXMMRpVV4Hj43/AWn9qElxmUSWp3X0Ko0GcACLQHt+C0qUunvLIxB15UL
         Pwrg==
X-Gm-Message-State: APuU4Z+cfvdshz1JiPnuk3URNBIp3cDLgis3vR6RgtdpddSMGUKGes61
	WD6/f+95KISo/hGXDO6HqINISvbAumMOptSc1ClhHOjtv04oSfxeTNgkVTHklUtIQOYjNa8hdtC
	wa9n3aMsZRyiW+XNatK0fimk75jJkGOJ01k8DmmqNaY0EYn1i7JQy9xT+ymkknt/1CbY=
X-Gm-Gg: AYBFou3dCGJ2FB5WGcRmS9u9KSaNScJ0OEFO+OwKbskSY6InZ+u/UHEBfAaEh+Isr24
	JoEFU+LCps+UQ8jDZ26C2a7xTfxuPf046g4+eoH5eDA6sh3d/ft2U5xrl+gIy8FcHybArQS6HOt
	ZpONgjrTGbJnm0befxBiTFX7A6a1R9i9ct2ROefV79PnTEEMHARubukI8y3zKLmIpVPVt++S2Si
	5Wfa/w0mP2D91EXhSY0pPXuUpZw8K4b/6Qvw5WAXw7uut5QHcNufaRVNFl9m7WQd4JJ82cpXrQH
	/VD5w/LSb7Yn6Jxap+yxns10zhRPJXcAJeRJfFDA8euR5xI+xlO7RNcW60cB4XPRqZWlmk0KeBh
	RfZw9oap74xvIHCTGaHq1g32ifczkOxR+OoOZHnmr5Uo1EE9RVskLtYokya7SFrwE7OpY8+YQoJ
	cAyQ==
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323753eec.11.1794829458538;
        Mon, 16 Nov 2026 03:44:18 -0800 (PST)
X-Received: by 2002:a05:693c:8806:10b0:370:121a:b2f with SMTP id 5a478bee46e88-37965f9dce1mr10323717eec.11.1794829457576;
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm45612670eec.19.2026.11.16.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:44:17 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:13:09 +0530
Message-ID: <20261116114411.1700153-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-GUID: sfqVZNJECTtJ2fdRq7voEzN2MBGeUVZT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX9p13mb89GK0n
 FvqJ24zULXij2bVszeXXV/MTqeIPTnZGOAtprEKtMGIPDAEsN3tJC6K0znzTY0ps7b3wazAjHta
 XcjiyZfa7RS44mYGbK+Bz5HCgiXc+6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX/gB5AtsWFTEb
 B7KCMhlD2g0tFIyDYHPw9Dkv2OSKzNZTj8rRjljZyAVpsY+skwRRnbGGBSwE5SMmPEJnYs4qXUR
 RMk757d/+25jx5TjvyE7mxu19M3Pp2R7B7PfZQZ2wRCkFdXcaytTRBjuwkShig1J7caYY7kCQxo
 9AcqcHtUsdGX2OiWUgMEqej0du0M9F2PGEzH/CoA4YcM2jq0IAUhH3AGxETndK42lQSRaqvGk6W
 qCviaI0jT5rzywe34Iflm4ZcB46b36V5K+mEIkO9tddv2yqUhjZi6m0sQQ/ijHxnbE7OZH/s3fu
 0wRK5y4uMmuETFwqHfUudOEBaM/368B3ZNflPfdHWgIGWYCabDLcwEXb1cYxlnqvr0pEu3G+V3v
 QZ80KcWnipJBm+JK4Z55y9XlF/+qrorR5+b6tqrbgOujOyKaeQbhtTYyD67VmK3DekucBwhvX07
 MlGi4YOrTXRj6U/cPkg==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaec93 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DSWJuU78OHK9oOt2xpEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sfqVZNJECTtJ2fdRq7voEzN2MBGeUVZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160046

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

