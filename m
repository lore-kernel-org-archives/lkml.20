Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008749;
	b=lznwtucV3KsODBHaN6+ZYX6NRzNMUIob04NRyiEvEkYesqXoEmpQY7RroKWZc0+kLA67
	 EiuN9vMGw7wJloz/FuJomI3GkB8NCvXXhSC/huOJeopX8iXYmi/P/uOMOcTD6iLCeoq31
	 aA6fIsOAfC2atBsmVd8QM4jG+8j2jrYx7iryDhnOwVMjlKmPKKJi4Zkh6KierL18snn4S
	 7bRik4IzjmMf9VypAc0mB/g+7bzut5jQiFHic1goucaZGuADEsEhrTaLulxbg5AlpI853
	 X6wgEiC54RMwLA1A1pd0HXKjYXGjGXJoeMMbIoRm2Al4hUZo6ZJA8QC+BZe0LEcU8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
	b=zEJh5sAfmW6zIw3i5yOj+W6gz5FnyVMZ3aYRwp90Ti8xI5F/9nae365x1JWirQmdKIzW
	 b7ZfiLC7pDZW04Epw4tT6tszMyhV3PIMVH2x8ly/tBz2r1KP4OMtAXhxtKkfwHdSXNQ2P
	 Bw4X1XoBNciMCJlq2xaQUaUVz5r6btxNi7kfaqZ5UJiXxaE4ZThRn/UarBzQeP6Q5cOzT
	 cCprg5mLF7cLS5zL5k5T+KUru/y+ThiIlYiD7PxOOxD7f+KfhrlpJ/hK1lL6OJATIxzS7
	 KbUHbo7izrxpx23imARbWOkuJV1Tm2B8q9zXmwN0gkIYBY90ZmAjlWwmzspBOSviJJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGxGU9n5;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4D606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A4D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGxGU9n5
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so617715a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008748; x=1794613548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=QGxGU9n5bMXNyGpxZMcIhFKYSHPSE6wXad1Ww9h4H3IBfST0d5SFet/ie8sZfkLKGI
         0ZjYJF7TUtSV9WvK3JTZn7uVtEGPHJLulPG0J97ngpjF4IWMpt9FtCRFhRhKWhoMJPuP
         q93UwrKVjCoTGcIcXQ/HykeRofzwRA+Ohz2OR5iGVXhd8xFt3suy7ybkjUIdgg5pvylP
         qLtwvb2eTTC68UoVcdg4eKkVeHVOK/BZCxCJkUfa3SifhNsAC+I7XXOEJV6/FKfsHjNM
         rcuyKhSfse5DNeJ5+QjYGmk5+C/g7DpOqeWbdA9HiApxbynnuG+R4XZIwvwgBiLhKsjW
         Khww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008748; x=1794613548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7lMECP0GDvQ3SIOc0RLblQjT+LWxuUNwC8Ag/lEWPw=;
        b=1Ta3WUIeUEbuz5nz71XDl0/KWVsficGnIVnka5VUqcmSJgidFNvcrbCq4w9961SHQB
         Evcm9SP9pUgmKhmspBzJ/cMAGmEO0xNXAbvN1z9slkeYaPyFn0oHN0ZmOJWrqTilCvkr
         22z4oC4fSfp8tzrnBgewQlAneFfqN4JtVSNovJfXu11oXw0W/iEOmPVRSGcbEeKf3iog
         rqslFgLd1HRj5rBt789CsnagsIS6Xh4pIjrAx6P8910N/yCo91ZxX5xLg39tPDUxzuyK
         BQV3gGvGbgUbHsEHfRCybklIl59Es0Dm/PJ0DUWVBU8n3D5lMa+AhPwEIpKSp0EsKtPQ
         Dh/A==
X-Forwarded-Encrypted: i=1; AL+hErFYeoymOvcqV/af2oVwHYw8dOXE3LbrE0LPUnKOSuvKruWq/tWxIpRubYU+xIZvh7/eLV30/Ix2toLLHBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o5sGNy1yMLIcelxgvT0FYt13MXOXCljIz/hv7ldd5SkjjZmge
	H6WL/gCAeVKl5nX+RRhxKVrpJx7O42iXvuvf5BROdULrU9MtDA2ITjMJ
X-Gm-Gg: AYBFou2UOSBWat4JAociImpYA3TVu0LweKldbLwDEj87294Z8LrdrJIq0/2Jg6JPC6K
	tIO7cVOG7OKr6zVaIAIfa3P17eThuNAfqpLQ3iAc0/8zvQvCKmvwSBDUpVEtlIK6zKfcofNZ0kC
	iaABVs7vh5n2vPi+cfP8BFK3JvQVrisU2Cz9c9l/ZgrH2iiYt3n8HmZ42ZZK6bkVL2HrJfhJUdk
	fCeWkrF161ohZtUOnh6Xj3A0oJekrZWdSgtycBwbp+RSfI+ppo1+HHob7ykoygCiuTdvP5TLKoV
	byH0o4+9E15YgQ1O3vNy1hTOIwvsP5XtSvRmdFT06stgzgnEha9B3l0e42Zb7X2I1Hx7cWvbfSN
	sDVhAqHWhPLXDBFh0loJPNVgS9Djnk9p+Ky686fi9BpDzDSD1NI76yRVuEVYiMcLC9B5GPb3IEC
	vsmiNoTfemv3jezXknnUuLCsr5ZZ7lbW0Kkoobji5FUtivS8dlZUimXEPEpk46wiu/KFTkk2O24
	cYLQ09n0JzwnkTddSy2LaYmScQVlxnN98RZ9C8M3ywYj+c9pyB+PucYlIZRfiQuEvnDySC8NwUi
	URu9RqhPC3U4XAsQ4Pg2
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr3319728a91.18.1794008748133;
        Fri, 06 Nov 2026 15:45:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:47 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Fri,  6 Nov 2026 23:45:40 +0000
Message-ID: <20261106234541.1474324-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place: it
is the tree's only record of this erratum.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

