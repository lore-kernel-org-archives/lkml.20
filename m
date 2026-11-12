Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523192;
	b=Q3VgezmK/L7UDBFQh6mUqK6+3HbwcEeiUotZqhVyexJ1DcqWKatd6Pn4ZXkgrKEocfbK
	 wpgJgbNsnvApfcJwsQV7oT+rOOuml/sxBN8wAN931fvlZeq6MnTXFtVTODuvO5mljhjuW
	 LTc2PQmX2n33eE6YbkbnFP/bVW61dENwErG1V8xR9bzSuBD3ctH62fWKhXZgMv8TmWR1G
	 dKItA7gaQ0wQTzXNCYZsC5NEUogouHvqXYmuCpUyCb1Jj9UvB2aUFqK+CSvvN8+rwM5FX
	 Fpe05n0ouKpNeQZ6NymHdmo8SJJ76yUJad1LmdjEVx0dYo8hS0PPbqPpKAgH6UbrZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
	b=xU1nEvCNoKT+mJhxC5dukMU4uEIRuHQd0xLRSDmEHCf/xRqhHwXpncveZFGfepLhK80W
	 OgbMhme8gKpe4IgY/F3bS5FSXVD0RfXyiVOI5pzBxYT6/VI3DITAgpdvw1t8hYK8MMOyD
	 oNVkYNieZ0AqCccTW5OFIRdyJSUf9sdnV0oqWhHIk7WVhOueJkKMQPVskzFtSYqx3p9GQ
	 RmHbM1vlPAE3kdKtCRk2kRWPC78w533jlbxQryA/hcUPMfvmNyjWtX2j+7SgBns2HL0KD
	 HWjFwjt2dUHVE2puWwDc5DuRrF2LlPx0Le+fFNU2gRE/zzqXChz5i4772keLhb4NMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81932606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81932606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V63K56ZY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fj+43oaQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJZlec1183496
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=; b=V63K56ZYhmMmzVzi
	Abvhos0ZhgGq878N66gbiQpvGPsraM5OnL7XP2Qof7LnhO78uTu1exsRapupGRDp
	hMh+Pm/TmhoVmH75rLbqRM+1QJ7PgEs4TWHDY8YslJUW27q4NZNPfes2ZyMQFcWm
	eQdIHslArBMU08yLQUmBmodWUZ30+ah4iOYQp2F90dSK1e/zPAbgX5p8DNBcT1mW
	daqj9GY2wl4o7r0LxHzvNXHNFdHahSPt+wtmp9o3gve3KFMi/gZzLJ+k2lKU7mzv
	lRN+J79LnAsL7YpkNnGDuSps4S6VeNBZ+jV1OgzDabUoqPteaYQBT3zqnFMHS8Rm
	Zzpzgw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yukp3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:39:51 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so215214c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794523191; x=1795127991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=fj+43oaQb7W17VghbCtiaJXL6dS3HCupr2yoW0NgM4Vyos/XAZ8QLRD0+BQzivJC1Q
         MT+M1Pk40l1v29lvp6bEoPQc+NLmjchyODP/g75H90zAw+1/IoEht1eveBWhcuXJiNXx
         NixaxkG5edH5wjNmFEsyPp3T9AzbvU5HnLkYlpEaFFfHjwxQWPqzr/5mCvMPrudGNzwT
         Rdwr3QFhXz0uei539IIpqGybtzXauQLIyLuGEEadZRrbtl4gcWBV0TY7U8COKWjC05kl
         PLMxEo0V1n1abVUmLyr4dPqIgsXmwe2ya1wG9pgeMifPxfgZgzO3LpRRWL2fPJYL84uY
         RZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523191; x=1795127991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0jw8JKgv0n0ezdqZ8dsYLNGQSrLdfYWJ7gZlA49lV0=;
        b=1eLaIIbIJ9E2owEArdeuKX2K+7hRDSdTqeFRc27GdyMVo88St2FhP7dyhJzBUcEAvf
         nPFVrbEMwT6bD9KvVlzp6nTu6lR9rkr3AQchQ2a4ZGi8E/oiBmBHppjq0SjV6NBRii/P
         Bw79X6+etK1fQFbj3ZZvnwHDjnk0IuW3tLscwLtmnCZ1i1MGk6zDdnpFabcrG/0YaXbX
         9wrvZQcFEGveud1Ac+TYPfJ7DxRDSqyX27SNp8LEzBzKmWJMkA8R+GHiM5CPshtNM34F
         QTIHiVdRzvz6Fyvn7a7/jN9Lu1l/r1xoNx9CxYr1op0aR9sUJjBnDtNvk3C0xhRNWwyr
         2QZQ==
