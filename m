Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A265472070
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799593; cv=none; b=rJclCxGYF6ZcvrOyqRvbSpaESkcITjA/8oKLcXNlqfsMhbtjoYsTuzUyIsKNk4kDIZ8IkMfXCzG4EEhEngdEO5Kz6uRVFDziT3TcdDinDrrOEbKmL1nizIyej5hTsNeCPZyHBnBQq2OJTXbJjzmaNXrpCPzi9t/jSESitMSQe3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799593; c=relaxed/simple;
	bh=kZai7cDOlZ0+l6zlb8MOoVY8sOR0vPM3UXr16XTNIpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgrC9+WwiKE2ddaQfy/DeRpWoxkK6r4B4zXY5vUSewXB6PKMJ6VYnihhGJmf2IINGbWFfrU0jD2EqdbPAhvP/UbGhsdbBcMmeWvG/4lxH44sB5j0n90teMiWSF7fhCGzweKopxZ5M71QQNCBUWNuN/SLCnEbtvOBcNv6dC2vKNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbBPxpTM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbBPxpTM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1183064a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799575; x=1792404375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=WbBPxpTM92buRt1qt+sCUARj3Hf7X8npxhuFCGvfZ/PwvQ3UlKiEPFI3DOFz/CqDwA
         985y8a+sEvtxjQJbnPDMlXYXW5slsfUNLiuZQuRSO2EbGl8nASH70Vv9aOuHq5dJ1sCq
         qjo7UqkOuNEPu9/vJNC88JgZTBs0w02PKXCXGxPDiQ8rVwjaC9TcTg5g8y4CXbXVJYSI
         7RNcG3ZvrD2+V1Tai6KzQUnXprFxfDsgCqY65ocMPZwOTUpgpcdXJ54y94zGoQqAPGhO
         84n9nxcv1sZW/jTNjAU8GjT/QXkMv2uOSIoT2jKgPs8TadTjpR1tPKWWDXySF+shUVGT
         gD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799575; x=1792404375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Byus0DODj6fofwroehsBhvXhreRXoniXBi5MxJoOlL0=;
        b=LfZB2arYmMU6DOiNv0odAxTdx6Swg1KmY9TNTHAhTZQA0/rlCe3BUYfR+YDs/zk7UI
         cH8nGSl4TQBSnCi+3bleT0qa9CsWgYqxilWKElzMscM+G7xWd5QZseg2uP7/lXTXeB3j
         KONChMM46gPVE2XJ1PFhBKJZaT8lSC2Ot8isrvinMAhKEJEIBr5C853cvVh0EP4+yXwi
         eFWGwl2MgC1HcoBazsp0kR16firk7+1JS4agtbtpa5U21mTWdrwcKbheLfeSDhx5UBUQ
         +yp3HUTqD5lm8s7dFw9KpxUO0d9pixWHlcUVGkbca/OQBDoUy5+0ayzc5oX+2/84gWp2
         EQrA==
X-Forwarded-Encrypted: i=1; AKwUvByLu9U/tm/RX5nUgpz/SZ9GPv9FhjJ3oZFcR03+SjnKJyy4/MDaKcAouQWh4Fa+rfcAd0gfWwBMrtacysQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjoKopfrGgi5BHxEbLLSrwBq091bJMLY8UcL9+YU+VpWFpnxgy
	lkJuNCy8NKos82jsSRtsG6JTbVA386SgmKWfkadSuy8YQ3K2CEKPOKxT
X-Gm-Gg: AYBFou1hMfjikIztVmN5TCGdIRi/a8ez1s7mrpZNP7tkm1Bz3xhrH7YNA7GiO9cMT86
	WZOKWMyUzp24YRvcm+7vP6IqwvU40DZeGocLZHXoQkCi6P93hp/Jv41mrNSrS4i/7SJeVcE/9/k
	joTeslsFTsRvltHd24Z99G4U2tViHPdhrNcVRwmE/HcddJTBVJbRAQZUZPF5OHWq71vNue5C8VK
	iT7c5EF0NtNkw3GWEFWZnntALBkTVsT+cUQFJjn9JGhHCcebci9ZDX1Ehb1VF+2TENiNFWxKQwV
	O13SiMBBhZhxf8iYnH8HFw717f/SZ1/N67VuyVK44zmi3hNn5ds/s721Yhv94eURJxP8hW306Fb
	SWTXycKjgYWp63KI2VrPKqfbhUdmiCkD21bNzilvuThupO019vl4ikWVTFJ9r0Q2jUHnATns4sA
	if+IGUnnkYcg8WZedrawFwCzja1S1RE+JgAwkNKEM3bhJ1cD/b9cAs29E2yCpyknRQHn5Bx1LMX
	noD2BwKbA==
X-Received: by 2002:a17:90b:3a48:b0:3a4:b418:94ce with SMTP id 98e67ed59e1d1-3ab3a2fe510mr7456083a91.1.1791799574658;
        Mon, 12 Oct 2026 03:06:14 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:14 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v11 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 12 Oct 2026 18:05:29 +0800
Message-ID: <20261012100532.19612-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a6978d14b975..93a519b96189 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

