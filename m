Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998035;
	b=jnuZ9kZ2rb9ZE7Q7z6k/BFwwJ9CO2/acNnXjCmiQbE9QA3P3J3aGOeL17csSyR8azuPK
	 wjragFqDK0zggg3aqTQNS0uIh6d0kI5soj6sH1htiRUybNhR1gJntG21+VdcQYVPUlkhF
	 Yy30auVZoQpFIwcy7eE1rVT6Rw4YLUi+U4isq2+kR/oX8iFiKCWs20iSsVco2sP7vHFg8
	 FhVulhKZNiIQoZF871rjuct7GNUS/UmFx5I4AzdkF0ZxRf2BJcvR+6pJZ1YXJxrUx7TB8
	 XZmGknWpaI8N2/84ru/Jz11B/cRi7QeSZI0suTLM2gnXdNq3oYAGIEgtVBjEBJUkt8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
	b=lri97CmtHyJdXgKY2PzdPuHPRuEl1oOhkOJjCfErkUGr88ZWvrhgGP8V8yoi/YndzxK5
	 BBJua5a7EIoqkDpbJKalBuZCm5WdGU5Zh7YdTdJHMqwtPYRy6pUYZLwOjHVGMKsPZthDP
	 hFXm0Q3rlCPg3Tk/iydIwjXWYaMJ/JuVB5cv093/7rpV/gZxbSVb1493R/IrAffAeIR/y
	 0uJ2U7X6zNrQrhHv4wcLpclP80+xH3qcxOCTAWiCHoHbZ/NZbrOPTonmS27fkEu13xJol
	 UmRwqSEHZPVnSGYdP/QmFEBRblCSijKO9fuxjjv/WjoR0/W4nD5/E1gwaL44gUVIqIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG071e1p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SC724fDQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B72606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B72606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG071e1p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SC724fDQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL4AK1699901
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 20:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pd5LgaxHszkkaVOinhGV6O
	5N+YV0rg18ExH9Wt2rx5k=; b=VG071e1piR89hbaPAli8Ro+gar5YeuuVloMeop
	dAo751f1tpsTCN4Ss5NrcPY/gOXeWS9qfzWGdtCwv+frykK15XR0pCCImRJA3TwT
	SapJh7KYSwEtOwWj9vgZKplnxeIiAb2BFijnivngw9/Ia2vpw85+bH7x7OJk6mSp
	38UJBweMn31e3n3fCk0I3YiEQSo4Q/lV9L4VOgRiaeO8fWKIFuQSumf2fOn+J7L4
	1NGpctZnldYDWP1YIFCbDLxnrSSefxEjtdEc4STS+n4L0YjQHHxKgx4WfjRT3H5W
	VdBQk7Myy9X4CF0qEwk/WXXa7g7KYZEoG6ocLgzLIppjANuA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmypga53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:47:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d091514509so54469137.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793998033; x=1794602833; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
        b=SC724fDQwXo6VNIkty/5aR3izp7oQXTIAmi9yrtjqd1wEuKZPgIMQbcncm2SfUb8kk
         0JKAPic4qYdN8/5wOD/KXSO1ZaLNZvIRH12pVsgtUGxWRUsi/v5DZ++attAeiMkSFSjT
         /6FV9gdruxYAoZwJOhZ2bX8DUYXdGCaOpkb/jPk0803PVN/fhPZvsB/QvuVMD/G++4Uk
         uC/ycc/GemskdpS5k+1LmVvhZFNuexr6sB5B/t+lKMQAioOurTR07haY6+EabBVJ3qx0
         vTnDTMBFjOCWh0WaJw2u8z7F1s3mXPnV8dI7SV8q8bi/BW/E621CoNcva+4mo0M9Ve+T
         gwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998033; x=1794602833;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pd5LgaxHszkkaVOinhGV6O5N+YV0rg18ExH9Wt2rx5k=;
        b=Jar0G1RDjL3Jieyw1Ue/IWpSAwmUJKjOELFesRjOT6seveDTxy6+Jeu8QrLTSdxaGc
         XLv0uZyFUFaVB/+qcKVcw7HDE653cT+/lXWdy6rfAGCzEVTngL4F54lIUhDqQwGnqk+7
         8WuxZhdV1q8jlNk3CCnVHGFJqSy0Znp0klu1dmdbEhgfGE2EJOUP9lg9gxxhJAfO40Cg
         GJ8vMaE7U5br4GNWBVIEl4HJ9r1fSBFT3PkYYo/hz2Y193eVTe7x0zSMnbauBuU4PC+5
         IB3QRTb2FMAojtr/PSPv+lgOGrMQaAorUoQnvkCWrZ3E87Z5QQgGoKD8f3znZ/F4DC9G
         Y04g==
