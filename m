Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366682;
	b=HQ3uJDn0DOAMEoIvOdVn4eIPH7MBaWJvIhipp3+FrCkJNhhuWy31AMo0dsSZD8GnI4ec
	 Iy+w+zHZv1mKBC3JKIKa1eiv4Da8331RITvoKjoGeSnjw4snqsqZezua8kWdv0BCkfnO6
	 ZyugLwlY2LRKmNeMQnZEA+5qJB15AwwJd9H+hluukEQhn9eEF430f8Nuk9ZQxUIMHhKUj
	 00WWxujXHKs+0IufhLvwXB9IZMv9XtuWEbIeVhPn7fMjyya5LWSC0Uo35XZujPloaMm+l
	 hIiZjMb0kOSQ4Xrlh7BiyjlGLfGrHl3tMs/kzWmKlYyBkDOaIauIb0wvUZu8JNDur8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
	b=S9t0FZTH6Vh0pM6Z0KMfx+5JCbDfYBJYVEagC4bt9VHx5zVvX2796vzDYLIywzdcrVxU
	 3HOiEAcZaL0nzDOSXc5R0fHAN17IVMKdCNwKH/zort5bRuAGC6IUiLPy7UjOzsGU+Vj14
	 he2MALeVWH4+KxNhU4O6HLHSloA7hH6MyARDX3CJVH3C4dLG8TFoo4yvaHRm6Yu5HxNaG
	 Ra+wh7MJVa00uyLCWgICCuMmN2XeoadjAQHkIBSM2N76GXK4e8EJdo8EpsyFPlMS9UfTt
	 I5D6jxsbYPRpW15ouBZWPWDsO/xz0iMHCpJpqXEvb7PhnPH80aWHtWtw97E8mzpb0LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIeyKeLP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KMXym/xh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61208606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61208606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIeyKeLP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMXym/xh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4Vh2072280
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=; b=cIeyKeLPhNEgstoP
	wPPRXFTKXYqqc0/UJUjoWSR3xQH0JER2i1Bn7R1eFj6lvctaNFU++mbkp+CTSNIJ
	oehmfXmG3weqfEKvrXsnSC/D7Lc8KjH9XVWsuWcRHP/zB+OQXpGsUO7TxDtNvIFj
	Ya4ObHq7Q51EOd3q0MNoiVTsPuJw3RhzrM9o6TktsisYk0h5n2Uy+7Ugx8e7g+CN
	IaMbJ31gY2lNJAh9FPxCluD+JH9nb6Tom0qsHJwxZzVQYIWIJi4I5EfuXe9g5Flh
	q3Qu2W0cY2ZMJmDZbIu33I3u5+2x4cz5Y9n9pYG9JlUp8EBzczTbZnYNANdCUzch
	LkPE7g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p38a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:24:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso48139e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793366680; x=1793971480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
        b=KMXym/xhyVExhRU+CUZbwbVsoRYZXci5l+pCD++l3DpMx/O4AZB3bUk3AU2oOglxG/
         mx435FN8AzXisNkR2k50TEkseD1ciImo9+Ko1P/uXw+ONtdrEhxgEjvUBDgWVx1Fa9Hx
         MFbZArL/hptd33sYwfOcJ53ODCk2mt5At8XdM6Q6Uy/Jsx1h4vL5VM6B+ns6Ig2EXURX
         ogup0KP5zxToQHfyabMAHuvon4BC5KStbZ2PyR/Gc2AKZy8EkIGyityKd6j0rkE16pEB
         7QuK1o+hcJBMkFh6KgxmfjUXo+6lCe6PSC3MMfzimFJaB2JIcJ9ku1ETpdzY4mnkziHJ
         qaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366680; x=1793971480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ythtGg0yG3+EAqvIqVWKcfK+BPgVlTfwj66J1QFf+cY=;
        b=tTbS+qbvdEOblC643G41OizM2uRNA86RKgSu7XFyKjrTl4UQt7ZHuiUhtT2q2Z3fiw
         TTrodgbAoK88i2jg2M0mzDR05VvTrZjxI7OspDlDHLaAHycfzVIUY2WL20ikjTyG1KUh
         mMhx37DMj7Oe6k9AMPgmTjGyFcyK/+qyQNwAim7CzDRbShaGKnf6EgUBNXrudMDfKopI
         1EUZVs60uXexR3ADHvj7T+kqZrtD6pmHDk1ReWcLTcHXpYnrk+SJGsoFiMBLoY/F3s4N
         G6MeKjyGGc2knLq5x8xn6odWetG7uYfRoOI1DQRZM4u/GTq0cl1FWWL6XXMWQ6bHvh2R
         q4/g==
