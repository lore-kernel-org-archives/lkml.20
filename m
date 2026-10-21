Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575162;
	b=L4nre8av+IZfb5vbKgdxS8rrTynuw+WLTgug03vNqte+ahK5Yj5fBAqzVu1Ih6CITAgf
	 fR7Wl2KmVEToRkhN3neL0kEmFXxZapGhPFn3XZ9sznyWh/IhdE+AWxzmmxG9iAq2Hx8OO
	 hrTArqIKvQDEUHcUN6pydhGSCc0xbZE/dZUy/JaswhRcxeafGgzLG74f1OPDG5zAL+Gcu
	 vGXjcPCCxcLv3TwCinfAV1tLU/gl5Tzyak5n74+RMLrH+Exeq5u40VCUXylj9N0UhfIlj
	 +h4+o/+QfxNrst+79LQ5Bd5F5e1yCGmdcUsK5oERyWrECaFT/ONLGDTZW5wTYCsrBSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
	b=GezE7dix3o/3ioSwuomHA3UxPVhOaYeK8trKd7qKH0TMy16LcJu3QdL3C5BOo4x9XvYu
	 RqbUk36yE1AcCeh+RbhRi12bMaPTUip/ye/z8mPh0P67xlHGgacd/MsSVx9kuE9eypweP
	 taGR1j8eSVBzH4y2GfvsyzqC96mU/07kjbgGBkkBpNfkzvdL39+hr7l63tPRedRIS3iUE
	 Kc3Qdp+KTXnp+UVomn2wu6L6TqNSznrIK63vew+NeR/BiwF/VLlxedHsm6EWrnj9wPyVj
	 bwnJfs03TENNqAoqJfj9pxe92prhS14vaDXQDeZuJBlSMtMPTZoC0nj2ImxyaC7498w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A919606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A919606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2xJ3018759
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=; b=JUtPRNxxI67F6Hv3
	kk03khUGkyKsuGjWIQMaGq2/MOQBBc/V33NO6OeW38ML6V/KVU3RhV2cGXOXSYB/
	1cjnMSPhbOl1RCxQVx+O0PnvNQQNzH1oG/p72Cqnd6rrB8n5DTPknV3S9VRhHXIl
	nCFuO8YVNFXozMw5MVCjRBn1VDqLT7On1XG2BOJJ3HJ7ScphFTDZCv/FelQR/aIf
	Dh83BrZ1VhPZFrZ8iBKMu2tyY6GAuRk3XFZe3GjD4mid/xW/Vw1GlJFz4h0P+8IL
	F33bpLGLY9OScl9ZxVnQiKQrk0dY8jCijAbqMQfOpW0ZSrqOsjCQlszcVa1D6XyW
	90I1uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3p2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so1560501cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575160; x=1793179960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=jY3AlhAyweYyNw6+MCdXN79EwCBjjAPJd58GmV5vhpMeDtZRu0JL/rd0UmwV92Zmbw
         xOoY2TuZdXZdoiubQc4kNt7gIwVN+5SqW/oqKT0g2XHl6ENBZuerzKHrDlNndQOCLrsa
         JT+xpEq1nscQviX8oVrNnnsiDyQGVaNjgHlAn4lBjBKbH9rgN7eVLGTVO00ZpHgF9P2A
         6hRFpqRn983GnD++ydUa4QZZMK73XPwwHXxK0Aapm/3LGehubvvVPnyzvR+yDMdllsq2
         OxtyqqW2RWEEF1KO8ZXMkaO5+9VdEBFT1UtNsuR00zNMvhmjOJ0gV2lOW6TYLrwCqxa1
         BmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575160; x=1793179960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=X+U1RGWXM4Ub0KspselOsMsITEOUiOp/3c2dCOQanSEeANUFsPWxUnhDfiTiIAiIzu
         rsDNEBQw+JDpleboUzM5DCNiu1ip6aVzyQbdfKvgMksHWYU8TkbCfqbFUuYx5C55QRx9
         U58FOFw7ivbJ5dqyQGDFbPjMjxG5xpLiZkpDhbkXHhI+CX6/VMYQOpMLmYQoi5Lpk2ei
         z0rVnCsGyFoz8HsymSv9payyiDr3d4hf4aLNdzMPNF36perKNrOV+9dJjIMQtEukvrdi
         5FKcXgES9iTGneLS7j160wngmyLMZ3EwlwhAbtk7VEyAjWiEiZkMZ/xz8LORQfnQd/wR
         BgEA==
