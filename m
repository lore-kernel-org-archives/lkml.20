Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132321;
	b=fo004RgQQ305Cw3TJAaMWnvD4xG4dQImbUs7Ss05RLjIf00uzu3gUgLtF2nwKPH8GZYR
	 zPHsCyyT4EW1l/q0MOxB2jIFJjkSj8/eNFo05l/Urvs3kfyIbMxL52ugyhsclz6FKPT1C
	 f16isc3C7yj+Q/9AO6PfOagtXX76I5X66TiiJ3EEZdE0G1oNk3ASKqE5gVSvV+BH73FS8
	 6bIsiO6ytn7Ih08Nj0IICXtg3R3MNH7gpwXDyQY4ia9lqxkauqi34RgFM15BhTuKwAMZX
	 9w/g8p3GhRQWUF4ZDrRV0lSFyCZKVsBaq2IYAunk7z4fUKg/LGwXsADLsIr/itQWWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=;
	b=rbffYy3+mck5hHxogJjEn0RJUuXeQ4eudCN8wTkM++uyI1icUaAfpO/bX/Jb7+KY0b7D
	 q3HKEYDmWtX//iwnK3Irc/Y96styATD/33Q+ubScapuu6xKhcqZOjUhrzgW1hytO+xL/q
	 4NFBJu6JEdtWL5/cyTd+Q+3W2JB4dd3NCDnmBzwiKOm0IXplcYKNLxOPzBXM7E6uKyClX
	 LleRZVhXp0ua8BZa2xnlp0Keh9BSIZllVKv3P7LeXIFVlNJpoAjUkm3TOwsWXJKnw15IG
	 WWyLujvk/qCZV0K2pZmm9t9BmZFyTGq7rpAevv629waVDr8PoQ0oIsyACa2rQ/CnGFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+bU4NIF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNmGW2nx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA829606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA829606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+bU4NIF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNmGW2nx
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A87eD3d3459406
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=; b=G+bU4NIFUyi4VeRw
	l1JKeJEaokuq16H6Dz3DilBsqmWTfBkYpiD1RvS1Iw7Kw1CbnvE8ZRkvVDeKGXRl
	1c1F949sXoczIFeHU8IdVWog3tsrZ3oi3JipxewtltWw5bJSaj7WlOBKAHME5E1x
	tlYv/WYQf5hQtsYhZ8aqr00Y+WB0c1QDTiOfOMwOkdj69F40CeQPxbaA5J7Amm9H
	3TkpTHvaxevQrZuSHbcB4oI9XDQCapR1K5hkMdeGyYzBV2Vj7cSFhj0dUlsmXVmb
	nb98ai8RK3qJ7pYZzdEtjcJfStRfPWU+pM4hAD82XDXJGr1morsi360ftdxDesXT
	hqNcsA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k2htn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:05:19 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67c041acd09so546484d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794132319; x=1794737119; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=;
        b=jNmGW2nxo8o+Mpx+8e38vc+eMiVXywWsouklnzS1NLpxoKLLA2+fZ+Y7U+lyvuvo2y
         AxEHESmFKmZmH91O9Wjhc4g/fYIeptMNWRuWCH/XBj6tOwqU/pgcSYB8cyUkr42IkDS2
         9emHBuPSKeh/F8aZwIfpb7TDc+uLMGAYUwXyjFmMAtoxM/7rhVPHJvzm7lmNm+f4syij
         8uTEWdNNg8+RGrJRW0++qBgcdsb1Nd+axABuZOEb481FKXIghfdSpVHyv03as3PWTd5I
         LYNZ+r2BxNHSfUX81NCzHKHVbpileGSQ7p57lDxkn1P9VvXwhRGQq+eGBn1WwKhEVFBg
         gkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794132319; x=1794737119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=;
        b=Om4ObpKiHc+cLIcSoKeCTpsEj0VMP+fATv5wItV7f+rZjtNDvoqjzczdQOCuFYmIKq
         khndG27qY8Xe9cFuWVfyjWrivyDUBVFer76Q0nvs8OA2+4iodKAUuCfSSl9LjY6mcM3C
         amyN9Pq2mKsXJdIQBykQfXxrqJbF3MlhQhSHLgnwXSTf9yJ4bSIjJozW11WATOyxT/iC
         aui5eScmdUIDuauNkQ/Ya6okyKNrgQszyHTPFHP6zOm1WC6qMtm0C5EggYoHv4e2EMhX
         OcCBOUy2k7aDIPCTR3EpuNzVahUCuAvEu93TmtdAKYj9EMw4U7Q9RAPNOLRiTNfNZsrQ
         TZMw==
X-Forwarded-Encrypted: i=1; AL+hErHys14TvrdkZ45pePnldcWZ8gMua8A8SJxtX1uVauL4Ai4dAXUPng1cCroURntOWAt1P8Sk+35CSICKy2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8In43I2hmC7g5zX+f3P5fWko8Jq7FgSNGra/UCRwIp22Lg1FR4
	upPF7vHdF/GiVAfCynr3sJONLTpX8UviuGVHL0nA0jVSejX2QVamGWPPo+ePW+zC/O+ru7mqcyo
	yjBAxDLAUyYAGDGS/i/OQ7T2swY5h7Ze3yPtICwxAtM+txjvf3eyqCgSZnCIgD1cRBOk=
