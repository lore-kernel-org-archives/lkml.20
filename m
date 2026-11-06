Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997381;
	b=3Fb4qSPTUJKh6Cnp6CoxA0Ot0wlsl9fI2hA3O0qy0UOIv5hLyzWOqZigZJsgHjkUIFtu
	 xD4h7g2qM1qYwoOoN/Ba8AHUbFEpssprEKkIXRDyZ4EWHj3Pf+acRGGtDY8OD7YekdSS/
	 6qra/+QxIiMEcMmBgzdafvh5Uv9IuAz0Z4+zOcRqEUek78bwlTICAPBdjJlrJcW1E5ne1
	 IRUwiYWGwppZ5ccYDV6bCQPYr3tcUNmlIwGos9S39+7j4pyqJ9ZeJ2GV9BItydE7iRZFn
	 /s6nAafR5EA5fogK9ic2ldy0/aL+eaAE1DTb5NvFnA5CzULSsDY7cUp54u7NlFrSBnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YdwH6MbSdlsrCf4YgApBgw3WaVWl4RE7XPNP1oLH4co=;
	b=APhnj9yuSoGKm3AlyIkplhN3nH3PZ44aP/jdJKI7FmGaOHTNuQOE8n3iHxSvQNwH/JMN
	 raJgDytpez4OLiwzX68EfOQYjcNCaP/gevncRafYm1WiQWng5uzl88PuVmSGrZNt1EKDp
	 OQ24UL06SL6SZExNazn0p+oECnrPkYLjrwO1pk+VfS/qgLSjCMAEYVZYezU9Ky12INRaR
	 4d2XdkjPyOjWOGX/9f+w+e1iv3NF1a9fHXk31OdZ2Dnf184CI7Q2HpJTIdZi/ZSXJD5uD
	 NYvQ8SN4sh9h4h1Fd9HQ3vBsM0DO3YGPxAPaAlB0EUVGMyGgzAOOPXwUURR2BUPMDYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1qn420f;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA0606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAA0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1qn420f
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8635435e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793997379; x=1794602179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdwH6MbSdlsrCf4YgApBgw3WaVWl4RE7XPNP1oLH4co=;
        b=w1qn420fLHO7PyujizRYZqZsJNPZgFZ86LIOQCgn518ex5BIAShd77wXlnZh7jW7oQ
         w0tTutzajHzCYrREnzMMP9n5NTOlXdGxFc10GdxfELvR/nbDOhtkeUx3maaDEiyJYsM2
         SOWAIXqbqKIY4rfyS2YNSASKW+9xlurrfExXLjk4cHJzGxZCX/yn5mmv6Dyv2SEMwep2
         mGILuCFzrX57pZucbVrQKhj+o4eckBQvY5ZLEpAqqG6wmnZdbP1QIzTnMzHBNOOhNde/
         TMawIMJZKr8kqiA+/zuwlyAS6eupqzdMUIm7Tf9Xeh4n9BaFxLLtdu/VqpFjLV9m+EIw
         NFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997379; x=1794602179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdwH6MbSdlsrCf4YgApBgw3WaVWl4RE7XPNP1oLH4co=;
        b=cxaUiyAxFM/gUl3WpukuxIJEz7jo1fb3X0bU3CUfNY6hxyrbJPMpBDgrS3FiVwmah5
         Fth9WHBBzpu7GmTpPv6oVE3/YRb7gAnig7rOAMk3qzymqx+t7ZoplwqEnoXkTiUof1nl
         W6pGRn1vtoi+FzKuknIDHpKEF+tv1qQeiTEv/vzAUN7gQXU+ttf2SeRSxZnPiINKiJmT
         P+U4p5ATJwJHLIRbZsAKzKVzvEFIqzy8ZgQ8rJDTwMg1E3C8wV7xng0MIczf3qZJyXNW
         56MafsX3/2GJ8mBQrgtlSrnJ9YkIcmgaG4TxhS8zq4P3q1geKOJJpgbl+EFCv9h143qL
         yg3g==
X-Forwarded-Encrypted: i=1; AKwUvBz10kHbsBMd0xYcdvCLQVSQeeB+kU9kj6C65GI4IupQED5ghA24WJbyz4dwqMRzAOZTSDpWjKIJ6MykM98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pV+feHjOzwTlNgb/sjPNf+SKzK/hsJQ3qnSpUC2/rQruCAJ/B
	5NmWnmR5FKLeoiofA8mD16Uo4mOSffN989sxyl8gxz3lxms7703gmcrk
