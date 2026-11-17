Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936529;
	b=OpvdE3cf7w3G0K/qYtJoRf8MN3NCy7YL3BHMLirD+m9uPlZXRxALiNiaZBx2xvmeh2Pv
	 dGCIEWIIIM2e2AHQ/oZTPbM+l7K+QEeL6bBLc9Br0kGNrhmJ+DSuq7wKYFW+7IAO3ZJUf
	 xn5fYIR/Hn5IRBeQWRhxdzcr4BrH1W7pE2SeroiAQzcLOi6j232UylSl2wMhT2uytUMDK
	 7VTTUdZ9K3ikAoEw35IjQFi8XYAsM1b1GSZgUWnkLZRVTHy7Rz0fuzYbWvDqMHN2FXnRd
	 O46cUVVWXqX9ewrlXnvu6QyP8D1oIwKlS/uDuMW8Liz7rDlRrpSi/cpvtgdq4rprqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
	b=kAZ+ssI9NSnnBME2rpS1MF1/k2Oa6muB4eFLn+XlbsPsGmUrsJWhpdKB+xE0SMJz9DIf
	 PR5TzBanHkZzn0deQ6kJUNJLomCqz5Fp++MQHbHVaWP1Zhdm5PFP5HVza7kTX90yc5xU8
	 CBlm3DIz64aJM6B2RDR7zyKqOHPQHONcrigfu4pbBdYWovYFEmWVfF9k9ZreQcRJfAGXv
	 A/FyKFQlVFlqjaIapn1rk5M/5qXNUCMCrwp7w0dlquzLFKuVOAWcAoZ5RRXb09cJRpL8H
	 P4Z8BfxHOGIB/+i2L6uOcpjdii60jn6VoTwwW14TWsRTdGzi9Oq/0/EMdpP4VIYWjAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIr3nYAh;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E6606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34E6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oIr3nYAh
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4ad4072943dso21871fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936528; x=1795541328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=oIr3nYAhAtqtoBHgFOIIoMNOSQ7p/KonG00DDzGT0LCsb1NqhyqEVe7c9J1q1do7gy
         GmmRkXB98CR9gY81LBP7V9e+gVAil48OJbe4kDrFOKOM0BXt0V/7o7KFWTKI54NX0SKw
         gUYroQqOt3bBQhCEIWy8CdhAEOlYGkyx7BUTxtanwuxZi1LlX5v0HQtM4Wg51ayXIwG2
         /XbZxpAoaNmGi/7UvR42Dh9ZXXBZeVfhndlfexdpAw65RYVpbW47kPAVe6pheTdncvoO
         7rkUwOtshkcbBVxRpLXmdHjHTjYO78iyzwI2wdEfN6X5XzxvHMbRq+o5NU6dF1/FKIDp
         dk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936528; x=1795541328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=HzxOKwfUuRefLMwzW17dKNUfzg9ptAmcwjGGO197Drhtfw24SwwvlC8r1r/XMsGybF
         vZUJbbes1RoikZPDFNHbK/lNPg9V+DtViLBpjrOLsiCGjqj0+CpnhqR4Mf1SIa0LVRfU
         Jy3Mc0VJ9azkAzuSkqT28wP3s54MhstZjb+/854rtAeMLqAjqap9ypGlGsfN1iAdalGU
         R9MWfSp63R8CwfX2ALHN/eLPmMGyy05CkMm2ZQFuE/AtmR/BOAySyaVSb5dgNw8mW1K5
         aNRo0UF8sWbieC/AfvmlP+76jtNGDwMhhzwOkFQ2DBFnGHgLL5T4x6j3bbL22GFAfYE2
         eHyg==
X-Forwarded-Encrypted: i=1; AL+hErFk76ufnuStzEk9VRU9ebaKKTF+RI4XnM9qRFyDnwdu19rDii/MrBMV5T8ogK1o8IPJm4fbN7LdeBVc+qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zgdqXA+Xjw9fhPYqwO2y2N3EGdn2gPNN09Z+6oXG1ZHzqeWet
	FgFa2c9ujvo7+slaoJ/tKi4qkpuZI365tz6YAkgzqRGRksaR3U0flhXa
X-Gm-Gg: AYBFou11mVPKb0Q5hrBXwvwUKvF0bF8PDnrBdUsO58X50derg5rut1xFjWIdAYZ5UhV
	XpirVQ8xeFkz+qjft9qpsXzg9oNkpO9yiJUyhxj8kxPn9/5qXJffJwhGHy1rGe2ZeTXoQhmWEvw
	rV1yXqmo9LtCO2/MzHYUnch4ztr9zbds0seFDqbNaYJV3Er3jq9Kd1G2tGNDStrZB8sAA5clXzZ
	Y76jf85DoHa2jkb9r7aHuABRt+Cv9uKAFb0sRMwb0PDppJtH6rzhkKPXniAbOmnCD3GyQRvKfkx
	b6lWhGKctH0uydNSNi5H/gB83QoWbXFNP2HAKVm43z1v8VPnCl8AgKUlnGsSGRlazjtMgNniBUQ
	rI4MpP30t0NO0ZMc2c7cZfN8U7k4zTqev9iJGnOytKNRY9DnVfZ/8rL8ob1cqR/68e19M4nXEkT
	5uRq1csoIzoMLAKvVf4/q+eYfCSydPbOtP7xQxFOO3e93QXZCmhgP6s+l/jwQDQuOXnZpZbZ1p4
	EPjrjKwb3D1pp4MuM1gzQM5xAFgn3sBWKCrMTdrNjP76fsMfgsFPxvSOdQm03i/KQw7AqoDeXpE
	hpjBdf8CZhm3QddZBA5GGwGRenWoFQ==
X-Received: by 2002:a05:6871:2e87:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4afdf3ea53dmr11909331fac.26.1794936527583;
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue, 17 Nov 2026 11:28:41 -0600
Message-ID: <20261117172842.65346-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
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

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0

