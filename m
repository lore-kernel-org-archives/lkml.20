Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612412;
	b=o/xXByjf2+WmMGIvu/TcVsXUPHTCHTp3/2qBkrCvOM1Gk2xhAaEmHuFymtXuQQUG/SiW
	 pOWEQQPsUIoWoreKNudiaKu55OTNdEku6reM/qN5VJ0m6etmuXl3Vf0HgzaaVcs5NF9vx
	 IIlCtXHGebzBc17MrsMW7kTFUB/YgM+lhwoSOPJ/8i0IjnIuDslnch0D6v/rw1EI4g9YB
	 E2oc0Iy5scEldnIMyrAfUvr8yl2eM5H3b2TJUiQlt3UXkE+W4N+kAFRLxh1v2U50sS3oL
	 lQbXsbAYCaMzYOK++EoQLkkZ1/hBJpcWohSXbkmH38WW14kpuWpmk5+A4uLn5U0CJSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
	b=fPIbgDw7tkKWVtxn3StBO+oP0PicRvY5T1DfmGUxDLHl3qaunMirfQyWeYBd+SRO7Y+N
	 wzVBAgAdad8l9S1sUELG4HVAloGEdgxfk5w00XtTdJP1QSNWDo37dMEHZ+fP8SNS/TYh9
	 NIK/XtCAg598PflyP30FF3+KUb78HU7CO7XEwonn2kQ5dWWXQ22AGxlYNyJ9A1xCfwKSd
	 2Q+f/uCviOc51uY+/U6n2RMFw8VwCD9uyNNXOGzD+tAfEHhVSrbx0/0GGsd2/EWoXAkV2
	 cJhUmUQMXDQUkO2nwxEf/Z9gU7c4pBqalTS8tHGFn3g0AVwIL8xUXbZLAA4mqcKfhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYSudKPo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L1Gxju/0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB5A606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB5A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WYSudKPo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L1Gxju/0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B02b4014999
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=; b=WYSudKPotsYPLwNp
	JFoW9I3Cr2K2uGjJrsMH3te9gqMtSjWXR5IkLN108Fh63tvro9X41DCJvt//N1FO
	0daUuZWq66VEuJYlYwSMQTkpRvIhpr9N/kiKlHlY9SlrUkH98p7Rzla1sU7ex9dn
	dLDWxBDI12KHmNIkc7UZjaMWj/dI60BE/hu6T0Ogc2hELkoAxpBBVbPefPXm3bAD
	pjuoqkD9WDP459LD+2gMQydsG7WCrErR12pH+TIvkyk7b59bplXjc1+hx3ZLgEek
	zls1FewViGUlgtSmEVyyFBGQcoKOjiaE9cm6ssaGj4yo/TIZcpeQFWEtA4C5SxzI
	bI6o5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pcey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:40:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5476f5bd009so1498061cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612410; x=1794217210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
        b=L1Gxju/0ZhSgeECW9d/nHo6+HeELVdftWMdeLI6PC+S9jYPA4SIyVd7jV1kDMQOhKD
         SyPPFlHNR6qZeZwRt3pxK7pbpiQAZ1NO/VMJghaYY29ordwDo1voThyOIB+23/dR90CW
         Z9bUqIuJ3bskxQ6ZruzjJAfHCBEqYxFXQ/VYW4wjmVbHk6iL0RMT8EeIGssIQeUYC+eE
         aPjRbQg11sK5hTRNuhSM/NjsMvr4KbkMxgQ3P5kJACklh7VeAZYsWf34FBLbq7Pp0sMo
         ZkmjvyhgT5e/aX5VdWLaYdKjNiRg3GTNcpSyc6xAxrMOqCwN8Lu4UAgtmu4Ny+TjMjhG
         eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612410; x=1794217210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RisWK7U/ImCk7w0ULia5Tu4LqGc3vPjywy19ERXZsQ=;
        b=cQUw0rLcNKDK/n8NhlYs20tCWPZjEcDOA2LGiC5Hx4j9QjRUVwut6fCDy/tldQNnss
         WnuK6tnGQtQzJUpphxkPRvtxHsXyE8j7wAglJi2LFOHANlCh10n/+yImCYODuLyS7WKA
         yKlKHT/MX0pJI50S1XGHupg036+kRpdhqgbCv1tGinrMH5l66TmMxTkMzMaUgk+kbfNr
         TE4RA+nv/1K0ACtJVHM0E0EjmZ9Fmal8iTrrVtxMzUQ2P6kZTF6/wpTuAPR1u7jkt287
         /Pb2LfRpIRVvZnXHSmshA4odrJxbHWgqSOTrumi5Cf8Axr2wz+EALZ1X3iJr6xU/b8Eg
         kG/A==
