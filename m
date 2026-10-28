Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199990;
	b=p/zlXQ8U4enoSyh0lgjOgk7tLN+MFMYLLZtrYKSzxFncJMwLLzfH1v6FMzy2BAhyrQS0
	 NuMaAQVzInSoowxR7i5bk7uluVVKcrNLKkuQwsMdQN9zaqSF784zn1HEcTVmuoiTZPaWp
	 FaEIJj+ZqWcOUu4lKDikgY8QE8+bF173nnYEC0gmO8hXphklrsOgFfEJSInffZiMTQNVI
	 T+MqfAnlNhWZIEBIPYFBNu5p86LIrOUW13NXaZ7RBa+4nIFyRyepOb8/l/V7SNZ0oge4Z
	 AgRQLJmD+it73/FZKeH0IjcnyuyAJMx5+NpkSZTCbJad8f0qLbqDdPU0Afa3vbYYiqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
	b=S8faAI09X9UIJgtSLqxbOAnMg/XpgpyI9mieJYKsA2z6xMrMsUOOAMUtrhvN1K6OdSZU
	 jfl8j4TrLVGfrZXNyiugodaMTEmhQTXQMNZXG3DcCKWWWxMN5QJP3ON7ayvyLh9DC9j8i
	 MhQ3GKYWOZzHxzu4307gIwmZn0Jr1LejpXITaGFWJ/eCUf73zBylBiq7FYY/cbGYEdIgY
	 pDRRVdge1p+WQCQwuAytu3MPgd0mmSQaCZZ/E/mpAXC+0eQqmn03tizYJRHul6Zx1rTm0
	 2J2xROqBXLWw19/xrFG9OWT2z5c4ZhoeI1nU2zJzi1XWiOm2oXVLd3+YKqHGg/WjNAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB53606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB53606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxRI2105699
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=; b=QgKlVf1LGwoeRbtl
	QTxEpQuZ/oBKBtEJQqNnPb3YNR3Agj8a11xGXVGVWrDtrS1Hd4O7jX2TdpbSQfQD
	yhiNPdQkXfLuSYM5zkkZnJrkX5tLRWgR9WK+JxMpEihPK7CZznw2QB9x+yTgDi5L
	I6RW8SJmJld7PMym473X5feE9ZrI9bUytwVz2ZA9sPbnmaMiP5jLtCHZQaeOwpAn
	0RZzLzolyQZ2DHgIIKDVEG/LntFdk3iIyx4ghJQ3Ezluksbfkn+6qbS6k7ll/ivV
	ZRwUHAzMX9MUsQ0jHbwny88iOr7TFyblwSZeQ6pZcvCrKZ2Lx5HF9QPkubGaYTzQ
	PtIPmw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv6qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:06:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaf1553b78so262807e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199988; x=1793804788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=BnZSNFYl0hUDimnobcFGhJ9Z+tCzvEkqnxZ4PNKQ5R+LS+PwyQOEcM/w0zT5CrHDv2
         m/Vs55cnKAMxTeJ7Pri3PNC9rpD1np7SoHydMDMaCNzmigPoL4fibVrZOTmq5py2s/04
         LmpTHQJT/lDQaL3/iLipCHFWt7W8w1KGoG1YP7/NzMUEhlEJdtoTv2FYIsNcxiY8tNih
         8kVKugtB2F3APlyV2ButnLkawWXf8eIg8WWqnmkWqPHja80DuNQo7IeUf/WnEpUP9/3r
         XTZE9IAULJEZDVUsUz0pkd9K2ynyRRcUbof+GRpT/vowVZ5q0kvHk3czoux4Jfw9p4CQ
         i1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199988; x=1793804788;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=oiUtmST0oBFQiWuyTtMT9Vp8rz7EUeU3OiGLpD8Ry4eYqFR7+papp8Un9qo0weqzou
         ZzLy21lLgkKfsPTZKy/yK6v8078lHRYnbH9noUA3+s0/YL7CLoG2mWtaCTTFIXyRguHO
         1oibhrpaLGGw+GAq07u9YrNjRlsUusy1jczHClION+CINW2vDZHFxNwDySorZvSnlz+C
         b/WuRH2UmkTH7x5j40uW2Vq2PIaE4KRkaY8hgSoUG0RNVpbUIJBS258WqgcPku6pvW3w
         f3shan/fJdbFzGgTv1uYqVyOTyeuXMaAwDoOpCnUmy4fnh3uF3J5S1jLEmyRtAYA/f0e
         op/w==
