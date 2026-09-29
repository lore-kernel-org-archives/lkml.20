Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F82C5226AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684825; cv=none; b=CuA0V70T/1nF0C6IRkwAj/+QIeifkSqm2XZFokJGfxDds+o2SaqnyS6fQbAD3mzRnF93+KM4jN4hqQ//7ZK3hU60DMgWQu81QtHXzYRiBJgCjSYl6AJku2l5hj/U1ueOE5i9AkP9bYuMXQ+ckMmALjWP92EEbH7S+Se9zvOg2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684825; c=relaxed/simple;
	bh=wVX9Tr7HnaivYfdSnTdnsZDeQROujyVaYQOXyN9yjvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyA8EEbtGvGJBHKH6Kq4w/z8AYdYWeBxBAzWDQyRCYLB45G440G/YD+fwShhzaeJec9s/c+52dV6R+UBkLYTmvNyVK7p3+DTHY0Sa/2TtDVLDT1gMyHi2sF4aYA+XCLurnUeWDIp33aNXTkm1DqXe+NQ+WGFXwG3uS5V+WLT2js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DK6MxPi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUajyaQE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK6MxPi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUajyaQE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEdbO1392347
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=; b=DK6MxPi2HYGW1rqE
	P8QYmuq9m3OkjpyQFmXRsNteTDjf5RdqJABeXwH9/iSVB3/QaZ7uDQfDz8V+O7jN
	mraYnpAiObh2bFgfNQd3lavmAH+s2VEHzu53LusLNQkqfO74M73K1CgZ/IUmGUeG
	YnkHHBtUU0Rka4gVHZi0u/nnbyAEYEAGH0ruto3Xwim8lXTm5m/6tKspngPxOAlR
	GGgttRdPPV37XukytVtZdE38Xfkplqi/khg6VrhVhRXlv7hm6ls0MQDL3Fipl6yS
	BXsDA9Cj+9fm31Zb4XJRHy2dzuiJcdmQkYRnp++CXC4Bvbx8sZlDBHX6bhHEQY/0
	4LiVIw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03kyp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:27:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9144e34ab79so3043426d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684821; x=1791289621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=;
        b=JUajyaQE1CMmEZOfYk4Q+aGWorPc6nrMO0ji26SUdaD6pG3njfV73ZcKLCmaFBtUVC
         kRbtJUJm/7wLttejjUHyquKFBAxJdkNG0+Z9fDRi9ZP08CgITi6bRsaiEq9xECGiGVvA
         clP69exxyp4vOrjFHDpqX26GdJzQSUe57aHKm+BWHmUWCo9yyGY/oxC85Ylr+sRDGmQ8
         nCKonjtSgfhgXXwi2NUF/QHg2RoZ+osSk3rEnmVONJemCE456BNwpRaMO9hN8k7rvHMN
         bNfidNErKLeXZ4NbqcAHTztq9I6V1yyKgWLHpK6NErrNS2hlr3klZg9zWnlLfb96X8fI
         X1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684821; x=1791289621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asf0KM7+58qKrDcBQ2kvBbjz43o0vuPlNwfun278XbQ=;
        b=RRMgEeW+1SWwh6jOtd/Dq0entC8iL4kwDJKtX6uyJIcmuEjPQUJtv8WBhd1JZlorSd
         1ZB98iDd/7tSXiSL1oerJHodfkWlbSSFB0YluhhT9aEGBWrlf9Gc9EcUXTiHTL+IPWJb
         cvn4s4Zzpv/kA5Uh8uRGr2/7jNDOBWsQR51Wtf91hWJdxOYllQe2N7G3pDRxG1RoF3HI
         MP3QPJasxs7IiY7YunNuPGhihKoWLYJITot2+cbC4GKZizzPBTZK4eugkXzojC7Rk1fh
         IGSClKpIDiH6MVw4U2/4jsR14UXQew/qb+bqfDB1nTgCcJHyxmCvYAhpMvfvZ3lEM0tf
         vg3w==
X-Forwarded-Encrypted: i=1; AKwUvBwih55b+1t/hfPVjAzDA2OddmKvHd/ZCuh5Sq5NRWkojc4EoRcFQyjz00UfqtFXm9M4SIVfgv3foCB3Ljw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJenae03xgNt2b9zUN99IvNVHMZt+OTQo4ZWAoZUHCBfppACrj3
	POmY/T5QGiyRY7YtB6H5OwpH/rOreJlU19R86ShnxTh0OfWQ4yxn24bwAveOQSP16zxiGGey0KQ
	UIw4alKpSvROrPBba5pM7WSLBziGVSfwdj7pzGMhOtL2eyEWhQ9svFIk2OQwM9gIXtzI=
