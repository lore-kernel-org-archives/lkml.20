Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268107;
	b=X+JIv5jbF6Xw1t1ginh8DXp0ywAH/bLFGHckrevYMULbh1ESVDE4UVvrWrcc8Fk2B3M1
	 IGk9LHrg82zOEh0TbJ4YSZoAb3Om2DCw0B42ZHuDc4t8I7pvw8d9Bt5sfuW51lq4d9tkx
	 Ag9cUNOF7WVHArHa4VA/oCUgUa0Mm1HagElEK+X9JPBVTLkbNQCYofOUoNm02gQw+roI5
	 mv1qj4kNnyr1T/YdqVte99dUtj42xU8TyLDE3d/K1HqjwFyx7Nlr2dAdARI20xQWM8QPM
	 uH1vjctWHil4zX0ZqoqSqEWVFyAf/RlMivtcdk9omw7dF3xeOgf9MwbnuyvF8ruMImA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
	b=ioWSeLmvKOGan7LgjtuKI/FrNh0B8wmPH9C9JWZEi8cwkUbEF0x0nme/JUVWPt4i7czo
	 FrFaUDQfZL9qjFqFciVHEjW9vU0/WCsIbl2frcvfGUhOP52pdRQzED9E5PrqFhriBBuux
	 z5OGHmR7TwV/ftbBv+ATFe8xBsYVtFSKM3MlJD+UfxDBXj7OJTbvKH4dQ6qAC5fZkrj37
	 du3txSY1S9RlGKVFEHqBL/3kcP/FKRLbq0Bbow7Fz4Av2Z4dmqFUkiQwlW/e0C8N/tdob
	 df0O5feAV0QDEZcdOqQYi0hLfGVZT0DbucegUqJjtTFim90SxqxHTjyLxgE7aMHpQBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jQuOzM9I;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36A0606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36A0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jQuOzM9I
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso710092a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268106; x=1794872906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
        b=jQuOzM9IX+CDejyj9lEWy+Le4fLWrgxC7pMqccH2Wg5zeC6uE+gBhFkr2MlltqoWOd
         nwcJJbgLlw0d0SVbrPNazeM6EkV0FCn//l3MkBQb/eHF4mzoweVhEaXHe0l4Za9b25HC
         C4UY0h+aqhJr0zzb++d+49u57+0DL6Sxlpfq0BJO+0ZMipk47YrbfVjl5AkxwbDIn02T
         0mllEbzO80n4b7j2pdHzgQCG4JZExDLTXneo01xNCHa/wIOUcWHJGCCksEWzX9AFplUi
         Nt1RakJxy+9VnGhYO15sqHkEv1SYKCSGqdT/bmHYbdMKAff5l3mk/x3MSnn425Kd9gOC
         hj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268106; x=1794872906;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/K50kU4t+eYXUelN7qRb+OFgTRKPsxADBayxqCC2Y0E=;
        b=oLtXp89T2/yBIoI8adbwjUah3f6lDvPtAjHgJBxU70albpS48NADJaL58w9z9oyUbW
         zKreoo50gkP439JsfM9tB19XNkDSD8s4+prXwa2yCiCqMLPwMyqoSn30cttCgKhbwJHV
         BmF3RGD8Bgo3ZXZ+4wsgYO1iZxMvaVmw4sn6zoDksi+EFSYmDViV2GDe3sBB51F8Hdr1
         pADBEojmt7XPMt/HKzRx0FHenupRyppFII4tsfMLdHQKG3zHkNlvwKoVIw9juPQDOHnc
         J/CLvuRCupPrb4dqmxPQHuspGvT69/EHKXlS7d62kBTqj1EaBEkiow2p5RLEMQpjOIBl
         h0AA==
X-Forwarded-Encrypted: i=1; AL+hErEvFxbjkR2OMO0J3dHWCy5tRBaokiOUJt0fup2Y0MjcT9eMtNk8BVx5tqJCm5SdXmkn9bQTikYeNemHflQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OaU2AbqCqrXqrZ3XSLauKROHMCick+NP3ZqqxTfcuHcMagLPj
	theWkkrA/U8xUvhIUKsg2SR2Mq+RXfAQ4Jma8+FZJEx/mIYezuGifiT4jE9G6u9SQ5E=
X-Gm-Gg: AYBFou0IUDHeBDfNKaxIQNZej/Ny5xzXZbtc8Bt0ZFtQa7FUJSKu6oVZgMmsmTaTDIJ
	rMNcZeiEEcpAJej/rCZctV7qDil0f5s/cBOBgT+78CX4h+4Ow+AkLJwPVIy5i4Yb+SFDkr34C69
	HUxWGw+El2JPdFX+XAKtgUpnHIUgmjJ5Szy+0ZHCV5FlyKU9AUS4OXaD7xSv55y9Hl1hW2lAeqe
	IBdOlU4Nl8QYjqK1/khvFD9bJ6Yw1yslhCYxhraQS6jUDPDADJDv5BOLcTaeabwsiCopZcAoWHz
	Kqcq4p8DIpqBIbnOH3al9NpeYVP0wJninpmZDXJnOliXK6IRViWldxihV5zhaYzMGjBh3hYTKRu
	gKslH3IF+2QeMRXkQEzHpQXv+45g2BmKy4DYy4RSh8ppGFtewXR0FZniuQxKTz3C0obT/LmiGv0
	DMphh0uSGsKHep3M8xkAuhnymVsdbKW/s2mWmoGBXHvd6v9i7EW6VXGAZsug8FAZ0gtIkZrb3Ev
	dvTPZl1IFEFa3PySxaZHlAz0MeZIC0QDp1qJ+J+6WdTzWr99H7TDqS1qLazYXz4SJNDR7BeYQXF
	o2ZDHohAqKdTANXlxDkNGOJWMQ==
X-Received: by 2002:a05:6a21:8986:b0:3e0:e242:5ff with SMTP id adf61e73a8af0-3f18f98f975mr625196637.56.1794268106473;
        Mon, 09 Nov 2026 15:48:26 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cdd8d6940f6sm198558a12.12.2026.11.09.15.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:26 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Thomas Richard <thomas.richard@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-omap4-dtsi-v1-1-8d987f953fe7@bootlin.com>
References: <20261104-omap4-dtsi-v1-1-8d987f953fe7@bootlin.com>
Subject: Re: [PATCH] ARM: dts: ti: var-som-om44: add local-mac-address
 property
Message-Id: <179426810568.2265990.3229558705065836668.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:25 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 04 Nov 2026 16:23:01 +0100, Bastien Curutchet wrote:
> Commit d8f1b27c9f12 ("ARM: dts: ti: var-som-om44: Add USB Ethernet
> controller node") added the Ethernet node to allow the bootloader to
> patch the device-tree to set the MAC address.
> 
> U-Boot has an already-existing helper that does that but it needs the
> local-mac-address property to be already in the device-tree and an
> 'ethernet' alias for the Ethernet node.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti: var-som-om44: add local-mac-address property
      commit: 75bded0727262a73500c61b86bb6420fa9e23f3e

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

