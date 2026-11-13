Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578592;
	b=cz42AhxfMcP5rScEZNhyRSv2WGZNSbkZ6aWnhZL2IDs07E4eSPVP6PNl1D7yynftyosS
	 LJy5IgxixMseCHR4OXxNDIkIfdQw6JuRZdhh+MSsg4qK/D+RRbrwCxf0M9l0SfVEHjQYZ
	 m2izlCToPh7oBUIic/cWra3zU0PNl5r8yf3+HPE3fiqKO2LcPCF5+uWJlPGcV4FkM95LF
	 U4yPEzGnsHAXd6XhuxTz3J82g74oHIdAP0Ojd20ZODTpp2Ex1sDlK0XVs2uulEORzYs9R
	 mgMpMLek81gUZn/plNKYZKpCxAcwiNGax3kKa62BOnqPosX8jCFjGIlhBhkyftOO5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578592;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
	b=qLSutN3SXkhHMRy4NJLAv3TB81yutZM1+9fEFEJxsGy7Z7feKvtU7xCl0gcCKkTX/Ahu
	 H3/bQbroX5mRIDsAuFBluPXzknIaWE1WIbFrrAWnblWYpRCREmNcNVu7PxVgIIePmW6Ny
	 6r42zvgeqpXAEpFv0NcfyzpvMlBqyaeofgD62DalezXSQFKeZvtohTXhuvPeWY1u2nO/y
	 jJy+CG/PypwyzzPaZWkjrcwvezXcr6aOvcrX6R294oeqlnHsEfirj1aBNy1ddOMFOu5uU
	 pqBLh1HDFkv1qKWeCE022QEn8mvvFEq1QsPPI+/9PBVaEmbm5VJAalo/T6IE+/+483Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DADE606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DADE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpIKcwok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxaKRxvE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKhtU584044
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUQvuhQRh7K4F7zLr9SKJq7Y
	llsW7TnD6WQcJABt4hk=; b=BpIKcwokkcfc473Wb1waaTQpz24CG5t2Drjgdfyh
	QAi1XuzySvCtkG84x7BQQqMIXbGfWGCd5ZBT4c9tXoIm9IY2z1fu2/ADsPhBUBjO
	ip3FWYgji6ko/SsIA9YxBcFO0gwqOPD8+elVqrBmJHlvu7l3Tyv4DOJMhDl6QsMK
	racnnoP2S6ZvmxFaSCE9VL+lb46SY+AUEyhmAzfH+1ccI89hZIBVV1OjyrYTnA7e
	5PckpEik4d9HtCOBJtWb11yPWzhA63A7CHMqUb/iNh7usiwfJ/UGOjjeGeeBFBqK
	VelUSdjsvXturnL0DjSwxVn4eNahUQhXRNYSz4S5Ygug7A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0am1tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:03:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac41ff334so1313398e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578590; x=1795183390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=CxaKRxvEJ7eIdjkSbAeOtzK+KEOsA3TLChySfGd2V92AgQ4ozRv3KuKrT1M+DM3ly3
         w56r0fNpuXTxa3m+glhlnjoYftD4aP7M+QAxQA6Jw4/CNFdYjdpjgpMCMXDuthaSF/2k
         vFpo2Npgq5NTZj440bLUkPJZD347sm/aAO2SmSBpb6Jo2H/BUjIWlM5zAAAg2Y42Owna
         xmCXBnPWwhMMSuVQzfHJd0Ii6IrZfCSJcsxQEACWlNPkY0oITwMRXcQ+ZsaJHrhgDrnw
         A0O0Bu2eeMXhPA/tFUylzjnkO8exK51Sd3kBok8S3FRWl9Yyue/Hu8XqkMdJ9K4tUk6g
         90AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578590; x=1795183390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUQvuhQRh7K4F7zLr9SKJq7YllsW7TnD6WQcJABt4hk=;
        b=RPWiYU04KTueXB9+c2caxAE6osdWJvcvuuHzUdWn+GuQ5ImdZfeNGWYc9PlJVk8qdJ
         Sofdfmx3cUMap7QX9gg0xoCJbsfmaZX3rNMW/7S0G9omysfYLGPPYzhVGo06KRThRHTR
         +DKqVt1aHMzgRAKQA8vpyY219M1OgaqjEJgzBzNKy510D1H5QKQQt/ByK+/i5tRyfoSv
         uE/pswC8FJVw//9z2irQeos71vIsyyYuKAWx9GMKogaD8Oc2fvNAGVr3xv9zbjBRTdjh
         Si2UUl9O9B8Jh5i7V8FB9Ns2NankiEv8mRZHab0s7jTLtzONVBf8LMqm+/TFg8ZPUxg1
         vGrg==
X-Forwarded-Encrypted: i=1; AL+hErEorx6nkhUJqmmo0LcfbwcgHj7e35KDKRtNZeQikbe+iD3rp+SR8yshoTGx0e24m0NKjpa1v7PBponhLfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H50TWOyOC945nMiRW/9DP5MMnv/kXpnbVz8jEhy1vqDGOeL0P
	ENKEy+TANfQh//eGSdk9zL2OUubIF5KthJLy8YSZB8ROwgGT0XhN1w4epKTJJOc1eZJltw4olFV
	H79lg8rfn9k1zFLvT2inTIHcEZtAK3j0uvcy5p0EQL8DNYJGsNZYMvylfBcf1ptf96Uo=
