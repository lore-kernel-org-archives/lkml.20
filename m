Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794421450;
	b=C3AoGq9x/xBgUom9AB1L56GFqEqbM8LvF/7ilm5IuzGT1Wp9DcjTcs+Y98YwczNJVQkp
	 we6ET9Hz0+PpAs5CVqjcqXbIGnYJU8qwkHrwIxHRi/yUNu0gGKBw2+L/yAIzmAX5upGZO
	 QLrzTeSwmtmSP9H/1WSN+gmhOygTwssNOF5YGAUncTkZdYNGvIZ5glrwpCYkPgrYuYXm4
	 JV3WnUPciwl81TaIndnAi3Z2PP4VIMKVadKScl94xvmSRF/y07eowlfT+G9WpLtX0YIc1
	 gtl5AU9EDVuCVMWw0oP4VWdY+sVI4YQLM3pg9yoGMjyh/1/pT99h2qXf/rccGKqyoHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
	b=X3XTn8YmEb+bfKazXU2H6m4hyj99SkQ24dmIjqlUqBxl7BCMilvl0+A0eo/mDlBtwd3c
	 kw1KhHM5vUjCtPS2SxP/APi9UpIk/Tjn1hoiabjoxy//1oN4AXYUDSljd13oC6q0JXHSD
	 fIvt8Jrw9LNHOq+VALG/eU7392ZMgeGHqsS65uwEM4mXfFYzNLJky1CX2ZzMnu1KzvaXk
	 UTqrFsixvYU0QuByChLrfD3rNjkiRC31kn6fzXtTDQgo2Azokv0lHD0bymlWcCmVoC8de
	 frdxXEfgZnXUlWIctOhUrv7RVg5+IGX305Cetq981UoaNxyiOLisH5SY06rB/Tc1scw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B95606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B95606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHt4cI707764
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=aMG9NSIoryJ
	6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=; b=isns6MqhLK2gICBmvsfmHDefPrM
	fcse+kjR+dgFtXbRypDtqotW1Yl02H8zLF60ugJCdMKKjv2bgp3/FfDVbtAj0qPL
	nMdiMIQxDW/X1fu1xFPQrqO7h+9kKGnsak6+fIA8XRHkd2ZnZxPL61j+PZEgibEy
	nBb5hifSwAd17cHCObGIGWr6WQCyzXxmQufY6UHIk7KcX4LXVPfTsiACYBolCFv2
	uZsIapcgbM6aipiYch9uLbCT+xrDb7WMyVR20uj/cvl1DYR6dMROu6AKFq/+SWeu
	7vwmmqM2W1TLALIA4l+/gOuarfulif/2FeT4KQUkwmvzHlyXdH6HmkOe6Mg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hv86p8k7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so2093591a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794421448; cv=none;
        d=google.com; s=arc-20260327;
        b=ss4whH5Q9HJtIzmyg6o5jvZGrNdYErS+TWFo54CxGI++KPi5q1DSdlj8uJNzokqCTd
         mEULmOcYh0OL9tzrejqt/7UzAAJUp8xNYVjRnOcuAhWZfZO7bAMxmC7UXlPKIX25e9K7
         /sFH624SsfU5D8e/c+xeLW6R4qFXg6aNfhtqphZv6KBJUVzNmk/fX2ohNJDARZ+cSo+K
         9x/ptfOMcLDwltWmgHDNmWTJoCr9WP3epi6s6haT1q/XXvfpYwNvFRy1i3YuTsTcpxG0
         CaEfXpR4lMeEFM2KiOIOhf13Ee9qaXNLU8s3rXPADi8X+m2Y8ipv4c+pzMhMOqmqAILV
         B1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        fh=E+VXNpQoBheZQ6E/JzObHTfq1A7VK5xEzUZTvZ0IYk8=;
        b=iBOvJsUEYl5eLugnZz15f1pbud8VCoTZz8HGZDl1W/BeL/uLsu4qM7u9CMVhKbeORT
         EWHNVsbi36CfgL06Tw4p5vIhSQ1ICNXXkQn4MQ/tEXxgUb5UD49PWuJWJhStMf1F4wr9
         i33eK8j0ENpWMMjiTChAlJYAfwxFS17JMCYRO03/D96yBY0HAWn7BdN1dkmggFSpeKzS
         pYh54gzM4k7yMWsF1Ymg3M8JYxG1t8SKj9xNygSY35jOa5nvNjIAb5nKCTvy75xBTkqL
         rafzaOKek118XveF1n3Az405P7BVp4/DiVEoYgghZakqIs0R9MjmeYqq6IqsrOEEECWU
         wnDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421448; x=1795026248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        b=gMn5b4l8BDBHnF8LBYEvN3d3/8vAF34h/Hi69SZoXbX2X5u+YxfKlLwke+h0fVYwyb
         qD5T6emn+mNhaGlyoZ5aWA+lDEODTJmW4gjErXGUd2ZU8NNtClWQwueddEU5U0R1keQm
         zcQDRFI6AmPoj6ItOfPZaOIJ7Nlmjdku2reZ/8ZaG55S8n7MqvJGEozEBoel5+imW9kY
         lp2Opba046Fa1YJgDa+QSuvDD7f6U6BUhus6eZiBWwkIMX6G4/J7uHzI9Bjsc14SuVO3
         98ch5MjJGclcsRl2i6KWKYeyv48MDGIw8XEk56wSXDU/GNOK1ZNvC5xyKFIDKaNX5yrD
         rj6Q==
