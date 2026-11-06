Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968414;
	b=mS8ChUf6/5HnKiktzFDf0NwozGdss2yXXMVE4dh90tggSe0esmY4x3InUzgZoKZD35Sb
	 Ubf402Us7N2SxeKicDLxYoPZNTIU8puYebBik5HJGCOognlIA1QOLYmk9pqI7kUuE1RbQ
	 8LtGtj8a3+qTui3xU2lfUSdRL13oAjLUyVm08vkPCwkNlocr0NBTW5QBOBtzozRi52mxk
	 /PR5IalkhT/kaZYfCRlATl9Z/BssWyeBQfsDnOKIq8DtaZUjf+t8ZR+Sx6gdYZDakZD/k
	 oZRE2cFL87Uil97HfyWLx3FD2cEXah0r8XxOpZaMIjGsf1h7AgfctGlTPZ5bma3SEZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
	b=lCfz7/6kJfdYtsiQn1mo1ZmqyMTCXS4YU7hhRYNpWVmRpvXJ4PzJj+dTqjEDsT6KfHTH
	 +DmenjX2Xs9J9Qf7uzzMsgoBADeAncjYOCgLncBDJd0jUq56K5b/R6RCOGBScfKLohXlW
	 l4eU2t4/skcCUJ8/6dgdDERVL2IWNdHU4f8ylhNbOJ6dDqe6H/etcJRoHrm3GpkosZX1h
	 ueFGthv+3lhEfu0JukYwyMhhZH9r99fOuJ1YwCiJEl6CqvGETs4OMCoLLnpasDfZgRaBZ
	 4JzTw21CLKxVsEE0mP181EAGdxZwguEC6tp1GGx31tcGf0bGNydq0qaHoLLx6Yg0OOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AA606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaiyfY6c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZtVk0OCQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP6xL2731853
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 12:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=; b=SaiyfY6coeC0grlK
	2vMGzRo+xVKQuBZK80QW4+Ul9sxRE7y0fo7R18UdEiZ8+WTXWXCyRSDdTerYuoYB
	PkWF9LcdpEdsvDhCMprbEIurD61myC3jWJOi4D0FTTilH5NrIyFuNk/lUm4A3kcE
	+3W8X0+7mVlF8LSoIdfPuA4lhjnxb4LPWo9pripy7JQRUz4V1H7/sYOSJQdiikMg
	9UuxLg48NZbCaG7SZARobueBzi2yni0MgFH0xKk1GoJLBxPAJ/zlHkXzvxX5a/8E
	N6Exs+WSLMz0am8vfMGLDfCviF9H7xTL6eY2hBnRALtLHSvHb2P+JsMyqbMFU1VX
	+9FoMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9auft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:33:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1348898eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968412; x=1794573212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=ZtVk0OCQMD/EQeod2JxNj2FBHNqDPYXa+cfn+xP9PkKW6EGLE9Mi8ftV9T9HYQk8sY
         p0zxhDtB1z3wMB9tz0BhFbkQGWY1kysUIxw6z6eTyLfqTfSQj+98eepubHhXqDR+vDq7
         IDvVXUYrgdFY3bqQsSmdjnINvkte4loXRah2VQJoILsVP5AwmmNsJkWMB8h1T2zrefgz
         MBEI0hk1tJFav9MOWiPSeQ4vEurEYEfMXOniUGqq0uAECiZfz6ecfO26WHndfB9uvgjy
         fRqjXkLJNgy9nSbQa/8STaMvipErucoRL+bvbXFBA3PKfRz38M3shsNVeb9UKSdBQHw9
         72Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968412; x=1794573212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4iF+PkaOWNwka3PIa/FYyP93P2CuZ/1cLxIV7q4hNLM=;
        b=IcAgK6YVzRZD+4JXA6syELFPx955g30/ExR07A+pM6C1nZ9WwyUawViBRa4rh9XNMZ
         hmA29otB8Kuoksm45CDxywbM5aO4UQGYwf2NFrwx7WGO0DHCFaoLY8MARnWyR2nuha13
         c9mm13faLVm0eH8UozCax6JXyl8RWphBSvabBD7m8Ua/geHhcdfFCTOOSNYRivmp0tvI
         Wvv3euZrl8RikPvLgxEpP7wE0RC36MDlVIw1rBzuheemgtH4Xy/ThCTF2dOl306FJYfn
         vw8eaZxUzzRwWDnYgQlaL3ahBXKVHjVE5G0RP9OAW2pYUC/sDhTPMBX4rwc4VjIYzz82
         dCrA==
