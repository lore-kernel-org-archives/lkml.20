Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617336;
	b=SYLBxeAhzd3EyCTEvfougFAJXtsPOOkJguQnRzXu46r3Y7UZ7i78DvM7sXRw59DDV9MU
	 FAtmwo8Q5OgHz/BKkQ8WaE84IN0P5BY07OXs5jF/TeGIyTI2w6lLSNcj3y81akgJD6yww
	 Wlg3AfeU/VIkPqhY0oSLmhvjMOWyqcxLubEWdNY7qNilh2TULbpJli6ubJ0G2+XnucsNi
	 xHSANOBugnBuEuClq1nXU9zJH9ujGjYdYHRNfQk2iRD6bJgwRRCL0/vRyYP0W2MTSqaZd
	 skcLIheE9pJH02A/n9UDtKZAqr4YqYU8EpAspFXvO3sQwYsV/XVR/xY+8huDjOAgUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
	b=w2rUlnIdzzRYwC9g6YlZPgTD2SwMO3q8SXBwuHMuMXgZnNnfwEN+EP4fdxUJBmgI/ii0
	 jFUvQKxARxnD3yOlzVPsEoZK+KKEHIu1SXtY8A/touFVsZeW0SVdquqj6rUroIulRoqxi
	 Ly/n4jbmm2cJS5aHATdc76K+WnKjP6Iu8iOrQbYy2ZnopD8oR5TjDR7AzWO0jSrjJkvjg
	 2azjAlIrZLstIqimPE9l1RDmcTa0ASQCSRncvXaAWA1zADnA4aM6/wJIIOIwcqjXOEC5J
	 OKQf19nH7zlr285rIXxqhwQO8q8iaesI4MSJfvXgAJL/CcEmkHXwYVKP1OsErXmkhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeP8oHmK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BE5606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BE5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SncOjSY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeP8oHmK
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A0An3430284
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=; b=SncOjSY1ddiRF4py
	K2uzL76deqOxOHfj7Ie26KEzOJ09mcK77hDIx6kEYu+xCB+BLhpzvvDwwivks7gj
	4NEXLvzudhRYxya2uJDMX/v/f8xHgLxsshtYpVouEzFC1Z6Z4HjbTrpz7xVuUK4a
	KOM1ethTaXiU5g9zpqZW74Xzie39vtUuh58tFlDSr6HqaMnbCn1XG/8gTeG/kp0i
	kxO67hQkYAvM5LPlaY0A5ivDt285qWbDGcsGVxzJHzOQ5j+Bdc5i0+JSnaZYH7Wt
	4ls7skwIuPzywjlyklaX/bYJw7WekxwoNI4SqdriTK81M5Afcst+AoUOqjf15RxH
	cRG9bA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmery72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:02:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2325999a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617333; x=1794222133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=ZeP8oHmK+4yQfWtfm6lbMHDUgUbzR6zy4n4GykGH93aYi7cyCe1fUtYmcdRLJZIB6O
         rgIsaF5FC39b0qlHuGw1/ouLH+bdlCykY7zKqaMcLEHTnKTN0o6aTIOZL+yO/odx9BLh
         Q2hTJ4sYBM3H+/hWTEuc+JB8BbRWKbZ3TNk6tK0IUdFl7P47nybiCMwP2VHtzKTXRCIG
         hrDbgtb1iukRns/i1dgE16ULN2n+t+erB2pKtferh59CjagcelkxSsx8MN6W1369IfFn
         9SSvwH+3bBof/V7bwol2UdQk0Kn9iHoQHJXP4jySJVzgKEJoUTymhJPjX7s3UQwTZwRM
         TIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617333; x=1794222133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnBMgDIv1g4x+Wpl6HFNjTfqDD0V4317jb6jMDZ6D6Q=;
        b=uuw0GXbcJiiwrETR19/ijjBJxSrutkrz/IxoNyhY+wLBHpPV/5mnf6KiFxci1oTb3K
         74SnG3Is5W2oRYFmssxQfrsifaLxTXiAT5KJEoplUiOtUYanckJpPZCfU9Vn34hXMRKv
         g6g7UzOHCC8xtxiN91QlsaYqvQYX4Xx4/ykn/L+oP5almNikGMOtA5qYbaODnPX9NjnT
         Aj8B0e92zMYfd9C9h4C2wdZWrDlxe+qM8dFYJmYYGFxOOL3OGNfh+vu+qMRMwU56vCcK
         aFFUwfkYaX2XP3pLH9/QxB2kB6uKAGjlvSOj9YWbC9bYwbO6JNy/tq7XJyGLlxHxJ3IB
         EN6Q==
