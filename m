Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044807;
	b=eTLvbP7GVp/0pKMEwJj6aW6OuVpm+TTSUgypI218N8gvhD4gbl8+Kkt43r9cW0Fl13h+
	 WHvx9JIxDbjorMw/gXxFwTqCCRvtII493ryoMm6DKD3AEubUnuinS6RTL2ZkuwFCm0uHl
	 KSsJ49qbuVlCJoJH8P4uyl1HkdnQoU5xGlV9gby7T6EBqQCI+i6QKPtR71aROHiMDIl+I
	 BxDOxZpt+h4tYf8BJzGlzGmUd18dGzsH6djsjGr/MFwi0dc1h7j4o2a9y0+FhmkdGgf3V
	 eyaOA6Ve71LUpnz0ZfGIonWmbZkHosIrhH9wmMp5fANzxpnHB924MdpEyCYy0cwk9dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OqJOMVomNicsYATFLXth48258BoA3r2b05um3WvwiE8=;
	b=QtICRBCevek4gcEjVNfZEhq0x1BeI42EjqBqlIvRySYuc/b9cnOi5vsr4q3pkkww02Dv
	 hCQVttp/4qz2WNDXNoMabCUA/TpBw6bdXP2iYdGCTbKVnwsZj4bjEqRPjXg4NbbLcdWEP
	 l703BWLsEUvDCTIlffcHQyoLjIU7KJBJu+Zb21GgkqjTBzLsOMhhnOVijw2m1NBoTJ27R
	 IH/ZN6DL96jma/QwfO/AndZBMWGpO7IT91/nz7q0s/X22cmAnfEZR35JkobT+CW6XgBRM
	 aMYt1vNnRKdwMiZqQxM/Q7kCm8XIWVqAuBDysnYddo+gQCmgikr+OHJNLmnE0VC/c0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXcyv2nZ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06092606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06092606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXcyv2nZ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso22537175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044805; x=1793649605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqJOMVomNicsYATFLXth48258BoA3r2b05um3WvwiE8=;
        b=XXcyv2nZUxMLT3b8CpbfRTDpwPPEA+QSGEUubHtCgE6ChP1KO4fNwJuH8bIwwsRkdi
         010r3Kb86fX+bn+lCD3GFBMpGMapAdhRll68dNa/PmsU7eoywaOr8ET1gOtaN9YbIIJ4
         49fvoiZOBJgCmpn42tOZFm82oGe71dWn4zEhTwQM7pd328o9XDgjxj1ELNgHKaTwx6/s
         OrxolxpKKhT1jGW/+kzVeeaeOdr4389fDx/57eV1vGjhsK0Eb3rdv4QtZSjgv+yifgX5
         iMKes8XULRl24WFVsfynUpO6DUXjAUtjgmDXQ5uBTBwPpCyV4xeBUSHwm+NC1JuFFLdV
         nwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044805; x=1793649605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqJOMVomNicsYATFLXth48258BoA3r2b05um3WvwiE8=;
        b=Jw4hcLLJuO7QzvGuYJ6SdUj+JCulwgle6G267Cq4R1FYtYUpmKAK5upJjF52wEbrHz
         17U5tfFPMhwDS8jOTJlvZkuGyYGHeMKWba+Ow+o7LCXwU7+T9KdteT2NQFJYvw0Soilq
         fFvf2EpMjWL9xmgZTp/f9FygRNYwSDwPE0k4bfLAgPowbdcrP/y7hjmfI2GMRCK8nkvU
         42Fu6hn7EO/nxL8rspsSfqH8cs4QoH8JDMO5c6rkhir+T+GmtbuEfIo5K+TtyONFkN/v
         Z1HLjY+BsXzzs6LwHLZb7TMeiObhQguAEIc3ypyzSaCqlqEZvKhDOaTJWrwSO0shEHSv
         H1mw==
X-Forwarded-Encrypted: i=1; AKwUvByXpLwGEn1JLfVZVeQDbpJXX1pzP/tq2t2p/qycrmg6JiqjIH6CxqA65hd3tEvoUDUQJzLMmcE8UL5fApk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqF2Y59ntl40lRxbS7aRfjHpzS62WpTecHQ3BYrOPw0QH++HkF
	ahEwBYGQINYo8pR1cI4BKazlYFVb0eOIimTUyxqTDdv3Eod5MqCszEOj
X-Gm-Gg: AYBFou0aB8AgxLfAxRH13UaN3OFT7f2TPKZZH7FeYi2PpC6aIBK19jBgkxZN87RQmeI
	gMNBEpzPSlaBk7XXePo+K9guSDioVsQ0QCfj8ToMvMRmxXFZTXYD0EnqDAvuR+pIRGTqTN/idwo
	UmKU5zpXKfxLOUvscglV97DGG7u5U3CLpMr4bCeopBW+1z7bqH1vQhPVLI8YvDaIXrpuUZHlmIH
	GzynOTmySk9oLCWrv4nXPk0LT45Duf8EDLWjkHeAXlvKbucOsTLCt/wvnLt3yTaioTw4CKJ5IXO
	J/JhOPogSgIwisWGdaPziBIl+RS9Yp/uz6qd8SkIh0k9LHSYRGyrI1WfFEwApENspSDIjmu5pdf
	kH/IZDeqZSFjnlFxw6Ynbajjn6WbwXdaLQaAP44qPmKwIek87bXPYAV5as0j0JzWiW4yF4vD/+J
	97WiLLxstAExMOfnDnjEbsJI1KWK1JCP+Rx6Ze6QHAgEHrUk0/TCmCn+kRaZqHEaXfY967kncX/
	vr0z6a2VzbexkJ+JiGvS2eqapFE+DmgGj89S81/ADdsNS5yuRl/zBFAmbdnMWL/yh1IrFgUXEDu
	RQ==
X-Received: by 2002:a05:600c:198e:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4a35ac9d1c2mr162802625e9.6.1793044804393;
        Mon, 26 Oct 2026 13:00:04 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c12:cf67:2c6b:7fab:6853:c855])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm18068821f8f.39.2026.10.26.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:00:03 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 21:00:01 +0100
Message-ID: <20261026200001.13573-1-kuncy7@gmail.com>
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
cast are taken for the next request's. v2 will poll QCA8K_MIB_BUSY
before sending a cast, as qca8k_mib_init() does for the flush, so the
switch never has two casts in flight, and the handler will record the
ports it has seen in a bitmap instead of counting frames down, so an
extra frame can neither underflow the count nor complete the request
early. What remains is that a frame of the previous cast which was
still queued on the host side can serve the next request; its counters
are then one cast old, which the commit message will say instead of
claiming that every late frame is dropped.

v2 will also carry two fixes for the issues you found in the same
handlers: the MDIO fallback of qca8k_bulk_read() storing each register
one byte after the previous one, and qca8k_rw_reg_ack_handler() reading
past a short frame and past its 16-byte buffer.

pw-bot: cr
