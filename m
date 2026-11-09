Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217671;
	b=Iu2bWSihWWlHtlKZ8Vb/hOuZyOKXNZWwRTFx2aa4bkOz2gZ2BQQbBqZVI7nb1kRmJPsh
	 +8bTFm6NrE43+g/sSViXaV6NJ02unMO9E1OXP/rR4MXZV1cOEItARQSExwJxhkUmz2qNX
	 4l4//WhenYkGdwW59zz3dNskGo/gu35+rWk6xlNO6TNqasuUYJZ0Uc48c304GCyhPF+DG
	 QlOpjyIzYCupQWVdz1McHeQJTs910C/scTKCnS5i3/CyyiXR6AhYT2YdPEXdTOIz0qbgj
	 qU8wZaXKxbpZyHa8Mz+/cHVGwcML6J5eyNEBE8cxdrbj8N/59a4Ik+n08xGyWpfRtqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
	b=X1COwbDxfU89flKlRTxHJ1uVPS8BpI9gGa12sqaQfX++lF3GcBu6vExIM4ygYeBjfGCp
	 PWiFtYwZgftinoggENgTJhdPHFUa7GrcFKvNMrXZpDPj743QcSW8ay6k+mgaZ+KtB6USQ
	 czFzkeuHXiQnTD2B28066caoHcAtJdnlk9UcneRoGYxaSLJXm5tqyU2j08R5cdW19cP3s
	 JMuhqtCPgkQ8fGdDs1V1Nx8j8Yzhur6Laj42wh7Ut/4GY8WrlgOPZK+fct7iJwucE8Gfj
	 DRsxjrYRmKS7zuLBeNTwnfvifGt+N3KpoQ5adaesI4IYUCBKPKyJjIsBCHvR/gxPNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TF3z2FK4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEwcZyOw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC3606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFC3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TF3z2FK4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEwcZyOw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A2ks3581790
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=; b=TF3z2FK4T2A5Kr9G
	+XTpVvYhi+WHo5dPhPEe/AWDEGWEAyTUr1RmFvLPB3kyWX778Y9ysRKuE8bVXu8b
	12PUsIEGIQqp3V0ZrvmAsTwzTeB61FcBq3PA8kHJrLsYTE+aDaKimAjtL4zBrc0y
	rgLwOKr/pseMA2LU7j5NzbeAdPJkoLlgZjjqruhZvG13ELvXpjZ50VIbG9fWqyk1
	obeg6eEplo1f4VIHC7SjYTV7gtDgWjxj2hMMxWwL5jUMYJrUHPS8LN3Ikb5krBou
	OxbJyNUYiMQZ1mqfHgpJJCLfV58UedNAyy4FNV/rGjjF7EO91r+DFiz8C5UZ5pVL
	JfKuTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735p1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:47:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso11887485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217669; x=1794822469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
        b=DEwcZyOwfIa4rk4m5nDmMztTNHSP1a/hpDttV3Qg+s/EKR9aMqQgsGjd01WkPasVA9
         HXStoLRyX1VaiBFrHWUHcv7hs6c1eztS+fuWBVCezz92hlQlwb2upacW+S3F7A3r3FoJ
         lG24DVf6py83AfwwTX0LcFdZjQPL6SVt6a3vy/GpFMy5hJj/aoCKur4tqVgjnmM8QnQI
         MKdyWhd+96KdovxWQbsOHWAoMROkZ10uvFFLBGvkhAnC0bFmao58JhWq3J/aKAY8LAni
         Qpj1FsR5TggCeRR1DjO6RlRmV+KWpSGoDBP8TFjTJ561xSSPxCskLtb31fVbOOIXXpfd
         mLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217669; x=1794822469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MuvRy7zEJXFRemcf8yZdEGXo8yEHmsqIace7Tdejtc=;
        b=N5ZFgean5AehUd8J/ZmO3wPSVRTHgUfk0afMgxw1uL7lmgNwZhq9w6gz9KwQd+uHm1
         60PtWInEGXuoGyzvFqobecjShwUf7gIjtWJzu8iJ05zv39AhW74nxX6+9QmrlniQMzXb
         +oti7pYkC3xY6KdJdiFk8+jvVkclw+efbK1nW6TqqjvBcePuuq/jsqjCM+vATnpU1KRD
         ck0Y6odYKW5y93NyfP7D0WPXxwfBt+2gCzpdPEPrjHJvTDQJYibZKbKARopRwpWYGhIq
         qCD16WTazNv+8M7SPjq7kYLCzqydEnTCVFjGm/QWhuMlvlwYY8f/uonVDuk7QlA6gkKW
         MsOw==
