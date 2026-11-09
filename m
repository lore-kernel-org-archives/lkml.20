Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235831;
	b=ISjfbBe11rYZ3lgK/Q1GNaSivqp0eKjxPDf5xTQje1L6PkUSSQp2BZJn3R6014MFA6qL
	 sfcdSQjcCQbs3mjbzBTtgQpLqXegNj1MXOl3c1067e69AH/905aoFx9lh6b/5mRXPblox
	 EveQWwj2+pqpLd6JMHWJT/z4JZ3zdNP5qiklp4fFmfX4GxB4FkOCZHHv9S0gf0nW3S8oS
	 N4SmVb9z74Bk4GONsyL3k6tuxHuzLZiAQCml4fzDVFGN4n0V7KaUeAspE6tbi9sS+5yXS
	 fEK18vauoshhBiTPc0yMcxOsNw012Y53uEsoMdHgGnrpS/YIDM3sSs2e3kQshsrDzkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
	b=tksqeVgJW7GVAnljBGkazwCxJpfZchrxaEldxuw9wNPreYdOosZJ7wAnmrO/9gzpLjXn
	 X+u8DLm6JmDN7ANUhaLdSerJPZdxYKffqJGpggxfY5u/CMKxcRz5RQpCxAQWJr3KX/BG4
	 BzHKOy5UTfLYUTBpqIqh1MSdUZFE23h0xnlCzup1goiTnJxMrENg9TjRCf1xwf6kNz0cr
	 Di5U9GgibxavTqCHR9HIMbxUsZQtKRhArp/A8XTM2Z1NftoMBJWROLEiDtwo5K4ev6nHa
	 Rt19BAOV5RH2EkNu7jHthL5PZknZ+O9/T+NK/IRqGzSh62o8bl0gEOWOBu1k39ctj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3z9rcPP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA9606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85CA9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPsisOVo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h3z9rcPP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEsRF1323017
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=; b=iPsisOVoDXgMpI7z
	fJBnRvUvcsE5O0IpbOPV4sEaIfQZH/D30YSfvXWo8C+gDklfi0wfWWX2klkRA7RB
	ZmB+YkwxHb5VgLYumzcJSk6ynGlnRzet962Ci2Tw7WjO47//xJEXkwbPrBW4XQXO
	wY2RstYXTo57yHkfvLWsRUlGsjlN+EEvQwSkh6t8ZUpt8NvbkjiA3RcDu1LeWnyQ
	jRB23WniW+XnaQHGr0zcI2HDIjRhfgI/b2H6/67hiwVL3OnOPtJkYR3W4nimOlAz
	HErlb+dC1GZig/qVPm2A/lzgED9md9TzwebPVCxAp6jBYL3AwSBKgD4cBtHzln38
	tFGbdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrgwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:50:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so167636385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235829; x=1794840629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=h3z9rcPPVlutNPLRA2ibag+hJEPXMFTmGO3hEHq9xmBt69Bg8Y/jlOOXoLTs7lBs5e
         EM6ebARp+lK+f/dxI2UzrmUPH3ENJSMiBiUiOyUiC9XncBt+ye63EtauXmT+Vhazes7f
         xZBS06e1xhZm+uacjqTAny8fK2JX60kOFTTNHaAxpalBvlLchCKGIizI7fjUX+awcx2N
         iQ23T+orxaGMNQ7jJQRU70xzE+tRLXKGJm2Pd8W0j3CvUvODKyxgs4X+Va7KxynfWhz8
         F6+9AiNkBZnBCVSVZZZm3opNU9uQWxcQvs1KLmMlM+tQz3UqoSB4+GsaS8ApOY9TiHoL
         Ek0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235829; x=1794840629;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ktl4hmn75wiR8RtpfaYKiKGeVMUUbsH4QzLqiQ0sffU=;
        b=SM9X+vIfGvk+Qqmu6FgCVfxy1MotdQC8dlP6J299VuZSJx0XWV+/G5wqRWBZDbe2eO
         d40gusC8gmr8B1yqSPjTCwdo2NfNqPronHo5SBOrtYbwqzFLfMdQ8hValDkvy1v0wJwP
         L91QWsiAI4sl8TDPvFIqyXFbiN6YdZSNJTOxMZidmSy1YOmg8FKj1LXEEJjnUsTtqpQp
         +Aw4se0W8/GmwMy334SFpsm+k2lCR6WqeM0wjhgiPJOUOHjdIL98dbwMLIOMJoXAaqRr
         KDfDOmlykesE5iiKYelqziaC8i1RMNRd975/TRbY/a+iItQnvBbZzb6wA1RE1nKTgrme
         RoWg==
X-Forwarded-Encrypted: i=1; AL+hErG29rdKPtrFC68/h/93+yWc4zsejHxFVSfJoWvPpQYavcEvj4H8D+CWFz8nw/M3/OaCo7RbxxvmUCbQsvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mrWGWMhyQWgulY6CqXxXHJ9ImsoDDDeSXuVj8t/cJ/s4KbEiG
	owFeUDgrsey9vk78eB/9PSYmwmhztdn1lUVSalni89T6mVYgnNux+KBTbFCUcVShZbDJdAvzuUL
	uy61tU6767cZaZ7QdEbijOKH6d/ZK9kor0kRuP/zQIDfjNnTYHwlMsYxdEA41tenKHRM=
