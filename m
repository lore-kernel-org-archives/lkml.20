Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660493;
	b=2P4+N22esHVDQvEuUFM/a8WUVlpDH99fMIx591AGOdtF/JTKGxlww/QtDzjtrkvO/r+4
	 9tWCn+Q7UAs1Zy+pethe90Hxa2i8vBpMrvpIZWW78PXwqvAe+n87F7EcZC/DdiDK1SmNk
	 wubp2hXWjV0XX22GXrnmfH9mHWVBMZRqb9VmG53qTJMfbhnZ5IHEfiH2ufEeCd8LN69c3
	 C+zduN8eGhfGHmQYtITSfpBAYkvJFN0Ssv09kiDccwxM9bkx47DQTqXST7lSRQy8ulFZp
	 w9TCSmh5ff3uc6KZXgGXTihrh6U7BgPO08BiMyYKRZTqBYIkEGI938FpvFGvjfb/shQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fUpHgJn4/5UVMTDClUybGN+1JsPzSxgZqen/j5U67+4=;
	b=D8recAACBGCKTuT7opfjM/GGUvRFZazPygLBmm6CBX+IUvjErceW68G8UzKj9sS91GkI
	 0WsHA2CdMTqBxy9PFAFqW/iNdTg+nKS/qqYyVQ6FTuZu1vKs4er3oclewXPwHYD3QzTa5
	 DBTQ8zCkT5WRFfINkhP65XLZc9o5UCJaM8mESlpMCqSZSbFz0xAQrtRCEJ3vtfi1mApj4
	 tG26FtxBGWILdngdNhYDKtsXrf/FHH7jp3E88r0ia43HSYYog8FJmWwdnwyLTuhIWD3/p
	 2ua+JD2d3UMcOZczzHpXp5mOGLba3KzcU/9tHsAGNJx9Sfzz0R4jJ1s9t2Izz86TDZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPLZIOW9;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC4606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DEC4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OPLZIOW9
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso2882852eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660492; x=1793265292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUpHgJn4/5UVMTDClUybGN+1JsPzSxgZqen/j5U67+4=;
        b=OPLZIOW9Y86Du66N6PpGEv2rrXIzo7DC/u9Rtm6Goq4g8e31ID2NCNFY9uCn8zHX5J
         Q3K5fWA5s0/tnaqEN3SpmOPRI6/JUnFxozHd9kPO+KkFLynHq0zP1eQLl4DJPMzNVvGI
         Mlx9R3Q6rQaW3ImGGmJ9TpMeeHMQMsKk73KGnldSxUjjlSp33RHeCqLJsAgzqOBchuTH
         8wO1IKtg55FCfnS4Em09lrDnlxtmQjG25v6RQ8z1EtCIAEowcyPQXycahSZW4h0O+Bv2
         17+tSg8bwfG+Arr+nGReidwwtIJwrsqMN8qXnKZxzXgdOLsVzsPunysI/Tr0mTYbHSmK
         AbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660492; x=1793265292;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fUpHgJn4/5UVMTDClUybGN+1JsPzSxgZqen/j5U67+4=;
        b=r7PVKgtu0Q1HpYIpU7BbjGWmbmS/rtAnAF2VbDup6WznDUIQGTzC4M8+LV0RP/hFhX
         zxxR8Z0mlOlzrYTcNuU/mwAqGxpRosQ9kk7PRtIpM+xet+nqot6V1CJG76mapKohUTjn
         Tnw9dx4FEeHfNyTAIxDVZeI1dIWgJgnzPW3GxmbHavMK8gR0aRijoAoe5ZXdbRiKkr1T
         yvokJ6tH15RaBjaHC7C56NOh5exVd7DjF6pNDBMOHLuIJtJVwA8OCWLapMCSxVPlyxNw
         AerqFfifmq6h6UrZK+OerAB94OCuUu90ulAljYyOHPKth5kEOwZbYdsPu32V8aAQrkmY
         pFXw==
