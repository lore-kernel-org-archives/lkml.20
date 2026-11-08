Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143964;
	b=WwvtRIVFjZDg2+cAsYw9XFJYG207XPHHmw5ZwHYZtwPll0DwE+eUlyCDL7TMGdtK7bw/
	 KOlQWoSJYYey/HNsQ6b3zirykT+3FciGyFxeKRh7SwRTPqwr/Kmsk8GnXvD19B8ZzLiMc
	 y5uDLxEzXYP84HNlsNaJEfBej+Wfic2B1EXoR4tJegJ65t6JsyZATvdJjWsf7DBpUF+gq
	 huAWiQAjdNz34oh5GdY37OuQDjrI+UCWTL51gjsHujt1xYUTb8VfxVwp8OhBbCpvmQoUO
	 D1shjt/AriPxIoxM6+g7iwuRqgcDEMgPZxPwleaX6KkgvzngBvoblDjdVnVHdCblxpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
	b=Tvzu2f0LyADUyg4Pp5SrblhgoYCCBaCPEOoaST6d0oKRXkrxOcZ0CLmDuvQfahR79tvE
	 soeLU2p+gKeeJwKjMTwDetvAswdae1KhAayBjV7+LI3pRB+Pps6MY0U2wPBIKVCZG9WaN
	 5g/n9P/SgDHKoPaFptgdZZWP26Dqoy+KAf08I+yDRiCwiSA0NKaF/MW689Y09NfFYFqn6
	 gSFWOKr03dYL6r5X0JdS+m+/KaJZdxb5UNNFJ2Fn9jdT2G6A0KlviujSitimed+ZM/0X4
	 oqjg3Gcc6dfLtdG6cTphomqvWPCofn3d+tpQ9FFIFkw0fiCQJSPadENEiRmQAGzUzNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C9606A33A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121C9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8Ah3p7905232
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=; b=gZaDpRYkMHh0Ss5e
	j+StO+2Q5fi9WoSckpNGxZdDF7nzVTeNZG3ICQ5Aqx92+rKbMhNFVf0H8Ac76LYw
	1bWjeL67DpdGQRxyyurDaUoTI9J8s0vOW04e7+PEaxo/KqPIzUBc+EEjK0C8L15A
	PFC6yULyxht6u0e6joYzAp7U+pI0ui0pJnhua0WYL/+EV7IcttPR6DLGezdj/lZR
	fqoCBbZYnkR49cx3kk42FN8dVrEfXoMSStKoxr/fH3W9IzZgoxcD8WV2OTKwiYdI
	3j62I17vVT908+yM7AEKDJJWdXv+lT9YJB8RNNiS7HgyU+uajDT20N5CDHxeLjog
	JfBmxg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagu232-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so377450c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143957; x=1794748757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=AFPD2K6sMXtvsgwhYwtNEeKEecgDvwpv1Nc50jnDKr9VdaItzEgN0TuzCSxhHx4Oc/
         rj/w8thcxtvSHkjcXuPa8qqlH9NjU4I1h3M67ScRZHnKjWBQqMiq6oKQjLDhH11iK1P3
         itW+i7+R6Qfqwids2cUPuZo/AMPteJaJ2EM1pVpM9PB65m/stfyVLVAEQeRpDE4XbtCV
         V0ZMMlLtul1CqbTC+RfIZd+URI0+LpoRyJ2kQFAQfJqTgWvfRLRplSXVb4OU67hbiKeK
         Wu4CFZdW9stRkIHvcvExQcD24Ul+AgKOYt10/9eAM3JD9ssFkMgOmvGeGm4jKM3PsYas
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143957; x=1794748757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=efIQjqOSf8K2wk531KlswgtYhm2xEP0moaAQ+Opr8/GtPn/XOyIXfDBqQBNxM2FNzL
         +mS4BIP9HhaEKF4yjz9wluzrXZNx9b9PS6h6/Vbk2HpbNy+BUvCt93sh3SPikSs49eFd
         nKRaD1QNYcR9C01QB29HE/8u9lewxl7E8KzUMiHWjA0qkjZIy5ihjaDpes2l2PWNp5JR
         7XRl9JovA/SAeyLA8DfCkjKJG1hqv3wBslJSs/9fTSD1b29FKjJuV7/lDTsTU3PbhTOP
         ilU01hNEQb61f19z7Qytvk33PODAZKN1r+n7bI0RAf8kbEWqehinQ4V17XWrUihLmaTQ
         QBoA==
