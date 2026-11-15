Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794716632;
	b=IWuuzYQ0X3C0EptypBHZpVu7Z4tv4Or0z+ZXqbgz9A+v0VVqiK/U3V0FyqSN6dH3BSsn
	 oIpeoBXGtpOq6AHFF48AWAni3hd5r8nUeF4aiOa+LPdJrq3hsg03hjXDpV5myRJSI6BxO
	 3E/C3/gUZIoDr5CvHgCjYs/uftRvwQPO9RZXP/3AijqZSUbIjaQS5tiH2ITsxHE8/0omz
	 naCgYqOlKDtHEWm6qynTcVF6oF5xCOA9lgTHHzwF8VKhg7bS+Nl9Gwul71TtohaqTAgok
	 fHZ1+6RS7dmTEsLFY5EkB16ED9XPmhsKlnpGweWABxpl56ZfPveBS/1zUzzZBgKTapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794716632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1gBGEBA/kCwvv6nk9Cr2bAVirfmjgnvI1gsCajKX6m0=;
	b=JLSgD6+0LBT9U4shNRSObJina2c30vk0qDuM3WmBB3wu8Q3KZMzSrOvm9k3LVjLnUpN+
	 yf4EdJjL3srStYlyKfseymUiGWMES1G3nmdQYKoarTlTFT0PKqIafOJN3lFKjmgT4CtDN
	 1y+hFrvEpohBg1g7IZ9le+Tizja9zOD21/AdjsY0rd4W7eBB3TkfKx9Af+1tHS9BJsTPB
	 /BlWi1MbSUscVbBWOzNUF9kxHVKLpBsZkn8i4OIYKTZpJG/KkPec+0zFa5NG+JtK715EO
	 B3priQV31sxJzps6KrVeUyy04y3JsasSpeiLLJEVSpBoXJsgY0JdkM1DADorl9ecRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrp2S7rC;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58492606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58492606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrp2S7rC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2280322a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794716632; x=1795321432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gBGEBA/kCwvv6nk9Cr2bAVirfmjgnvI1gsCajKX6m0=;
        b=hrp2S7rCpc3NtC+9tEUSX2iT1GBBANgngGjdkJvbFsoSD4a24/oae1w8tizQ0VWLVd
         7tSthvH7ce2wr1TIGSob9YvRd+xsl7o9eWfOeElAdFDcJE0Z9xmcS8X56Nq7s1lOblVH
         FeX4aA6J2pIsDgdx9FvBLk4zVYEUVIlFPx73bA9DBJ4yflep0HPhHAdl/+gK6sa/mArT
         Sew0Ob33/iw3xtpndyrDmEvnTrKVkg5XiKHO8Yfu25XRQ4/JFG7jHPGemrzGU4cvKJhZ
         zAUhsiaPyiwjGTXnaQzylAw7sdhVNRFdOIyTJ6C6NBYycAmNh9csYvqXW3awfBG2ptOK
         G3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794716632; x=1795321432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gBGEBA/kCwvv6nk9Cr2bAVirfmjgnvI1gsCajKX6m0=;
        b=mdm0BvLVKY8M92wzy0IB5m8aqCBLUvNrm2O5mFTOqgvC8kC+2PJCElsHqjsXbYQWs3
         i0cAOA1PD7EW5u8HP9Q0NRcm+lEALFukEEmJXV/SgaSxwb1s2NyOK/+ubnY9f/2VlHtO
         S02TH3aJ4l6TzRVVXPe98tncpGO6SvRnDRJKmc3smyVR+qCGKQXguGwjtQiLY30PCCRu
         1uARrbsaEAxG+wRxZy+3g8wbCPADUWud7GqS69BzB0wxv36vr54JxsSDnoOpZmJkauWO
         Gtjc1KgpTV9TSatQ1NoQMTYhieZ2VQjzarTeC9xM5WU8jp6CHthQcqXRw+lz8qvJ6txl
         SVaA==
X-Forwarded-Encrypted: i=1; AL+hErEsGczUcjNfzxU3TfphaPg5R5FbPola6mdFQhQTO6Spm4sHVkEB8DgoSGNFLMmuunqmKDXOMQwFQw0p1FY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8gZ+4tjvjTIQX10BhY17W50oek4irbVENRIiFbXZK/3AmwNnk
	+ALHGNdl2wwJuC9epvsW1kIWZ/3Dsm8JzAP7nIRogXcp2Zkq400oBRAa
X-Gm-Gg: AYBFou2pHokGvWzztxp6LgNFuNl5iu7+wz62zDBPKSFIo1KDC5gB24CfVlVVZ0uUwt2
	sQKoE9wuq+1/rBszHzpbZwB4AjRsQHuZOhXrchHWRqrrIxr749mJ7+O33yliGMEUtqF++WmoBRb
	g0nuPB1wrJ6THZY6kg9+ZCWf41DB+WzHLg71ws3Yl1fvxAlJBwY3GiRdSbITmg3ik96SeKdRYgo
	9SUKXTJFjO95tlEast7A4+OKNz76dolmVBmzE95GYuQ1Qj+CDOOJKnk9bSVpCOIExvQH//95WPS
	iF/daZo3w5B9ztTWqm2dG2/MrgURnNl3zwcr6VkATjKQYvku3vzLI3xwVPW36GE8X50VTG9Hqyh
	4uOEIWN8/xbmCxZlMyqe6aKQBAVNWRby80YIBAUETLperf4NJN2OQrb7i3Cl1K1j2AMMTutl1Lu
	7hcZ4XO2hTvv+F3sgmLWpMfSL/H7KZEh9ne6Ay02jX2Gvu7uS0pT6v1OKsQSa3Zb6TOJHD3doPB
	BC4JLk56tiJLJQX7bT7D19XSLx0G5BrE9o6NKWC1mte9frz4xE0xFQJQFO8GJSqnfmmpOqSqNPj
	0HNRvnFXvxiQJicm+jv66YV9tOp7YFJ+YlqHHZuc66Vq8wN4Pj/n+ol4hV51299LwH0jbwufmWf
	wQJjA7AUSYDxlBOi2XIoTaJVtyrPrHia8ciYjzMdNZ6cEpENFGDqH+cL7n1/0GDgm1AXP5OyusF
	sGkw==
X-Received: by 2002:a17:90a:c88b:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b1b0b665e4mr7165716a91.15.1794716631680;
        Sat, 14 Nov 2026 20:23:51 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae8be5adsm10972872a91.0.2026.11.14.20.23.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:23:51 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: Re: [PATCH v3] iio: trigger: fix use-after-free in current_trigger_store() on concurrent writers
Date: Sun, 15 Nov 2026 14:23:43 +1000
Message-ID: <20261115042343.87716-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114235118.4414bd1f@jic23-hlaptop>
References: <20261109095728.59024-1-yuz08559@gmail.com> <20261114235118.4414bd1f@jic23-hlaptop>
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

On Sat, 14 Nov 2026 23:51:18 +0000, Jonathan Cameron wrote:
> Probably goes back a long way but please check and reply to this
> thread with a suitable tag.

It goes back to the original trigger code: the mlock drop before
reading oldtrig and putting it is already there in

Fixes: 1637db44413e ("Staging: IIO: Trigger support added to core.")

Thanks,
Yu
