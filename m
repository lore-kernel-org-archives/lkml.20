Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593638;
	b=mcJChrmtNOAdIovQ4rSOvJlM7hkKONRSUpbKZJZRvda78cGdG/zvGbrLGysAeBLoHLYx
	 TCpeITP/MH+/lD4mzIQe6St5geSecZxx+3WwICfsVvmiDW1SEf9aBdjFnR/ksuNlxoviT
	 IrXcKZT1DJYvelLWE4CrDVZLvb+9a137T+i4z2UnbQGvGSTydZglmKP1R1LwNIAP2+meN
	 FQZ8tjwss2d/8zs70I5VNZhipepJcXt7Vwld/LHSGnwUwEgGy/iU02u1BNS9kZkx5wXu3
	 cyp/gMa80mPnxmuglD6Bf4OD+h3ef84xylQ9k8PFksvFDHuGr3D2ZeH6YknyAVVM2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
	b=SgG7/N8+MDHEyyzCBUIe8ez5Ud5fCTpVTQ3Fj0S7JMfRwX0MU8ADe9+bO+kr+wxHu2zd
	 1QNj8vURuNNfUX/xuktEIf7UkO48o+yt6kcFz5IkuD/Tg+Tr7oIa4jTcYDm1BNJlmohxw
	 12eIx4hP/wY+2pCm+ucZqeLCrLl8Zg4MzEFd6yMg0ihS38/eo5ld7P7R4XPvpwb0/+tHl
	 8HePMFSG7nkq63qQmboDU5TyIRUD3nPdwIXyeNVMCvoTFVb0kafBHLQEhhQhqKzysipWQ
	 H/Q4SSBnAe+XvESArtNhzJSo5dK8iF/H5DzD7wa55Yu6durTg+pw8HgINNhCYU0eJAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFD606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a595487d43so6887181fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593636; x=1793198436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=Ob872DEfECdrJK5rcadxSeTINa2R3SWYjAVksQcx6u8Y0WBhx6DD9Zg6jjBC9Nw8CI
         jTwxzV4diaMg1TmE31UYlW3jQzImoeLgRbu8BoKoShkPwswRHP9/a22GUcPq3OXY1Ajc
         VqwSmPTfE3WzPO+jDE38J3B7w5Ejh2qv9ekiAqomoCG8hEsLXD1vkyhLMdDT5sCe1ast
         j7ouDyrB4GOphshdOqtB6MKyhR1CoCWbiD2a6rchLomtwTeRqNpPeoAcxWZ7jS927InK
         9ccycYhNXxgBB2pD5TWTFbqzHseH4abOHhPNhRYymBUa3d45TcN4cbVa3p7OKBZrnje0
         NLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593636; x=1793198436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=iAun3CdwrOLB1F7WLekdAAA2bPNBFGVpS/0pr15wEB9r39F5CAWP8odCqzSJkIEU8p
         tsanZiV9LXEWJewQZGAzIqegA9cl2ARoY+S67f0vecgiCv2Z0oRNSx16XqmmqZp6NJZV
         IbByBsWbyXoQEf5yU6+tbq5NegGwpIwRK1/AWbkusa7/t4vWa1MvRJQ7u/6UC3EpUoU0
         CDf3nVTo1dZfFzLRZ+POMEgRLEEYrfxIW9npQVp7bcqHbsNMrayQU6wNEKFyhi8j+tKO
         /H4pby1QmDNv3kVA30PgWpnx2QfH5XcMuh1qZPqn+Fb56vFzKunkX4AftiWzxkY+/sxV
         HZmw==
X-Forwarded-Encrypted: i=1; AKwUvBwKKQdDFWC4EBPnWY4nR5NcfX70Z7Dog6YNPDmfetV9Ao57Za4aAqehIjMIVVKHLyjeEoxVw0AFtJiXr8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKHLQ5+F1LqAktpRrD+3IZD1iMRWjVE+X67nfl/LD1xK8zLCRr
	+5bQRxq2Dx+6yrIjqjLeq9tCRsXDsma1HkbgBbo2Pilhn95lD5u7Jef7
X-Gm-Gg: AYBFou102rZSeEGAsUKAfAqAM6DxG4d2XiG67qJGEQCEQEQoZD3fUEA4DaIBiaAFk6X
	lLZ2xFmS8Ouwik6byYi8jYHvro7XuHR64d6sNSMfufz3rpipig15tvWNqimW/5U62RrELa3kx7H
	+1O23zr6f94ijgcr2nS/nwuZ28N92kriZLZcZzV5/Yk2/1rHi8IY+xhsW5DXy3lTgNTBNYNT9aR
	RWNKY7llQUHkeYrWspNpQlGUy5bXXSWmzH8aTEnf+4AgpCpfD7wPOeqVEnR5DIuFS2N4rXj3EvC
	pjFRy1qw7tg2fcTnJyQb5yy6FPcS/gDeBS+OJhhq1rkv73Fu+ynzoUk8cJKvX38SHsaSgx9wNvz
	1o/ip3+WJz1eogno2m1HztEGQL9SoDle/3Ha9Kc0wcPSJDmKr41Q6DL0GTPSw0JkWRIbDhDH5pl
	8B0Qr5m4ilsNI8qLihzA6t4iTRxJQOB8LCGxvZnPK7bP1QtXVka2kmzdOwtJ9Vg3FyqaXkBgGo+
	sLTwJ/IKF1crwHv/c+iwG1sDqMu6JrNH367z03d3W63cGLVnZs2Lz2Hk9GVXbPy2Jg0yjbesg==
X-Received: by 2002:a05:651c:150a:b0:3a8:bd3d:549a with SMTP id 38308e7fff4ca-3ac44145e40mr6460711fa.7.1792593636213;
        Wed, 21 Oct 2026 07:40:36 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([94.126.152.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563bf7sm358271fa.18.2026.10.21.07.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen 1
Date: Wed, 21 Oct 2026 17:40:34 +0300
Message-ID: <20261021144034.1636708-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179198409516.839288.2293417415100693160@kernel.org>
References: <20261011191026.149338-1-rillian.grant@gmail.com> <20261011191026.149338-5-rillian.grant@gmail.com> <179198409516.839288.2293417415100693160@kernel.org>
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

Hi Lee,

We can share the board-description code in ipu-bridge and add flash-leds,
as Sakari and Andy suggested, while keeping per-board current settings.

Lenovo's packages set IRFlashLedIntensity=30 for the X1 [1] and 40 for
the X9 [2]. With both outputs using the same current setting, these
convert to nominal totals of 467350 uA and 608050 uA respectively. The
X9 result matches Rillian's trace; the X1 result is from static analysis,
with live Windows behavior still unverified.

My earlier claim that Windows applies a fixed configuration to any
LM3643 was too broad: the sensor configuration affects the current request.

Both default paths configure a 400 ms controller timeout. Actual mode,
pulse duration and continuous-torch limits remain unverified, so these
are candidate operating settings rather than established LED limits.

Rillian, could you share the relevant SPB trace, including mode, current
and timeout writes, together with the installed driver version?

[1] https://download.lenovo.com/pccbbs/mobiles/n4oce17w.html
[2] https://download.lenovo.com/pccbbs/mobiles/n4cim20w.html

Ruslan
