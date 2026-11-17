Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928310;
	b=ZwfjGkXFn4DEPZYvvg7r7TjIHUvSP1oOR0JKrT1vMYduJYKZCTGZowNoaDCZDvb+hwod
	 8+dB7o4H1ngjk+rlV6GTwS1gyj9ga4TAtuNjZ5510dQcfQ1HryvLgEltVDXoqZJjvUBWC
	 Cv6ZuRgVIlRExOMIkZEg9upgP9Qmxhl6aYesodidfOUrMlbV5hsmUzthc64AdzO83CPHB
	 Ei+mbc9hIRtQoF4KZki9HwLCVu/29NOJSvNg0F/k1vAOxA7TsnKXLdvSccKe81SdFY5ZH
	 nyE1BjwGvwTZOI1HiWMsy5Pwx9sDyDRQ3O+fTE6RM0vQM7spv5oj0X6k40iLDa2VCAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
	b=droUAvYE/Zlxy1ubwWaRoAZzUu/fAo5NOiXFWx6hFz25HMv9bCkewDvbb3+X8FXkDmLF
	 1v/r20w8Zx78uVh+cbuGtUyy4uyw3C8X9HRWSRDHpw1hrURqcO005V4ls3uAs0WcFbaH8
	 ds93UdLyZ9pAUPEVwwmVfc2vrjBzmjfia0rdnEpT1P6BHBEn8vLF3JF/vZx2dib6J2rNf
	 5ox0dNlAaceebRNXajDgwPJvV4N5NPchOTPvXZFqHbz2RUbS2vk5DBPJqLaF0kUUW8u24
	 o77S2WojRLzzyLbD26cNLd3jH41VQc7HLrPIW9cOStcvEYb7NyHgc0gNsWFwRfqUM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvjYZQit;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXxXuRNC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6AC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvjYZQit;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXxXuRNC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHF7NG31097222
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=; b=LvjYZQitAUsfFsf4
	fAtooDTrDGJioWzyr2+fA+DwOxZeBWz6+E4OJ6x9/LRON/pluJAvOFyxGAwjFh30
	SHYozf3+bysDM66WyZUlPrES2tT8wnhFCOp1qL2mXiuNjl+s3GMbLTk1bxKvevgs
	vh3dNzp06WZlL+tbl9eo2H5nW+i2/K+dW9aNsuMheN6muoVzVzmxABSU1E498QV2
	2XFVkGvxICXWI8d3dNkhXhwFiQnxKCM7rf+jwa2BZytLFsrHn3JBcQRDJRcFWs2C
	3p1cK8P8Y+x3RakH8WWiqYbOGCFO9Fz1NwjEK++Xe7ll9HH9cgAhSy0wFfEiS4ia
	wgrcUA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t00um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:11:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec3e1921ecso769311e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794928308; x=1795533108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
        b=DXxXuRNC3FB7NY9JAvfO0kBGEr+rLwhtxvW3XPRvKXcHHmx53Cp7PrakZM0uKPeuIc
         GyaRJ9MBKFmEnr9fro21kXpTE21Ls16VQhOtTNtP4AdN0mjQeLn9PdK8CXz6mQGldJp9
         8C1Lpa/12tVO58wmxHuEZmfusquzyWqShs7Wzk8jOzdSmS8Zdm4LhOcpJbSUg2GongbN
         r/vXuqCfVZv5OG9cKxWXVPlHKav2vj/jnO7aAqGPNShv7V/hRNgWxORwXSgHQecepjY/
         qxOqEHpLMAKb+7XDuGLVzmEHRTzZq+Z8YPWIOzL9ldpwdVqvu1NgWIYfuddxx4Vn8EGH
         umaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928308; x=1795533108;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNzD8Dd/4XFbhGgAaIYAJ585xLYgQxuD6+8BDcYXRhU=;
        b=heHWEB0oN8ZcHNEE+fXKe4wUVSZfQ8stWg7YNahL1xqwKsVjoqzvfD3plzBCfVRzIE
         EWzwh322lSDuLkD//t8m6EqAh5pJA7h3K4Ury1TT9tApJjpodfG3ABOzvfEUUdxcVv7+
         y6sxRLzJ0y99jEvxo+6/Bm9XYuqIScLUjZITFZvkwwN5u1aLda6q8GVBV+j5v+QEYlNz
         lUKZyNKpF0fHc5DkvOKEmgVWDUpJm8WP2KDLpWLnZOWdnSoIC0xQXAi0feXHEtOa23Q+
         e1HHeLj2FGAYDjRJSS32at/pta+xmglPqNj3xc4MnsrcIyZLwrtB+4AMEuTd/G92adbm
         sBxQ==
X-Forwarded-Encrypted: i=1; AL+hErEOuaY3/k1GJz5EXcJBPazy0OiFLN90vsOQld3V9OJ2MOwFzv4gbs1Jb+9KMnIxnToxs/ORsNEbJcD3Zuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qtgofDuwcCb2CY01OaIzX102tD4RrARDY7rG0zCrcyzcSG7Cq
	Yw1MenH5RHXqYljeE+LKAzb7jJiPFk/c/HMPMHXApUfp5Qblm3KOfEVIqV1H9Qidr8g6JHIRnBI
	mvsJSgZTT9UjvYV5il4maq5o8GtA3AJ4mvJxzvyr6G3FTHAfaxgoCfapWT0G2Lv3wYr4=
