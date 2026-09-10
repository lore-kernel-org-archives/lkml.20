Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA13BE64B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028829; cv=none; b=atNy+f7ILNvQfvQfRJUCJZOSO5kK/z02Nf7Lc8UbMW2HrZLZI4/H62iaHCjUJxqqcX8rk3j1rJ5dWuYVnSvw02BnNASwZvlpzvtvGlrIKEx3EmcEV8egE87fNUyLSPnwEgf5DsRGC2/CiXhcrVvQmkBgXoBB4b0j7raD2896UeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028829; c=relaxed/simple;
	bh=CZumYX9eKEG+3MyRMIeHZ2CqGtJVgd49p+sc5m+sVU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuIPdQS/Qqwv1dtHGcTJedi46fMiw82NWtmElGysYGKK++aF2hXEaFkdga0xFeID8S6HS9y5ypnkNH2sy81TqDq0jx0R4eQObZCjXTSnvgHYAaaewSDKx/wf04C3aqivIuNnpSw2rnEIMrayr4+y5Kh0NEBq8mPwvSek5VOScKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crMc8DjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GB2deC9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crMc8DjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GB2deC9N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GhAi162449
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hwsbbABhCqD7YrBomZaCutoK
	KqKwzQ6UY09UG4GpRbY=; b=crMc8DjEAyr6qLp7n/ZagT1LKa3EoT9uF60hbAxz
	PIQXQ8Yf/R9GS34mIsbENDxisrPcNXfC8Ben+LUca0uZgaz1GEy4E5yx56e3ql+r
	Z1S35xt4I0gn3GykQrQmqQIA8e1HQBNK3wLpXX/B0/zrvgxfzzkfy54aAArPAfRh
	GL1CP7YZFOV/ERMKkYfaU3vuGVPYbaxrO7Ziwx5dfK3F3zHwGZ4wuvS/VfJ3xn6T
	Ia80vRTJIkZ6I5pcm2JkJDxYItA0vNe11DCFEasUTu6M5gZTfFkeWF1vuyC32ewP
	7Sz481WZ5i8qpcCXxpKwTdxDmVDEzddpxrx2e02Xr9ATig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2xjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:27:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so10694398a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028826; x=1789633626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=GB2deC9NtD2vNWDFz6DUqYwxCLLLuECHT8aiZzTeNmV8jossLdOkZ1cC2gcC6ct47T
         zlED5bT1+TRMe1flM0jilUKgS4/fCfpRZsn4Ak3/6lzIqYH8cnr+qK6yB6vd1PZZngNb
         A1PSTDHkTfezJtVo8VWTdR+IU/io1TQ3bQHnQnQn8hB+e+U5EWsSh11JxC8gPp/hkrYN
         zBKrw0HRmFONBDrgUKlqLfJOiBg8U+VOHEdGYTq2XgBuptb/EGK+mSy6TebzwBqJSjcK
         /M6mvCx0vzhqueMGv6J5fqeXFpBhkxPlX7bmyke7cVw0uSxkeF0Tv4m5bXI3Ddi47f/7
         jXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028826; x=1789633626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwsbbABhCqD7YrBomZaCutoKKqKwzQ6UY09UG4GpRbY=;
        b=PmBXuEovx5GgB0ZXsQhmlS5iE075vQs0EyXWHd7fkyziha710py/a98CiVcfErufDT
         kLM4fAcWtzqz56Ud/H8Ro41nh96ZTP2Ua8TkZNorItMTbOYGrD7fcAvtXf8ZwnR8ImBQ
         aEC5cSMzOQkep6AibYAL4UHbVFRZiXvZzvHDgT6/S7Ka0Uf9UULW5wAOdVSyCbZFeXFp
         goC9+IMcXYu3Xp18w+eQd/75yQJh3Ws5bPqBm4/+a5M18qhwTdiHw6UlqHNFTpauol/V
         YSlHeIrG3/yU+1s2en5AG+lHpduUv4ztS+x58bmf6lrcXRcr0TmEhFAPAH9VMIQAJjVP
         C9dg==
