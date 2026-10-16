Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0788D2E266C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158611; cv=none; b=JoHFutNRa8pBVOSYH5co5kFONae3pFlXnDCW1Y3cA0T9//aC5ZgrQR0GegNpTKFbC0se20mOPzGvZUCLvIJBTtiRT9vUDd4D21wUtdCdqKjBomvNSyddIvye0KBrNvBbeLPsF8Vujpmfyl0cvQrQNfacBlDzuaz9fISl0gE8MaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158611; c=relaxed/simple;
	bh=g7n5KSyB9dHuwa9DCb0qOHcMvX3fr1aRdEPuf9O8HZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KX13hvAASDkDdCJw/8e1gBolrE/FZojgQ1BU3nW7aHzVitRIzRSHlztyOOje5+9A6pgs7yWRkMqOEhoO0TL0lITRAAYPSBpRNauyh4dUi/3rtgjsad3ztFLntg9GMdnQ0yUlNYhBJK1oF06EL13AojOoqSC0uHZ8vTG11iXtnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCZPubhC; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCZPubhC"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2507886a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158609; x=1792763409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7n5KSyB9dHuwa9DCb0qOHcMvX3fr1aRdEPuf9O8HZw=;
        b=sCZPubhCeOlv/2DS7gdZSmF21zPP7UFQ/DWzqGypU/ZJc6n4MNrLVK+MbKMC7AEVB0
         lfirfod0qavHSpmCh8V2DIJ2LLpl0o6Xke8rBdnnNpbnk3Hq9/jfa5593wmGsjlk+u3F
         36ckpoFeIWLj8Z1CMv+QmvoXGWAlxgLvUXBFn1ngFsoDKMWcJr11szevXa5nqsIG6HfZ
         avIw8ehCmjeMOnUb7Cx6nxc3f2xZh0reYpDYU24Hbc9kjF8460tv0uQ7A6GkCmVVeFqR
         nPoeFkEnRyIZgJ9e/v9OzTEyJj558iHHGdivOmekOrvXvpLTpFNcoBfEErqruObIrFaq
         4DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158609; x=1792763409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7n5KSyB9dHuwa9DCb0qOHcMvX3fr1aRdEPuf9O8HZw=;
        b=qmjflyHu/sMzuRzbsrBbjbVYVepo+AXgzltr2wV2YY2C5koljrsc49K6Z5aDsAri5B
         /FpukCU+meNVUM7C9Rx8LZ868Di0G+F/+1mA4vEOIeAMRDPmyZ9zYzgrA7XH8NfJU+H0
         jvIW9etV5v7d0JqaZ2/7m09Ze+0PrGIhqjW/3Sr7aKbP4qtKIPRQZbfTPTJDysadT/xh
         ETqlQYL1/XFJYzVM3ogsy24rYZK3WhEqdC/FoFNTJP/7TMHu9hEQreM6LHZn28cFC60M
         aDeCvrWKzlt1ZOwrFDlrvMKq8AYj2A/HAyL1nMfEKCWQyLgxu90QX3zBsQoCp48SKwbS
         pRog==
X-Forwarded-Encrypted: i=1; AKwUvBwkAMdQyatpUarE0zjYrRAl19MpBv+cmPqwjrlH+oilfmbgwRg0EsGfB1ewfhwRYBNsUX++rDZ/IJrtHJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjo6pNF5O//ksWqqUh/IrhG4KGhvhkmVEzozSuY2IBu1Yzjbyj
	afbyBWi7IepRWjZiJRVUvyvE+zbPkp5m7YjOxKP9l4QyMDDQ+NQTz9H9
X-Gm-Gg: AYBFou2O+FG2imtL/jhlh+Lkpgs9v9WiI8fGuKQiQYmUBeRFkET1LrFXjXzhAO20bKd
	p+/MqYQpEAKb4D8V3fIVhDlUSHweh2mBFwgNLB4m6590mtPEOUXEtGTd70zAtr+AGHldAj4Usbv
	YArbCQ+uspnavHsd8OaV1goqVEa7vy58tW5VXo+/mFS0HrW15/lNSDGMClSn1CNpuhkPs4hHpAU
	94voQuZ4AfS40IPg6o1+jsFZDviNw7enJQxlqpKSWXxjhTyouwNo/P3gUcX6j6OOUsPyPk1nFLZ
	4ntn4iOuduPcy9a+iJnZOmUImzdiFwBDH3qnH9QF1jCBBedeC1+MaDPM5lKXm71uV1w2X7FvSWM
	DbilsursR8ij13ex9e4YWeXBKE42XMi0zODSdll3t7rvTpvLzGYZNjcXvyJ4gB5PucZU80P9SO6
	xaTDkbrKUv/eAH/QtpLvW4BfI3aEPAtc2wFFZhqjPltKVNgrhMPvsxq0h1xu2p3g8x8QO4+mM98
	/F4T3UeZpJbb5d4rWwAAl+GMm72YImUP+xzjLvT84SESOoolUw6PhSqmfXla285emIpe8Tu
X-Received: by 2002:a05:6a21:7d0c:b0:3e2:ea7:618 with SMTP id adf61e73a8af0-3e20ea744ebmr1597797637.18.1792158609291;
        Fri, 16 Oct 2026 06:50:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65484fe24sm1161715a12.3.2026.10.16.06.50.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 06:50:08 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: sgm41542: Use secs_to_jiffies()
Date: Fri, 16 Oct 2026 19:19:42 +0530
Message-ID: <20261016135002.35172-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261016101521.14140-1-sinha.aryan03@gmail.com>
References: <20261016101521.14140-1-sinha.aryan03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an accidental resend of a patch I already posted on 12 Oct, with
nothing changed between the two:

https://lore.kernel.org/all/20261012154614.42203-1-sinha.aryan03@gmail.com/

Please drop this copy and use the original. Sorry for the duplication.

Aryan
