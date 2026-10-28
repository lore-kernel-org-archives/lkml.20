Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190141;
	b=3t77CDZGiVnR7j+vijOW/eRearVfhWvZJSlBusJKUM5iz1XyBpAB9TtG5EJMAqNKV1nG
	 eS0gD1PHKb6bZghuWRjkTWWMJogDHpghN9AXt5US4SX2PwaEvU+xpUgyan5UZPHp8BBsV
	 nQnXO4OgxcJQ/9F1GH4sHdbKMEcRSvMCQOB5oGXCatRCPD3si8ZwQMLolMHDL2CrkK7Qw
	 C7tXK38P4fXCHF9vJYnYBrPxuEGVFCae72Vwt7Cx22L7cg6ua1Ic4x28vr0XAGkZiugkB
	 TU76u9RZTLV9Uz8GlFoCoge47MN6+8kDDdm+xXtXXYJ1kEjyFLudmmAKw2YpYy4n3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=brKLgKngSq09tPGLQmAnTRQ0zrm22uVxnkQaVowBRDU=;
	b=mP1IoXJxB5CA8KjhOefHOwA+mKiQgcdw/HKIt1TDdUmATImApZ+6GRlocBKNxTZz2woC
	 rr5vX1a/fHs0M9w/mW8U9vDsEh8awb42tqOHNgMoORh3vlubawfgFdtMETgo8XUbayuFH
	 cg1KyAOe1zUIxPTlJ/IxLU9OBtYiU+VYJhrTPxavPthun8JF4F2ti3AeOmJiuSUzMzfmf
	 mLXbV1cS7G7DzjAFGNBDvvIw8932w1cEZdQoSqAlbdN6/8+MG2vZ2+Wfmp7IP4EPzrdcK
	 57t/QwTYS6atJ3gesytHQH9wtwGPjz0BPqXT3J6i5TFH5FPjCutx/vVLcul5OvxxmoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pOaOO/T0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cn+Vb7eF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A818606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A818606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pOaOO/T0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cn+Vb7eF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2kC994555
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brKLgKngSq09tPGLQmAnTRQ0zrm22uVxnkQaVowBRDU=; b=pOaOO/T0HgaZH/vT
	HtYcfhXhEKw6MIkYznzm3wirdVr4E/m8kkVagoPKjErRwMLCmco+qqzAa0Pt1+MS
	EJbvELryzn+ybd+z17zdkGxwxZwlClJeY7b1l7PiwNd9uZPw+3JbB3tYL98wngp+
	4eeUNUmTBKr54z12w5Iin4i2P9vklsSm5YFK2FR/G4qE+CZEVQM3UM2r7mScKStH
	CGywrmVuZdYe6e3WQZuyzDCqbkT4RM0O644Q7pbnI+48dYKDlSjAjP9aFdjunjXv
	ZO4/LnoGCXT03fIQidg/ptIMPkNfWjAe7pFZBYB0qlRVevU65GBYr2WGuuchSggV
	Xg11vQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt0dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:22:19 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc59bfe25aso16958137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190139; x=1793794939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brKLgKngSq09tPGLQmAnTRQ0zrm22uVxnkQaVowBRDU=;
        b=cn+Vb7eFtoE5a4+yV/SGuCJnv0tGlSAJxo4DGV0vVgXjf0dqq58WBxU21YhIiztGr8
         CBM5SiIQHqO3Ft1W7WPL/sWKmf/zYL0xHnz9v9TMXXCedJsegmj2E96cJTxqdyvuQ5jY
         Z8g7DL6LnuU2LT/FznN7Tq2qpfVpM8/WVZYx8Jir8K3yrOdw6BBWHKVpDoJx0QQn4Kee
         /ih0SRm809NOhGCDy6Y+CRLaQzj+DCYfbAKMSpn6tABlQhE/jKP5260jQB+zGXSjYBK7
         /H+HtdlDktiz4PYciSfxz8LqUBk1W/ohoWAuUIHX0aRyebi+wxalvERaSOLGKCWY9baQ
         A+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190139; x=1793794939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brKLgKngSq09tPGLQmAnTRQ0zrm22uVxnkQaVowBRDU=;
        b=EIJ/Z9VYacqs6neOdRpmJZin+4HrC4M7nn9cMtiKd6mi16cQyz8If5dK0EX6jLsHrz
         zkUKY9SKADpKOgeOAHBaqYkYUI6xgId0nSO83o3yybEdVqVnwhXs5IejeBS3AXQrJzPW
         on3kyOOVrF53olYRYEw0RX5tVq0OLDq1XRvTxN4jhj9lvrTzhbvt7cypKQw7dcH7p3iL
         lTkAw/hwgIqaSo8tmfOWXVJ9a0Lobh/GUDESZW8/05LKz4IJ3kdIhU6wIZlzY8hl8uPW
         P2ufRnlyVAHjsDdD/TeBUosFGyDxU1YDok0G71YZ8bzuQ/1zI/UL66OjSC3QfXNOgjk4
         GHVg==
X-Forwarded-Encrypted: i=1; AKwUvBzyMpo9PiP8GAXELeiXDULkvlYBKRtjMjYUcVzvy7xaFj8uq833dBu9Tmr8xnXnqH3AFF+8thMn2Cywi58=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8aQjvJpqCUPUS+siTVOrrvMroJjjymt4t/1PZ+fdRptLM3KZJ
	HWVtv0iR4Td5T8nTOu3Ao9DQlsVr/knKchp7naQChYvT9cOaMROwXxy+RIT8785WTcHF4ViGo7V
	JsEcSL/Tlyq7rjmHrvcLea+ZhQAI+aD+xq4LWdotKq5JD1f/4A5t5QXhtdtd0HAN1BZA=
