Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634967;
	b=vB5I8aE8DhhIiyXFeyJWAO/eZkTt7gyQ0jJ2mOCbUaukps+Sl97iu4/1cKBKwHsDnYdu
	 cLOZMNuFX76nSD1Yobj+YEasQH3UPYeJGHB4P3VPdci/KLSZFOTSnjx615v6JJ8Ijo66Z
	 NlDn5cngtfoV4idknQVKCjU9T0ZfuH8D2YcEPFiNnkEQUXrCVAz0JYXJIrWq1u45kY7HI
	 LcLZPxvOE0fHw9CcmeKzOY9ZPXCvXnYXbpzTfUqT0qyH5qzORRkXIkkix+D9mTNjevI1c
	 ojDJYlNrss5Cl12RiMUW8VfPZ+GHK8xg6AJC2VIqgfwO+ZYkRiUkNz5lKngEiWGPFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
	b=c6zCOxoqFgCUfcm42UtkZWtlP0ayhEL8sdxsr+f2kODvSfOIwWLurfgSvKq3gLzN8E+S
	 vNWc67oWiXAlB/EYtnpPYsJ4ZYTokn9UkDYCUt56uNenwhgKK9e/Ibrxu2iEdh0i0XgoS
	 1WbDhrk01UpCczrwi732qYB3XmwKhegEpSbw4ivGNoCylutvdqCWADQsyXob+Q2oc6Tiz
	 zaTvFn/50LIPv7J/Hi4bfKMm7XH02+QJ/KRGM1UdgbADhNNmQ6OhBegRDTAZBsuOyI6Xj
	 prfjGFmjsjkaqfsnXKBblPxXnbwpz5luZe25EM5+MnhZihJiapC+myv7uaI9WaV0zJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSBwzCge;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL6DujIh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0076074A63
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0076074A63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSBwzCge;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iL6DujIh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpJX74061987
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=; b=iSBwzCge8h1I9C/2
	mrtF1j3oXAafP4JBKC5JOzQQ+ebIiG0L+/LKUQs3DTTjht6AWWhk2AuTicTvJTnx
	BDdrj5Jig4ei+KTBtDyQVXFppbmW4hpiZ1DROxFsrZjesEOqY6vaj8V9AetMWXrR
	E8zTgPLuS4ZYy0aDvL/pjzrKh75cXhpJl4vgKXhrIlYbsDe3CNMdcFhM7Sf18bb6
	bwIN5o2/vr5+bNpWlXbzQYxrhh1lrh90zcfdYzBGxUH+zCtqj0aaM5rg1K5k8hlm
	BiqU02wWV/ya+dhLKvwIwj83JBg98Rg4dK04A9L1n1wTTN/rJ8SI22/FfrxDybSN
	Ovti6w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmet5tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:56:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so110718e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634965; x=1794239765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
        b=iL6DujIh4EUQvimIA2xb2KNqfzPir7gWfElq0Vw3zDhXzU3aXzQcZ+//DaKpkLbK88
         U3K8KE87uv0B4W9CTo0M8UO9CaxgOXmqPjOKkBV27xNAYJvtqWOQIPgb6QrC9A5B3pgx
         arDPQmm209KkXdcLt5OQvQVLIMyHrxEyEWiE0Z8cTXfM3mOWr/5RrK/+BtjYx4wgua7q
         nVcGgSNFMn1Fw0X3lWWTSpl1Er5ZIGECFdSLM8/YVUwPb1Yl5L151HSglGyUAtHseMaL
         2pdBddM/VSbAEVG0a8hguNsalO22jajkck5KTlaMn18FYOpNe2EoThFoYCVXpvwthJUm
         /lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634965; x=1794239765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYqCyrgOLHcS2PoZCZThkyVwoRz4NupYbKjbttodPvk=;
        b=lYI8DkFpnSDnCaJ/VuDnyueptu1fNt+zB9dXJXodj+bOkUVv67yEJwdEVjsd+OAeLa
         uJZ+XQOdqqaf+xnavfLZCb7Rj/EIahWgINlBZfJYuwn1UYs/mc5Vkq3BkfEPHSs+rIfy
         6NrRqx3vc4A22eHS92B5WZhaJp+/frNBa7bUpZEC+h32F1ot/MkbpRyrosm7woqB6PZD
         aUvCRHdDOpvLhXzKRSV65Wz5u/C8GsmTmGzRTiORiOltaNLe/3OQKzCEOg9R/id+BvYA
         +wE+hEaRC3orR8SE3NARVLozU68wtZL6LRTOTCyVUw09C73zY2omRZVHmh0c0xfMiuFv
         7j6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwISFBbMSTbW3XnFtNKqH8ntMr2xKxSwwKCDjebLVLEmWdsGxP3HE2kaPe0tYjLr5rjVbr/R2dWFBfTx34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hVnNU5V2ChrN/T6wHLN/f3t6YmuhbBFrNj2kL+NXOnLIqaoDo
	ueIN6uC99nIW3xbRrz7vGqBStAT9m90Bq+LbLvn7QgpZF+MNYismKyrGsYpZ4G/m/yFyAAoyXBo
	BkaurT9ZLV24k3F/Z+5aNU3fdpFnRGXRA56na2UjcReUzX8ihz2IkEMfzeyp8yTtmHQw=
