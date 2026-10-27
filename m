Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119855;
	b=bPC5Yjf3bm993HL82reY9KDJ3RAEMmaCXye/lgvl3m0gw2cIfzGf0u50l8vay3CdhSgp
	 pEaE7Rwsx4oFcwPDQOwLTtD5l/D7EV0xVBUTQhqtHxgZgqcvlkLXFZDdS/rHzlLqWd0hG
	 85Ze1jG5hOCZprHbj6iRoHSss7i50rtrvW6PFZvMnCqi+5UsuW0hDjatQalMw2+v3j1N1
	 YRZDnGVdORLEbFPBdymKg3pYHytau+t1j7aqz3KgAeREmbigxMK1L0iEX1nyH2WOY6Ex/
	 XJwbebl5UDIGDKqDuGDktqPoD+UcjXiPuRlacCG0WCzH5Vm8KrrBvGL3u98FQKFc5TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
	b=k3RlqZdYbiJi6YnFQNMqjFEKXJu8dkwim/mYv+OfK0Mc154od5iv19IIlD7dmVg5Nndm
	 Jjzev3/38HYlrvJBnyX632SA8iMQ2JaTNoF594i5AmauL4MntC0lsepJl2GD5qiWgzztS
	 3mnDw8TcK2N0RJpBJq8p3py1Ok1LJYG1KeTHjlswRWRaqzLYFmmdzDuiruogkLhaZ9dza
	 M4l6hI9PTAj/J9k2sIzoebc9K7HjHkR34NDD2gXdJd+61FXIr5ciwOpoCsUfLm0al1/mc
	 AAowfo3Gz5/88n4+IXZ7TlplAMAFv2XyhlG5in/Q5Wvtq4DplaXO3bUyWzZtCrpnLUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CvGazHpM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A94606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A94606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CvGazHpM
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDn0SG2145905
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:50:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=TNVT5SIENBU
	HIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=; b=CvGazHpM7r6oRX3bfZbviQcSr1N
	4E0Myd1oOxoHpURR8O3ygO/Dpk/n1BaOz19buAwlnVLr0933AuaeEvpDCFHFgYz6
	abeMKNuKfzjQowKx+jhyOIDNoHJxkAcx98V9472nirEz5YyvT0sbM7FfdvAjRys0
	myg9dJmXQEXflfKncql+ipZFqVziwE147BeO3Mf+MZRkZ85jYo0DUmrHYwzFSUTJ
	fuky37CemmmW6A5xNs+7SuYVHono0IQjLn09R2nqGqXdEjB/jtzeZIdsxjt0ZtxA
	1donqVG410NYAK6Gju6/OsKk5vwG5hhXUeThTDdEFiP5RIa1aM+2sYN+e0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hhdahqj7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:50:53 -0700 (PDT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e601800e58so76571405ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119853; cv=none;
        d=google.com; s=arc-20260327;
        b=CnUySd2y2akr3vpGChlYbvBKR1zqztTCj3mlBHDQBsA/E9wFuSWps8D6mQNgayWjcv
         krJGviNyexOSjtWzLv8iFKUWokbFoZifNM45ftEN52eT+iicyE/Pd7jI56GJtaXF1kud
         tgVy5kQOrHd9YL6iIcrBh7X1B3J/b05D+o/6XY6a/eVA+0lshfuOZ5qkdWCE7v3VI5V9
         gZBHthWVmgjP80jR45wlYxVbFiVvnjIYQUlI/Ad+Mra1uFgxCUi5iXVt4/6uC8H3SdLJ
         2Qayv45qHzVHQNA7Vs5gEqF8PP9xEv4D6xHrdV1W1X+hCvapavxsM7/J40NCZpepr/ED
         QAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
        fh=oFQKmTV3YJa1R+ZaNFMloXn3JdBQKqxqodgZEm5UAwY=;
        b=h/yeN8E9bucFKROg5JgM3QocsAZe/E3EO0YPOo/dyvpweowDp7MMkSbgDWJUKhqjI0
         4jdJ1tRSUYWxBuLkPLhRJYnwyYDDbk+C4JwT0S4xhh7w3YMzA1QQl2COv9G+rAWC0WVK
         UKUd59IravS1OasWPQnFXioUOVNM3RQwCMg7EG80/uO87DPFLMgP8hkjpNX9G+ix6ziI
         Lbbq2A3+iusIRYDX86l0oPPcr6xy+/PcBW8/oDxi/4C8NpGVWwTj31i95tpRgJMoLZro
         HQLyQx0vGBCsHTVx3jRIwJ1xfp8z0wL1lioSdrAaMgdACzbxuj6tBdTncaaUNPFbZRnM
         hX8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119853; x=1793724653;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TNVT5SIENBUHIp7NEAsmxJXryvr6yV5ijHD5gywhn5Q=;
        b=IaE7y+tqt0kL0QvRzfMp2I26tOW/FK8trqgxDg/wn9Pqv3N4wS8pKgQGzu4mOgo5nx
         ZuQt0fkqzfb/oriE483CFOGt+LgWuFPWjcnIYmgWTDeiQI8YVdd+m657qNMaDDG4unhS
         RDpEK/53ucqB+giPZaPDPe/qlYe1pZ4t030i9qB3cDXUdaFZZcFM1opoZvi3IZL3QpZO
         nLuZyVfoz3mKSnbEsoL7ScrZ3SeG+rxAJ83DBb7iL/ABDUrdkWnNMq0sAgZ9ombzTt9r
         xmpezY0pFt578wwdznPaEOyWuYaJEJ10+pIC/Vo43Y1Q5N7Q6Y8O4eAK5owefLGt5cVg
         IPXA==
X-Forwarded-Encrypted: i=1; AKwUvBwJCn6tVQEAJLwfGol7b1ZMoSUxXPX3WaOGZBQYb/bRyN0ghUXu6LfaUoQtqka3rjf7Q92WaIwo7ru23yM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn05aQaTIivwW1vP9Dh0Yi68nGDq3K2XIxHwvPN02YplCHkr0j
	q87N8/SmFWOWKAcn3VmXTJhbu3qS/v6q+YsWMqajctnkMTVKA4+R2ROG5XxKgWvatxfZiDcg0bl
	LudY+c7yEqLuqsZsLO4EPSW0bjAuHSS8wqzG5VEfHlLlFlPP3WSqG2+0Znw0XvlbDnefLLLLcQg
	VYscdzodK4hPNaFEmi4xa8B3nhybn30q20BNhyz7g=
X-Gm-Gg: AYBFou1UgQXjbQwN2VfCz3evdn93yFSEL9eVvMKhww9nGBY+65BHWdYFAuW6BlebjJ5
	VNQsM+6to9LrLcdwJOOBiU1yrCVw+EdECl566afip20WRS4VisnBnr9sz/xFLtshlrhfd2dHeDQ
	/pcnMAnDU+PJpT+l8wvBBXYh0WiObLzyG/C9cPOmpcbWQAOSuxxv+LkLHf6eHMWm5c/h/7rnyJP
	QGPOB1KmjzjwkBV8aKnmU8h/hkqzKGV
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id d9443c01a7336-2ea9c83f0acmr97399005ad.48.1793119852750;
        Tue, 27 Oct 2026 09:50:52 -0700 (PDT)
X-Received: by 2002:a17:903:2c0e:b0:2e2:c995:b00a with SMTP id
 d9443c01a7336-2ea9c83f0acmr97398875ad.48.1793119852321; Tue, 27 Oct 2026
 09:50:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-3-toddfreed@meta.com> <179288570143.3134.8925369868949382653@kernel.org>
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com> <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
In-Reply-To: <DMFQ63T8HLVV.3L1SY71TO7GHU@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 27 Oct 2026 09:50:41 -0700
X-Gm-Features: AclHuK-jcpXRH06paBbeGResR_5OkEC2X2pBFWTmfK1GHPn1XqyQ0qM4p7DKnUE
Message-ID: <CADh2yMyGdz8XR263w9PbMf+pM1MvNh015CUX69NdYCMfjFnv1Q@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, borisp@nvidia.com,
        saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
        mbloch@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NiBTYWx0ZWRfX0HBOlqiv4lFV
 mrUlEIlESaLYa0Ls1oBE0zdOJGX7mz1EAYrjKOU5ltLVDK3XjCyE0399uEgKUeLHRgEfrupctRd
 mrsj3hMXaYc5ufHL+orvkEkX/wjmciQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NiBTYWx0ZWRfX9Tslf1uBtsRb
 c/GJJ5uI9/onlFDX7CoBK2Y/lBaPh59gmnvXbRbz4H7yEpqg7yzS+EmtcxNqPDoaLXRpcnJ7CR/
 hChwmlIGsXe7ovNaVCOG9qxGU7rSDYbSDl+Kp0iUTJwc3bOSlHnaLEqmJ07brZN6btyHBrwLOiA
 tq8VZ79d+h7NVMXHr3dT1PMImTTJnTicDV3fflLBLh7bS3bzjQvPRn3qKG5uqG2QfgXxfFON/Di
 HofgR6EkQ/KzhEGUQk24EFWw6HMsQV7jJmzj/8W9siV/MbTfsEpwh+4Uxr+++YVqlA+tI9Po7/i
 nLZjomrB/pntzLHj6CyX+QrZYkxkE7Ai++NHAdMRMYUUHCinyXJ/Imk2I7m0t0ye1SUizkzNvSi
 MzOW3a1x0uhaPgNyKA7zrEgSZm654I/fL6oK868ROG5MxhMH1U/SruVvqMlvFlduZ0jWJWAQWf7
 Ed/N6F6sIPMlDLOPoTA==
X-Authority-Analysis: v=2.4 cv=CcWdd7rl c=1 sm=1 tr=0 ts=6ae0d66d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=YJpWPkmKExx_aQuJnOoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZdpnOHrpZoI4vILA3xx--SJvwtUHehGe
X-Proofpoint-ORIG-GUID: ZdpnOHrpZoI4vILA3xx--SJvwtUHehGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01

> >> Before this patch, all of these packets were dropped at the is_udp check.
> >> Forwarding the decrypted skb itself looks blocked by
> >> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
> >> dropping"). That leaves the ICMP error path as the open channel.
> >
> > Agree with this finding.
> >
> > Ok, this puts me back in mind of the approach in v0 of this series ; just drop
> > packets with extension headers. Actual support for extension headers can be
> > done separately from this fix.
> >
> > pw-bot: cr
> >
> > -Todd
>
> Like Jakub points out, this equally could affect tls offload. We need to
> be careful with any features that can result in device-decrypted data
> being sent back onto the network. Another gap that exists currently is
> xdp tx or redirect. That would also affect both PSP and TLS offload. I
> think we should try and make these features work with crypto offload,
> rather than building up more and more defensive checks.

Adding the skb->decrypted check on the ICMP path makes sense to me, as
a fix for this specific case. I am a little wary of fixing the known issues, and
missing some unknowns though.

-Todd
