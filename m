Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869071;
	b=gSW3peFHxnn21ABXUVuMHhniUXJQ1ZXwpV7xxsw7IZxeFqu+nUdgihOzKbeforAda87u
	 fyBcoFrSzL7jdyWj3YvwFaKA6gMjfNZfjVjCtcDLR+N3acl5fPa2H/9EictZLOQQCeDW1
	 7dcmDrwwDv98tVdi2s3PZNAea/cRyiNoyvxverPM/QtrnqWaf1XV2tUgcxBz0x7CMTYhN
	 MTZ8BhF2VteNdnASNInaF8ZYxcwP8+/wXQBDD/+gk82Lf8zFf3cQq6vwXMSgjfCvMm9vX
	 ZDeJeu5yROgi3ax/wMf8h26uhMPWpyY/y7MriAw9ly5vbDzyrCIXOf7c9sgsYruRqPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
	b=0ee0EEdm3L9Z/x9FL9Ll/4x5fCW12P0Ul7ENncCpKYP4+wd1vz/X0EwsP133YcnLT6hF
	 2pCxHE4AFpuVNPwi84MtKiom12opFYFi0m69sGuAK0YxZoGDD4ZnbuRRamYHiTULrbwkk
	 ThxPLfYMIyWBCO5mNDjJVZm3RRvJqMV4MxZjXhE0yva2qABE6q6hWJ4PpNFopUbrT5uGz
	 pcqSAT6s7qXhOb9GyF0D3jcOQSet/TSwPtP842Goxo+UNIhRGr7575cEFxjvxfXR4Jqxt
	 X9KBWz8R1oy73XzZ60DnVF86n61/to36fc0FFW8miagjqt+D8BJBU5RRBPL8ON8Kx9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07780606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07780606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM2SLI2377739
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=INFJK33SIHc
	1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=; b=ZJmfX2kjDA9mCjYcEWXG21PTCxY
	8pWD9UYuB9/bEG5X/xJVrB7ctZo2WbDuUjwXqZN3+bkGuZDmJv8214nAWTMtQ+dF
	EoI5wPI5PMoO98C8N04f++csqKd3F+A8ZyXCtsrvB9CX4ebP1BEIKISJ7grh/bAF
	evs5i5HpMFVgZ3xEOielhYwTCuuuvPuWvAnkRjfbFotfYsFR51PuABFfXlJNmB88
	gygC/1iFR5c5vLvxmk7JV8xiL51kXKt6U0eR2g1wtGkSGGqkxbI0OfXNP6SbH5En
	/iokbf7NAOZVM08CXbqZdAER5ibv5CdFVRdGagVtkULlPJVLeQH8rBW3ApA==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya3p9wv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:44:29 -0800 (PST)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so23921495e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869068; cv=none;
        d=google.com; s=arc-20260327;
        b=d594Eb9MSySJ9eDuvWwAVO/NbZhWjKjJBgk9q3a35AEf271x0TuN/hpm0PbTkWbisP
         03YOK4l1xsl8mKbqe/cOvYODNe55d2fu0xY0Es3uYv/Py2GmYl85SqL1aL73dDZpYpNI
         Sdw5TT/ypkya7lyjwNZ1z8nj52zwSfYFFAxhSmE+Aaz9l4RgqECnU6CM3rWzZEY+VutX
         YpZSeMy3jxasqfZl9Kxj3fMnM6e9bKvEVRNe5z4eqWtiN6ubms2ZwIQXQT/uCQsP/j97
         ew938I7jyllX3Cqd4AB3Es4xtlPPQvEBVse9j2M6pPpWM1Dt1rXERUM/6EaV+8RfPkyG
         Nblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        fh=G9DR6PV92/l6uQmY36uAosmYpVujdgIyDhVjBR57aYE=;
        b=gASt+fXHemx8zvYqk4OJzjg61Uj1lz/xajUMEKQq2lPsBQwQ5EGsOviPn6zszH4To9
         mikfHJzmy7dhsZCUe41Mm1nip6s1MnFUg/n/w4Du7PVSY5KhcQF69pmASJDi61bhoGtV
         WyVZfu/Skb+U/YGHlhSeUpUF/z0HtDjMRSSuBIy+y3yFYvztUgfXMHBe0aqbpnNgg+1Q
         WlPSBpDaEVJXLp36s3oMH3zIOPp6OkYiBKYLP9t0EdAhptsb22p4Y5kg1UU/ew1Xnd68
         yIQvYfVE7U1jeHCEGihPthacbjn9HItsBiAKHQKGGXn3mlABAJwIxnZBDQ7MKAXpT1uC
         wRvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869068; x=1795473868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        b=Km9ffuzQ/shaK2/+4/sfifFQuo318DYPHMRQlWhDJPq06LgpBq1xu+bC5amUKuU0/2
         EDmPuNzwXYVaaLvGlt8igOUgHp+kQEsx+QkiIulV5vttcgSFz+8oane50fNnW+/gdKvl
         X36zrtm91BCNY1YvP7Ms7z/J1hHXxW11Dk3uh1BlwQD+JYXxiCyKggBs67bOGJ7EDD3h
         lPjvgeycpABuLODliLoECESNDKQQbfJFNj/Z/D3t0RTnRxrfHlyvQ4qMyopyifWXIrM7
         fqOrH3iPu7SOFB+akOrNh2QOJhtfH5pJDsc/UNheOH9y5lihXPfyeXIwxiW7NF/t8l6H
         N0gQ==
