Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684750;
	b=KA1T1kW4Zo2SWYqArh130Fuu62I/f+2KlClXoKhFQ4pS7aX+5Q/4dRSIhfQMlTxYvWUU
	 9nfQAcJ+VUJkOJjjJpnp+5/m/66fTSmMELewUibaAKPdNEt/2tGQ0K4vGpUJnHqyNpAP+
	 VtocHjbGi7Uvv7rTxWCr8AePpIDu7APHyC58ftsURJJOU8Ial5v7xYsoqExuMz3V+MJnj
	 ad4U0kTlUoLWp0iqHKM6fUg8t5eKYwCd7G+33c6TYfZMmmoXjjpmN3u+0sgZp7qVr4EUm
	 aXw/7Xh3BrD7l9SaiRckeby/zU62+fklw9TO9kg+MwnNDlnOy1LsVu8VNWWAPgjq0OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QMSzQrmHSICMNQh4Od8RtudzCGPsNDtxQcd253kx/Jo=;
	b=gI1RXTkrJsnPzE5DwYM1n1IvmopaWJFETbIklRlUfQZisJF5H9U2imtJp6C3EcCBMLzg
	 FbsV7jG1dPnFbZ1wle6PKFFpUq5WTs19NlrVUAqkP8n308cP5n1xdt3w3rKmKyT1NAPeK
	 5Um8xXPd/WkQsEp3jib2ARJQyfdJhbllnaA3GnUmBhleGBQSnkn4xhu6Rqii/NDY944E0
	 20nnhsiqdBTLxGMjLL2TDWSjzd2hV+w4KCZmTNoFhq2wNG5lnP+GuARTGAfLa53YoqIGR
	 Ih6h0u9Q4DVVFw46lnWIIBRAGoeCmUQX2j15fhjBoeW5Y+Fakrfo/xqbkJdgCQK7+gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDWql9zc;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB469606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB469606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDWql9zc
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2843074a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684748; x=1793289548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMSzQrmHSICMNQh4Od8RtudzCGPsNDtxQcd253kx/Jo=;
        b=gDWql9zcjh56bB0LpnoDFMcZwYXzDCFfs8++ZvvTqzvOOobfBPTv37W1Pg+49Bs5ky
         q/sbHpvuGOX3y1HQR85kykNPYYBbd0WWgCkbNHuYIbyZqwTiebt3fu1x7t58v2aLWbGP
         OkUr8EMRhzFBYCee437t9LWihnVZsG8Zu+nYAqJpfjI/AbbznC7lKcfKknYjgnmuB63o
         qASlzfXqvUsHHjoOrnKs+figw1lZVy+KA2NIqAANTk+5ZMeflDb++2Wn11TtJxD2T+oH
         tNm87MM1loHbUIsVHCP+CuvrK/dL2a/ys0Gmpt3bq4OgBhT1qIa2MV51JMGzc2idjRuQ
         6q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684748; x=1793289548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMSzQrmHSICMNQh4Od8RtudzCGPsNDtxQcd253kx/Jo=;
        b=HBh7/5ua/ti1vkiUPz4A3KVv8HXBdFFBnY3TLcsWUa55iZ79qB7CEImzhi4WAtYNsq
         iVQEIOSsOzsNKgI6P9pDIoWfAjtG7ZVbS7G78syCGFStjKZPM7fao7TdMcxGvg0BoV3r
         zSg/iuQ43RdYltrKr7h1KYOqw70Eok0IL16yYyrL6gSa8473Gr5FfnqKZWzpirmgbWQT
         bNwx3ESUe7OaOHn/11U+iy1aJprVLsg1NqxNL4rfkCQ3Gi+FyZMG7CbP00lIXbDC2pKm
         riPtZ7rw0aMNjcc9XcXrTKvJFaBkHEiR1QOvvTULhykanoYGeo7lI56EsElfnyJLv/FC
         khqA==
X-Forwarded-Encrypted: i=1; AKwUvBxs5KfS64RzuxGi27AViemKumL/To1Cbf/U4r+i/s+YWeP1TRZMI+w3UxzKqkNbIMJ4iZYZZzyOmGhaRno=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXSDn2QgQPGRGVSWHVmZEzYt6v3wLynP8egGf4JkxxUJDfiRzs
	KKk6HVf6Htxv54DzISP8OkniV2oe/Fx8R//QEHy0us/rylK3vaVL8Xaj