X-Forwarded-Encrypted: i=1; AKwUvBwRagsPzs37xhuBl83rzZwVoR5jC706YpL7XA/4El1O9QipD7U3/BWxqiyMRQscgl3lHi1bzjs6gmuZ86I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXu1dhWZBdwlChUzsacr0CvfB8qFxFFla4TkOwKh9ZcZicezrP
	mRAloFp9rIkSkI2eTbHHvnSHvEDAGWRHsDF6/Q2Fk2wPDRkOv14kib0NetaKZteMRIE0bI+4HEp
	ae9dt48EwTtcrwmenhutbZ45dNvXnL3nC19/zMy/m7wUlss1VKqcfWSj9AWPEW6TgINM=
X-Gm-Gg: AYBFou2vwOF0PIPowTVfbblyCC5OK7uuDkwqV2JrofXGYzTspdY5rrxJSOudNn8sscj
	0rlskBUL0TTBxNCHH+NqK9IdvLzw8Qs2uJ/83MUcwyelxe0Q9LPRT7b6RbrAgUbfMFn7VFjKbd6
	RqFYZ4MIGN2AC8ZugQT+fdRa43xdUfjPVyd88NAs7OIPbpMNDNa7vSpGbRmxtPgro7Xb0evjumg
	54UuOESAIuFfiTr/7s068nk4IaP8/eX2mrpJpak81mAJ5KJCiJrcrwSQEF05sIjmqrjvHWC8D6f
	RhVweaMCzjxXfBgAg61e0aaaUtwcjPJ42K+GPe23PY3Wc1uy8sxOR1pGoH1PY/TzEx6SdtxpSIR
	+Kzw1LvT5MZQBKFCPHvl0IqkqbavdDrUMq2qgZ4swoy7p8bCjAGcL4gEzdZ5s8m6EvUFo5/Ml
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr998190e0c.3.1793366680583;
        Fri, 30 Oct 2026 06:24:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr998149e0c.3.1793366680110;
        Fri, 30 Oct 2026 06:24:40 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf0d1aasm62841066b.79.2026.10.30.06.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:24:39 -0700 (PDT)
Message-ID: <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:24:37 +0100
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX0DHTKIGSKcAW
 qFvc+GTnK1SiNV7NVsonxSpb/oBGh3AfhC6VA/hwimyiMrc0S47JbDmAEHhqFvnGA1hUWRN4/hK
 e3GrijaaoBQt8KWALgZS2TiMIwzNZ8XGg1afrHm0fg+wiETQ3DVbDX66FAfWzJU2AN2jvmXJhul
 zAgZ4zJlbhRqeoF1OkClQcd5yp6nn6Jz8E9ccSJyFg9XQwxRBpr9aP4kq+0aboxzOj9h/PB99MR
 J21d1hYT65kzo0XD1kiw5mk1GPAmuDE4sips0506y1lKzM5t8pgd0ofUIKcAaM37354l0W0hBZx
 +qgx5xmvOaS0OB5MNBP8BuwD4oqQw4OC9VgClrJQXA2RCsIhALEpB+93a8Pg0JP2UuSDNpafhLx
 VQ8NZGGcKNIFEpjQHql5bCAlBTLnryHxUvbKd8WgfgN2qIIzpen7VJuowdwikonNoFLo4X7j/m7
 pH7m6nrdsuok/9C1AMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfXy/juQM1ogdrI
 inQiicP1syb1B+4VwXtbuUG7gBriebIZEqORyDuw1c7MsptdJzy8kybrP1CawuuGw7sV42IDV5K
 qw/4JECPJW5Syu7Z8bDKnI6iwx0pBsc=
X-Proofpoint-ORIG-GUID: Q0WQyK2C3lz0037y6FtckEsSeOrmGiue
X-Proofpoint-GUID: Q0WQyK2C3lz0037y6FtckEsSeOrmGiue
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae49a99 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2hzCyEILiIFHTW-stH4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300053

On 10/29/26 7:11 AM, Prashanth K wrote:
> 
> 
> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>> Currently when we perform system suspend, the phy clocks aren't
>>> turned off leading to power leakage. Prevent this by adding PM
>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>> clocks on/off correspondingly.
>>>
>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>> ---
>>
>> Well this still leaves pm_runtime_forbid() in the probe function..
>>
> 
> Not sure about the history behind this, I assume its for controlling RT
> behavior from user-space.

Long story short it was an opt-in because it was broken.. can't recall
if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
PHY code itself.

Konrad
