Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849659;
	b=SLvEnYoaV5EBDZ2/OJdPEtuT+P4TOCBlvY9YR7m7PKX1fTslhxE7KRjh2WOe50k/LBJe
	 6YXmbGTer7LWUa3c//Y957w3+A3bCnVwOKGCCnVgOsDA1REO+ZjksN4I3C2W1oENFZs44
	 DdYZSiEofnaVM5SMbmmlScSIjzOuSTG3EzSIQdKUcUGT/7IYA7gBBsB9zx9YihnJrJGdV
	 jdIRta35oeOFTwtnvYEJYUyFV/h6heR1fag8SBnuhr9A15bOlJ0/gZcFabm7q/5AZut2c
	 r5SAs86OLRpq8rplG6Q0Hu2ai6gchMKls4H/o93meJy6thAqg4WqFUffcDN6X3LxmGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
	b=BUnVXavl6/Xb9A9TwAJIaZW+AQnX5AeaReSUyZYzIS1hgzUfrM8V4NI3JS1f3ZjS3VPb
	 vmldgHG708nRf2oSQ8dhCUvPo+ndWIX4lw7mkH5MdfIPCGZtG1XM6Fg0E/de6IRteykDn
	 Ztc3PdaOiY+w3937kUd2/mVEs8fMzXOfsnIdWIMcvV2495g597uUUk4lwJaWGvgvnFSbZ
	 OqmypQ+EwJ0aabdXPWDAIPt2uwUxDeJ+eGDFb9ey7AEn1xIzu6q0yAdx50JfAPAvrkTm/
	 lUcnPQ337Nj3o/oJt1yFKCQPqsl9/zl/V4eUQXcVN6PIFPkJyAHYgI+u97I3U8HeCcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dNwnu/jo";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1D606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC1D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNwnu/jo
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4529770eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849658; x=1795454458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
        b=dNwnu/joVaVELGNto0fGpdCZhLuN5PZkpjRORj23psOL9f0WuiwRP7mNVRgwOPmDaF
         TIeHl7tWilPekWtgBIf6qUDDThmcaaa2VMiCgNM+xmp5vYZjVfXsuW/hgAJuBt6R1D1W
         x+RQ9M0/K3ZqkT/sSZJjzR60P21gM7xxkQ6OPlgPNacCDCKtIIrcDFn5QDsdnseo3lnT
         xO6Eq7dcvT3Qjrr2SGxRY/kYmvVxr/k/Y6E7BPolMTvc3CFBwtepOb3mF4fI7fSJ/uRR
         7qfwhMLMZBoG+w0sHSk1moATezLcUQadCzixONf2u437Tt4wDK4QixV3mcki3+2NOQd0
         uLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849658; x=1795454458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
        b=EXrKKh3snoUBGV1VbgJF9z3FJdGlkpgfN8x6lUDhBFLSwdqhGg8Ec4y7vTFs2yTOUU
         h7bHUKkwkL+sjiWEOu4aDLa8x7DhK3d0OK16XiFwONQHV7nbliIY6t5//XyL3g2BT+Gl
         A76EI85JuilahDrhpj09TBZLZTp6h85yTJOQjV/P/zAw+eL9wWwreN9yEKZnvAdU1p54
         2k8s8yajruG0ct8IkARgVC2HI5JgsTAhD1bWn9+oRNdk0MaqtKeHwhLkz3InGgchwVEM
         64sCTmTTdfcB91BgMH2SLFeLJPShE4pAA/LpZ2lvx8nP1uyU81UbjLXtQwzmyaetN1a7
         bcAg==
X-Forwarded-Encrypted: i=1; AL+hErED+NOFaNExCC3J77Q/AbA2t4NDroTIjQf8q2zW+bfuXGlMraXAiWgaQkthyu9x2XuQh4nqBFfA0jOVI7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LvWEAk8v4z1rzTkjjZEgJ7s8QyiblpUp+pyi5QWQohI6WYTCG
	XX1EBtWPVJ5VYCytboaG+0iGaYBE9V22cozyV09o/cQvc7mvPJeL3O/W
X-Gm-Gg: AYBFou0kQVM4tnQCut8VZnkzRkg2K5+9v8NavElQMxhWHyifOdmmPAfutGlEuXktCG6
	FJckYxU3hRVaLQwFIXzSdn0BD5dZuo9EU35V8AFwx6G2zl90q9DJb33Nzy3DIpPzpM+T6mE910s
	8QpToepcaWtdtHDmMjfrdJWta0C2NzoyCuOYXwlGozn1AcLZhKFknE/2P+agqR/zHFi/fdu1tzK
	MFqb0iqX5mscGRBcmPhR/IVgYy6SLMlwlygxXP8fHdrQvFE8Dfj7ArqPFalpZhbSvLB3joEynWG
	NJWI+HCFw40a8I6Gg4oYws0xhk3klhMFt7X+7GtfSaTvi1r4uW8nF8Jwl3Lbkead5LxmLk69hZe
	Y/i2Yugofp3JIq2SwaM2ZikoTq8tMFalJXgkNNDRKPNOyxSZqU2yQZvjmgWOTlEicO/WWnftE/N
	GsmUIjPKnZOUkNtFOAl0IL6eeelMXonEbh3d6hoPwZlpBcsYwfNjoCPlAkB7gTRPGV+ZDiEyaRV
	DKKiJj5m16Hod8rGsEXS9XD6852r/ZzWS3t9ovQaAlh5WYHwfq81fZHx6/MBDLzL2bbLV2XjQFw
	D2CP5ZPbr120unVJC1e396LwuOrCfHsGfhea+H35HnVwU03loPkOJdxP/4cZ6mpuBLED1sYFi1i
	fkRxyX12X8Q4jF65+PUonuAMKmIXUrQnTB0vmwkRbJp976XzexGpK43K4AQH2E6KlX2Roecyz5g
	==
X-Received: by 2002:a05:7300:ff46:b0:37b:c89d:1d56 with SMTP id 5a478bee46e88-37bc89d354bmr5111846eec.12.1794849657236;
        Mon, 16 Nov 2026 09:20:57 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm65024837eec.21.2026.11.16.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:20:56 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 17:20:49 +0000
Message-Id: <20261116172049.1617873-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179482223865.3136.3369549991780791717@kernel.org>
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com> <179482223865.3136.3369549991780791717@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 09:43:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The fix still lets a socket become a member of a multicast
>   group ID that no family owns.

This race is not new. It was there before this patch, also for groups
with GENL_MCAST_CAP_*. This patch does not fix it, and the commit
message says so. It needs a privileged module unload at the same time
as the join.

I can send a separate fix for net-next if needed.

> - [Low] The patch changes how the reserved, uAPI-exported static
>   multicast group IDs behave, and nothing a uAPI consumer would read...

Agreed. v7 updates the comments on the static IDs and on
NET_DM_GRP_ALERT to say they can be joined only after the family is
registered:
https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/

Thanks,
Anil
