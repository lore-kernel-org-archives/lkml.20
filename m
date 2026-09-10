Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC45B3C3F7B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030261; cv=none; b=CP9TRnNQEEW0B7u1y9cEnl7Vjf9k3a2Pgd5AcWJb1T9ilmXigMy+hgeQ+QGwfWkcdZ7DSrLQc+jU295zl6x1JGU+6crLc8q1KbKcTEQQCFICoVAkFM0kFDRFP7oCXXnFMmWaOxc6vbgRekSMx7YjA/cuapAZmGUlG3j5jaipXnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030261; c=relaxed/simple;
	bh=Z7ELx0xxpT8iAxlgwr0qNRiApowBB2/et1oBr4QiLBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssc5iCEsh2F/b7C4fHYwq4KI9NPqYAflOATAVieNFdJ2eV5rg1gf42uowXqsFB5a7UACGcOO4celgTKw6WwofaBvy5npIApjPNBxO9EPyZR1E1Eut+H0Gyf/eJSPpBHffoKcRtoHL4w/JI80bPqOx69amWd/+hTlZzzmenZ8MII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM8ajfHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRbs9AZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VM8ajfHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRbs9AZ4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7anlu174062
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YRdmCeGYdKolSM2/nA+SELTr
	KQJjw5qoJh5MBPg7W/A=; b=VM8ajfHfL5l18upf4TQXxZk9S9vC7wDi/ZzjRUHq
	V29wXTJeud59Q0AFU2ezSIWhFDXe1FsGxquyrQ5PMT5+fhyjAt2wRPdbYJ6rFeRT
	GTto1LbyT7uEFFJAF5dBBoPW3RCmEASnLGIxOdsZOkGc+HGParF9cPK07hgkZLhh
	ivIPN/IW9Y1F/fk26P3D/T6Yr7ERNkURvj3309DbPqTkwEqYbtvox7G1bqjvv0aS
	4OTP4XK2XesVgvSHx4VjwrISc8dt8eo/rR5WN61mfIBJxmpcvXGLnH5fqGgu8Cl4
	S4i8iu6KmHNlxX4Tx0WgIUOUdTj71mswaPVVhyiVuZ6Ujw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak88x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:50:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso8728384a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030253; x=1789635053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=aRbs9AZ4ziVZOl5j2BKAeatZcwUjsKOxiwBC4Dm7+C851ynKMne9FxifYoFo1kcCcx
         KkSg/IEdcq5o6V2p32VyM2Hf6rFGMdyVeuFKoV6E4M8PHrF0/KmBCqptBsHTRbh+unnF
         TMMAn4f3S5ChElez32mJ5PiFpliIOy20dXsiMKPc7EvjUF/AP3tIep6g6TdD0pjuJ8Dh
         G3SiKvYRduP1YiuMi58l2GClvij7NLzeZZDiSb5QOih7kTuD6QQ+CvVs3ZXrBIEm6Vgl
         MAGQEvc1rDhoMTeM6UQ00CiZ5n0pdZE8HlC85iLWzTMhCJnntiBx9I3en1jKDuBPwVeK
         QDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030253; x=1789635053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRdmCeGYdKolSM2/nA+SELTrKQJjw5qoJh5MBPg7W/A=;
        b=EFLbz9D0vPBXONVBqvBkJdfcKqR8pH3OBLzurkvuTp95ONuS+Bsq0VxKN7a9Z9X78V
         wK3TcF/IhwHecklnEL8ByaHeYk86RF3gi85QalmpM/D1mRSq/RpPOKvTy+nABcS+PSzq
         G/BNSwjzZBULDVtuE0W2qXDDu7cQk+m0+Xb7lXIFDY/5kg/+4zP2/aOR/BFDPMwuPbSr
         LVWXCZHuaQqhmcoIdPZecJ6WVJHZhGt/kkE5QrdSPaUiMpDtd3cggX6lEz7xPey1FVo+
         /jvfdnjlc+7zmHEjRZYWJ9gLS+ldeZdGdc/2M0WxlXmZYdiVC5xxQ4KkWIhyWPoOren+
         JlUA==