X-Forwarded-Encrypted: i=1; AL+hErEIRzVO1FtAjanp6plL87ihPIJLAjIn2fW0evXCCdcYJ0LbYA80AsXDJxFXIm6PmuBtpcmmpuYGlTvsEOE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AXLWuPUvBYQdyBI+xe2F1hWpB2hVioVWw+0dlZ58j+BDH2oem
	n7CN7AKFATqoLv4K6jqyOBy5O/OL2TkW3E0EdJ4kjaDcKtKzrVqJbFnWSVLkvexgg8VPDno3iOx
	AaL3piutqayYn2qv2rDiBRPRH3mkVneyBvqyafimJsYVMCKc1Ld29NJOagaLLuBVEmHyBgunytw
	cNL5/t5E3WTNlbIhH1XESgJLCnMdjDqLYXNhJ7ojQ=
X-Gm-Gg: AYBFou0rwlJn4IXyiBhac16pY5BkyKTjpUc1R3V8fAXEQpFvN1HcxFNtrf6maH8lS14
	LOeC6diiNuXqXzEjjBGi9EwN0Cf/iO9NseDlMznnRj17T3UYDjivrd1yaDFCrgCz/RYRlL5lBK9
	6BDw/pP/UJLnjn+YGEaegE6RyeNg2S7Zoc+GwfN4FJZoY+y3id+aZGYCgF04lh4uRuSQN7liUjh
	kl6E9bGRF+qdv2uB6VJPEulBzYfuZI4
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b182eda7efmr3257446a91.26.1794421447591;
        Wed, 11 Nov 2026 10:24:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id
 98e67ed59e1d1-3b182eda7efmr3257421a91.26.1794421447127; Wed, 11 Nov 2026
 10:24:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
In-Reply-To: <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 10:23:56 -0800
X-Gm-Features: AclHuK8_olqmA7fXTYgEAj2-H4kgkwQj_X0uL-xyG8nZrZvhci79BGaB7ila0uo
Message-ID: <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX28V5uJgbP54C
 mIr5ST1mmnW4rQpnkE44Vh5/3HEpV+2KdVCTbK3qs5nYRWGioyEQjcvQFFvI2UbyxV4enBgC2//
 etuy7RD8ME01ddM1DErQca9loU/h5Qg=
X-Proofpoint-GUID: CvYxqD3Usgm1ZGPDxZQNWxD2ay5KfmGh
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6af4b2c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=-xR6GoDS8vL2zpuMsZwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX0h1PtQZpz9AF
 P93Kv1oBuAYJpG2Ecbesn6OQKCfB0gfdat0bb5imq8CUIUMm3OJro38xGlqgKtoVl0cR6Dz99ah
 1ljbtkt+j5GnFNZW5Q9MpsmkHVdZqFtrTfV2gLH0HNMUaCkbP7nAyTnaI3trjGMd8xKJKMWHTfJ
 4p8O4KmYDIM3g3lHLnSh90/Me/2hKJ6mdazTAvtym62xyiwxG1FYk0gSl1oREexcR4loM154oxv
 2kP85Wwcj3at1fcfqyUaNKebABRurUotwZO9ZHw2sXRvZeC2eJ7ogdFB0+FLWR2JW+Mj0AptUFg
 quQFumwj/oErT3XYAMigptpsSpxuIz2xRkoLVadt43ikmxE4ssE/p/13kbee2XKbR6VxezH+pmY
 w6QCZ690vVZqfFbPjY8jFjR591dac1C8qWN83CqL5gwO3ebGnAfPn2twI/CKHF8/H1JRR2dBT8Y
 viDul6L8jG9/STw3t3A==
X-Proofpoint-ORIG-GUID: CvYxqD3Usgm1ZGPDxZQNWxD2ay5KfmGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01

> I'm not sure the kernel actually needs any bookkeeping at all for these
> generic rx spi allocations. You could probably just pass the spi, dev
> id, key, and probably rotation count (as a device key generation of
> sorts) to the user without creating a kernel object. For socket
> psp_assocs, the rx state is consulted on the datapath before queueing to
> the socket. For tx state in all psp_assocs, there is the possibility
> that an SADB handle needs to be cleaned up. Neither of those apply here
> or in the rest of the series as I understand it.
>
> I figure the tc ingress rule can just take the spi and dev id by value
> rather than needing a reference to an object that we create here.

That is how it works in this series. The tc psp decap rule (ingress) does not
make reference to an rx assoc ; instead, it should have flower matches on
psp_spi, psp_ver, and psp_dev. That effectively ties it to packets from just
one rx assoc.

So why keep track of rx assoc objects at all? Two considerations.

1/ don't accept packets that correspond to a stale association. That is, even
if the device decrypted the packet, it should be dropped if the device key
which minted the assoc's SPI is two rotations behind. For psp socket offload
that is enforced in __psp_sk_rx_policy_check() with the pas->generation
check.

The spec permits SPIs to be reused immediately after two rotations. So the
device could decrypt a packet with a SPI that is more than two rotations old
in that case, or if a previous packet is being replayed, for example.

2/ hardware offload. the solution to #1 should be able to be fully offloaded
to the device. psp tunnel mode will be hw offload only, and is implemented
in the eswitch with connect-x.

We could add a psp_gen flower match to replicate the pas->generation
check, but the device has no access to the pas and can't offload that.

Keeping track of the rx assoc means that the kernel can take action on the
"this assoc is now stale" event. Possibly by enumerating the tc rules and
either deleting them, or marking them stale for userspace to reap.

-Todd
