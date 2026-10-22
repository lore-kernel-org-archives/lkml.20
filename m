Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627742;
	b=IXRk60TrFT1F7LGzXuGYpoOD27QcRyZ9Lpd2nE80oRZYbjyHwHzMkZgQory52fCZalls
	 Eg0nZID1aMXJnKzYywcy6211eIjDZ7v6G6YVziETnRxMbmSV5/4CQsGUBWcT1xaFpvfXX
	 f10zuiNmGJ+wK6zkyWgFpEndwrjeMpakbBKvtcJQIFA19AC7Rx0QOh2lwN7utTIeSQctD
	 n2Ub6nDU2GNm6RpoFa5DBf5/IGiFbhCj2NL5dJokiu1CAeYpSvWRTDbUlYj2871xkDciy
	 0wjNMHl8y1jrtiIJl4HrJaOpMmKSTwEAiin+y4Xgtoa/9YnJTQxdat8Ho3AjCTK2aIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
	b=ihYTwa9nWlrZ0G4UhLkujt8DMfyrZwF6KSEpwyQFZEiDjjBa2dj2QIJS8rG99z81lK28
	 bspee39nhuXOdnnAitG679+Sbh6LH9EW68L4ZpZS9ZnH4nVFHxcKxAmuUG9LKZVbW6Taj
	 IKYihSK0i2kLnCW8G6d9ZP7p/0/WoWn4BSKQyXHxOCVt+Yr90EhqUdLIgGXhPYeoqrqya
	 0to/SriK2Xk8/b5yC7nPPSqr6+HBce7R9InY0r6mR5cf917WJKHTFSIny6r3Dz/4syYKM
	 1brGLZLXMULv+UcBnA0rBZJiknYVqDCIQDJcMvk1GmJaA7iNzZUTn6luRYVCqPpAC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6de2f213b7aso546445eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627741; x=1793232541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=U3tKwUOpItPUVDK/iRQZIB16gYfJ2u5NmP57APeGAHsv+PpLy/6kpb1vSGGvhUmZV/
         5b12NKsH8MJJWxjWvprmtaLkZ62P+L/5xVbgNZX8XpveFUwJDFhIyzQOUjNpVSa4Qejf
         FNzMKgEih3/RZWlT8F6Hof8SdaFS2UfrvWIL9ki93kvklyayv9Ufy9RAM92uGP0GlzpU
         Pz30t4Hlbm+Xn9JCA6lchFD5yKV7ZLWwXDInqJwhC93NsK35CUquUCfatFR/Wpo0se15
         LzVvl3p2/eA+lT6+M6svE0XvLUTcl0wITxP7ih8OLNlPmzsPwVZBiZP4sU3jmEFyBt6q
         B5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627741; x=1793232541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=n4G4b15zRgLVa0tBmj7dS2zHAiFhQ+E37VGKSet+aXNlknumzs87mxt8MB7VkWkYYB
         hlZgVDVemNATDAyu3EdHh2GSkSGxGE4z92yeDH4EGg9LDObFRZGO0oqs8gF92ZgbtsPK
         vo2IgaLsrhDacF+lxCk/m4joTh8r/8zclDLgNOMju74IIT8Im8qd9YEjQqB4N43Sdh8w
         xbSH7GKq6P3PIdQDLjWPHfSwtHtwMSuYkvLWMyd4qyTZkLOk+XWT0CSaYNltAbEAhyKQ
         yULyOS+la3I8cc4XJNt5qOaHaxYnDg/JtYjrilU2uLcQoLpgV5d/9PbLJZA02rmVafFF
         quxg==
X-Forwarded-Encrypted: i=1; AKwUvBwQq/A3rw4rDew+NhZ366beYKNmJNAsno6E7gk2VFh5QCW0U1ZSweiVmY2/d6/OUtLYErRISE2fDYcvqtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbL+m1ALWuloY9rNB125cDlrYJraAxezLFF38dhH81xvsO9hrX
	6JGnW7xslc5EMpBl8NHk2fY7ruulWj/h8eMJd03nFXAQ1GS8wG9VDT61
X-Gm-Gg: AYBFou1X75XEB+n8KE95QaRMJm/yJw3KGSTN/0JAmA9x6+Xa/1LUNKIyRabcUwR4pA+
	ACjal4+olvXcYJ1QjO5LdGfrHa4i68tAZOlzOWRgFY4o63d50a5+K9wJnTFsKP9EYMgGFUlmQp/
	RGYJEwv5mpsf/VTUOQaTHpgd4sTFi88rdLdXCsl1CSSE5KooX6DnIKqFjtK5dL7XUnDqPFMaR6x
	Dwg/jTFKnPfjSq5/d8SukxWtRoCVog9atxnUf1RUBI//D3DJU09OsKLDSPcX+a1dlnzMswy/kZU
	v/G2jHLvIsGmYpfCW7s71W41Truvg7XGksex2J4snd1dSqtgVFi5nK16cPJHF/Vb+wba5zfF0/c
	i3qrkNcIb7pcss5VeNWTvyiRqMckwbFQ2EhSeKGB5PEmdHXBmhzDqm5YrSnq8BMDPqLduSTGuL0
	12vTaqvqFiC6agz63Vz2NgMxPh4+nDVWc6C8XWH5RIJPZcnHCsHidff2K9mw3kUvU6W3nXYKkPq
	VYJR4BT0KMVaL6We4gFAw9eTPMtjAIv7kyWjnarM6K7tjqbVzgtu19RTlrjwsy7D8Du3NX2JywS
	zBz5+aWyhN9e04Wf/TiOayQrZ9RxY9P90tCtcQbToGRPoyE/lWmXn3aUhn2ByEwTSaEu8tH4j+S
	BecOqBBZ4iQqmCsQi/+r8Kg4fmPpSRV5SolflOfOlUMWikaZ/FYZO7Tgl4W/7NdzTuqzr2OdLp8
	YX1ro=
X-Received: by 2002:a05:6820:1889:b0:6de:aeea:5c90 with SMTP id 006d021491bc7-70940d7dd7bmr2299772eaf.26.1792627740866;
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:56 -0600
Subject: [PATCH 2/2] clk: sunxi-ng: h616: drop the private APB2 clock
 definition
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
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-2-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

CLK_APB2 is now defined in dt-bindings/clock/sun50i-h616-ccu.h, which the
private CCU header already includes. Remove the duplicate definition and
update the comment describing the exported APB clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index 7056f293a8e0..8a07c27c77d5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -40,9 +40,8 @@
 #define CLK_PSI_AHB1_AHB2	24
 #define CLK_AHB3		25
 
-/* APB1 clock exported for PIO */
+/* APB1 and APB2 clocks exported for PIO and UART baud clocks */
 
-#define CLK_APB2		27
 #define CLK_MBUS		28
 
 /* All module clocks and bus gates are exported except DRAM */

-- 
2.53.0

