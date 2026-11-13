Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580951;
	b=qigCaKRLDZ8H12GRImt4LbNT/9x+JfxVJwamNp9oIlgCdtdbY1zsKqbCQ/3MObL116Rv
	 HqfYllzefncVvtUxIC/JnhXKBE6cQVw5rm/nRkfELPk8r6Ct6oqU/B4Z324UACuQOSdSC
	 2VtQu1otHQTRd0GycqtokE5e3CEb/VWo2YxEv+C8aB5F74jOxgqQ9jDP+y8wR5WlYPzjh
	 iVMNF2oT95UJfpEKWD7GVwlklG1EvH0JPiLp1AOmHHStl/7ROM9xDFesoDshbad7XptEj
	 7U1HqvIPiPPBsrnQT6nQlem5sIxDi8rHHVaNqXBJuCLE+4bcZv167vHPYvNvGWQ1B6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
	b=GJ2rREPQ64rAlE1+VwIVEmDEpWjI1q2ZS2PjYr0qy6DVeOZjOpAw11YqKMCg0lPY+Utc
	 Qnm6juOj495g9CjW+BP0EP6TfwX86lsGxU7m+6DNByR0JMD0pYSOT+F48VYdUwCXOODt+
	 hjGnoYIxNsvRAHAq1OcMrFfKARDpqvH7i7QAbLzDc8krCCkmz2++9nBQWHu8vwF0QRFxQ
	 I51yPYtCtNFJhn4bqzBDFoNL+GtXpOSEc0ICfcejwl832eHstMsWQvdSTk1SQPN98i4JH
	 ByyxQjZ+fI0HT8SzIXE397qHta54Ej44CUxclWXk+1z04tRpJu723yAmHMTZabXjRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD58A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YymxBtwr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PZICF0ud
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCKRdB3126311
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=; b=YymxBtwrPMpNZjwI
	dS/UiYllpzvW8Cj6FxCX1TXiuCYhyWexMvP5OFJ6dBM5e3DXSt3ukUe9o7hTJKbz
	69MtL4YAFXRjDVsQ8T6BmX1kds3H6sbMXro9nBHs7xgsRHOfXHAAEYjj0flb9wj4
	Fle4lz9UUvGFyw7Cq6x6POMZWi7OwpwQ5KdRTtrYxL3FA01uOHkRj47RJjGwdnCf
	w2DzE+L3Nzay0+W7MeQa+NsMFSSQMWo2jhgsVJDcZ8W0gRgGoHufUZv4w58qjgFg
	2b7iNk6PuY3TAtpRLwCB2OK0CXNx69Ncd9TLTtC8J1KXwHOOFOuUzLYqik1dXzRx
	nwZc2w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bcfe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:42:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso61129137.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580949; x=1795185749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=PZICF0udmnPEgYFh172gALIGRHcvZik/27g82Eyn1jXaZHG5b3c83s+NeUZ9gh8M45
         vX8xgvjKz+JAQgSJX7KpiKKegg4d/dyyIisJ23/SrQlP1hb5f8Oh+LH/V9nJOB6sV/TW
         ochErq9A6xvB8H8p3wZB175z4zbmtYhHQW0yCZMlown8ZUZLYyaqPUm02dBnsAhX1/im
         4PIzcj/sBliwjGc8HBwLmi8AVn8E1FW/og/Kk9eSOwmIm0a3KUMxRt6RmwbuSJta2DHz
         BeAUB3zhA0f2Dv4WIsNK4GqyuM1brCwh1HqRaF3SZ2ivbRLUGxg684ycIi6RvQobUTxG
         XZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580949; x=1795185749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy2vR6XEYdunQlOeIzDll/SmaIf4eDJn3WPqqNU+DJo=;
        b=1YHLLmAv2dqAWtvyeQlciL5evD+N6ko/f4+8FlbqmxNudZ+oiasEeOW31rturrem5l
         ZHT7adOMy7V8zt7msaJo5ZJ0kS67iyNuMVktY8SRivwsrqTul7gewRPORbjE21R0yvgM
         wh9I9vGXG8lFzlRDMXdcBQzDE4Cuqpxf7syD+gUBQK5HO8ftC5lJINuC5IoXoK7R0LQl
         RsE3vwojYBXV+u+6S7hLtkR8iiD6cF1aExHghi72Ce6lYrN8ByVmccLG7TAbHBUYYBDY
         odv2ABvkxbA3rBHy3huufVUMgusVGcIOpTglgfiUHzWm9qMm5drTRtpFVpcmpZBE+lcE
         kpuw==