X-Gm-Gg: AYBFou0ZTOep7dnIQbWkhBSDifexUqlC8e3sCV7gQPrY/K2lJzdYgBx4lK04HxgS58u
	qGskPw4m0fOMQDy+YVtwFa2RT31WmBoK6FtLUPKLsncBY0a6nHwf0AIxpoSBIVqOZR4E6a5DsPH
	taIO0BK0h6bvBJz2BbqFvKbO2YsFziagWzbe2GOIx33yU5VTBBRKpJndM+aeGy2Dh6miH0KMF59
	PJ5xbFG9C0pCKKJ3FCRjHj9Y8UoZElWWLqcHblWAxSo5j8XvF9XK0Qc1gMduVLHtMOldBaLcMy1
	VzMrJhVzOrONJPTfgv5asw3g7ATJbayfRXsOJUD5fT8SWnHdFFsNO4dc0wxCWBny3ytQ2fxjnh6
	akEn334ftTuoOBTYljOzQPQ==
X-Received: by 2002:a05:6214:2d46:b0:917:8b9f:d54 with SMTP id 6a1803df08f44-9178b9f138bmr19819066d6.2.1790684821145;
        Tue, 29 Sep 2026 05:27:01 -0700 (PDT)
X-Received: by 2002:a05:6214:2d46:b0:917:8b9f:d54 with SMTP id 6a1803df08f44-9178b9f138bmr19818326d6.2.1790684820138;
        Tue, 29 Sep 2026 05:27:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9036092sm724336a12.26.2026.09.29.05.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 05:26:58 -0700 (PDT)
Message-ID: <b4daa3e9-6055-425c-a5b5-7e3dbcef45c3@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Remove cdsp compute-cb@9
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260929-shikra-dts-cdsp-compute-cb-fix-v1-1-90e4abb873d6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-shikra-dts-cdsp-compute-cb-fix-v1-1-90e4abb873d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX44C6MvgL6mxO
 BmxTCXj1PMmVGnj9y6rGrf7d8mTvij9WwsVS6gos2V77hdtX/MDb4Xxro58qTk7fSHDbeEfx2HH
 i/D6CGBjLqtVAHRjvXluIrn/K+TnLjU=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbae96 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZlKZNMP1RgdhJ0d1o6cA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfXyI5cIq0xBbwD
 gx+70lOlBPRn8YpsH5Estd3bSDRNSuInsEPwTFgDm7J43JrBHHdEkGueJbHFdfrSRYyJdz1DVd6
 +O+NBhUF/sUf2TsvYcOmOOlCzZGFESKrZkrxY7F4VwKp7KDgxi80CZabmStZ8V29TBbUF+YYj7u
 HTKaruvHIP53X3PewCRzzAvnvRMkbGGcjr2dGAxVhij5o0lUTB5lWY0/l89t+VeW2FEAHlnQGlM
 MRLXArgHNbSYSGfdD4663ndz8jdeoeSyo5qU4ENTjGdKMbxpX2NtcJHU9aS6EhhX5bpfODyNIEx
 aKALyUMszazEX07YwVls6lUoT2hJK+cPwn+Ahvn4cZvEvtPxllkxUx/swBECClyEs/8optmm/tS
 elOCU93m7dVphTZQzaVvllJSuAuckHFIbgE6yZ8Ddh8eWSEA90UH7bBIuiTwthvzQf2zpw8tjxS
 3Lpoy/95GDYIqqhyVGg==
X-Proofpoint-GUID: rvnB2Piuxi1T8kc_qQhZQSylM2fRDGSy
X-Proofpoint-ORIG-GUID: rvnB2Piuxi1T8kc_qQhZQSylM2fRDGSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290049

On 9/29/26 6:15 AM, Anandu Krishnan E wrote:
> Remove the context bank compute-cb@9 as it is a secure context bank
> used for secure use cases. Secure use case support is not currently
> implemented upstream, and allowing other use cases to be offloaded
> onto this context bank results in an SMMU fault.
> 
> Fixes: 8b6f81f7801a ("arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes")
> 
> Cc: stable@kernel.org

nit: strange empty \n above

> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
