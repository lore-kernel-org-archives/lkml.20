Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864735E936
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979200; cv=none; b=ZMUsaXP9jn9YDKKOjWktHHbFhOcmMgG21mMO4h48RPS+uA5PqwP3lzj0LEEP8R1//nOIVUfNDMuTHrciUk95s+BveP6vU+K13X4EbZKTzOWUYltVALV8GSBXxqPavgamEvIzIh/VvwyrZqfz67OkxokIR20lZ6Xb+lEGRkAa/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979200; c=relaxed/simple;
	bh=Xl/NMdxNIdIwy71PoNW0gEeWbpDi+/99SNfAYy8JEs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7tzb1JKEIn2B7MGcaSaP8Hcrou/RGGA1AM0vQKCxQ2vCSWteNYMhVBX/xoqbcArUaO/hesMHepIbOmEpoK6FnFcbH7qwXS62dVxZ3Pf1Nkd1pkGCpAMo82H8Yltb508HAVAmQBq5SpoFcn9saWMRTIaLk+ENsamk02VLpX8fNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXPqknzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hlE4Hz6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXPqknzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hlE4Hz6v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7WGA2477368
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L1C2XP+2jfyRhjdeCy831On/
	7UNJ2WwjCkzlhJHp3I8=; b=IXPqknzPeINgOgEbyAJjRW2raYOE9+9nx18zae2t
	OBrB7aoXirVt+cjnJGOICErAiPoiz6RyQp2SySbfDFusWQjr1EvoeEr3UUGMvDkW
	dQFzYYbtFqOD9TG6kz2VFwgVOPqT0oSgHBm4MyRuWNyA7B5MaiHnuyCoTkbhwvYm
	EsmgPIlWkwt8SdQiz55C2pDVIDDaZ4yT70s8aE/nnNpbTprwtdzcGUZUx9kQ9FGd
	YyFw1Xc3f7AAj2licaPK6ywKZo/naSLnf4WgkOALPoLmyqXrxvJy5LFewDZn/6GZ
	I33DSkkR8X4rPxVXkWfaUc78AUxFDEyi4n6SsM8sr/sTWQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cntbxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:39:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so4115004241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979197; x=1789583997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L1C2XP+2jfyRhjdeCy831On/7UNJ2WwjCkzlhJHp3I8=;
        b=hlE4Hz6vWC4aYuzCb68KyFjByOGpmBLTrwJPyiqFaCQcCjhBeU5W7ViM62VwHLrhcy
         sZFyoS47QX2m3/g614NFVTGabP8MAMJaNgEoFS+yezynUzPEI+u9UncMuLZ4B0talTPx
         8FxFTLKwBQYL+yrYUhiesJGyj6kCbGY33c+m4/vkzzS5Mr3+xulw+Rzo9dDTT8QUoz9j
         WdvvD5cGdFQRXs9okExRcGUkYZ5IZ+lmKWMHy0gTW4fEDOJ1BnmPY/xExJfdwplnsYIx
         8IfteT1yvxlOCQlbHE6V/uPd5xVoC8azYfmNX1dLBQ89n1ryIXbjFp8mFs4uOi3rSbrK
         NZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979197; x=1789583997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1C2XP+2jfyRhjdeCy831On/7UNJ2WwjCkzlhJHp3I8=;
        b=OT9KuJcNqcG5t/Basfg+H41GpNryS9loV2RLNKYUM7c5XrM39Rn4fR3faQ2De2oWUo
         ccy51uOstWqzCeQZ1nTm6HXojCvQ3KNleXWkiqPz6C1lSIBErHGC1N9ogPA+69E7SDsE
         /CEluCIWlLVIwNlqC9V7gFUT/3XmFxNim4wS76YrPTfaYrP1JfOh9hJ6AO94WvONkeF5
         zZ1uWbXE420Smr9ya119jSVK4cXBYwYUK+4aHZrn/OqaNnIqK8Jnp2gXHHvzw/W5i9RV
         i0StZEqVNTCsknELE5RNP0PYf6Ke3a2JbFW8gLfLzlUCWH+G8Gfyr+PEr9d+g9k5m8ki
         feTg==