X-Gm-Gg: AYBFou3/A4sR3lNyCk2x32dZq/OsELtlodFUkGTR1LfX/f9F6qbyTNgv6t6auBoL7I5
	Eno0hvESORLFQfG+lSqmswZCr6h6pRx7Z60nHexCNz0LdoAhucabIoAmzM/VZK3dsLKgVvmvxQ3
	V6Ucmy9CVX40mnugf3pdBAI7HYgfFoep5aNZRrASQRNN/dof9ZdCRwTRotzr/hdxOsB021HTAev
	RURkUfSXfHKsBdcELy7IV1Rki+XoswLT+sMPMyqazeYc70Sc7Z+Qy7KmhhgbO0UkwYyGRqvP8dn
	/8A0Vj/RlSwZ+8rP7n1gO1qlTz8YMZdp4lw+HDlNQYZhV0BHi+oGmvwfkaF8gBvympVcY9lbBgw
	ghiDnAYjagENqleXSmONO8JEdrvfWSH+LST1U2AsDgQ2SMHyi9iNDy5kbPqpbS/EMC5c4GL0d70
	Op04O3fr0H
X-Received: by 2002:a53:ba4e:0:b0:677:b670:bc2 with SMTP id 956f58d0204a3-67c3da757a5mr413288d50.131.1794132318620;
        Sun, 08 Nov 2026 02:05:18 -0800 (PST)
X-Received: by 2002:a53:ba4e:0:b0:677:b670:bc2 with SMTP id 956f58d0204a3-67c3da757a5mr413280d50.131.1794132318040;
        Sun, 08 Nov 2026 02:05:18 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc2c768sm11777827b3.30.2026.11.08.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:05:17 -0800 (PST)
Date: Sun, 8 Nov 2026 05:05:11 -0500
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when
 available
Message-ID: <w7pia2wy5enxvv74erxbx7qcghh4acf5ljfzdoqo5jy6gxwm2n@p2eh5rtlta7q>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0MCBTYWx0ZWRfX3YTbAYk1XXvd
 4qGrYVyWAdCspqHmtiiEww40YkAoXtvvZdHGYsjyRiZPqLM2coF1CKNQcorLh6/bJzNO06rxMcV
 Dr72Yx3N6qUoxYh9T0w1xwVhm2VplHZej/qOHb+y5vBH289LLyBYYe70g3N7CaPMJpNIqTvmsK/
 Ihl4qCqbJDjjAa7pnzva33eieLpK09Kiw4eScQ69nt6HUTOUg/VhjSFTsYulsUK7yniOUq0htPm
 Jr6BD9X3TZxsE0X8OMHgprXyDd7mSuUl+TG9tlXzN6GvT1to+GoE56wHPUDA/HIcVJPNxUh0HUc
 OlSN9/V8YWg7GH4F7FyaZTWtnV7a3I7X+zO2e9GPGRpLpkHx78b+ZZE9xV2MEGZyUaqwssFLv7W
 EwfPCtl9H1N3bBx3/sLNr8XES/QX+erhtOzeP7aJgeMKLGndw3DVg3s2S9jGZrzJKANhOn436Vt
 GHN+195yvmPBf4LGM0Q==
X-Proofpoint-ORIG-GUID: gmy4u5GX0qqucvTcEMiPDOlHRhKnKkv0
X-Proofpoint-GUID: gmy4u5GX0qqucvTcEMiPDOlHRhKnKkv0
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af0495f cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKTjZOk7vXKTgSIRYZQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0MCBTYWx0ZWRfX20K5mq+ljdYp
 9mSMWqyByzWODf0rZaDWrMZ7JcoVLdWS2tHPZNTaCN25HDIcPPUI8xgSPFpl0MJBi2GKhXKXJwX
 bCZvzXzFcvAT8dvQQM0VLz0aUOQtD8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080040

Hi Radim,

On 2026-10-06 09:53, Radim Krčmář wrote:
>User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
>senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
>and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
>harts, and not disabled by riscv_nousercfi).  hwprobe reports the
>extensions from the per-hart ISA bitmaps alone, so it can advertise
>extensions that are always disabled in user-mode.
>
>Report correct environment to user-mode.
>
>The changes to arch/riscv/include/asm/usercfi.h avoid
>IS_ENABLED(CONFIG_RISCV_USER_CFI) guards in the conditions.
>
>Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
>Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>

For the record, while looking at the riscv_nousercfi part of this I
found that the option is parsed too late for the ISA validators. I sent
a fix separately [1]. Run-time checking as done here is still correct and
that fix doesn't change anything in this patch.

[1] https://lore.kernel.org/lkml/20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com/

BR,
Guodong Xu