X-Forwarded-Encrypted: i=1; AKwUvByC2kIwYdrQYUKZYqIbkxDkkgDCbWrSlTsMGXeft1JupgXG2jFVQ2AUla0Yow/++QwX8Yn+/ZfqtOasjcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZUeFrTb8ZPSosZXonq66fxriyKvC7ySCZHhKDbmoo3EoZoA/K
	9iiZicBf/Q4e/ZkyLTBYMCEMo2YpsB49wIjKbFELLAwF97wpDXXfS6mo8lwcMbeKxDpdEDzO/qV
	e02GCg+LSdhpE7IHW7c74aSKfShQtj/xqMd07NdhbhU/vVbCuSDe59HCIEkQDZXDRSrI=
X-Gm-Gg: AYBFou3PB9jS/mAo09e7VrSQr3GmLNuMkoJCwgPKACBfPA2ARhb9mhtRQOhiAvL+ODm
	BCRJrBuwEnN2oCJ0u4XOcdXo4pYGcG9CucK/DmoHx3ELvGZt90HrJU0pZLnJO2prRu4wXuJDJP/
	P0x3Rmt1rh8CrNpU86/BoCab1/rzJze7j1qndR2D8oAmy6QKAK/nMW00xfxi6GQfBbJnMV4mTWW
	TJ8GWvbngRCv/nHnZ0Ljfe2RoJihmyR0QwWJ7ikH8ssqD8yYTRSOJaekx7jGLixQoog+O2+jEXR
	YopBETRu2xfLpfyl7iPLlcQy74x2ph1oI1IrDXniDH4q69+nJjQrd4oyG4mG9jmspceY+xHa28n
	v8+Tb6g/OEblBD2S1F3mxjiBt8TIQgcb0Y8l4fBGTIspB1lW6l72ve7nf6o+7b5GOKI0qPpwt41
	kuMJ9J4uAktQNh
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202113e0c.15.1793199987796;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202078e0c.15.1793199987228;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea0ccsm626317566b.16.2026.10.28.08.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:06:26 -0700 (PDT)
Message-ID: <5e30518c-c6d3-458f-a0ba-f202f5b428e4@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:06:24 +0200
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
 <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
 <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8gvnSeQvIEXmbGh5SkiUHn3rZHyG0Cq5
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae20f75 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=D-oFrpvt22n0kU7c7gUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX3iR4vnoUPin+
 t9en18vGPcDyaqzpqs03Q3emQy4Vu7KNr6S1sMQsI0YVJ7kBG4JmsvWGjRO4wHAhdQNnEvnTaPh
 diwpbe8XKCs1SyfIUrzaoac2PtRSR24drBkCyjuHeVGY70wtekDPzHjyJcbhfJPaO3+DqZuyDVM
 Kt71By9lqjo8RQ4ZxwYrZcC1JqIJGGpr9ZQJPjtZOrF5UdC4ZCc/fFXT7uuWV0oxyJppyYfXALa
 +eS1y100Nlpyiji+EqFDExq2LDP91IwE3HaQU3qQCehBM5b59bqsi4YZOFx552cRkaqNNd/Nb0j
 pTNg+XD5+0dHf9+zI3WOqYq9+9JrcmqINtqJ8B++brkMo6KeeQ3qsU/oBunJrsVji1ok+ECCFmL
 D6b4ZnKC1p/490eVW7EZSlY/6pI30NxouHjM8OrU1ARZx/rKjVJXVD0V+ww1FYdmvGXIpWMINz5
 aXlbBExIweMCqQBCe1g==