X-Forwarded-Encrypted: i=1; AKwUvByfH087o0s5bPIyH9srRcbsh7ls6J2vEMkBbrwvuzd6OnENTCv4DeEeIfaof1RKxuFk/EMMp/xvSJIfUcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iETOIa2/3fLLDv1+OhpFxReTAcTcXWZcS5MLwz8W5a0Cs7Woj
	Bp+X4CBuYAlxV8bSLzgbthRdSYBn+Wr6c8tLu07fOTqZcT5GBiGuZsRn2d3yydSsMgRAK/0okRE
	JTJZoBixSdlkat+OguHsl++Pn9rrCD9LcTOEkZjA9Z4IYf5i+aXuPfjL44RFkE37aQHo=
X-Gm-Gg: AYBFou0hDIB5GGmcrcoswmJoHYSw2XDE4LAhRJmF0iMsZPevr9aD+jEBgT2di8sVCFY
	kcYPI+G/CUuq6cTSpkKznD/QGeBskRVgN4fJF3+MTcIloDAywWRb8A52J6nfohIRrCh2VAUhd3S
	iyOw3sCfDBCfGARN6b5XJACttnM+PoarlCSUh5D5bzag1wUB1r899QzJQvccpSrAaQzcvl3LNRe
	Jlees4g3JysZFrcLPm83TAZtThbScvYpfinaLyn8WnGq+6lPqOqp209tWHs39W+72gam4GKRX0i
	DvdVMwDtM9XBT9Cbc3UVGtD+eAvFttpYMZvqvf+T0F1iwEE8NoB1T/Gy8VAfKmY1B1nD9AZFlyg
	CHoQN5lzkqd29OdcoYkyJ4apVhM/uu8zFESa3OtMpSa6l9bRvq/cDZZmQOFVY9wYn5JPXny7R/9
	F9Zql+
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539598a91.49.1793617333203;
        Mon, 02 Nov 2026 03:02:13 -0800 (PST)
X-Received: by 2002:a17:90b:164f:b0:3ac:9ed8:f310 with SMTP id 98e67ed59e1d1-3ae8984da7fmr8539557a91.49.1793617332690;
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8441a5ecsm14215562a91.2.2026.11.02.03.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:02:12 -0800 (PST)
Message-ID: <e0e30cce-8772-4aed-b7c1-14c5e5090c24@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:32:06 +0530
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
Subject: Re: [PATCH v3] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261031082318.1146398-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae86db6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q7gVV3EAPCriVcb_4XEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX4u0xzys1A3sN
 9Zq6fnBegIrezlBwXXHpYgarO7GmV/gC3drtf9fJlqTv8dMswfM53/+ty/IH5L/MNv3JEgiI5F0
 KUFVk2RaL8IcBifpUh9sGJKsz9vPk6G0koF3X8DZ5wBSiMF71t7dP0xDA33s/GD76m+AyOflD4/
 OrTkdM6NtGpzwH7Kx9OdoogVi+sbxcPbDUDqCrbI8hV/GpwkjxhZmHq3j6d/NHSvCO/cZVfHB5I
 OkhyYGGPVF4bo2LauWX1hn2rAvzs1Ilb+V42/oQCTsi3Fdp9fMfT9dFzTYVy5/eKXPuLyk18TT/
 Ot5B3SvL2BLsMdQXtG9wi47h8D14qnM4ti0dafA5mLxnofu6+H1R0On8FWgFbyWn6OH4ghhRWlg
 sboh7Zg5swFlC1WVp+aQI+PkkldbpiatNpVEOG0MEmbIkAIDeJ+hd+ffAvvpnLjeeUEhZwkLrfg
 MiVSjxDO+y1+UhOpQxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXxN4XEMlNP23v
 Fg3/PZnEaWsMTJhxZphC7hT3djG9K9dXIVn1KW51O/ALvoWj3T2BFbCsnTOocU5FHbhwfZI2sO/
 +40vIWCcbBQz8RRXlp225jBQ//l2pqo=
X-Proofpoint-ORIG-GUID: SkfE2ZYhsgqbP3HjB4GUOq3sq9mRjmGY
X-Proofpoint-GUID: SkfE2ZYhsgqbP3HjB4GUOq3sq9mRjmGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020043


On 10/31/2026 1:53 PM, Shawn Guo wrote:
> Derive the backend channel count of TDM DAIs from the cpu DAI TDM
> slot mask in the DT, using the same DAI ID ranges and tx/rx mask
> selection as q6tdm_set_tdm_slot(), so the channel count always matches
> the number of slots programmed into the DSP. Each board then gets the
> channel count its dai-link describes, e.g. 4/4 on Nord RRD, 6/4 on
> RIDE. Keep the default of two when the link has no TDM slot
> description, and fail the fixup on an invalid one.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v3:
> - Propagate qcom_snd_get_dai_tdm_slots() errors other than -ENOENT
>    instead of silently falling back to two channels (Prasad)
> - Link to v2: https://lore.kernel.org/all/20261029022340.591372-1-shengchao.guo@oss.qualcomm.com/
>
LGTM,

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

