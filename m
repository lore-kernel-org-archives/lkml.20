Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401072;
	b=o+9Q8WLjacN5CRv2VlxWqL36jFGbCr52TUgOOMWfZO9nHPBEorOPlFHa/4h8XOA4AjF7
	 BUOBnbdO4mLqiq1iTrErwo1cbbS0+4udgsu37VSu3U2TM5RZW+RzaymVzpM0eBoZuSkfc
	 9KXAT53fJPKkNFuO+IU7/e8PXA4tavZRPsKnhHyAo8kPuHDVuF8//Uj7TVIAebnqOsc4s
	 tVKsa1WOFeFblmEXbpULiHZTBtUh5rF/I8AhzOHALPVwlaC/jaQALmEqFCi9haTvaBak5
	 TPdS5nfQqjKSiCC6uCuPmAQQ1SlbpVUg/WEKK0L1kLf18GiBueCpCxs15L6TWG/4aMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
	b=NyN0P+GOuUj64k8bVrneyI9a0A770gajdoDaoP6SCaPmz9Xq3ig2czFmNt+ehm/gC6I4
	 k2BX8GsW35EUmWoZbsfuUohuydedQiprbenawOdbTvY+D37RcEQTSOVUHsiK43tLH8n6Q
	 Z0B78GicXwPMSOMz2D5mOnA0+A4gj7eTv36laAqr+prX/A+eJ94bwHwUkoSCppzsNIpN5
	 wBPvcmJ3jPvgRKtB9D2l4zXRjj9zOeQmEg/DlYOek9508HvlolzWBN4cb69tnMOeQXHFF
	 10NdDBGU1h2hBvEcYLDAuV5QrZ5rLfug0KxepBDVfOTaCnV6CzPZ5wOUiDlZy/t+oYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxMgJ9LH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eOaBFmlw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E285606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E285606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxMgJ9LH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eOaBFmlw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYutO1806583
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=; b=ZxMgJ9LHyx+yYhb7
	DGDEcUnJoT5haAODh0YG7f7GPmJBi6ogrxMSbDi/RS+7aI0rfbfwIDQ6D043tCwO
	xzY5Osy18UV5kSLtcCS3N6EWbJKZFoEMYQttlRJd9Kg7eWREXmvDNC0WuPxVmOan
	m6bznMkWN1p7NrrhTtbF1wMiIbwPdD/fdPKChkXD2rlmQeRPeP0+4lZvd4aEBE+o
	N6NdBP9MtjVLoB5mMJZHx3uL6zKk2yu3Y/u5k671dCgJZ6Ag5AxR6WoBct5BjJhO
	elzMzwtUO1FJm4Ct+Kr/pN/bz6wKAHLTMeEJV1tQKSJn8qqCaBer8ckXHTuZNSSF
	ooJfNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj5hu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:44:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so764837885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401070; x=1795005870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
        b=eOaBFmlwiuljviMbR+EsaRDkoFRnYPbiH51juUP7BInl0sC9mYsr46hFV53+rVcS2M
         GpMI0fIyiHTUz85I52H9OfchvY92GIkeRwgAthOz/zw5T0u1GdPENrxqLJRso64zXBwj
         Y2eTysER4hVuCU2tihtb4wxz9YqLiTuqrytYpbTNgIDlwvaH7g5jkr2i9dL6I1NEkrsl
         LuaHOqbtTRz0EFTQbV9unRfScrnuJlyC5eaIHQ0IRcl1mn/77BMDWzarGGYQ5fnDqg9x
         FGgpNfUkVijwUaWk5QTflii5c8YMxAfoqxx90AIwXxK4P/WhPDv7vKyAhOiUs26hFhRR
         I/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401070; x=1795005870;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Svom+v5DKCDjCiWUGZ7T4HxR2P7zbfjjfUl54/X/CgA=;
        b=LXUVU8WiCpdQJRz0QVK2uwF9XKkPaYCVPO7I+vbrU0hTcQsDN/gjGtP8C43z4M8xUM
         tEC/fdpqwT6o+eW3Jysrb5UmDwP4i1I7f55fifoNtGYWQmKgNi1OHcVoJWFKEOYA4sO0
         DwNPFp3m0dYeD6W/yLPCHFU/O40FkVVbE9ECdQ2zpHZ8qks3uLLveClTMfKSs3ECRX24
         FeAYIgHS88cv3E8PG89Ce8HUjJ8Qv84EjyKxxMWJF4yaPVm7rbv4P9pzItehYSo2+OiZ
         P8q//+9Zx+yWH8GPNW/xIbjCeJvIU2o2dKSjLL+9Q+LXe6qyF9BaKQB3swjygiTT9DGP
         bfEA==
X-Forwarded-Encrypted: i=1; AL+hErGz0zBxMoRYg2dR4aGV2bn47/HIwPms4UyPp0pZWbiO2D/iHmPxlCXYOVV3npIM+DfoO+ESomWGeeT86z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eXEndBHXqkMAAJAHEXck270c7DuC6x3kEenat+ybejOiU3r22
	KAB1D7HTC8WsiR40DsBXCK/GtpMtQV9s71vyTOFl3v+E2iBcyOjDDAAODg+Yyn3bLO4TnBYQ8zL
	IjyhQXh4pk5m9bED1wemDfZLcUjBVbqTcknHQJWmdYq6H8P5+R0qUgGzxY1ufkuQ5Jt4=