X-Gm-Gg: AYBFou0rpGt1SMtvgRhFbr0512YsOgYBi4lGzjNDTpqyQ0aaxfbB+ngGBRneW1pjTE1
	2Upb+vctLyDwHtFfY+OyFR+X6A0OAiR4pYSfcfkhkIQCFyevz8TXujmJi47micwZARtdEZ1tie3
	Tl7ZD3exSXEMLr3qZweWrTZlh3ss5QEX3/ob5NzBhDZMsnCmV9UB0NZFoZTNuK1EaQPHH1zt4Pk
	nNWZ9h8GyHUbVum/U7bUD9pNqmNCXndyWoHH9uFSwhzHSFMc/0xqlsqJmAdHqZl6f9hSvt00oyD
	oU6zSEjTScJXojrVOwEC17RCjwgUArhuwszvrsxDzD1aez5x/WjYwwg6L1+JnT/Dtx4j/fAkApJ
	XZymMBwcc/AxzAw+tw5mhD4PAUJWuRcV/TZFt/j1MnQlJnTsJzZAfzuNpb3LHM66wYk04LWs=
X-Received: by 2002:a05:6102:8656:20b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d03a2bb46fmr629456137.1.1793190139284;
        Wed, 28 Oct 2026 05:22:19 -0700 (PDT)
X-Received: by 2002:a05:6102:8656:20b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d03a2bb46fmr629421137.1.1793190138766;
        Wed, 28 Oct 2026 05:22:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4960232f0sm1285386a12.10.2026.10.28.05.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:22:17 -0700 (PDT)
Message-ID: <80fad9c9-4a90-447e-96cb-b1fb0ed98a36@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:22:13 +0100
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Burke Cates <burke.cates@gmail.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
 <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W68da6B-xdNewyo-yi0RtenXoDGDXSrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX4joHYF2BulKS
 Dn1C0+qGu08fZGKNFVpuI427wZB3ir9N0z7bAIBXwOog1jA+p6u+m1yQ2uwqRBKe9XNa2RMEFve
 wMhsPunFBeSDQbHme3taMAS0NaVooFw=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1e8fb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=hTJm5oL54bM-6IUA2lMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: W68da6B-xdNewyo-yi0RtenXoDGDXSrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfXxcuHWau7JQ6P
 3DoCJfWKxj11jD5PHJ8lqUymMLSLYfa6QThuwsq6Y9BTWGim5n6ASdbKIfK+NfvTSsKov87Iu9x
 g8ZDR4ATX1gDAmlgsYtPsGZhxTtHBpqerLRc6zj6V6Rm0RRoPo2S/lb5wB1rnM0VzYZFyGA677F
 dYgDGTdnF82gC6/SLzrM0rc/3uJW1YFTN8YWYYz98K93yq0lJIi8MjNeOGWAg9QtjGZjDeBVFSA
 tgxJpepw57QrbkmStrcVEEN/5Dv8m3DHgfT4ziPE4Ppi9a1jndqkC9ZlZLTMfwEFIs5tvJIm8Jd
 f8bQ7BWJ0/vLNzXJWjnsOqEbfvcJgtBVWgV774rH8dw7qwg34sp1zO5mF9anoTEOj2qXxiD6fH/
 yOZHrhjkw2uPXLSfJ6oI0pciDSf/TtHd5JIUGlWzaYNW7HfncmnVm63f/Nf85Wg2RSBh/KiDotY
 X0KDlpMlUSl1Eq/arVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 12:55 AM, Burke Cates wrote:
> On 27/10/2026 04:07, Konrad Dybcio wrote:
>> Please check the attached patch.
> 
> Thanks, Konrad: your patch fixes C2. With it, the RTL8159 10G NIC
> enumerates at 10000M on C2 in 8 of 8 tries (both cables, both
> orientations, present at boot and hotplugged, including a hotplug
> after a cold boot with C2 empty), with no regressions on C1 or DP.
> 
> I tested on the A16 (UX3607OA, SoC ID 662, revision 2.0, BIOS
> UX3607OA.312), on v7.3 plus out-of-tree Glymur platform/board patches.
> Your patch applied as-is, and I removed my local PHY changes so it
> alone programs the USB tables.
> 
>   - RTL8159 on C2: 10000M (SuperSpeed Plus Gen 2x1) in 8 of 8 tries,
>     with both C-C cables from my report, in both orientations, present
>     at boot and hotplugged. No -71 or resets during SuperSpeed
>     enumeration.
>   - Cold boot with C2 empty (my original failure case), then hotplug:
>     10000M in both orientations.
>   - A VIA VL822 USB 3.2 Gen2 hub on C2 (a third cable) enumerates at
>     10000M, and the NIC behind it does too.
>   - C2 stays at Gen2 across s2idle (no disconnect or reset on resume).
>   - C1 is still Gen2 in both orientations.
>   - DP alt mode on C2 still trains 4 lanes at HBR (1080p60 monitor).
>   - With the NIC present at boot on C2, iperf3 to a 10G host gave
>     about 4.6 Gbit/s each way (TX 4.58, RX 4.71; 4.55 + 4.56 Gbit/s
>     bidirectional over 60 s). The NIC's link partner is 5GbE.
> 
> Under sustained load I see about one burst of "r8152 ... Tx status
> -71" per minute, each followed by an r8152 reset of the device.
> Traffic continues and the link stays at Gen2.

Is this something you've also seen with your local changes?

Konrad
