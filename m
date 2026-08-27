Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA97470428
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836867; cv=none; b=IAq6XozWsZ5wQQG8nxPw4O/ybUoaYMV2dbSF6y9yBHP/uRpVZBLUP7bp7sMeXwys7PI/EXOtWRFfA2UTimK66p/Z7lWMDD5LnegxlR2Y7dRddmW0TE+YEco67+zJGw74YhjYjUx/MIHjREQPMmX7eNYvq/6nGE8TYkfxKCPHpDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836867; c=relaxed/simple;
	bh=otkzb/Utnj2sMsei3FnfsBOWIWU1kpxHJ467PHyBctQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LA6dClH8HXS6pGZY5yaBbUBs4a/nXgGuIOfU0Hz9iLTu7z+zkbesX/0Og7u/ObPkM0z84go/yYf2Mh/oEahQSOowJAWVo724qEIfy0nxI154WXnfF8ssob1DMXhvUoREqms7wP97/GJj2MkZPXXBP1vLj9JuQlKhOqm7qKBLbdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRan3pWL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRan3pWL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e257a23aso1187903f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787836854; x=1788441654; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=an9B2mofauJa0deNsX9pImK+/DE4Hcahi53KOOKUS84=;
        b=NRan3pWLwMB2lKKp71xWXGZSVmMoxcPdhn8hR1dir6BZ5CCqNwU+4YYiplwyGYqq6D
         rWQNtucNX3NS1HxGulAmsie9m9u3xRVoVW40DW7lCDnkNWNSu9p4SZqJ54ke+4/CId2k
         byh86msy4ftD4eYMngdxAYbxrPAEyN3+RsAbU0RlKKcawtHnz4rRQYcOUDsCcbFxwhLF
         zJcmBXbrwkfpzT6YHE1BEMKVsxwfLHvj6qxdNhbO5VzidREZhTZX3M7640FP+shhkQM6
         acbJjVa450B/PB9tmJe0BMXbGuGiRjqEo8JtjLIsglU5de2z4/iEWjbZAJSAtchEaZB4
         Kt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787836854; x=1788441654;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=an9B2mofauJa0deNsX9pImK+/DE4Hcahi53KOOKUS84=;
        b=EXEZJ7HVpJOeoVUno+tyb+5DQymet8LnWhIJeFt6vuP34yK3YIFgnc50TitU6yvLw1
         zjdPshijDaHUuQ8HZZOv8lAI2VQZKpIusMXi6TKtqJ1KCycyoTs678N1IHQzw4vCsaA9
         cCYx58/6R0K+0eEh4VpT24f4EuEyN84FAZ7aG1zsp2foYu1UYI5pNRv+Fsow6t9EwrPE
         l8w4klLcd5djO/Tz+YgsDYu8SaykvagTeeSUyugv4Y9agR6z38ehHR35BFtkvOOPkLom
         tUs6Hrj+3wfoI21GoTJEnW55mccv4K/bs/mn7C3/7i3iVyc34q9SRmBxFGQBTIp7iyTJ
         Iyrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp20QzqoN5N6bzLhbQNcC1eXWTz35H03bYtpbhzEou1qIPcCiw8a7kO5KEN7BZafwGTIQmQaWQfulldF+A=@vger.kernel.org
X-Gm-Message-State: AFuF++kz2WKgHq1M47N3VX94tVMRhRx78wC6h/MmwjK9kOs37hCYhma0
	cfWAOcYCO+C+SILR299mem18FzJIIwvEUVzUo/IvlTMYMK0XyeJvgOQM
X-Gm-Gg: AR+sD10j4p2mY2XT2YlG1odlGHayZR5YgrxbxMAECqi8N4HmfuJStFOs4orykI9Toqa
	sRSo+X5LhsOsy46SovBrwc3M+i8fmpgPzvMWptxy/2F33BaowAvWeAPsqNQg+rpMsWkdRhhx+4E
	VRUf5EA/h6f14RBHQxvD9tEJim6DDCElqk/d4cxelEbo2xJNGtayQdc2jWZT1Ek1jgHMTXPrnXs
	zpRJSKP3QqoJN+ZceXJqh8FQp94FfxmWnU9eZev15PVwiXhydkXz4kR+55v9EmMf77m1sYMe+KK
	Ce34gKYpOtsp5oKEHv8QBQ8bk5Ktle6yWxLo8n3zVCtUDaJMD0YKYSuLTVwk2KyHBdp5rQIFI5F
	+FJxcRAABpnK49zAdgwHNXOe4NohcGJWGxtUH59C3kdiwuhuqpp/hLNPYBTMr0dAoucAyutTVo0
	N9aSzDALWO7yMXq8iPEG4EOcsmYydvVSarDpySZWtud8iFvtc5TYuNb18VbU99jJ+k8FHYG6MHz
	XTV9McqQNN/SQDfKzYK1L1VuUWW8BjmbgSvROdUlRY/NVYDF8SHSbbfxnj2PZqbNw==
X-Received: by 2002:a05:6000:645:b0:482:dbe5:d12a with SMTP id ffacd0b85a97d-482e26d8217mr16473770f8f.9.1787836853991;
        Thu, 27 Aug 2026 06:20:53 -0700 (PDT)
Received: from valmpani.valmpani (ppp-94-67-69-196.home.otenet.gr. [94.67.69.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6917sm8694744f8f.35.2026.08.27.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] NFS: sysfs: fix use-after-free on delayed kobject
 release
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Benjamin Coddington <bcodding@redhat.com>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803-nfs-v1-1-034176dab4a3@gmail.com>
References: <20260803-nfs-v1-1-034176dab4a3@gmail.com>
Date: Thu, 27 Aug 2026 15:20:46 +0200
Message-Id: <178783684601.144167.6448011883318625857.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787836851; l=227;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=otkzb/Utnj2sMsei3FnfsBOWIWU1kpxHJ467PHyBctQ=;
 b=07QqWqTywTQBT2setq/Vuljo/tf5nYXP4Vo4M9MA0JDQCD7YDR6HLI9vwsTNint1WFTcGWKZv
 PXGpT0JfPAKBdzlYaA7Nu/F1YGa0sRKfJf3NHwyYZ/BfMqMBDqzypSj
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

Hello everyone, just checking on this patch. It has received required
review. Is there anything else needed before it can be merged?

Kind regards,
Vasileios Almpanis

-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>
