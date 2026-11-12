Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501681;
	b=ICfjXhsYDtGhcMrMK9iX+W8NMPta9i9RYhokgOToFc3SnvaZri1T0q0i3WgZUi0tCDfv
	 BqQVPMCxMc2ceL03jmDGy2Pm7QiMEh9kEgRy1OXEOYCJHDm/WaMJwjeV/Q/01cTWk0Umb
	 MO3f/Pv/fPJt78KGYTJrU1W2Hje5tL6oaxxz52I77qyGSMyNr2pdg7yrdkQ/A9N414TGo
	 PgxDyExs77dn7J+qG6GfTBcRYNovvLUd86W27yvU5x6FeXMu2YBLS4HbGUskdSGPFBPFE
	 FXMUgZccW6aH3UoLSyoubw2NILeq1WqS943T9CCHiiVNeQVUy91q0JNhc3CN6dGRl0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
	b=IPmHHGGdGB74crDvOUHhHTS7WyHUg/PI7QvvT0T7fjpadCarN5F3eC5A83NubFYWRr8A
	 h/5rUuNMLJV8az6TxsWcPZKcrFdI5CEAx0HGqMRXQujDsiaJROevqhisRzrSPI6TlFvGg
	 7k1wJ+F86cyx68YX5ISYbyCVjAktLymXy+zak6npF+tb6xMFux04aAhxsGyB8yYe5P0sB
	 bLvLCBiw02Ahewe+RFbGb9uFCVfu2IZD0r1BpHCbgG7P8J6B2rps7+jhPF63e1tHaU4dq
	 AQBPLg51C54KDYh6XppO3GbjQXffzNDGnSU4uBRJag22PieYayXRIup27pTtzvZ7pcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnSSx0vC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVbGfz6J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F89606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F89606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnSSx0vC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVbGfz6J
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZV3A1736579
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GL1KW5KmlCjKPjnDBxCpHX
	DrPADkygTf7Br9pvr+Mhg=; b=gnSSx0vCopJj6a6qEas/Akf07gbKgrP/P850i9
	W1cj6sdwAYxJv2NMv+GYcgmCgqHx5uDm8gzd4psg0b9nUQEG3dlhy6fWaQziiRlH
	S6qD00YRtAdlgUDiN6YWV0pw8ih7X8ZxeN+GRt0XhF/wuMAUOGxzVcNwR+ATccvl
	IjTnTpvRK1kFjtSgwYhXeK4Mr/wNmZiLKaxFvktjFdOCxCSikkoOSFA5j9CWj1lF
	idwqaA4YhQsA/pUVcAKme9LhRS7II1UYOya/UWu5U4bp/jIv/Dy3KulH438jZLzk
	RUD4HwsIeIqO0snUWSIxdZv20ufCgMFoYPAXDw0/R8sUp+/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2d5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so20374eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501680; x=1795106480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
        b=MVbGfz6JDrTw9U7ir5GlDlM8lDQiJ03anvTYV8BwuwIn9hlIso9ssKkFwaAscZsA9S
         XRwkJU9/7gtE46J1eiANdttz9c/Sd4C5+0YTrg9N3ZgbnW/1a521OsMvkhlIILGBWYSC
         nLhInkkf4bPMGTluuu+4Mln5dZGwQHlBIrhgygcH6S7sNiMlcjq6tYr2bvCsOVe4mhwG
         0+WOIQmNCluioT/rQXEN3WlYrrqK+TeqgdFuQZx9x7wMH7rpPBIqN+1WWiz3EFLWnmuT
         hximC04CDlRaD2S9rKiUOsqP4lX5FyiCGY8bBhPVetJd4x2sPt3Qrgdi226qGtjL8Ac4
         CQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501680; x=1795106480;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
        b=boJOTVpikJIoyTjM7Cl+4+GfPX1/oV9JHTPOUp+BaEEEGYlYaJaZxPC3lMpCSjf1cV
         OfVmg5DcigHS9a/TsBc1dxqBxJJu3E4b6kzFjSpyVRY8/tvWo3iG9y+ekgp6eVcXOvwJ
         33+6Br+nU7IYUXIESa9V3Ui8PQELEzqaPiMzthdFOboElH0/P10ZEALaxcv/SAo1pOpI
         J7FXOVRMS6JrUGR3w3BqOjCtMsA7fjt1KX8Dj3cOaX343ZLuLtmxIEVt370bK20CeWmZ
         t2sPzW9YNZ5DK608B2MSST5ocHC3+VY0wYiC8kKQTM/cMZlFtBAR1dhyJmDeZsmrNpH+
         9rKA==
X-Forwarded-Encrypted: i=1; AL+hErHdEAmsu+TBPOT5TS56AKCE0l4zEa9Cs/NuMpDk2JnWk5Uaq6WeIF8/UE1LL5i9w6PGDle0N+6R5w7BGdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LnspEgIln/7xkEMHVHlf4DAKrY136WB9i+q8tXXXU8fYm7Teu
	hp0TwbdDuLJFPr8H9FP2pRBKqLAhM5kiUfoU0Ch8EGBgUN7LDH2lTM1JkfpXBZ5KAm0fMLzF9Q0
	ixAdJF3GcUVN39tbhc/ZuuikkmF5LYG2GTNNiRIy7P1MApAPN/rqgVEmy5LJgHif2OhA=