X-Forwarded-Encrypted: i=1; AKwUvBzaFLfcNpyhwj/s5Uylfrn/gFmw8EZX/bIaTCiVuP6Aov65BInjHRILRPxPrngWY5N+fyDMBFumSjf0+Zs=@vger.kernel.org
X-Gm-Message-State: AFuF++nG1Aqd+hLcyOIymrqk0CDz96b+5M5he8cVElh3HpAYnnfj7KZQ
	7qVD9tGggAV+FcvqasR8h8zsIJM/p2qJ9uDtufZZ2GvtM3KffirgSLXPlYQsSRVxbkPVPYqrn4/
	N4IEyYGMJVdXXLx6eePBnHMG6aWIxvnLBgs2Kn7Li+hqUq2z1Dm6DwEzHuhmcmZXrQxG6Z2lqN4
	0=
X-Gm-Gg: AYBFou2P1wLO55po8l8+6qsMJSEXKaQyreDW7/akbMMRRoXe1LbhK3AGPHO6tLSWa0M
	IOaA5mFXobCBZynbKYsp8zM16hoy3Ra/An8d7ysdiMbL8UEvR6iuxF5IoFuffz/qNT7eB9daQcE
	9yFCgGuZ326Tcv+JA/7FusJ62wTjwMUQTtKCkHHXbAYuEXBLcBf/hBz1U7oy+Pk9hUWwhIkNLwt
	CAX9PHOkprLu0Y2V8A+qBo9frbm37oLa7Ur/SnSBRhtmMmibDoh7XeOYKfJAgo/oep2ijQ5IrVh
	9SNefStJizZn2z1aI8D0Ptl62bntjQqdJT8yZCZwM+qAqvkKvP5MevVYPyGwAkgER9sYtL+h1TR
	yZAQw0nY6KzRg0DwmyJdkho3vwdU=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751290a91.24.1789030252480;
        Thu, 10 Sep 2026 01:50:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr8751196a91.24.1789030251843;
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm12817627eec.22.2026.09.10.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:50:51 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:20:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260910085045.eargbxuwmeyhlhrw@hu-mojha-hyd.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX/HLXreHFnvs3
 J6RQmgJBNImAxxrup1pvSxfOgonxcfHkzYC8O06bHE5iQB3QoYtM1pIJwsvjEEYPt41cKRi6z8U
 nyim15EqAjOVwhGbdxfDBGBJ52Id+KA=
X-Proofpoint-GUID: vPLiL_746Sca8iwNDZp6P0WgvdxQ8Mm8
X-Proofpoint-ORIG-GUID: vPLiL_746Sca8iwNDZp6P0WgvdxQ8Mm8
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa26f6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=OV78iIIr6_8e9roN0uYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OCBTYWx0ZWRfX598Jq+AEBUML
 DSGV+QG3jqc0aR1QXQEwMlv+3u+4V0UilNttVfetgI8UyYZGqA1HTTWhS5kEE1S0Oy1WhAnzkfA
 b6opl4ZDdHHna5ZvUqXQsYaH7fjL5AO85VIt1GIYCNGHwGujqQb/dCTF32Jehpk4fcR7qNwpwr7
 b8BUI4LyqxDG+/R+ZwV1p7TwWCJ2/W0Ec5hm4Gu1ksEYfeNlkwLW9YUPP4rui91i6G9X0zi7Xtx
 BMwgBGaR/Axd7LXnKf+5gAQF2HCWma6gtK90+iENWYUqFxfoFhB0BUZP1Kf9oEUeenDPs6+1Oov
 pX+GkvRfbIUOI80a6/F0mP9vepDxqsYimipftnK7xwO279sPFM756XK5TGi7lSj+UzNDNsNXUyz
 vk80LcQ7gVLGXIAw3pLqxiBTK3WICZ1EYfm3etN/2d1TptSfEUWAZ150wmU106CJ3OZ0wjd25wk
 K0nZngnOyHbgex/EQOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100098

On Fri, Aug 14, 2026 at 01:03:34PM +0530, Mukesh Ojha wrote:
> On Mon, Jul 20, 2026 at 09:03:26PM +0200, Krzysztof Kozlowski wrote:
> > Merging:
> > 1. First two patches via interconnect tree.
> > 2. Defconfig a release later via qcom soc tree (dependency to avoid
> >    surprises).
> > 
> > Changes in v3:
> > - Update also Nord and Hawi
> > - Split defconfig to separate patch #3.
> > - Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
> > - Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Patch #3: Switch to built-in for everything, with explanation in
> >   commit msg.
> > - Tags
> > - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> > 
> > Similarly to clocks and pinctrl, interconnects should not be a user
> > visible choice.
> 
> 
> Looks like this got missed in this merge.
> 
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

All this while, I was replying on v2, this does not apply on
next.

-- 
-Mukesh Ojha
