Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262952;
	b=fr6YWKJESMcmGQb/CGiO8E+5aplGo0INq7YHrc1TQGDYeTv/rvnWb+CCcJJliQgYS5of
	 g4yp9wPnu3W70a2izGe57DItUoT4J7+q2XJ3B/0ADiVGM6iM98lEwlxW1w+PK+uSAAVq2
	 1eVRdECGowqG8VAgdfVx/f0LrV/3IKSX8dK4I3Em3CXGG6VFoxZcVO/0ZjDp3K7wVvC7w
	 /bD5gLEEKs12S9Ofn5h/4p/HJCm4TQCktL0anWOTy423jGclD1UtHOwkd6Rr+ZJoTLyXA
	 OFnGY1qj6efam1HgX4EN6ATEzg7rI2CyOwM5I1kBsu7A0Ciqkt8T2AZg3u8pkp/zKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
	b=1pTFsdAxsO7n1z04QLbBSqzdwFFpEaJjl9QAZy/sm8D4XrlGyJ4zymPmDnfLj4gmaS5W
	 yooBc7qT8PnjMQnCaLYGbsJhJlgghc3BlZ8zrQ8JG53wD6C/js19ZKyYGJ3lL8oNSQH1h
	 FecMFCW6n0p/SGzh3vSEtwoExrEkUzpOrHKHHDM8YZw0ZTxr2AoJ8iuaCM66uIzIy75y+
	 7kiDwPh4b8wgPaFbtY0pHXrGLDAz1HLXzaMwjqpuKpi85BhXqjR1dSN9/VgBG7Xqb3RcW
	 NLcmll9QTgFIBluTChVjjMcYtN9p5fIzlhLrnaEsJXw6bbEwbh1IgSbqtn2/JcSVUug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEZY79ZV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRZyUOR0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31640606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31640606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jEZY79ZV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRZyUOR0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gmt3204330
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=; b=jEZY79ZV/fojEjnu
	SoUOqCZjpsye5YRRG5dx0IaAKHAVP4g8s/ka74kpzZRXYqnjJtaGM2rJKLhX8Je6
	8cxvDeuWX+4NtunRmn7P6teXZ6avB/MS8nDYT22j9HdtkbqT9uXlT9jmArBFUV2f
	IPmNYR/7ycGUffWbB8IiwMEGmXzadQQXQzWlb1xkkaPsTLCx2dDxaW2PXSo2/SUj
	DqrqTCxMhUiacdLQd14m9QrnD/nA0jRun/Z1PTMwhauHNqI0BlUJWtvDZCD5m/RS
	xiDN828HL1QgVPO3A3S3MEmJexm0rZdXuxpZuk/8WoHJttBpVFgZCrwfNcFEB7hG
	jbxPpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkneuu16q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:35:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so349729185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793262950; x=1793867750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
        b=SRZyUOR08RR4nqNNbk2xJsTF50L71KqZY2alYoV9xP4o/lOkyWBAiW1J8k9d7juInW
         Oab/ZmoOkKiogmnwGi0X2pLGOdfATOk2SQqp/NQz41jMM6HxhHhZ6Zne2epoCAr74A6b
         /KB88aZUtvImgyw2MaYPlZ329q+2ujWs1bvM0y9s6Px0u3IIIcgI3fJzZZlLmaoHgsHp
         le9+HvQGCkHtUH47gnfdi3MPKJBra7rJWxoABiFlHL2l+v3C6wOaaI5Kaoio/0p86BvW
         0BcIDVKniGjC1PyiueW4SP08csHrXuDzShaKyaBgIJPFLFpu50J/km96MDkjfA6z8sP5
         boKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262950; x=1793867750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dlrBvBP+yr2hLk73PRwD+6WGWhE8HLa2RZ5uvJOYu78=;
        b=O/nvSVB2kUcp/+y9iarxKaVsU4NOx3kVEF60DUaVWd2eqBmjPfP8iYgIMgFEIBeq9K
         e+ucm8c+WnVAU0OE0+vEelhp4Hi2GiI50+oGg5tQQbI9I01nWzJHE1HJCeKxrT2Psng0
         5T7Gv/rSCZ7UnTR1fLcORq0kXNyw8Ta46AfZ06JbGIlKK5QRUxxBPhCi2fLXJ6kTnIP9
         Z45U4S6RcCc2VmfqSuRpg1zCXsgXcCgdjEDbMFu0CGXW0h0hcb6po4UptixE2470mVN9
         OB5runsGfA+7FMB1HF1y1SaM2JPukNG2AkGWFzr3XwuJVQmN/47tAowhJPsu5SN8Y+ym
         A0ew==