X-Forwarded-Encrypted: i=1; AL+hErFFMQbr+UwTqqUayqxgw8tO8bGTLL0qdt2gIQwuRjJJ0SPjbmzvzWPTjndm+hypSYU3a58x8Ukwn+1JVhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5gK8fSXLC5SX+sgTQ/qI+BZrJyJWJ2jkgjO+b31WAzn8C35eA
	JSkgpnaDHK6pydbU6CZbH90enrolD0e66nrpZ+bCuquaLfxhwWpkxe6uSK7+Os0EHAGIoney/oK
	eQ4mizK9hZcDR6sCOsfPEdUsF5eRG+HS/lcfmEv8reEV8JtbDyslyKImDWqUW4xMsiW8=
X-Gm-Gg: AYBFou2/0GEFt+/XBYMmJJD8ujHbS882M/ileL/udUFjmyTS51imJ6tWU02vlGVcAuy
	XDf4fwj3yrZIaEubS9L3wbpxd6ohKGFiuUmPcKQEjDRI6FdMsb+HoJtYaAOXqV1x8q1eyV2vbsh
	N9aMzqVq0FLTwy48Ei9cG8hU4V4OrkYby7rAGNXaGQF5qp22SH1u5eTcEOVOQPkso/AO7tR9QUE
	KEyRa6VOLQ+ICMALTh+O0m24BBhlGLKvM3S0GcZMrCklFy9p89iEDee2+pCDLY6RMAZEFxjjtg9
	XGWxTK0g8m4+uTel3AvgRBYArv03bJLOiY6H9bTzTFj/lu2PeGtotUtLjSpOSJL5YfRrowO4YU6
	3F+Z01rEhdYeAg+3cF6PUho5DGPYZrvjiqynGh7kHjLak+jej5J1KyY8EMQ==
X-Received: by 2002:a05:6102:605a:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7d2bd4be39dmr43671137.5.1793998031913;
        Fri, 06 Nov 2026 12:47:11 -0800 (PST)
X-Received: by 2002:a05:6102:605a:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7d2bd4be39dmr43659137.5.1793998031234;
        Fri, 06 Nov 2026 12:47:11 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d6085asm7845292f8f.3.2026.11.06.12.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:47:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:47:06 +0200
Subject: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 touchscreen support
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
Message-Id: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMk87moC/yXMwQrCMAwA0F8ZORtYp8bNXxEPXczWCHbStCKM/
 btVj+/yVjBJKgbnZoUkLzVdYoXbNcDBx1lQb9XQtR051xI+fCgeszsYzhJPmJfCwTiJRBwm2h+
 J+34cCOrwTDLp+7dfrn9bGe/C+VvCtn0AO7BfY38AAAA=
