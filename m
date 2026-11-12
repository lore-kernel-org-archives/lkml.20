Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508855;
	b=A4aomtGuyUhbC9cnSJfE147RIuo8ZgdFHd7DCMs5UZu12gMSnb0jpm2PsqwdNumTWlhr
	 4NU5ZzZT2olsCsBLehjRFCwzUfEL//oGOtX3MQtkXJFvgn+jZBnS7OftEMtZ5f+zch2Kb
	 fqaPnk6G6Cc4UfKGyA6nvrndciMf7HAJS/3FmhOK6ValDL9d6vkRg5tkSk2EQDMHcZ33o
	 jXseYE6BCNGFPHJ/Wj7Ko3UN6NegkDk9HDll6WjODcqRJVEbQXbrc0TJLPodwgf+pceiz
	 l4MU2fXBZ9xwMlGEulSvtwbs1DYk6EkOSRlN9NrkHAauHhDZ2vx1Pxld+Jc7c7Nf1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
	b=gVZ8drZlc5yyx7clkb0E+LWe9gf8+h/lvUZPQi8TnJBtaq17A83IWzw1Ykv1EpGIfBz+
	 xvSeGHZ0ZARu7tPOT9+be6OsX+DOXPqK3XFz2hqZ45k38G8SHPB4QhJhhJpMnxrtUfCwa
	 8nT6g9IcyXLJ0/wtn6sFriS29z1C4Fiow68b+ev+KYCrO0RqKdxqq188bUKcj4f9xnYZI
	 +UB5YY7FSE/hBNg30+caaEKuLQgmVM0DN2k7NzLiDqkuAWND5v6U37O/jDo/ZORDZA57L
	 bYIgKBfd3N+yrbez6uQx0NEtKwbcWVhQ9WA7ID7HK45J61rW2Y8seKKKxrf6Plho04g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vcp2MgjA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D96606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D96606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kR7gqGW3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vcp2MgjA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZV0T1736574
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=; b=kR7gqGW3gNo7/jGp
	m3FfjZYNdIisd5P4znahl7/XdlXgZW+srglDsTB+gm0Gseg2b6dNAsaBGbM2oGia
	4MqYVTyZLr9TcgssRiB2kDm0VSnvP7KZDtoy5ZlpUiyNHAPWsCWfaNXFxrHxZDan
	AfB46TveDYJvsVoGoTxAmBr0bFO+EQwWrVlc++hquqNyQ3nHAffIu1mVPZIe0oDP
	1mqZJN4h1Cs1M8kzefWXapkhzfC0wENHxMy0GMpRPl0rusbR+3DYgcOZYGPFadUp
	+tS3iHoHmCXzpiW0HLkDdQ5KN6rOXA8YHjBEPHER8/5xGuv2cR0FdiYfQSPSM8mN
	ydddfw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc2vde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:40:53 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso32922c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794508853; x=1795113653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=Vcp2MgjAXYtykdfh/gA6H6lJ2fIBCKIb2exwcNiF1FtLMEXSD/qfyCBut0hOY9Jxww
         pB//hmG5Slt0LiRucxrW6TDG4v2kWa7j3lfeGdRBTAcP5AOIuXb0eXUV22fZdOIj8Tj/
         szrxJZWsyawTcZL6Gl65AK5QnJiUt7ls1JuMwqJnUP0VaRL1oPBDWpsFCVACs953Qlm7
         7CeHjRgAgR4MTGadtlGLksRzl5niMbP8mT+ba3tpzmMUkD00KEompC8i5HroT/vRqEp0
         Xnf1aa+L5Y7LokZGJh85D8zlq/gkPx+obTLVbn9T2iwhTZj1630vap8lCzQwH4IIrafl
         eI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508853; x=1795113653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jL9mLT9/8QhZftfse5bf4rl2t7BkuQXGO4xCAK/9gHs=;
        b=r3Cm7GVE/w+cHuwJsWXfRLU91xwA942j2b80fmfu98axHjXN83mBgJ6KfT1Qlnw00d
         ViU0pXcPpV3KFIkXpYrAtrlOygFqudbL6aqjK5HcAZLdacbkPfJthmJ4+wC/cYkYnIIH
         V9v0EEMKXEmu4lKAkkB7YISE/EvawM7wLuoL30rTFIls9zu7fmCCwdroXD44PvCrTFF1
         cMO8myNVroiphxiSaeVKhCqEde0ViqdSHMO69cH/kZd0WxVpCzMFno+S6CDo8Fv4mOsE
         KNM3UWGWvi/P21/0JgCorhN8Iryy9I/sKsBJU438Ah/T04dLtI6xKtmnTc5Hw6XZa3YQ
         pJfg==
