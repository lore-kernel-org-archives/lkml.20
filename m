Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230487;
	b=a+O/ZJvNS9ydjOXxUtP2N3EeF5wWQIPjF21IS5tXDi/byjn66dUR+rGIP6P6q+zxEr5K
	 bvZtHwyPkwiI1TD2W9u5asOSzWEeCTtDBgy2cHTEP9tRnu0jQTXfMPe8U4D/hvhjQ+l5R
	 jNAvMRousmqn2z1aVDLLYcbeiK4BMhBgtAQkKoJWp6zunHe78bJgBR+2cyyhaEkV7bmly
	 CTXVaQLge58XbEKt4jFZd+q1mQiryPFdaW9kGyJu+5hIX8eTb9OzY7VjCRIDkgQyaQXAD
	 h3GUIHlbEZIkgLXi3npH8YdNXmzqTOhcH9lwNQRLANA0neEtJhWt4w//zmBooeTGJlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/NSerIK26JDI0Rl094/CDPF+220aUgaJX4IbYbyMv+k=;
	b=CICeSnNCljXsVkUNzrGE7tSj5/GMhe+XZI0HjJRJUOqknv3jvWz5rYYleGPMNbjtZl7t
	 NhqFNkmYz0jHXryC6lnFMtYXzssohIEpLYn91QJx0EiT3j2YgeuQQdgR1P+ntS7UoXeL0
	 SJwDDlQ/nLLfU5GmBoowawT7lPs9IcRI38+YahqLTI/qnc14x9AyV6nzeUtHFHrOf3PLn
	 jekWIll8TjOMCZT0AZk1PiS08DOPj05oVDQmrntUZAystk1s04BJr4bKgu72ZfFJEpbLn
	 OZl0FZ2IZZgIvrm6Anp9a34Ag0iBJEcRBzr2DXjMbNz3pfXP1DNgDeXHAHC/T9Tk+MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkJMqqVm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2zD6PjI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18886606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18886606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hkJMqqVm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2zD6PjI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF6J43461055
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NSerIK26JDI0Rl094/CDPF+220aUgaJX4IbYbyMv+k=; b=hkJMqqVmmtkUGTb9
	KAsWQ9W7l6lXLkPOF6/KtZHHkva9eAlkhTzfA5GglsKQ9S0LzwXLDICUDT7bSy2W
	gzFWKj6K6dytefVXA351q9gAUaUoEvA1PsOl8pJFn9cL2THl37bNMsdx8F4b8U+M
	OKkqg0rcHyZJGngjqwXQ8PgOoh1TCZkB8Cj3lFhvqe1TD9wqlh0ZEn7uZHeAxRy+
	99s7N3K3AaAjNy5LkjP+Z5Gp0etbncYnxm6nEzU2TO76tn1kIina3KdcsOQk3BRK
	FvdlAW+VprRN2b7RIHEc9SXIBX0uc7UlPXFInMw4w6lSbsZJcDchIkDjJXgW6Zi+
	dqHT/w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr7q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:21:24 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f957990edaso116169b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794230484; x=1794835284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NSerIK26JDI0Rl094/CDPF+220aUgaJX4IbYbyMv+k=;
        b=E2zD6PjIe3rc2o4+u16yBnbJ6Jfqm+Z6gFxdqii4HcORQ9KoHQiQs/PzwPgBYgum57
         rsp0BhBl5Qr06C89A7VCI5HlEdahi5dk0EEtnpAXeE3D8jhxJRWqxOWLfcaD9NzJ7OC3
         4ab5d94Rn97gMIzadwO2slxS/to8jUrldI78XGiwYoMOC+hE3fO8NV7sIxgzJGgAIpew
         Ri2cosou17OZCnGBljppNOEyIOLuBxJse0ybz6ICcA8vesi8TVHo8ojWrsglPum4DTxq
         6Uztj5y+/kwKEJEMYye8Ax56LmrV1NosKBK96Byu+1VinU4y8vJd9qXibrCHuj3rY75k
         GO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230484; x=1794835284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NSerIK26JDI0Rl094/CDPF+220aUgaJX4IbYbyMv+k=;
        b=gkwB6QuyYN6PAr0nW+IJLzL1EzMkmaHwcPVOj93+QfjJoUJMdUBs1Ed9dvj6oSg41M
         wNfC3Nxp6r53YplzXutOr3QbcBlOz9y8gi45pnROjsstseIPjcjGZXtO7LSWKKEoMBq8
         iFFpUkQEJPMvZNniiN2CmHk+mdQhfI6C6sIAom9bHu/HwJI2hVAxJ1eVVYM1HR79Za4K
         xMDL1OklJgfH1mghPnhdexQTevsB1V0E/wMbCa0QY+uj+jDJiGmzAEHjbOHxV8xgbkBQ
         pnzYvDLJMGCQR2AiWJ6fr8w0oe7SSrt5vbPP3DVdRNUQ8zeYuLcBzTStU0PNnd/nKMp4
         XT4A==
X-Forwarded-Encrypted: i=1; AL+hErFiRud9xh9PHh9L8DSMSsTVlGDJoJ2PSyC6zYA9YMDifYJUuBxxddlQieUsfFyVbkWxv9rpj4ac8EGiz44=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QzLOHHU/05faczJfe0tlHUnNjA6kvDeR3eVupfDFT76ivtUFv
	9/09o915F8aOUcrcs5YA510PrfZhsqOfz/Cc2nKogWM7igzNnisbjQ0KLuh1fLi+yfTgQWgGKqq
	765ugUFGEt3BCstkTJFwiTvFtkYqptemuGbwm8gdeV3LOV5BuUYoryQZEh2nVs1LzTC8=
