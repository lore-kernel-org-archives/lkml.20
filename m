Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065833;
	b=4ITBKVSOoTkVOFawogMhafrsXzPcgWcOixL4K/YnASElmb+H4xZIT3hwSvWgPjOs1RHa
	 9paV+GDvE1IJNkUqMANG1EA3iKOOra56ByqDtk88QqM/aQLdPXUp3VctRgEYPBL6RiRfd
	 UUz41IAiT+tOh7fgqrahKtM66KNeeDVXAaGGROPfzUcX/CddA9flNrDD0L+BBVqRKrNNF
	 LUL3MSisN64UFXhy1Bd2qlF6bZdE2Uur+A7avEb368us9Cj4YmnB98u2iMjz4HqLJC9fk
	 yDS7Xwge2V29HRmVZw14tiLpNWxEj9NrJRCoPpXOPMeU2j2RygNs/HEfqmWOXE/3RnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=;
	b=4RPkdWAgkgYmvKmqImDtiE0lzdxeQ2cyjYdHEayL4hVwYEmXCg7fJxeEHEW3pdPU3fyc
	 8+6vCF9P3W+8GPgI5nnJKhmBNMeRkB+nTVP9vbMihmyU5/QJyEuFpcnAKsgize4EqXQ9X
	 2NVRb/7zrBQViaZ4ywPXACLgT4Fa0hBzumq5ydTGgxZ1/OJwERmWsSLiPyraI0YTgJ4nk
	 hyGZSLYT1shHX7J8GDb9L54/wjYV8fOrDzEuzXq/MyivTpz5RZyWT1mL2Wdr6a5kRMVAg
	 j0xfX550f9Br8skywUHbKS/fuHnE3MhyICb37U2/1ji6OzGs2Az34PxxabfPFB/WsMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hxarWpgB;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A2606D815
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A82A2606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hxarWpgB
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d1684d1b3so153350666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065831; x=1794670631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=;
        b=hxarWpgB8pkR/Bl2eF9JDKbqhJ+XujHDX6prKlHQIlHea7Lmv2Y5JQDl8ebnHtYB7+
         cfuO5gY9gdVcqbHbEFDWFCzuw8i8xqf0BuMWVWXiCM4GBLQdxxfUcSKElL4Pdu/kYWw2
         U40vMVK/AQQWF075dFHIMBsbNJS4zFBmVeW3ec6XaUfgVMakawr/J5s9U8hPfdaj9VBw
         2Ak5uEtwNI7QtkW7g48ZoJmHu6mWsvB/A0a+LBUGYmN0ZLS2sZGMfuVS66yNKutCU2H7
         J3VxIkxiFYoBFsDvxF5g27Xgs3YtVsnW09oRBPQSRz9Yt5X8WiXwOV/gGOodf/VLYeyO
         Vfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065831; x=1794670631;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bPXM2LkmtpK7Ni258d7gmUaqYy5Bmjl3oUXnjWcb2s=;
        b=0ZWCqLl1+0MERjtiV2GedA4S91FYQClryhB8dkh+L9ljtgt5me9iCogzawkMSgqAwe
         K10NmblaLgK9MpZNofxG1jqQx4JYh133wAoFgsBiQPjKRQDAG0n4HvdPjfV1jvTkLjyk
         uhkDrrGlMSBQ15JXDSsBzRIDi4ZH1fPD7ZTkJ8P7VdhU2UjuW0Ku0oFwwkSxk9SdxlpV
         VK3kkjN7FMbhKNoNJHjmX7wqaBTa1N81DvB/J4s8AhKatQ7FbP02BAFmJHqDoOjMET7J
         jDZJhW9o9d+9UcXWyP8fyxmSBazYRIWVOj17T2TqV8DzHk5mM5FKfUUc4PjoGuCnBrUR
         0e8w==
X-Forwarded-Encrypted: i=1; AL+hErGNS7DmGV35VnjROgN8j5QC1QqFblOo+KTWDdrhRTi/xuQ7GoJEA0O5fdqL9kkepoaatZsTHV1o7SFHgM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dXVhlC5tUmD9Ljk0pnUbf+1Aj6Vo24RVh3gkRn44Hk9VGRB49
	aUOkbIGS3R95Q4U0NPezbCTIMxzIVsK1LtgyeCUBiXNb6svdQDXzTp5Y3eNPq/pUD0NFmnaoHbW
	A3w==
X-Received: from ejbc21.prod.google.com ([2002:a17:906:3415:b0:c49:c3a3:7a4b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:ef0c:b0:c4c:eb17:3da
 with SMTP id a640c23a62f3a-c4d34baf049mr438869066b.22.1794065830762; Sat, 07
 Nov 2026 07:37:10 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:09 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-3-d84ea5f30f94@google.com>
Subject: [PATCH 03/24] arm64: Fix volatility of IRG inline assembly
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Add the 'volatile' qualifier, without which both GCC and Clang treat the
function as pure, potentially collapsing multiple inlined calls into a
single one (returning the same not-so-random tag) through CSE or moving
an inlined call within a loop out of it. This is not compatible with
IRG's architecturally-defined RNG side effects.

As existing KASAN callers are either not inlined or guarded by runtime
conditions, the compiler isn't allowed to hoist the non-volatile asm.
Note that commit 85f49cae4dfc ("arm64: mte: add in-kernel MTE helpers")
originally introduced the helper as an out-of-line function (in mte.c),
so the risk then was even smaller than when defined in a header.

I'll mark this 'Fixes' since it addresses UB but won't request stable
backports, as none of the issues mentioned above were actually hit.

Fixes: 2cb34276427a ("arm64: kasan: simplify and inline MTE functions")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index de910f1c19e1..43510341b965 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -111,7 +111,7 @@ static inline u8 mte_get_random_tag(void)
 {
 	void *addr;
=20
-	asm(__MTE_PREAMBLE "irg %0, %0"
+	asm volatile(__MTE_PREAMBLE "irg %0, %0"
 		: "=3Dr" (addr));
=20
 	return mte_get_ptr_tag(addr);

--=20
2.56.0.455.g6c5a503b38-goog

