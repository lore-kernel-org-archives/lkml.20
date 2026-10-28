Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191902;
	b=tKieGyovrp5RUQWLj6Fs42kB+i4LPVMzxkEVvZxE4tY627mJmfi02TL7R3ADwduMgYmv
	 31EJlTM9Iry6QLNFl5p+Bn0vUqc5ZWo9qGcQKT9/oSoXeh74MVmnQRm9Tm8jQTYxoAXbN
	 vIOYaDLkRp90LtonihZ3b7yojPJQZ2RWTJhwJlqJ9B6w6XvlRSXYQeT2CBtQ/i2ucWtrN
	 Mz+lbX3+1F2sj1i5QxMeaEJUKbjU5n7F0rgw5jk6fuhl5MVBQxBBDMwOyoUFPApJXPnSH
	 nWjxSQ9yLxzuCeVFlmB0nq3z2TH9q7cAyRZyERHcKTTC5RoAgTh2eKPm3NIajFT28Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
	b=j1hziFbAYjqhT7G+GD4R7p9aUJDYH5JB9ttIcL8Cbk5VTUWsPWnBYvD8cSH3xRjYIH+2
	 /E+Folx/eDV6ABdwVY9/hJlRAbSmWSvIhl4vT/a/pBQCgpUizvtdSJxskAC0EUqhrPCsm
	 a/njDswaq7smAwvqW++1L5lC4ZYFzK7j3FW+JPCWU2gFuphKy3BS7tspRrMdC1aowv4Vh
	 QqXcKf9eBKm2kV7u/L1T5zHJGNBsg0by7AFtvcSirPUEd2n4a7Chmt1JraE3dL1MGZeBF
	 cejjaqmINYH4Bd9zuiLpKsrqo9GvrHjmn3hU7q+yYr4nP1EP6gWthbiOXKVH9THrovQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="iJop/YcJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E63860A263F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E63860A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EhO6gJ0b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iJop/YcJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGxX3704398
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=; b=EhO6gJ0b7Fu/03c7
	QiFvEyoo6+Db22HwYPHzd2kwr9wPbpDhZAKU/8MCPc1jj2bpbeuMXLLXY0AdN9mF
	BwGtOHDebmwUpLBkXi9BgS1bBkKuiDAdfJjQ6idY6o0/P1tbpLnsJsz7o+RzPt4M
	955j5OpYz/cyjUvh235ZXR6G3U2ycbjtt2V+zphuqp0F9HCdTx/uosTXDHiB4G9b
	iL4BpaXwInr24motMXM31/m9wIE8J4ahWPzjdYmN0h/2sQgwjyVt4qCIGHn6B2bD
	IvHvSsqH0tj76vvQ066MtkYsQARmhmngV0zmlLPXBxCn9PIi9juCC8pCkSezU/qQ
	FLTUew==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7147rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2445277eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191901; x=1793796701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=iJop/YcJgNYAcvki8Sy4PngnQ6VcBdDoihddMzawOZ1J/zYXGnsVKC36ds4SKUmUiW
         jzxCziARLiyhlW6jxcPHvD+aS9JC2cOHQWDOHK2lHqOOKX64r3luwqwl0EgzUeLedeJ5
         wcsVRn4Vs5kACqj41Vp/AMJQ9EuspNDHnPNxdgVWN4j/ME5KEJj7qMJiVvX74BPpYFaG
         h+i2z91UcRCFEeiyUNhFtkkJQ2Y5ab61CbxTKILu8ZyKOa6dJ894TLp/dXkIba5ZqZhz
         PIG5A0BIsd55JVS5ntWL8VrS2eRhVa+qS32fVA/r6TbfjnA7LrreKLnMzxYJqOlF4EeO
         9xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191901; x=1793796701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgIAfahGgFUgahc8hjQZncsgzkuThHDbRDjCxsznGZA=;
        b=rEqkBgK3k4mH3Lzl6sXp0jYTa54Q4vLQ2ChPq2xMKtkjZqDLFlhy6LG11mYs4PcelF
         yt/dqoe5BYjyS00mglI8J3INEK6Q09KmeAQ5aLy68WpsqceigpjsfT//iRmRNDuQp2Kw
         vbNofj71eot20Wu8HR9Tb8/YLsl9I5YTf+Vx+08wldTIF0S9uy+uR6PV4YZ6BkLECztC
         mutPqwBGgZWgYfm510Lo5Nvuiw1MW3AU+ZVa/o9Xf9WzjvQusl4/PUkjhdkjoIip2/ve
         AHkbCD91vcFjOyl+auo7eQDD1FQH6NNCwpsOHEPp0Sbn3ERTsEvX7aPQpMIJa0Bznbmu
         F4EA==
