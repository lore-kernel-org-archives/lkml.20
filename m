Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478719;
	b=1+CMgYwodku2ITeo/NyM4c31OUO3xx34B7JknpUUo+anB1gb9ukZJEflw+HOQi2k9KkT
	 nNOayVr4OIbXpuRJucxn9LpsACv2P9iZnEh+DUqjVhSnpwx7Ds3FZjiginic763DmoJRm
	 CSvGOpR3s39IWDXiRDHPOTeOij1tiNyeviRVd7CDwlmidIQ+6s3OJhh+1vjU516whj2NO
	 Bk+QJ9/q+K/Azob5UfMik0oHnUMLjI18nlVOVwi8aKP3O8GCPuBMGxfr0mMnoF0E1/PlL
	 Pi/+4NDri58it3FSjvoYnQL6pk1BDmX0f1yUEiC4z2pGVkiinRYgJGt5TyQuDNGFtqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
	b=18yCRk8PosKZI5lO+ECy4w+nJWWXcOGfnGIAt9mgNLJUD4ns6a5lISOQvFcvzgLDgNo0
	 UH9LnIWjO128wMiA4Cw52EyDOYFdcs2pWAcrcb1k6Z1x2CoYwzzbVJp/2Ju//LWCTVxEe
	 AMMS+gi7cIcksrDwsnhSXp3SUVOuLUIrKTLTmyidginM7bZMjw0Du5w2tg3Vt1KoFEl0N
	 swK5ulVhqQ0bkMybUs3AsJ+A/FoG3cpre6FnRhEqGJmNHMi9ym7fWzwKEQERAiarLDINT
	 3vUAuv0aU791mG9IpGTFRuMmhlOjo3Ejg2G6fVH2RrQYAlLCWmEn2UhHtY6MM/fZzeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JWu1mZED;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrJnyIw1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196F5606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JWu1mZED;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrJnyIw1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Jki2903659
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=idS5k4WwcN+QcVezy1yAf8
	DcTDWK1kRKZZKByAnDLKE=; b=JWu1mZEDdi6dmFOmuUBSyBjcPiLnDQTlAllzqk
	AxArhkHMRaQwhsKFnFhlFSw7XbjDPuNLuK8k7h4Ocpad0NNjx6DkNZaHWegbenvb
	LiALXHB8xPlfG83oUfTNVAMgR7VWavHgmouBawvYts7UQa5rgGFwhJBYaTpSXd5C
	bPhvjdcS9GNele0vyJwxR5Q6KMNesKZ12lzU9qrcBlMekoXhiYz0wgvlGPBn8uh5
	Wznv5bk9wqakHFWfQqRscn5lA45q18P0R4S60qo1Eeh0UtkV5lrQydoF4HEBWXoy
	T1sAvKLmNeebT3ym97j84Qj6UnZvU862BMFGtzY6+9seI+yQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uc4b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:18:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso3783937a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478718; x=1795083518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
        b=XrJnyIw1teAo+g9xBjA7SC8L023VpOn+MKgRLxi+mAnVF58YZuZuWVQSWqKK2INX0a
         7oaIDEyNBPYCTVaesyywqqdDQRuksiOBJn5S3+w3sfuTW+0R2hufQUNLFZY6xwkWggTX
         X9bYuC80cyzKyopioqaZhDQWhsnmeUNjE6xcUP+7wuEbAJBqIYXOpGlqYtcOE1z8H+tW
         p6+Z2yUySXcOhT9wOxsd1eTh0FCy0Mj9+fHl/Iz5ZAN6s7DZYpVO+MTtWslFz5jFui4W
         ct8CFoQ/zB8XIYdmZf3eztHzTIXEiEEc/+67J43YVifu6DRZdv9DDg3nazkJDNJKGrNQ
         Un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478718; x=1795083518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=idS5k4WwcN+QcVezy1yAf8DcTDWK1kRKZZKByAnDLKE=;
        b=NiB1siQ27K7PPrI51dxWQ2II7UB5THCq2x9//QDB5vXvRcGAy1LhSIJhwE0ItMLDPO
         6oJ5MQavxS5qK2tlnIFOpQb4l4A6HTYUC2eeV3NTcnd4et/plbNIRZAdyuS4Abf1t4B2
         GDMN65+8dI3v83xTNSR1hurFD9YqMfaGMiAAydE3MUppHb5m51KVV2aoHmrGZJW2hpUb
         tqgRzCgtmF4qrk6XEBJIFQpELfOE3yyKEWjCeIJMlYDUX7qqwIrZRAi8lIUngOuLKCDm
         d0Y/0dNDZ7PbVljOPjAKIaNNolFtONVattDtgImOnk4Ed3dvhU95eI0QBXOEmUY5q8BR
         w+4Q==
X-Forwarded-Encrypted: i=1; AL+hErGZJFhG/BpL56ChzGzHvZtAO6VunfkL2OSd7lSK2YcB0ShDWkNB3LfP9nlA2C0W/dSl34V/xMyAazMdIYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IIcnghfNVpixCBVODwDUsNKj4/w2+kT4NGJeyp1XN4unXT8fu
	vOYtZoWf0sB1rZlHT+C3Lfs1vBEEyqvRCAolDv7sK9/Ms43lhtSfE9DJmmtYLa05MfSWueJ45vV
	9HASoH8kToKSl1yYf6yD5ZryBx5G4unnCJleIIC/c+9JYVzPR81MI7/jm+SieRWDobGU=
