Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796138;
	b=ENjrOs9JD23Us9VrKwOKT8DDikBXUG5iKH8AZ5NB11b3W5Ua3e6oS6+qJCMe8M3Zn2Dt
	 nHPgbR96Hj7cXW6WOy4IaZNquyg30ABmUszwoBHt8+M183Cfu2U4CoAwY2qNPlLKummn4
	 yXW4HshLSGfhrjU/tiIicMKf44plZ7+01GGEbtHmBP5crAyq93aEE7J4g1+4IaU7tZEUL
	 YcXnLk9eZk1eK+TyoawF5zw3XFjbhCP2CjIx3gMx+ZDY/jnlYq8NqmWwlZYi0cTNwmOp6
	 thGAJuk6md85Yd1fmt+1x53oCqc+oddh4v9TYCoubai5gmbXXt28Z7IOOJ3j2iEvGwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
	b=fIb4jUvsl7qlKOex3wwiOO59/0Ko3bq4LFFyzcsFswjL5RdZcMcDHZY71UZ3qfxgdQDW
	 qubS6XMrBrjg2iAAF4sinhAKaYwdswAURKT/X0LAn+OhAC9VXp6IGkdM118Imwn2nngmB
	 EL/MmQc6u6gEpzb15XMYciOuQn9RDLRYMeDQIoiboV01GaN5VWUTCvXP/GcoFzwKxCcMC
	 zB94ARbYbKXePpbM/7iCjNCUWo4unk0Zs8b4jisOBQ3AbYE0m859FZfxKgnm11ZXeN/P3
	 YESndZTRxkxWLfedk3tbza/tALuROP8icVTKYFgu+tI/VPkSXn5rzlRLO0e7lL8me/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED01E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiT1E2wl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fG0FhS9J
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba2Ch2310248
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=; b=UiT1E2wlC4LPns21
	26JaTaMG0ZJ88knZvaPJ1cjuUkiOUawIQ7KxFarPy69PPOKkCaXNAQlE0u7DIQuS
	UpVXFrJDfRDK5nJBxe7V+mme0U2o+LPtytdGCG+LAH7QTc4zoYX1d7oo0I0D2bl5
	EHt5jm4z9yNyAhMQiXS2NJ3sqcM2etlzI7kbRdUkgS6rJdz6+JFds1f/FtcOCTP8
	He4yS2TmDqblmBUI8hJhQ4PZCWVZitBT8Rv4QTidQwZj39euTYfhwYMazKwhe02E
	DPFkeAGSu7BlGqeJsN5H7bJMI6W7TnILGDT/OteKDH3uGvxZYGgBPIDxEsccreDh
	u5MkAw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8muvjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:42:16 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-844bc76180bso710163a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796136; x=1794400936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=fG0FhS9JQn+BozO3evXFHnriArZEZZkC5l7152CZW2R27fK7q5pwkldr5KIXaccyxZ
         ktUvXU1x5GvctESAKnjb+WPO+l5rQEK8psMAsnDUFoAUZDIBA6tbK3Pw3nvW2ChPZO1G
         H5+SQU0EhZ9jZIcwwz+z5pHzfI9M4SzSilzDtoL+4hFPKLge5rwk/if9X8GUntqzkwVS
         Hq231NGU1Xr2+GoLRSa2ebBpFkWdIf3H77vasOjnxVfjytBdsXTYH/Art2wUuAnIKvh0
         o2ILH8JpqXx6bPS0EcOHq3/OkLJfox24t5oddyblrnzUW+ksp4cdL0lrUQeAjXqdEv68
         6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796136; x=1794400936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn0+1ocYLLGWHtUKY+oUvVlgS3nw9sVblusFHim9GqA=;
        b=W2I7V+1ebAR6MKeAvHR5l22cTldKU673JyjSjz7WzmWXxMZ8UqFaHepqW0FBNRr+fP
         xKIrSfVfOj0zuLL17MPuvvBcryCxksnGLnEw2V1UwIW2FFdMUDnlx+iJZczH91UtueXr
         /0JT51Jr2/Es+S4vO0A/cG93o1xUPiCfMbO7sOcMzzAL9iTbCl9x9mX47TmaaTJ0eo2d
         jSWGwsL5VhxsbMvciwu8frwDmNgeuZc3pdlogOmukQPzqFiAlqga4q7m8Gx5OJDzOil8
         C7b+cGMAr6YXU14bBDksrMmetVCVSuRHjE7yk36Pa9QDS0XVt4iaNPmNReVBrkmN+x5t
         ZMsg==
