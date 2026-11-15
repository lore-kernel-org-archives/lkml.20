Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740110;
	b=oggpnAAhHSxVNBnszlyUuCoZ38PEv/XwswKR+z3VruyaXlL2d8PSEgEPurGJvuOmRzv+
	 XhcGyJY8+854XRE4HvrHFwl59+vDWUuH4qF7fs6NMvCr+ImIKJjccfEnaFpDT9Fd/+XU3
	 p3eA8tje3NU2kGQ2PfKWPU4sKa3y6+tlA3ONCy9nX7EJCM489qVBO4RVAFWblKyR28a+8
	 wgH0p5ikRGZxgPAkTt6h2quMP6U+9eFydUTVDQ4ACUa3CrMaV/akBldJhdSAT3ouEymRj
	 K5qbJ0i9p7rNhXvn/KPkV4ltoKkQg+5m6XCKYP4tR7n6JjkfvvFraiCkw5SdA2faxnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
	b=S4hX5JoTHp95zleSYK81jfmKCVZQ+pAwpGIi6SVr5px/eghpxo2Dcm3zqjefDMLY8CH1
	 22Ah+YNe+nCjyzx4ogzDHM1PRqUWDKglZLpX8XDoH5lUOLPSnjVDGoiBdjgUHiy15qDmD
	 G4vYiXin0poXHStGTIOAr1c/jd2eSj6woevZcLWzChYpgFrkkuKeokTY0yMnpzes4hnD8
	 kgd8YgWYiperYQ0POH2QjmOtg1UAHtwj4wIhltTBKdSExfHwXeZtfGrBc+aLEGZ70qfa8
	 YdRtObIM45GidB+QRRuBcfZQMNaUspg2NXeSoiu1SQeHgs0XnHktF6v0D31COXABj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FvV394V/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpoe5N9q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C60606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C60606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvV394V/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpoe5N9q
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wNBw3778182
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=; b=FvV394V/Htd9cog8
	Lt/hOYFr3tfmzCwX4jhi4TAUzV0bKEnr9ZD0UxMUstJkDdM/NBfv73YLkG2/ouph
	/UE73ISwr9ueOIwa1H0c+rlTEgXkwDWgRplFty+X5PTq1OXdOFOVMEDxDC6OJwfH
	TL29SxnbzUhcpIycSBdn651NqVi6oXW4eh0ob27RD23PFkOxWbxpqXIUn9dmVX0U
	hV5XclG/kxpbuZBL/7emu6Il6zS/8rovVNYsQz1/dWVWWWvZCyV8iGx0PzuIHFmE
	XYCmsEH2S9cSVy+m3C9BqzUQ2zRuIaoYG8EBOv9v2YHTvypy1+hlkXyqOzM96bde
	Cu6rtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8tq3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:55:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so480359685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794740107; x=1795344907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
        b=Tpoe5N9qdfhTRzJGBJJCuYU2S92B7Hcp9c8QhGd+6HUkzQZlO8nqZwsJhul0RYIRsK
         in6zfiWQu0ANb9to8fTxtU02DR1Vbred3FblWw01jLbuo/Z4FjqnZXFt59dBoBplJTLe
         UeMqSeB7JFdocrV28agIBbok6o0ouQjYNqLcVMoy2KC1c4DcWP72m7xET75niCiD7FzV
         m+sXkveBltIXQmVgO+Utxe/hyRIcGKej0DN7ymH3k7g9YVMSRrsqt/z5tIo8WCxNC+5N
         QLexPUe2gRecnz4U5g87l6y52bs0KibkpISaHpwFJOgYhzHf4fdrAmrhcM7Bz8ixwO7i
         UR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740107; x=1795344907;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
        b=WL0cRTnKTocHDeNwomlT3HHO6pJYFwSP9onPIF+fTocpar09WKA9WgoyG/8gi6eneN
         4UDefbfVFdT9TLgGtBUApMiN2WgNaKb2ysPwivx8bKHfIk4j8J3uOdOGOfEa0Ehr3sFY
         AKNjq3aoY6APpjf3ttS1H/9r/s6w9yZFo8ysmKUJJtrC9v6fLYnPtue9zNGajwEQXF/p
         2pvWqNDshRoLd374p/duUHZryeAaRoeuMvb13fq4MD8FUhMUtG239T0+bSZzXgdFwwTs
         JRNnmF5wZlto5aFkOX8SM0TdUSG5sU6pd1RzfyzEP+MqZCblbYs800afvCMdKPEqE+Zp
         2kkQ==
X-Forwarded-Encrypted: i=1; AL+hErFMYYhH6VqxkuHylVbOKleqs3vCqyj28mgk16qgALX19O4TPibHuAcuWY7f6vjsNaTWLjhwGA4rTMtKXHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hmqZZGS9MbcQ6/KoDRuRD0ssaZ/lTD5woGo3RDbm2p/4Crexy
	RZsUIsynib3UdUBfPNSmqKS3Dye/RXUYrlWEIFH4tH0NurO/dtjIs2dIEvtI2z1lrf6VxSmi4P7
	4Wxc0qZi5yQkl3tndGuYgwJcQxg0HMjnW/2Gv8lgB4O0p3RaBUv1lqxQjcDZW7DzfL24=
