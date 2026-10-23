Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749852;
	b=3fCQS1Cn2L1Fks2HtCOsjn9w8dtjm+EJTPOvF0yxW7qrFC5MhdNZlZhXMTTM+JYPGg5T
	 J3FOyJ3OA3CCLKhGiajTcIBcjGgLCG3JvTAO50C7GazrEeTclK/jqZJAsOxa1AxSY06FS
	 Ha3Pdsq/w5/2FZNM3E6GFBUrh2iM/thBTvLakpb+lk6QL5mfc8cwpfkl/ELDKPe5wrTse
	 nmgz2QAgcLajQVJ5C+0E2FFP2SmmdWG/rgLai8u1lI2S5VIVSTlw/9aT66Z/MKQXkSSM5
	 Hu5bG6VfXagPno/JzGK2j1cqnMhfTGLy4sZ950u90qgGw+IZlrB4Jvhp07HjTWMaQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
	b=t3MW6d32dntr3rGShM/qu3PS9v+gGeClW8Rf1SkCY2ZSfFQCj3OashtphQ1bMojxYLyB
	 4a4n3qn6ZpVHxQRx6N0cTFztEnJdoFQNrrDloJ+bMjEaYxbUkdgOhH93Oay++tVWZLTOX
	 R9Y8CedF7ZtJaxKqT/OrV5NUGllV6S461jdQrKpb/l/y8AfLlNunOuolTpsQNgl+dN1Kc
	 Dg9IcsPcTCkuasp1yA1IEDoas1aBakPDHB6wMuInnrvXBIY22ahlg6Jij/FWK6nObGp+a
	 X3K42aMCxeRwzpSwWMJ8tqggD+UxsNyZGAGjETPvlmqkWUKpP65deOmRXoxboQHzs+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Bp+v017q;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BF60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7BF60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Bp+v017q
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afbd2c386so367542f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749850; x=1793354650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
        b=Bp+v017qOOHv+fGEFbZyhDKPjmjPM8N2554dXu8wqilzQL6POiidZKPC1fT+9/0i9P
         YckpdzDhRv3e2fKa5BRVBplXrHGZYq8xnpQjU42AEftxpLEDDC8tr5y3LrXNzzUt3b9r
         Wg+X5V5Do4ofmadBzat4R8plYNZaPnMZwdf5Gh3jwNkCwF1lil9halJlpZ3QQbGfNgR7
         R5+Sg+SASg71mQYF4OcJ24EadKUCsu0e+w2TF8AMoEZZ/gjhKSVWMYvbOLmK0e1VlA16
         DI8c1AS3HUtb+sVrFAjKHKnqZuJcvNtQHcBVBkB4eQwEA2NHzDRi0k+haz+IxoW3Ph5m
         +waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749850; x=1793354650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WLd0lU2fh/YAFZVVEuZA4CYWlgeDeL+IcAlXVNkPVKw=;
        b=JXoLGp0fb33AZJe0jonjtdgDJ5G7QU0G4Syd7GNZKU7INCyxt7S/sMGurZc+hjieFd
         b8X+JQhXVc3NDl+LCb5dfH7Cb6WawJF85/OwpviZa+V/vl3lFuNNFiOpK+AflR8MxQft
         KWn5Yq8PhHR1qXmjTU9+n3SFecEhW2Hyi73d+2jNzI8KW8ysZBGpOhODc8flAoR7aqbK
         hPLmSCWgXcI+hesVOurJWd5pUM+8+4tGBtAb9z7sGCDUFDrh+EpuWpk3tQHdlSThyLY1
         qI63a72on+Q/yIAPd4s+Kak/Eg4nO7b35epkYdNyluztak1PGpE8KSppKKHxJnister0
         rayg==
X-Forwarded-Encrypted: i=1; AKwUvBzSi13jJeGiu4wN5MR1f0eDPCyF7+4z9gC7lvEAfnze0QIBQo4wt2+4ymSouqhNZ3/vx9NwOOrLzN6A68w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNg4vW5AcXp6vGPvPzfYo5+G3PSgN36yzJEUw92CL4BByrgF0U
	h4mhfZWCMrUKjpJ8XFPWM/niLPQOQ24E/GP1Cx4WEwPvz+Mv7juKIN2ZDDDe4G6kwSs=
X-Gm-Gg: AYBFou2BWVjXyEn5UwkNca4Qm5JpFw/RXRXsRX6nSvY1fm4ywMlXJFIAwpi/EWU+jF7
	JMRd3Ye+M1RTiwXZDqxnth6FLcOeSJLL50J88yyPn/pvux3Gen1Lxbwh16aYP3Wkt+kuIQGypnI
	nqKYCZ/ZDQ1apoOefOHHSR9wp1B4a4DPOSQhHMDE46n6tURGeIV8Plg7np0I/Y9B9ve6isQyt76
	Fn7f2Y4Ve1MbtCxlx0pyfadPbRhZC8V55fUrKUzUMtlLppe0jzV+Ou7x28j4lD1Hmx0Wo3MdT8e
	aix2nhP8S7wKgCkgTPBzeXK0wZ+SxNvAArZ0oxQ9ekpKl63KlhmbXIr+Ps33WGNsaZ5po6fazrO
	Ewr+YXVXWd6iXH3csSdN+yUr66sEJq5Sh03PmyuvlJ8gAeIeG4TmeiVI14yujnjEqz64GsRjeob
	zOl7l2MGwx6hM+TEbZXGqvbPKm2Mr2gERQ/EUoC/23CFd5eMP/5h2x+i9eRsZfwV/2xywS0hGFp
	g0oy03rDfuqMmbSWJcDTxhjo1B4DDkcDFjBe1W9HcIjO9J34i6lVT7uF/ttVqfWxR8e7HBB5FZZ
	lCb91m7dEqdJhd+Ie/YKMLr7W0XwIJnu1g==
X-Received: by 2002:a05:600c:8882:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4a211f29fb8mr20172565e9.32.1792749848816;
        Fri, 23 Oct 2026 03:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:08 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: power: supply: axp20x-battery: Add the AXP2101
Date: Fri, 23 Oct 2026 12:04:00 +0200
Message-ID: <20261023100401.67592-7-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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

The AXP2101's charger is programmed from the monitored battery and its
registers differ from the other models', so it gets its own compatible.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index a90d558e7f86..6a0a0c3f052b 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -21,6 +21,7 @@ properties:
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
       - const: x-powers,axp717-battery-power-supply
+      - const: x-powers,axp2101-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
-- 
2.39.5