X-Forwarded-Encrypted: i=1; AL+hErFHUibGXFBftEGvY9ufwIJziOp/hwzo7HYEXCQUWGD9uRK+kYRfLhmNH/Y7xKTSnhiIgYnSSxyZc6yJfZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yt5y5RWqjZQzq1Eyzn9d9PxVv4/EfqXKAjYPb88WhLBw18utE
	Ab+Tl9bun9hI/GGkX/KKI0K8sLbrWU08hzdNqKgSboKlg83ej/bP4NO+jkKhRRcZIm59PEyUUkP
	FWuwm9XkSyNZ67Ey428PeoVPDFOTx2kuo9J205w6yME6y+S35A63LzrCrEeXdjbeRxt3RV2+ELe
	o=
X-Gm-Gg: AYBFou2E5MkkVBQIuVmivoW/obWzKJU0dyNYhqcPnbsDrCFbCqJzoRKPI6gut9r1t9J
	g90gGSlCFTCvP+mZF//TwmO841OsXYwKCxkMaFBfhsuYdu8STDxcd9TQUOGojv4Iqe51iyvE8m1
	Urq8xs6573TUcKNbZm47qWb9XnF6sDHZ1+I7fSz6fhYFCcamLxKEKjPJBK5AZhmhCnDhWAvohF0
	eDV9sCM9TWb2QnsALDx2cMzkfL13YqXjAPNVRcEIpDRjnUpS2Dcw5xQPncnQHHXltmmbUK2uXWZ
	hmqOev0t/2/pIc/2daTO0TfwYMPAlG9HK7lXhO6FqRBABTlkj+oQk3qc2xYrVaDH540dwHwnanE
	71tlSqyqwfLHmu60v9z6t2W/Q8/S0wJDmqXsQTNb4E6NY0CCdDwsAT60fp/d6UMaetnBiBQ==
X-Received: by 2002:a05:620a:a8dc:20b0:93f:977:5d9 with SMTP id af79cd13be357-94783fd1f1bmr503400285a.0.1794217669523;
        Mon, 09 Nov 2026 01:47:49 -0800 (PST)
X-Received: by 2002:a05:620a:a8dc:20b0:93f:977:5d9 with SMTP id af79cd13be357-94783fd1f1bmr503398185a.0.1794217669064;
        Mon, 09 Nov 2026 01:47:49 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a475602sm139052866b.47.2026.11.09.01.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:47:48 -0800 (PST)
Message-ID: <8f5a4017-8503-49b5-8f89-b7a3a7145838@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:47:46 +0100
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
Subject: Re: [PATCH] firmware: qcom: scm: Detect Gunyah by Qualcomm's
 hypervisor UID too
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-qcom-scm-gunyah-uid-v1-1-2776343f9a3b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfXy/t3W5+nxHJq
 3ujTV/hURh5egA5j/rrzFWv0lIKIrZmZM3EX9l2fdCPkfGgjhChinK+THHyAnJCM+BEJ8WdXOY5
 R0tKZrVkZXAG55wNkTcCenE32GAdc8LTHaoCWcrxipW6xwhU7GMedhYKpvce7FiNhBJUhCiztow
 7zHYryxWXSJwRpFkeU+UVwdqtPfU+HOETVGqIdYLevCe3XZl0E2K3RzwWRsmvHD5oHYD4i2eS96
 KYxHyyaTUhO8zhoWeQssqPXKXTAJ+8x5BKVV3yWpZ+66UYXl8pqKMLs7WAn07yCF5lCefx8y1lf
 1apQUPziTSoE/uAIxb1k6anSZWYnFC7gR/5+vQDeoB4ljiQPam+autuzQG7q56sYDLzPqgCE+19
 QZZZaJ1yMGl8YaG1vurc1moOWUI2xxPN7c8X6Lj41yyEePZRniOL71j+kkdm/TiIC3W1IgdWVe0
 XvSgJDJFLNLUtZPi1BQ==
X-Proofpoint-ORIG-GUID: -RAOLwDCOgdYBEpl50INcYeDU5Mj4f4_
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af196c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BqTCDE78pFX49Jf4NhIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX1H9sBtO4MnzL
 /A8BzgrnXdFARYAI7RBeeAyCVYkvx1Nafgbny0Hbhd6cYLG5Zk+/eMXxFjuvMLuygCmVR40X0KO
 xZpmE97MrtnPZ2En2tx9tmEF3OpzZ8A=
X-Proofpoint-GUID: -RAOLwDCOgdYBEpl50INcYeDU5Mj4f4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038

On 11/9/26 1:30 AM, Stanislav Aleksandrov wrote:
> qcom_scm registers the Gunyah watchdog only when the hypervisor reports
> the Gunyah UID. On the Samsung Galaxy XR (Qualcomm Halliday), Gunyah
> reports Qualcomm's hypervisor UID instead, so gunyah_wdt never probes
> there, and no other watchdog is available.
> 
> Accept Qualcomm's hypervisor UID too. gunyah_wdt still checks for the
> watchdog: where the hypervisor reports this UID without it, the probe
> returns -ENODEV.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
