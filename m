Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138454;
	b=g0uftxEqjX2qXGEOObQmUhOykXENKnniIfYpFwM4r3eowjV/BHTlRCJd6wBt97aSmbbk
	 swGYt7PlqB1pQPp4F8vf49TEIPI4gZTp0YH21LVylboqYc1tnByGmS9VCTZdGZnIawVRF
	 QCbABtokdEcx9ZoudcnGmL9Bt/muGz8Oel8t1GPQGtL693RsArj9ogp+QXmsMwLdC61vB
	 NPlWaMb7P54rgt+o1R1V6Ck5N6gx5fbDZ4vEd09CmW/QK6ZARZ1CvwEAlX+taZt3EAY8l
	 i5CAlb2Nn7TK9C307E9hx+R0AuSPyI2EGm+61GITVtSGhfe86F7neEyI3K32Dwuxwuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Y8EnhS7o4bUUaMd+9kBk4x0A+szwvlZw6MXN768V/Y=;
	b=dyfZjc5mqsqRNJsa51vuCGTFiMZeYzR5rewj/vIit+AhkwBc0iACuT36zfhidrQWZ95R
	 iIwHc1KP/xLkMI04bAX6UlOExPLJvUKrlHUdjKXcBx4ypZAAXRlJzdJXwVEMnBByXGZ3A
	 G69/dM/3AJERZ8cZovOasnEcrXFVVZGUBMCrEGFlkWNcw4PUeG2dK82bjsfQiG4gjV9sE
	 Ab+TQuBu2pOjMpSdsxn8FQX6EeEkNMY2cvslaTuwbJrpuOglyume5786QcKyVrNMM8WWZ
	 f0siKomPEo9+CrFOMbAy8N+xdcujlAOsw9DowkIGgs542iSXVEDdcj7YEzKJ3aO1OrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jETELm1Y;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BF606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA9BF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jETELm1Y
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso7022366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138452; x=1794743252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Y8EnhS7o4bUUaMd+9kBk4x0A+szwvlZw6MXN768V/Y=;
        b=jETELm1Y5XaG/cTJQLXmABBnB7mhSrc9sbdzZ8p6mRRmgHV6onkf4q2pry8PzMZRQH
         CH3dm5/SCZE/MiaWN8wHHtD5qpo7gm7/gf2xECMQK5aRfgidLCfRdXBlZ/8Z84tYRx4E
         L8X7ejBSFMFF0wYbSupve7tvU2wwgTNX0paVCHqto+8VRqZf+zRPv/fYjo+RcUGem6Nx
         xZzYZGGDn7gWrr11CH3oOkoXoDM+rWsPHna29fDctTyHMdBpsJAUCNcBzAOWQ0Q2RXy2
         IJVzJEbaQIPslyg/cSnz/2UpxAYa+aTS3enUxQM2GyQLLYSa9DXrrsmMAb7puxXIafq0
         eSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138452; x=1794743252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Y8EnhS7o4bUUaMd+9kBk4x0A+szwvlZw6MXN768V/Y=;
        b=vvDQzIH2CBKIR7XWRdcJ3S+rEFsWGuj3VGWg4Rblspb2qCPaA67SSVuAJaiq88zr4V
         0ux0nkKSEkJb68JK7h3foAnCwtiAGNDFz2T5Pcf3UxgWFye+llaXUuAKyEhOpSSo/zAw
         0Zkz1N0WnPaBwQSFhCfF7aiOq+dWTvabeSJHQQJ0ss0uiMuuAjSdXi3MqR27RmwCmnTM
         FCRfUmZWSkjpgdIjXeN1rns103c9PraMJWW2iU8VcuYMIP7rHLYN0CxhOJDxijMO1F2K
         QqehQQOsz/dbfeY9QEPbFObcWLtLxOWAup63OhSIj75KDp1rzUJQ6EaKnzv2k0DoBT1M
         gsQA==