X-Gm-Gg: AYBFou3+cMwhTVTrq1oMwaFMJxRiHjczuoFob13bag8SZu5woDNr6fBWKCf9s1bO7uu
	scMsNHOVQVGnofGCHpoydatv6nWG9B1s+0Pp/fHQBf+IuenbOQ5x1LO5LhOn2eykg1sPGOmd6i7
	suzrVf2C2PvnGIZmuS1aWy/UFQIl5qkYXOLgJd77L/C6ib9vmbWIFDWy/uE0gydtV5MEhYCiRNV
	e45xKx2HPlNMDbT9hlTwo+zuA8hwCvkooh8j4QTyxC5T55tkX8I0WKPvXkvbXrX9/NsD2hFr3CU
	cdaD9l50n5CkPmmvG1QNsDoRR/T6Dx4SKUCCiNqoVaYy+heoAV8KfKencaVHpmYROu33MjKjFwF
	SlLTVL/zkhOssUgLEfg8nC7E3t0rrzLegVsUVBF/YrIgI212BFUxfWykPhj/U8Hfpyzs29Rxdib
	YyGxeAJ/wtDUTP9SQkB8B/JiA=
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641833885a.27.1794235829479;
        Mon, 09 Nov 2026 06:50:29 -0800 (PST)
X-Received: by 2002:a05:620a:4088:b0:939:7fc4:fb1a with SMTP id af79cd13be357-94784212518mr641829285a.27.1794235828909;
        Mon, 09 Nov 2026 06:50:28 -0800 (PST)
Received: from [172.20.2.50] (51-148-87-169.dsl.zen.co.uk. [51.148.87.169])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d68d53b6csm185881566b.9.2026.11.09.06.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:50:27 -0800 (PST)
Message-ID: <b77240a7-fa95-4164-859a-775a1278cc93@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:50:25 +0000
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
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO
 controllers
To: ivanverbovoy@gmail.com, Srinivas Kandagatla <srini@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX7P79XCiMdA7o
 6W0MhlArDMRwJg5onNBzqwvyHmPv3vxo+kT/PP7SrPM1a4kMlbGZ9C5nblwqcXJf0fQLlMVZZ99
 O8is1JcvVWUTQ12Wby0MvCqB8TaZ8cnMyVUgvP/fSkOCZZNqf9u7Yf5BPSE1bApb4E4yqg7Mf6w
 bW1Fu6/9eBt8B+GgAtxBU2L3ekntvL6YUIcES4EhPf/vlAHMDdBWIRr9JlOesXvW16KiCU6sVIh
 8mm7Iu/WqeEeB1wmQHdCL6zIYJ1Uu6S5HiZFsf8XxpuGXDtsXhWmBGrnjVCcjhvYFRk0emzAhRY
 lOr/HbEtc1tHxkAU2DAVm26BN5khEMhsfXHc3qUFpVz+H21FeHqKpNlCuN9Y30MknHUQGjdnLib
 CSwrCZkQC1bPv4UDdGs9b6IsegIm/UqERGndWimjVdrL5shXwohlopAseftyC+dNEgRKTCpRcBr
 aq6BrT83reRLqqbnI6Q==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1ddb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZN5Ng2YwNTFb1nzmVy1PXg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Pipf9DByAUi2Cdr85H4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: B7fAhS8ItphD2ial1QmkYjzqkZb0PqyZ
X-Proofpoint-ORIG-GUID: B7fAhS8ItphD2ial1QmkYjzqkZb0PqyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX0hdGjNgjdyLV
 AlcLgHvzzPzmDVldi74FcUsBhQLGjSl1kNzRHv/RBbe8fQGku9EaEe1u9/0gfGOKsaNEG9uOsMy
 qzC1tqcQ3D2IhCs0iVKuozbQoy/bZMU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/26 4:21 AM, Ivan Verbovoy via B4 Relay wrote:
> From: Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> Commit b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for
> Shikra") dropped the ctrl->mmio check around the CPU interrupt enable in
> qcom_swrm_init(), which its message does not mention. The enable has
> been written for MMIO controllers only since they were added in
> commit 82f5c70c2651 ("soundwire: qcom: add support for mmio soundwire
> master devices"); a controller inside a codec, reached over SLIMbus, was
> left alone.
> 
> On a Surface Duo (SM8150, a WCD9340 with one WSA8815 on its SoundWire)
> the amplifier no longer enumerates since: "SWR bus clsh detected" at
> boot, "link failed to connect" at each resume, and every stream fails
> with -110. With the check back it enumerates and plays again. Shikra's
> controller is MMIO and keeps the enable.
> 
> Fixes: b27be5a85ed3 ("soundwire: qcom: add EE-aware register layout for Shikra")
> Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
> ---

lgtm,
Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini

>  drivers/soundwire/qcom.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 147e55b7a600..99c1b6398894 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -995,8 +995,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  			0xFFFFFFFF);
>  
>  	/* enable CPU IRQs for the selected EE window */
> -	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -			SWRM_INTERRUPT_STATUS_RMSK);
> +	if (ctrl->mmio)
> +		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +				SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> 
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> change-id: 20261109-swrm-mmio-irq-d896783a54da
> 
> Best regards,
> --  
> Ivan Verbovoy <ivanverbovoy@gmail.com>
> 
> 
> 

