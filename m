Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367835;
	b=yzHBiCgkEAT3HGc1xbhrXrQUMZQT+KyO3KaMe0oxKX/4A8GHXv/EPf2w9E2/I+j4GLMn
	 n8W7nqhoTkOUFGmhqSoEu8UKnPV872vXGW0qwfFDaXxDtgZrUMNQ4aHIqbWjJKfF5CHiG
	 kGnOic/rHFGikyC5t57pqzh+RCq+GWS7TAOCgOyF/kAaK3ZdgEiML/zL/piUnm923WMJr
	 Yp5fQcH6ZthrfUj+pyVFYQ4tMBF3dBTAvDmNoORadcxKIerZklOz5YpFsKCCJMDWVvn7h
	 AGddY+cdCprDeo71TqUPWVDuoa96GtGtq+dmYzIaKS2+/UfUhjrzoWZQMz6s7KBS3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
	b=1+LdD8iVu8KJViqha1yzfQ1QdtnFhFeGX+Scnl5rGzbtPEfmjFXInDvGEcaV3Q8k+x8W
	 DuNtq35wNyUObYeWHSSsDjqESgZrd9cTMEQTkFeRLf39FZ8iYMteLZv+WbwNht3AvXgGS
	 JYzrN+VtDeNGjEvuC7TQz4VGg54Eq9FjrD3+fyF3Ja3U4Af/uG7IpqlvnumMv+SxT64YD
	 0vfYT2rWEblQdQLkk2h4M2c7jitAC2Nm0k8q30BwMS3CrrxW4ovdAGD15M6/tHCH+sTY0
	 1SM1m5bHoLng05bXdcNELh0LQ0wOstdAjhpa06AEYqZpaHHc+r9cm2Jfm+HZ5gOYVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CZIKp/RP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FazTtAeV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A93606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZIKp/RP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FazTtAeV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGWa23679082
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=; b=CZIKp/RPLME6DfrF
	SPE10gPeUrah2znQd69xp5oovV7pNqAryW3wJXcDH/jHIiYyPvM/fTW0VDGKEDmh
	BXneRl1ay0E8Cb9rQhEoc5WUmSJ4tL4ND/1F7gs/VYH5N9HLuqf1IZhl4cKIQPs6
	pLp9mzSWjSXEp1wkz3ZtbgeJc0MXZVfdQdM7XN3ZpwKDeqDRQm61bMvjHY4MtGLQ
	8Z1YwowZnT/Cgbz77jAG9FItePivJl7GMkaxfZ8sX9E6JlGw/t6pSANWFqILo6pV
	IKqq7GFPbtBMwChhHwU0EFz0Ut9QntRgEyKYs4G/Wq4tEQLVyq462x/mmx1e6v1o
	2vRopg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk9gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:43:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so3287185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367833; x=1793972633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
        b=FazTtAeV+Sz+ms53pi5BKtR2kjPOkQXhQ84th3h7XqV1DBgAqJ/1psizdYfV2Icbys
         /ACihpVdB56eu1y7gh4iGq6CtW9Bfpubh0ql6Z7Q7U7T1b9+CGGIQ/iSapfzvT3NIcJd
         Ra1BjIeRNr/fcuneujEqM0spTdRubZdMgmOAHTZbEh4cs8nqV+PRGP4XZEpXNfX0jBqA
         vtwyvgdRAmYCX69e+ByRbkTWpK0yGqDtFpgcGG8js+GSRtRHK6lxB8OaRz9nS2J0wR6M
         D/YB2Rzu4QteAWjUiLjr1aFT/ZZoPYTyC6OzaNJwNyvChldtbuSc903jadJ++tguteQP
         ZAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367833; x=1793972633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnxQ6PgXNPoh4AK/7SDAcUKVphAB2OZtUU8hUXH8Z94=;
        b=KMIbdB64Cdm9MxrHPa6zKMwKZR0nwKgnQBm+1hHBAQMNioebOm7THXJlxLgfwhtN0X
         bvo77QM246USRejJHY1uCuy6JAlGhqvA97uJqYZ7DFrpbsLviUwxBCeeJ1GawX5zavY0
         2DTNwVnIbnogGbeZhGKg6xo85+6+rzW/bNeS+ekPED718uRQDTynE4XH+t89LC8FLpOA
         1CeEOaRvWt/VqoZc/fXmnFzVQaV99f97/hIYfvduwFXtViYVzSjrZ88wyTqIW+QoXUfX
         CNhuxwDff+oOAjUxOZazOrhZKSoem1QQgjKquV+fO6p182yAnyZRgyMRfyLIHvXJssWg
         goMA==