X-Gm-Gg: AYBFou0oL2LrEZgHGXtyJG1ULIKSwGVLFHuKJyg93UrbhYJY8LmhMIU3p1OY0xTTusF
	N7aYZ1H/qa//9WYX26EklbWPuX6bK0YpibV4ubrc/TQZidZyuWYpg+Cs1MzbYxT+Egc57NdyybJ
	PLklpIjQijfffdBh16x//QrY64aGK/eSicXQPIxfOrtfqbARKwOdOLq3uQa0za5JsmhmVVUHXw0
	66fY7nK8sYgxX0BGOgthvonN+Mt/e+LHVYrFn/ATOSi1ADwqUnEvxxS3VJkkqpRMIaJQLtA+SMZ
	vhEupSBt6OaGX3fAFwvJaspJVOUF/GlcjtP4zt5YL2QJJGkrfJoMNaDEV6J70fSXjSz+rWkG/Nz
	l8YnOd5e8dp/trf9KXgujQK4HrQzuTOKwbDwXMHeMO4RtEIGF+k/PelHx8iWvAzl6wdIMrNDTha
	uo4fc7AOOIF7y/hqBt2w==
X-Received: by 2002:a05:620a:6910:b0:949:76ca:ff30 with SMTP id af79cd13be357-94976cb03d1mr118495885a.31.1794740107313;
        Sun, 15 Nov 2026 02:55:07 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:949:76ca:ff30 with SMTP id af79cd13be357-94976cb03d1mr118494485a.31.1794740106831;
        Sun, 15 Nov 2026 02:55:06 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c50d97cb956sm21842266b.24.2026.11.15.02.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <5d8b5bc8-0937-4ee9-bcbf-4d35f05bed0c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:55:02 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: q6apm-dai: reject compress rings larger
 than the DMA buffer
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111080624.244291-1-julius@bairaktaris.de>
 <20261111080624.244291-2-julius@bairaktaris.de>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080624.244291-2-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af98f8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dN6ZHlLifVicRFT-rNIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfX5F4BTWgWUAOX
 c4A3x4sZlOA2hemnKYEJDef+kpKuY3YKxHSCqBSAz9TQzKfxwkMzf4jxngjDJlwY/cBAFdVzCb1
 ot7qhcGnpWLZ1E3h1lTxUhexDO3hNow=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfX2yiT2UwL1Y0n
 FFr1DhJYMmY30S2fAe/hItwH17Hqt9Dc6/9CXI6jrXERGfRFwEd+Jf7PjQpTW+zm+E0XFmfKTOX
 6+LfWSIRg0S1QVRa06lCM2iwb2aAOwI1fUK2bbvrgP/6OzWgwZlrngqwwxNHtChETSzSPXPmC4p
 MOghEbT+B8xS9NDTW9WF7Q6j6PO0v4LUw1brqATe1JE2djXavvBRTGzUJRxWItXe2T7GYuB5kXY
 1Bbjs8BQwxXSooXQ3ObuDcAOxaLguhbZwt049mIKLWA2f+WXhBW5mPsUYRv0xK4XVqUg8DDH2nJ
 sIFJFdl/QJXE+ikrUFV0XftsLo8ZApmDOlZhBwqf5YP4zvfDi1e5EbU0IHqisX6e13XSItFT1t7
 GOyCsC9a0CpF0FdVJHWz2h1XekkxGxgs/WOI0v0iKdM+pxR646B3ju/0fIEi+G00rae7L3CoaIk
 cE7Inx1fTIDLUmVLRdg==
X-Proofpoint-ORIG-GUID: cNjp_3onDuSz_wjFhhtthOCP2XvemE7C
X-Proofpoint-GUID: cNjp_3onDuSz_wjFhhtthOCP2XvemE7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150043

On 11/11/26 8:06 AM, Julius Bairaktaris wrote:
> q6apm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
> q6apm_dai_compr_set_params() takes the ring size from the fragment size
> and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
> checking it against that buffer. The compress core checks the geometry
> against the runtime buffer only for drivers without a copy callback.
> q6apm_compr_copy() places each write() at the stream position modulo the
> ring size, so a ring larger than the DMA buffer lets write() copy user
> data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
> the next multiple of the fragment size.
> 
> Reject a ring larger than the DMA buffer.
> 
> Fixes: c317d148a2b0 ("ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---

Thanks for sending the patches

both look good to me, but I would recommend adding a dev_err() so that
its visible to user if it fails.

once that is fixed.

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini

>  sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 58beaf906b9ff..80b837992b429 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -990,6 +990,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>  	if (!pdata)
>  		return -EINVAL;
>  
> +	if (runtime->buffer_size > prtd->dma_buffer.bytes)
> +		return -EINVAL;
> +
>  	prtd->periods = runtime->fragments;
>  	prtd->pcm_count = runtime->fragment_size;
>  	prtd->pcm_size = runtime->fragments * runtime->fragment_size;