X-Change-ID: 20261106-mahua-t14s-gen7-touchscreen-9f6356c88b96
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=uKb7Z0+JmDuO4iTVpzi7GYs6RA6GLHZkSajItq+0Vqk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7jzLyxDrKCtIpsWbmR8hpD//DhQLa+sI6PadM
 DKdDJpQY1mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau48ywAKCRAbX0TJAJUV
 VumYEACRN9VbJCmCRZy3J48Ltaef9nftxJzE4MFKFaWXGwsTbXWn1KGXabNYVbt6GiAQFhdRwtp
 PDqyH128eFBBF5T1K1cQqwsRBpQo8xO0cBb9mCdN815Eq5gCRTNPs2ohWDX6/XqzTZVJ+dBPka1
 +w7gMukbH7KqZU1S39uxXCGmedN8+GPNY+mftYBHKB/O3UUXocsiJohFbFKazbf3/TEdtEqratT
 aSsut6lfOrvqediQ7uI/ZtEuLwOrILYM+VbQe88cmYlDfff6rQRgqte27Lk0Nfk7KJf7Su4WKMK
 IQCSgGLiucgIbAWCMfMxFBpRP0VKjJIvbnv/avEFpA/MTKHr+tJ2MnWUB/J1r5PPH/YSMLypyK7
 KPbzwf0HFxlYNQOok3RPPAIKc1QxNif8kG/B/487TFN+LeOPQ52sEQph/NWxu/BPZou6kiohSjJ
 0HE2pkexWyNLOD3rKLFCOApgpuda43nAZD0yecjBXM4vH0lbe8b0zZ480xlt50I6VKyhA+gcX/1
 1cWJrVqA3fMMh6oNtm3HZy8il/AY17JHJFCXM9t1/X2lLEsSfZ5QE+IsuxfAll0H+JJHU6zCuYy
 pm7APXp7v1LgNDqs8Kdov7hON9xbmoaom+L+E78p2nxAVcxyJpEaFOQxUfQa6ASy7NZ6d8e4ztX
 KvmYRI5HV6FsAzw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfXzQCJ3+DGQc9p
 gua8TnKuxgrib2ZkQsyXd4K+W8Fn1sg8tfFFw9fLMEx2WSakKKf+UadOobxLvlyAu+vXgM+cqZl
 XX50+y4+YniRCu0w6Mf73xsG4UoioAzOeePdcxOh4smrjQeN/q71hzvWC8USHq2nS6a4206ZjZ+
 rqw8vwmtv/oo9CWT9MP3T4aMj5xd8kYlAX048zZfKfe8ld2IYgBMEdBqLTy0X2DbGfOhgNinUz+
 lU6opklZVOkWbRxcSW6isCxFm2SpHF5+glaMM9Y7AX82otBAUF2EJkpLnSW1DiZs/+lmXLuudpi
 0/nB217FHTLDONDba6ULNtMAqDWWG7SztF3UVPVenlvHbM7k3aM74bM+kS6Or0+Aa/ecjmKXZy5
 pGb9mrvFosE8IeboRHxNLE8SYic3c9JKnMAEnojeqME6+0HytQlhhE4zWd42HTNuXCuAA1EGZ3+
 w6boFjLrtP0KUHEsQ5w==
X-Proofpoint-GUID: Mani_qEc4kUMQr1OLANiU8GJ8koaHWz0
X-Proofpoint-ORIG-GUID: Mani_qEc4kUMQr1OLANiU8GJ8koaHWz0
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee3cd2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=U6BFw-rutseXiAtYHe8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX8FX0oGy9JUpY
 lKdBjmhD6AtWUKDmLxm5SVjUobreCm+RuOBIqm3LXUjbMNRg/WUIa9y0pJAXkhOAnSk7ro5X/0J
 aQteY+clVHL6yaRKItbIccmWpnwtsfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060082

The touch SKU of the ThinkPad T14s Gen 7 has a HID-over-I2C
touchscreen (Parade, HID 1da0:3009) at address 0x24 on QUP i2c8.
Its interrupt is GPIO 51 (level, active low) and GPIO 48 is the
active-low reset line, which is kept deasserted.

Describe it so the touchscreen works.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..f19ec3aa89a1 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,23 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@24 {
+		compatible = "hid-over-i2c";
+		reg = <0x24>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -1101,6 +1118,23 @@ tpad_default: tpad-default-state {
 		bias-disable;
 	};
 
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-mahua-t14s-gen7-touchscreen-9f6356c88b96

Best regards,
--  

Abel