X-Gm-Gg: AYBFou0ngWjHlxfQFJKh/Zbyho7jWvrOiycrKJCdH7zOudiWIus7jObGN5oHxKDRuYI
	CCXGr7TODc6Cg/xp/LBfszo7rtlSPqW1H0Oksx5ZNWtI+JodC4uloCX1mWR/a9imacpu6YVCIfz
	fPRRU6e8GxSFzEFK+THbM8d+7pqvI+1GJqD/e0nc1XlGOjJfnD4zTA2+ZrU+48pThC/AQAFf3u2
	7yH6ekuz2yux/5BjffYVj/lfHpU23+DRCFEHQaIpDyQ8Rfg93qZec8khoLlZihw6qSTJi+FVMFe
	woCG4H6QTA3afFEN8lIfZHKP+txDeIXDJO1TPKLNzZbIv6Q1UcSM1G3Y1AU8uVvyjCeDkwcrkc+
	Q7yGLRu6GEHAM0KYIlWuEpFtw1rQGgdAlydMJa2b6sj5l+RWrRQUWCPzeddEqiAXUxjwrCnpRid
	MZe81MIdFwxg==
X-Received: by 2002:a17:90b:4a90:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b182f45140mr4488430a91.42.1794478717417;
        Thu, 12 Nov 2026 02:18:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a90:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b182f45140mr4488410a91.42.1794478716927;
        Thu, 12 Nov 2026 02:18:36 -0800 (PST)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182debb54sm3300528a91.2.2026.11.12.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:18:36 -0800 (PST)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:48:21 +0530
Subject: [PATCH v2] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
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
Message-Id: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGyS9WoC/22NwQ6CMAyGX4X0bAmdAuLJ9zAc5pgyA0xXQJTs3
 R0Yb/bQ5Pvz9+sMrJ3RDIdoBqdHw8Z2AcQmAlXL7qrRVIFBJCKjMKgb85b4VBW2w4QXM+Eu3ea
 UyUKRLCDc3Z0O8eo8lV/m4XzTql9ES6M23Fv3Wp+OtPR+fvHHPxIS5olKBeV7koqOljl+DLJRt
 m3jsKD03n8AWC2FWMsAAAA=
X-Change-ID: 20261111-eliza-wcd-mux-fix-453716a9c1a9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478712; l=2790;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=OKIfty8D6ajySNTRoI+nZGC+zq407XQMA8cjCg5j2UM=;
 b=8oTLxh9VTapZEES2TC5Ms47tbNefj/i8R814bXU0nwnCChIopz4vLKhn8X+kwaHa8+qhAUX1Y
 bUcKvLTBy8kBNdFKYTyXXRTtKndipPqsGZWPTf5MfMfOIcFMEkHQW5i
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4Zu4LvnI2F0K
 0vrx/ZozPAgewfi6xX+1UmIHAZAeyWrNQHJz/V6dUU/+GNbWHEicgowPuHlCoGI4f2Lvm9ayqOs
 oEb1FDGNEc03GNljvBcSS5J2svfUybk=
X-Proofpoint-GUID: eEjsIqCibD-VhTaZbxwbplgz7mO9JUCg
X-Proofpoint-ORIG-GUID: eEjsIqCibD-VhTaZbxwbplgz7mO9JUCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfXzfGDOYk0v+/J
 PwDuj/G6Y8BfH6L/41tqxDsTL3mji5MfqWINySDKC1A3psjYFrjU9udOpSccJmopcar5iRvyvMT
 fbYGjxYXE4NkRG5NOqft0E3hTSoMoxxVXVaDUJXgOOupMCrXyrvr+hbE4tXUKCYE+3+FXaZBE8R
 PBiLQccr4Inmb9o3zG6cu38GlZZe1djikQ7ZjEANFiyOlC9AEjrWZ/+w6w0sMZTczNhdezda0t1
 qvGbmhTh6nUhuf/hxM+I1RPH9G+AhVmWRdX2xQRfVaKoJxDGMVuS+4FwyiadeMI954n4fLNgkHd
 HvFD610/zrYe4/tajQDfRWy6161WBzw5bfxmkTI75HB7carfcta8HqJMDcIAPSDa1cj4Ur37XPo
 rqc2EDeuw1+F0Pj0a6WnfMdYrD7WF7ATdbVIBGzex+CyH92tfaoR9BnoeoeI8AotvJlnwRhQnqI
 l38Z/3pXe218qLOythQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af5927e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jVEDQz8d6yieKVSr1KAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
connector and the DP PHY, but eliza-mtp lacks the devicetree node for
it. Without a physical path for AUX, every DPCD probe times out and
the display never comes up:

  msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
  msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
  [drm:msm_dp_bridge_detect [msm]] failed to read caps
  [drm:msm_dp_bridge_detect [msm]] aux not connected

Add the wcd_usbss typec-mux node on i2c3, along with its supply and
reset line, and wire its SBU endpoint to a new port on the pmic-glink
connector. This gives the AUX/SBU signals a physical path from the
USB-C connector through the mux to the DP PHY.

Fixes: 193fd5f1aadf ("arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
Changes in v2:
- Add Fixes: tag referencing the commit that enabled DisplayPort
  without wiring up the AUX/SBU mux.
- Move the &i2c3 node to keep phandle-referenced nodes alphabetically
  sorted (Abel, Sashiko bot).
- Link to v1: https://patch.msgid.link/20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb..f5980516eae1 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
 						remote-endpoint = <&usb_dp_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -430,6 +438,34 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l7b>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-eliza-wcd-mux-fix-453716a9c1a9

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

