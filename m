Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767362;
	b=GF1cNqzISBt7vvoU001IlSYGoTxiMyKG0Qydm2TA1y3KcsG80enSBoH/YqniujSAE4xN
	 lXWngIu7nOopj5AOzBF8tuCeLXUdF9Y4RHW3x118x2q79gCgR6WcxKKSTfsDaqv+N82kP
	 lw0xSF2JR8I0hxBXzgTtOsaKK8sk3rOcmAvML8jUI6WQAx1XXZNAc4ugKYtbr6qa+byG2
	 W2D8ig8NXE3bo/lOfNRviv3FqZkgsWTcsbSBLB4uVO5x3EYQeT2vCTzRKk5NuO7wgejub
	 h2zy6OHMrGuPUV5kuQMJyY2KK0JrMINl5xLXHFBjF7+H3vsUm01iosIv2cRYsuqRo1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
	b=ofs1BnbCLiII5Ud5zsTa0fpN5xjoRm98ziUHZ889Y1KN3uUmd4yfEDL+BJL75gAwunE4
	 HfcXrkEtznfjJN20YEXENaNQtMbpKCm/Ed1YX9frsUyI7xBX5nNhc6hSpmcrqw8soXvq8
	 lL6qpGIT29KtfViknNhr6er5oNv0eL2zKNQC1kavxwfvWdxns3KHz4PQ3lIveYalMoRB8
	 WQVs13i1YJrvN20bajOw5IXciPqH8+tPjRvmCyQ9qaQz+++z8b+CUwHFTufLh5sc9yX9x
	 dzCY9Fjw+1ULrtLeMr16kL2JL+1N73GWraMZpQIVjumLAqidI4FPjdd5eR32bUlw7mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE2E606A32F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE2E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JS4slTlj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so354051f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767360; x=1793372160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=JS4slTljmmDFN9zzqecOutQb4/qkaxdkf61XRiBOYkMWrNjBIwFAq8E/4eSrH6FkI7
         bLlG8vmt8xQ6eSlB1oyroh/DhTdXl4Nog3M8n2SFkCbOWnnYYf1dc9X8ThNjRMSwLX9V
         JTSYWtL6xt+KjCJ/OJQ+GxTh7uV+2j/OQlCb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767360; x=1793372160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bdn7JZKlrSe802I/W49m30XlcFM4hLN7khRfrE0PxM=;
        b=Afmhf/W+q2W/LMqKNL3yvpmo67oj7Z1F0N05NXVLMMxlDATconIivFkr2aoCpgWYaB
         g4O+CUtNcpBePSjC17dXsMpMlEDPaV/OXsFW8LvgH/o2d+gBWGUXb3exwr/0g3F+Zi9P
         BKz5uQ5b0+iNVHp61S5P9QdxSxBsEKqT1er6cRbvImVCybHRDRcmYB56V04oc5cHbMME
         z+iGKo3lmOTgZu+mS6ywUIDZPrLR8tlWFHlEnOP25eNevuMSQfjE2y5niz/0gLUxnDoB
         igt+A1s2Q36x/iZsX4gfn/t9vuFNiucb5RQieyLI7NjIUPhePjhPnyyvgOBVbcvxxWOi
         LIgA==
X-Gm-Message-State: AFq9FYITvBXvJ72Vl50ZzjK+YYamIWGKDQDFY8DHv2mNL0sT2WVpflM3
	9pm4dfPytrsk4oaKUgJkrgRoB9XxWUq2pvj5bl94M6hawWwbbKAKo0dPRl9NeQcRmnLP/bZ3Wpx
	ymMRF
X-Gm-Gg: AYBFou0dpBUDBP/KVO7Mo522R0MUZ6LuFR8IGw1s8cxgLs+htLdC3nrdKm0q/kPDADq
	hW7fD8eYiVCEDzEKo7H4tngiGI4qn0fXu+IYcXuDyvrzHUID8tXSuHiYX3r3zAUj1Se+JFildVI
	GAxQ82S9tOZqCxlZlSuZNeOT3DdBOHHZHUtPLjHa3+CVQX949O3DyZ5jJU2xcUpwKvXfWuL/phW
	odQYwU3lVlinoabLhzmny4y5Xy9T3x75LWzWmwrNzJn1lVzerd3tHWL4xPNWhNoqYjifgK+biYz
	O2bZkPWsciERQcKYNORoyJ6PBS2GRxq8bwT3S3vil1XdTVvSNPQ4+QdfDj6oowT7Da5qX7/lxd5
	FKVfLRwR1VRuDKrO/A5qtdtFfPtlnsriQXmQOvsaLi+13uEqSqwYJCYqd4p1AwlsrA7rXBKXJzv
	6CSo2QUReSueWXAS+K8aXWYI7D82yB2TPjBBMNNM/x79PYEbdn6Hsz7XBeNreIj1xZs/7R9942/
	jY9uFZxcuFCRRS90nE1kPYQBEWGc68PR9S1saaEgKprVAfodjaY6dyjQBXvAsAvVUijsduLYsQx
	OxcMs9IifnIRN2d+20o6lUpsS27DG34XH0cqBZL9qPo6//LPhNinRM4TiOp17BJKA80PO8+GeWs
	QfqBqyIYaruBubBgOIQ/eGy5IrdQIOvYiFbbfI5PhyBzVL59VSIgV
X-Received: by 2002:a05:6000:29c8:b0:48e:3cf5:71fc with SMTP id ffacd0b85a97d-48e3cf57222mr508697f8f.47.1792767360463;
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:00 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: clock: ti: dpll: drop the ti,ssc-* properties
Date: Fri, 23 Oct 2026 16:55:30 +0200
Message-ID: <20261023145555.3578469-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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
a7f16660af39 ("clk: conf: Support assigned-clock-sscs"). Keeping the
vendor specific ti,ssc-deltam, ti,ssc-modfreq-hz and ti,ssc-downspread
properties would leave two ways to describe the same thing.

The properties have no in-tree users, so they can be dropped.

Existing DTS files using them continue to work, with SSC disabled,
until they switch to assigned-clock-sscs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---
If keeping the properties as deprecated is preferred, I can add a
fallback to the driver in v2.

 Documentation/devicetree/bindings/clock/ti/dpll.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dpll.txt b/Documentation/devicetree/bindings/clock/ti/dpll.txt
index 14a1b72c2e71..ffbe50f46e68 100644
--- a/Documentation/devicetree/bindings/clock/ti/dpll.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dpll.txt
@@ -56,12 +56,6 @@ Optional properties:
 	- ti,lock : DPLL locks in programmed rate
 	- ti,min-div : the minimum divisor to start from to round the DPLL
 		       target rate
-	- ti,ssc-deltam : DPLL supports spread spectrum clocking, frequency
-			  spreading in permille (10th of a percent)
-	- ti,ssc-modfreq-hz : DPLL supports spread spectrum clocking, spread
-			      spectrum modulation frequency
-	- ti,ssc-downspread : DPLL supports spread spectrum clocking, boolean
-			      to enable the downspread feature
 
 Examples:
 	dpll_core_ck: dpll_core_ck@44e00490 {
-- 
2.43.0