X-Forwarded-Encrypted: i=1; AKwUvBzT0BT+SZIAMFiWLjKlTaN7J+gAA84nfQN6fod2ko57SzAc8/uZN0mCxwNCBZ4EBo9HtzaHUmBh6eTD3Ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY2jRr8EozSxLk3wGJBOYNw0UVHIT2irFyApUcnlAAIslTvXwL
	F9FAbGJdVtN8b4T3mTt088PwveCznfg7GurR3M7bmmqkOhNtl8iCY9q+MqSSoRIWF+JTgpgBi1T
	Pyy32QRDK7p/x1rN84uPkLIUMMmNzZ65rAB3pzkfgPRheBKGKMP+QjCdxK2dydSGiU20=
X-Gm-Gg: AYBFou0/Su1AK4QqCnhJUiD6e16T8a0i/MkuySyv6k5KOylM3frry5koMU+KXjGQUgh
	ETK7Wlg1O5QWZpqO1U0xcbm/PpWXjfVkJtDsY7g6i8u20PIry/2YHXkoTHtbrq/uaMwgyzYHyIg
	daLMTtE/ekxuDAoPBtc2hco5lHXsj1jZYKxKyQbZ5EpohedUCLSh5hE3AkY2e9qhoTvdokOva7s
	YnWwPBiA9QbCkg1j9QfLabZ/L4kmgCD71Cd88G4B0x0BhiLQMBTnYvx+t5MYGU3UT99J5gedkWI
	HFtLpl7lseJD//QnJMbu1QypOcYSTV1VIcxkfAGiFNhgfCysDb2AMgoMCGmmr/nXB46xTxLwwGV
	3K87F8Bt+FTGPMs1hAn/jab4p+xn2BohMLi9Ih7QkIS1/spULaj2Q4zhghGYDCmkQp8A2o54=
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1568138685a.1.1793612410415;
        Mon, 02 Nov 2026 01:40:10 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:20b0:93f:1eb0:88bc with SMTP id af79cd13be357-944214c4e2dmr1568135085a.1.1793612409919;
        Mon, 02 Nov 2026 01:40:09 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd195sm364609966b.23.2026.11.02.01.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:40:08 -0800 (PST)
Message-ID: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:40:06 +0100
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
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S0KouL4HkBb3mP3iv0FEpw0mjPzLzyGj
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85a7b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=chFjt-TYfWtG2qqLwSIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: S0KouL4HkBb3mP3iv0FEpw0mjPzLzyGj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX0YdXS0seZV/s
 WiPJbjw0s2Snoon0kpZcLR5IBW/5Ca8+Ybq7gAJPgR/AHiuQpnHpiRmpkIS1EVRIr8/cw27Yky2
 TxRZy80hEH5doomG+FXb3jHfwfVH+fw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX5cLHWoV8+7QA
 8DCmxkqvGLVzaTylw+e3ca5eG1smdL1dPBcuv726EvvE4OvgTeJ1rBLX94oR/P8aGcjKe3N19Ev
 EzH/DNoIouLjoYDQ77z1RCQ4iMM9V+oEwAGSpQSwtXq46VlR+mTSK0WKHIay4D49XD4DjR7j+f4
 PbZHu+qvEOHOiKcrJrRGR+1XyK//G0zurtEAM5+nvYE+wPebO+XUoopFYwih6EvVfo113I4c/1K
 rw2Bw+eQqC3jLcQ03IJrUTLr2n8P/dyVQlKYATozkkrDRgyeSsF5ItumfnJ3HUJFX0AalaRO5f8
 4PkfxW72nl+ajFFNtDSLTv1EEHL0D1vVS1uQNwhJmS7COIQI2nvi7uoG7chTcQs5PdXANGdtjJ9
 0Pxo7jFh7vtQVNQelqmzm5wQD/tNg0B+JLLx1vvm2Obp4VfnhwnKE0yilJcaPeFnzFLe3UHxBnk
 KSBLZD5x6VNf16pTz/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

On 11/1/26 6:49 PM, Rob Clark wrote:
> Use size_add() to guard against overflow.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index f687a629629d..16b3870d5e90 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>  		op->obj = obj;
>  		cnt++;
>  
> -		if ((op->range + op->obj_offset) > obj->size) {
> +		if (size_add(op->range, op->obj_offset) > obj->size) {

GPT and Sashiko are unhappy about what this does on 32b

Konrad
