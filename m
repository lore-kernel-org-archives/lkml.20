Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE163AE6FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439758; cv=none; b=nWs4UETNBaQXUSW2UCyun4S2Tnm4r88pH+hAprwgHdpmCHJZgXwQlkaCsf9P0oILr9dM7ikokZFYJS97ZzJ6pQtkNwS7sA05UQAwfE5UAAvRLjc92zxLT7n4MjevZHX/8qO7zOrdYNncY3QPtMUMvATqqNTeeUNc5INh1p1vpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439758; c=relaxed/simple;
	bh=0ImHZkvX+097WDBIdkl4C4n6ZnF7gvo0rtHB3FavrVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFZISJAugHoT+D/FF6MUwUz0SrLhapqArFZdLLm7omxxtL8JmJWRSwFXFwDQkMQ4QAPrQbZcieXgVc6au9MJ/lCUjxS/Nbe0sq/uSYKanxnsbWB4AlZ29k8KaU/EH2QQNdf7MIzYkACQ+XghkWWkQgLiiz/OKRonwUcQ7wTEMkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELHtav7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBPKrpFA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELHtav7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBPKrpFA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXCw1157823
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51N3v1eIrpPpZPX1rzhVwiekXKC7l14bEGdZyme3Ups=; b=ELHtav7HWc3U7LkP
	LmxamzzdHPjZz0lCK2gL2MkE7uQN+7FARNH49u4o4AG+HUe8X3/mF0NhfCUcVr9V
	k08SHqWSKl0zVovCQvYzygOm55Pf4nR4BGXPSceJM7zfLngtcTOJyygXjwkGO0ua
	NbGuBuTOBiEygbmj5/lcz7J7ZBLdvkSaRYknmmWoUeh510+1Y50cuimdpH3hA7eT
	8XH9NXTidR4aw5s8ijbd+fJ9VQN2yJdDTcRU9LssVWyF7UPXqNBW65T0r6FQUFOA
	mQtNPDGA/UH2nWwfkDSg2F0B/bPtdkmBrwQ9jGFVF6ihUT4QAbbjgdV5z10k/fKF
	5B8Gmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51d2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:09:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc0b31ecaso1054861585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439754; x=1792044554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51N3v1eIrpPpZPX1rzhVwiekXKC7l14bEGdZyme3Ups=;
        b=KBPKrpFA0LnX0OlHZ8Fum16KOT0wqYt1EuBmMfZ0gQvNdULpvjmbHROW+3uhL2DCeo
         9YPpZZfr9Yv5+rMHcDQe7iI0rUzg5v4vC/bTv+5AODdP+nFxfdAq0pPtPXFD1gqp4QbA
         hoGJAN8m0BK3NQUwUWm/PiThfsnUCDwRVN3GbzaFh3uBi7sf+C/9hxxPUMAkCKljbbI+
         ddn8zcPtw113TLLxRoRIsFupTsygPTX1UawWR7OaK6yi3myy0I8jZ2j28SXVE10obo2o
         0sKY7+kMa+jHoQBw1rZsB/xjg92D3mpRKu5oQBrUGRJssL3Uwd0YqIy3jY+ImWIBk+gV
         GoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439754; x=1792044554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51N3v1eIrpPpZPX1rzhVwiekXKC7l14bEGdZyme3Ups=;
        b=BmVWhyioa72GwXiNl30j1GYXU58fuE7QJ/KuMIxxJa/Q3vz+SNFChT8i4LxnL7Shm8
         Z++mfL9ew4dswrJuZhx8WfKM3sBIIX7iR0qA+HUW2uJ5cGx45bxSRcjwwh0wdlKyc5WF
         um2Emg8i/DkY7GL/hXn/K3VGWJljU66mOplrKnCwv3PDhXefuGgueFhPBS2/PIfOSFCN
         xfVxHoMVOFcMeH4xBmhq3GRA3mVzRJgGEBSpQBPi/3bhLzKW7UbIuVjzW03VgP23yiaH
         kF88hlfG0TPSGCnRvS0ORZ/FQN6tFfMVcviEagjskB96UDSH7Z0x3a+pOjJ1OIrydwiw
         VN7w==
X-Forwarded-Encrypted: i=1; AKwUvBz56TIpNw3kUrTS9zVgY265JlH3XCVZ5GOf2Xrov/PRjoPGbLbYKIsdGGu9EASRPajUGzisc6a5/djllhI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKQUGxTTi/xR7szeYY91el5dsPdH1X6knEFftRAVQ1/NSRUOew
	hGgqsDanD7vy56Zg2qa6Pm00xDZs/vCWCkZEHPHopiMVg3s1283zZwyNMS55/JIjBIvaL1y0RE3
	PWpm4rjK0w9AQThNYGgBp1bzu6ucxE+ZdRQOfSzhD1VU+12UNWAHirI4IBfPGSJyky1I=
X-Gm-Gg: AYBFou13ylKkkfttzy4vu/IQEiQ2XubrWRv6Ym/wNSV6ZBZEHY/K1n2o+Cchlqx2aax
	itnE4Rw4OtUQBssCZvMUzONlwKCruTdBSPP+T1rH2WhIj7dF/K7cyeLoN4Mo6TwnI+iOsaXX6Rg
	dVGpT+w96VOSeCQ8L9VRLRx2NH2rPxCTq5LdRVulfOKBdEm8pCRalccILJbQV+GpVy8HsUasxnK
	xCaChoY6L/ipsx0qPwa3HywUg7FLkL5+wXaoEsFyTGm1O3eD6Sw3x5g1LfvL8MNsQV4ZZzLq40H
	oEcFqFFN+oRfZGe/jNkYp6tB1CMtS8zyvxFDYBVqL3EWgQSrSHhfDnMJ2oI4JafPG5KYG/l9Nnx
	1dsNEqxoBBXoIMOpxieLVnA4UwycNpdnwSQmHBYY=
