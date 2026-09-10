Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC43F86FB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030918; cv=none; b=D758JZj9LW3zaCgubtSB3KAsA1eqQuWW3kWmqi6+dEjp0wbNXi3GJmPUPvAMgOndl5uyH+g9w6MmEgogJ6vnVW7lba5OURNtJQ2YfKyKbGwe/bkjygIhZvWarD4w9VOzlHhxRMuXrkzdiVXJEpzFyrCzOzAGAv4egRitNKK0YQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030918; c=relaxed/simple;
	bh=HsMi0Auzm2afAEKZnJQ8VkPE4aRE4BjCZHDZ2Q9mjbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmnsysP8mL8GmuUk0XDTHNlIZVVw/vJEBK8cgqPxMR1i0KaKHBADwrr6iFniTWIiRLSRV+JfOWRSWBzq/hCTYcx6GlqwG+PJoRHP+IjgsDGO224TiWFsRunYsFHFRSsmX0GXt90Ekwmlci5nA842bZtIXvAOw8uV96YpD2K3iQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UT6WhknL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbb1eNpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UT6WhknL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbb1eNpP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pkxg474849
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5Z6d38tU8OKJmaSUZeG1duOaSUyg30xxQsgQVhiBsc=; b=UT6WhknLipEJ4MX/
	j+x/vJgTk6rT5Zg0v5PijnMIDYhWjEeQ3VHNhwlkhudUddUL0cyUvlKaMLvnWzgc
	QMtE7ZcoFAwoZTKOOXdafkAGIzGTboHIU5d2aJnAWkcIsqqIWOCeUJCqjSScw6CF
	BPgHdGwT2A7ctJhzQ4pcWnW98gCnI3aqWRoiUqBdijo3col+AroGQmDKTjgWYAKT
	SpztUl2/pLagdCdoWHDEUXP/SgWD+HcbVVFXIPu1zAa602nfSliBKz+jx1dfVeVk
	v/zysNxWJCYcv87MYuaIWiVl7LmxvWkGTC94Zr+m3WptL5k64kqh14DptEhiE5P4
	wwX+fw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygu0df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:01:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so100524e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030909; x=1789635709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5Z6d38tU8OKJmaSUZeG1duOaSUyg30xxQsgQVhiBsc=;
        b=bbb1eNpP1dCcOJNwl9XeQf22poG2gISkK3ey8dOYNXsgjXnP7JVhgyYrab1BPkK3T2
         nxxRNdmSzw0RiG1Cyc6TbyfgtPdeT+xTeqD2Ht8Nj7a0QkHYMTBKJPSDTXmCUj7VLf8w
         NTVOYVjdqRByl6nMxERXROmHZRFAHiCFijm4ZCbhP+ovm+66KFbYbQpzOzbk8Rp+5IWP
         WYVovnfUec9SyLNRC78PCKX2588ev47BztoIml/6aB3fGiK0LWsIbWU2fSotyFb16mYn
         cNlJepdP1I+mM8ISCNlvO5oTOdCJGlXVC023pgikXvphLICh0EvSb3H2LD4wbU5VfK1n
         7ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030909; x=1789635709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5Z6d38tU8OKJmaSUZeG1duOaSUyg30xxQsgQVhiBsc=;
        b=ZuBKVj5KQyuAYVKuxCqSHwKF+UoChMXQTwXfxM+s8EJkPnML2JyNCIXzu/QyyauRwK
         Oq3G8etUMwzZNQBzA2yxmjn/YL6RAsWem/e9ScsAw6yA2k7bX53TgH/+Db2R7gqdzjkn
         zErOrM/kGO7O00Dkuii45Jn8tce03fC01d5i7tnGeWRyBuoC6IZAyGXnD2HdX1sunftt
         2eII1LB2huXiPn5LTdSEhqtoYXfjxXv0dWlI6KSQg5uUlGSzT7LKQK8PAK52U7U0bf2N
         E2e8hwv9u83uGIqE4YpJNeMC29FwZ+8p+rGkrarn2XCTA34AL2K5WdHVfl8EQAI33Uc+
         ZYYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4AeKvSUJ0iirg6/yyRkaW56dnGegWRsQ0ziRRvE4WOCUZrEcLBrub23TMZDh/Kl3EJ27/J8bwhhnYl5U=@vger.kernel.org
X-Gm-Message-State: AFuF++ljtPtmSjxQ09OIwogtqhe9/Q4jrBxeml27eAOIaS0DtVIVr6DH
	wtwsg16ZuN/XDemelGddi7SeliQtPJS05evWmLEDwyqdfNGlfpGhadqquy42vkCL4vzPtmvETPd
	gvB8o48FzeG6Qw36S6uQBKKPRPephRTjHslb5lsmM8DC2Yxf7aQhSCr4J1WwIPz++cTg1KvMSNy
	o=
