Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950974;
	b=yI0bx4K02VMtPo6rSslPgsHVcTl5+Yl1tW82PjbUijb3yqfLWIrjmAZBEQ9HMF8sL3KS
	 4Z0fMoH96IqEfIjivk2znlrad5UIjisbWdsZHlW2KDUPFHEd7i28b/IyAVr7gEUFN/TTo
	 1OHAvea4tVoOd1yLASjaukssu4cer1iLV3WCuTFlT5CZz7PHsxEXKo40l1ig3QT6rFNxr
	 u/PVIl/5pF4+PL6rDPqTqdSWsdCy6TEMYTmUYvzDtYpogAgJ+Nj5Hcm64iMFV8miXmXLD
	 rR2CwtCOfk/b3JVgDh3JytemL9ItPmy4BJceIp7ago1JpMeFFUs/Mm5kXGvBEK620rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SXii5GktA4CZeOSbyDwfaVIzrhVE1sjkrKTFOh6rYNA=;
	b=Vxh12uExyaRhtUL/rHOy6I1Yb0NxSmb2lXKukD64G6JZEgf3d9T6zq1uRk/h+JA+3U4h
	 dPeHq0wttfMGxmoEhTj9or3IC54lJ0TFxKVG+niBiE//M2J1zQhx/eCIux/BqC5fZiF2G
	 Qk7LehUCLKSszW/+vinencDGv4PYBV6DDKFxpb/u2OgjdZjhgcon4jTZZjMEU1j6wZv/O
	 sCuP3qYTbJ9l9BrUqhIXN67KGmWDWxWtxIMZp3jbs8yJ7OLIZ2p2JFRYT7WwPCwPUvUP8
	 ajI6FABufcPVnsqkwIeV1Ds/OvDIAZeWZrwZ/oOCWk3zdfRW8gqMY3FkwUAZtFXFJYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aKAR9m9E;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA687606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA687606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aKAR9m9E
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso2468475a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950972; x=1793555772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXii5GktA4CZeOSbyDwfaVIzrhVE1sjkrKTFOh6rYNA=;
        b=aKAR9m9ELyTAs2S78YaI8Ygg9vVvPRB6wecjEOJyirTJP7vU5ATjCGRS4c12pe5tYQ
         gZLdtBJBP2zbh8ZetQaDMXo0rjOUD9fxbbZX8HyGbubUN/xZ79T76e5H+x+bkTtcRJR6
         n8M4hsNwssavBZRTWpYcRcXusefSzMURcplDvs8R9umXIlG9/ou5iKST09thoF6q3515
         AFrdc0PJnn1ctTQBiPHbRUjhDkEIHeBU/H0d1XsnKS7rsAAG6DBrqr+lclbcwZDTKyir
         JCo5jYVZQfTuMxQOw5P1Ji4AIoNjyMBQVPl/0DyToeWF2HOzjXLYJfpyfxrTsQEEwUX7
         0Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950972; x=1793555772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXii5GktA4CZeOSbyDwfaVIzrhVE1sjkrKTFOh6rYNA=;
        b=pDB0riUebyCfEqll9oSjBYNtjNj/n837ppLCGePyU6W9oOzkWIiKjFYpWxeTWZnzpu
         JfU48ksCIPl2+rr7zusxwt0K7/PFB29J4Fzhd1+0TOJywpRgHEeLrjLmc9nzpSuAe3wg
         oACAVWRGAgUvCKrUif4+rcZQ/FF8x3xnan2URkQoTcZoUi7ylC5tCpM7ie7rwqXA9Jzi
         K5lnc8eFOA5ex41l9XjT4KynsXyiYugyiGZmEIDoAC40Azuq7By9KYVM6FSnxJ3hliSz
         8FPukqX4kNDbgsTcYSclcrJeyDDsmfX5O96cP9fJeOMAKq+UgGpS7p7sW9hQHqJrjzzG
         cUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsN9egX8Ts8Q5ODklhyRkp5RwCUiFBpn7Waa9z/kZaOkXb6fTf/5gCrxNlPDhOx6VOhyTg5Rv3Nwg/hdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfxUVcqYSu2MVpUVrVVlWnle27wG2WhOCEacl85xfh0kC9fvFB
	+RSJJw5k9p+IYbMM+3JNga6u7761QB3/pbpjVoMuFpLPs4NufQubmXPD
X-Gm-Gg: AYBFou2Uw0HTxVjbXl9hTsloeiNvAKnubV6qoHESAca9tN4PiYtzL1nsvF6UrrW2SUS
	frP7K8zRsu0TRnpd0dfLpow9AFSKaXT2f7HmgAyobPLgnJboXSOvRPeHIHz33QJu+2TplV0LQ5H
	TzCGbdebF92baWjj/GawjZyo1GXqgVL5/rjyeeAjqW/muYcNFizV9sPttEY1pZssiJsJx7kHaGY
	Px3xohzGzcTFIzc1xe0vzhNa4h7walwUEtSfeYiGq1+6FjgM2SHiFnZKl8Ed/1t6SugU34GFUX0
	JiqBUIVsw5r7HpEBohzT0r0yDvGvWx0A2An1JBLbUOvrBy9K1/oUwG2Xt3pjzEatAc7iTlk+Czw
	eskKyr2z7QgnHH8gNW/OBaJ4qrY3nxo5lLOPKBXtuHXrDQFBweat5RpSXnaKNuFbKHs38Zx47GR
	hYB9DzvsGhU3Rt7HV8yTTYKdesgU7jAcMpZM0C3VrKvd2re7ebIT8aTWw5UpHJSGRFlmsgZKGjs
	8eenS8t3Fgng7h3AvJg7gVoAcVFMVGhAvbjuwyVuHMe4ZeIFQ9GRIbLjXsJPilY9YkOJzlG06G1
	/ChrotR+ug==
X-Received: by 2002:a17:907:6d22:b0:c2e:4b90:3c56 with SMTP id a640c23a62f3a-c46bddb306amr626988666b.13.1792950972201;
        Sun, 25 Oct 2026 10:56:12 -0700 (PDT)
Received: from antekk-kvm.a.lan ([45.137.227.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f95csm230574766b.5.2026.10.25.10.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:56:11 -0700 (PDT)
From: =?UTF-8?q?Antoni=20Kuczy=C5=84ski?= <antoni.kucz@gmail.com>
To: antoni.kucz@gmail.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating SSE/AVX code
Date: Sun, 25 Oct 2026 18:55:57 +0100
Message-ID: <20261025175557.9434-1-antoni.kucz@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025174336.8857-1-antoni.kucz@gmail.com>
References: <20261025174336.8857-1-antoni.kucz@gmail.com>
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

Adding Nathan, who reviewed the related EGPR fix for native builds
(commit 63edf5a009ae), and the x86 maintainers explicitly - sorry,
the Cc list got dropped when sending.

Patch: https://lore.kernel.org/all/20261025174336.8857-1-antoni.kucz@gmail.com/

Thanks,
Antoni