X-Forwarded-Encrypted: i=1; AKwUvByMsgpRUGFR46KXRQ5cJ66KIk1wwpvdSwe3IAwRRB5IoM81BO6xZfsW+0QqBfrrfGQYJrqk1FiuDyoKs7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn1OidSexczuRd2+ByjTs11vxtD1cXaMboK1pB2rtQTkVTxLgR
	Utz+MScEGFkmL4XuW1b6XG1gDl1l90tTMRGoYZIN9ExbNgD3Cgw0OoiIMa6fUEv9EG9qLmgyXRl
	ajB4wBiuZ1PCsv4wRKBZhBGWCH42NVYvhp1PPCeFHXFiN19eEoVq91OgShuhHVqWrAws=
X-Gm-Gg: AYBFou3ql5CLGNhfocFCPZvU5+gNKhPN5VuLmVrXcWLspTIo28GiVp4d/2Yxro1wwDf
	DLho+ICQUOzdwocIrWu7jYVkGb+AY0cucAuOPcKdxHIot8q0jlPd6GFEw437JKLPrMG7wHrSm/1
	ZMP3UAB3pzbxP3ZwyvJxxL73xma3+Gcx69B1TpMZ06vHYjNHTtegjoc9s+VUEAWdTbWvDrsNhj2
	gAXijvQDEXfG1guOgFIFdj+Qk7zTFz84Gbw1kfZ97/zFJFWBMFuhqAR0JLs++JpJyZ846oob0AF
	x1VB3zoB6H/HhLUDWj4n1L/MjyNB+0o3grmQ+cS0+S69WUh6fBXDdO/0U3lwc/7vGm4t71K5YxW
	KOusd+TlBjadn8neSpqpjug==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271441cf.0.1792575159792;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271151cf.0.1792575159341;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7b728sm58385366b.29.2026.10.21.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:38 -0700 (PDT)
Message-ID: <124dbc57-162c-48a5-b405-73f3b560bcf0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:34 +0200
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
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX17kYTWVP/pf+
 /15Xqopoh+bZETYGcs7e/OK4EpwgQTCIgIM9dNRpENYP59FNeFjZdJTBjBZzG+1hIQ6nEq1EMdq
 CpfKWLZ5ZP88tM8ZLkqTWio1xIEd2/pLQfB3Neve/GfXGRLJu9Y/n+AROpRK1pXgXgi2NXp34JT
 xLW1SPKY06z8T2PZkK1b17iWryEDbwuolgp7SMpwcbbWd3iMOEKGYvvDcrpLGHy6gFHQkGRqUgD
 KRZVRVGVZvxBbi8JZCl+TBEV4sFuDFqIKL8Jc0zPIDnWSADWHXXAJcTfcnadFOleHbyBNKx3UL1
 5lj87IXwqWouGI96lfHriEGhyEsE5/UUOOKqr10s8iniuelhxs2hSGayPVmZlx2wRffRFO+q5ZJ
 QOWUXru9Fgz/p+m50tcwrqgocCFyyFt+NajRFElSbN2lt7BdW0rHkp7GJ27t18tg91vEk+yACcE
 ngQW6vsJg3VJql1zNrw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad886b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: iKmDlAO9tKS8oblelnQbevO427Qh5v87
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXxod1sX9UO0Dl
 3Fvvoiv4DsBpbBLjON3ytilgYL6HjKznc0Bim9KZZKfbv1VRkpWyNL/7NtDTOYuS9e9NrqJjg+N
 IkYwvqVBcmQzNwpNgo2Kp98SLXvLqX4=
X-Proofpoint-GUID: iKmDlAO9tKS8oblelnQbevO427Qh5v87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones
> 
> Based on work done by Casey Tunturi.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
