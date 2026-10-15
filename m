Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38714A13B7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048554; cv=none; b=itLoSNbyKyLDbsIMTdmH/jhACmKiWF7rfg4Ay4XfUB96/S+sEknedm9REXhCguQTDroWVxxbRfRDzqrN2UvOgfUzPbUUEOFGKveKK4DyTRb6zA5FTWUCToGQSW0bCbXtiu7OrTvOU5hi6qa4XtoUU0nMmGNWjfimoP86H0zLzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048554; c=relaxed/simple;
	bh=tItZ/EwPJdriu1rpTcLsLcLOXVteEA/qcfl0cHcekGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RK1riyUAbh7MUEncvF9uJ5lqB8fdI8NvXnUIpcVwuCEmOsnHy9SHhRQpaYOw31orqeAg85c1f6pMj8BK7OfBJBi8c5vtYu0GeEmbE9YGNa/UBiwzZ3c54nGuK+Ff5fS0Vxb616/O9QMYWyWzno2YdxoW7+PZ3ebg3JVQ8qZ8UUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ynx6gTR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkX0pKMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ynx6gTR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkX0pKMh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3x77j1640151
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dWBECK7icBi
	a2/tKYngFiiCd7Z3OravUiWWawC20Jvk=; b=Ynx6gTR762oNePt6ObZdhS454qL
	NMDoAPMTBE6WxRYx7jFgJ0QKmTrXWZ6WYZ4vd2/yXrWxSqA2t4uHkwyYxnvUe3hG
	XgUXSWsPp4+PK+NYHpSGTi24Iu4JPcE7ROdiQwE8XtPG/RaWbpBtkep8j/k0gWg8
	/QebLOLlE8WGZSbOJ1ZwxB5VyvnJNYdjeHNn+jnnyYLdXfKaIhWTBO0z5AQxQJbR
	3OCZmWZsgz6OxIlrzly63LMY/lTFObcQLerqtBN2ufX+UxiJWTs+sjb8vnmS8Ei5
	8+NaH20vwBZpvRSsjwA82u9HGEv4NT5OgKEavZYo1W3hi5sOThc43I6GrhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhgq77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3299498a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048540; x=1792653340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWBECK7icBia2/tKYngFiiCd7Z3OravUiWWawC20Jvk=;
        b=CkX0pKMhu8L8uXmgreF7UeOT4Gu6dVECrLToqbAXW8U3dip1S/FMEuUeASbA9iTF0G
         wQeWo1hrn8plL8g1Et/l5il6e6Vg332RFhKfR8pcoATGjV/MnvM3sYOlHT4H1wSOxmhy
         U5MvfzhwGRQo/logwh+99MachmjnER3tV+Mg+4F/OjwUvCG7+pTkbcZffFz7pMbI6YR/
         jLR7LHIg9cdtuxDPf5+sbqVFdlwQTOIc5Bqm7cMEPBTL8Y4TG/e7HZO3p1/euZKvcAPC
         UFhRkIySptKuXgjUvUNVM9KJslSq15dCPu1huhpLgtPtQ1Ukvg9/FmFV2/c2q59UfdsY
         MpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048540; x=1792653340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWBECK7icBia2/tKYngFiiCd7Z3OravUiWWawC20Jvk=;
        b=yhs6S7h9JXdQUliE9LyeIApUWQZOARpQBJStvzFDv9fUpV0C2XedBsBLE7vRSC2fwd
         PiuoFLIkRWQ3NdKyDQEWCpg9Jn4EJXUlewCdfLOr+Pkab6QRQ9ZUjlz1LVxV4vO/oF9M
         EZDsy0l/AgnAI2IwEYwzMtHPOYjTJYlA7Ln1xshPCp+WR2fMaCr1GLg5bmnqPPrA5Ma3
         7PE5RwfhQWYIRGPYQBeWvfMZHwBudVidVcu7xHcv06K7pVa4KCayUGvGwvENQB2lb6r1
         c5sxh+QJTQXeF84usJQSUigyX89qWfQSA5uNOlQTAGZQSx3NiU8BXybuhE+eKFIwWDZg
         n6gg==
X-Forwarded-Encrypted: i=1; AKwUvBxDCLpNB8VdmlTRiZo1th9I93GSxuJVpmziSHoz2UXjnUIiw/FWxB1NyYUQMawFAleHEyAO5FerBCq5qBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPgPJ+LO+fNm1qRidknGCQ03++uhRU6ETnZ5lJVbof90gHg0Hq
	ZaiPjEffVNaC2YDdSDsn+N/pungKrkSA9aJAfcqKz8ESREzSMRS7kHY9I1/6iULtrSNq+iwE/7/
	e3H06w+KfQbIonlKa7W9OV6oOAFEoLM2wXo+qvFjPxEpekSYBsDQMPooq54HzQHCJAa8=
