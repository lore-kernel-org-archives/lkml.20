Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572259;
	b=BE+SJsIkzWdbYKzJKIUmD/yPkrFaKNDmxvI3pAroH0wGmvYpMt3lGyPtzgDvCT41DIoI
	 XOEOiqM60SzlCAWYhxoENsdyApvMD8ljgSXGgib6ZISMYV4mszTyMywHRxXmBl41Yk+DN
	 /4eYmRqZnAk2NCu3g5iq+gWpHaLHbbdcp79dwMz4zrqD3DbkiOP8+IScMiH/h7wzw5eSl
	 5pTOXNzy3kiqy0k9cmAVL9JXxBl/stYUocCZOL06BaYnBz/bjsDL/oatU9fEHJ7uswtcG
	 VL1XDsj3ZxeRUpylEP+42R8QGWgt2p0OdyUQq4FNRV2TF/XkGwalSFOxgQxIsbWxq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572259;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
	b=CKWmAxyI9fDOE7xDn0DNMxqetSWhr7sFkNiX4DmKYs9aL6Vn7+uE2ILI/vPtUBWjV1cA
	 FatefejaaGwvO2v+hfm/CdUzXu280jzyfx6/eGzC/z+ZagRTskIohQmOWcnJs3rJmCjG3
	 ublvBs9bjm1kU55Esy/bJRt34lcH0YvGbpcCun0xtITytkcwoTY7Zj+vOX6GK1cr7u8fd
	 eIEuPQjEEtOrO4yNEPdbTtNSx1mAr4Sw6RoB7wLqqaoPIZz09BkkcRB2q8H3qEzBstEos
	 qNgPoTFEvCTKjo88p2c3uaM73Yi5WQ5LVTOVLp389ekQhJLg2tAPZTvPzRB82ky2MCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpOfuolR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6o3TTCN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730EC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hpOfuolR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6o3TTCN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6Xbxk357330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=; b=hpOfuolR0+jKVMpo
	33QmtwARAa+o9NzRh5dyf6IyBefKjPOMZI1lAepMKOlVF9J0ePEmagdaUja7zH2t
	ISBiFiYMRGti7H+dW7oAYM/zYjPE0IKzN/3M5fYAwVhxOnmAcaRNI+luwPePzVHE
	yFYHtBos0Vl5GNjs5z2EslrvwCfVn571NuB78rxe8Fs3CH3iofKDzq72CXBPWoA6
	qAgdVjlPtenDeTuaCRcjbyhYznntgOahi/faGirsK7e4L+yUS6e3jysAFOYhNqBM
	AmrC2VZeims1+NqF2j+yCkz0ZV8rTbioXB9TOFiY92d4Dc/ywx8yTkNP9wz6Y/+O
	VK1pWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk0a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:44:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so10230285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572256; x=1793177056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
        b=X6o3TTCNv/y9QntxIJEp67V/dBBfFOfz3HjJWKE3DHaZ9rMjLCzfNGu03+H5DFvM0w
         PQgTSbiPec7AnMHYSoeRgTegox51XNfxxjG0eEjvFctZrSo9vVbp7+6jlJe6RPFuth+g
         rFz86AA7WosIGdmFTdqBCFYHhXscDJ9EJuV86y+Ei37B65WO6OKRDpGCm50xkw3uaPke
         fOKYqb3h9LrCflTGsKScktHexCIN2lTxLsPkc8t0A9XgyRW6EnKIkHFGu1j4pGBMrkGN
         EN5XoZiYIh3SdlFHHo20x1JCbEwM7sSi1kygrJeP04bFwxNcRCdlFOdCVU0OUalzXwQL
         9KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572256; x=1793177056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zeTZgUgaTV5J5UofPRCsdZt2a3+CBBlIX0V3IuvJFI=;
        b=G8/B/FUDpiNgHKXdGMQxYYouutLBnDISFdjhRTV1JJfVEjZeo/vDEaZLv3u6gnKTkY
         ZvwOjSlTRc7iQ8BPjdD2sfHWUr1LsCLzuecmdQ0tLzQViIUlzFRPegWjEzH57TB8LgRJ
         PU8Pmce+5oPXjgnLdIh4U3Xxr7+2OdLR0lW/Gkbqcwjtt9jOh+Xcgh8qShfNrOGHCQJc
         nVajmWdf7CmHq4Ub+NUQYaIICc3cO0QrMOPG2LFmEAPaF9b8DirXRyR4SwcMru/vnEBV
         RGu0e6rGkT4Jzmbo3b/nUIRr83bbv/kSCyfB+reE4EUiJGTxHZ0F3aSD8kUuTMp24bdT
         dJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWVhK9g16pYDJJa/wNrWU+epA+sxHZEq7fUVPp6B4pZSIh9BCfpZ+71hNvEiYHIpNKuZLZyglW1JyZ+Kk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzKAmzzy1pz5sqzp28ppwKOyPF09ECSrrQ7YDBoPc5j994LiBI
	fXOzdu/nhR2p8VVqoN+yTNDEHu/qjY/4R8ntNLKRJbCtQuWyF+x7XHEdhzzQRqE0c9F/8EG+yvz
	z6eH3I1AbCcMdah2iE3N3bnqXqfxkbsMpsxpIWTXYWLRw57tTqpI2KpTEZmQgTzR2ST4=
