Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1464E3F86F2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228650; cv=none; b=pZQsMCJcPwrRrl4IBwyVJ2uxXdQDtkc0YWzJdp6WR8n/wGkE5qiwg1/6N8vZkUqdlLhAv27un4zhQqdzxzPHhNOO+nO7JiOKrGgCkVWfgwhMl2xYYPVEc132aJw/QnqubhmoL7wSZohnsXa6bocwskpjk0NsjaJc6vYZb2P3ZFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228650; c=relaxed/simple;
	bh=/5nGC3DI2uQnuEckbcMT4n7vOg6tU5KZ48BGgutQ0kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oChB439r1nLfbb9RexHKjvWyblZNC1gegtzVqQw6YvO+BCz9hozpYwuScMOVoeSqEwfh9sEh76dtDM83XjzdgseSV5NZmZe2Dub34e4lgrjV3HcPKSJn3O+yFvZk10XpFf/ZwF10tx/f1yZBPpfepTAc9kky9AOvds++c+DiaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChCZ5MRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiLu7d+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChCZ5MRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiLu7d+K"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9rC2420864
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=; b=ChCZ5MRN2vWsXFuq
	FTsDXspcO1dAVpf/yqBdVW1LksWBZ6qdWMd8pcAzsc/Zh7EDQ9rr2yp+2fxuiMsf
	WCSzA9nwh+IvFKv1ESgP4LvLxyCpqrE8J6rpbnqtrpfJd5Eaku4uhXVTSn/Us0Ow
	acpEJaoZBZuEIzu+wMsuRurzkG5v6LjCK9IWk6kglvmYuVAZP4YafWAp0motoQNG
	MIa8B3mDSpP25csg23xmM/+sqsMiZcInZWxDi8+vIALPGh2zTMEwTEJwjDUIiNc/
	uhFZIv25qGKPcns5Mhwoy41sqeE57GMqSUsuLwpHGRILrDg6s/86WJYu1vg+8WXk
	wH9fjg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstugua4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32850005b6bso2169817eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790228646; x=1790833446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=HiLu7d+KpHC/eCAZWNe6n5iwJVZSeP6hnIjUCf8CoTDFhy+wXv7ISsMa04mzFKoa6y
         K5ag/NyTpeNbRjwcb1BGSjDiLl4+TZ4m0LX6YzmFJFAIeULEeZvksPTpUSwC6ndQhPvw
         /xdJD/XKrmt/Rb7Pjt/UWY55LfSXsI789QrYmK977+E9EbkRotD7jiyuJG2JHCVUxK1h
         9vm0WCIr/9nt0ZSYqxkGi/PetQVLFx1cMJoRjdnHe+Zx0+RTAi+Zd8iiDLKOuBbKsCOQ
         VuAuGGvhSwDgtq8lx9jBuHy9KrA9zzV1Xnm66YZ/wJXr2dX0ItVt5bJHe2LBwYvflBQV
         KmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228646; x=1790833446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=dTwCGk/tZxitlXZWfF+sPwZBwyKm6td4nOLHes4tu/2rXdWu4g2jQ5SDukMLRwFrx4
         fCEVLyfYi17gmTc5kIF4oMOXgEAXE2uxKJ88+6BIXSWOdHdpo5ICTCvI2Dt0Cve1yTo8
         mMxlm+DfAa/kY28o0ryYohPqGCoy5bhbdfc7DhbwsJTGKaNiXMdqO5CbF8hByVPVCRxH
         4PktA+9hzx0dIaPXdzZcTd62LNUDCvxNZ90EvDsf9h+b9QL70eG9nu3xBaWIJT0vWimb
         x+A99WCTcN8VTs6yLhbCwMSJDiG7CU6k3CbxpHBQ1yKyPZDfBKrSnj1Ibr6UQYxCfZBJ
         GAfw==