X-Gm-Gg: AYBFou2UAoFfs3rCISmo9eQgBVSgtn7Emk2h2YGRaoOK2v3vnMsJjr5snVDu0rSLhTp
	D3l+hQKHL92fgs2BzYC0a30bcLm9XiVLmF0redeGTrWBJ5ViReOaoTA9yeAh4JItf1kVf70xmTI
	xvcPM+67sNkx72W0lCzKugkO5ZOco5BOWsq+nqI4IJgvgyQf2jPTUqbGwerVDVpeMjPq3zOJigQ
	x27i2nB+7bhpQWdnON69niFFU6UeBqfgmU8bCNwCfQx4k/6DVyMSDbww6KMicKYd+/UOZEn9mVs
	hnOT6Maj8v6s0EVthIv2/KlkEZeXV9Iue2TEYWPB4+67c2J7///BgCq0PdXdfML79rPfTI0/ivw
	VvGUekhK8au+aZYKDNXOyQuaSAg47SUTj5eUSYwdBy7Knom6YbjscVV1gueGZYEHa2z65Qv10
X-Received: by 2002:a17:90a:c10f:b0:3a4:b2e7:f01e with SMTP id 98e67ed59e1d1-3ab3a928a56mr15449027a91.52.1792048540113;
        Thu, 15 Oct 2026 00:15:40 -0700 (PDT)
X-Received: by 2002:a17:90a:c10f:b0:3a4:b2e7:f01e with SMTP id 98e67ed59e1d1-3ab3a928a56mr15449007a91.52.1792048539630;
        Thu, 15 Oct 2026 00:15:39 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:39 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 4/4] arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:11 +0800
Message-Id: <20261015071511.977-5-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXyfK6qq+NYulR
 2gospfAmMVTYhZssZ8JPqfYBRwetxQp+q52GrW7d1yKWq1FM080WkGjaj/SSCal16buRPLQzlyt
 /QXOQDzxD65xBmk9lG7UqY5dR2NgNwGzbODguLNrPmWQoRxR2cOeXHXOniKF1AyP4bijj7N2jM0
 WyXAQVchjhKbgC7C6z4+PMBLA1whmSVITrc/xqEa0NqV0Dmnm4fi74iWOkN1tzsz/r4sWlM2l9D
 IGpHY+z1nqcIdLzkOazAYmN4nirrdeQgy7n8NA5Mj0xasB0PRW+zzlcUiMlPsMYW9jNRaQ9uu38
 bW2+iB97vHrneIdxBWH0hx9bsyLJwuRl/RF3oNyRNev091xSNxbM8AQx0fx/srpiBrAR7PZAwsk
 mNb/UbjPLcaFdsjXdORzuc7ZiCAe2ueU9mYfVlD8DYfdZbfUQNnVjpUrY7UoBif7/fsfF/+QYNU
 XaHUbfTZmOhpPxGpgBw==
X-Proofpoint-GUID: vXVVVnafS9DrUJElVFnq1V5B2Qf7n1JO
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad07d9c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CgcdhG9ooiE7Jmpo-HsA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX0LymTedMr4/c
 MW2q4Jy14XioEoT3SmyeqfjITjNzOuN5EhlYrchRnypf08giUO81F9iV2EZUjoFrOONq7YDqw68
 kjGhzCLBpzluC3CixHqr8846cnjhQY4=
X-Proofpoint-ORIG-GUID: vXVVVnafS9DrUJElVFnq1V5B2Qf7n1JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable shared DMA pool.
Allowing the kernel to reuse this region is incompatible with handing
the entire region over to the DSP, as HLOS allocations may access
pages for which HLOS no longer has access permissions.

The same configuration has caused synchronous external aborts on
other platforms when the kernel accesses pages within the ADSP remote
heap.

Replace reusable with no-map to keep the region reserved for the DSP
and exclude it from the kernel's standard memory mapping.

Fixes: 0bcf9ca23a873 ("arm64: dts: qcom: sm8750: add memory node for adsp fastrpc")
Link: https://lore.kernel.org/all/20251209-sm8750-fastrpc-adsp-v3-1-ccfff49a8af9@linaro.org/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..0d493359408b 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -561,7 +561,7 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0xc00000>;
-			reusable;
+			no-map;
 		};
 	};
 
-- 
2.43.0