X-Forwarded-Encrypted: i=1; AL+hErFQKp0Jik21aR06C2M/8iIRJ9KEaRbm1YfopdD6me/h0wPeWA88TkqTvBMtLpg/iCSJlKbLa5NxC57ABhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NxZ9Jcrlzwlr7NCiMQUFtPKXkn4p/sp5332mT6g/hI33NUMjw
	Nuh1XyIr/3G/feRj6Zpz13IJ580TFjar06bhdduSi0lGE+GLpNdsyfGqm1MtoYZBPkeEjYSQsQy
	empCUBMGqXodLHj+He+0lVJUedd3iBG+OuegQp88sSkDEqtiVYMDZFecIqXsyBdqGGAr0R6MY0x
	0fg5N7nhoz86yRxxpDIzqKjaeaSxcb46UEgIfRb9I=
X-Gm-Gg: AYBFou1jyEexHu+fdsdQM4EM3WkFYk6KP8jBVSr3vANr8A/LuB0b8Dbv89Hzdk+5SxN
	xeElpW5QNhWrbHjp7VW063IdMVlUhCf3DN6x8qUDiZt/IYdA0IfWWy6tEj3AoL0jB0BT205JMGs
	WDz3Jfo5I0h6Apxq50tksw4SkEvIUXRG9nTmVW5JTD2M2X1zYUMrTB87yXJSRpdJpuhms5PPBaH
	jpmqhPHqTYSK610cnz3D9tv3sUgbooNwPaxHgnr+n8O7Wu7ilw=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr192032195e9.26.1794869068629;
        Mon, 16 Nov 2026 14:44:28 -0800 (PST)
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id
 5b1f17b1804b1-4bb5de1f262mr192031935e9.26.1794869068266; Mon, 16 Nov 2026
 14:44:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-1-toddfreed@meta.com> <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
In-Reply-To: <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 14:44:16 -0800
X-Gm-Features: Aa3M54rDJg770IRtFuGEuQTK9_ahFKlOSCDnmFon8USiCtNTDEcNPoAY-z-nWxY
Message-ID: <CADh2yMyLkoDMQL4pQphobvbBcjtojArW8URXz-7qtr68UvjQ+w@mail.gmail.com>
Subject: Re: [PATCH net v5 0/8] psp, tls: don't send offloaded contents in cleartext
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        David Ahern <dsahern@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>,
        Eric Dumazet <edumazet@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfXwoG9yQWqmIP6
 PXvjI7YBuTo8hd3etotdTeF69HaZyXF/m+dQCTqzcY0TTD19Dv1kUNVcBpfJoFpM/zZWC7rUMv2
 OtskXTAIO6Of6SL30m7Eda/LbK0bUMg=
X-Authority-Analysis: v=2.4 cv=YK8KWhGx c=1 sm=1 tr=0 ts=6afb874d cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=eugDcP6XFwV9FTUBbroA:9 a=QEXdDO2ut3YA:10 a=cZgK7WzY9ta9U-6s7oqD:22
X-Proofpoint-GUID: OpTNNB2ZgtidY1sZowvEmTfTuWaE9awm
X-Proofpoint-ORIG-GUID: OpTNNB2ZgtidY1sZowvEmTfTuWaE9awm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX4JFMc3tfiAVb
 ujvSQp5EBIbxznv7/D+pR4pQlntvyMErAgUAARbP7K89/LcqF8AstvOaWlkLcvQJWp9TiCDx9DM
 e9WdOPG4nDGbr5hlb2gLhXcQOXaolmwePiOpMqbXxh2wWSbOG922CJee95N4cptzxwtn/R3jx8b
 rpMBQgv3X/1KXOgEW/RTEyYALQfQmOmI6srJOlxZm4wj3cSIC4b+qDriQXjvOhLu7gIyBCwoFYD
 ZePycB90GP5JLqIdGHKUdkU8JrspslGQc440/EkcTGDxYNLOgEr5aR+s0OSVgD0IIk4/vdJ4oQn
 GHnQH5QfLOJfJzjAltmixjQfon/7bM79DCHOmzZ+fqtrE5YIprUv0AUI7T/qEbNY9T/C5u5XZEL
 pkaO+IsHmnaGX8DfGHw65TTgD7S9DvJoxGkimoypFoFFUj9pShoiuWJw174Euae42WjVUwpwJ7C
 3TTOCuzzAlSTgtqnneQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> > v5:
> >  - ipv6 extension headers: drop them in psp_dev_encapsulate() again,
> >    instead of in mlx5e. it's the helper which can't encapsulate them,
> >    for every driver (netdevsim sent them malformed). unlike the routing
> >    header rejection in v2, this isn't a device limitation
>
> Can you elaborate on this? You're saying encapsulating with the
> extension headers present was working for mlx5, but not netdevsim?

With ipv6 extension headers, both netdevsim and mlx5 send a
malformed packet. mlx5 also sends that packet unencrypted.

In v4, I had moved the drop from the helper into mlx5, because
"sends the packet unencrypted" pertains to that driver specifically.

Sashiko pointed out (High finding) that the "crafts a malformed packet"
behavior is in the shared helper. So I moved the fix back into the
helper for v5.

The routing header limitation I mentioned there (which was limited to the
mlx5 driver) is fixed by patch 8 in v5 ("net/mlx5e: psp: tso: replace only
the length in checksum seed")

-Todd