X-Forwarded-Encrypted: i=1; AL+hErGIl9E232ErI5GSZolHaWrGxeSZwGFAzHOY6SarAgEr7xbridwP/p18QRWVUJ8PuBdjlfrvo/cxHaLL1TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ERTZ7Kuwu1ocuQi3tBqhHiUB0A45hEUR85k5fG6KoaRyZFSe0
	IBXHz9nSyop0AKdZDJ1p7jp0wMiHsyt4TIYbG67vOHwkHMuqGi7yVX+NNa1zUNtN0AHtVH0781a
	lY5XcL8kNQiMnJqTHL0mpPGVHykx9qqPidcHZ7Btcoo2IQ3CBfAaeJiCFxAwknE9yHwuv+GKAzD
	I=
X-Gm-Gg: AYBFou2+MXJ0JMZpxy2J9n+yRVZ4YQZ7doFkqM5FkGdXnxM/cWm5sKCb3f9LJ1TEs5+
	NRjqUCkS4/Jt21up7jM1wxHwGkVDEYoJGepP9NGpu+kK9hTlpToi6sFezFZiSWLNOPtNNvTFA7R
	LUhe6u2jbpeCdKeAjlkznEKGvGbYSAD+4mjIWAlwdKs1HsRzuG3NrA9URC66WaCx5xIYMDOeF0C
	XtUhMnUVHdPb7O+yL/yDizXNf5x7SuqfK13/g8OtLUy06bIIeUf/gvxLUvxbcop0NtZCin4nRtv
	kJePiWk+HgeTsLQNazgDDDQmTihy/3sCmLJgHWsKpm9J9qrpcUbu+6Ttv0qi60oCp+5oYS9NHav
	Lx5hJPUCz3ieyLtERP2nchIrG3L6c+JCcy1tl0bK63knsIA9KAvwrKujfsYL4koGRsMtdXww=
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832944e0c.5.1794580949107;
        Fri, 13 Nov 2026 06:42:29 -0800 (PST)
X-Received: by 2002:a05:6122:107c:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ee34ad4402mr832924e0c.5.1794580948486;
        Fri, 13 Nov 2026 06:42:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b42163sm111420066b.41.2026.11.13.06.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:42:27 -0800 (PST)
Message-ID: <21a22750-2586-429b-9179-da3548c6c3f9@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 15:42:25 +0100
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
Subject: Re: [PATCH 0/2] soc: qcom: Add SoC ID for SM7550
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <11036baa-7dee-45d8-9319-311288ca267d@oss.qualcomm.com>
 <avcgXkYgdjpfnfbZ@mediaserver>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <avcgXkYgdjpfnfbZ@mediaserver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af721d6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UeJPBouCTXaZwcwbQKoA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: SCMDltG6lSi9eXwIFTqVtFrxLgd6bH3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX1p1Z0XdLIWVz
 QPXF+BigD9APXegVLu52g6qewnTOdTNbEhJRr06mpsKSE2BeYIH0RJimG82CfGpDawMffSBvjXE
 dVluQp5g+RjcddvqzpCVm5BYDKqQh2g/iAJxNsDpUYw5ISFeeeym3+f5KJKYeCehRbavrSJYwgA
 B8c0XnZE+1ZK7N2h7g+gH8QL6niMz0S+IKJ12zIdCeT9/jUYUaJoXCbvqZwUhmwvlS0OI8AmCqU
 PM29l4RtXPBFfOTBRGrdYYd9mFRT95wS3BwpQWqo2yjjKPWtwsN5rhPE3sZHMjTA0udjwud9DPn
 U+bJHxcdRAvChIBG7tvPFMnsYnsZcI6p0NmeuXRlYzAg5tsiDpA1/cIwIBMlo8MrjPxc3JJhUWs
 RbGtITfcGUUPKX/UMUIuZ/ZvIhg3I/xOkvwJf21+o4iWosOwAHF0c8WOHXMC0TJASfopCuiohxB
 1Kv3wTjhm8XZN/+vjWA==
X-Proofpoint-ORIG-GUID: SCMDltG6lSi9eXwIFTqVtFrxLgd6bH3D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1OCBTYWx0ZWRfX/VEwDNGTxeYB
 zAyHym9pzoDJ+A/xAY72z29hG+zxed6NoNk+yRq01ctMSuZOsCnVgykwkG9KX0AtsO5G0ToSkgm
 5Wr43+m6FcaLGVuozD4gDz8As5Z98Eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130058

On 11/13/26 3:36 PM, Aditya Choudhury wrote:
> On Fri, Nov 13, 2026 at 09:12:24AM +0100, Konrad Dybcio wrote:
>> On 11/12/26 11:30 AM, Aditya Choudhury wrote:
>>> Add the SoC ID for the Qualcomm SM7550 (codename "crow" in downstream) to the
>>> dt-bindings header and the socinfo table.
>>
>> Please use the real codename of Camano for the following
>> submissions
> 
> Thanks for letting me know. I'll adapt my patches to use 
> camano instead.
> 
> Should I also send a v2 of this series with the codename
> corrected from crow to Camano?

The current commit message on this patch is accurate - downstream
calls it crow

Konrad
