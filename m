Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E34DD3D4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161896; cv=none; b=tNJGlEE9vHzsr6rtcBgtCMUIdUjTsiIT2UOMMMgnpqu0ga5UZoZBWjyGuLNczUkTi0NFfGk/Sv2M73TRAK2DUPlhk2rXZVbUhenuNg/puHwy5e47zkJxRf398Uk3UHiHk82Ha3QX8vIzPAlbKCGzPPmSxPpPLZkytAuyC2pyTB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161896; c=relaxed/simple;
	bh=OGC3IYwILLkT+uEr6oJ215xWaR18kxfFl9HJvcg4MwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDkfVw/Cxu7ZiVjZKSG5doTXuSz2eMqi7GjDM2lrpNOl5oTBIUECmOc8i66jY/WFJl+rGVAe2eINNkdlwfxd+PfcjL7aIaxTWSW2qJdrohKph7dlILTDPLvevc+oSHUdO2paIrdHt/fmNFre7SQuifww2uHo4rRSk2KZMu3/I2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1+nN9Oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpXfnuzu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1+nN9Oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpXfnuzu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5i1X1910950
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=; b=J1+nN9OaVp8yKhKw
	US+sTmJiW9iKBlHLVmyDlgp+bO/AThZe/4zvrb7yX4C3mOBwCsqBGs5ZrzjZdryt
	Zbmpj45oQvsN53hNRpuhJlqDhfbGE+blL/b4+FW8/RqwcyPG808BWxGat0I8KEi6
	qD8+rOeHY/ihlJ38Dl42O/JtEqcOL8oAtzRXTPyOYPa+Cj4TcHNxH+eZ+IuZv9PQ
	vNhylw7PetmsZ2HiG2M6XL94XzMauiWBoz4FjcxkkPFvim4FwGVqt+0E4xHganIC
	75elFWsrLNYKu2Jn0tp7GqkyALCiNDoi3pZ4mf1OTd05kdk9YPk3qwLYxhvdDJhF
	H++XmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8tf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:44:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179d9bc964so140046d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792161893; x=1792766693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=;
        b=NpXfnuzuha7FL4R1462b7+gUUhCFpLXFC7RLw+XK5NeEIFa36IbsSur8134L8dzvqF
         96u/Eqy7qsJMGQn9nm3V7PWZfTKJwZCo2zR/t78dK34y35FlKio36FLVDJ5KXC0idxF7
         JLRiy5zqb8LJXaVugJ42Kcp1LiwtLpAE3FBswZTD4pjoUNOC0xLnEjjtAklN67ZeUQ3N
         KT6gfWtmGW4Hive2r0xHspJWxKNS7n6RjmsQg3dDOxNhbBxP4Xof/B+a3n1i1avpqPqu
         orcD6+kcZOv6zG2pl5+lWHpjWkJBa7lf2cOJpdo7kYgOaptMTCqbp1Nr9mGiOSGj7paX
         5law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161893; x=1792766693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gREwBdjjGcEQUAz+C6L2Ma1LTmDk/ySKUCabLFICV/Y=;
        b=V8++DAarQcR9jS20zz0R1MamQYIB8vi9fmGAZQ//zC6htg9daA8VbJvpCVMBRQB9kX
         jmIHrnEOEA6m4Nx+0cvHsD5hUM0q+1H/jNBATclCdKLJWt5KWNXbNirwLkQ14h7QjSnL
         w2fEEN6C457sD00NIPxyKAKJikJhHnHI7/UxsncWXROsf5mnicduoU5WiaYGi0DpTXmO
         Ccjk7pnyPR9UDqSyA40t2udbSN0NLZyDV6QAzn8Z6exekITjJPs4MqjnVTzu/A4l6Ut9
         g4hZ+ziPa2xAY85nPHPWSddovoqQZotkgl+D5KcDjtH9yacrOrBzY7bOZBVcmYK2KV1A
         3nYA==
X-Forwarded-Encrypted: i=1; AKwUvBwHtAliOS2Uv6pjYW5IIi00eYZnK3fmqerq0dVISPn7Gd8FvPYBPLSwDt3M4a7CVOvwI/CyuliiG1M1N7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsn6+CNlHgj/t7CVVHDm/AMRjXqkbRbnfg3Kme4X+4Dj30kdw+
	9WIKLVsfLkNzpBVTxCaXNNbumWTEwRwP7k0NPNpjVVx7usip1uXjiQOZU6dsR+6NiTNQkX8TwEG
	Tg81+dX+2Te9ZSuaLjoAg6YRAwbWONDqE5J0/+A7iXNu34VqQd5+9lDT2Dt+OCSUXbT6b+wW8lS
	o=