X-Forwarded-Encrypted: i=1; AKwUvBw+H+615hmnvcudMtOZZYp/NbyXLwAy0G/eGX0tIWlPapu1rzGPdg1BWKu8+8IRASMotT6ONUVL6NjmRug=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlsNRYi0luIZpk2UK6Jua7Z/qZVpnw5rpT/IgFaEQXhyMimjl3
	NUGWFbHu6Uk1K6kyD8D+Z/bzuau64P+CrzCc4V7SnejoFtPf2KrauiNQPC/Zhu1do3GWqLzdzXI
	E0+Vx/zz6ojzi4YL6Bzt/LOjyyLs1ASoZERl2ZiZb5/lGPy2mWxcgKi89IbJ14qcse6nd7xXeYa
	A=
X-Gm-Gg: AYBFou10NbDUrJNw/zGLiTdYnebYlC8r7bNkE6LAQoFl47ZP8BatRntGZEQUGcij1+w
	8Loa1azaqF+HCAG5jBojwkZRdIySNc7Topb2ytcDm+BssC39THNlOpFCVlRpaRsyxY6KAFPpy6J
	GWClOBGWIYB0EbSn/5UkHwoBYQPd9xTpcPUuHIzM8JK0mUcuWNd3lA6kTwakGdcYgOJt5fI+kDi
	aClinCSedet7Yk6Gvru04wk3wdUE08XHHjJXsCjt5A2u8BIrxcIEiCb5rwlK5qFRnpnJ8Rfn3gd
	pvHB8l0Ux4EaBcny9uEmUruFuLDfCQeqAPesBn+jdnuF9eC7Tnp/wJywPXffnAF/XjunH16KUE7
	oVikcSfQlnx/N6+0p3imgBGCeB5RS2qon1YG7Ub6YcxK7jCUVF0bQ/tGoNervb+/2
X-Received: by 2002:a05:620a:1710:b0:93f:35fc:5266 with SMTP id af79cd13be357-94408cf77eamr750027885a.44.1793262950024;
        Thu, 29 Oct 2026 01:35:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1710:b0:93f:35fc:5266 with SMTP id af79cd13be357-94408cf77eamr750025185a.44.1793262949364;
        Thu, 29 Oct 2026 01:35:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm29614657f8f.41.2026.10.29.01.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:35:48 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:35:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for SM6125
Message-ID: <out5ml4xkfvizxenc2yfokuxzprha2y2p3e3d7pnhimtcntq7w@uholls5kz5q4>
References: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028-sm6125-pd-mapper-v1-1-af9a645b4b8a@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX2JHJHufs0sy0
 cAVnfgiJ0qwyqDydAX1jL8a0IuOtU/T+iZhFv29tIYayFqP9IqngLefUdwGCpOru57+4nJszaVo
 ZdYUt4glHEG3sVNVP5G1NMfR3UT+e9vmRRc8b+ZxW503t2SGS2Rw/sM1K+PnZaXH+BdDMAGigoW
 hqW3ib54Lk5CkZmmowzcfS5ZAtX4528QiQbJwFRrmxiwdSNibov7f+bAcXPhtBC+aiYDQWkPmro
 MvN6WKNid/hp4ZCmS0IM3ry6+4IvyFDfBj8ZCTv1vW5YQpRY028XR48ShSjTPZfKZs7j0cv1nEP
 JYYXZBLsLZq8xUfyH0Wu8WdIKbytS5epaXfxhQbgJENVbImGcdS981UwWh55AQitvDAyQUifbKO
 MBhkuhvafZ6IKM1IX4Ajdg0Mw3m8IV61+H1BAkfRpAsbJ0b1U44R95Io28aUUyN4hV1In7OxbFt
 7rYH6Rx2aZao0Np9yWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX8Ie6JXlvALzi
 uLVifAQKNUOga7DBetR826T5R+6tjRhqjVaxCvciU/urdZ0RjLhT4DF8oax4rO4LNyw/sb0hZtG
 uYEWoBHgjNrGKIu30SwC7y3XaGtkdnA=
X-Authority-Analysis: v=2.4 cv=LoAHWXdc c=1 sm=1 tr=0 ts=6ae30567 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=GD0A6YLuM76K86w4iVUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 5TD3GHt0lw-4D8hdK1Wfq8vdQBlgY48v
X-Proofpoint-ORIG-GUID: 5TD3GHt0lw-4D8hdK1Wfq8vdQBlgY48v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033

On 26-10-28 21:20:41, Barnabás Czémán wrote:
> Add support for the Qualcomm SM6125 SoC to the protection
> domain mapper. SM6125 shares the same protection domain
> configuration as SM6115.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
