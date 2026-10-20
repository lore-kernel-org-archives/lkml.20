Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512958;
	b=cxWhoE9qgGudh1oujPFl1rK7I/nniaS/G55AcPySX4T8nXrhLLgQ7DalfrYLwuIq6B/1
	 3eFSpZYS25V5Rayq43nud+B9aIQBQVx+jvivz2/qOWqFahhDklBN4ZvqShZt9bQy9a4H1
	 1ee03APa9iTA/UFqK6h9dza4XmiyzZ/Ia66HvkUhXz+gOMULw+wmkLUj4xn202Q2L2aGa
	 p/i6V8snA1b9f91JJuXEjd7/wjUHPIr9FK576gYIXhDJJCHCDTbzrgH5TX32B/fpaE8xU
	 3WMzlgNjnXIZUdlVjYD7mBqvf9qS5SmqQJ8EE2JCtV8pttBWFD2pW3sLWmsnQYSNa0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UhDQRNkc9FLSlLZbPo9WwVAAHQKsjx+zb2EBe+RwcLY=;
	b=NRJBb9h7dMJTgP2znfiCJKc8zfQ0RgIJdg1I8NQmJezBPQFSxZUztz3wYYktLjCXu55I
	 3s5O5SLWSySeBBQGAHG6AXPw41PtPxGzr2t8imVGE/XP29fF4QZ+RJBaeOIjq95cYTMID
	 lF8W5df5ny0JuVZ/QOUliID7hYs/lCSGr9kZZUf2SSLVcpuNgugR+ZX+F/bKSGvCaSvwE
	 f39lrJ18DqwsyKSAfPkZzvzc7+gL3L/pG9KkoDlvZDtuhFy+KLhs3IeYxyXCg4Bl/S0FE
	 1F5eVlXpnz+akqOJMcJ+n9w6Y8wE3++4TG55JtpU6T/kF2ehnB0jcus4a+oGTBdYB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WalPdExM;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA2D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WalPdExM
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1014833e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512957; x=1793117757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhDQRNkc9FLSlLZbPo9WwVAAHQKsjx+zb2EBe+RwcLY=;
        b=WalPdExM7lHlWsTDznBX0Fyl06synozvZt4SX10rtsmo96i+4x8Zp8kY38DMvDvoAG
         MWRjRFWn53CppNgFs0ngLw/6OtF3BoAXiUFzYSZPYJOeocKSt0J7fT0g7iAEsz3JpsT+
         2r4FZWHtl8viYqxcPox4gn8zszaNPUXtg0cae1c/0YoLHGZ4oqBiLqTfpX6o6379QUC2
         WP+L4eOyj1WuN60IeQSfZEI6hp8231lcqW2QoGSAH8b6A8xrR9MXledPJRkNSasLjick
         Lv7ltYgNOVEkIbRbhiijTH+RklXVrFsjuv2a1Mb0ImqW2oeKCM3+N7Mmzj4RsUbKdjdT
         LZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512957; x=1793117757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhDQRNkc9FLSlLZbPo9WwVAAHQKsjx+zb2EBe+RwcLY=;
        b=fCKW/UW6khi6zgAJg0OdSEWmnMdEXzK0piOqUgvP9mhOO8CPe34UC63eRGr79SropP
         UVfi+V6LcHb+7UDspYq6KwRKvPGqe3erQRzuEZfhm8dM3cIhkckTQHNRwPlpyq1WC78A
         BToC750zq8t7pr5cgpngT/a8qKuLMtHNq++hTM4X8uyuGlxHR0Qvw/uMIt1XR4t6EIfN
         r2zl1weIokjq+d79bXOljj82qdZ4SWe5Lt2ah40kHcPY+HNfn0SkNL0KcBtif5UvDOBD
         bCtZdX2PP3DDBGtEKplv6n6ECU8pzY/AcWnVW4ADlqqWJM3CkB6b9AhpHNQCC9ZOVdYQ
         UP3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUPk6UrfBWG6Bsq6GEOgkxumWbEmAf93p2FH6BfhEU4NOWNF+JHAEYNWjDKApwISaxsBD/oNSAj3BKOvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHXUdGTiOL5nMlUkhppALa5bLFZO+FXcyh93hR6eAzLxzZ1oX7
	a3p3ricTR3D1nHKIFkc8Qova18HeH6uHvzDfopf8ikB6MbNytL1ltXSS
