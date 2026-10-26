Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793052357;
	b=A74e26ujdDHhBEYbPLsPqTtlKDfZAXqdwH8a+DQ2BqL3+JTGJLwK3+mTr7X7/29lwm/u
	 V3W7vavUF6n2gLUmLonZgnPWFGGCr4He8suIgnR+ZhAmIGtNBgpcekh3g3Fy4Dy8148sw
	 t5GOmytJxt73Ou9dLXpjWfkKOCwmBrzyjWn/gMXslTDmkmm5zmGlF7UsikcJNuyU/FNnn
	 htvd3iGVKyahcMsWMhNXOBKPhM0tyrntiJQi4HCKc+AVWMwr/5Q2HNxAhKMbqbCfvSjhw
	 DZgtcIr0UBIrcxbEDYTeTcq5F6ktZYta4SxvTEfJoFTDom5d/N4eLuNSNCz20U9GN1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
	b=bcowkBoq5hXvPUIjCQsaySli7784RX43K22yByUfvd2AGRX9NObQtcrWcI72ykqdRNYD
	 xYEcgYlNMByFEA3rn0JKxj7nV+eWxzDLUq610cKISLBKgDmanXQMg5k8w67l/8Xn6ft3Z
	 NdOi9jv4+XgevFtjf4/3DGT9YnYeYS8F1b1eBr5focRXn/l49XrxsYhnH5jwWkPFYHRIU
	 6q5LdZNU+V0mpa57tOPdEgrAt3t+Yd3QHxhdv7aRKxmaPS/oY8pYUSqnY0dQVhqJAo6tU
	 rNU7xfKR0zR2sLl0eP/RutHB16yUbFc/OY+0XMzatln/z1BD8EY5rrVMn/8NrOfhYpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hlKqV8Du;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28EA606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28EA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hlKqV8Du
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIn54K421065
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:05:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=z4nQTtfOhd8
	q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=; b=hlKqV8Dur4ZzUuKxTjP7YrMiIjt
	3ZsOzN/DdqCpY/o56SvMkVq3ZXuz+GA7bcM+/aPPz6SpoviGFTl/4hrkVTfjX05H
	0GT7EGWQj2EE0PEccBWYxiw+GhKrlLLc7J9afMut2vpHBX+bQM6qRxkTR5zRkbmX
	oSa5qK3hwZ9vkghNACrjtWY57rxM2wrBkf1P9KEau/9GkUYQ3XheuKXBd0gfttSu
	UqqqEN99t56wc+KwSZdPn/fNIq003oaGTjLV+M2+SjYPlgkNzqrgh9aTe+EnkyOZ
	1DqwCxNs9C1AFXQUxT8UomRIhtnGM9OfFoCNlDgfBKJ//xeeR05pvvDZU2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgt6bd41p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:05:55 -0700 (PDT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso36275415ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793052355; cv=none;
        d=google.com; s=arc-20260327;
        b=m5OuTsw9Xzm9C0/cLr+GLbBeVaHW9x2hGwfv1VyOUMF6LFWuokTNQdR16jRlW/uFVg
         tcVJMSXU95F3GtkS9oOmJ2P81q4JF6q2YOT82hqvnKL2OTwko8e7t8NYEjrcmTcscTdj
         FhQplNzPHaaxZXD09G7aqwk5uhN+sq55nZtKiR98XQi0F+Y1NkR3ytpO86wpu7GP9+yM
         EGGOpnhciXlIg+33BI4ME89KNwRObhL4TWXjZ99svfibnrdERtokUwoHA6zrukPRej1S
         2dHAf/1l4o6GCS71aO2Mm7Of0pj32vAFpq+R7QLmhNO4RbZ9s1uMwzdpZG++HzPScajG
         jqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
        fh=sTG3cND4670z3eF12AgD4q77vwY2K6ZQrZI6fBnhzDE=;
        b=GECIa5hIuBqZfmURXKe3+y7cSKCxFJOz5qJGbBDfcLw1CkgGuIrM3labYyR8c9G7R6
         ReSGdOmA9JCnM9MsMNZcYKuf3X1S6zvqprW69NGxxGU5MaRw14CWFxc+++x0Z4LQjNp5
         cYrzNCpQFcrIbrxGRqtFE37RVreGKVbCUGy6nMcpAj2+njQCI7/mBCeP3EdHIv09fR0y
         KxJJOoxCd1yATcKciXg3vEBNco0f4sIwS3QP0vt8kGHbOtJNuInCmM0OyNpOFDcfusMy
         oytAoHG0pnlQdhQ6WNPV8XZQVkZwHMQIl0fUV1YiAxEOl88UxYdRczjC4zUjl/z0NBp9
         WXrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052355; x=1793657155;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
        b=wI8n5wvS1O9SWyMyB8fPugSEZPZoeM7PkVJhlJM/5RxMkDVrgZIAokCr8zPpCamDb6
         tx9LNFayxC09Bfui1ebLqku1L/3y2BA9JKiAPlgcf+cuyCwlNsIuQ6b3J2HFdNIFieE6
         dqBg8Z+nPhf2WvdctMn5nHK4Y3m2OrhTu3ElVHiXgYzRwCPsmDmHZo66DY853mXVlDnA
         Vf1GdDTeZyCVv3A0PgSzUH49sqH3p65FWANFI6njAMQzMm0Vkkgt0X6VDkIQ1gvep2xQ
         Ovg11HDvb4hIY6lajtQxYC50dK0Li91U1IE1mxSkSA+NqTILtRmZmaZltAh4BWNPXG6j
         mwwA==
