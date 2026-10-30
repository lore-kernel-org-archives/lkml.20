Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364618;
	b=QeYj4Kal9VCz1MoPvK85q0fGvIWozS5ibfOBwqdWNAeO7FeZsv6tKRYUFNhP91jSamiF
	 t++CCHDoGu0SeUmQrOZUZ2xGwqXU8c1rgSvv/yxSJUUNZXx7LCeDs49TxqMG4fi79V/Kq
	 P19tkjnRVe41FsN19QA0SN3L1aoTYp1aroF1J6ceUFIUAA0k8KkJwKpnTymF+a5TsarQz
	 0HqgPoqV+h4EYQEqhSp7eOzZdzonmsO9I7wteIRb3njUFCiUwePXCLBbFsJ+sTcGR54+k
	 w6tFCRAoYj3FP7DuRUapPgwGBIIZhNt0OwaLkGdg2gd7HUJIe19aXibnx4K53oZrSYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
	b=yNp6Gyh5w+PxOPMzeCpyxQVdScMqJrQbVmp6zHTChIRSzpD0XZ5oym3wu2qxR4GNXpsk
	 liFrYSCirlOodP0hIrVhZFZ9DdMOR/HyS7f9bOwAak9XZCI3SGLsjlUnPU+k4A4zgTjma
	 IBv6y89HsPaCbQgRrKpEAEWcif6eLtd6vDcivr2Xxk878V4BdIEtjHxrlim0qsl+cOK4a
	 mE1lhtEgz8RoSWLjCx2ICpBiWqx9AobXI6D0okhXVOxVQLPlC5XIv/0KoKr9cyG+hlZCm
	 O9Y0mJM8s4XC/Ymw0DtkuQE2kVoLQkfOGUzL36U5PPJiH0xF4x0/WPUnKV7OyVlREAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A0606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ScWgBRoi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fr8tmmEy
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGGDP1527584
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=; b=ScWgBRoisjo6bcu7
	P5SRMb1wyAhYpNggksh+eq+iYxsVYjGMrxjc3KYI8rijyR7secQ3ot2dfUlEYSql
	KttF74uobKkwHgM4p+tfKTwDGuCDB6zCNz2mvALPEs3FD2PsooWXRw4Qk7TyqkS5
	P1cykXo7eDnV/etd686Y2aUv2/G4rFxhsx4kgzB5ofN5UF2SAtJYbg6jSFMrcUCQ
	o0UPXiCg6mZlFFEgGhVDKcYaxIGDKSAGJpO1kAsFEKgiSO2LP6oVruFdok3N5+oC
	LuCL8ekSVMdsoAGF3smEpInCy8xopFJVp+CDUP8M7HXMSupbTvuAYRtpZq3r/Bsk
	ldT4Pg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pk316-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so3476685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364616; x=1793969416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=Fr8tmmEyUbTYsgDcoqM8Co4LLyDE3W0g/CEm2o3CElDpiy08PqkZoU4enMqNVaVYIf
         dmohnJNxXdrofJNRbwihwtuq3wgVorSx+1k5f+VdnwZBcPGgZaNsMal9dAU4B/eXMrPm
         UaS721UuBOEefzrt+1GpmsYPQ6T+0GW5aFqBk+GAula3HB3BitfqDKTdj9TL6E70yfRH
         qW/9ku3lly2ReVVYZe1TfiG/5PzZBnXY0R4nepFAZi/+DW3aOVU10Anh7PVEg8DKTlNs
         G6Cbb0fRY7Z6xd+0HnRpSzK4m786Ip6OxOZQeEjpvfIfkQw0dmW3EyMAoplN32HBPZeC
         fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364616; x=1793969416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+36S2XfMH3Fmmp6nC8LledtkU6qCJGGKMmxe5Dy6N18=;
        b=RtWKZalU9EAzJnM55sQLNxgJfi/Y0eR3J3Myp3cy2SBEmIIzZhMkTT0jYGukCfr44A
         Z1egeB9wQjOFnIt7dWUloaQDvQRK772yD5Ba4wOwuTkTkwwShaUNpIbi41ns5uNCvzAL
         BwyKDCs2FzMaxGkADwReMfx+jCFdOnR/LfW2hO1kFlNrpqZ7i8mG6LjHwUnCZdwJvTsn
         cmpOj75uEuEAvr9iWg7nVuwVbly5bSH5OWxt6Tds5mTUeP36mRtNk6tHV0KZtowXcuPI
         QG9WEgkuVqHEwFYZ2OAqBRKH2/cmM6KfKBKQhtzEeBXDVlt+peUNpQUPplKR5i923pQQ
         vdkg==