X-Gm-Gg: AYBFou29f+SvS2nyEiq1ncBsX1Kmy2nTDg2qW4fFAVL7tQfozUJW538kKtagfEhGO++
	dEu6Yhlfqc7zW8Bafia5Q6l9A7UnsXE+s8WGVJ4GgSd/mVL8mJfRKITvjgahi3RNztqEFKsaBux
	ah9D8v6fx2VJkHgzccA1maBwS3dinmpNpImDTQya7s23zxcKHLGlVOlNHqfuVRbTMJiDJVewXSR
	8gaSExK4PV83nucareTlwUO1zKO9MuUiVu+7CjqJoV3Gslc3R/BCeIPb7kel0dJ2U4EuY3m651I
	Mfxbn0UZFT8ITKGJvhp2Zv9gCxjCk5+2MsAlmqsvS77jz6byQ4RPQYYD65k60pOPB/qIAuiVnRe
	Sk9djeDN2YNZMEI7wlXF/KUYjQt6wqxArx6Ze0tW3L+4/Kccd5eNUkR7bWlWupXzGGZkyn8WiVC
	x8dWB+8tRwXyaJRDYAcGdpVHUa3Kdw+1ZB+yeav6XfL7+nac+MUTqAHPqV+shBYr6mRnSLUzmuf
	/PwqMywgOcjB0Tv9ID5ZrZ6B9TlVU3JHMWQU5jzExDjkbSpSh6J3HrfT6Awpu0XqIih2naWn4BQ
	BMRfSUOJJKT03CmZN+yI42C38/+/yi876g//b9tl6UbNEOxtLe+MlsZ1tQ==
X-Received: by 2002:a17:907:9693:b0:c42:9ded:6a8a with SMTP id a640c23a62f3a-c46795f0e10mr599649466b.16.1792684748139;
        Thu, 22 Oct 2026 08:59:08 -0700 (PDT)
Received: from CCM-PC (31-208-243-52.cust.bredband2.com. [31.208.243.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db05esm2020088a12.10.2026.10.22.08.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:59:07 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	ansuelsmth@gmail.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	florian.fainelli@broadcom.com,
	linux-kernel@vger.kernel.org,
	hzyitc@outlook.com
Subject: Re: [PATCH net v6] net: dsa: qca8k: preserve port state across MTU changes
Date: Thu, 22 Oct 2026 17:59:04 +0200
Message-ID: <20261022155904.1051-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179265824122.3135.15072303811434404600@kernel.org>
References: <20261019173716.198475-1-yongzhao.derek@gmail.com> <179265824122.3135.15072303811434404600@kernel.org>
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

On Thu, 22 Oct 2026 08:37:21 +0000 netdev-bot+sashiko@kernel.org wrote:
> Can this write bits outside of mask into PORT_STATUS?

Yes. The qca8k regmap passes the raw value to its update_bits callbacks,
which OR write_val without masking it. My previous register model
applied val & mask and hid this difference. v7 passes
port_status_value[port] & mask for partial updates.

> If ports 0 and 6 are both CPU ports, can qca8k_port_change_mtu() return
> an error after the frame size has already been committed?

Yes. My previous test called the driver once per MTU change instead of
going through dsa_switch_mtu(), which calls it for every CPU port. v7
records the committed frame size and returns success for a repeated
request with the same value, so the second CPU port cannot reject the
first port's commit.

The NULL PHY call in qca8k_port_enable() is already present in the v6
base. From the source, a user port without an attached PHY reaches it,
but I found no in-tree qca8k DTS with such a user port. It is
independent of this MTU change, so v7 leaves it alone. If it is fixed
later, dropping the call looks better than a NULL check:
phylink_bringup_phy() already calls phy_support_asym_pause() for every
PHY it attaches.

v7: https://lore.kernel.org/netdev/20261022155837.760-1-yongzhao.derek@gmail.com/

Yongzhao Chen

pw-bot: cr