X-Gm-Gg: AYBFou0ZULpP+dJL25NKGxYKJSsYoOk9WfuSWFeNt9KUxtZnysNW7JpcMqYOdXOSq3F
	psuqHLiabIargvj4GEq6ikTmhJoCldpNtThrtAe3RIHcRq5Spcts35GtshwbkRpOCnxELF/0nkj
	45iPkK3xsZ4gt6FB+GbEfNHD332Z2dKrQV4t6In2E8buFZy/wZntvbFkl2RxjalB6ATrnNB2aEl
	e97ZwmYI8LMC89AMdLdsE57otO50hvz8jUC0DgzHT2kv/EFOZZnVBhBFN45zIcg2NLY86zO7XFv
	n+wZad8MfSdh0ohOqpxk7HiezOPF5cicd3f0UvMjwk6swHl1af5TLdvCGfwh50PFq1F2GKzjE8x
	4fMJmjwxsqm2SnxMHEs+EFw==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr348786185a.0.1792572256555;
        Wed, 21 Oct 2026 01:44:16 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr348782285a.0.1792572255968;
        Wed, 21 Oct 2026 01:44:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafe2sm602667a12.12.2026.10.21.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:44:15 -0700 (PDT)
Message-ID: <6659599c-68f3-454c-b461-1947afa29ced@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:44:12 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/msm/a8xx: Switch to generated protect regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-12-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-12-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0PuAV3XFp19i
 k6f45+papL5l3z/e7BnPkis6xNx/b30Rdduw73qrPR/Tp6X876HvK427Uz2eS0YG4E0Dt6uL0M9
 wW9437PUF7p5/x318aL0PgytHj3m9MRFYzhDN+s37buFDMX6Mh2lSLGUosvwJESVAtUUD5fEYfe
 9H8sXGDgldcFCmmrWi07c+6At7TOIoVP6ylqAUT6RU21Q19mTH5a+AjWY3PjVTJqSPhATaGxztQ
 sWT6I1hfktn1VNdruM+k9YjrC+43yToo+1lByb1s4zeV8APwTz1gTStAa18spXWBADj/FyvLtxP
 9/oOOYm1KEwGmK68912tKHsk13T7jEZ9xctgolWFRaJ9ESO8nF6NXay/62t6g+8k1wg710Wy74c
 xfHJ200mb+88L7i0mB0ccRJkoq+0GiIEJLI1tLhwmwN9c/g0cG+2vFq8ZURRZhWDWOYX1ubBa7M
 zHD5PkQrcKfvN5GrQmg==
X-Proofpoint-GUID: UXxB9q2nmW8xzlhnD7CvL7BvOSwTEF4q
X-Proofpoint-ORIG-GUID: UXxB9q2nmW8xzlhnD7CvL7BvOSwTEF4q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX0WWnzUdcvLEq
 vPeOyaVwkMhn3qtdcXGhBFtZQfrPXMX8W2CWnX4aI+eU5eAPrINjo4BTIZbixy53mbII2H4UBu/
 lSWG+qIZN2yuqud03C7WhJHxFzhT4D4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87b61 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Uo0wf__DB8OGiezfqlwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> These also fix some perfcntr SEL regs which were mistakenly blocked
> since we previously just copied the protect tables from downstream kgsl
> (and only sometimes remembered to fix these).
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