X-Forwarded-Encrypted: i=1; AKwUvBzjiAeMK7b/PwLTjbwgImQD4Uu3UXm6Oa+Ai7vC4Zz39QVFU4uBfO3F3F5T3IkycK0v+V8oYL0Rrt9ZIFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHxkKElzL1xn4bBalgHsCjo3mg2ltxuXT0Wx5/a7QulprVVC0n
	WZOgEErHmJIj96H1PoYcUk6CXQ9PsTSVEzPe+XD01MxC+Sc8+Drld8PNkUeQPUm8Lk91plJz53g
	/MJxGiGQZe1ec78DqggmNYhgZvda4RFjK7kLjoWEtjFIQgRGUz0XLu9POfxi4iP7jowA=
X-Gm-Gg: AYBFou01FX/6N8r5lCevASWt2OxyfB1M1ghlx+3DWNMOi4LUe1FrIcCo/BggQrv+wJO
	zcADUGzzFwZtAaNOpmdDMaVE81TJPzOODUU1FNzykMNxcUdeZGfkm6WwJnszD+91XbyBvfQMwTM
	Vv77btSRl/4bi/UVV7CReoFJN4Tnufc3GXSGvpz6opjqdb5uMgjVVZMB79kSGxy9XCJaNOFOAg7
	kpsO7qF8w2bQ2QhKWRY5fFaxY245klXYkCRuJKhmNsEK+TIwfGmKNuvkfHji+Ln1r4VSwrDRAYP
	o70VsDmkiN7IDw5qX3/Z0gfzfoYxdPtMUhyXjcxNUzh91+ZxH7rMzuV0XzpzQFTflVx4wgDhE5V
	rRtzjOdcx5Kkkkh4Gjjq8iWa+7ypzR6F4CLmmVW+gtYndpC69JOhdPVOCiuXFh7rJP6kpRic=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364700385a.1.1793364615999;
        Fri, 30 Oct 2026 05:50:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr364694985a.1.1793364615590;
        Fri, 30 Oct 2026 05:50:15 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm62954366b.67.2026.10.30.05.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:50:14 -0700 (PDT)
Message-ID: <415ffc75-d1ed-4540-9a55-dde0f6bd24cd@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:50:12 +0100
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
Subject: Re: [PATCH v2] drm/msm: Fix GMEM_BASE on a8xx
To: Connor Abbott <cwabbott0@gmail.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-drm-msm-gmem-base-fix-v2-1-26b338471b46@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX7coFiVPwifzr
 LmCOeEO8WRwPGjD9GlJXVv9IDL47L9SQh2BvOX001VPEF8UyNOVQ6RmnfZ3lHEbHMgMxDo3YYrZ
 2GbGLyryO9Y+ig+TctAo527Cfm10K+GzSX3D62Qfj8fgxXfrxhGQd+rUSMvjAuhLPyEk47uKIwS
 U+L9SgTyaPaHEoLbXZ9UaGX8Ndgi9kL/lR0JTzxXg88lwn5GgIkf0aMF+FkppAW0KRv2Fa+SwD+
 6ooA3oh2r7FZ0pwoPVwESSbP5KasabCki3VbiZB8wBPwYBXpXNEaiTo1rGE6c+J2MQO5VPBJiCt
 enqaUOw13nWCbV+spCXUvMKI/yebhjbn9Kpf7vStCnvxM+ndHX9SY+BSVEln/Fkv+eRWbPbIMPO
 1Zu+IMcsol21VXZjjBDeFm6gJbPylJ8GpfluJQGzbDjDqSUiRq2jgHWBzQDtaIeKL2eCCFtiAik
 kSntEbnR39rrb37Aq4w==
X-Proofpoint-ORIG-GUID: f5QQCycKCnmxUCaN-KOH991W-rZvpmix
X-Proofpoint-GUID: f5QQCycKCnmxUCaN-KOH991W-rZvpmix
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae49288 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XAuXcVFvbmlwbjzS6hgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX/fkCCPyvhzv6
 +yul2zctBg/IfBuKYYZe203cn3rs2xTAXJcu2V45Zgn1grjwuggUQN9CawCyfWnAvBY6qqutRGF
 HyUqgBIOxWUB+ewn6DAafFFBBABHY8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/30/26 12:02 AM, Connor Abbott wrote:
> This was missed during initial bringup because GMEM_BASE is not used
> anymore for textures on a8xx. However other things such as mesh shading
> still use the GMEM aperture. Fix it to match the value programmed into
> the registers.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