X-Gm-Gg: AYBFou2ndiJu7a89LU5ZGLVBWKTQIYov1/bgK4WW/cBjdTs9NayGcR71u5crn5qNdXE
	dS9xJOwM7AbB7avCc8RWui2sDjvwjs2c3cNKasYg8BkjhHKA0fed/y+mVOBC5wn/krjEom7RL6p
	VgZk0IZruYStY5p7afREsrn84seRnB4N1YwPc7OafMmksQ5tAJNG2ZuMvHT7Uz8JmE0PzkZeylb
	VCgJCC0DUxiWbfm9LeNI7zALHgc3W/sv2Z8hj6l26Uvo2gssj3Y/eIUFWdiLi7FTe+VBJdwdUsC
	KSQw7iXGMvYN7fpUIVkAh2uU6rFisVN4zjjHmsdvnHxo2cu8zkDajzz6Gm4b3iaF97VJSbx+5qe
	3uAvA6VJgl/xO4NtzkN3DPwNIBtWwleWL6avbpxVyKPf8mcrmT9xq7BFiIoMfBcT025hTjssj5s
	pVAmD443nRSqzsv4LGSsqeoi73UIDteymvEjcQbXjnFwDxlrFXhqCOvONeYMbAsCZ896cFc9PPM
	u2wzWN6pq18AwKu5OKfjNmDE0ffZCy93HzRPCJ6+MyNNjwM93oDMMCJEewbxi4Xebz7LI+QUY3Z
	mRshVSDi3wNchxw5QPIY0pElKJ/TaIdyIZACNoe16ZQiATWAblPWH9U/S7G4KJATDcfXX0zsota
	To8c=
X-Received: by 2002:a05:600c:4fc7:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4b6dea69b10mr67372135e9.12.1793997379131;
        Fri, 06 Nov 2026 12:36:19 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (public-gprs171435.centertel.pl. [46.134.8.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm10183925e9.11.2026.11.06.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:36:18 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Yongzhao Chen <yongzhao.derek@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v8 1/2] net: dsa: qca8k: let regmap serialize register access
Date: Fri,  6 Nov 2026 21:36:15 +0100
Message-ID: <20261106203615.19274-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aee175b.f01aa0c8.37eba4.18ea@mx.google.com>
References: <20261104120130.48455-1-yongzhao.derek@gmail.com> <20261104120130.48455-2-yongzhao.derek@gmail.com> <6aca850a-ef67-4451-aaf2-977be884d1b0@lunn.ch> <6aee175b.f01aa0c8.37eba4.18ea@mx.google.com>
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

On Fri, Nov 06, 2026 at 07:07:19PM +0100, Christian Marangi wrote:
> Both mgmt and mdio operation locks at the start and unlock at the end of
> the read/write or rmw operation.
> Using the regmap lock seems redundant and this is why I disabled
> originally.
> I would like to have more explaination for the
> "regmap formats the register and parses the value in the
> map's shared work_buf, outside of the callbacks, so two concurrent
> users can swap or corrupt each other's register and value."
> case.

The qca8k locks cover what runs inside the callbacks, but since the
map uses .read/.write, part of every access runs in the regmap core
before and after them, in map->work_buf, which there is one of per
map:

- regmap_read() goes through _regmap_bus_read() and _regmap_raw_read():
  format_reg() writes the register into map->work_buf, ->read() is
  called with reg_buf = map->work_buf and val_buf = work_buf +
  reg_bytes, and after it returns parse_val() reads the value back
  from work_buf + reg_bytes.
- regmap_write() goes through _regmap_bus_raw_write() and
  _regmap_raw_write_impl() (no format_write for 16-bit registers with
  32-bit values): format_val() puts the value into map->work_buf
  behind the register bytes, format_reg() puts the register in front
  of it, and ->write() is called on map->work_buf as one buffer.

qca8k_bulk_read() takes reg = *(u16 *)reg_buf before it locks
anything, and the value it stores is parsed after it has unlocked;
qca8k_bulk_write() likewise takes the register and the value out of
work_buf before its lock. With .disable_locking nothing orders two
callers around those steps, so caller A can format its register,
caller B format its own over it, and A's callback then reads or
writes B's register; or A's value is overwritten in work_buf before A
parses it.

Two callers that can meet there without rtnl: phylink's resolve work,
which holds only phylink's own mutexes when it calls
qca8k_phylink_mac_link_up() -> qca8k_write(PORT_STATUS), and the LEDs,
e.g. activating the netdev trigger, which calls ->hw_control_get() ->
regmap_read() under the trigger's locks only. ethtool -S and the bridge
callbacks hold rtnl, but the two above do not.

On Fri, Nov 06, 2026 at 02:38:37PM +0100, Andrew Lunn wrote:
> Do any of these operations which don't take RTNL do an open coded
> read/modify/write? Does the regmap read/modify/write operations hold
> the regmap mutex over the entire operation?

No open-coded RMW that I found: the phylink callbacks do plain writes
(and regmap_set_bits/clear_bits on link down), the LEDs use
regmap_update_bits() or plain reads. Whether regmap_update_bits() holds
a lock over the whole operation depends on the path. With REGCACHE_NONE
every register is volatile, so it goes to qca8k_regmap_update_bits().
Over MDIO that holds the bus lock across the read and the write. Over
the management frames it does not: qca8k_regmap_update_bits_eth() is
qca8k_read_eth() followed by qca8k_write_eth(), each taking
mgmt_eth_data->mutex on its own, so two updates of the same register
can interleave between the read and the write and one loses its bits.
The LED control registers hold the rule bits of ports 0-3 and port 4
in one register, and the LED callbacks run without rtnl, so two LEDs
can meet there. With the map lock enabled, regmap_update_bits_base()
holds it around the whole update, which closes that one too.

To be clear about where this comes from: I found it reading the regmap
path, not from corrupted registers on a board, and I have not seen it
happen. If that changes the case for net-next versus a lighter fix, I'm
happy to rework the commit message, or the patch, whichever you prefer.

Stanislaw
