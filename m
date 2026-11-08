Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136716;
	b=MYQBnMEYzCTycCLO6NGJvazo5zDgqlOc9wyreNjBC+w6Ev1OjG6N7tbyzp6zhYuS1jhn
	 J8VMHUUyiHdYhKBqCDm30xfyYxgeUodCVEBSKMcMuMGT81Z6YicyMlrLltsUbLTYORlNu
	 +0fuM3JSyO2fLlx/s8+j97d153ku0qiKnBCHVXVRisgS+6d6wd5kqFIVePUC+MDK2c2XH
	 Fdbv+Xbvt2c2OvXRcoGxLqMxVNOMqVdr2PZWpcJTo/DIHD1jk0IL5og4PXQQWfn7Rrtu7
	 ettHHMs46hFeq/yEsDBplbeWWI8ZYikcoOQ26bw32EDkDIuy4Jus0fr9vpZTMuKStoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GFsYetGjQGfqyMGoMWETXho8ORP/Lahdw6Uraq41F9A=;
	b=nethY+xTLyDcH+9bz07ShQIOkuOmjAfkT72txaw0KBMIFBRM5ttlFUl5sctyYvIcp1+I
	 cLHAllecMdAwRFisKSs+Bmy+MraxYiLwNKxvctEK59aCVGYtHWHFAvZ4fKR11jCslIZYi
	 8kQIzgVsdi2AzG5lWaMvL5i0OaDEGcECgjY21ir5RUNgoXY/OOFr7qevLXYa5CVLlDGAp
	 a4qQQan06GH9UH5q1f3EXKSwVFUKEzwlhEK0XuWQdbOM3T6Z2w+UtH4akcBYlkLoq1S/z
	 +dsp/nWZLck0R4NckyemoKH4jNBQhYHEOgoKO/2nLWIdc6CqzTIETK822cWKdxMvLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EJnjOekE;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917F606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B917F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EJnjOekE
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so111950c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794136713; x=1794741513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFsYetGjQGfqyMGoMWETXho8ORP/Lahdw6Uraq41F9A=;
        b=EJnjOekExMq+4XmCNDBgz8AvVL2Qyl/i2Lo1WR48gl6hs9cQXZzHDQ1HapMXFjF9kg
         CoWyta09y4OCZXpJ1mCMFiHQCHpxRgeO1BPT4fQo9F4HK5xVnbRZfQ1u75Df10xFHntL
         qKJvJDRq0PGo7Af196CHJ5IxuV4G8r1eq6+fJMI1l9wAciNP5ilv2Sf0PSZQoA/061tE
         Mc8DOjlRE7/X6Hirj2CZ5tLASWT8l7h1yVhcHydsQRDvUcE/8ioh+S1Dv9FPvtVKvhUM
         L81Dka+AVaT9V00BM5BBT/iwQEFM/WKWQMGpYprg89dAM7cXT3qn92RmeWeCWpOkeBHS
         /z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136713; x=1794741513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFsYetGjQGfqyMGoMWETXho8ORP/Lahdw6Uraq41F9A=;
        b=BiH/dNrQ/2Li8eYAyW9PnTIsHrf93rTMsAWx7pxkwh0u6BxIQx1eLj3SsO+uT2FLkP
         HS3iuVa6Dntk+QY241/jjJoMgFdVXWPrraRnIBFVsH8eijJkxXsPp1eilGDkdvyyBARn
         gmoUwYfdJNjrdxo5pyP0FMpekvDN3kfoA6DrvyCILepW/F5Zck/D5YZlRPqu5270cfeH
         /7bwQ/Au8dtYmizum+zG1BR5EzQuIv+sRG8QHaaJvVvsdjbznTgMAcHMsM8F7WZLrvAo
         OlzTRd6YbPO3W55bGsz4k5HUzmwv1FvwjmYMeq474qyhZJskKK2BhNlTFv4jtW5NAeED
         FX9g==