X-Forwarded-Encrypted: i=1; AKwUvBzGEvcWkTova3+fiDhr54wel6QQeyspTsRV9D8fG1UQLQKEdQSIErp9JvWVNukWnoc8XcwpclU0GL43f3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr7Ik8dDoT3cuArM3TZIyoI5/J/ZMykRmMcxO2fbhWMqQWSy5T
	BcRmOui61BJh7sISh8Cg5VzSj8Hx4xiFl0eZW1tCUubQEhjRQBPogqtd
X-Gm-Gg: AYBFou1OqZz/Tod2H8M1sTpFJ2NXm/10hfd4ffHhFNf02fX+EZ8lMNqDt/uGVQZFz5v
	jMAaiGxi3GLZ7s2vOzute9N6ubxTM/1rIr9PLFPMC2v3iMXuxpC4Ii+dIv8X+iSy2AW2XKrSnsr
	EH1Tc2Jtn2W9NXsrIPi8OqGZ2gXb152rKSG7yyOVBw5MAdUhwNjJT0lqCLdyoEObPFGuTSMJiFN
	1URX4sPojPqdIjAMogpghRChXXYasKenKivHTTTWHksbpPC7G1/54q1ID1aIHjHUcpxGpQVl+Ha
	DfJtUXldBslRHzn3OlRKyBuGwkz+LiU2AI0xExUHLaHDQZybVfe4s5R/ZO0Blv3SMAvwpmDWVpD
	cbwQQt+9CMB8tNJ/YNPyw1LU9hAlXbmIlRmGg4tMVV2UeBwVJd4x2ZA/OBQUjqHL92IRR/H2OE9
	mNH9Xg4hzH7OulYJ8BOl2YhYZuRXhUVLCi38GD0CNogy3ppXcxcKIHO9g8iDTHZfoy26KSfb9Jv
	0TLU8jqyiYxSKUWM9en9sqfw0f+h3WmFmZSA1GC0GrBk91PhA2/m0C+CE+PV2I5WW3PYYF9YL1m
	5B3EF6KNV/YdfBhC3Wk=
X-Received: by 2002:a05:7022:1608:b0:166:37d2:3b72 with SMTP id a92af1059eb24-190a6add68bmr5187470c88.27.1792660492388;
        Thu, 22 Oct 2026 02:14:52 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903c71421asm13121003c88.16.2026.10.22.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:14:51 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: failed attach leaks slave promiscuity
Date: Thu, 22 Oct 2026 02:14:45 -0700
Message-Id: <20261022091445.3650534-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

br_add_if() can acquire a promiscuity reference for the new slave before
a later error sends it to the err6 unwind.  nbp_vlan_init() allocation
failure is one reachable point.

The successful prefix does:

  list_add_rcu(&p->list, &br->port_list)
  nbp_update_port_count()
  br_manage_promisc()
  br_port_set_promisc()
  dev_set_promiscuity(dev, +1)

The err6 path then removes the port from port_list before the remaining
nbp_update_port_count() call, so the removal path cannot see or clear
the port's promiscuous state.  The later dev_set_allmulti(dev, -1)
balances only the separate allmulti reference.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  Failslab forced an
allocation failure in the first nbp_vlan_init() allocation.  The failed
attach returned an error and left no master, but the slave's
IFLA_PROMISCUITY grew 0 -> 1 -> 2 -> 3 across repeated failures.

A later successful attach/detach moved the counter 3 -> 4 -> 3.  Another
successful cycle returned to 3, proving the first attach/detach pair was
balanced and could not remove the references leaked by failed attaches.

The error path must explicitly release the promiscuous reference before
unlinking the port, or reorder teardown so the normal promiscuous update
still includes the failing port.

The PoC, fault-injection runner, and complete program/serial logs are
available on request.

This was found with a multi-agent workflow; the state
leak was reproduced under KASAN+UBSAN (no crash is expected).

Thanks,
Cheng Yongkang