X-Gm-Gg: AYBFou0z9edpfmpvuZl70Vf661LkPPK8itFQKRVLdg6zPKGqfrPGm0eunIenMe8Xnqp
	gAALcjTgdnI7vzvcUF0xbJZFw5FNT1VCPEYtKwTg7w+j6lqY/H4Sd37IP4QmX5Ye8tnaIDFfPob
	JO0dR4WFJwu8BY8OP27lC+sgQxkdd3/cMIk+Tlla6F41avQfD/XYteCjJr6zp6cSdGh3UMAQ/j8
	w3VLeqDEFxp2BscAOuKrfnXmb3hKpciYp0ngJWkcb8AdShLU9EP490zaWja+Tg2sVKlUN2NfwgT
	wL19KdjR4+/ev9yN6eajcoVZCsjJX6W10SBU782jJB9sgLhRsMF5bFrpGugzuHyIYaJMrwREV+9
	kkgzFSOmrYQUv/KSzqQXctQ==
X-Received: by 2002:ac5:ca82:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c837d72012mr857523e0c.1.1789030908992;
        Thu, 10 Sep 2026 02:01:48 -0700 (PDT)
X-Received: by 2002:ac5:ca82:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c837d72012mr857484e0c.1.1789030908607;
        Thu, 10 Sep 2026 02:01:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5bd618sm931616566b.56.2026.09.10.02.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:01:46 -0700 (PDT)
Message-ID: <2d411e9c-709f-401d-9c94-3ed6a01fae35@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMSBTYWx0ZWRfX6MrSOCv+bJLQ
 c8x+71sXewXubV94y4LHxwfmtcLra4ltFLCYOjEySOIJ2tKLJphb+LbuXQezi2LdEeE5QBdCQpP
 FyGEwyM5jva4feR4xNcPudYvSs67c5bn21kJRJIPJWjcCn5hrY2Zy8FOI1dtl5StrUlTXoORIFr
 LcjCmElAk1dArQliPo6bzH9S9X5hHQiiufEQPinMTNorZ1dxakrwFGDzQZOPAXrJDaHGT7GZWIK
 DqOkyRy5QD2QJidhVA4O+191JYBTlLuiS4QmM02a59d0M30TbLsgui/IUvE4FOGIv7aADTE2jwf
 pjmcCkZWvMKczYoq8rNrGOHT73S0b+8w8XnPOOrNlXnuJJGko/nzdXDvFQ6PZrECyRrQ2+kwXj0
 wUHoc2uswSAElPxSD5FmOxyRj86aT4Ci3cX0qvcO6csmr20NaemcZUUUubgP9BYChUIozDNYrsL
 CCHIl2rKgdRNLl1XtGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMSBTYWx0ZWRfXycJj8K6lhdfC
 dSeqE5I/lBZG05/vspmUqFj8Ol9b0teJNeXH+PunEe+6wO1mplmJIuP+HN9lruJCdvnWOv9Zl7S
 idKQXoTDm6Ndno2/Vpx9bSEXVF4qjDc=
X-Proofpoint-ORIG-GUID: wmObLVDySubzRJuurvR4RzLltIAQ6NsG
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa271fe cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=exiYq_Pg9npSqJlfruUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: wmObLVDySubzRJuurvR4RzLltIAQ6NsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100101

On 9/10/26 10:53 AM, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> Update the read request message accordingly on RSC v4.5 and higher.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c4542318eac4..f84a399fa5dc 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -86,6 +86,7 @@ enum {
>  #define TCS_AMC_MODE_TRIGGER		BIT(24)
>  
>  /* TCS CMD register bit mask */
> +#define CMD_MSGID_LEN_READ_v4_5		4
>  #define CMD_MSGID_LEN			8
>  #define CMD_MSGID_RESP_REQ		BIT(8)
>  #define CMD_MSGID_WRITE			BIT(16)
> @@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  			       const struct tcs_request *msg)
>  {
>  	u32 msgid;
> -	u32 cmd_msgid = CMD_MSGID_LEN;
> +	u32 cmd_msgid = 0;
>  	u32 cmd_enable = 0;
>  	struct tcs_cmd *cmd;
>  	int i, j;
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {

checking for the negative first is odd.. it's existing art, but
let's invert that for readability

> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> +	} else {
> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)

This check will fail for e.g. v5.0

(major == 4 && minor >= 5) || major >= 5

Konrad
