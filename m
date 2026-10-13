Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A433C3C14
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885801; cv=none; b=aDMZsSY//370Pg23rYBlUST99kpNBuU2VVTTB29TFwygnZgJVLJC96fQ9RzgFwx3QB9UMZ5+S45kMHsnCuW4AgvZMMx58Ns8Q7ZG1koFot7iRqHVL1vzUKsn9YLSFL2LY/urubSlev2ZtLZbZNGnpIckWYFoe+G6hXd4LdAbF98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885801; c=relaxed/simple;
	bh=rjo4I26n3c0IXUdbdxD0MoFTbWpgzJ6l+W042Fwrmq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOBUwD0HqLlqK/VJzAQRS72/vPA1itBculqW5+rXNQTcUmeQjx7nwkarJcIeWuqZq+Jr+aq04OClpzT/fbBL5qfULdeyu0CyHP/9eD9M9HwGFdF9p6JVnfxLXM/AZqZejGUZIyBaLLIHDKkI9mfNSLZ+8tP4YzJ7PUEDmLcdkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcdrSJl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtSDacc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcdrSJl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtSDacc6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HQuu922856
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=; b=DcdrSJl2nXO30Y0y
	GDBS8l+hQaSBXlaUW+OKiIh85KP4C4/BqnRQn4rgM6OPuelA03nKcSAJuMZsxoEK
	f5rB1kLvDwNh/ixN6cCkN1a6HM6fvDFMX88MeCnsu9vuz1LoN1H6kNqF9iVZiAhC
	2n4E5iMWhraJaL4pbwSdslLdGxTnjuAJggJmWbCbsk/RNEc+qrZHKrY6PTLCJs/+
	WHVIM+ZrkLadVv/IYiHsR+cmV2wwbkKxC9G+MipmI7viPDER5nf6KtQaZs64TRW0
	Lhzg5DytG5ItwPI6G3Hq8Se6OcpqiWdKPvjiwCOJfDsmJw1chBUMljPXArIJVauT
	UR5i0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tbg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:03:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338d5d0509so6253091cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885799; x=1792490599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=NtSDacc6Nj8sPzy1HA7AUJLDOIA79PhrMd3jc2qV9ZSCtnXn7omKHcbQoBXjt174+X
         t0oVQNrVBP+ww1q8962GptqB41wfAWIW8EQFbLUYm4iK3V3UiQ5X/CO7qwYJsU+NclB9
         ksvO8wtBXk9kT6PvB4kKHTVqKlazVmBfab+/V5CMKCHJm7twyE3ogFoJMaZg0kcIR0BB
         0wSgV7LDdBMxrNbNnX7jzn4Mdkp7I4FG6U8pqvBy8rYXCkwj4JYDKK+f9UZ/CPN3vFk+
         cS26xklMWsmeFkyVM74hWOYmDnFSananrjhowrX5zUC3OuJkMujIkscKdXCJHxaZAZ2K
         2dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885799; x=1792490599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BotSoDsAkukhdswcmyp9WdfMfl79/kPupfZf2fAwI4=;
        b=nRW09Y6zoBv294JbCa3lo8uOxpwGcCq1VyqDnhjB9J+NQgSxq52zp6N8K0mROODz+t
         UuWLuQWfk621exg7pSL/KupMX5SoynIA+SuUBdtsVi00Fw29hhRddEpIKNlSm8sHfNUp
         NCIw9XvYrHq/l0+PBzdE7YKMePAydcEkF0YJeJV3LjcPRB5zq/PNsPFLNJ1Wm8uQH46y
         O2M1hVNS6K1aoYj+QRQqzQaZrEGA90HzG+t9usu8uqfmmdtt3yr1Iw/XFA087HTOD3Q1
         qQI6qPJSGJK5Vxx3oEqYunLg6St/Av+T58vzqlDLOhgmseIQtJabDr4gI3ND7qH+MMPc
         XDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBbMS/hb5vHUfWhQ6eJWJTpaiLeezc9Sro7GkkRG70lhi8gHmVhFsnooNFIx/hJiChUXiQ2Kecnj3PvTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJC8cXXQGQ8A64mUn59OtUhTzw9Ecc3AaYN3sufJ2knFjAbPkN7
	ITZwg6jAVDlATVbWBYxlAYkbYNYm3Ri3SoLNZYTcPFAzA7zdeE690X9PoW9EuW/riEHluG98wwf
	5fdjImhofGYDyMfZYVw+c61cFmMRL8yJa+Xwf28rhTYI0BNddfkTmU01G5MjCqvqZKTA=
