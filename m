Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594847;
	b=qajBZ2YIriTy0JydBryD5HMlx57Go0bw36T4nbHvd49SpaZ4MDCrAf0drFozto+q2yJM
	 jYpZktnyC+4W9MDpTFCunPBmlekbRiwV9b/h4SdgvRU4sZQHGA/I5oQ4Ce9YKSHl62lXl
	 c3UCSi+y378aW1ZZPqAujek1fcrj86MP1QiSJz00vOYp9CJmCebV7Ipdvs2nrHP++OAxK
	 yVpVUU4NSL/WXEx3GYf5I1hpaQJ1z1GQKsussVeq68ZVQj1V6zXqSqVbqcR/4/Ii66qfh
	 4DUFrZuRpQ6qfe/lu9MpCBQB/Mg+paq74Wen3wgtV9osLaH5m0rih7borAxpHzVpHpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
	b=FAcracAYi31wNhoa37AVM0yzjVErZrZ5cN4jdr2vwjstbF+DZa5oUK/PdoxnVhrIsb9P
	 /LnTa3Fw/Nu6KewJvup11Hr+QeJsqEwSDj+DG1uiJyNSg9+KBcUgmc0h/rJFloEpmB446
	 BMBCcrwtwht33JNLLd/RzsXKPZTB33BFRsnUsUGEL+rBsaA+weZb5ps9G9CPAZ8TcQCj/
	 EpZ4hCoi0shSoIEaozv4x5IKTB49Opu54JQONu7UHkFr970c3p+L8RkWaHmTFxQPQZ/ta
	 k/4zJJL7SAZbDAGCJa74RAg+NIGftzi5Gfloj1bnPoR5YeXmIwcMDzDFTrdTLwRel7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE7Ckr0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5DPAKDs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68969606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68969606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE7Ckr0G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5DPAKDs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v82U3768687
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 04:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=; b=JE7Ckr0GI4Fb3RRv
	E5BGIb73LcqCdEzu5H2MDxXSTvoC08SDt29RuvCZyck3ppHYChmuA1f4Clqhb3n7
	cI1fcb2U2Idae8AWOTy9u8ypi0v/G/4IQqOqTiwSTaY6EAA9Fn/I9/Xts+jApgrt
	j0iZ4+mPpb74oqNU6qZ2RJ0zZYT/g5uSlzR6TWe/o/JArdvKc7v/E5Y6UgQNcflC
	Wnf6M14Tx086eUTIce5u0AV0HGB5GC01UPumd1vbzAgVxaDyyETCaCom4FKVVAoQ
	qLBfxLm5jY+Gu8DXDUKuQzZ+1f7LkM4l08V45qvxpnKUPopKPR4A2+u2swn7WLy/
	1Nwnzw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rw9u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:47:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3698bd5392cso2363138eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594846; x=1794199646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
        b=I5DPAKDsb0UcO86HAh9LR6rn94Lv/4714tiJClt2R4pmo5qJv2n5tARfvuYbw18m6M
         8JiAD3nsZAAnRimSlVNTyFpawhtSKxaxkoh8Ib5Wm95r67LV41Ikq4dbjeIARjTJepTd
         qztfjeDEAfB5Dig+c1igMW/b1eBsnIKxjH5/UEzrcBCr3XTx9xlEjIDMHtZnOWCoQUKP
         8mHcKY+ZKp4+eFGE0InP4HQaM5eB7G8UpohdJ8fNC8PagRc+BLAa3Ipvng1oWvnRQx0X
         JvuRQ8/qQK1QqvNboox0d9QoeDnrzcauq6GtxbKZU+B93XwkEB1QwRIDSzpeqx8zx+tS
         Ym8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594846; x=1794199646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
        b=CPjuhePCEUqZzRYHW90dcSH/FxIr1DWZD7OhQaew73qu0E76CrXCmarmiSoBrYXdCB
         oVf3ZCWCAwfSY/K05SebJeAGbzsLIzV11ReELPItFKaOf6+0sVdP0ieH498Ru8xw0RIb
         SiXcXLsp1micdCHyViPqZWV9tKZtG8PyenPWivEbWwCGxe9xgwuQMCt6fVaa7ygi+GHu
         VIA5Sti6W0T+fTRSN2qNxI4LwWtNB9d21ivp5tl0Lk1w1SwweRVLbRW6e4bJj6r5MCH8
         wDVgXOPUrewUDY3PaEAwS3ezPXuXF706Gk5wshYOji5iF6mbuUZIme9lx6BY5i4N5ygO
         vf3A==
X-Forwarded-Encrypted: i=1; AKwUvBzO7TlafbmcQa96ecmFgSyL0Mx8KppQRIjjWq4CuWqdPzJ9Ho2dj/xAMoBvzVnwRisfay0mHRbjyedaYOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JY9pVZFZMZ4jQROaBSz0Kj6IlwfWDZXcOgT3XxVRIiZBceqew
	uq6W46ERB+gQ5DCn8fbsVNStlWXHEFUgSocA/CLfBXLFAaR+ENlbGTDCBy+lrvCSnaYTrTyTACa
	kNQQaToXu784j9DsV8pnowhsVjo9U3M/uInrI3cHPuZomJE7G0FnF/QLgmDrRyDkx2Ws=