X-Gm-Gg: AYBFou3NPo7wnBRzim2SDGCy08b4mnT++fsKk9UhaJHwcEzr+kCPgBeqSG+9XvWQNYw
	tzkR6xWHMy71CGF/DWY4gIDkmkqQOfAoNaVL3v7CvVyIpifmdSbbBRiprOZpaJ5Ej6hT73H+BGO
	D7BmrmrwBLa098VjLTdUbl/meGrCgEqEYi7iUntvqfMk4Emintem95YgmeadWzoFDt1oDtfqN63
	bmze8fChzDaTh/RonKuYLGlGFOW3yIGg5A19q8i+mumBv/K/wnM/E0Mi/umtYhs+d7EjRYxWWVn
	O8ljMIin8Sor8OKtTkbBBbsSK2Nzp8XNixTA93qTu2v/eiYMUlcLz5l7EVfr1r79S2J6rT0AV/x
	AkyuKBwY5xqUelfmcA6VzO4eZA2wxfQUpdpoO5pxFwZNjnLtdNJUSwEUvAvYazUy79MuLqA==
X-Received: by 2002:a05:6122:520f:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec6828c42bmr5181669e0c.0.1793634965094;
        Mon, 02 Nov 2026 07:56:05 -0800 (PST)
X-Received: by 2002:a05:6122:520f:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec6828c42bmr5181659e0c.0.1793634964356;
        Mon, 02 Nov 2026 07:56:04 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebefcdfasm3479566b.36.2026.11.02.07.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:56:03 -0800 (PST)
Message-ID: <d4c11aa2-637f-4936-91d5-81b9d00aff0f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:56:01 +0100
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
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
 <989045f1-c4c3-4871-92b5-dc9f2a18f801@oss.qualcomm.com>
 <179189473286.2132802.7434637844183959510.b4-reply@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179189473286.2132802.7434637844183959510.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8b296 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ydoro5LrJAMts5ZGCqMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6not845izkyN
 wPxsYH4OZQGNiTAqO6vHEu1JnihZrvYXOk/LAJnz2CGtYeoWUBtlFW9jtIriRPyCY2VMagdLl4l
 nxn+s2ZJJtyqo6nXRKSXoc9O7gZ8VKIMxfS5TWMv2uFWRjTHQQAnCSZPl7sHWZP1fkvLZWdoV9Z
 G9KEzNDLNYkUatjAxUNdDzYsesmHnN2FktAwQ/p7L4941Fnnog9rU9C37ppl7PCFAbFLKdaUoF4
 gLIl/s4Jz1Awy5JZeiib905ZUrMjUN2u0Q4K6xj5DU04LAqrx7mnxvtChEDHsvx/8mOFS6P1A8C
 hFMaG7jijJef4LLwywkwCII2bwsyZSCCGpDvN5lNChFVl956R+w9gwV0y5WaVoVyMp37GT+7n95
 DWHNjxQHEJdJ6+o/UegTFoDMcEPDjTRQw1FExVHfWwm2gsepRjuIjTBrEl1Fx0/oFD2knvRWpLX
 ZfW+Qr+GxFscHq4CL3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6jIZQ9Ga1e4g
 T17SwpNrHieVZhPyAfbjmosIg7kc5MjZSRnXIHY6d5zTK9H1gO1mmEbk1O1qVUKW6qH95oWND2a
 F99Nwk0GJQizYo/RCLEXHXZ0PeMOfps=
X-Proofpoint-ORIG-GUID: ECXm3uXvZePW6u_6d_yOIqvbJjritKlH
X-Proofpoint-GUID: ECXm3uXvZePW6u_6d_yOIqvbJjritKlH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020063

On 10/13/26 2:32 PM, Sivansh Gupta wrote:
> On 2026-09-30 11:55 +0200, Konrad Dybcio wrote:
>> On 9/28/26 7:29 AM, Sivansh Gupta wrote:
>>> Mailbox hardware registers are 64 bit wide, but the interrupt handler
>>> currently reads only 32 bits with readl() at offset 0x4 (upper 32
>>> bits). This returns an incorrect value, while reading using readq()
>>> returns the expected value.
>>>
>>> Use readq() to access the 64 bit register and pass the expected value
>>> to the mailbox client.
>>>
>>> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
>>> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
>>> ---
>>> v3:
>>> - Removed references to an out of tree driver to focus on the incorrect
>>>   value returned by readl()
>>>   https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
>>>
>>> v2:
>>> - Expanded the commit message to explain why this change is required.
>>>
>>>  drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
>>> index 862e45e8fbd5..0b584d9aad6c 100644
>>> --- a/drivers/mailbox/qcom-cpucp-mbox.c
>>> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
>>> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>>>  	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>>>  
>>>  	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
>>> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
>>
>> This still retains the writel() later on
> 
> This is intentional, currently the existing mbox client(s) assume 32 bits
> writes instead of 64 bits, changing to 64 bits here would require all
> mbox clients to be updated to send 64 bits.
> Currently there is only 1 upstream client (arm_scmi).
> 
>>> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>>
>> This will alter the indices of the mailbox channels, but it's ""fine""
>> because it's always zero for the existing platforms..
>>
>> Konrad
> 
> I am unsure what you mean here. The channel registers are spaced 8 bytes
> apart. In the old code, we used to read each channel's upper 32 bits
> (channel base + 4 bytes), in the new code we will be reading the entire
> 8 bytes.
> If this is not what you meant, please let me know!

You're right, please remove the leftover define

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
