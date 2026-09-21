Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8EBA45
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978532; cv=none; b=UtOwvtyLNWv5vVMa9jSKrBZTo+FTpHHeZCTPC/X6F6uScAtTlei3AsxuQr3sJXrXS3PC3rdbbJ5hRdFnWipEVhvKoSdrwkOTtz8kulcOrKDZdOJbiFen+j5UDFvMopNYzRJd21gSH2yEpYHJTqMCfOAA0Is0hxMBykzg9YRALQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978532; c=relaxed/simple;
	bh=/o17aeQpgijRlxtzZDnQOtrwdMXAWUUf8iuyJjuFB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0OhNN18BHJdK+HP0i6MK4Za9/z/dqvy5sM28MMeR/JC3qfcnn4sinwhl8aUxbuRaW4hnx6b5IE79WSVJiAaGuobM3zHPlEVYPY9Db5QrgOKZlJy+hGa/aZgtY45eY/c2ysGdPXlhVK5gAPNLbtcxHxYFkOZbZC8T4TBwok+u6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYtOC6JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1gzMn/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYtOC6JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1gzMn/u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7APML3351593
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhh8R7B3dmTfCmH1vu6b/0r
	66BrQwpPWHEDqb0z2p4=; b=YYtOC6JHoWQ8RkNZYeJWyDX9pHGrXKIbLQUHxy6I
	zIoLmL6NbBBIEk/LsUQfZWxk0vVb4LuJs+LOzvborzot6TUqLkZBc0u2aenWyNLq
	UjQTqiUa2c82g9RGSh28v6GJ18jV8WcRzS/ID1mNcSfGFs7cOv03dbLn2DXj7Fyj
	VQD305oEorgxHqafJ8SjgRJJOOcQfEUG62PgMIdi+JuRiiixYB679knjSZuRHs7R
	KdKeghEB4aAdRMzmJBfM4CLqYN9kaSH9AHGTFcPr2fRRvpazBiT8yDtLFQ2g9UqY
	LOyFeFwDTK8EcmXNShHOIXU7urEK/OBbEwLSklb0W1T22g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq799n54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:15:30 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso3972143b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978529; x=1790583329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=L1gzMn/u7r8WC658BzhLPxDNmXaMWyudRmtQCpOaSm9CKdX7QxAsdKtHo3sUibt7iV
         1YfpwuWzbutOl0EYO8Z4r8l+oWkH5NkeWH2Msoqa9rkPdIqvRZG//tSiyJpVYcYl83K+
         /OajSiqPRS0tFc29SSY8mvaMsUx+014bfuFnb1t/ySwLPv58woFEirP21PqymJYUQCmK
         RQTD/zgqoJJUxWbSJd/STRT6OL0HbY6GCysgHzpy4MTQpc0ZRBybRiZar18mGlI0nIQE
         wJWXq5+uGaQUERuiGUkWxLeO/5jpbIcASKyMahCMDRaJkp8RL/f3JfOQSr4uM6zQjZ3S
         qCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978529; x=1790583329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=e2MNiJRgsY34Vfe41tauquupvhAoD93snRXHejKAMDxaR2ze4+JoQuN2S/jmULwDDr
         A/cDh1OuGoJLMjvteohylygDViDb3Mbp9mFJ9McZjs2R/Zgs1G+ek/SFBAgCmuj10tB0
         g7CFWgFjrdUwpXHtezAUz9yR5rBLBd9o30WgrTpRjg9v8GlerfhMcqbavfldJxugd9/S
         FL7j1oYR18JGl+XmyID5aoRkRWHkc9LG5/Ndm1ntyP0cc4pe0jL92UVzgAbiI1Q6WExk
         LuNEkhMLbE3D+rwxqPBzziPUsaGosLQSpPs872NTt8sgxH/2Eay92x5BUa6Li9xbMYF5
         W5Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2enVDpGVOe5pKQd4g4/vErGN5CEzbRpmeaVgvEBdq2wMnCDlrg3MLXiGEg8h3Drhxaqcn2A3zXCDDmE=@vger.kernel.org
