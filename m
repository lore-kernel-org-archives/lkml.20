Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627741;
	b=uGqy3O1KKII8we+wkAZrpDkHKhCZLuujs7Sgtqrg08vRxJgi42Qnc5za9ytGIk5+NilF
	 K9OEnUHzVX8P4YJIDNg6Tig1vvwHf57cR5TVGIsf+oyqJZINsKMO8ZD6mE5e+7vt5TQhZ
	 SLpAAcOGfpgMQb2aznRRtU2i8CjgNfF1sr143VYrn8gzabDxHGGKPo6x+GyZ+MbHtdk+3
	 MjyTJByEVt9y2WuNB2ilvksgPVxUhHvI/Ni/CwrCtoPsmfBoT1mI/0r5Pp32xTPvZGlgE
	 kn6/dGOeSergxno/edaUui6m9NY31c00glhQ73yuFY573jMllW5kl0L/5igcL9C5Rjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
	b=28LXRHob2+b/dayxSvNt5mEzoP7C8zTL9acGJIFumEnAmDkJUXiiKLJINxh9MW71685I
	 feBsH/+QKlcAsOM7N4Ni7yXzfL48tykFy3sgxCSQc23FroHjd8uZPHaOkSoF/1EYLbTZL
	 whDXYVvS75my/FQmgVWQj3LqKICC0aK0pLeYqoXWr1U35NLLDXmmD9bAb6zOBRPu/Uvaw
	 vujt98GDk3a5RlGVIAyKDJlUDrJgs3/vk9cPTVNcvZue76TtPSo5PHmDATJZ76siUZdaL
	 aYUXZvndxRfwRPm2ltCR3K8Om/9Plh+4KXrf1YiC4Dkpt99oFK7rRGp2+HNrZZVt2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316C606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E316C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6d00d120b28so861987eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627740; x=1793232540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=reit0VCTG1Vpg4NoFYSmvQilri9kwFU34qIWBGtDhxaDbLaupjp78sIDf4v521V2c/
         dA8K5BiKMLZ7K9OlRoCXWicPEy60LgNasURMqTeLrKqeZz6ZEZG1agJMpVTBxU1LecWo
         tSLxha4OrV/m1JltHLUqvtDlnEx5HGApgiBoHlKBDwnhZybyL298+SL7u+aSod2AkGA6
         nmO6P0jTxxawP8GybM9VR4GIBB33nE051NufgnU118U8sPcqY9Ai9Eia3zzIua28+E5z
         /JHXFVE9lFER/C3LXp8FpXf6BSNs7zjM0B6E2M8IydE2islhD8PFfqtnMIFqvuaSYd7C
         ZE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627740; x=1793232540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=ZeLE3o1JBu9MTDctZSOl+UD/PpbeTjK6VkyNBzT2QLAtlPYA/COFL1NbTzVHf3Ttvf
         dYO2INu3azn9UsONy6tcdWQy2OkDyBHJPWeO6CDz8dqMPbxwQ7MVycP0h2UjJ8qCDl4J
         EFdz2TOTyYP3wxAIhmaIWwlg05OYHuvZCl7cCZ9WhpsS9LDvgLZ7UJjfwyB8d69Ojnwp
         qDI/XxPviA31hZGcLEzHdxhItmfOJiph6jkALUmVadzfd0JcNO3j9a1lKBujViTIOKR/
         xhpPXv7KT7erxepNnuQuDHriz6tzceXoGWfy7tqDAnH1ni+VgZBkQ83mA0gUPkSuNIaJ
         nWaw==
X-Forwarded-Encrypted: i=1; AKwUvBwjQftIUYCi8yEJv+4eFBf0V3tL7dfSGg/QcfpOlXYSk2K4769U1pfrQdymesT3ELlSoyd958X15x6eNps=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAY7sJ7ySjtPzHAez/q3elapBJnvbbKqGOShhtoNoJP8dNyUzU
	8zSerJ8Pp/UJoi9XFWLzpJ4Ic+Lp9/g+ZmwoqsWsd/Pk5g11mR9/noFy
X-Gm-Gg: AYBFou3809Z8ovNBQLpw5LCTThwYU4FpavUC5U9X64SJeRJ88PQGiCaZ9SG3LOtzk+H
	B421oSESrDZgnV052oGTI41OGeRQuj20wtvKDurc5HeslutYxJsvqAEaro1MB1TiSEOJdejQZN9
	qLVr0sOACHNkG3uSHJocgKd7AphecgALwa+6PD7M8OG+fcvsEXqwQoUO0XcLvDApMTMtZgB09y5
	oVFqIqQ79hFb1vn9oZBElbKR51mW5cqwY++0nwDTIGkKFZ9kHjox6WDEbSbqYkUa+0u+3cBoWzL
	WyGbh4lc4UfqepzolUzLcOhcJUcBB/PPmxUWBoSXoTJgG4djNwff6mkndCEf9F5ULBjPGRgYXLX
	10Pwdav9lqx4Hknqu4BMGP1bvnNieq9xBv3C0wiq78XtwBVvr4NXEevmKXBwjvRx7AoGJ8yuo9A
	l80BqqNq+uQpAanshqhgTM8vX6QtDjtGCAYO1mwhG1KLxEep5kL301X/ZsAgHINUOaIT5QbfIoJ
	x4du+1GslwJY4HGyjl0aSULtb63PQVRxlJwj3I+sN+PAFIwzNswzs1eg6c0ZP6GSMMqzQfV6PCo
	PywBWZs4ADi9KDnLApniLsfiE6T3RnNvIl37Hkt3byHUthTF3A00rSGblihrEfHqtQsz/G3B9ah
	RMAhmzJh02gcQkwk2a13SXweQoOwkbpmXRRmSk53nglYeWcDmOvP50Xa79jVzkqvubL1Y2OgJn8
	MP
X-Received: by 2002:a05:6820:1994:b0:702:ebe6:8009 with SMTP id 006d021491bc7-70941a50572mr2245317eaf.89.1792627739394;
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:55 -0600
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

UARTs use APB2 as their baud clock. Expose its existing clock ID so device
trees can describe it separately from the per-port bus gate. Keep the
existing clock numbering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6889405f9fec..e3318772c92d 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -11,6 +11,7 @@
 #define CLK_CPUX		21
 
 #define CLK_APB1		26
+#define CLK_APB2		27
 
 #define CLK_DE			29
 #define CLK_BUS_DE		30

-- 
2.53.0