X-Forwarded-Encrypted: i=1; AKwUvBxi62sTU0u3Cv/aDenYiwxjSr9Q+Ufv1hOePTrTvAQZrfqKS0Xkvs5dSlnEcC5wJtBhk3aTfWzvLEzeEkk=@vger.kernel.org
X-Gm-Message-State: AFuF++nGpB+B+Vqo+00YgqC/qXjCNzEK5DQzlMREjYWaSO08jNgWYLP2
	b+nKbdEjA4X+cX/CKHBiPsV9OkGbLnx1a0T7+aaaQXJglfFwMpIb814Yd4Ngduzea6eXaw1NNYm
	h9rv8xHlc6iSM1HQJdS2r8sVkc2GjLyeXvV4DNso3fp4pwQ9SIsIrHUe82ZyqCytXnFEPEZUDft
	E=
X-Gm-Gg: AYBFou26kf0mYp6xeZGL4ffYPSfl7/f3uzbssS/KzQ7O2UZgLC+QCV8/WWBzWa2prjU
	qoUHW/su49oUlQ4NvJwxEVpFClLsnP4EiOXlHhOSMA6oJa1rlPbIAhsKc7qBa3t87AB9BqqiKKo
	dDDNuryq3y3KXu+8QaCF1hzrOWB8Hq5GaKr+GH7DMx5Gc1q4DiSyMU0Oh2lS2XrCNtVOXeL6UEU
	wLvona4lVUE9DXABRYxXL+QWhrqb4WS/PsLFCNfH9JrY/jUo+03umFY6ppj1zFOpgnnCAaJe4YJ
	7pM2eX8JAeGXXX5iCTD06rjRYv1GIG4sx7YD1HD0vx27sCu0CmAfD5EspC8PUnG/Uboowx7Ey+g
	c987yexI8PH2316qB4Vzu7B2Eo9s=
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554919a91.8.1789028825614;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39d709dfda5mr8554868a91.8.1789028825144;
        Thu, 10 Sep 2026 01:27:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm27957557c88.9.2026.09.10.01.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:27:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:56:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910082657.4egpdfaaqm3jlroz@hu-mojha-hyd.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909062907.f43ahkic5bnv6qja@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa269da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=lubSgy31dtm7KxBdwZsA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: hJcp4yfqC3JaS2xWO3AsvDJPI_o4DuCV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX8mgx7BZct7JS
 0JWUd63w/SYk7PW6XmluKTL39sRN7zE8ppGq8uSPu5jvnHOgZ0QQ9NqbOFmDMSXel2WVydxIgKW
 U/bhdN4cIDYjYjrR5b/Q8Uv93ibsdsB6ar6N+UK6NmuIayn1OrrM0ZHtgyXNff8RRtedbuupxb2
 YfrVuAYvWoc7kAWoID3mamktuNu2ZpxtS8jyaDm0utnPupvu6efar4liFeLPOai/h67PWKPzBgF
 TZIwsdT5xmUfunHPrv6faSCD+oiMVVWUNIZ6pkhDMd4bqKDuld6vMY9LKDLkVnnQ2xcsA6SKFyt
 AXyFROSrEv914n+LZLDHZC0a9UaVdxNw012PVngmGzbIfQ86UTMJDdDNLuO35k2wxsNvy8wS2Yg
 w/WoySCoq/TVDFjes0DMwB1M0fpV70vwvdc2vD9MWI6SCUjmC+mDhNL2rszKztMWIieeJTfDCx4
 vg4pWXFckfgSumRHBGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5NCBTYWx0ZWRfX9NoknV5a8yW1
 Zmjbainjv4pNfU7dXPgWlWspIo7MXcqhOa9qJo2Otqq38DxQycxQ/hN+xai+/wlswNdvN7zeZXK
 labw8NX/xvhdrhGc5SnLvdj9e/tfCJE=
X-Proofpoint-ORIG-GUID: hJcp4yfqC3JaS2xWO3AsvDJPI_o4DuCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100094

On Wed, Sep 09, 2026 at 11:59:07AM +0530, Mukesh Ojha wrote:
> On Fri, May 15, 2026 at 02:11:05PM +0200, Krzysztof Kozlowski wrote:
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> Is there a conclusion on this series? As I was depending on this series for
> Hawi interconnect config enablement.

I see this does not apply on linux-next.

@Krzysztof, would you be sending a revision of this ?

-Mukesh Ojha