X-Forwarded-Encrypted: i=1; AKwUvBxZVrpiH+oyfQQSrT4/uO5Vu4BVLstOa8z6M32fyS6dgUTteLOjfOCtO0w8p8rp23jnrTzDxwypVGQJ9g4=@vger.kernel.org
X-Gm-Message-State: AFuF++ntFT6UJRZ8tGGucRJfRdM926gZFFSQyY9rM4XhABSnbgSHzdTp
	O+JAJm8N/xclnVBiN3U+n3VpvxDQtzSmcV/d+EtMG1x5kWHpiMELRrZTpZn+hI4nvxT3gtQa2/Z
	zxfHcWMpRERQh7OTgD1O1ZHYsvja6DkDGB7Tml0wC3TMGZpWl4uWzz7fITlLROryNHHE=
X-Gm-Gg: AYBFou33Npaxi/vxiPqxcPcZ7xV1xcdrpD8vuBWQsuEpL+NO0k0zmZnJaQoHOzQ/WRr
	RTj2sPT6bk99idLf63DnxMPizhkuVqg7CZbFPpl1B9IAxkQUidAy5MursAFyg3cboz598qOE189
	ygU2Qb7QZHA+tjpPxHic9zpODk3tFJmy6t8sJ8M3wM7NCB4Ilo91nzoONEuyXaaqMwWOWLgR0y2
	02UTpkKx9k5MGAHOSu48PwPEmJv2gXxoDPjGc+Mmp9KvXWwxTdDGFr0e62IIkdwkHT9T8losS4G
	lnEuVuuYc3mtM61lxBq+6l1x2X+wW7YLHV+yacXF2tP5G2voJTza++JxTTgIsbM7gq6PYzAPSdD
	g6GxBlpFWfQ14r1JoQplS/SEPNG2R
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045202eec.14.1790228646544;
        Wed, 23 Sep 2026 22:44:06 -0700 (PDT)
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045181eec.14.1790228645831;
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm10513616eec.13.2026.09.23.22.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Message-ID: <b2d93cb3-2a07-42c3-a030-5d8ca951d3dd@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfXxI9yDuiS/6iB
 2X1veV95PWb8c4VuhYqgP615z4REwSWaRyPdzQXwkkDKpIoqb33kFIrUZHTM22CDW3zT6lda9PR
 w6uQdaYfVXqIN9BwEcj8vSWRZ+9ShuA=
X-Proofpoint-ORIG-GUID: 8MLCf2eQbK-qoK2MJbkkz-0U0AeHTz9E
X-Proofpoint-GUID: 8MLCf2eQbK-qoK2MJbkkz-0U0AeHTz9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfX/WcydLQHpnF2
 IxQOHCv5/q4N7Hg75Y00sIi5k3nNiECioN0EsVV0VIlMr24Hrg17ht+mHPiwBmF84rq5UzyE+gJ
 1/Hb+7zBnXQF/0oIzGIn7Vut7Oii4XtvC9v9xsrdYIqy2rvTNCQCpki/YXATr06ehtMkQltn+Hu
 jYaFF+bF665KXFkYuA07GLghdiamAcASp+3kjq4EGdR1fKrFkk0HZjuGfXMQmZbSqnqzUoh5Llf
 rCv6fzMMwYeiAr9AYzUtHuPMrXAcQZr8Jj8IOxEhK+hLivga/DrYvcAcM3YxKaOfWbxoXhr8ofs
 hbllCEqs6zL0E52Dr5YoSsmyZMof7U1iOD4lTeGdZNh6PQ9WRCHk2g+N6iPoVEI7uT3dmGpTm+I
 03KSWi6h0NYuBaPYgZSeyGHw1gQA/NYMRu4UM1Ti2TL0CLNLRv8Xh1DoFAUBH+C5dsJIXH02Zyf
 ihV5tfr6ntPFYz9OYBA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4b8a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kbTR4NEJu8J_kXnuzwQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240024



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