X-Gm-Gg: AYBFou2Lkrp7OnQnuVleToXQqcOBzvpnuJdO6ojH9JKO+44XFTinjZwMAvWKjwXccYn
	JWjdp2sX1DuwBo6J+fZpOnI2YF8jnvSXANJQorK6gS8m+v47sVLb7S7bW+TtqJ7xYdWsrtIQZdK
	Ae1yv+WvVlKuM1CekwegcnfQKEHimWDZGzNLZpxKM1jxdUNvoz3ICWacykrTXZ+FcByXAPRBJ/4
	u/46dlaayEoQcTGobcKYPqez1lVX+smxHtoyJQs9OXSJ7/TdTtQlcfnh1DmpNw0nsTKiwb7Lwum
	tOHeD59NlCDtHdArS52xpr76vzfPMtCrjKgAdq2WgaEdjPCWEGgT+MBolwv6IH4dw0Y79UeBUX6
	1iuF3z2+QtIlcZstzr3AV4P9neMhUN30pyr+TCW1L2qIsEHTdH6SlDq6B5j28TJiI14XV4JtDOO
	gR+M7HoFHcVPs7w2ZOVFYM9LJFZhYlOmpyR4vweuRkwY1MzD/diFduM+rD/hI5Jg==
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861258e0c.17.1794578589757;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a05:6122:e22f:b0:5ee:200a:8cb7 with SMTP id 71dfb90a1353d-5ee34aaf256mr861204e0c.17.1794578589099;
        Fri, 13 Nov 2026 06:03:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171348084sm769004e87.54.2026.11.13.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:03:07 -0800 (PST)
Date: Fri, 13 Nov 2026 16:03:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Message-ID: <ooeojpbsljfgaj5iuzkobibqfv7stvklom32pzqtivswquosew@dfsj4s6cnkbp>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
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
In-Reply-To: <45da00b9-c7f5-4c4a-a310-00c2ba94cf6e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX579mla2Bb1B+
 6ec3W04NiHcdPRWF/7iTRejYXYK3+Qo/FdQVox/MbMNGKAWotvel8mAFaX8FqsZ3lfJe3YmKqwj
 Moc8HN/vF09iQeN9SxMqWioaM3AylhU=
X-Proofpoint-GUID: XOAgJPaJxLKXGlJsph37l4Tw70cA8bCY
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af7189e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=PDbGYQxuVRdfQqe5cAkA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfXxPsY16uAMXCE
 QddcQ3dIu2Y1Xc6LfY4sEwePyZHb0Yqn88o2jAZHSFAByJivQETHiylmcZ/EQxFg0teGSAaKru7
 xGJcpb6SB2b9DBnOMb6IcgdKRdE13pWVjqEmug1cstOFziH98h6v+HL0LCzaEcnQA4/u+wj0V0N
 2RyAuIjSTfZRnI8ujqctWBPbxMqOBWOokZIWnR3+XKyVScXitvbaF9wcDcbuNaiDnrwfz8XRn5w
 7Ek07XX1ChQHwNfiRnhg0mVxZS+CwFj+779miRaGR5fi0JiEg9rX1aEK4ktE3/YrwgdzXLsxzfx
 ebnNMcyTGji+Fn9IOznuReY4FdAGYBLXrGEIOh8fY6D3fz6F0gaGhtS2BwB/dC3lra66OvDmHVq
 uMm8bR6nGnanDVFrHw22EjYKbDig0VnDC3ExJEPQo8m+EHhSHqg14hjQePtUZWGMqUgRHRmbftg
 BVqHRjXx9oU2GM9z2EQ==
X-Proofpoint-ORIG-GUID: XOAgJPaJxLKXGlJsph37l4Tw70cA8bCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On Fri, Nov 13, 2026 at 08:52:08AM +0100, Konrad Dybcio wrote:
> On 11/12/26 9:26 PM, Rob Herring (Arm) wrote:
> > 'syscon' nodes are required to have specific compatibles, but the 
> > MSM8996 SAW3 nodes are lacking one. This series adds one.
> > 
> > The binding should be applied with the dts changes to avoid new 
> > warnings.
> > 
> > Rob
> 
> I know this has been a thorn in our side for a long long time.
> 
> I believe +Dmitry had recently come up with some patches to describe
> it "properly" - are they any different from this series, Dmitry?

No, on MSM8996 the CBF SAW3 block doesn't need extra programming, only
the voltage change sequence, which is already implemented. Historically
I tried to control the SAW/SPM directly, reinit it and set the AVS, but
it seems it was a mistake. Pending patches (sorry) from my side don't
touch the SAW, the CPR3 uses the APCC regulator as is.

> 
> Konrad

-- 
With best wishes
Dmitry
