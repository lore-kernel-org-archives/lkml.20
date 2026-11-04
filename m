Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826479;
	b=sWsGvV70NesGjXggozqsQCR91Ds919as39F++vfZhbM0/S8dhTILjlhW4Ggm20GyHQzm
	 7blTeyT/vjbY4qtTP8qDIYMA8BLPaNUIMTPnTI9Q+ogmIsEIyf8tMTKw75lKemAamlPEl
	 0u7xko9HVgcKnta2dzw8ta3gYPdQyERL3vYFhUTpgGLbDGpQ6lK1njTVT7959xOmTwBH/
	 tfTX23kzF110osCmY96zxXV63//7bfaaICdMXI1Ok8bUoIaRfC6W/WbJWsO2T+aGHx9Yh
	 RvyxVsrTdlxQMuc+Bz/7rLauqbzq3ySBOIsUUYI9Zs+T5tda71WXzLeEnBXhNR2qw+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=crHCt2MR5Ttn/zJ8+YoRv9/ml29BnKFxyv9jVqax4Mg=;
	b=u3xevaQhZXHifGh3h0t+UUGZFIgz3P6oiVK2TaQpC3dtdEcrBbJCI1ex7FfYjdrCvPgU
	 N++3IeGjZ8BOelclYGJ/Mj166hDaA3BEVwHsJLKuTZ3CPIVTGnA+rUqgKV/cHUiIH85Ub
	 Kcpcbz3La8CTSU9eW540QAuxyyvnxVolOcU8IU3ocvZJX2Q3WfMgTht95Gel2loZI32ic
	 CDdBB82008+hlW8C1/TTeWTIkFOCm56mv+5I5kyicyOqM+1IPK2C1HvdMas/lftpeFi6e
	 eQ/Qj4pP+zzFH5nJYH6I9Y86LnLM7bNJHBgo2yS9u6m9+g7BeFdvVrLB3Kt2WUyGcnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plewQ1XY;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D01606D816
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D01606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plewQ1XY
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so764520f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826478; x=1794431278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crHCt2MR5Ttn/zJ8+YoRv9/ml29BnKFxyv9jVqax4Mg=;
        b=plewQ1XYTlFetiU2TTz26yDa2ARYkikgSrvIcV1jYDK3f4qxMUoG+SniaCzZPjZYED
         16NIvioGDx0IssF3JDJ6To0fEyJLz0p4u4wh3nqHB99+os5cojeac6nTWtq5HSkmnzpn
         mG2ez6wKWHXdP7NHJv8x4OPDQ+zLaWFJ8xiPj1X765O/ydItUvMaOkebm4dTTfr6W3CP
         jooEP0+SMBQzXpx1lVrlF/0pZYTC59TSWGN3VaBb3uc07A0KTq8rGg30MndLtd5eHMbG
         4MyljSthQJclglrrNTHYcplG8RaRUTlp0WgWyEjCdJ0UJ4afBE55m83C/kDIi2x+tsNn
         cDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826478; x=1794431278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=crHCt2MR5Ttn/zJ8+YoRv9/ml29BnKFxyv9jVqax4Mg=;
        b=nLqr7+Tjp4Vv0gdevlDZyTsmD81y2z7xvU1eCV+ZtDUwm84cmEhiWgp383XiSxLLl7
         /ABr5qMZZxpwGDa9h+7LPEnh96mI3GUSHO4NkKRfG03yMuiVqlyHSt+dmqYO8GGLJ+6o
         qOBgAYuQbBFBJ+oPJA5oAU5MmmAcPIJOyH0x/1RR1rSiPF/LPoe3lFs6MWlXCBl56FyG
         xvSZCpoLjdTDtO5+MsQ8ZYZ+bjAuV7dpclFi0a7dgyRzitpeuE58IrVppkeL8dvR8NwZ
         wqOoa17CzPFvJprzjd5j0bdZ4l/4bn0s0JqgHyZ7oAtSY7yh/WZ8846RWW9orAWftuC6
         N9fw==