X-Forwarded-Encrypted: i=1; AKwUvBwMepnuda2Izmst7HNOt5Tgw4akouZ8ZKpi7WIqj5LjdYySq8Ud1W1enCq//3jhO7h8deM3zFpMFYyytWo=@vger.kernel.org
X-Gm-Message-State: AFuF++nZEdIqtwVm62T3Ymvp/pBUHPY0H9te3PECxbPkdMi1VHuSCLfy
	SRGyO7NOXXgSn7IcMya32iRDHqF+gMeslwIkVRR55NQjoQ7LR7vzJp7K2Q7swjptjDpQnEILMMi
	D6auPkmnWWe2FhTI2GGTw9aX2U4IO3Cl89nUHZBDbDVthZGSB83L74KU+ixl5E8JjplI=
X-Gm-Gg: AYBFou2keE4eKhkeVfiLVzJWf49Osu5KEVGHFe75OYsxDzpiFSj3eYFnjtw36eP+lA8
	bS2TrSkyhHCV/L1cnZUAZH2XoWIY/lpZEr1dJa5xtRC323sN630C2mJKX6ycarLNgb5tk3yTnO6
	DeVejzUCKOp5IUqmhK4/AsuvyYKzXXOLFQ+swI9KAqJ0dYD1sqXVyVDYkMGGzOEN/8juqk+Bt1y
	RufVcZdIIZOBPsTULv2YpKhyX974+9x0qPwUa6bpluFThu3QAhgLMGStxBVNywmklq62YUSttMc
	CAZM5EHszXa05HGEU0wnB3eErWL6i6aIIJfqZDgG+/hkTDQmpCuXAQ05S9ySysY58piLpZMeYTT
	naVtyVMcBRfWCMAFQvlDamSg3Rzq6gpqH3mXGGSVXzgSvKE6dTK8uIoNBvOWodrmU4TnB0HK0Mi
	LfjBHyMEEfRG+p
X-Received: by 2002:a05:6102:3e10:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a4a87907emr20355922137.5.1788979197338;
        Wed, 09 Sep 2026 11:39:57 -0700 (PDT)
X-Received: by 2002:a05:6102:3e10:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a4a87907emr20355895137.5.1788979196910;
        Wed, 09 Sep 2026 11:39:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899e5612bsm85937e87.40.2026.09.09.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:39:56 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:39:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] interconnect: qcom: icc-rpm: Handle
 icc_link_create() failures
Message-ID: <ebj2obr64v72pibugbr2fvu7rlm26xvgwqooekz4is63zb6kbd@yejnzo6g3tzg>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-3-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: YpFfTC8_zn2TWYB93CVEfLH2iIN1JlF1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX5hucieL4F5Zr
 iprM3LuxxlNB0nd0gCzNpc1T3EoXpSXl5BNy6K+YhAuz1cCjvdImPc3KiSe2CgWLAAJlb7OTUe0
 KmNXXb4/Qx2p8Te5ShywYhSWtCwcfbA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX6S8GVjrMPsHw
 1nJ9MP0CrAwhWXYPtMBWqRlvvyXs56Dp7kt4uGNwox9TyN7e2pnKnHG6jcVhonZaHWQvKbpboZh
 IREcAjY4e8UMMDoRLCQdkOeRZcwah1G68QXn4RDrksVwBSL1+aIRMGYysayORyj1iGaXG/Oie1C
 sfH2gp9yHnw9TBTuNDK/t53fLSlxROphfoKOLcaXRduA5X37mHrSbPPgOyg43FfeXB3p2gbn4ZL
 kljQifr7/WG64aXbnBM5nYc8VlKiq/002VLvzwdlOXEddjlVYyHjmx+Tr0j0glX+utKEpQTPq0o
 YU+sOrSgEojevBno8SKZFN+SaII9vgE1LucZpRv0p6ITQUyQeaoa5f7eTrWIO9PgpgfTNeBCahn
 3JYqzvA4L2PbyevnbiOC7jIbDrj4ZwSpfX/btn59zTeyMAnb9/D/0JHC51sDhk8kjsJo56daEJ/
 kM2jGWNQGy9VIlXYNMQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1a7fe cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sWVvvRLjqkiOkWxATgUA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: YpFfTC8_zn2TWYB93CVEfLH2iIN1JlF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208

On Wed, Sep 09, 2026 at 06:41:56PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> icc_link_create() can return errors. Don't ignore them.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
