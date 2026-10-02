Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC0494835
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942585; cv=none; b=ELvPLCIX02cpoS8ZyzlIXTS188Nbf25zKMjDF3K9JINLcdP5APRLlOxTImYgJSMAP2UyMhQ9Y3716+6oazoHbambQyhAEoXEi0CkURCsPiwQJAKqPg/Ke6mhRVT4NHSc8MQdRoB2+PsGV20ZDKZXj28mW6gEzGUvZfX137tZOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942585; c=relaxed/simple;
	bh=E3bFiL7YI5UMcoOM0utDxMNg5sAh4VkSM2tXjlG6tK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j0NOfdNkBI8sxxOyJPCJjEQX3fbrEWTEFz9VSTCMXUHn8kF9QcTJY4JKbi9R1oBEZ08hOzQCz/MnWkHUAd52BE/pIbWzeJ+UBkZ88RbfJu26ZeM6ygFnsXczNqNEsXz9hj577RwZWyr/kPJGm6MbmHqliQGfpQhnpPRBQ73TpFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=QsGbilie; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="QsGbilie"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso2758255f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790942582; x=1791547382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYtYYZuAQMFfttbDXhmpcbK3WXYMY+yBwZAMhK11zKA=;
        b=QsGbilieinsXZfyBUxi5BdqBz7EmekQaLI3KaCJb7FSjxl1YTq8hdVc10by+i+NTaX
         cuYiryx2lFOXUhClKtVZdEfRg4WHknzXNlzNvdg7BlLjCzkuDqiiTr5jD1wbD23q9IPB
         q4oD8rtpODewsM2Wm5GQ6xp5Q/99ZbUJyz/NvBazOBGkXP3U6pbq5AL3Ylq4xeXIbceq
         OM0bS3F/Pv0J2OoNFhXGFoaUaV64VO/bnsNnBg8Bo3db6KhpAM59KQYvGQ4+L7qf+TeA
         tq2of+NGYuOcM47sBB6FZIv2rJPeCe53LI9Ld6NSKPX+JTyP75VaTqqmJ799P4wNVuQn
         v5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942582; x=1791547382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IYtYYZuAQMFfttbDXhmpcbK3WXYMY+yBwZAMhK11zKA=;
        b=0kN/c0tBOgpy3Ec7vL2r06W3X9JcsgVvwH431EF2x4fspzcf7NrwScF7k2aHsvaXMv
         kW2+Z0vc8rfXKgCrAopEK4qkysUq3s5cE1UQbj8vKfDPzqa47hn9KP7ULDKElv2QX5g4
         SU9VfUbYhRCBhVOgRWoWU7g7OL+BhH5cDP4rqUeYAbJOeqNexuwKrpAllrghvFc9wQIE
         FwMrB7gXt1KNuunaHS4466DUE5k+R2jPEimgwIgk9KtOr5czPMxp2XsqC+LhZJYCIZdc
         SOZotPchzlNZXzGz6EculL4jnD4cC31ICZH/AMYSXwmqP5w03HiHl+88rhiBnFodKpsI
         Ql/A==
X-Forwarded-Encrypted: i=1; AKwUvBx7E4FdUSGCDdDE9suRZKOUXmtfOKq0zlyEs75lWYgV4w3dzwg0R4DZgz2q45pkKJpXkgFVWNr3gy4AP5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcs3eZy43tly+UFA8Hme3cx/+7czYQMv/woU4IcTM2bCu72rHV
	lyXQ02AoK/t0bMva/XjDpnLfjUA4HbIrQ8GdrKu9feVfsbUzTL2TiI5cwe/jnbK94CM=
X-Gm-Gg: AYBFou2GMoDChPgMh4NygjX4S8PA03uA0CF8stYG5QY2e0JNZgs7p6R8bJFZrwl4xHh
	f4jDAncn7EmKIDgEOecPDsUcj/nzqOeKXRXCO2dM5tw19haVQxpPNLaFnDSGHuOJvrGay0ugsh8
	gaKrf9CheIZ5bX1U6QlwHLPI4gnVq2n9mc5zF2gNYv3Qe80FyXnVgzs6c+ck9SsED8gmYbvjJmL
	1Ro2FZeEhn3x5RiVBR7Fk+ouy/ltojCGEOlsGp36yD28z+oEJKw2qNqgrdkB80P+Iov68najned
	VLavsSEwqkhdaliF8vqBjKYxoJDRQCoeE9QXGN1bcUuJJW5BkvTnwty9bF4rwr9k75Tp443SGyb
	wUCvUBoKpeNoXBGYbpjL49mG4/lAeoKfnhF7+P8o8+E1NjFjQCChiibPRJrYfhJopMEUjxK8E6r
	LcmUE3n1MR1JLGztox1CpzbeaERlInmltkEFvyibwTH8iZ1nbCBz4htRpCbRC6XOT+i0twtBz+j
	4SGkdAz5A4ntO4T
X-Received: by 2002:a05:6000:25c3:b0:48b:722:1c6d with SMTP id ffacd0b85a97d-48c440e1b11mr1660612f8f.38.1790942582097;
        Fri, 02 Oct 2026 05:03:02 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm5845213f8f.13.2026.10.02.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:03:01 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] power: supply: bq27xxx: Add TI BQ28Z620 battery gauge
Date: Fri, 02 Oct 2026 16:02:53 +0400
Message-Id: <20261002-bq28z620-v1-0-bdcc10d42519@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3aRCI4sqMyMDXVNjEzOLJHMzc4MkMyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQArnrFLbAAAAA==
X-Change-ID: 20261002-bq28z620-53468b7670b6
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 "Andrew F. Davis" <afd@ti.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=alchark@flipper.net;
 h=from:subject:message-id; bh=E3bFiL7YI5UMcoOM0utDxMNg5sAh4VkSM2tXjlG6tK0=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtn1uUbfn02o70kxbxwtE/jkxZfDObs71avHxG37dPz
 NfurPm9rmMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpnmrD8Iv5316HNxV+C2z/texTtNGfy8+7bN/s7eyfrmdKasrFh9kzMmzd9Xi
 qxpnN29bru5975fivac7tG3dW6G4IE9tz4sq2x8YsAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add BQ28Z620, which is very similar to the already supported BQ28Z610 but
drops some registers and shifts the data flash layout as a result. This
means they are not strictly compatible, even though the existing Linux
driver for BQ28Z610 can drive the BQ28Z620 with no changes, due to it only
implementing the (unchanged) standard command set.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      dt-bindings: power: supply: bq27xxx: add BQ28Z620
      power: supply: bq27xxx: add support for BQ28Z620

 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 2 ++
 drivers/power/supply/bq27xxx_battery.c                      | 6 ++++++
 drivers/power/supply/bq27xxx_battery_i2c.c                  | 2 ++
 include/linux/power/bq27xxx_battery.h                       | 1 +
 4 files changed, 11 insertions(+)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-bq28z620-53468b7670b6

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

