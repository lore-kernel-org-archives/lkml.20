Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE4E42086A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199884; cv=none; b=TEXhTtQJ3kKoAVLzI87fH1Yb2OKw1otAd4roRK/shl3kM4aanMIiAQR4GWDjJXcibEoCFXjttNTw61yBTnPEDaKsKpAR4SeaU5TUCGWMO1ym1k8fbGV3EvRRgsrOOvQeRcM0HkzALx8ieBWDVrFqWzh5l4EeT+NqUJhzeTcNDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199884; c=relaxed/simple;
	bh=GwvVmdOasksVQpTljB1yONv+ydx6AdGFOmBJEsuZ44Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FGybBm9ctnX1kD9at94uBGzybyXY2UZ3BIWrArcCUTyRGp50G8jK/NkWDiojWhYyDHoIx0bcTt0/vMSlJUaLI9Ct4fbn5u8GZfCHY4ySSYZInWhELEKprWPjE6TCtk5haOzdp1y4te5K+w39+LVZNg6sP2xsDOL0P/VMNtc3Cfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=A1c0ZIc1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="A1c0ZIc1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381b831d535so140321a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199881; x=1788804681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY8aVkF7j6juR+nATWesw8MV58ZoElmwKvQ+IQ/wROo=;
        b=A1c0ZIc1QmUV4KAlhXdTKv6KAdA8YI43TyW+oTU2iX0wWtIgcjLF6OGOhEQAD4/R9U
         eIj+fXec7VmepV659hDg7gkNuJWk3B2jPEfV9jqDZs0YaIY1HFybYCS+2g1NFvrQMgag
         6li4zSIq85/s9qez3EPCHGKuAiyqJlh9CnI+U0oinwGMzn9uQQ7xMJhZm5sM7x/b9w5Z
         H8q2S3UgBLgfjkglVMlavAI0NsNO+BRMdIuHA7CZpo+HPVABoyMzL1AdA5wA/QQ4DEv/
         pafwew4AxS8kr7XQ4mLub5QA0JOMScUvlM/mw4AvpLPIjG0DRZ2YdI2/xxAKKs9nF94e
         HBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199881; x=1788804681;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HY8aVkF7j6juR+nATWesw8MV58ZoElmwKvQ+IQ/wROo=;
        b=Os5g0+5XGLETBEexyzXUnzjpVENfL0vRuEeZlGhE2a873Ko4U1If715YWMJtcTyPzh
         dqA54KdWA78nRABeSQo18IflZLIb4st2raFxmkKab3/jBM3Syzq+8JfhQsxNeQn9e/Xw
         oLpVLt70f2ovswBY3StfGzTdT4apKQPD1agrw783yRfiNEOYz/hbOdmCyTAzliLVJqCL
         uPmE4CaooWbvqeMJ87iPbczNVjTvJNikUKkjABxiV1Uz8MoFFS/wLmeDmNFckpaf1N9V
         0duNbQyyFOzgeU/OjWj17tTGS5gv/Z+AXflrHcywa6gBRMG4zYNIBAbSio8fPYAtDXq1
         Bh0A==
X-Forwarded-Encrypted: i=1; AKwUvBw+G439ZQxpRlaTu70RVhwaoXM/BJKd52Y8BhgHsM7F9f+igJRd8wm/RM+esXztoTEh2PivvqF0Bt4TZxo=@vger.kernel.org
X-Gm-Message-State: AFuF++nRSnSsXep3RExw/yFlqzdnIi3kC0vOL9avSfZpED8TliZ4agGW
	MlWG7G3RvUNJaSUtQGBm318vn0lj3+fQaXe+iop4kKg7U5YVKcaG9Ix4tdGV/0A7dG0J1wZeFmP
	4N1I9q+c=
X-Gm-Gg: AYBFou0rEfBTX10qZg4zcf5x9kD5j3TXm8egKw4ol1RyXq9vAncR43uFbOxlSb3EMJ0
	+QZfUKR13fWb7YQ0EEzKjWKDQC1BswLoMYaU/v3IIZTywqcnAgq/k4THg/3vZWuevtVr+kAevAs
	iZSKu6fLY1w0VevIqT/gGHT1cWFhlhCvIpaKz9u4Cet+JtZjSfchKn6NA7vngLY/r9u65Ph9QWc
	mc83ynBSOL2ojoDOVDB7pM4PQWBsqYIJTiLVB3zUD4DnwJtiBFrEFXb7gp3+++M/1ADLyJbQmYq
	HjPRtgND3IvvwOsIe2lQueRvq+smI38ufRsnP6S7Vs2/34t4otoCplLgjS6tG2pzc5O1wPhdXXG
	1SdMyS1mG84sI+56/feFD2IGEDnsqNhWBipMcs0Knf1NXdBfvcA6v7vJfbeMJGMnj3nXNJHkZVr
	/W5uvFAIajU8Oq35TEEae7lvFRfd0pTK56pckC4a/x4SN+y5HQpJGS028HIw==
X-Received: by 2002:a17:90b:5102:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-396d0ea862fmr45988035a91.6.1788199881361;
        Mon, 31 Aug 2026 11:11:21 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990bd1b395sm915178a91.1.2026.08.31.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260719141008.3562347-1-egbostina@gmail.com>
References: <20260719141008.3562347-1-egbostina@gmail.com>
Subject: Re: (subset) [PATCH 0/2] dt-bindings: rtc: Convert to DT schema
Message-Id: <178819988045.2869653.16639071093612124641.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sun, 19 Jul 2026 14:10:06 +0000, Eduard Bostina wrote:
> This series converts the Texas Instruments Palmas RTC bindings to DT schema
> and resolves a node name compliance issue.
> 
> Patch 1 converts the text binding to DT schema.
> 
> Patch 2 updates the tps659038_rtc nodes across the AM57xx device trees
> to use the generic 'rtc' node name.
> 
> [...]

Applied, thanks!

[2/2] ARM: dts: ti: omap: Fix Palmas RTC node names
      commit: eaeb86b1194ef162254059ba6a2c5145d1ed7ef1

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