X-Forwarded-Encrypted: i=1; AKwUvBxDtN8QbtnRETtYMKZNQBeIObI1kp78R49n6IvEsr/nZytoL74clKFlM4az3OMjeE2B/OSnXZ53nLzc8Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoJIfO+gZCbATsv2CIsMObwAZFL+/DBKplP4SlYbRTZOLu26tz
	WFphnNlK0PslNcbDieLwk8WsL1LfJQKnl+uj3WSZ17R6CM5Uh9vq28m0SrY2uYS8jInQG6v5wMJ
	fXjZ60Nol+uGQXVq0Azle0fNl3O8kmpEsCiQ/Lp3LkBYLYJVaToEBCbqfnAA+3uMSztg=
X-Gm-Gg: AYBFou2/I/AGVCAmaAqcg5UwEGxww6Va371ls47vhYUd1+p9Ll1qHSbXPmRYbAgdon6
	UX1LyGNH/7rU0qq/O/hogUUKuI8VH290iUC/K0oaKn3oP4Wz9KWUGFH7Z6npl36x+9fg6J5LEiM
	CUfkEITAE7OXvXdYzk6/MH3Te48vj/Qd+Fe/L+nYkHUEJneLzau720dw+0M4k/aWOOohFXdfkKS
	JCjCc/GrnPSR1qyyiJ1wcyt5qCOJIiMKw+8nYZftI/f0q9X4A7YzKA+47VUyzmrCv+ReZQrgrSQ
	1P+mc02OYkMRaQSIwsaFGHjNi4+XwbEiyky61ZP1wRpIpW51SACiioe7jc0YDHeR9ekXKnRS1b+
	BAefZiSZPlfUs3AMzvOqo13XEmT5Ts26Sf7sU9kfGO1GeS2B6ypmybrg80zQ5pdqaiZK8s2siBU
	ocpvk48AXC
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179301eec.11.1793191900721;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:369:e8a8:b9cf with SMTP id 5a478bee46e88-36a0f81976cmr8179258eec.11.1793191900087;
        Wed, 28 Oct 2026 05:51:40 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2392ecfdsm7277318eec.17.2026.10.28.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:51:39 -0700 (PDT)
Message-ID: <57aef084-4328-4e4d-8ace-f0fc288e478d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:21:33 +0530
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
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: qcom,sm8250: add Shikra sound
 card compatibles
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-1-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX6Vp6Pf8Goyio
 Ks6FVMF1EpXa17REH9gGT4NwhlPVOCNPPoIqGKYuJhLg1M21+exmrIiE/PoqjU2xDXhS/c2Toa6
 sF/aywZgLGNWyLMsdGgbQc6AYhmrmwhyhDUAXw7alPNUHPDSC69C88Wo0dGVUT93Q94fGFhyoyj
 zlwqHueG1ZRJ6IlsCfXXtSB+sQbjsGNuvETlkeD1BYOW3LbgX+eDWINOB2dOzppAMVaWUccRHti
 JnlL3RwN7Yi9JGT1wL7mdBp0Fvv/Bmg3cBRcCXO1a5iZRcNaZINu5MJCHo7d6mx0A+SH1trPvL7
 2HjIVk79bGOTjg9D6f1egGOC5chaOtCqVWlMB8Wozo3SX1M8inDhHOSzNRTfix2AptBcnHnW9Al
 TXXk4NKJ1vfJol5Q++nyox2O978AUjDtUBc0cPJHaxFOl56rqaJSAahLo/t2tFMw9yOg0QbmWb0
 EZgTLfGh65IhKFYxFSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXwNrncDajpu+v
 iBMyn5v/r//Zk5+fia/IdDWfiMMsvNTpxz2od4meqxkfQaXWqHFXzuqf5XaCNjCdkX1D3P7mI9p
 KSKiD3RJ1f4Vqg8dHAPwUF0D7Pu1cy0=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1efdd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iuzv4ofnY9mMQXrTmB8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: oRCKwYmqFNK8VYtjcl4NAE_2YNlBQmAV
X-Proofpoint-ORIG-GUID: oRCKwYmqFNK8VYtjcl4NAE_2YNlBQmAV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add Shikra sound-card compatible strings to the Qualcomm sound card
> binding so DT can describe board-specific audio topologies:
>
> - qcom,shikra-cqm-sndcard
> - qcom,shikra-cqs-sndcard
> - qcom,shikra-iqs-sndcard
>
> Shikra EVK variants use different codec/interface combinations and DSP
> processing paths. Describing these variants explicitly in DT allows the
> machine driver to select the correct DAPM routes, controls, and clocking
> behavior for each board.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---


Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

