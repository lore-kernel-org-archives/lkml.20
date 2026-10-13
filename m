Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DC513557
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902476; cv=none; b=J2seIj+3JUil2Z293llZlmWuuNscOm7brBL6vkdDQ52tflYQc8FC8zGreKBokB8jEi4ALnloMzwIDYYZvwPlK2xRF9lzWIb0SxvfJRirEoFoT3uFm7M8s4mMLD2kVyods1TMPUmXG2lKWvcjTvwGM84pKFHThUGSjsY+TtHm98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902476; c=relaxed/simple;
	bh=zstXjsOXIwstycTOYzDT8KSr1poySZmNcn2ehdXPKFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfhODYOojVA4XpWtJaA60KBN/40D8M7gFUurGrGElUoTcva80XILosod+KVeeiLJ9/8t6vyhghRcyfRhDeogKGDE5jGzl6nfeqNa0kf81gGeTkb677+hc50HRyi7y12qu16Luf3ytNSB8VcN3NS1uzy94o6s7zD8+QhM0ojSr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfCgGIqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXaw8CJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfCgGIqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXaw8CJU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3UIX442768
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=; b=WfCgGIqy/maVaLuk
	K+vouDRW1v9tMEfYrkPB+I/kWR7Q9BYt9SVbfkjM19sbeHIXNrS2+HZcTpKx5KG3
	D4zCupspt2Iei4NMdjTPwqBrl//PK2zOGwkT4R6ddwXYbba7saBWNNVfqKpbre6F
	EvYs13flzNBn54VKFxY8Xe2LKFi+9auLbfv8iJfQuvd2pVIOE2uqnDsLR9QT/y9i
	jsmY8LE7Uu52L/pqY133bnyk2DnmR3UYYZ6lhWIaNRrK2LZincN2aKTjZr046q2A
	eQ2C7AePC0sEI6N8tYujeF/dBFhB0nXawtf8+GzJMwv36lV3Dgvs29CUcBy2xhMj
	K9jjCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71getb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:41:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so41653285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902473; x=1792507273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=TXaw8CJUHTBlCh4kf4ljprrLXlrCdanA8PhzSKkwlOeI+xOlCgkl3YjlEDFmCivlpj
         +q1MKpEwTZRVsO3/f7dIn55g4Rh8D4hCRCMrn13Ha69Y+zVuDR5/OcoyLV+uvabXr/3m
         MrPG5DSqwCvI5uejznmxSUvM5YJyCbTTvsCuEMqdWMRVHqtz7E0enY68UvdJMLb66n55
         rdLfxADlL6gehvKliHPis7tn3Ta+Mak3KtOhMox6bKiabGmraiddoPbnEGBvIE6UUUD8
         Nz4Pg5izlaRlsO7GUMl2gGymDyfGRWAYw8cGZEF/3ZaNeQLLjQfI/Pt7rSPuQmcFIW04
         c8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902473; x=1792507273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=sxXzBZdHkCnbiVk/QpjQBD7VplJKpUmOgRKzKir/mEc2JN2tpaF+FOvLjABc3dHxRS
         NJ/sPWpFdEV1LT2wvMxWbOqty03liOIo/fjIsS+U8E/iNbcD7NL1yJHY6DPEcEpp7+xi
         IuVTKvN4kLLIdpragFkdZ4QPUVUefHnV8NEisRw0PEEZPpI+4d1GA5jfmXvyskp3uIMk
         o392jjYOFlwaR5C0oEoxN2T5OsbvdpHnSFxX2GBewy81KideMJgqxHR3udvr7MbJv+fE
         9KCiXIsjQMjJfvLtBIWAam9bSKS/AiVBIHV90cq8cnQp0KHshT/I3vAGjVebqUTqaPFX
         B8pA==