X-Gm-Gg: AYBFou3WsRRuXOvz4HBECIOwB0ODirdyPOIdvvqzafyDbOuy9aYcPXU8t2WYzA5HAzT
	Y1K71nJe66ST9elNtJ1zooEIejpEFN8QP8SOpjuXLOQcpg7J/Et2+P5mbeKRWkCpz3XgZyr0rgX
	0kNZ/d7l+my20QXZCogX2P3CvXyUtqXm6xJiMBxorTlTG1LVMmjFm981304hglixgOJUONZPApg
	yUKWab0oNhjCbI0XAOXMuRMRp4dcsWia9ttOoWpUTv13z4dhzGZBskyZuGsjVfBAb2nEo/kuQUW
	9Zu63c2QVX/oPFLXXkEKmmwC5gIeUe5V+sZTF1MO5RzrmwzVUZsS+U703spDdRfkkdeS20LD69W
	I8+y66IeKeX9p44df2K9leKhdNUnJ+0CUmWA86Vi/ww8BmeKizugEmvQFCDbI8i9cjCwUMIoU9Y
	E=
X-Received: by 2002:a05:6123:404a:b0:5ee:b3:a43d with SMTP id 71dfb90a1353d-5ee5b8023acmr633950e0c.21.1794928307521;
        Tue, 17 Nov 2026 07:11:47 -0800 (PST)
X-Received: by 2002:a05:6123:404a:b0:5ee:b3:a43d with SMTP id 71dfb90a1353d-5ee5b8023acmr633917e0c.21.1794928306764;
        Tue, 17 Nov 2026 07:11:46 -0800 (PST)
Received: from [172.20.2.50] ([195.50.164.66])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5c171264f64sm4169498e87.0.2026.11.17.07.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:11:45 -0800 (PST)
Message-ID: <23d3e257-284f-484e-b7e1-b597208b8fe6@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:11:44 +0000
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
Subject: Re: [PATCH v2 2/2] ASoC: qcom: audioreach: only disconnect the route
 a mixer control owns
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261116-q6apm-fixes-v2-0-ea89fb43316a@proton.me>
 <20261116-q6apm-fixes-v2-2-ea89fb43316a@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116-q6apm-fixes-v2-2-ea89fb43316a@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: d5AcyPbGwW1Tn0boOc8RTfyZZ4mMBErH
X-Proofpoint-GUID: d5AcyPbGwW1Tn0boOc8RTfyZZ4mMBErH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX3s3inJEsWRG6
 LnqDuGpgARTcOLSyOO9QOvg6bI8lau9LkLOWyM6ucTzGc1JTrrobBXGHQdf3x6xLhtIwspsHRPQ
 UX6snXchvvQut6S/OcpiwUIhBLG+m8GE9bjnyrKW8u6jnCZ0qBYKWO5CMAhqtaph+DnGYnguCyf
 RqIjImiyVNjHqDxTCOz+hakkQGe3oRckSO7WbCnXzdRlqqjrmByOx6qBkcMXbz9mfS27qzqD+Nk
 fAYNBkE8BoPGBI1nOOmrLZoVeuALWNxuiWSaPwuLW9RO+e8vJ4fHB+n6YGY7cWq71jvcxoyGVPo
 0k3xdCr1ef7lEVJFMysJBGXyaAKhQABVHSML+Pg8gLT0wjRN4gwvEr3aWYvY3Ymh14Y8JtHQfGv
 fiEoL6lrmBVBwA2XBl1AF76Tb/q2zA6aoMF+owJ9SPIF5DWwEECe1XmG5WCZMdLHV8qYv3B/9tM
 HWLaqxB54zyb9cKJM9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX1HY9RFqTogl0
 4QlfZcjQGmg6V86hlP2zQanEYS+L0xqAuMlabRCOoUSw9z/J7jqgyllXcDmk7YLfm9uWb6v3I0i
 e46ephHDjya6H9ZAGcx+dNelxEVFjVI=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afc6eb4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JUj6TmFbuaZIJ1gx_BAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060

On 11/16/26 8:16 PM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> Each AudioReach virtual mixer route control ("<BE> Audio Mixer <FE>")
> connects a front-end stream graph to a back-end device graph by storing
> the source module in the device graph's audioreach_graph_info. Writing 0
> to any of these controls clears that link unconditionally, even when the
> device graph is connected to a different front end.
> 
> When two front ends can feed the same back end the result therefore
> depends on write order. On QCS6490 (Radxa Dragon Q6A):
> 
>  - alsactl restore writes 'DISPLAY_PORT_RX_0 Audio Mixer MultiMedia2' = 1
>    and then 'DISPLAY_PORT_RX_0 Audio Mixer MultiMedia1' = 0, which leaves
>    DisplayPort disconnected although the saved state has it connected;
>  - the UCM HDMI enable sequence writes
>    'RX_CODEC_DMA_RX_0 Audio Mixer MultiMedia2' = 0, which disconnects
>    MultiMedia1 from the headphones. A PCM started on MultiMedia1 after
>    that never advances (hw_ptr stays at 0).
> 
> Make audioreach_connect_sub_graphs() only clear the link when it belongs
> to the control being cleared, using the same test as
> audioreach_is_vmixer_connected() does for get(). The DAPM mixer state is
> still updated for every write, so DAPM keeps tracking each route control
> as before.
> 
> Fixes: e4977b91cff8 ("ASoC: qdsp6: audioreach: Simplify handing FE and BE graph connections")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---

lgtm

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  sound/soc/qcom/qdsp6/topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 612d8f03e6e9..aa2ab2b058d0 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1240,7 +1240,9 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
>  		info->dst_mod_inst_id = m2->module_instance_id;
>  		info->dst_mod_ip_port_id = 2;
>  
> -	} else {
> +	} else if (info->src_mod_inst_id == m1->module_instance_id &&
> +		   info->dst_mod_inst_id == m2->module_instance_id) {
> +		/* only drop the link this control made, not another FE's */
>  		info->src_mod_inst_id = 0;
>  		info->src_mod_op_port_id = 0;
>  		info->dst_mod_inst_id = 0;
> 

