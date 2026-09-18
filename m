Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FF438483
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725519; cv=none; b=pWqZbyHxx1/8ARh7Jq+yBrz/ErqU9judFqD4cHa0Hq8ZMtH+GXevmo305JGNxWBDwgRd2urUrVI0vTTyqsOP3QRPyejudgx12tYBPGdGSIfoMRZgMmUcGnY6g8wQOIF1/LMZHVy7ie3KZjxMPK4RtutOIcYFY/LIl+/R3ljUtnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725519; c=relaxed/simple;
	bh=vKnL1OC2AK7IzVOMe41QvS8L3cgzxhIWMBKb+YiXdME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=muYbWp4GsDF/zT2/GfcbAL9xGLI4d8TfyE5yPu+HktWtuUgLCCfpFS6k4mkjAQECotzn3YNaxMG51lytHzZFvXBCXFcJaRArGJ/JKm5cl1lBWxy3wEgcQgSYEcfcTB5vSKTWQo315cqq/aaXvmHTdk5UNNDo/UT7MO831J7xWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSfZ+zeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixY/+RaN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSfZ+zeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixY/+RaN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dZvg1404293
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pb5p/WL8kUy
	qaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=; b=ZSfZ+zeWIV9Oq32MRVdsdnYqoPW
	Uvu7JLixXy3tU85cOpniIw4ShGpNITlwkeqZEzMvcWJAwYTukByIaBYwqTVD2vwN
	mfVi8lucsY2BXcFQhaCzd1lXuyJLiNh6rVltcU9HsyNvU/pkeUAhM/Ro6Yz1AUdU
	loJ2ugcmhYLyOroszN4bF7QkHKtHqt9dB8FWREgprK7fi5qv9GOQRRDGbfRtALA/
	25WxSTEp++HgHpxtqMHzB0R5HZd55A4IM78JPGbBjWt9nJCsc2l/YlDIyE0so3bi
	kalm685qSfJJCerxaFoSlnhFcwDYf4q/UNQVq1Uo0WZzBE0TFkTgfhJdqrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpt3dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:58:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-399315379fcso152010a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725517; x=1790330317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb5p/WL8kUyqaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=;
        b=ixY/+RaNHyu7FyOW5XpxhsAtJ4oq+E+EXfggB42WlnmZ7suvcrohYpYfPIjj6a95AF
         1P/TaRG58NGR7JfnsLUmBgBt9yiwIJTrNp4vr9ge7MagCBtiZ9RZ8bqcyOKW1O3jlDdB
         4+dMpBjK4OkI3d1VFEq57/7LTDp8EjjRdJ8hqgUVbesabrpD9kJ9xbzuUB/kjvqUocaD
         6cr+JgtMtktWLOPtd51iXICNy2uxswDeyeZfJKF7altjm5glGNyhexdv6ulUf2VkFPcS
         W0v9Cac+HWfjyqc51AwMxDvrC4v7D6lnEzzq1EvliE9R6AIjtn7Uhhp0zvGFpWHLv1PE
         qWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725517; x=1790330317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb5p/WL8kUyqaFGWpcUBrh/tb8T0Qr10UWefDKPbxTM=;
        b=QNe2l9DDfQRNfrlM7pJZKQaOapTob4FyeEaoPN1anbroSXhSz4rxvxHtBYydiAOz0l
         YIcp0uug5LaL87KDde8uMCS2FbnyHKT3uQNKE3O+te/f4CnRDrXNHWsoEIek0QzNB6Hi
         F0obCojkCPwkodqQI2J9nTp7QxJR0BXcIxC+blJ95EktOfYho5oaSwX+NZlEc5SYTCRc
         uBQvpdl61+Yn8NMMet3kwR3v6BZbdI6avB+5Hg4DQhL5tDZoLwkxC3TzOO/r89HJqwik
         8H89HOYyfcMwMr/lBI7x+EfkXSb92mbfU09l0H95nMxRB86A44K3pLKVk9oUU2fne58q
         p+XA==
X-Forwarded-Encrypted: i=1; AKwUvBw202IeVnpPZsPxfLiQGeW/fXjz22MnWPGV6+RR8pE0IctEvERd2+E0fiX5Z3OKqljsYajdBt+y5EMbhgI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNN8yBcBYopGp8apLsm/kA5tJLpUv700ky53Dy7gVQgXjNIwvm
	NNgwaHIcW5lUaMEcXMGMfc0m6rtw/DmEboQCvasUAXaCFWJi1oq/h4dBbc9u/Hew9P3LFpqnxDR
	hdb4DNKEWNMeIh4yN5KL5xQlRQk/0k1PdTfXioAXSZKtfgLAHBkFQLBk0rMyzSKnUXQM=