X-Proofpoint-GUID: 8gvnSeQvIEXmbGh5SkiUHn3rZHyG0Cq5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX+oq5Pge5qoyf
 hRfc3jtlJdKYeTOnTROODItFtR+BtqLdnBAyET0DFtCumREDL/PLJZsfWEpumBb2krd6PJkGOBZ
 p+WL2hGy0cLg83kxzsvL0eiPl6av4CE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280060



On 10/23/2026 10:07 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Atanas, Loic, All,
> 
> On 10/23/2026 6:50 PM, Atanas Filipov wrote:
>> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>>
>>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>>> independent and need not have the same number of levels, so a clock
>>>> with a lower top rate than the VFE core clock, such as the SC7280
>>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>>> still supports.
>>>>
>>>> Clamp each clock to its highest listed rate instead, and warn that the
>>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>>> clamp into account when another line powers on an already running VFE,
>>>> so that a clock running at its highest rate does not reject the
>>>> request.
>>>
>>> IMO, this function has become a bit messy. We should split the core
>>> clock selection into a dedicated helper, as it is directly tied to the
>>> pixel rate. The AXI clock scaling/selection should be handled
>>> separately, potentially through the interconnect (ICC) framework (when
>>> available).
>>>
>>> Regards,
>>> Loic
>>>
>>
>> I completely agree. I just don't want to mix the two issues, as 
>> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
>> migration, that would be great.
>>
>> Regards,
>> Atanas
>>
> 
> There have been several discussions about this topic. 
> I would like to summarize the background here and reopen the discussion
> about the direction proposed by Atanas.
> 
> The issue initially came up with the JPEG encoder driver, which is
> represented as a separate device. Dmitry identified that changing the
> camnoc_ax clock from the JPEG driver conflicts with CAMSS.
> I will not revisit the discussion about why JPEG is not part of CAMSS, 
> as this has already been discussed extensively.
> 
> Currently, CAMSS is represented as a single device and drives the front-end
> blocks that write data to memory, such as VFE, IFE, and TFE.
> 
> Depending on the hardware architecture, CAMSS may contain different number
> of front-end blocks. Some camera subsystems also contain offline engines
> like JPEG and OPE.
> All these engines write data to memory through the internal CAMNOC and
> share the camnoc_axi clock.
> 
> The relevant topology can be summarized as follows:
> 
> CAMSS device: Front end -> CAMNOC -> MNOC
> OPE device: OPE -> CAMNOC -> MNOC
> JPEG device: JPEG -> CAMNOC -> MNOC
> 
> An ICC path is already available for MNOC, and each device can vote on it.
> 
> CAMSS currently has two issues on this topic that need to be addressed.
> 
> 1. Clock aggregation for concurrent streaming, As described in the cover
> letter, CAMSS currently does not aggregate the clock requirements when
> multiple front-end engines are streaming concurrently.
> 
> 2. ICC bandwidth voting
> The currently available MNOC ICC voting is implemented using max bandwidth
> values. This can increase power consumption in single-camera use cases.
> This is not included in this patchset.
> 
> Addressing the first issue depends, to some extent, on the direction we
> choose for CAMNOC ICC support. Atanas has proposed two possible approaches.
> 
> 1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
> 
> The patchset adds an initial CAMNOC ICC provider with multiple ports, where
> each port represents an engine client of the CAMNOC.
> 
> This allows a device such as CAMSS, which is represented as a single device,
> to vote independently through different CAMNOC ports. The CAMNOC ICC provider
> can then aggregate the votes and calculate the appropriate camnoc_axi clock
> rate.
> 
> 1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock
> 
> The ICC framework, together with CAMCC support, can represent a clock as an
> ICC provider. The implementation is relatively simple because it reuses the
> existing infrastructure, the camnoc_axi clock only needs to be exposed as an
> ICC provider.
> 
> The limitation of this approach is that a device such as CAMSS cannot vote for
> each engine independently.

After carefully reviewing the ICC code and discussing it with Georgi Dzakov, 
I believe this assumption is incorrect. ICC aggregation is performed per client,
so each VFE sub-device can call icc_get() for the same endpoint and achieve the 
desired aggregate bandwidth. So i think is better to continue with this approach
and see how the things will look like with camss and jpeg migrated to this provider.

~Gjorgji
