Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538263;
	b=HdiaxWomM93WKWyOmuCrT1/MfvDEeOVqSyuEi3cpxs8skuBJiLTZLu+umkwxuR3EEnSR
	 TT2f5YkoJzrTXgTIpZ2UPHEYM3XI5+19SrWzyJdIRftETxHj5XB/DX8Gr5xe3+p+NEOCb
	 dXyciAZndGlVofzxVSLv3ohMHHsvddjStlsoRucOYp+WbcZu3MogzUzIaRHx52lNIYUFa
	 rR+9AIxBiF+TKwBP/HsJPHRYHtxdpvB8QiQBAyGys4jCuqcyoZV63MhBnxwL2PhYrDbok
	 U9YEA15/bVI/yXSrsSdXKG+ZiSZcC7/Z+eWRS/homjsidErJ4C3OVkjblXpO+v2uBYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
	b=ebEVUZbKkcPEqzGrtvnRnQyfZ8VNrWbb3wi6+sAWpHnVdnAPsVV3hZQLvRS05pqweivx
	 FByDEPSoo84ZyFtryXK4Jy835fC6TyzC6FpQz6S3rf9LSFmu2LHOlfg/YDG9E5+QdEZLT
	 sRafH4ajT8/jnY4noCzdf+0KfCS0sNiK7ofXH2TD+MpjYTMlFQb+r0QzPYroHhyKdpxMJ
	 z5W9OMjWP2ykLDAu6UP51M0oUdNxyjFgpry9xbzz2YYoCFV2eoIHJiameuq8ML+XXvwAw
	 JJFMcFg3NtMGgGgBvY6pz5Y+eMorw/JjOp3Z1DMZZABgQnbrT8KNi5GicWiLdR0T2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA5606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CA5606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRm8Iud5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzQB+uAp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KAp23117153
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KAm4KdCobwm
	m9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=; b=TRm8Iud5RorwuCOokFLouWVyGe3
	Ejs+Jnao3FEeMq/+YD3a7koXGzo7gI15ccwJDb9zzJYZCqWBEdgZJpDIQhrj45tK
	qfrsakbsc95Q7VxRdk+5brGdS/nCTta+FPpd+t6//L/rFTsL96U/A2+wQY5+DdCg
	PR47ghjCkso5U7xQJCz6rVisqqvQMaO6UnEhE57511zAvsCfv09P0rciTjSauNIw
	VRaGkQZN8SMWql4lV1Z+PIzgDLLLr7WSyyT4U1FkuMxgNtgSxwebxXJKcIwxq6Gm
	ma04+sdvrNWNt3RdhoqQXjWaQkeGkYOVS0+ptiYokmNXkCNYjSmZ4BJcvVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdh7su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:51:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed2c307e62so8400695ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538261; x=1795143061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=KzQB+uAp61609sez6uy/JvVPWDS8t4Q4SCDj9L6voI7GaMrqCeKTSIWWGKuHbDlIyw
         04C2agRt2f3Nk/XSsY7N52KKL1x41LZ6kGbOxNX8RSUfx7wCWqIgIyrswS5K2pOgwZMt
         mAqu9Z8Nd/CHRn3cEXPY6z1oy6aE3obgMFgNAm9Qy/vX9vft2BP1lGdRyGE1atInCKEp
         UuAmaVM/a8XSvl+4uC1HGwVLVQJtCp7aFVDH7lTTIKNy5i/tNYNSDA6Dpe14DLdI3s9D
         myodoZ5/OeEPel1uWGv4Jr5w57F+94sF9FQYPGnVDF1snIJjs9O55dhcGEW/PrYKRXHI
         kOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538261; x=1795143061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAm4KdCobwmm9EqTvwctxKFnpqfqv1gWuFx+XG6XRqM=;
        b=Dc0YXtpi4gymYapXmFgoff9ZaZxQp39PFEALa8VejViJa7RhPYl4rMj4DmqwfUMxqJ
         sHEV8dqe8MUwbJXA9H7LGqUzpjP4Z2OnxyVp9HJ3LdloDEbvnmcFB/wo6hmcaM9YcnVi
         PYAoTj38TGcOwZ2zFANcwOWSTkjS/u2D8BDRXXcggynIEkiTWyntr70L9XXjjiM+Q8o0
         hdyF9Z8P7IvYsJx8wf5Q7tGqpAZpLZWr449bhdfi7xK7uazWZaP+RLoR5JOzBrqpVKtF
         ErW+vixBFePZONIhmUbdaIZEmIbwlN/YXqUgiqp6AiTymQ4woUZld7Lbq4c1/ls8daHd
         QEcQ==
X-Forwarded-Encrypted: i=1; AL+hErHBSoF9/qB4impX41Q5nYPafWCWemdMkgbNpY463gGQnvNT2UOOW9QtO6zE7TCFNDqJtK/ai0PoUUerkLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3U3hoI49iTa3Q6wjBEzmN7gkTLmcwXBDUxdSWslby6tXTxSeo
	iJAHOw4BIkOMeyqPh+390rz9GBefGrMcm3o2NydlF6tKf6Vt+XP465cnsO6o139R5zaS57MW1DZ
	AZst6I1l6iHfA2a8o1Pxgb941ZyvdUdMmK17EId6cnf3Nq+W8dYnA8iwnQZAjqPztXV0=