X-Gm-Gg: AYBFou2odCaXyaqWBWB7pwmLEWR7GJA0RfLikGflKMTAbskSefURFXajIJp27UrfsXk
	zUGCX3aRi+lN0Ux5bQBXCjKD8McIUFOohsUGvsCLVCcg22TEi4+dUXZG/A6ylmou0EXghjvJTyV
	o0UwLQpE6utV0+/P2yY6TkeLrlPGzNHAhX6/R2T/u4tmC4MmRnSwq2OGZ90A7Q6sAj/CrThkaOL
	atUrPlLBYbaE0Tnb/o0b+bLLzZQ13pE/9mr5uK6olzOilsXa2gumb+sQatkMcuc1KEHPQi29KWG
	hqouiDU+UXUIOMxa83KgAHtyEmV7PxtgerXIcJYQ2N+RhTx2QOjlm3UpTJEvNL55V0dCS3emLnP
	wpOyMmMtGdEUC1idMwsQ8xYc9PTtmPpDglkacI/bZo9Z19GLQdRPXsl+xnzpqju3O4fgiD/H8ix
	U=
X-Received: by 2002:a05:620a:1b9a:b0:93f:2c95:658c with SMTP id af79cd13be357-947aff969bemr317656285a.14.1794401070300;
        Wed, 11 Nov 2026 04:44:30 -0800 (PST)
X-Received: by 2002:a05:620a:1b9a:b0:93f:2c95:658c with SMTP id af79cd13be357-947aff969bemr317649185a.14.1794401069520;
        Wed, 11 Nov 2026 04:44:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10036962f8f.29.2026.11.11.04.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:44:27 -0800 (PST)
Message-ID: <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:44:23 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX7Y2Dz0V8EC4R
 AkEmGAgIaKbQOBzm2/mGxvyipJRlrvVFbbr1T5nRfqLTVH1ygmBAjxf7OKo6+4z8G90vu1qREbT
 acdRPIS4KKrkB/hKVPKcncowOZ9YkV4=
X-Proofpoint-ORIG-GUID: re-StSFQIgEu-TPUFu4K-uJ9y6tI42-g
X-Proofpoint-GUID: re-StSFQIgEu-TPUFu4K-uJ9y6tI42-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX0rlBkm7nIRQe
 czQgeqOiHR3aBFSmAsgsiykhZW+Orcw6MDI9Ai0Xj35/4ozH40pE5Y9z/QfB0/TIOJlqJL8PCD5
 Wn4AmqUSUzVKm3Kg6sC++74G5WpLKEuWP4DUrYq03RlwyDBfvXhzz802uD63CA+lMf5/AlK4EuL
 riQDeFSMYpMZnUJeDor9svO10iVPne5QIiPBds5ynoUitIW9kRfM+xZWjHwQs+HIfKOaKSrV6k+
 UEsekR9T6/G4qMTA5VRrmvwVl7O2TbSdVqPZh0/Bx0gVbhVHcc2XdBM+s5UtADq+2eKIjPh8t0h
 YhzU6eGjHP2nJ+JgmG9TNOVrLtZB58pHCuSLLWfnpGoAfV+qTjJSO986WHoJRaC3Bl3QkojghZ+
 pYySkHpOfldbnI/fCZPFw5LYo38hSCmvnzjL+qLXCw2xdNOVF8VuDts+3muNClHKjoJ0xjgih4n
 R3S1vhvzJ9Duxd+Pafw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4632f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FoKKIyl-W1BixC_GgiMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

On 11/11/2026 13:37, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
>> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
>>> On 11/11/2026 12:13, Maxime Ripard wrote:
>>>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>>>>> DSI panels can be placed under DSI bus directly and many Linux DRM
>>>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>>>>> such panel and DRM driver does not use OF graph to configure lanes.
>>>>
>>>> That's not true. We do use the endpoints to configure the lanes through
>>>> the data-lanes property. See drm_of_get_data_lanes*
>>>
>>> Some drivers use endpoints, some not. As discussed on other thread,
>>> there are more than which do not.
>>
>> "there are more than one which do not."
> 
> Which means that those should be fixed. We have legacy cases where the
> drivers assumed that, but we should not target legacy.

These legacy drivers work fine for 10 or 15 years, like Exynos.

You can improve them, for sure, but if no one does that then requiring a
graph is a mistake there, from the panel point of view.

...

>>>> DSI busses can handle multiple devices, and multiple data types. If we
>>>> were to drop the port node, how does the upstream video device know
>>>> which device it should send its video output to?
>>>>
>>>
>>> We do not drop the port node, who suggested that?
>>>
>>> You do get, that we are not talking about the DSI host, but the panel?
> 
> The panel might be driven by the host directly or there can be other
> chips on the bus (someboby has been asking about the retimer or
> something else sitting on the DSI bus between the host and the panel).

Sure, does not change that panel DOES NOT require the graph node.
Neither current Linux drivers, except some.

Best regards,
Krzysztof