X-Forwarded-Encrypted: i=1; AL+hErEyIILupHTyVu/5O01qg/u8Lf0ngvQX39JWPew4Lc+7E+02GnEqFxcucR5x9NGcJQmR7/C1NyIBNYvhZ0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z93tvtutBPsGlZLTeQjyYhQGhhvxBluEfPYsBzZbHLT3rU+2fBU
	7rTLi9ctUpAjDvrpen+eoj9AQVP/VI4ge2T0TPv8r7E5AkT0ZjL4nx1HwSWd1g/RCmKDUHNL6ha
	/EhQtbidOVVFysLRLYcvH0sXkc4XB43tI54ZJN0aCsV8XR9Our9w4AOquPwTUG3w12kc=
X-Gm-Gg: AYBFou0t1NyqHhabwRWyIQfg11Kz+Djj6GyvwzhxgBocOgWH6bxHRR5UgWuzRJGUwhJ
	YBlknSHQGx71tymfyKvV6vdL31bD3dvA0k7gh2ncvz4DGfRTJN4yuzcQvAqFSaYHP+2X0VaVzE5
	uZBdIAOayDgZTaD1P/2s/91A18s9maLmVQXcjtSAqARwfffbc6aVjr8dISlThrt6FrWSmmKtf/L
	9G3zc0XUzotyiMTwgo7Ep5Uo8FqiQisvrJrmc0QztXJEWt3PClkzCnHRrb/jAldVfWtk0FVAjlY
	8Qp9MvPkeGq41XSvX+b4m7sMmlLIGvJ7FaGUP2mZcQQgWhVwtjT5w6iiMfmFpUC7GZgE4bj6six
	897FcXPpkaRCzqPIFw1Fc3Xr+rRvJZGp/QL0UGD4Co7PD4HunztkcMu/gjUYmf0UKSA7LUKevoW
	b6rclXMOHoEg==
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr877026c88.30.1794523191103;
        Thu, 12 Nov 2026 14:39:51 -0800 (PST)
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr876999c88.30.1794523190428;
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm2333496c88.5.2026.11.12.14.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:39:50 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 04:08:32 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
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
Message-Id: <20261113-enable-ice-clock-scaling-v13-6-258dc817bd63@oss.qualcomm.com>
References: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
In-Reply-To: <20261113-enable-ice-clock-scaling-v13-0-258dc817bd63@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 4N8eEapUdVn9ptIuFsQ5_ikLKYHaHmvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXyBBS5RpdeIiu
 JbONbJsiL9stecbbEn8iVMe5Qe5Z7ybST5rXK7S6eX3o23n5QVWw1DACg0eLNQPAQdhDkC+PXee
 rtjgyYk4vHRWKI7a0DaVTaa9IpqLP1I=
X-Proofpoint-ORIG-GUID: 4N8eEapUdVn9ptIuFsQ5_ikLKYHaHmvh
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af64037 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ASeq7m8wwX9lxpDCPrQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX3smbt/ZP0acn
 SW5M35FcvyAi9frUYJ75ZyyrYCB3L9JZa8uM+F3doDlZQ6wFp93MdTK8kdbleHs4s1ZTsOoEQqL
 +mnSRbDGl0YLbL3lwEp4NQH4k5flrxEXMfVDAJeIJNB+IpHUQuAXDwvx1FnDPBYvmrlnQ/S3yE0
 WZpJkMQ0kDeeILq7p5TE1CQunPWxFACrFPuexKDZRHY70B64Mgy59IUP6SUVPQcBQBNBBaOX4va
 fuMN7iQtK0yNzav+/sN1QpOIRQPUefpjMx8SKSjg+0y03nASMlNobkP4KIkWMHcRzy8c1apAdhL
 T7Uyg8OJL/Jy6Fcfq1WxPkiMLKwtFminGJgsBNQdPtm7yI6tLly9z8SuXeSuP+N9Ws3PaheSSRr
 rvV+ux49h4HBT2J87l5X5j5/iKSx1vSzBvdnbRy5CSM45rioqp0zsvpmiZk3t0b2qL+XDr8Tyyb
 icLE8Ax3SDZfKQQL65Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120090

Qualcomm Inline Crypto Engine (ICE) platform driver now supports
an optional OPP-table.

Add OPP-table for ICE UFS device nodes for LeMans platform.

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e1cdbb7d67a992172861a5a10a05a..a80fd8f96427488c20205c5ad798413aeb53964b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1840,6 +1840,32 @@ ice: crypto@1d88000 {
 		clock-names = "core",
 			      "iface";
 		power-domains = <&gcc UFS_PHY_GDSC>;
+
+		operating-points-v2 = <&ice_opp_table>;
+
+		ice_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+
+			opp-600000000 {
+				opp-hz = /bits/ 64 <600000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
 	};
 
 	lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