X-Gm-Gg: AYBFou3gOAL+p2yR4UFjTei1onMwCNTRjL/QdVWs8/vtaJzfJACgC8U/IxAjRMGTUh6
	ZmV2Dca23es6ORSi+Mhdw5msAyeEjasd7EZa2a2GvmQMpCNlxQvz54wznP11ADkQP7hb/+3+s9+
	yNf9ivA2xI19gslTYiw7bD1aJc2RB1wezb5506qH3A+mzBR4zEcSVVvzvhfSIjOpOpNnqmgD/mB
	v4bFBNUqkcDcKLsFc/M7Z1rkwd7t6+Ze2DxOXm/zZDlNbzDdNH/oJoPqUCL85nOu3YwCj21p4m7
	6Uh+IJC7RFhCtsIYi2SgYDRkIplSj03YjguFqg7JnO2grGe0IEBH6fmRqul/P8Ln16LdNJ30a2V
	8MAa+xza8xVxcibsLBuHp5kQJvezeXn+/OqUBaqewaBW4aHzEBQATYa/1fY52/b8Lm4+nUXx+/h
	1/oTIdOF0=
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376855ad.29.1794538261343;
        Thu, 12 Nov 2026 18:51:01 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2ee0dad023bmr12376575ad.29.1794538260904;
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:51:00 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 04/10] coresight: Move CORESIGHT_DEVID to linux/coresight.h
Date: Fri, 13 Nov 2026 10:49:29 +0800
Message-Id: <20261113024935.3173715-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXz6Lq2XaZLHZK
 EgCEBtQ3Jqe4xtrO+dR4SaiqVFNfKTSeVvsb3jx5rvZ7SSH8RGH15swfBT1N113mBPOpIa7PP73
 cdO3MwnKecjOBMziqGndGL0o9Past9k=
X-Proofpoint-ORIG-GUID: 4i6fwoT4hPTO5cne-Qhuew5h2_RuJ5Nw
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af67b16 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=cS2XUTlU7a9WQml4CrUA:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX4BTNkVJA+M/r
 UXIrWI76228cpUAAhk65LlAEx1/Gn8q9HwTWV344G0S5uO70NvW1KEzhHbZiAyEw9ihZ6cNa9R9
 JuHAr4jxLqWdIeBXdmWI2MuxDZ922flJHVoUUsrW9OqUGlWhkHaguI8afxccukskFGdiqFECeOl
 udkj7EwYSx06BOJ3TzQKE5Lk7ZlMGjFx1mDNNx5Xqd64dJ1z1wLFYe/n9Gu/JFVWqx3nvGzKZTU
 8HUPA9Ku0JHli45340dRFE0wrdvLrEZ4AWjkqvuMpRjp7OvWJlpYfuujqThv3zN3UB2jPDtqnEL
 0tpr9G3Jlco3j+dblQ79PJnQdrxJWMvk82saXldKonhUpYalstAGvVplErLPJ7BG81e38jy6pYf
 3xq4SYXxRJOEyI52GyWl2ng6Z/pVVcHFGXQUblcm04rSLpRIkQYY6DpWLBFjHXjYiD3e9gcPNiv
 ZmxSz7OW8TQO6oNv86A==
X-Proofpoint-GUID: 4i6fwoT4hPTO5cne-Qhuew5h2_RuJ5Nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

CORESIGHT_DEVID lives at a fixed, architecturally-defined offset
(0xfc8) within the generic CoreSight management register block, which
is also present on non-CoreSight-labelled components that follow the
same convention (e.g. the Qualcomm TGU). Keeping it private to
coresight-priv.h forces such drivers to redefine the same constant
under a different name instead of reusing it, as already done for
CORESIGHT_LAR/CS_LOCK/CS_UNLOCK.

Move CORESIGHT_DEVID into the public include/linux/coresight.h so it
can be shared outside of drivers/hwtracing/coresight/ as well.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-priv.h | 1 -
 include/linux/coresight.h                    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 0d3f6229b282..a28b89d43291 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -26,7 +26,6 @@ extern const struct device_type coresight_dev_type[];
 #define CORESIGHT_LSR		0xfb4
 #define CORESIGHT_DEVARCH	0xfbc
 #define CORESIGHT_AUTHSTATUS	0xfb8
-#define CORESIGHT_DEVID		0xfc8
 #define CORESIGHT_DEVTYPE	0xfcc
 
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 0168f6abffaf..5286b3606581 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -36,6 +36,7 @@
 
 #define CORESIGHT_UNLOCK	0xc5acce55
 #define CORESIGHT_LAR		0xfb0
+#define CORESIGHT_DEVID		0xfc8
 
 static inline void CS_LOCK(void __iomem *addr)
 {
-- 
2.34.1