X-Forwarded-Encrypted: i=1; AL+hErHl6HOxN4lw0ogwcdciLt4GJUuCrY5OBJI74m0M5MYpgdCTA20EhHcAT0n163Q/+w8bIHQeYafeYJFdZgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ITFDLcj27aMTqcYfvmZtprzvK0k/v1zKtEMJDmqhV6ChTyH9j
	J79epLWYY6A7RoWCaOOxZhKy8v2hw+Qr2sEozOsMIym/GYvmG87aMFo5WvZJmH/0eVM=
X-Gm-Gg: AYBFou148tAqEcZNaSbhAmoPa3AAEa2hP3d8AcHD3dAZkitUP3mkNR7Hzlz/rm3A6ur
	lMzdlJLVVpXfOBUj2zx4Mb60PpHPArCABZ4xzpdaZKUHh6hCdROMtdpqfnL9VVSGRQ5HMSg+5vS
	baZQmdG96zfOel40Spb4zUxW40qOwQl7kh5+l3cRzgMYml5bTur0HgiHT4SDdX4NdRL53XcOfhM
	l1aQ4vzZMKoIXGKkZQDWiT4S790WvYAI3Akjb4lIp+JelJm0POx9m03+BSymWJ/nuK14PAkp0Lj
	HJqTI4Dp9cKB+5dYVXw3Xhq6o+OabJjNxKbwpPUv/U3EYJUwtWBuX9OpCT2GjaUsDWluUSFloiJ
	ZGZ153hrvLo6152hrgVp48yx/AhAqpeWoOpawdQrem0aHMe956LavScULktmm970VsuA/6Nw09u
	hrPCZclhgHP3pdqCIRdEnnxZMMdzPqEAZUXuO35O6YILqj4DP1aBfC+J3Jb+EWDAKr4HwZbz/hq
	LmanN9JJmXlREhuhj1vgj76T3AokDjBtVG4AwdPddELh/WMsHsjjiz8VcFLvQiaoZENpIqrx06h
	nDrB99BCUtIu5JI1BbQLmPdmz4ubaDj17k3jaQC2p69UeVueAvFxXoBTNa0du6/nrsjpN3u2vo+
	zdcA6q428MiwIhT9cdeN0iZDn73atesiNEOuE5A==
X-Received: by 2002:a05:7022:2209:b0:1b3:2692:2274 with SMTP id a92af1059eb24-1b39ff060a8mr2675802c88.40.1794136713408;
        Sun, 08 Nov 2026 03:18:33 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:9c49:6b89:2201:42e8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm4582119c88.15.2026.11.08.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:18:32 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: netdev-bot+sashiko@kernel.org
Cc: joshwash@google.com,
	hramamurthy@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	willemb@google.com,
	pkaligineedi@google.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net] gve: bound the device reported rule count in the flow rules query
Date: Sun,  8 Nov 2026 20:18:23 +0900
Message-ID: <20261108111823.2803947-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179411928865.994134.15713036918131150201@kernel.org>
References: <20261104061329.1881388-1-yhlee@isslab.korea.ac.kr> <179411928865.994134.15713036918131150201@kernel.org>
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

> Could the commit message also
> mention the write overflow for more than 1024 ids and the multiply wrap on
> both paths?

All three points are correct.  1025 or more ids overrun the 4096 byte
rule_ids_cache, and 1 << 29 rules or 1 << 30 ids wrap rule_info_len to zero
while the count still reaches ETHTOOL_GRXCLSRULE and ETHTOOL_GRXCLSRLALL,
neither of which needs CAP_NET_ADMIN.  The bound in this patch rejects all
of them; only the description falls short.  I can send a v2 with it
corrected if the maintainers want one.

KUnit under KASAN, harness not in the patch: a bad count from the device is
a 4136 byte write into the 4048 byte rules_cache at 47 rules and a 4100 byte
write into the 4096 byte rule_ids_cache at 1025 ids; both are -EINVAL with
the patch.

> does gve_adminq_process_rss_query() in gve_adminq.c need the same kind of
> bound?

Yes, sent separately:
https://lore.kernel.org/all/20261104070041.1902653-1-yhlee@isslab.korea.ac.kr/

Yehyeong