X-Gm-Gg: AYBFou1e+wSxD41otffFTbpo6he4iNvhR3eQ34Y3LdET1PuszyOvGQknAuMgfQtXESg
	J4zZm1TQTDdxgLXHW1O0kZxdL26u/IMi/w1FPF4BVVpHBGPObe44D8fj2hWIfaP1Z9LpaX44FJn
	Le82084CYP+o89NTsClFmnJdlHRlDUCSCwEm3N8nC9GyvRZ0Mhpi04FcyH+ReG2LWFV1fIaUxc4
	k2Nq9SmBbtyGOCITgzXTZLRNaS7Li+Gv2/aoG3Rw1zJwkV+n04/q4CJ1nT+NZNXCWUXKt+Z+sjN
	bliuZTGppUpuQ8z7SD6780QkeKvBV/CCQcl4N28yYs/AqhJvnpjvPt1M0Vlo/4Hy1TJqrNI7hsY
	Nm/aPxvhPZXGvnfaMuyda1UNw7voVFYHXcTUbeROwaFlHX9rETnb2f+T1DPvAxbplSQEMuMBtPu
	i4OtPDjCip
X-Received: by 2002:a05:693c:884a:b0:376:7640:9668 with SMTP id 5a478bee46e88-377e15f05a9mr2410064eec.19.1794501679042;
        Thu, 12 Nov 2026 08:41:19 -0800 (PST)
X-Received: by 2002:a05:693c:884a:b0:376:7640:9668 with SMTP id 5a478bee46e88-377e15f05a9mr2410044eec.19.1794501678408;
        Thu, 12 Nov 2026 08:41:18 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37926255ad0sm779194eec.25.2026.11.12.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:41:17 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 22:10:51 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Disable PCIe ASPM L1ss
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
Message-Id: <20261112-rb3gen2_disable_l1ss-v1-1-aeefbf366595@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABLs9WoC/x3MQQqAIBBG4avErBMapRZdJSI0/2ogLByIILp70
 vJbvPeQIguU+uqhjEtUjlTAdUXz5tMKI7GYbGM7ZrYmB7ci2SmK+rBj2lnVRMDF1i2+dZ5KemY
 scv/bYXzfD/shr4JmAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794501673; l=1435;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=hn8E95hSjnp4mo9evG0HYYFRX9Qv8JX3XUrnmOB8URY=;
 b=Cz2hIbb7SVbY6DLNlsZUI/OVjlbb4XaMXl9hWDZtzhwGhSNGzadgtTvKIbeI7iS83xcN2+Bg+
 twR7EFHpjBTBUE2YW9Aed5R0eCRreFpaOewszGyiNXXjzDzyQcYUB9a
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Proofpoint-ORIG-GUID: 08KPKe60xFqknLbZvGtPwypMtViwny_r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX3woTUOKUkYB6
 kp8JT4OHl1Ii8jAy1YX9d2w4Xmjjz7A/e0OBGktKU3awpbpdSrru+KK2amW5lHR3chv+Z6sNYeW
 kJ0Xc8lPAFllfXSOX/Fs3qDveABowbc=
X-Proofpoint-GUID: 08KPKe60xFqknLbZvGtPwypMtViwny_r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX0UuYhIdyBsTO
 wvTLX5AIWrWazjOhfKahfamtW+icqerCBNJ+QB+xQbFLmgz8upchx4+VcSbCw4WVxRP8AoaaPDq
 zpiaH9PKHVGPJ/W3mzQxYNc2i35QEQG18JDT/wNt9DdLNmXqVOAf6xjbVC/5Rxv9Mc95bnIPdjT
 QGIg9h72l+y/gIa8k2dulE82prUjnXVGDKxK3xyJCORSPjKTy1P6siUOCofq3g/v4KH+GT/HSG3
 iHUA2UzufBT4WzhS7zl+CQQh7NvgpbmnScceTAj6zhdaow/DdpnvMx3fgywyDEseEo1CFiCPuTe
 LDkjvkhN3b3/x5d3TuOaPqG4iCUiuSaCPMn7HaaywE49z0FhhPD1dtXl8+ZTrqJ7BuVZE/nyT3m
 cyUsQcfQs/ZVP0MtwwyL5yDhfi3GZJL6hscg6Zu0y00MroPaIaWUZY4C2qKFd6RiQuRH59rHxoz
 8xcdElSGtgZFltIkYdA==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5ec30 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=laLeL0i8vuo-D3f-tOUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066

On the QCS6490 RB3gen2 platform, there is no mechanism for the
PCIe endpoints connected to TC9563 switch to assert #CLKREQ and
initiate a L1ss exit on the upstream link between the PCIe1 RC and
TC9563 upstream port. Hence, once the upstream link enters L1ss
and the Renesas uPD720201 endpoint connected to the switch downstream
port tries to initiate an L1 exit, a link down is seen. This is
expected because the upstream link is still in L1ss and PCIe refclk
is cut-off.

To avoid this issue, disable ASPM L1ss on the upstream link of TC9563
switch to keep the PCIe refclk always on.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..df26c78e8a8a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,8 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l1ss;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261112-rb3gen2_disable_l1ss-dee3d53fa53a

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