X-Forwarded-Encrypted: i=1; AKwUvByPubGLPUlWL+BcgttjvLpJO4RhkUHWHQXqnKF0YOw8ZFlZToqlQDzVv/SPrbiCthONhT1gjQ7DLAGvF+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3EVrs3q92+1kGUyMNBfAG4+zpUdQfRRcWfudMZBZ/XLxIzFlW
	7KSPMsybxRD759Yrmr+kUsjnucyO0uY4RrQ0prd1lVmWZ4n3mMAzC/7mrVEBz5ZgkUg3JCwuEks
	TSTLX5S1Y/2TzgILX+T5LoohT6lbstCgxW32e/olrFWS/QioD/EFEkqDtfBU9zZepY/Rb7JE4D6
	I/IqhawMMrhBCDzCfVscL7zav8dkmiioOR6ob5n4hvFytALNg9Bn5s
X-Gm-Gg: AYBFou190pXvnBXuRvVfcwnUhkrWSmHqP8HVJEV8tLkQtFzoPAaUf2quRHHXVBm/+tB
	UJMMtniXc/SsEUNpKiu/xfbAkf8f+rDKhFWLJuRacI7JDWdLMXJukE0pIn8rzZesO2sr8/49dNt
	JNmfmT2yQWv/tLiWVjHzf8K5hgLLJGzpqjszTSENOPwW2sLce1cYV7F26Axf+KBQcj6Tk0MkTYz
	WexaIiprrZuypDS5x5c3tNiGHWhvLAAxd5dNKQtdcmq/uEzAJQ=
X-Received: by 2002:a17:903:fa8:b0:2e8:3d48:4d80 with SMTP id d9443c01a7336-2ea9c695516mr62602545ad.45.1793052354619;
        Mon, 26 Oct 2026 15:05:54 -0700 (PDT)
X-Received: by 2002:a17:903:fa8:b0:2e8:3d48:4d80 with SMTP id
 d9443c01a7336-2ea9c695516mr62601855ad.45.1793052353322; Mon, 26 Oct 2026
 15:05:53 -0700 (PDT)
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
In-Reply-To: <179288570143.3134.8925369868949382653@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 26 Oct 2026 15:05:42 -0700
X-Gm-Features: AclHuK8vmHsUIvz0IY0SMdSvsvG63AqCObkQ1uaVFzRtYuR6y8WvmQn7TcpGKDc
Message-ID: <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, borisp@nvidia.com, saeedm@nvidia.com,
        leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, daniel.zahka@gmail.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX2ArAIxdvqU++
 oqfyeqSmgivwxxyPPOrng3xJ5pUHSOJY6LQICfnThvsb4wsHsS61tY1I6NMQS/I6kWkSXqZroFH
 ddCYdHv/5KY1Vm74ZpiN8MfIrJBVV+E=
X-Proofpoint-GUID: 1XHymCI6Q5dHPT9enaEZ6hp8-Mp2XMY0
X-Proofpoint-ORIG-GUID: 1XHymCI6Q5dHPT9enaEZ6hp8-Mp2XMY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX463Gu2amzxe/
 8YiAWtGKB7A/WVYVydGYnnNBvJ+q/fnX/k8wH4zRZJWCEOC5RxAbYiONhhDdfc6DTjBWnRJcWJx
 mcU03UzDcPkNJWhm7ZiQRgLsE2JTgVwlU0/22953gSfnDZyHWvkjPTC9iDV3iq3wiZdYp3QL+jZ
 Tb37gvbDEIaqJs3uDJhBddVjssFVIctrDhSyC/29dfx7o6uh8K6yb2N8yb8qx1mac0kcBx1fesr
 8Xl4g167AFyrqS2gSWzg6xoACVHd2KQg6oQiGlQaA6MN8ZH5HbRh/xhfwosY9IPbHdMubwFyzNl
 OaQw8QYKpRoNYryYBYnSEgZ6m9cSH316OfB//UXQRjJ+nrlo4y88xSJt5fR+QfKMdxhy0ilkDIR
 G4eaPidUm9PNmiHLUNvwKBXnKYFSsmvRnMP8cMmL6fCTYOjgQOQOwuX4hs/MuPbchSxEwnOX5Zz
 iVrh0YLGv09TbooaMfg==
X-Authority-Analysis: v=2.4 cv=XOKl2ghE c=1 sm=1 tr=0 ts=6adfcec3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=Pwd9bqppP3xQxChDgmkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01

> [Severity: High]
>
> The PSP ICV doesn't cover the outer IPv6 header or its extension headers.
> An on-path attacker could take a captured PSP packet, insert one of these
> headers, and set saddr to an address they control. This assumes the
> device authenticates such packets, which this patch's premise implies.
>
> Several of those handlers reply with an ICMPv6 error that quotes the
> packet. With default sysctls, this happens for an unrecognized routing
> header type (type 0, for example) with segments_left != 0:
>
> Before this patch, all of these packets were dropped at the is_udp check.
> Forwarding the decrypted skb itself looks blocked by
> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
> dropping"). That leaves the ICMP error path as the open channel.

Agree with this finding.

Ok, this puts me back in mind of the approach in v0 of this series ; just drop
packets with extension headers. Actual support for extension headers can be
done separately from this fix.

pw-bot: cr

-Todd