X-Forwarded-Encrypted: i=1; AKwUvBzYLJSnL7ZtAUh7F1mZbPpL2vDfTIqD1AsvleCFsOOkFwzP/sR9nGiNKlAPnWPl9JVK9aSb3tZX6d4Hgso=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBJc6qyJdHWu8ubXDDIyWrj452yY6mYAxBIm1jUW+PJH0DaScD
	UINeGkTFQ1usF6wG0sWUTKeyAOUPXNWGvBOZpuGX/tC41iCNbmyEMR6QreyCU9cK3xMihHo1bDz
	0BlST++e70E8MMu5VBJVGmbpOK+g1/1EHUHTvM7vumYJDRekSoA4nxZOV5JC2YV3sBYs=
X-Gm-Gg: AYBFou16hb3NmMV6HbtO/GnJ9FAlItwvq/4JB7oaImM1CeCWSwy5vYrEGvfKw3ELXu5
	VXp3aP8y4CKkyax6boGHbDSp31CvwXl9DsBXoWLQPrJ2Hh65UaT7zBNnpZmQa5+jTxJjsSoTZ1r
	3JKyEy50VwzXZ+d51VHzsxs50CLAQuJnyikrErXWxqypRuXx4jpZR8OSUWPmzflA8xRkkJdu7Ai
	E6mtFe/d5P/95+Aj5+6405OxfXb4UJkP6WreeqSxO6DFFmcoyg18JMcg6qvtHwXD7BxDTzEEGY/
	zSUTPJYY+zeN5d+Ipul34LLeHDITntaOoelk6WOaEg6I5i1nQCu9rA/mzq2MZgg8yH/tBdJfndQ
	Y3O16jVd9J2x4Rif1MqPr4IJhoqoZWTS2LEyzf4jLSFqAmNuCAak599YKehvruYK55X8DGwbY
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr377828785a.0.1793367833409;
        Fri, 30 Oct 2026 06:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr377824985a.0.1793367832943;
        Fri, 30 Oct 2026 06:43:52 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1920csm67290566b.5.2026.10.30.06.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:43:51 -0700 (PDT)
Message-ID: <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:43:48 +0100
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
Subject: Re: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
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
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX4FB4WElyhRIq
 nOPpm58IiDu2S0JvdfVYWNZBXWcs0Vi6kgegTFXSG9lA3itAE6JXHFuPQKldtH4t1SO43pPdMQw
 rjn5RSbBxXtuWPPRFNa6LQF3ZfTUcR6cTgwF9krbwO/frVR7I7fteasQ3mQA8i3K9ccEqa2Ouxv
 eu0GrwBn52TQyqiExv8WJnmdLSfNdRObnUqry3isK+vCPNNZzQGgZtkX067Dz9VDLEFjQQFoVJv
 DdM4ebksqKhaH+T9dgK3jQ0fLVblmOeWUbSG0VnOnFJHH0eALKDDNEZSVmQQGJ7tLw0KV5MFEG/
 oheL/cNP08j0qc3x+Ca0ivMzstSQOJOk4q6QOUQNSd6g0iL2eYmzoP1ZN5fIh1NTFuPlwIhUWoY
 HnpYr1b/gFYWaG4bk9GFc5zmelFXRXXuoY7fIX45f3XLzzNlzW+kvKO28L977qMFM1g1SVxHh9X
 l6jhTCPpmyT5GIM/0TA==
X-Proofpoint-ORIG-GUID: hTxbd6TwtHd8SIP5uRP22xQw_9AjKdY9
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae49f1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4AcCgV8_PMtU11i7fXYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX6yy4rcmAf7OI
 ZOKDJC7/CuNSxadq/hFMLs6X39Irvh6gRHJ+DKH8i+GRO7dV/R7gD2rrMJyRGz9PkFIIgdN+nWu
 jgwrxzlKMowepbJs8D7jP+Xb3lYHlhs=
X-Proofpoint-GUID: hTxbd6TwtHd8SIP5uRP22xQw_9AjKdY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Should we drop the entry from nonctxt tables then?

Konrad
