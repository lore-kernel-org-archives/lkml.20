Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0C246AA9F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783858; cv=none; b=t9ErHl8jAdxAcib06IPPruU86VCXawKHkMwLmg9HYtL2XRr5xGTesTuA/WhSefb6mReAdb+kfCazIw7dVIqgDfXHumknQSrMS8iTklzLvTm9Sc6kCHbQiigSwZmK87wH7Lzc0ZWXCxEQ+NNDdcehY33/WwTPly70Agy106AutoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783858; c=relaxed/simple;
	bh=waGL5biJ+0DdJSi3zAqUa3WT8EXSFWxNSrzn0Sze2VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R97f4X4UK7+O4M1uz6eSNYkpIvQ/oTXPh9LyhXJF1njb7mbpeZZA1OxhVBvyMbDddpRt1Un42rVAtzJpnQ7uxqndMIn+GHSwq3VjtTRsvH5qHs7ePslRj9CG0Sgb7uqoRju0zX8vbKT4ZigeO98ZjQRP/p9rMjJK1aL1RV+yXIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=KsG1M0nT; arc=none smtp.client-ip=91.218.175.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="KsG1M0nT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=waGL5biJ+0DdJSi3zAqUa3WT8EXSFWxNSrzn0Sze2VM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783852; v=1; x=1789388652;
 b=KsG1M0nTa8nOlT0hFw3iLevFTgamhJpKvMtLzroCUWEGTY1a9YwYPrm+5BvYrSoV4Qi5MNJI
 cpSFDeZLsUMC+XC2qo937gTYBS+oYsujW7eY4u1hfqmq+o6b+C3NJIrWIzaMu9Yyvla0O0V0PaM
 vWN2Gha32h6s7ck2Gosm3LA3N5PcO9n6r9G6nIDJEXSItnckceq808cJCvm8TQ5jIEkEznPp4I2
 t5naHdaOeq2hTmyVX82UUAJWd8g0sgOyGIS5NF6iBE709WoK5IjLnh2sXzD2LNq069B5grzkg2u
 GO/M7Q8zPzOiLUjA/WOA6hm5tzbe7O6zDfRB/lJOZU5Zg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ceebd85e94b4903c;
	Mon, 07 Sep 2026 12:24:12 +0000
X-Mizu-Trace-ID: ceebd85e94b4903c
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Mon,  7 Sep 2026 14:22:43 +0200
Message-ID: <20260907122406.1862398-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
Add it to the NanoPC-T6 list.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee98a..aa828ee60d21 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -398,6 +398,7 @@ properties:
           - enum:
               - friendlyarm,nanopc-t6
               - friendlyarm,nanopc-t6-lts
+              - friendlyarm,nanopc-t6-plus
           - const: rockchip,rk3588
 
       - description: FriendlyElec CM3588-based boards
-- 
2.55.0