X-Gm-Message-State: AFuF++mzKsPsjWkX3+NeNxMf1C/kt6irufPLHlfrViRpmTjVoQUd79is
	SbA7EnPjG/WgKV/bHf25xEqZgwt+FA/1sEqjN9DcPbU2pw7g54QUw0T+qLiyFt/Qh+XwSkbDLmT
	xbUnTklplJGHnn6bYKY+qoc8AhKNC/tVwbnkHj55RYvB+zxHPX03vrT0vJMUo/vAOJylfu7scO1
	s=
X-Gm-Gg: AYBFou19S+ATHnRtJfNVgdwZegfKnA6Tl09YFPOFOaZaXbwYh7+7WK2Zdz/z0ZZKvim
	An6SibetHHoHNge2lPCMxiq6OJPOyeZiNcuCITMAd8dmipJpwSMxQixRB+eAOrEySJerCM1z6aN
	ujGdD6li2FTOldM4QxAbQsKoOelrdLthKCMBUWiBCqPIsTPQJJVm9MQEG9YRAcvoP1FP2iGb/bi
	ZsTEeLIrBkXAZPAUyJx+J49xTsbzby4HHEV8IJWxmf6Z0y99cm6COjE8i2IYIrOV67QpkuMaTU3
	OtT+N19oNCkagD9XLeJGnQUH/STZhwNYeXdQVRjgWQCjcVvzZXKqr+rX5vq5TyzKzXZurzOzFFh
	KO8IX8GryYf0LSW0=
X-Received: by 2002:a05:6808:4fce:b0:4cb:818f:d571 with SMTP id 5614622812f47-4ccf892f2a8mr12113766b6e.25.1789978529575;
        Mon, 21 Sep 2026 01:15:29 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836534185a.67.1789978039250;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd2bfe3dasm91475615e9.13.2026.09.21.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Message-ID: <qecwr6lfb53fjjsrloakyhopeavi5c7bnskwuoyw3hviizp6me@fj2zhuxwphc3>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0e7a2 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfXwErFlRehwAp8
 0EFLdyEsiDdx3jY9Db957ZsWo6lcuL5mOFNVcFhES7CO5h1DRJZXisj7+h/F7S7eVaAr7tibIso
 uMW4uumAFs234LPozKlCQzg5Am32vJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExOCBTYWx0ZWRfX39U48K+KX7IG
 aMh5BUamMWq27HmnhZjLAMyU1xGVmBuxmkIiYxHBdGh6r2MCRzU61K4XdJvE5pVzL9xh+xKvK57
 R7BCB+3oBYxXQYafF+dFeQmN09NXccHncph5/+oHJxUTsLbUuaD/X7H6kkRn8OEnQAKE1jwYyLR
 0HfDrR2PkwNJnWcEdwoYoxvbIvC/tjSHeQdCWC6U+aIhYxrm/QZLWBOWklXtszno25sT7Tzz7tQ
 qG9fmB7AQtiSzNZAmTKyF4ANDeZDubb9oOKYkAtVWzAGPOrpcAemNLuPuMo0AaQMV1xw9TkBHD3
 qve2KEHthfIS2R/23NdkHSvFXaaSjOGIJpDUHTDddQnk34OK7az0bycsss5DLGnwL8cPXmv7XFh
 ubhwk+Y0JkpSX3ydffUBcVzivW32I79HcCoS92J7qXzidM93mmKMYXme9DOrPv4V7gnKHupYWXi
 iYZbtgAjaXHW33LeYAg==
X-Proofpoint-ORIG-GUID: C6cynpfhkeiUBRQyXsgUxlI-cBTyctEs
X-Proofpoint-GUID: C6cynpfhkeiUBRQyXsgUxlI-cBTyctEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210118

On 26-09-19 10:14:58, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
