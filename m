Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733819;
	b=dUAEF9nr6t6zURxCkP1UaFqbQoBCKPzsLczIkfi0kOjhH2xkiPY4nuD/CBZYwV7Kz63d
	 nc+Ev0f8CdC4mW3jAMY/UL3GrAZ+bLyBd11Y+VqBdIS38nNHVXI96Tj6NwuUPBei/0+iV
	 wHVWF9VegicFXCYo6NyDe5MzUIv8DctsYvS1hRDJ/bCWvXQAgymdhHzlreP+qwc06Gk8E
	 sBVIg1NG0sK9eCSBW2cOjB7OcwFZboX1O0x73pbxVfspeycHn8SDrhSGCjbbbQxUDHI6b
	 3R7N8bLFJzi9JTnq93CTESQ5BJeCZBBbOmovGTHY03r14H1D8xt+kwW+3LjsOP6dsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
	b=5PLZWhZXIfcTU7EkwzY+qlPOD/atN6oK6wicLBzxHq/7DnSixcetFl/Z3NrOjsM4vuFB
	 nPXzvdf0euEQrkXn2xsDV9+rG5rZZRywUFat1O6iQW2MUjA/FdYK6/xNpLqVe3DbZTZxp
	 IQf2rv9lsMO9laQ727ki/tIZsFFzs7xVYrG9C3ExoOv8otyvCms7sIy0cgwJqvWNLis2L
	 A4haLIABwNSkp5VMJ/Ok3s+adQHNx9S17MoAaICoqaTppVINNCpjFVVKem08bvLCLUUzy
	 lfroeJFDpT3Q4Q63PKAc0ShXrmkK5tSzfMwQWMTW4olRSm487dfuUm3GGyJm9Z3hxKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUeKWbuB;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A56606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69A56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hUeKWbuB
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-716b58a4365so469321eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793733818; x=1794338618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=hUeKWbuB5zyDbHpFb4I/fvFIocB9Pse9sJLRZ4OuIFliaF9iTzB3y6LOoVblsTPgEU
         ZJ+EedPz8ac/VierSn3i2HmYmFfhAVeH/EIqQuNu0SHY0xBwSvgKDQUzJq8PFoSG8gNE
         YsLubWlX5zblBqsvYsMbHhmZcMGu14Fak5iUovb+clJPgeVrIp5RVTHcRVrmVyUshfz0
         N88hheLTXG8RjOmhmXGGZ9kHRVUdsAcj27/BsGuUsgFf364Qvzf5SPrjAMfxJnNd/wK4
         O2U7hpoHcubMcEhS0YBbfQYo5lvX3WcmPIZa+ambCMR6YQlmLA1/dzCaCtBDthoB6cqw
         m92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733818; x=1794338618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bf+ycJ31FjWROHBLtqJsAsms5ifHfK4LcWycDMaIZM=;
        b=SILHr2By7iggv1MM17uySF+DS8Je1XJpf457hVzidqy2WekUVIS04atdfS3ETzezmY
         i9gHB4GwbhDHwCtgZVKaQ5qwY+kRipjGcjnQWpJXL3Yvkb2yCtaSvi/B10zNVvfyhbPC
         UbAwP6tAmh47qMGBIw1K9L3/SrrLyH2IoyMw5C3MfJG33AdKzBaJCLnlIxX7qJh+tfUq
         aI+akSDLDLeEUMZaFyvczs35q3CNOlByqCN0PsJUjNwppd4JugWi8Q+MlHC5bI0w/LvW
         6NOlXHzFC/y//xWQj5p1Bko9G2Wwodau+4gWJ203/L7Lz7Ea+RuqMbK0E/S2ULt76knv
         +XoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5H7jbmBuixEulizKAfc9C01sABhOYGONBPnXsbMmYWGcS+pMYP7A1Z1aokuaVElg1a1iIanN9cyxL78U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LowK+nxrYJ6ttPIU8ewC2/Q178qFf2pzp9W5KZ4ZzJx3VtPVR
	ZMTXsjb9cZjbhRBA+H2woMEGDY4MT1DcNzEYGS8n/njJv5RDd2BbRyJk
X-Gm-Gg: AYBFou0HZaoF22bs1vldPceOn/W5U1SHdbtzWYYLzsliSCMCGLYJwQYL6vT7pxhgQoK
	SN79c2NXp2WTEXLtbP6eycaB4Fr54QmIzE/7pRF86TJw2YbEOfR9Z5k3PiilsgT+qgVwfI4iknY
	7xSe3P5zlBvLo6SR6BusHJk8cRDcFNSqaI9TxyF+hSus1ntnjwYHKuBGB0ziBq3lkkoqHRXKLPa
	6TRRvx3gtU9izVPlvjFBRdHJeHGdFwmsiWKrT1odN7JfY1NNTGn0rLMogbukAkVeZ429N/NEvEZ
	lMFo4GPLo0DSN421G8Klur5LFfwNv3+DbeTqcCy5QJ/hcYRHNVTmulc1oWbYEp7+YousRE+0iyr
	Et+Qd3iC4vSEQ4+oGdzFiWYItBaZeZh8oqR9TrbH8ZYNkqN0rtukrlM/sUvqCJLDglVOD7tOeXw
	9sPRD7TMIBBbIRyk40L4CDf+FgC+TGoVukUE1xv98L86TSWZn9SL1D12zDfW65F6oQUwsN3eYqN
	oSqVv3QtCKFPwhMN0Hn6iNZ6P03X0jBa1m0jKH6q39bZ4KURk3am43z330uAmKLl/gRLFEBcnha
	oaoxlEKLvrdJ3hN53PFPXQtrhwoKBkojnt4AehVfAIPD9QgEbF7Y
X-Received: by 2002:a05:6820:4612:b0:702:f890:e113 with SMTP id 006d021491bc7-714f242df26mr6473969eaf.9.1793733817847;
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e16ef1sm43323a34.14.2026.11.03.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:23:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	michael.riesch@collabora.com,
	diederik@cknow-tech.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add rockchip-timer for RK356X
Date: Tue,  3 Nov 2026 13:23:29 -0600
Message-ID: <20261103192331.394489-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Resending since I left a few key people off, sorry about that.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

