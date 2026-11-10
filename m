Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314282;
	b=t5KDKkZr3Y7Q7O/x6L5kLf9hqhrJ8USOg5P11gGzDnsl1CrDTGCDpJEvuTExW+VkJoHu
	 wzw4SyErmqPCvVE832fnvuw7XmWEe+4dkvAShGUxplmPyLXRqS4t3Mfav2MrD9jKDidbd
	 A46RQ2fC9hJDnx12FLdu6n5oksdT5Miss+jBxQYs0CnHX5ZMmw1txJyRinWsclqUv5j9B
	 4vnxfEAzdo+ikeQBhr1WmERWN+TFpNO/2tdoxjAIIvoqru1TRKFylZaPQ4Rw0Lh+fgZ/P
	 Yqomv7KVA+19oAfHIyzi1FR6BqFniiQBF5REAxdnjJ2BhzVThVOqVUNOkjiCcUUL77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
	b=KwXvD2BtptHwyG4HKrHwhE7xscwnSn13l8Pdxx04BpfNCEbaNR7s8YBxP24dS/coZcNR
	 L+B9QlZ80n5gGbZml0EuJdq3S57Px1ZI/nXRQr5vfX6fYrK2oqAmCskzntkX1XaGpWGL9
	 qv5xBcCdeAxkY858jpAZxyrbdqap4bkU7SzywprUSw57sL9SoxHXHKQgK2j7fW3W4Wl22
	 /HCUtwS3iNfVEFLCokZmeUFPFxV3TTjAUUR2CNaAtch+XluCaTuMw5K9/oPIT4alNgWuY
	 jDd0/1KV4Lu5PbOrobDJoev0kYiqpTnqW1Mfa3M6pTZWZG5kzsgLS9H8Mg04LPWAQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=RhEL56TW;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB9C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=RhEL56TW
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so628004137.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1794314281; x=1794919081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=RhEL56TWvZBXkEIEDYfBQgetrfcsntdz9+ZDPeqE/R5D/l7VBDa8SbFKKD2SNgQ5x2
         394OOvhKe/y5ClVwdIb1P4XsznMFbB/0VIcXtvPWj3i/xjUH7A5QtEYipC/c620fZvgk
         4JFfpKE9lEufOGNsrIlYIhFHM69Y7biG82vOKYUkDXXUjChSkhEOiMsOERFtWzMKL0hS
         0RQCfKzdyQEnlpDUHx3JgZ0MYIbzEEAt2LOE6yYkTIx8rY16niz2/wKaxfIpnlKS28Ph
         xsjRZpmFpfaEY9B1gLvG3yAEWKjNJT64BKCf6xZuj8lsdPg+4htkegzdxmLfg5px8Q//
         xCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314281; x=1794919081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=OPsvPGbGdxebr6DWOnT5oZXLk9/TBUVIkU0auyHIPKYlimfzOz7Dsa0ASz8jcBt5PE
         VZqn2CKzzb42uRIFXQU169y/vc+gG03JKtr0efTdMpyVro8CukXyDn334qDTkKgdN/s1
         1Vyol0jODW/4g1f/dRnawS1W4S6TO0yHgOulgVNBtfn+ZIY8nlSr3/JWZ+5pNvenPJUe
         oA0h1VVBy/9KxWjoNqWfequPMnn9VG6Ic/vnQvysPB1j0CrV+4nOqn0wKoXlZxFlKKuT
         Md1XltBIMmE+Xmr+8778c5NynV9c1ivbQ2FriC7bw7B7G+Yhb1uFhsqT1KAWITH7DJWb
         ULgg==
X-Forwarded-Encrypted: i=1; AL+hErFRbBEXddwxsvy9NqCWuFSKesZu+ZY9m9AKfP46TL7ePKA/plaWuLxe+rISjgpoLU1cI6Xziatd0WIz+1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z++C9GWRa5qGYVRRtXi/c0XlJmYKSbDaPE2Y+zpPj8QP9feISd+
	uG2oz2EqrF9nXK9RJSjyQ93dfYBh/04d7EJPY+NuwMDqkuMhbAKUOelIzJfLfTVBXwo=
X-Gm-Gg: AYBFou2lGUIWPKPJ0r1LbQFOKmOeEqqOLU0XLEr4ZV4Hdnwni5sdF2ic+88x7d4MJGY
	n633qoi25XnC3OytpBiM4TaJsk3/b6Ph4xiqNmx41S0aylqruNfX2+N7Z6d4Mx0mJzM4YhVbpQP
	jnopE3Zt98bMKd/Jtxv53Im6XZAIaNunKh68YldWRheMfInEmpE12jSncLNhTT9cJl5JTxqvprk
	or9iJusRJ5oefX15ZubwvPMOZv9B/HtlummdxtR9yPfIhIqwCK9S8zjG2vXT6Mcvdgm4WqXNgZ8
	cbezxsHyP0qh44oORQlHANuxtogO/1qRDs8XK83BZG0RlTQZKbDv2zN2/dxb1AUonZOeHA8cHXP
	up7YsdSvWjJTT1UHRmU5Grg5CDwxX47FjxenDoGkx1KI00g7IAbkiylB7oYWHcxlqshTb5C2fsL
	ugx/U9QfLUIppHnuFaBtPXG86fPfiXyDZsbJKbhs7MGbsZeMYKczOfpS4F1ELbyLz/9/85PGXrI
	+sWXzF+v+piPSJKKSTtbkEEIMDbAQHEtVMTd7OVHdOlkvqWxIQXYrQimf8yInwzqHAbSLhldqKQ
	hYpAv8a4em6m/s+RMp/VYuBr2XL82orr4j1dgunRiSB6FhQP/R35xeg9XCcqtgEZp8Tt3vK3tCc
	aPiS/WDseFdGBe0lxyDpozhAKzpzgPl0ApgwRMmQEHsby2dmTN6VmQzzCsMAObrOiJJC+U4P+b6
	hWkHuPlEC/cPl30Jqtm8jgWAa/zYf5HPVXi0hCP4vZFkntZjSlu//oTzC3HxvT8Qs7
X-Received: by 2002:a05:6102:94c:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d301ba5407mr716189137.18.1794314280680;
        Tue, 10 Nov 2026 04:38:00 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d30209ff97sm1658194137.0.2026.11.10.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:37:59 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: arpith99@gmail.com
Cc: sakari.ailus@linux.intel.com,
	gvozdoder@gmail.com,
	lixu.zhang@intel.com,
	mchehab@kernel.org,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Tue, 10 Nov 2026 07:37:57 -0500
Message-ID: <20261110123757.730188-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

(Resending, my first copy had a broken Cc list.)

Sorry about this, the HM1092 ipu-bridge entry went in ahead of the
driver. The change matches the CVS fix and looks right to me.

Reviewed-by: Jake Steinman <j@metarealtyinc.ca>

Sergey's VCM point probably still holds: a VCM instantiated by
ipu-bridge only gets its node from .complete(). Sakari, if you'd rather
not rely on per-bridge fixes until the hm1092 driver lands, I'm fine
with reverting 4fdb0342f05e.

Jake
