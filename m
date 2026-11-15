Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=ylb+zvwMuOtMS0wGzgwTa/UqpVPZkJHpQ/ZduS0uyCG3hu7ieKYVdcZygxVO0cyU1Hv9
	 Hl2qsSbG/H7DjFfiv29Htqc8o71BJkAQHIvSAr0crfcaBKN4Ql1ukC2JW5TwfISBMN+UJ
	 TgW0Ct/6GmhH81bjCMLp9Ok24B8VmHKRLqnuPKt9K7e9sqdf7r/vvYole3EdNn5T73AFx
	 n7UTg/q5iIsv/0AlQ8PE+cp1Mt1oUaFUx/8S7BjZuXa4PJ7A74dwCH6DedcQUosSArmtO
	 jkjvMyfFtifrvY9EpQuyvpjNG8FScAfDWMWheMs/NJ/Igm+z0mgoP8Ly38uyYke771g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
	b=I5MAq2gzXTHGYIbGy3xXfH8X3DElk7SALnqPy0uj/tn9j+EKDjd6s2AlcvijomagWP34
	 X2wzhLX80JnEZtViLT3zpBaaIYBjUT0HePwbXdbDai8Nlk9IrNx60+EhcMDZRk6r2ntVs
	 oZHAcJygq8Wh61Tkubwjbdl8XlGcQtuQi/XhIRHnjRHltbbNyvzf/Sei8l/27JurlW74Y
	 RCQVSRqnjo5Jfd4weMFHCwlSO70meyfvCYOVGYxgKE/6OBUBh6ZPH7r9JRfSolb2ZjmvT
	 e718kB3JJLnzKCrVQO/n563Rz25SYzmPl5sPlargLDwTkrFUEEtirbhcBonBJPk++eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=wQG4Lgwn;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE960A2620
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADE960A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=wQG4Lgwn
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28990365e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762715; x=1795367515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
        b=wQG4LgwnhzHEMVFNFqIAFCh4ieei6Jjq+uMiSAV7Cqo9m/VbI/po3ETct3qEodVq5D
         oR1GyDi9JCZ1ftpzspqj3A9OHoJOUX0dQhJ66KITiAQUKNGil/6Lqw8rxdINaIoRsXAa
         OMBvj4XkL67qTdBSTgbcFY2EqOlUAWU81SRAJ4snrrb5qe0qDl1PUAuLVxe1kPt5NO7/
         3v2Ne6ChpPq8VtW42ffwPk8TTKGc/ewkUeItQgsRFVQbVPEurBUllMVypBzmfHgS8EWr
         aET1APTLU7SKuGdMxWxZK6zN+9/oyLfpOwCipndmP21Q7AFSvbzaTmHHZkV0wWr/2iH2
         dFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9RWAF1oftI93lc29ycNPKrjj2FPFv1qc0l+KG0PO8Bg=;
        b=RaHm6CxPZyuVfnTbPqKYpYSUu8fmWHqAgOzJL7vmhQHnwX1XLIB7yBZK9G+6u8vG+X
         rxvpyeEj5NLhKoXZIGO5kZQgIxuZfzyllY4A5ajGS4jgMaDG3ziB3P57vjxVtL1qLck4
         WfQFrlhwTn+2SwmsWi0oU+wsPx3YFVBtKfrvZwm3GaKY26tNY5YCnR0S+RXmu0WXM6AN
         xGugsEfwWCksrLnP43o4yIqFSLLp4JpwKl+toDR6fFc4vVFdor9ukxFh4h26E5MmQkrF
         NKpNfTY7BRmOdH8QJvCL3u85CwDbjGF50cmohjg9CI6ZDTIx6NEvDv8nGBS6G8X70CiU
         lFvA==
X-Forwarded-Encrypted: i=1; AL+hErHpPIf+7IQBqoLS5tUYzMUbR9zYKe+KDIreN7VJqlWs1IOlSH4CxweUlWbP+zliJ4wxIKDeOYDAd4uRIGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLsj/doEuW/hUba8Pt4ZaU3+mnSTij7gLG/jzO9VITUnaazNu
	3VdNvWo1YrOmYh9tyfOaHyq8vo2BQclUAAUtIMrhlqZClBRogZZuIGOQ9ZccA3pB7D8=
X-Gm-Gg: AYBFou12LouaURKwsHJQH61IExWN36tjYvTR0kHfxxM2QGk6Svb/9HYLVX+4evmppl3
	qGN2yNjnKqIDqf99j8IUSPta0nY7+U6zGpv+Fx7TJakUiKC/rCcJ2J1gFzaYBDzMWY9Q98XsPkE
	aRIKqBfytf2U77Bktt1ufJ4nSwS+V1m+4KMmjj6cv4EauR63SW/+Jt+5jCqM/uvDoNnhq5nitBe
	GJ4F1/Eqsd8DubxCzETkA3q8fMbKOtJMFtwuHvFNT0aTGiy9rXqMuTBWXx1YdK26IRgHLB5xqmf
	/nJbZQUNOySPco7/9fiLMXtTpLnoE/lMiFSMZLyZghY7Ls2j0beFMyIfZ4oGVpKiMOeLWJ9Veq/
	OIOrmjzaDwl31ZRR6kEX1d6mC/dt/mzOzyPGrHpa3ZDHs4NnpGS1vhKHe/ATBPKQoXJWG2WCvX3
	A6S9+hNBKfys/txDN+8DrLrxYdNZ3xaHXyg3BdbGRtRG+2o4BTXRR01ka/kj7ugW9EiTKBYR+VT
	arSNJoPLKnpDhqn6DryEY+9x6q6x9P50Sh8BG1iQB2WOHKScQugljUi6wJBuY3Jk+jpggzGnEBs
	bCbzzxnHMnJKYIbwQAXR1iKK95QkYJf548n+KXh15SSminceZaPe/MQrz4F2kDTrz1UAVIL7l1M
	grYUY9P0=
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb55c5f5f5mr209711325e9.7.1794762715464;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] dt-bindings: power: supply: axp20x-battery: Add the AXP2101
Date: Sun, 15 Nov 2026 18:11:49 +0100
Message-ID: <20261115171150.64431-7-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

