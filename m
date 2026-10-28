Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173483;
	b=MPwKB1g5cOhV/JKjm8JbD6kOyvHLNhaDUYqZoEo7EfB+AX4VlKm4VJJMVj/JPW7rLbCj
	 SzjGIahgm5rqkgyotc+3iYWK1aUXxDsF/bm7lr7X8mbhSX2ZVgpcoUT3i2qyhB9v2DBVN
	 oyZ4715AJikaiZtNFoSZ+PaPn7YhpFZigs1gDGoBvstlWtVOvgBJvhqWnnBznPHCCKMUv
	 IzQT6ug+jhMtjUvp8MpzVfx1k7RiutfPnS9OZFL0KCLhiTFe5nR2+vfx+Bni5y7/e+GDZ
	 q/IVqlJqXIoMMmQQyReJQ1w4Z+jiCIKqkQaF5mP9E34M0uzm1Dsa/RCq5kLXWpa05jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
	b=gjtc05JheuKvKDYv1m62JlxDDL8zx/T4aKYWok43SDG1HfOOx8FlOcqhnXn1aPteiwhw
	 EFipk6Jms3QDTKSaSNAj71DT2rZb09y9s8ztQjS05Keted5n58ldak8M8u2Uo/C+LrW5L
	 wkS1H+oWf2mRZ1NmDSlmlvrbl5PaQYxMTpkkCk8VZZFBcFSjiDRDs9woM+rxkcKZ7RHgy
	 ZKjhMF19m6/jdHefpzr7OrXYmqoAyhJYIY5cayO+xiQL1Y+yZgNH0L1xe9/o5CNTWvbIP
	 ZZ1uwmY0PNjepttB6gQ7cxeifwv5B9gFlIjNFSmu83hsrtmzCbg89Zo+8ayQpzywezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC64606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC64606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=nrdMt9Vw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so6653995e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173482; x=1793778282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=nrdMt9VwmmOe28+pqyx7enI1UOG1KjguwL7POql9xO0XqbrCrqez9lWvBKHlMP5ECj
         7oG0A/C4RLtkdSXO+nusOuulRlJaobkaBE91QmUonmXLjMc2heuWLbjw58LQtQq1SWW5
         cfdJvtdwG63og663E7nszcJuNHHBFKm15t+bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173482; x=1793778282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7E62fJcGHq55xcKvRmAIwxtjg2iKkbG/L6LZzBK+bJQ=;
        b=Wa3eF4Yi2eXixu7290L0BIUzjsOMaP0S3jhxUq56AEBGUg8b9KlRwanU4veNgSd77K
         5tns2H8RvTETLdkmqk6Y6IMQyzbICQDBzaH13sSIm27tCpVLP+ckOQo/+42tr+XrAZ9n
         92TNeAJEonXT6G8K3OyDws1hCm7mqhNwged9vccnqEGW2F5cvzxS/XziHq70mKCP5Dug
         o3Y9MWbj8t31l+sC2nDXqGlrPwDP8uE7lVH6IKtJpfEJnETLpKW8b+DQUuGhXOUaeDaM
         qYriTPxFY1VjXJYw70eZ/F8FYuqJcNGpGTRQAZpxmz0eRftYbkeJjOVno3vKBSylMr/O
         +MgA==
X-Gm-Message-State: AFq9FYLfmN0oVbXdye93OrjP/oevNdUMRvoo8qC4RxM+iE27Ie5GYEDX
	DttTR6/fVQYoOYVG5bTqnH2RDjl6VHAEZ/tWBRfua1qJk/KoCYW2Nh2eICQ9xUEqXLxa7rf+vex
	RLgpC
X-Gm-Gg: AYBFou0BGOrcob3S8xLas8s1VhC3dgXrmFLjuduNlLG65IAi1Y+VOOsAYJK/9Lu+A2B
	s5JdXJK3mfv7VzR4wZlmN/a6ep8InAVbMI8yYrFZU47VMqJma7nOX583neRHK8i00htuzim9K2l
	gbLaVt3jwGkTr/zU6VcrGlj54GbW7HAsWDzuvphAy7dPKobqTb7TXGC5x8S1Kke2PifBgyrqW5h
	A9ieHQMU0pm6llJyfmf1mubeDGnMikI3WDdhlXJFPTXb12TigJn26TRPjqK8qNMWMYHiAZlwTSY
	Rx2qF+f6XRjA2KgUlbbmglpgZc3IGSRBfGQFFzoWDfW+b4hTZHcZzU7ROlXITzb2+03vZwIjXRR
	fjivgpq13pY7oDOjeJ56cbfJ2V1Y3fcuIRwlu3f84Poo/Q4m0U144QxY/FRkr4DVtIlOQrSkc00
	0QoKLu1xLVz2BkJMvSp6+gjXbAvEPlEHArPmhGM1iteSkU+sqpf8JJ8kZoyrgPBqnzd7LVVn873
	dkj+jTVMYKe9OxVUGwxszVhhjA0hi/Rblcrhq42hm3lJKA3YHqHKtQ2MC3SDY99Xmj1rQe6SrbR
	76gitHiQOEuyjnnFMQINBU9gSkSK+kaIwOa4QbE8EOLgthbKTsJ3gUMwtf7fRs6763h4ZJGxSyM
	6SHIF/j+/Wd0oLAD4aCifDBMzoT3tzwQbM3sFpiVm5HN8yzGmy+mGX8IH6BRy4eu1ASUeUr3mWu
	MA7QLj6El09zVhM93XCMRWEUUOya8=
X-Received: by 2002:a05:600c:3516:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4a966c4175cmr28825045e9.18.1793173481947;
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: clock: ti: dpll: deprecate the ti,ssc-* properties
Date: Wed, 28 Oct 2026 08:44:07 +0100
Message-ID: <20261028074436.1958132-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
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

---

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

