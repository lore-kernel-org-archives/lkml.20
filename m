Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2CF4A2A53
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550011; cv=none; b=acMhW96XvwOTUcL9sGRd2aqMp9RKS5JUC9cUwuFyxsWk+0wPR6TslNIaN7ZsIGuCsYQZ1LkXVktrjqrbvRaafDsy45G0sloMWHDYmKZodvs35Bd4XrTPbzK05OsToNwZyATsaZWbSYXk5XNEsDlDorvq005W0Qx/Ye17N3StZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550011; c=relaxed/simple;
	bh=eS2AzTpmwl/LU2/GTCNcYSrf1v77Kr4VQXRZMQWSnOg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pmZmHT5ZOx5TBgr0fiVYX2Tfnvc0EvjHnI70A6ibj5xVu1DvwxwYgSNcO7MelC8Vr7WhZOfRstWw7yldXwTOVokpc5MnqlGt6JCJGqNAJTcl5im2oYz/9KecX3x9cTIquXeiWy5bFxPksuc6R2fZ6UBEs+UDYOPLeWdWjgG1a8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=YIsPu89R; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="YIsPu89R"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso1032370a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789550004; x=1790154804; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2pxFKi7xaeFBiwVmmMG7qzY7jC7mdLidUrnKaVS0TrY=;
        b=YIsPu89RabdpdyPVBlkoIYnzFFqEKRFUBTqccKyVd72RoVGsyQMB8XulVG9UxjCOs1
         OEAbnk2Y0M2X2UaSYRHkiyG2WKw/jIvdiTtP+2J7IpS3mgSM8c/jgSD2dlJUQqWSZB/0
         t7wWzeyQT0G6+8AKCKJ1/4bceo4p9JmIMQMAibaGGY7ExYGbJ6rURoBlTRXpw6BcrQ75
         SVkghCQj+7+y58N9huEth8JWO4Itpfzw72AcO6rNRDazCkwMUT1ptKPJOmaWcTFTTV0Y
         B0ey0kbwwhVAfQqqNyI9p7bVr6OptH2N6ipBXA5lBjBAxYL4MjHHLsOu+mK05CwOnKE8
         lZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550004; x=1790154804;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pxFKi7xaeFBiwVmmMG7qzY7jC7mdLidUrnKaVS0TrY=;
        b=qQ9oZM/byLuOsv9PbZaKCk7kdUnoO0QwLdNjbSsI9Viv7R/PvtccB7Is+/CDzGQEq2
         izHsG4Aby7Ph6FCCe59+yNpxA+nMQJI+AdsoqIYhdWEeXRxOQ/M2jikzPo1OHAM3Ha8j
         BTKTQaYbS8cC5AWBNI6d4+CY3PQdPiP15rZea/SRxgWcxvvvDYPD4CILCWwvMIGZruTV
         F8EkFCMq/eRu4CgVMO+qIMXH2tW00pG940x7Q8oWQUlRY2B6G97QhMuagHSdrM+uTSo2
         Ppy7Keog7S/rYwmqFwVJnYRCBO9Boi2Yq5MydtN7fARL24D3ATZv7458kPBN0felIlhp
         HUYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIoDMnnjzlR6ks6oMTfJIhwuyW2BUTrSb3tD9Sx/w9tujO1RX4pGiroQbj+zvHjmtpiWxqQYpOFLn0mrY=@vger.kernel.org
X-Gm-Message-State: AFuF++nqyXhObIkRzOGYJOxe9oo7V3Pk1DRYnjaS5j/677Boo0pAYMVu
	Fl/MFVGGd64yZy7sLiSfCHn24jmVZWnf12M38P3HHDjoJV5PoBVHJdIvVbdpYBRcZns=
X-Gm-Gg: AYBFou3j/gMNutm6HxVvmYQMg95r/JDweml/xC3VtflhvgRdaqSW92r/znV836Bb5/i
	gUpbreD7QUJzyrO+/FUK4w5AULalTpTJU7ZNaCwUISkGaQRYU1FqfgsEpKG6CwaPsnkZ9XcvV2W
	oXCnoQJqGYbGn9rxb/5xefNeFecLCMsFvW8xZI9XE+eDQdSToFWrXScClR7e8maw2PNk4Wr1oOY
	7g61JBFJP7kX5Yj86YKAPDimDeXpjmGG/1UWKeZqvONfvYVURfl78n0sTnOkZSILO1gOLECbQz+
	h2ipA5QDowL69PMJDu4JhERNEZzTMSnFuSmGiTnPIo5cAHJ0Jqhg8q84VTVcobQIWUXt9mSqpNm
	l2PqTcyrTZUSy/qAMhG0F/1+wo/coAkJ92oKRWwQFfRt2jEYwjVieXVWdJ3RFy5UOPNXijvROQZ
	wPDQfdUuNIxRYR7j9yPEymfkaRocq+ZEwSfv9UUc4rCkEyPFGTSie4NjrZdta/z96H9g2qW+0nx
	rsxf2yhwXD2t5io
X-Received: by 2002:a05:6402:46c8:b0:6a7:f25d:b59e with SMTP id 4fb4d7f45d1cf-6aa2241eb47mr2356354a12.18.1789550004367;
        Wed, 16 Sep 2026 02:13:24 -0700 (PDT)
Received: from white-mocha.local ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a874esm1148454a12.29.2026.09.16.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
Date: Wed, 16 Sep 2026 11:13:14 +0200
Message-Id: <178954999458.14468.16283512434120694140.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549994; l=811;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=eS2AzTpmwl/LU2/GTCNcYSrf1v77Kr4VQXRZMQWSnOg=;
 b=Kigj35XJyk3oqfYrmSrVTzDtZozWXiL3A2jZ1GDFn47XUDoi1sADnSqsFWAfD5moYuTYt2g/1
 YmIW7BejVRPDZg8+rwZ2qOhCgmhCmtFAgIIt7xSS0+t7SJFtsr9bmbA
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

> Add device tree support for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> The series adds the board compatible and describes the BMC memory,
> SPI NOR flash layout, UART console, GPIO line names, graphics
> reserved memory, I2C EEPROM, and MAC0 connected to an RTL8211F
> Ethernet PHY.
> 
> MAC0 uses the EEPROM on I2C7 as the NVMEM provider for its MAC
> address and is configured to use the RTL8211F in RGMII-ID mode.
> 

Your threading seems to be broken (`In-reply-to` + `References` are set to the
previous version). Please keep that in mind for the next revision. See [0] for
more information.

[0] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
