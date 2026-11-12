Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477009;
	b=nfkBUu0DcaSPbC9opSHsWZB2UiIzlHcEy9lVK9jWK7fBDkhM8RYgMn2b6ud2kaGJXV06
	 l8r4OQM39G9U1gknl1AeYgYOYOpl+1LiUkTdB7QmrrnjHQkGKnbFoRnma1hPE+DxU1Mbz
	 VYWVPNdYTN2gFzHcxEbzxp1s6mcYSDwjOmo7IJh73TO4OQmPKLOufETfn5eICdDgD1+gf
	 M5i4W+cSYy0sGrQhkjIpPSJzJS5d8jt1BVxSL3OiGkXcZUNZH85D5DBJLC1b+M9Z9Rljr
	 zb+ut64sssImt7hkvHiCiSSGsbCKATK9bI1vrjZ462rfmc3hIMBSkxEOSV1QTucY/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
	b=Ey/bUqJiwzln4u/GuwlKfejec2v1qO/zSt0/yWbxMS/spZpoiRUAtWhTqZDwnjB5U6pV
	 w8AG1g2IJI6Yhgd63hv6AZDYoVVgycYjk4sy6e9w2IEMwjwOffy6J9b8S3qzpffWmL9IE
	 MuwIGLN+MKa2wCEsY6Au+NszbT2dgQIgwqDNCGG2MxhbXWAGhLs6npI6JtH/nj6Ben3aW
	 WRq9I/sdiY1mS3agYOVpE8Xhjo4rq73hkjcRn0oehy6mqKYeWbqt+DL4NhwlSCjIMfxuL
	 H/c/GpULZcACiV7rJVLoyzkSwVyI4OHlMBJf7+bb1tA2pXy1qmdeeyL4CLRGsMI7PXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PaFMb/hs";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9203B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9203B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaFMb/hs
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC92Tpd4149276
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yCyj9Uv/I3cJ5AJk11HV61Sj
	vlAanpJ3mDDAS5FWulc=; b=gNUvkOvmqou/N739X576Y9GcOyLlpZGaayy5WwrV
	iVoTyscancZTueLdwBhOZleco3OBYFoGfA9sAJKSlB5ogdF4AOewrgARDfOAzz+5
	PyZq0kr1ewRvDudryhevfTQkJHs0zf2T8vvFEVf8wH7nCFGyEf0pbp3iHJooHBHn
	WiGMbEU1KsU9hfpnJmGyctKs/QxB4NUJ63Pitf9ZA90sq9b/FH6pc9WDkinxbtxp
	7BD/Omt9Y1iaOd53rBMJXDspQnHRDWEi09xT/RltEI4z4JVeIBKIViLuIU7ma+5K
	rieftMMhgqXDmZOd8aAIP50hdohWQTjj6gKbrWyrEs7H9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62uhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:50:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so501722885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477007; x=1795081807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=PaFMb/hs1SMsiM0trj1W4qowQ3+LXKli5r68tzyIYr5cT1oz23ZoHNRrDWH+cr/Mgq
         uWJjXbHEIIHuAQBPoXpnWernWtWzi/tTlo1iqMGvwKSVyLOM83rx5cv4c6wanjif/rxD
         /oher8LB/eAST6t47aSaVVktOhOq9EPtX1ddD406y/zmx8Hgzyvxf3DnhkUwFV118sG2
         tBsZIX/W/b1rR69HsPNlXi8IL/6R8esotd4pd+/1Ck+xqko5CkRSpu89Kfo8vzRygPEQ
         MJ8QUWX5dFN7AsQkfYto0znWMyteXXoIJLPJ+Ao2ljedwEmreMEbhRp0psbyvN0dnHtU
         0Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477007; x=1795081807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=a0+fPPxho6pwAimNjxwRUFQK4xnJixJlj2pxBHwP4PhDiNfx2WLyjilqlu3G+1ti7m
         wqFOf20mFS5z4uXho1MHQvPLkP3L+8mSdTf3MUSaWBvPAadxDc1GLa/J0bqiolsLKuBy
         sDHst2qb4ZOHjkl2JQ2HLNKuZUecQW08jr66yyA5tACXAWAhGFlS5IIRQy2vZD/IuSQy
         4BJfDgTzRGCfpvMnyoo217Mhn3JX7i9pgUKSJSdG16fkZK4G6aFLB7PACcsbYBtgpmOK
         RqLjfdEuMkPgzPJuEc2809N/3S0kJ3B0Uu6iSSpF66Ncl8W7lUiTYdrzEmmJtjnJFpeW
         hL0g==