X-Gm-Gg: AYBFou3g8Mn9WWyo0CciqeMzzhKuq9PC35EUg1QPq+UFKSV0uAHGGGWHy/9QZketIDH
	t+0pKn9Mm4yoYsc74NJY6Rb636hAL/J7x/PNDYzPO+aCskXeo2PXwqBVskHDi8BOsiRiRFUi1MS
	VEsPxvwUl315t0g20mBy5tx5pc0uKEhbc9tu1mVobCxRIRpP326O3GNRe8AnpOqjS+wof8NCPg3
	y3WSktUmSZsMPswKVqrMuBTlSUalwETeVUdhXxzVhudT3RcBYZUx/n8hcy7CTjp69HohrDvPPp0
	Litj4y5oUjpTuF1HhXFVD0JhsPf1YYnvtH+sgOcBfWbYUBlIRKEbh0A/5fnNhLP7xCrZyQpOmcx
	1XnEOszQ1ds3427wtDKRnXUZJozIjKcpPUpLu7CZ0r+m2oySDGRAsLBzriEdL3VKYQFzMVK/oOT
	TnUV2Cinl3XxF37x+pdtIBO9lJVKMkHNFgfddL6lXA0VwBVhGBNWpmM6P8qGrLzFKmxP/s4iRYb
	7S/5OV9j5hD4sLuQXilRgnn72gXl5tZTSMW9ARfWV4mEA==
X-Received: by 2002:a05:6122:4f97:b0:5ea:e197:93d9 with SMTP id 71dfb90a1353d-5eae19796f9mr498417e0c.19.1792512956788;
        Tue, 20 Oct 2026 09:15:56 -0700 (PDT)
Received: from localhost.localdomain ([190.177.181.23])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b518bc8sm12918381e0c.11.2026.10.20.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:15:56 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7603: discard power-save loopbacks after wakeup
Date: Tue, 20 Oct 2026 13:15:45 -0300
Message-ID: <20261020161545.9330-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <6e7358fe-4070-4a88-b8da-77e2f9e9bdf8@nbd.name>
References: <6e7358fe-4070-4a88-b8da-77e2f9e9bdf8@nbd.name>
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

On 20.10.26 11:48, Felix Fietkau wrote:
> On 14.10.26 08:22, Cristian Papa wrote:
>> Discard late frames rather than retransmitting their old sequence and
>> packet numbers after newer traffic or a wakeup BAR. This loses the late
>> frame; it does not recover delivery. Use the station's sleep state, not
>> the temporary hardware PS bypass used during U-APSD service periods.
> Why did you decide to drop them instead of pushing them to immediate tx?

Hi Felix, thanks for looking at it.

Because the looped-back frame keeps the TXD it was first queued with.
mt7603_mac_write_txwi() puts the 802.11 sequence number in the TXD with
SN_VALID, and with a hardware key it also takes the PN from key->tx_pn at
that point. mt7603_rx_loopback_skb() only rewrites Q_IDX, so a late frame
pushed to immediate TX would go out with its original SN and PN.

On wakeup, mt7603_sta_ps() sends the psq ahead of the newer traffic, so
the order holds there. A loopback that arrives after that drain is older
than frames that may already have gone out with newer SN/PN. With CCMP the
peer's replay check would drop it, in an aggregation session it can fall
behind the window after the newer frames or the BAR, and on an open link
it would arrive out of order. So I expected immediate TX to mostly spend
airtime on a frame the peer discards.

I haven't measured how late these loopbacks arrive, though. One that
arrives before the newer frames go out would still be delivered in order.
If you'd rather push them to immediate TX, I can send a v2 that does that.

Cristian