X-Forwarded-Encrypted: i=1; AL+hErFZPYCM5z75jHBRPmIs2rxh1cID9/pUW4aE3Uaf5lCF9S9mFrMBLpR+UvEkhepoLJW3CUYAx3X6gNJn344=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E59zyy8+bnwZLnHc5yYQ4WpTKoHLrhLyk6xIaknb8w5vrnHbZ
	9hbd6FpbRhKlkvH+h/zM7nUsoP2H/ELqmEREOpHtW00oCKvQ1fzLNwP8JoTNifTOJJFi+SXA/7M
	6nVm6Zqs7dwlbPmKOuNaAIbOKQi0bTkwP2eUWV0XV1Si7/BOuewZGr1Kipdv+dqT+76M=
X-Gm-Gg: AYBFou30cj9/vws8/4fifpCExyMs0hav5ZK7+vo3M6kwicKSJwjekgDoi3MZeGnDRro
	WlgZ7sCqp6LzN14Eiz/mbwwojU2BA28EKshXd9KneBqyTGrQleDDn4nvokH4HfW2kQzUF66QRM8
	oOdekMivmR3LIoavyP4ZD85+CfZoIEhETz0qWqQd6rH4j+brdXtg8dRek8d71rrWPNyeGZutf8f
	NEeAw+VJdcecewDsO/Ys1gp+5HWrHhC1OFDoywdSZgh0DAZHtP4OJCB0mhwzQj2cdaF9Dt9ddnf
	iGcKnATd6t8D9dHDqADtwVM0mpQViP3H15/EqYUy70Pa/gy03SqJ0xpl+JyF/Bgn0Z/GB9Yyr+Q
	lz4S/ujzO+7UGo83llVceXVy8KyLkHQMNZW9SKcrYW6k5d6xFnCSmv9OGvbJZzcVhGA22Zlx7xE
	Aqvg8lwDjjhmr52S2OFVLusmcwE2AQ
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301354c88.9.1794508852750;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:20b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b5030d845emr301323c88.9.1794508852098;
        Thu, 12 Nov 2026 10:40:52 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm1204910c88.9.2026.11.12.10.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:40:51 -0800 (PST)
Message-ID: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:40:50 -0800
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
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too
 short for the Michael MIC
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111080620.244164-1-julius@bairaktaris.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080620.244164-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pXENp2WXSpp4Mm4OEsabB0cUPxRYF4aR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfX+rmMdZ53N+Hx
 6cdJIAp08/en4cx6+JYXbucS8395d5dl+qV7HGiKjtNJA1vACCPZpCjZcrYjedwaxOcTkxv8EWu
 25pxiH1aaumr8Aa58iT+xq+ZPG2kfSc=
X-Proofpoint-GUID: pXENp2WXSpp4Mm4OEsabB0cUPxRYF4aR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NCBTYWx0ZWRfXz9XFMcPdaQ8f
 Wk3Kk2+PiMBHpbfKs6wuP1rwlRGotxiVinED8Kci8Z12X+PLbvwMBy04vwWdqVzB1VqG3WhF6Gq
 1phyvMtHh2ZZ48CpQVWuNBrM/2iaoW+4k4EvDrZGzKa+1EUY1pXqY0RIT72SLUdeQiOEMfLjR2v
 JF77JSXfNFNj7XP8EFTmqMapK3TDRdhRJ/b1mk+u/hrBXhydFVBnbeniy3w2tWivsMIsX7bEh4G
 LE6IPhZRvYl5Aniq/YcU51N32N/szHssUbIYMHHoA4KnIP2lklRltzn+6AXnuRnN7t/YCnRR8aF
 P0nInwZaV3/mnxd7V65YXn5vq7GTDU8we8eDI+RuoR7IeLRWd2ahkegG13Q9O5hZGcF7FakiI0Q
 9v02iBrBrujf+RIhTvtHgQbUmCR/ju0dvXhYUre4+KTBRP+h44RhpqOhf7c2oACigHN4DCPGazQ
 LbP96JFQgwKzTIfjnog==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af60835 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZjrBiyIVtDbkfVDLAEoA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120074

On 11/11/2026 12:06 AM, Julius Bairaktaris wrote:
> ath11k and ath12k check the Michael MIC of a reassembled TKIP frame in
> the driver. Both compute the length of the MIC-protected data in a
> size_t without checking that the frame is long enough, so a peer that
> holds the TKIP key and sends two fragments with fewer than 16 payload
> bytes between them wraps the length, and michael_mic() reads on from the
> skb data until it faults. Each patch drops such a frame before the
> subtraction, as mac80211 does in its own MIC check.
> 
> I used Claude (Anthropic) to help write these patches.
> 
> Julius Bairaktaris (2):
>   wifi: ath12k: drop TKIP frames too short for the Michael MIC
>   wifi: ath11k: drop TKIP frames too short for the Michael MIC
> 
>  drivers/net/wireless/ath/ath11k/dp_rx.c       | 5 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> 
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d

Is this a theoretical change or are you able to have firmware pass too short
frames to the host?

Maintainers are being overwhelmed with "fixes" that are theoretical and which
do not occur with known versions of firmware.

I (and the stable team) need to spend our time on exploitable bugs, not theory.

/jeff