X-Forwarded-Encrypted: i=1; AKwUvBxYukRbQ91vDScUds59QXdU7UxDKGjGnEa7v94RmRKIe6/Gcgcuk8WJ9ASsabU+p6TakToxQIGjfxosSjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bAHTaYGbiiR7wR57KOPfTRRGmVGz0yikCYnP9nYN2h2xnLLv4
	yPhTBdaqITa+R1tA1rSyMvMQucI8Pskt7CTVtNr+CVEVJ+NujtvNaH9B
X-Gm-Gg: AYBFou0KzGSA1pRrHVZ+thoZOQdgsV8CVSV97IpkkAilw9SlI7urtmJZ9D+i72JK7oO
	LggRmpc9sB5lVXdhoCLfQvhWiG0pAbkkLGhsNds00OA08ojVbnBh/yjtBlG6zPw1yu01LS8EPNq
	nME6ItXuT0uK4A5uuHs//QHI0upKkYnLEENvIgos2hOSeku6SNY4u7F+MugichbdgM9rHADmine
	bDFEI5/qHX0ESbvsoYo8Q+eQdyUUWFNbHcCJY2Jy/eraFSmLvLOtarUtQwgH/0IY5HEBk6kEqdl
	ZLna/PjrWJ056llnjveP5Zn4v09zPzm/oAV31+M9MgR1qk1bQhNfC5EafT0P4WRDTmynr0xL54W
	FH0BpTzrPUkr4/Y44LNtvKfe9nat1yjzNWsE86NFdZtWbSwhdzMWqWo+Bvjktq2NBfFhTGIpFo7
	g6sISpntr1fghnxzNtwu2in9dQ3GFcHQ8p1cClXVlW/fspgO85pLUYadYcf+fhAJFu3PXNbTWAi
	jQXEhaFqj/neEOSTLSQt7e7Hog/QAen69nfpTwPK+uevxPkHmYgfqY5UZNmSdSpF2TyjAZ/+jcs
	hocP/aMQvhPQRQ66NgdRJEZRAWcx+lqjm8Vj9AcRsXD4+RkAwkI=
X-Received: by 2002:a5d:63ce:0:b0:48e:247f:a106 with SMTP id ffacd0b85a97d-48e6e4fa97bmr29312958f8f.54.1793826477458;
        Wed, 04 Nov 2026 13:07:57 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c23:788d:6769:d03c:c916:2aca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm6224901f8f.33.2026.11.04.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:07:55 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/3] net: dsa: qca8k: drop MIB autocast frames once the request is over
Date: Wed,  4 Nov 2026 22:07:52 +0100
Message-ID: <20261104210752.467937-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179304303832.3134.328719975361344250@kernel.org>
References: <20261022192933.384898-3-kuncy7@gmail.com> <179304303832.3134.328719975361344250@kernel.org>
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

Thanks for the review. The sequence is right: a frame carries nothing
that ties it to a cast, so after a timeout the frames of the previous
cast are taken for the next request's. v2 polls QCA8K_MIB_BUSY before
sending a cast, as qca8k_mib_init() does for the flush, so the switch
never has two casts in flight, and the handler records the ports it
has seen in a bitmap instead of counting frames down, so an extra frame
can neither underflow the count nor complete the request early. What
remains is that a frame of the previous cast which was still queued on
the host side can serve the next request; its counters are then one
cast old, which the commit message now says instead of claiming that
every late frame is dropped.

v2 also carries two fixes for the issues you found in the same
handlers: the MDIO fallback of qca8k_bulk_read() storing each register
one byte after the previous one, and qca8k_rw_reg_ack_handler() reading
past a short frame and past its 16-byte buffer. It goes to net-next, as
Andrew asked for the related MTU series: the problems were found by
review, not seen in production. Patch 1 of this series, the regmap
locking, is not in v2: Yongzhao Chen carries it in his net-next v8.

pw-bot: cr