X-Forwarded-Encrypted: i=1; AL+hErFMR1VSeOn5DNkm9tpNi4GxwCQDYfKw2CLShNjNsWElLjgskmaeeR9GyZgNqGn5VnuMe9ZxQYQc6vTWK/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zv3Zz4cTAhOr/TUIkHn4VeLs3ZrT/AiUvwZrdox7hsZovWOib
	JtbWWWn+Qm0bQODBtecLeqHRU3gcDp0oaMDIokFnlm5a7qQRNPYE3K6fMN3HM+zjCxPgv6VQ0S6
	0hBcbTYS2F2cPLpTGhDnOInbT4cxMsfPzYw0ym4zxIN5Bd7lSPd+ndo6/uwzY4DVx5j2nt3Azep
	E=
X-Gm-Gg: AYBFou1yFivFHnPSU6LyTRQ4bMqm2jlpcuxmXKE/3gs98l4p6LW6e1h4H3VKF5AgB7r
	6VUQVVKjbusxpgEd40tBhSqwUdaRVec+SV4YV2SbFvSji4rbn1IqYtrfFtatip/UhLchPfvhY0o
	SBBXhSBzeckTOHOOvCWttLFB8/bGCKjGToeM22yzu7tKNXfF4TSyAHf4wdJb2hE1/5yNWgDZLDs
	VMlHS3/srsAFsSLGpT1VHiG7UkFpJeiA7kK0h8v8gRWGP3vKaE5nKyLC8BUsEnJJ0ImbbxRujDF
	O3hTQn3+Wlqz0O3u2oxOflzjBJrxiiwc0nr3jNYLGytjVqgZHaXcrbg9DfIHSwi5Nou+hgMdIIt
	vVd/WL5DDq3LLJjNebmYE06vSwdraMssciHMJgSZVe9f7I+JdM+lqmTYbmYDTy7/fM9VHaGuq7T
	3N1QmbCxa/
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940125eec.10.1793968412281;
        Fri, 06 Nov 2026 04:33:32 -0800 (PST)
X-Received: by 2002:a05:7300:3e97:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-36f75254a98mr2940078eec.10.1793968411733;
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:31 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:01 +0530
Subject: [PATCH v6 v6 2/9] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
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
Message-Id: <20261106-add_shikra_support-v6-2-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=1038;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=N+hLPxTgejZRAB42bRC6ExNtrEIYfRCVRfd5P/YRASU=;
 b=+YQw4Ncu42wXGT//Nl8iiC0J3w5HLLx8E0Sm3l1OcNUNdDoQ4nJd+Z9FRn0IIvnYETfqAgZ/5
 bZlKqEgro1XCnola6Eiz8L1SerpSFk32JOW1OeJb+zSwBRl1srGGoPN
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: jHufgSdZSNMIcbBABNdZoH0o4d_9lPgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXyNwVNXTII8hn
 SME8X+tn1OQp1ZKHwSI58JlBSNL6ugvMpEIwVC3w8WdRQRB6veJKViaJVHeA6rJqXCPyFAxNgF5
 mhmufJslnWmca0H4RDGY9dTkWtjy1kjkdGLBriIFSuhPTjY6eahRDLywG/oeK9/oa7Ss9TcdheB
 4Ny+/lRJH/wuClLWqsJ0JgFOp3sBu+o15walaK5xOBLnckJu891GbH33CHNPP3zzi96ghySklLs
 ldymdZi2zRQmPtixqZxyCyX42NoaxE3+HE6e23SejKFU2TJy/L0kFMpRzbMl/EFnd5xC5Jb+ooq
 qcl4DPv0a6HsPp8SYedCXq2A5IbUIbDKaNT5jELYZirpCCxDB37xpe5+R11W+872A53wY0W/GHs
 H56Asbb0N+/hNBeuAksG6Mi0sh5Da8wL93129o24fTr0aP5hpbAoZvvxgF3ECXRUsqUDuVzvsme
 EXHTaYGfD0Hb/3GhWCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfXzA1FPpaD1/BY
 NaLK1I3+5AtIQ61Rqf7z0WFp20sKovWyu8/XJl+q7/eD+ly+enPGii62kyPk+KiMD628KAY232I
 2mY0pl1GJxuXOG3Z7P/PhFt1KJArtdg=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedc91d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nrwinYagBEXx2xsFsuYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jHufgSdZSNMIcbBABNdZoH0o4d_9lPgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
learned about it, so the probe log reports "LPASS Codec Version NA" on
those parts.

Add the missing case.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..573b2145e1c4 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_2_9:
+		return "v2.9";
 	default:
 		break;
 	}

-- 
2.34.1