X-Gm-Gg: AYBFou3QQr8w9eWcclCLG6sRBvfxo7UMA8fO1b0LF/bq80Psm4uihILvQjDHFgoNElx
	Ur7jNXdiHhxDqnkFCWn8CT6kHHv5C4WRxBblayNKG7muqU8TcIDcH7/zmH3gDKOP8kw+wRzCb0d
	l0RT807ADoQPBCwhSHn2X+b7YKiOvMybszEsOWj2VhYgtrNkR8YUyVOLPI2CBCCOvGNeTfaz3F4
	CcuwsKFRES6nMRyDzKhjuJ8CyYx1xskIoAx1fLBOcpJc2laFc8IjcO1dvigr2RG0LtbvjmH9WRa
	gPLSqt3jD/o+6kRPjqMI213Y/fc6K+5SlLwABTtukV64uhTyZjEjpo9NBv7eKmFAiFRxQcp6m7D
	GQjU7Jb15KwD+/LotcSUyTw==
X-Received: by 2002:a05:620a:4624:b0:93e:70cd:e420 with SMTP id af79cd13be357-93f29d54268mr3744485a.5.1792161893042;
        Fri, 16 Oct 2026 07:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:93e:70cd:e420 with SMTP id af79cd13be357-93f29d54268mr3739485a.5.1792161892511;
        Fri, 16 Oct 2026 07:44:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1337d2sm1009944a12.1.2026.10.16.07.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:44:51 -0700 (PDT)
Message-ID: <ae1c2f22-f753-4d42-9abb-642d8a135305@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
 <8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
 <pnd7bjhn33e.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pnd7bjhn33e.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y0gpVyyoagim9-6UNf6sH8XDUBknsAAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX7KpvadAqMgNy
 M5jiLW2RKVUWTcIwXOFgkbGG4YVeJV4kOBY7ba+qBF3le7e8OXEB+lb7csqy1wsJSnnazPjusMU
 4QDSMWwopYpiZFfNlOoH0/szwc0Re7I=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad23866 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ORyyYoCyCzIJxacVLkIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: y0gpVyyoagim9-6UNf6sH8XDUBknsAAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXxvOh+n6i0nEo
 b1IseZ4I2PCwfVSEbdcDZHGI/E9PUr9SxJulUIMEPa6ULYnuevEGixQNltAw0s2McmMtUpeGTlX
 4pvcvsegxw+jF+w4WTeE2SmckPmEpOwe5k2j2dbITatTrm+Zv0HWpI7wZXJq3j7qVYND7T1tck7
 X9/Eg9tO+7UbesJ7ax5WytF/sYt+DBsEZp7N4BB2hRQVzUMaypQV7pKEkEhjqcHhsC4QLxTzEIH
 05AC1VzOM/e4AOSzT8j7b/B0IqfLHFWxgs5zKuPsy6LHs8G2p6K8Dm2GvbJgNpB3tQNs91Hm13/
 g+utTPw+cIwNhGATbX6kKzWEfJpzlcfBZHDeLbAqZ48J+BOSvASi8LBtmECROdJcV0SNcmnJIvP
 VgU8K+tRYV87CruLxsOi5I/+xeVmERhDt+4tQrIJDhmIOfubpfkhWokyNQ0H/l/dF+VSEr+IQZj
 OqrtlJiGwjyvpLOq1Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160058

On 10/16/26 4:15 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:51 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
> 
> [...]
> 
>>>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> index 4c2730b34cd1d..1a2f0cc9f8a03 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>>> @@ -960,6 +960,7 @@ replicator_out0: endpoint {
>>>  						remote-endpoint = <&etr_in>;
>>>  					};
>>>  				};
>>> +
>>>  				port@1 {
>>>  					reg = <1>;
>>>  					replicator_out1: endpoint {
>>
>> P.S. ^^ we should also have a \n between the last property and the
>> following subnode
> 
> From `Documentation/devicetree/bindings/dts-coding-style.rst` I read
> 
>   8. Child nodes, where each node is preceded with a blank line
> 
> I guess that also applies to the first subnode after the properties
> then, as you say? If so, let's update dtfmt to add a blank line there as
> well then. Thanks for pointing that out Konrad!
Yeah, thanks!

Konrad