X-Forwarded-Encrypted: i=1; AKwUvBylQJ03jEbr/+VkjM6q7v5pMlsdN6HoielRwxHFKYrrijn4OR30fJMHqJS6QxikevVSOl/D9Ifmk75POYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NbQAryZi58+E1mjmWbycqc1EvtR7uKwj5R+l99NLu9lmGY4wT
	pQ/O4HG7hzO6nC08diqUMmFN4tHPB5x0hMeislW60rafd8Es7ulixy0VQ2Az5B6ozjle4Q/zDIt
	BvyyY9v2QSgwj3IP+fnCmhmrZ+B/ebfAWYYQnDf/NOBuMBImnEC9f6U6ksirEAEU1szQ=
X-Gm-Gg: AYBFou2je74enI3P9WVWHYlE3FSGlOhMIIPG3UHOLB2Z6isUJqZ47lVZhm95kK/b+Gc
	fEaB/X/j+8tfiP8u5KuzsASUzfmM6S4AKkLAZ6BLUipyt/97kZYdEkIvjGZ5QEqJhZfSJvISMWx
	4LI39Lskx+m6oHJ0YfpJRM7TNIxymTPYpw7Tf0Cb6ksEA1M6VJrFn+pRn3Htm2+91Dpif9+AG6t
	4wHqIjE+lX+TycdKNIiQ2N2QTsMLJt3KyPmbPPNdjE2j1I3PvYh4r15kIqVX8bmiJk2LEvl5qy0
	ECVG4GkreEtxC30ZVuU9wA71R6C5iVZFhMuX3REO9NcewGN4R3Yw4GymWWerh5r8i+a70DWqOe9
	o/8lxyFpEZ5AQDv/DoZIefFgDdpKWwVF3Os7j17exstIyLUAyyvgT+1d0lVSqmjvLN/kc8R0siX
	vd5mvYew==
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458517eaf.63.1793796136315;
        Wed, 04 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:6820:1c99:b0:70a:6888:2288 with SMTP id 006d021491bc7-714f2a22e1emr8458498eaf.63.1793796135837;
        Wed, 04 Nov 2026 04:42:15 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm1497063eaf.13.2026.11.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:42:14 -0800 (PST)
Message-ID: <f9ff9954-8e80-470f-aedf-6dd415b0e1e4@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:12:07 +0530
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
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
 <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6b6f7287-d919-4d29-b7cb-fa94aaf4dc9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RPR5t75hXcC8QBXdY_PFsXTVdE5TVVah
X-Proofpoint-ORIG-GUID: RPR5t75hXcC8QBXdY_PFsXTVdE5TVVah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX8KuohzP6Dp3B
 1i4xcxamXAjUx2gUHj9t+ZAN9FQGQXgBdDB2NTBITziOj5Fss/JSMjsDA05Gai6r7Uj5rqZ61VB
 NsfzvqPwLN/PdOl9ZItm8z5JE6A7RT2lIcwFeXuF/5Kb+WR4FlgpVPjtzwHcK2NmYxQyQrSItl0
 eTJBpWt63txzgW/HBKYoPNObL3mFnSUkSWIeDWdrXMLx0Vp6VQBdEJxCr/73vj3hj/k0ZX6uvMa
 /u95uEok2qzbIyJX/8Ay6FQpd4qcMDNPN19SsQvTBz/3xf2mACJDxzDYlGQKrPxDMLd77ntTp/1
 O37q+W95OaEXHBqAmayce1AGiMimfkJmCzZQvGFbnCl9XRs7XTYyTV9pHS1+HebDcZ1truvLVqn
 8BYy3D1MU6+IGsXL/8Luzc1nB0zrKH1VkrlOcczCVmeAWcXagMmMHx0DAuQjVutVt/wqdD2bsG1
 pFhPr8tQkcds05FAtUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX+5glMU9VsS6s
 WTKgKMTtMsjUOvKq/JFlvyUS6lBMQC3Cy4BNC7YQfwRgrrjuMDWCc5dU/htDqV1IXag2n6I7jeu
 6fRaNIKjDOqihFWJL5uasyib2wSqS0o=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb2828 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Uwc5bU2mXagv8lUGyjYA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:23 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
>> PMIC. The BCL monitors battery voltage and current, providing hardware
>> interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> 
>>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> index 1e02578e4ee3..4809b3d8cfe2 100644
>> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
>> @@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
>>   		#address-cells = <1>;
>>   		#size-cells = <0>;
>>   
>> +		sensor@4700 {
>> +			compatible = "qcom,smb2370-bcl";
> 
> Like on Hamoa, why just one instance?

The BCL peripheral is enabled only on the first SMB2370.

Thanks,
Manaf

> 
> Konrad
> 
>> +			reg = <0x4700>;
>> +			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2370_j_e2_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2370-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

