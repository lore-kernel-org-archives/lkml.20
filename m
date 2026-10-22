Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670240;
	b=KKGWrdn2L43qBUf2TbB6LMTlDwjXXnyEDIIpoKxoA5Hx54/Ef8mxB5FSktXXHqcd4GBh
	 aLFwF4cIGZoxdvHjZxwLGkza3vkNP0xaAflvoH+wAIArBB9F5XTzi1E809mXxelXQu2pJ
	 sgAsZRmy4AfoLFApmTe7VOp3QOjcAWvuSpDaWlFJmoGwGa57W6GdRPw8HGxEwweLiCu5G
	 N60xFRYwRNoSrKzoNLLie7GIzCeTBoUyvIMwijHbM9uJUr42JQkMV9wXWXQwerz/0P3ul
	 pWUDBNMsbX3kZsKMQfpF4LXlb7Fo0+RSFuBC8B3AotH9h/+nYYOG3U4GszloxbK+WhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
	b=HOumEGVIqoWB4obTdvjg6PN+5Bht/Yo5Fap5ZGBLLIDm2s3Ik2YPvHifY18xCtHk+lGW
	 G6jgqUnz3T6GJkegm+9fJCKCuDCekfHEy7Xct6Kz/+qfvqs5RzHLYS5z+cStKWVjnBzXQ
	 8nrP91VC+J3Xluck+cw/ENFNVT8PSS9VDTmFRmA1zVCFIJo47vu+fDFwH9aMfVufU7USt
	 H42g6nW6Npf75w0jXiXiDWkSbjUs85paRv2MnOJfhWz2LvPatMEFaFKAVAdJ2HF7j/3Fu
	 67R3lRjBMup/x373xfC4IAU2TzgxbYDLvOvj8W2ftp9uijXvQcf9uoWXnEYmwXfabog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyDGorlw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC03606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC03606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VH2k41if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyDGorlw
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xl912573576
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=; b=VH2k41ifOq4avR/q
	sFmsrOjEkuf2/RUj1yenFT4TiXUN0tmSIWrPyf2vRS24vK7AFNVRpw7vfGXtaTY2
	dIQTx12zp/ZMS2+WuJjxXNDHAGtKG3STm+YV5q0WnfqpHgSBNcionEI1/b379dSw
	iqrnyh4iAhP5ClnYGOX3XMShFOcdiCV8sCEgrmr6dABSKnkem8utwSWr0DciiVCp
	gDbWPPEKmzk7kzM2YaAYWltH3bm+sOBiNRQZXTqj106MR62V2MO4qvzSP3eqYySP
	HMN+5FBdXHyNsFCPVfeCOb47qeZZwdBnrE0ZnqGynZr/i0uBsVtpGluhzUgIXi/y
	zowj2A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ak0bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:57:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so2041805c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670238; x=1793275038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=UyDGorlwEl8eUr8GJUHbHdCqNOwmwsqJDnuV5LmpSrmgyediecpH+wpOZ41tCAzxGm
         c15nOCl3Ru2Zh5LBlZiJ8cgaRPfOoFMMQ14OpHxnFxaXIaPNx6JS56TmnPiFhiHiINDG
         HKrAnz5k3qFOWJMHRWbhoXfrzAZmbAqIAcrL0J5T6zUAgwG8P9p3n4K0n/E3cPnNjM2D
         zU/BqTw7yQnFqq4D+52XzG6FDiVEItk31KEHnDLyxsEE8cuNMiWT5FSz6z/XTm2AuWym
         PzUf9rXisLAv/fW51mrE3sIZUQHBe+pQOxTokg5Kv1E4yiHpWT5No20jiOcqsN6/tRHu
         L3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670238; x=1793275038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5PZtlf7efPn/xBVQBkmIEFJgvp2IAfOqTLApDxIcg0=;
        b=Mh8sxFAlyTDJtSrzI9+mxOrpcQoAQcW1Chy4/PkcdBsDMbeqQs8LVZn1yrTHmEAto5
         bkj+gNPBUTOnFATVEANQ99A+aenmVXh1JqXYLD4ok8rYBcjZqrcg/fwq4kod+767mamK
         Xv6RpU5dN1I0k17q4XlBjtjAQ5kkM1TH+K2xJmUrXapJH806kC+VrO9gFFYozsDzmsUU
         kFLcwIrBQ+JLtcwn2E/8tya420VgSvE4LCBe/jfQ+xOmKOe1glf/B9ynHy1pqQgdsrSt
         vRGnGPwluYLYB7Yh81SLRQYeg22HeRlXOtK2ZSfvIxKMji0bWXFm3P6xQxBUpZpKEfi7
         GIuQ==