X-Forwarded-Encrypted: i=1; AL+hErH1MUeFHi+PW5C+uDDr3rlFaoherVoKMHKuhqskk3wxT/BkWWb2FKm4PlvCjyxnPagDiJpMLhEpb7lEctQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N92+oOaffOfLa5BApsfe/MVr7HCrVzLhiDaKBMb+VThPd2rYF
	kVAClwLRNBEiz7iFekKi3QpRX9iurwFJSnJbbGRZcO2QCdUoRe320TADHCmSryJYh2RXSLiBTE8
	sVMYGGxVjO8ZQgypIH/bTaTGvqnQ00akbmEVxAQPtoQRrb50nk+RdnXeyFnWjQzf8fhM=
X-Gm-Gg: AYBFou3cyfAoaPXFs0/lwBKRYMnUCvYqp5dCDCgSsfu9tv3YVQ9hhyt8nipmavarcvX
	5dD1f5syE2rjEVx9rrRqM48O6GhdCSCxGFuMTdH3GB8w842a5Vgmru9pjBXVc6jdSGUEpFaDFQA
	36GotmnCid/18b86UHYRFAaKUef/kGSfsxN44oqZWqH5N8CvFY1TmoJgjd7970tdvWbav+uJPB0
	yoJ8VdCbkZc5fRhMrxSELuEtBV2WvShsu8dfGdliU87xqoYXcU5FfzjoZvVkp7NWAn5wLXKBORa
	wQMENLjBKoMeUg1BxarIct0+8uMuhO8lVXT6wt8JTsiScqV7NqQnIKn6R2dAQG7xLFGOGCCdYm1
	KTnqN9E9hpIMvmmJLmRpIholN2Ncftkf1FuqpRPkmSzskueO5qB1snqAboymVUEvt
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941054885a.47.1794477006775;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941052685a.47.1794477006075;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb51de7b91sm24994425e9.6.2026.11.12.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:50:05 -0800 (PST)
Date: Thu, 12 Nov 2026 11:50:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
Message-ID: <4newiumsdgb57suqrv4dgbr5tfkn733cjlhn6va2xvrpmjbft5@gjbsuzstqxif>
References: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qv4KUOnztXbPuqamvHZFU2hbFcWn0qB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfXzOYAZViW7ig3
 Ko7sSTCxh5bFi7/OA1q/DAdTdrEGzXspa9fqnZtogFEpbDHrsdCX9JMIukocKyCEpmpqfbBZNPc
 elidKmK6pbKNdnFNbOE4dAuwCj6ruVi3pSOQZaFqb+dCFNgL5NZbNqX+MkLEK7vKHo9YTnIMVBO
 JRzqBc4NYm3EmpseRtg2oUD50WSjFoVpwmuGARBrwCDpOQ66io6p5gL3kstSTrOI07Drcx0EhaG
 EnW7WnyCF7mooDsPlrEaM1eXXtcL5C8jf4sDR2YJ8lSD3IPyMJPCAFYYqD24mpPmzQT42gEP4K9
 3+uvcAi/eQ6RgKKsa3XPsXA/3EZDQVocB1TSVwa8DH7lZ7iF5DnOQK62Ev1PSEi7guR9Dh6whIN
 O83ENKnLBiEhOm4vrAER2ra4Hl9PzVMp0IaOKDRuAjuDhzdQlJSnGymqKO8JCXxuuyQqHGykCPx
 d86vWJSVy8oH8SwkF9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfXx0dql1rCNrTy
 gEeEeACPU73elwBbJoCaiij1HkqUxyJ8+e7+sq87nih54332ItEtyApUd+RwlVLW/KqrM3ysXJT
 WI0JeHZZ+x93IXNJRh9gDz94cPGT2A0=
X-Proofpoint-GUID: qv4KUOnztXbPuqamvHZFU2hbFcWn0qB-
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af58bcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vws5O8NP2Tv_UqLHoggA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

On 26-11-11 22:18:32, Ekansh Gupta wrote:
> FastRPC context bank 10 is reserved for the secure PD feature available
> in downstream. The secure PD feature is not supported upstream and the
> context bank must not be used by any other PD.
> 
> Using this context bank for a non-secure PD results in an SMMU
> non-secure global fault.
> 
> Remove the context bank from the upstream device tree to prevent it from
> being assigned to an unsupported PD.
> 
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
