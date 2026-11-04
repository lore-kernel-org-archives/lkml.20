Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787467;
	b=rO7eMrLVPhmPo/nmd1tA0NACAK48PdB0zXvbcCXh7GO4ZMecD6M263Lc1jNbBWEHXer3
	 RfkcMsrCA8M4Ubn85FhVMnIoAJFeC2f+jVwxpedbdN5En3SC2A7/tQQ+Sd7gIEs+8kTi/
	 G8NI7orTrQO/u+bbpKZiIiiD3yDGQ10bbOpUCpXnAau2Zm96wDSufVyewvGA6cA+dZ32R
	 QZoRRel919+hH7ZCo8JmAfnWivz3ZsdLz/iKKm/WMD9gX073R0TPj3I3neC2+3QwvOl7Y
	 U3fL9dWL49ByZyn8hcn/dcm0udrl8dIvxaFryq21Pk2AqKbca4oJPogbEgDo/+mlb6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
	b=VQkmiW6TAis4c+AuNFS5Nk2dFoWuNiPQtjftibAsMIjUZ5IALwYu1Aat+L8nEOL7TnOS
	 zaDvmPc5yU+YQzJiXMMjaN3DGM1Njlj1HZ8K5wxo5hXp2XiHA5tDqnjfsZEjzluq7ou9d
	 VY6eAokRM7/91ecZc35sHm3RBFtNWjdppsW0BUUo9f6218pu6pJu4TsfJnc8phMNW8kn8
	 XpDHDzYEGVnTq1+fU59TSuhu8RER9YURPPPZguHmRN4nUnSr+tjZzR4l16lJBDr9afeNp
	 zcJpz9BR9RhF+v6ml1/8dM4+jSbKeiptIAAgpMZcQlA9yw9o8o7C9g4FkbUe3C+0P+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B57606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B57606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eHnPGaGy
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e00eee27dso269468f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787465; x=1794392265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=eHnPGaGy9vjCz3endU7ujp9oiZUhTPhQRDiNW3N/hOwyLbS95T+qAJ0YpwEurjgD4h
         W8PW5edMps4nIXks6isfmzvTgbMPYOe61Q+xtyVIiNv/kxY8yAPP38hl4xgFROOY2FL9
         pvRFjtaaOel13Fqy/pwiop+UvoLlnaknkrkcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787465; x=1794392265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nafaEA1OVG7CjcE+9vFCf00bZY6KpgzCNwfvKtVMnW4=;
        b=z9BQg/HgSKjqpLwUP5ceejyKX5PKC3e0d8sP0UtxcVEiy/TrucUWy5aZsbdOu2ka0C
         /qdQczZdR7QgxL4V5Xv0N/tTNSfhWijC3BFcT1iyqUDM1cge+oraiBOXqZTlnixKpB17
         ePxfNw7m0HWoL7+PaxOC+MDUfrgp8IdENYqefKU7+naH29olba1GbT+N3CE7JKCSl7+g
         8+Edl/QKdmzPFTzFLJ3OPnwl9SUFopHj5iFciqQxSYqV0iA0+QYArn6yiwFjhL7x1laK
         lb3AlnQ0FKtQCzv1MQkF2pi3TUHpso5S1rxlsoYNr5raXTDLtCIWIEdVhzt5nIjgZzfd
         ySXw==
X-Gm-Message-State: APuU4Z9hL/nP+nB0yUwjMSwF+FNJBeWFofm/u6hdCHIeFh2EAPfpqYFM
	ygWHhRVxzfERCyHLCxlebNnzmEPKzaLAAGR9lhAsL2LNX4f1GiEhGYnS9P6jog0w1hFkgEVJW01
	FCcD6
X-Gm-Gg: AYBFou24g8iCcl7iGnFy9nMpcS47AoV86//WqJqbSXj1pMeSmG2Ht0LIEgOOo0CSEk0
	8VggwABFKuulqESaWEK60DE+FKngGqC00P3WNtDEz25fn+MxNOLhCbD6BneXYjx826GhaceOLtu
	sOa6qTam0Hq7iht+PDg8MGLKBhvWxU4cAZWK9oobcrhWyp0EIuZS2BFJQ7GFLWfUqvQZCVD5spA
	xK3VEHg+d5eH9I9xwLy8d5kGvFN3eIuMJLU78vrCBNcrpc1dvTR06Ns6RwbfkmWiJGk4NYLE0R3
	xY1BD1vERLOmgXNVOAONYYrFPk+qMXk4CLVO6alHu5PB+I/1oRvO2EzYDDF0ftX42Bq9GLn+yJC
	oohlGnI1JPiFnUTLKZbsLcdW2QehJuOBTOQ3YUbNir7zOZnVsJjYt8Y4HIM58zzYFQQynSWV7fj
	5ifV7+D1eSOINzvugpBT/akeExhi8ht7YwE5+Fc/aZu0Zy+l6Yus1r3EevlVzQrgtiEIhmxzEx3
	CNcXAGPXCynLQ7iQgSPnsEv7FAD7H0264NPsG92PgA5i3TfEIWoYTgVhqMtPDrbVNLjXc89n0Mn
	40L/3ojR9rf0PMDtDz4IM9MhOOpB5tzW0OylgE0nmGMXJbO00Gn8f54i+LZzcQjlyO0rJP61h5t
	p6hIcrFRku2JLXs2xm6XPKALHrB4WHQ+aUB0FEXGwsDPzP264XBoV
X-Received: by 2002:a5d:5d06:0:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48e6e2fa482mr34138879f8f.17.1793787464715;
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed,  4 Nov 2026 11:16:55 +0100
Message-ID: <20261104101732.4043372-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
References: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
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

The common clock binding provides assigned-clock-sscs to configure
spread spectrum clocking (SSC), supported by the clock core since commit
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Deprecate the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties in favor of it, so that new DTs use a single way to describe
the same thing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
- Add Reviewed-by tag of Krzysztof Kozlowski

Changes in v3:
- Deprecate the properties instead of dropping them

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..8759c328e841 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -57,11 +57,14 @@ Optional properties:
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
 	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
+			  spreading in permille (10th of a percent).
+			  Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
+			      spectrum modulation frequency.
+			      Deprecated, use assigned-clock-sscs instead.
 	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
+			      to enable the downspread feature.
+			      Deprecated, use assigned-clock-sscs instead.
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