X-Forwarded-Encrypted: i=1; AL+hErFLI/7YTqi/LMH/2/+bPR0+RUz5KGk+EfXSHdmdZCV6j2dZ2Pmd+LKf5bI3DTwC8Wfq0Ic3oxVN5gCIEWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z95ncQVyTDFKPnc9PAsDOLBurKdg4yQGzQbglG02ad+ZyGj9TKk
	Mr5P16i1PZCq0VUM2IZ8KoyrKYyf5d1lPSUiZk58tCJMsfQKygPGOjUU3dK8XflH8cvFH7SPCWv
	N5kmJICFwi4VgplmclSnxp7W0EDE9p5U/pWkkQye/HUOm9irVrAU6iDlfMbJtDAuQWAP42lpFUI
	c=
X-Gm-Gg: AYBFou0stzZcEsBTkZFCBNh195jqCtcrq+FQfmPJuMeAQh/aMS+pu7MPr9FuVcR/zwQ
	XgcVgho/M4O2Iu1J3fLS7JTIDThw1X/7+942nsw2URzIbwDWWrIWtzIB7GvnjWA2Z0QYxwlJIrI
	v9trrkEN2MxduBBuPnNizdFm1VMPtoJ8C5dzzAJ5vwEzbX+5Z0RRmY20XMmVw8gwhDP0Z+/06wH
	XwtNYtiGsNRXAd5pYS4yziq8TuL0GDNO7P4lDshZaL4ehiyptOg3FuuPCHoA+efpfk1MNgrLulw
	3/jP2Ht5cG1R8kTdXq5/stB6z5otDFYJJE6o9S0xkhCXwl2RSXqxE9AwGTLhzF0SQQfEJ0GsfgH
	oCREVU+1SQI2E8pVT7jEZWq5rif9heNW1LdzlQGdI13euqTpxc+KKD6/8acPPXR+uuFCpB/bDdo
	9lZFE=
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875869c88.15.1794143956894;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875834c88.15.1794143956331;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:15 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:28 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: monaco: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-7-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX5Bf+znrZPqoR
 /U6HpjWLKoqw010qgloj1maIcjM+CfYhPtpAOmV0i//QaN53vcgiNFutE5IGqULkN1xkS7qB6fH
 F2Tsp2rcEMXGCUcJMWYUCOG7FLvwQK4hvcHzLHrZ1yhcvY7QfF31+RBvxe/tM1AMzvzzXI4PymC
 m0sQTN372OlZl5NoplHH0vBWJyj61IeBNlw10hA6D3chYyLoQQ+WytzI0nog3FEUS39hmZ9cdCH
 Lz3WLVIcQdls8PChO0zCl99+wylWnDf7TLST8QASCYftKXAcJ6dtV/deDfGZi9s4P+I+VULZJwl
 fd6t3GHgIOO0q89QqXqAtK/lUSyxJ93ssKCQTt/D5UzqDOnXgTUl64knfxeEcnz8d5JI4wP14gi
 /2lvbKaPMY5GavKYAi0aXlysHES7Sh+esY49zcNqdnXFPJA4qddfItWxk6zNQ2T8Ag+uc77GN+4
 BEx+t0hmE6tTFSZ84zg==
X-Proofpoint-ORIG-GUID: ebGUIFZtooRWCZIPvLANAefd4lnSit7I
X-Proofpoint-GUID: ebGUIFZtooRWCZIPvLANAefd4lnSit7I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX2b3Iy/9mLQR8
 dIhy8pKg+asEADX0KvG/wCm7mgx2xquCuED3p5H1AvkftwnR/xQ7yW0SS81t7XaEYCVnrXoG/f2
 9C3zzDgmdPdbm723VogF/7wvVgIYtn0=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af076d5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=03a50ROZyo0H9j-jB2QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Monaco
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..b87ba4b3a5a6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2628,6 +2628,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,qcs8300-tscss", "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