X-Forwarded-Encrypted: i=1; AKwUvByJwNehPvUaZtHbnDVJxvr61mKOveRKE+2w+MeKbe4mbdz5tA2N67LRgN3LYvFcS8RdZemi0K/oWdmm7q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkmYA3G9ONerrzXXoKW8oDoZhlnYWgI47atpPj6Nv4vFBUHJCj
	YePrRTC/8STR4prIOPWJt0AYW7wWb50MfQgDTJaM7KRvKFsXvBGqy3e0qKk5p0pdocenQZIjuC3
	Qdb9K77ZC1vc6uH/yLE2SrR4IQN9SLtztFHXIAWJHPBsNd1+fS22TOLPQSscS1BHMdoI=
X-Gm-Gg: AYBFou1n1f3n1xCmhvcOtumTsntv49RRxADEL0EhT8QZMvAIJC1p47yVE1BImlCl+AU
	QLzo1QyMvlpAb94rRwmBYCFL9o0huD6WfaveZ3xTAboJDK7gPctKHV/4BNWrOPP7/TuEauyJIUA
	ZrqVF8E5wzx7FufRzKc67iyeRKl+ffqIJEX0EkafZHk6VmDwW9lEHSXOBoIxHY6rNK+AAAkUK1y
	Hvfproxt/R/V4R7FtdkoXosy5jBA1jpTfqzOjdJdiGZlP8pGeuxvV2Ou03IjOEAkHCocEscCKQv
	AQgI7Qo/ebdAkjKmDY9t4xCTENlSxu2p79urLtU9HMBxxDrjIHL8WC6425wOxueXEIMvbTMTGNz
	EwKgIjCsOB8UbTDJICJTMrBru7rERT5JXDUE=
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990637c88.21.1792670238311;
        Thu, 22 Oct 2026 04:57:18 -0700 (PDT)
X-Received: by 2002:a05:701b:454e:10b0:171:a066:938e with SMTP id a92af1059eb24-190a7756cc9mr5990608c88.21.1792670237767;
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:17 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:02 +0530
Subject: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
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
Message-Id: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: VG3YbvQYkJmU9ayD3FahrAZUlf3ntAnf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX7ctIEbpltkuY
 oWiKgQHEKUz9TeukleIS6gmPkCsN9FFe/zeUZmt9EAvz9m0Itfk5C2nZNK6kypuzfrfVRQYLm0U
 uKHIGlgb1ODJRD4ZG9cv5rbglYXrtbE=
X-Proofpoint-ORIG-GUID: VG3YbvQYkJmU9ayD3FahrAZUlf3ntAnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX+KYFjGjY1AoV
 0fm1MtirZIRGNJ5L+gylIIyboPaX8PPiwwxLDQXQh8upktKK8HU6BMpF+829V+Ep6miIc8M74QK
 bj+d8gDTiNVxcgkE6XAwWkZgdANqXjj/kgZs9g4O2br7UosJ8NiY/LMDG0dBRpYstUEKFSVOmxt
 nadjpe/PUIsqng/rE+oP6VH1+4H3OPl2Oi7bxN0xwoF8AKMMJrWz2fE1dstw6V1aIQfoQRtl16V
 /32qK6J/YMiWEWmFFcJ6m8Wuy35rw9UKh6plkwZCrs4zh6V8I/pgNrJVDbLj8ZQhNt/h3HO5BoH
 yx/7WUE20wMQTCo0mecvGI+q00TTOdbzFFvyFUROxyylhDAHe5M7qApOjL7sZvLD0VLlcb4iP7l
 bTGrL9gKZF3yPlwpnN10AQ4wuAIxifm/QMFepS0TDGR6Wkam9SECDTt7j4SKAP43dY0zoltQ6P7
 4WfqlEcDKwNwzGQgd0g==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9fa1e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qVuS7nBUJV19qhEaXjMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..6bed47b8c913 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -430,6 +430,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &spi16 {
 	status = "okay";
 };

-- 
2.43.0