X-Gm-Gg: AYBFou3v2LpU3dWhpMeZDFzwi+sxbJVi96UUIk9NY+VnIL0TgR1iX+5bycuc192LHMj
	gYdPaF0tXIOzc5mXBbz0eh/MugqhVzXs8YFOqjMNQ7emzsR2iWj7sdmdPut3kLQF+SWBO8Lj1i6
	BswoJOzAggohI1LeMZEBZYtDj4C4amnrXH3kMummHoGm+uZHXT6t+Tt9Z/0tK0zbZAt+M1b8BdS
	gvx3kSQvrg4IZUWrFpFa2w1BOPGWTniDyVapbhS3oDxr0vd87afKJzQPNeOvO/Hm7Nn9zUZZXFR
	aqEF4qEB0y+iUAU3sQgSXe2YLx4TrshqYeu41xxAipbLXVdIC+Gn2VgnjClKcfVecuiZQsbNnbT
	Ry/K3tcmimePIf7QKKRVrheS6V/l1xWjDG1Q53WVZNsLlYT5fuRzt4oEOvGdBYly9WaS/6Cdkvg
	S7blHKzucoh1It0rd7QNhliT5xuedQawCNcNA3ig==
X-Received: by 2002:a05:6808:151f:b0:55c:836:5991 with SMTP id 5614622812f47-568145d16dbmr3514866b6e.3.1794230484139;
        Mon, 09 Nov 2026 05:21:24 -0800 (PST)
X-Received: by 2002:a05:6808:151f:b0:55c:836:5991 with SMTP id 5614622812f47-568145d16dbmr3514829b6e.3.1794230483624;
        Mon, 09 Nov 2026 05:21:23 -0800 (PST)
Received: from [10.249.17.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm16424052c88.6.2026.11.09.05.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:21:23 -0800 (PST)
Message-ID: <b83e0172-2f64-4e28-9750-1a5fb3dd6b41@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 21:21:20 +0800
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
Subject: Re: [PATCH] Bluetooth: btusb: Use DECLARE_FLEX_ARRAY() for memdump
 segment data
To: Hex Lindqvist <hex@freenixos.com>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261108042008.226295-1-hex@freenixos.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20261108042008.226295-1-hex@freenixos.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zFki4buSNSjXgrHxkG5d_mY9GAPBRY4S
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c8d4 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=1yMu0EPtAAAA:8 a=R9AuS3ga4yR-WR3Dk5QA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=SEfTHXpE1d58HhVYHZyM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX+gEOocxUQbof
 jw0eK+uJf7R+aT+cokEASxNVdeyox4k0d2EEIThHBCOkMEiEEEdH4ewbQTi/8tANGGsIWgnIw12
 fnRuc3u2XPK01yfJwkVQzplPd6NLrmQK9UoRgH7lDzRVAbboqmBGb2WyWIejmFx2S7sPp5ZHP31
 ovLrQWrAZrR+0rP9t6l8NRC/WRuiuzoyZx1EwiVjhIL4qwIGKUHgFXemTJdpBaiim4eabr/B4ZN
 aafgxcx8g2csv48YFHWYwGHG3eUv7oW64VTMmppOvDZQBJkdRQluVtEyqyKkQZpLJva3FkbJd+s
 ySh3lW3jRInalDty0FxoKteueSL8ydqeLPQzFRwtN2eyQNeJxp0zhiEdBDxVJ6TclL6PHUfhwsV
 5Sa5rOYW9JHS6S5plsxw+jwuHiM6RvLhBY2Rnku2jAWtZF4b71kBO4+Q0K7xRjA+QHCd2kb+SZG
 +CFiUTTe7nnkjkp1mvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX8+7dM4rUGnY3
 TNQoLYgs5AucFMLCjzY1FH/JnMyKFjHR8POEGSskbrLrWYIxDA9L6Uu4ZmodwDepqgNOs2vQr00
 qmlZObQ56mdBVXITXJ06/Fl+zGA3Mic=
X-Proofpoint-ORIG-GUID: zFki4buSNSjXgrHxkG5d_mY9GAPBRY4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/8/2026 12:20 PM, Hex Lindqvist wrote:
> struct qhci_vse_memdump declares segdata as a zero-length array in a
> union. Zero-length arrays are deprecated [1], so use DECLARE_FLEX_ARRAY()
> instead.
> 
> No functional change: segdata is only used with offsetof(). With debug
> info stripped, btusb.o is byte-for-byte identical before and after,
> built with GCC 16 and Clang 21 on x86_64 and GCC 16 on arm64, with
> UBSAN_BOUNDS and FORTIFY_SOURCE enabled.
> 
> An AI assistant helped find and check this change and drafted this
> message.
> 
> Link: https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Signed-off-by: Hex Lindqvist <hex@freenixos.com>
> ---
>  drivers/bluetooth/btusb_qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btusb_qcom.c b/drivers/bluetooth/btusb_qcom.c
> index cc4cfcde2afa..97be9078e045 100644
> --- a/drivers/bluetooth/btusb_qcom.c
> +++ b/drivers/bluetooth/btusb_qcom.c
> @@ -533,7 +533,7 @@ struct qhci_vse_memdump {
>  	__le16 seqno;
>  	u8     subsys;
>  	union {
> -		u8 segdata[0];
> +		DECLARE_FLEX_ARRAY(u8, segdata);
>  		struct {
>  			__le32 dump_size;
>  			u8 first_segdata[];

NAK. Please keep this as-is. since:

1) segdata[0] is a familiar GNU C idiom and, since it is only used as an offsetof() anchor, is more straightforward than the
  DECLARE_FLEX_ARRAY() expansion.

2) I guess this kind of isolated cleanup may not be welcome.As noted in Documentation/process/maintainer-netdev.rst, simple cleanups outside
   the context of other work are discouraged