X-Gm-Gg: AYBFou1XLzYuxGf1KPElYSaikoKAycERjIBZmfRtRx534C8T0cczt1dkfFZAnrv/1x3
	JR1dpDiSvOM/tQeAWNPRg/mhh9ETQb9yMrnJDT1ktWz2BeZWXehw5JCFBM0QFQrhnyTlUifbMjn
	1R5rXSduBGwPw7WHWGy4bhwOoeDs7rw5rcUbBhSHznP9QAwOJkGAoJHixJdiY2sY95cStMSUO+5
	BzdfI0tN58DAdjQIY0u0ifzLqpl2E9kgjIRN9Cw6zuEAlTY9/0WNZcF6SJiFyKQRdVpROXPRnRU
	hdxVpoK0B6GpUL0tIyPn71c7S8bHz755ksgRCXk8v9TqjlAvp18MX9is/GBql9c6+nL6utzshmp
	rWpxHbyzb3q5pitzFVW9/w32dTEaTsw0=
X-Received: by 2002:a17:90b:4c4e:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39e594253c0mr2821584a91.2.1789725516414;
        Fri, 18 Sep 2026 02:58:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:396:d27b:86a4 with SMTP id 98e67ed59e1d1-39e594253c0mr2821545a91.2.1789725515992;
        Fri, 18 Sep 2026 02:58:35 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce02b063sm2892970c88.9.2026.09.18.02.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:58:35 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Robin Murphy <robin.murphy@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        James Morse <james.morse@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        umang.chheda@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: shikra: add RAS error source nodes
Date: Fri, 18 Sep 2026 15:27:46 +0530
Message-Id: <20260918095746.3347893-6-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
References: <20260918095746.3347893-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfX71/z+ECnOTUM
 MF6vkT2h1ump2Wm0CKC/lPGCcwGUQvsUUjByQaynv5ivQgAFhW1v1aSjthqKYhPhuDE0Z7uawpn
 Bwib9t2D5fPgskXYoDezP+MuoaWbrLoF6/2tPLXTuxAHttD6xG44r9RQP1YiqFaomSHQfAVliol
 GwEbgvktrNp5pfjG6ESeDOuhgC55GVWRVbJd1/0533d/qL1M425a1Gw8K6OgqKz24MxCEMAMi8g
 tUKfYxBzg16jlXD6aknnQz2XxU46xD8Grb9xqCCe3ZZee44ahjjRsGCO2Z6S8RdKYUl12zlZpzR
 IZQE6cnxxEu2OeoHcYO3EE69uiyTbtucaorN4/vlMxeyY7ozqrhmmYsxAsw3r+T1fd/0S1j63Lz
 jpgYdKEBKn0wUYZzlbm0lYPxwjw7k5wSi9BAMaKYg2VazNCe4FB1p5WFWAP8fK1BiQhm1BQVx9/
 07x1b6RWgJeJdAEcZ2w==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad0b4d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=a7izLWPGlrKpK18tDBAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNyBTYWx0ZWRfXzD9E3kwYDbJC
 J+ACAS33jHZChZ0Vz/4VsZA40VeqO1iOMBJlyeaW8lYjW8AC1I6QHxm4DxbdiJaLIQ0Qjj3wk++
 e2kXhQIEr8LdDrYN6QItDILArKuoMr0=
X-Proofpoint-ORIG-GUID: fOIJsKSDQkyU8p6-T4Rey8L9odOnGP8X
X-Proofpoint-GUID: fOIJsKSDQkyU8p6-T4Rey8L9odOnGP8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180137

ARM Reliability, Availability and Serviceability (RAS) enables
processor components (for eg cache, tlb etc) to record and signal
hardware faults through architected error records and fault handling
interrupts. This allows software to detect, report and, where possible,
recover from hardware errors.

The Shikra CPU subsystem implements RAS error records for the L1/L2
cache hierarchy and the shared L3 caches. Describe these error sources
in Device Tree so that the ARM RAS framework can discover them and
handle cache-related error reports.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..c5bbf1f8e46a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -330,6 +330,26 @@ opp-2208000000 {
 		};
 	};

+	l2-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <1>;
+		arm,record-impl = /bits/ 64 <0x1>;
+		arm,status-reporting = /bits/ 64 <0x1>;
+		arm,cache-ref = <&l2_3>;
+		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_LOW 0>;
+		interrupt-names = "fhi";
+	};
+
+	l3-cache-error {
+		compatible = "arm,ras-processor";
+		arm,num-records = <2>;
+		arm,record-impl = /bits/ 64 <0x2>;
+		arm,status-reporting = /bits/ 64 <0x2>;
+		arm,cache-ref = <&l3>;
+		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "fhi";
+	};
+
 	modem-etm0 {
 		compatible = "arm,coresight-dummy-source";

--
2.34.1