X-Gm-Gg: AYBFou2I4mmlx+s7E/HxlufL5QWJm92YjwVNZT4/K9EDexfEfMVh73Ch31jTJwd+L52
	/XYcDuAZ+KLrZ7M2b82QzLzEc0uA2IOLzkdvZ2XVCbour62klSj/mj9tfgUmAgTGD8EesA+cjSn
	TcRHoWepCc3Q6AAJ6pAYDNtceO6Sb/KwdS+cx12OK3ZPH6EoshpRk6IeESb9R5erpzDkIzmIHNw
	3ZS+emNR6527Ft+k9VC1gJNoixNIdtpDLi83soHmZO6UD+k+veEBO44QND+7s6Z7aQhIMok2ygM
	ahIFn3JqJbrtdeiXrUJNU+MBPQRA9OjEXSUk3D8C7Uy8SWoWa4T/RAAr/lkARCuMFuJYdwWMWE1
	d8inh6bjPwtnGTfAFdsRjK0KIe1iAiIxa+efaC02rF9vANVAeWrzUEhLrE8ByO0D2gWgGO8SGTX
	ZDh/iO8peTEuTMid9kFUMd78/+Xn1kk97YUHHW
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f4mr1817093eec.13.1793594845525;
        Sun, 01 Nov 2026 20:47:25 -0800 (PST)
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f4mr1817053eec.13.1793594844776;
        Sun, 01 Nov 2026 20:47:24 -0800 (PST)
Received: from [10.218.48.51] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm33949189eec.21.2026.11.01.20.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:47:24 -0800 (PST)
Message-ID: <b31b9ad4-b17c-4dab-9bdc-fc19b1028fd0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:17:18 +0530
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
Subject: Re: [PATCH v4 2/7] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oqi2gr3W0uq0HEHggD83sGPX5kNvxMpF
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae815de cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=gKCUJ3B0P62vvhmKdnEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOCBTYWx0ZWRfX+17fpur+/xUF
 8A4WHB+ke2Ykvf/cAfAVTReoua0LHKft8Ea1F038lfCu/TWeMuhroX5hKBjLOmfvKy2qdZVHQX2
 sZY03ANH7+0UVJH77ASRz3eWyiqySkk=
X-Proofpoint-GUID: oqi2gr3W0uq0HEHggD83sGPX5kNvxMpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOCBTYWx0ZWRfX1hvRmIDHQees
 tOPFyU9ev1WV3qtQdfzK957hyJHs5Cib8mms0qx0VdF1vx6ieQoGW+NEVzkp5eho07V2KZHnc+B
 LiaRa4NWwAU6hTMJYifqhZfE5ehNdW8FuUDpexsKdC8zDBeDbk8vtx6Z5ckhFSoexooDLH5N+3d
 dmiH9EuHvF18slKOeWP9vrsyf9xbdaR59q5Dug0SgjZ+645PlLyeuCLhWi88f3QrZPFC4eV5Dgj
 zECxuzbBX/BabjMmIklqV3K7spTazRAYlfSWVdI1fMlGTxXKEjZi3JennM/NuV/0m+bxGmo9qPW
 qOVE0RbSy45EgSmMbQuRW/Zc3HSqWxbPPDUMooUxr8ACLYECyipGG35zdeK0KxxEAKFFdviHj5l
 Q0sNAQvkiTm/9xt58jrs+ZGHeqq81r2+DZjsZhq6RgVakb2n1Gmyfzq60adFQWzFCn7dCoElawM
 4lzwQ/kKM3KvHXT6ciw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020018



On 10/29/2026 12:29 AM, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d4fda4dd81f6..508b1ee7cd0f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   	qcom->wakeup_irqs_armed = true;
>   }
>   
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>   {
>   	u32 val;
>   	int i, ret;
> +	bool wakeup;
>   
>   	if (qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * For runtime suspend, always enable wakeup.
> +	 * For system suspend, check device wakeup capability.
> +	 */
> +	if (PMSG_IS_AUTO(msg))
> +		wakeup = true;
> +	else
> +		wakeup = device_may_wakeup(qcom->dev);
> +
>   	for (i = 0; i < qcom->num_ports; i++) {
>   		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
>   		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> @@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>   	return 0;
>   }
>   
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   {
>   	int ret;
>   	int i;
> @@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>   {
>   	struct dwc3 *dwc = dev_get_drvdata(dev);
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
>   	ret = dwc3_pm_suspend(&qcom->dwc);
>   	if (ret)
>   		return ret;
>   
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>   	if (ret)
>   		return ret;
>   
> @@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   {
>   	struct dwc3 *dwc = dev_get_drvdata(dev);
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>   	if (ret)
>   		return ret;
>   
> @@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>   }
>   
>   static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>   	int ret;
>   
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>   	if (ret)
>   		return ret;
>   