X-Received: by 2002:a05:620a:2713:b0:93c:69ac:bbec with SMTP id af79cd13be357-93e9b7d70bcmr915740985a.38.1791439754441;
        Wed, 07 Oct 2026 23:09:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:93c:69ac:bbec with SMTP id af79cd13be357-93e9b7d70bcmr915738385a.38.1791439753972;
        Wed, 07 Oct 2026 23:09:13 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d30603sm9531448f8f.49.2026.10.07.23.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:09:13 -0700 (PDT)
Message-ID: <1bfb2b1a-eccc-4896-85ec-75b368a4db11@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:09:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/74] media: qcom: camss: vfe: Add support for starting
 multiple write-masters in one output's group
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-30-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-30-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XK_P2PPFSnvqn7pZ4538UhbqKYVHHIqu
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac7338b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=H5aJt_KGllAkEbt-fREA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX3vsS6rej6E8C
 IO/OE72Iwh9e3uaJVSWkd09n4AkJBR+XQjsjP95xBWa/FVPyhQNdFGCgD1vmspSP7uqbqjPbxO0
 IG1ZG5VyaBDGKHA4o4QV9mEzEsp4SMY=
X-Proofpoint-GUID: XK_P2PPFSnvqn7pZ4538UhbqKYVHHIqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX42fmRJLO3q50
 gj5YMljevnwo+pA7eA0Z7hzq9nfRKAdd+NsAICyP+rqL6NFLB0xRdKcHX24o6tyWflgq7bWVJs5
 PZZ5LlgaKHDT5M9MhUWIV5LunSV6I1tvcKEkCdM/8zX1unk2VzBq991Rsjrvd4t+EdgFdgQG/aK
 KZo04K4SuDzSt+PlQjDhaBBpSFm2pNGCVGa1xraxvRbuL9/+LIz3tK8grYP65QFCiUBa/hZndzM
 C2sQ+CWDGHi9vumfSExwFSM+wXne6ZLP3nWVqkaExFo4P3PyRy4Qyw/JIOMk6aPt15kVrtNmyAi
 GOo2SwCwSc+uzyXV7C5bvtgFDEcOizn+KUwD1bhI0+/QbXIE0x1UdaHzjnIASB4SGGTArU+NGwB
 OqELzty3biTU26TBfy2lFh5Tmzlo3mxZkhGVXOQr8YE9im8FF7YSOLBFNTJR3SLRNwbfihVb5u4
 AeUSKFDXxyYu/SlC06w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

Hi Bryan,

On 10/5/2026 8:14 PM, Bryan O'Donoghue wrote:
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 63 +++++++++++++++++----------
>  1 file changed, 40 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 3fe0139f82d16..c078af53b0758 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -642,36 +642,16 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>  	spin_unlock_irqrestore(&vfe->output_lock, flags);
>  }
>  
> -int vfe_enable_output_v2(struct vfe_line *line)
> +static int vfe_enable_one_output(struct vfe_line *line, struct vfe_output *output)
>  {
>  	struct vfe_device *vfe = to_vfe(line);
> -	struct vfe_output *output = &line->output[0];
>  	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
> -	struct media_pad *sensor_pad;
> -	unsigned long flags;
> -	unsigned int frame_skip = 0;
>  	unsigned int i;
>  
> -	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
> -	if (sensor_pad) {
> -		struct v4l2_subdev *subdev =
> -			media_entity_to_v4l2_subdev(sensor_pad->entity);
> -
> -		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
> -		/* Max frame skip is 29 frames */
> -		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
> -			frame_skip = VFE_FRAME_DROP_VAL - 1;
> -	}
> -
> -	spin_lock_irqsave(&vfe->output_lock, flags);
> -
> -	ops->reg_update_clear(vfe, line->id);
> -
>  	if (output->state > VFE_OUTPUT_RESERVED) {
>  		dev_err(vfe->camss->dev,
>  			"Output is not in reserved state %d\n",
>  			output->state);
> -		spin_unlock_irqrestore(&vfe->output_lock, flags);
>  		return -EINVAL;
>  	}
>  
> @@ -683,7 +663,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>  	output->wait_reg_update = 0;
>  	reinit_completion(&output->reg_update);
>  
> -	ops->vfe_wm_start(vfe, output->wm[0].bus_client, line);
> +	if (ops->vfe_output_start)
> +		ops->vfe_output_start(vfe, output);
> +	else
> +		ops->vfe_wm_start(vfe, output->wm[0].bus_client, line);
>  

Is really confusing we have new API but just start_xx has guard whether that API is used,
Not to mention v2 and other vX versions of the functions which is difficult to track. Can we
abstract them to some kind of ops and use one or other API so will be easy for the new platforms
to be integrated. Honestly is really difficult for me to read and trace the code in this file,
but since you like it a lot and keep on updating i don not have match choice than to work with it :-).

~Gjorgji