X-Forwarded-Encrypted: i=1; AKwUvBxL7nCJrBr60zKR7F455rvRCi/sS5KGVEKI4zsWonjCgSJ5bdtfwSpJkcdoOEsgwoHoXabW9JmA63dftQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BVnnfG998pXMpv/11M+/O3SiYg3s/dxnC+f0YfuM/J9hdAsL0
	GvUS5GgSkwKopEF4Up4y87mT09wRQLg4Pr/JUlOFAk6kBVs0EGnGEiWOonftE2R0hg==
X-Gm-Gg: AYBFou1T8JFll1wUVlrjHryasFpKCrEJTamBAXov0iOYr7jCQN/fmwMGuWuPIwc+0q5
	oDvR15fSrVP9dWDkl/fbVpDK7SxA2X5apFS15cBb7rH9YFRkkaa0jZ6S5nh6iWt4HPslp5RXuE1
	HQVMztV0lF/YhZ1RMCkO4ai2rv9l4ITvhi1daDdYffn9kgVPHu1lhwDEeqEXicm8pnPSVcj63MQ
	ffRRRGS0lKXl1vew28zmGa4YxeWFT1eWH31BTxgC4gK0bvdCSPRBdzT3nXka26NWUOw8bybDqKM
	g/VGAb6sFJu7pu7zqb086a76n6ILacJ8a/S3cY1Q25Q2EOxdKV+Gd6G2IJF2c25y73eINf+zD+S
	hgw6fMOeyEhznZ4wRQ+ZafMQIcLkKdIrxRr8BowAIPmgScuW0O9sHiHqmNQVoz/RneRthQiZ+WI
	e56fBrzIhPBwPPjZKemqf884mCNjqiWMcBfWiaR5lAtfGMeEWHDKP8+tqiZDRjguCpWg3Uylw5U
	vF88yjJ64dO0mC1BYYO4KChq1wYHInR6XFew9YHymVOI6TSGJ3yYILbA80KlrRiWMyO3W9cbEW/
	bl41/bDl6O6CESJEiFBwAB8AL2cPaExaT1D9R4mgOy/LeJJSq13WTbH+7G0iW0+xEa2XAQuD9OT
	PCZ0p1GD5wajXbwsa23l4sDVGOUu7lKYyyG89Q0+rAoqbOyT2ITtjF1XMWNdOVJx+ff5RgQvi7b
	XXHLMZ4umO3hSA7FB3NpV3Gk++MUabNZ6mt0Vfz2wEBsayIYTMXiwoXgh87wnWqKtjzdK8x6eA4
	a8/yOY+jNtXKRnWLNbd7wNsGSD3weEgaMATbrBDKPtPf7k3jBI3iO666zUVVwvoOaUAaNbGcAPC
	+AX+2VcCQMiotGDsLA==
X-Received: by 2002:a17:907:80b:b0:c4d:2cb4:7bbd with SMTP id a640c23a62f3a-c4d6d7c1ac0mr93601366b.47.1794138452222;
        Sun, 08 Nov 2026 03:47:32 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a99320bsm56079066b.67.2026.11.08.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: razor@blackwall.org
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	vladimir.oltean@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: fdb: hold hash_lock when an entry roams
Date: Sun,  8 Nov 2026 12:47:31 +0100
Message-ID: <20261108114731.123174-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <01600be7-3d8b-48b2-a59a-1125eb452714@blackwall.org>
References: <20261004124254.3525496-1-julius@bairaktaris.de> <01600be7-3d8b-48b2-a59a-1125eb452714@blackwall.org>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On 04/10/2026 15:44, Nikolay Aleksandrov wrote:
> Absolutely not, this was made intentionally. Taking the hash_lock would further kill learning
> and roaming scaling. Surely switchdev drivers must have dealt with this for some time
> now, if you'd like to fix it do it so the software path isn't affected.

The fix moved to DSA, with br_fdb_update() unchanged: "[PATCH net-next
0/2] net: dsa: fix host fdb refcount when an entry roams". DSA no longer
counts the roam events; when it handles each event from its workqueue,
it looks up where the bridge has the entry. The only bridge change is
that RCU lookup and the filter it shares with br_switchdev_fdb_notify().

https://lore.kernel.org/netdev/cover.1794134495.git.julius@bairaktaris.de/

Julius