X-Gm-Gg: AYBFou1J3gm86Znkbip/Z8Jd/MIBuVlJmbcHRmWT+pw2o+t8e4xbOopBNEcT77TuKmA
	fZjKoqxMR7bUZFrUejGmSfr/rkdhkg76nf5skoOXXvA35v46DaYwfr2O8UN8DjiKVjmNrUeiqdX
	zVpYL837r4sDNACc8Ou54RN6PTEnFU6nx/3ux1oSaWUBsBBRg/nc+dGRekl8RjfqqFF7ogmKEuy
	qw7rlaoahDiyC4DaAiLc9J8VXPB6Ge/9c7uwWL/EIMkAmqwvqdKeBTVm9QE9/MekNiXK081EKRS
	XYkLX4bSB+Ifgekqx9i16Cl+m/tVqRctYcdDZeOp+ii7eaFMIM8uS0YRg41PPaI00+I9+W3tCmy
	eL41wEBipFSwvZyEAWMYt/Q==
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294681cf.4.1791885798817;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:ac8:5e14:0:b0:535:84e3:b33c with SMTP id d75a77b69052e-5359fff77ccmr238294091cf.4.1791885798211;
        Tue, 13 Oct 2026 03:03:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm352768966b.39.2026.10.13.03.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:03:17 -0700 (PDT)
Message-ID: <b2b51cef-cd88-41d8-b9b6-3c4f5ebf3d59@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
 <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
 <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62d0573e-4085-4a74-b730-faecbe4cacba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace01e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=CFQHZ4Gs7z3mzJWHRokA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: CGgyiBIIEikjkhNuc5EXqPuzetqRrE2q
X-Proofpoint-ORIG-GUID: CGgyiBIIEikjkhNuc5EXqPuzetqRrE2q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfXyIlX/1A2l0wF
 nfIfuiK+X6zbOikF31YO3ENzPAHHQ2zw+WrkQeUhiroBQhC5pAYVEB1di26XBFYQCZjyrLnqcFY
 SzwO+nMeavO6E7KUb2oI3Id3vf/JD18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX4hoLkb6XdXtc
 iSEt0Eox7WFOJ3oFJ71bE733IUs9wHhhbbtDsg6tchbeTu8kgkXumpKBAK+Ya2SUTgYx63hyayp
 OwXYlve5Fep0DhDLDF62QuRjfZ+Eh/+znfkL7aL1MUeAAGNaFz7ZnoJDvOTyjVrrgCjV8eWY72Z
 z532w3zWZykNG3hSYh/z3obglXWZYX5GbEy4iiDurM2PsnCnf4H3HVp2flZi9obJ5oKZFaNz/tC
 dLW4F+PDl9RXLWp5Jx3XLZCpIZ2LsR5JP3CGAyfEkzqV0at0L63CF2H8GoLVDIF1+RQCHuvnNz1
 Xwf4laydkZcRIC21MWg94mlE3GuelDi/Rzu2QkRjjlJ4kQO/WchPl2UO0WBhhZQpZM81HtpTmx0
 EZ2ihCgl3f0tto0VPqM6i05SDeXP474uZy+Dapv1haNcxBw0KBVb75idbD5G7b25rMGSBLYl2Bn
 TlHyzfDh0cbo5T9yndg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

On 10/13/26 11:58 AM, Anurag Pateriya wrote:
> On 10/13/2026 2:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:35 AM, Anurag Pateriya wrote:
>>> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
>>> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

[...]

>>>   +static const struct qcom_pas_data nord_soccp_resource = {
>>> +    .crash_reason_smem = 656,
>>> +    .firmware_name = "soccp.mbn",
>>> +    .pas_id = 51,
>>> +    .proxy_pd_names = (char*[]){
>>> +        "cx",
>>> +        "mx",
>>> +        NULL
>>> +    },
>>> +    .ssr_name = "soccp",
>>> +    .sysmon_name = "soccp",
>>> +    .auto_boot = true,
>>
>> No DTB?
>>
>> Konrad
> 
> The base patch isn't merged yet for nord-ride-embedded.dts.
> we need to enable for both rrd and ride-embedded boards.
> I was planning to send them together once nord-ride-embedded.dts is merged.

This is not my question. Remoteprocs on recent SoCs come with split
firmware - MBN for the main part and a separate DTB binary containing
configuration data.

Konrad