X-Forwarded-Encrypted: i=1; AKwUvBwqHzZn4Ho4EsE07ZI0ukyLB803TV+3BaGyrHz5gJM7Y55jZFYq8I1h1HFwTN7aWTkV41ahadyr9lnfwCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfu9mvXMs9/o/nH/QBHwZUIN1Q+zSA+HQcLvigEGn+qHOiPWtQ
	F750lVy5TKUzb0oBn9P9EBKZERnYccvTsgiJYKu/arzPqjIeGVRa1ToYZzGoGbu1qs4umOrCkQE
	N6QSSHyN1v0ztI6wxVr9VBeX63byZ6D2JLEkTOP+HIBwdAtZLC0VrelFc4tSscukmQfY=
X-Gm-Gg: AYBFou3FmB+85IT0elhQKu6PApHH+0s4rUStMb2moD7D4PQSpgd+oTQzgKCFStjMlnm
	NzY0S61VXaijDWqzP1xANTKQQxIjlAHizpgeUW6MIqH0kS9W6f+7MZthvoySOoHlRqUmZ/NSzbw
	f6hFQsP3xOLNFkTDip5/Pe+Z6as9Pu1SGlJfYJjcLFyrhzYdg4LcxwpGeyYD3ADFl+84vV6MxX4
	uZGXMBZeSEA176C2EUnyaCH/60u+ANPJHplPAmONn5GcKfBo1igrzNwWu7N9nif5FiN/s1ZzbfT
	zKB6PXrYjnIW/kqHsW4ImMP7i0YzUGgyTZyZGWYDEGCjF+BGgj0qbo4gosbjuIEci/Wdozv319S
	5k0DUDyuDgUtSN0Z59o/4Nw==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191020685a.2.1791902473215;
        Tue, 13 Oct 2026 07:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191014885a.2.1791902472688;
        Tue, 13 Oct 2026 07:41:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1923980a12.25.2026.10.13.07.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:41:11 -0700 (PDT)
Message-ID: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace4309 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xRnL3yBE-CjZ_xjtVVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dk6Mx7c_0NqZDQNrd2vAWal4QRBgEpE9
X-Proofpoint-ORIG-GUID: dk6Mx7c_0NqZDQNrd2vAWal4QRBgEpE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX6FVfNeCIfq9O
 ooFp3T4VqfUkjLaCUx7CZmag8Zeg1HMx76gD603qyvQpBuP8g7QK8Vg8frinvkh50JJkCvsOyIh
 rtfwKYjQjhi8z4v7IusASUlx+0J3doWV+6ddBiR2yJfTmW+oMZ3UpUwSGHcrAIreVulWBghTK36
 ce1VMDoGa2aHI+h+72rAA+/hrP00YWoqZ/3DwfrpabmP0BajM8NCAR/Za2tQWdZsh1W13zVAGfw
 awpNqw+8MSdwE8kUUQGuNrSUuFbz0gfnh5QBGEgPsKNSGkDq4R4vtXzMrG7B9j4h8Jj6rcveohv
 0vkJC97RR0q7ZfR0NxpUni+emSyJjZRf26hK+HtP/sGguEuK0AsZo4akGzBDc2zPCX9DYVReyrQ
 J7pP/fDOYyL4L+J7mcaoZeBcygIQ63TFxOQRHhvBclfY+ZTrjuAwbE/I0lJiPSd8PlvFp/m13FT
 xvMMl5tilD/7pef8cgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX18JaJIarFXJT
 r4Ej4srXPiQ+zywzCCqkZ4XFKGWuVHl6dKklj5LjfqCt64Y/v3J5TICPl146qYrD5pctEF+m7Za
 pKgpsjEXprQwV2Gf9KPIFaLbuErwFCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130058

On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>> share the GPIOs. The board has to be reworked to change from EMMC
>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>> and include it in variant specific DTS file.
>>
>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>
>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>> ---
>>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>   2 files changed, 211 insertions(+), 64 deletions(-)
> 
> [...]
> 
>> +
>> +&qpic_bam {
>> +    status = "okay";
>> +};
> 
> NAND is the only consumer of this BAM. Should we move it to NAND DTS?

Can we enable it by default? (i.e. is there any reason not to?)

Konrad
