Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340131;
	b=fv+R6o/nPQGia5NQxFFOsvhs7gN9MZudIjczRILYUYwgYKi7z85Sn7u/i7MD/Et9WkFQ
	 AuKb8pS4QX69mJTHOz74Bj7TS25vA5G6PLTZSWEHm7bCJzyJU+O5iu5Cxc4/Fi3k7pl49
	 J+1vO71dB76sw9Xn83d24ClXNA4RtEq21v8aDNNQbpXhFMUBJoFEl2YeUyIlI7HKpyTa5
	 1b2M6rCQG/0jRdqG2xNKaUdv4havamstZEQS3l1G5YbshgDzzVzu81w7vq/LSQBXMJgt9
	 oZRqw0mcKpL1us0HEWUwh8tG0zZt/iWLlHX2VVIr1qgiR+Bb/0YELnSzW2ySR8FJQZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=;
	b=SnSDJc9v1a1YLb6IYJ/9jqQKfI1botjUrZd0RTA/DNe0ACaf/gCUcg8eQFaJ05ySrnmT
	 OYYH/QgzoMlJJ1Qjr2uDRKmsKOr1hqrdje52E/iJcny6Db4k3BLvSjlpWUzPGwcQqz6ri
	 adPCG47bm98uNR9bIigGLe+ojnI3YhV4bPGkU/r/zUsEXxcp93cUQlscA+oFU0r+Kabb+
	 Ep/P9UiNZoWdvgA8BHFBCwEG16rCkH4fB51itabyhQ3fY58mjkT2qSLkJpl/8tlop6hfi
	 ErtwygswaMzs0AmLWTNb8icDUGJNBq/SZ8hSL/xFRhxuRXYYBTmTIQK2Qs8w6aPuBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="B/ndMjUk";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A5606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B/ndMjUk
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1140791a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794340129; x=1794944929; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=;
        b=B/ndMjUkDcWvqgfXf/+6/0AGo1TpdEndEdCmBQ8h1vAuWWvvCMRma5AyfOceO1F01v
         SzxOYObtpP5oDROrkYzfV31IBR0ADwxP8XnnFfsDAXtNgNZGQUf3YtkjnHbaF9htkxmO
         +3WVSmPyi5iuXYjJa7jVHF8SI+Dc0P4PfmVcZLkNmXtMU6Wdw6Rmm5sX1LtopkncN6AB
         MSD6Ps371FgU0uojCT59IBgVsMdpn3dHOGOnnv0Uhc+UgXLlFuU8ByTIVeD+cG2x+FMa
         9BRDmV3EGwfRDPDDWVEkEScrkMod3M+q5T9KICPXs0XhWnJYuLWw/UNSc4FbENLKjJcx
         dcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340129; x=1794944929;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZwsc4vEEFoPSZcA9FrAm9Zjfu5lDJ7Cw08Uku6ESbo=;
        b=mmX0Hx4wMsHqfcgtsLRrzATGSfkMxjMbi1bH6r1jnspqfHkHWGIQhTQK6KwTLR8bJU
         WSC3WoxRL5Z77NlWdNm46GPP9rZMuPME4woYL3wxrk0OI9AJsQ5LcvPGvVcjeuVWHsux
         qM2X+zOcx9s8K851fD3XVAyCh7qXicMOjP8wQIfyeAiobowTGq1vXOAQLmWbV71432A/
         wv4zEoH6FqMJWMlteavpWuT7ZwVXE6GbP1w8qcm2QiTpBj6YWjhyys8LOGSmXuMdC9mN
         N9C+1VTetBbixDm0TCBV7XgmuKtVZaXVocAfE2yDuZqhZZS7fVwQZ1KqMXpGQGWgpDmJ
         9OYg==
X-Forwarded-Encrypted: i=1; AL+hErHI736+SqcaSb7xdBfgr0K3F0Oxp526/JAe1bkqI3y8w633OwIptVBjSp4py7VZ4hqUPFEDc99cDb9yGYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JIYDM9+bkY5DGDFx8r+nwDhGzY3UaD2jxiy5/r7bpsynnTTKf
	01JP7LG3hA13KYY+H3Hu65O/2TQ71eNg8AFaU3IllrWwqnAX+pXtrLb9Qp12fkAzFfw=
X-Gm-Gg: AYBFou3er+tvrb6gKaqPch6eCeoBQUNGPlRuKq8OUAaEK5LnGRjLAawpTezrxD7NvJo
	3uysqHLmUHfoGWPTOsMnUnyttF/POFEBV32p/O8Rx+hdLvly40yp0A6FCISywTZy/gw+Y1NTg+R
	Soi9D5L9IyWro+vluxMBtq8dM2ECaiIXC+++Gx2zFaOsbc3Dlrgt/PkmRzdrDrTQUNRI9rrbNtP
	hZiysw74NNW6zb2OQccLrJQhbj20FpkuJdHf3oa1esuwXUD6P8U9XMAZH+hyE2fku3TpnpCRKZ/
	L1HI2pcW5jtoaJ3fhmlVnpPgOTJsy7dTCSp8y7fruZ7+uTpyitp4QWIXY7s///KldD4furr/2/9
	lSXEPgzO8REJlj3O5p3OqT0wOhJbSIQF7E9ejkE2nU3n2BkNTgiKee0CU8MH0NchOZfCsU0We2R
	Qxd/GNC+cUN17ocLtR6oUYFyp0LlHIRtLDFNbfx2jkM99d/YGzRv8yjhS1E6Cn3vpwbJJWtXXMh
	wR2E1P9UTORa1s+LTdfBuwlwxEZRfD3Vq45D4TMpBrVb+gveCtxZ8XoqJTzAEge98SISWJHkKUX
	e04mrjBz+g==
X-Received: by 2002:a17:90b:33c6:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b182ee21e0mr8597a91.35.1794340129433;
        Tue, 10 Nov 2026 11:48:49 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b17dfb9827sm995022a91.1.2026.11.10.11.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:48:48 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, absicsz@gmail.com
Subject: Re: [PATCH 1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
In-Reply-To: <20261028212302.75ec622e@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
 <20261028-susp2-v1-1-174b52857d89@kemnade.info>
 <20261028212302.75ec622e@kemnade.info>
Date: Tue, 10 Nov 2026 11:48:47 -0800
Message-ID: <7ha4ngv55s.fsf@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> On Wed, 28 Oct 2026 20:15:11 +0100
> Andreas Kemnade <andreas@kemnade.info> wrote:
>
>> These calls are usually done in a balanced way, so allow notifiers to
>> assume that these calls are balanced under all circumstances.
>> Seen some spurios vfp issues probably connected to this.
>> 
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>
> Looked again at some discussions with Sicelo testing such things:
> He had observed a NEON off count 1 but MPU 0 in /sys/kernel/debug/pm_debug/count.
> Probably more involved, but lets not freak out things here.
> So that is definitively a real problem fixed by this. vfp_pm_resume()
> would not be called to restore the state without a patch like this.
>
> So this is
>
> Fixes: 1cd96478cf150 ("ARM: OMAP3xxx: CPUIdle: optimize __omap3_enter_idle()")

Even with this fix, I found on OMAP3 (beagle and beagle-xm) that there
are still intermittent failures, and the NEON vs. MPU count mismatch was
a good indicator to dig a little deeper.

I think the fix here is to add the neon_clkdm -> mpu_clkdm wakeup
dependency before the clockdomains are allowed to idle.  Otherwise NEON
could idle immediately.

With the patch below, I don't see any intermittent VFP crashes anymore
with early testing.

I'm still doing a few more tests, but will sent a proper patch with
changelog after some more testing.

Kevin


diff --git a/arch/arm/mach-omap2/pm34xx.c b/arch/arm/mach-omap2/pm34xx.c
index 9992549c7336..d11967c2f4bf 100644
--- a/arch/arm/mach-omap2/pm34xx.c
+++ b/arch/arm/mach-omap2/pm34xx.c
@@ -510,6 +510,20 @@ int __init omap3_pm_init(void)
 		goto err3;
 	}
 
+	neon_clkdm = clkdm_lookup("neon_clkdm");
+	mpu_clkdm = clkdm_lookup("mpu_clkdm");
+	per_clkdm = clkdm_lookup("per_clkdm");
+	wkup_clkdm = clkdm_lookup("wkup_clkdm");
+
+	/*
+	 * Add the NEON wakeup dependency on the MPU before the clockdomains
+	 * are allowed to idle: once pwrdms_setup() has programmed NEON's next
+	 * state to OFF/RET, an idle NEON clockdomain otherwise lets NEON power
+	 * down while the MPU keeps running, and VFP instructions then trap as
+	 * undefined until NEON is woken.
+	 */
+	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
+
 	(void) clkdm_for_each(omap_pm_clkdms_setup, NULL);
 
 	mpu_pwrdm = pwrdm_lookup("mpu_pwrdm");
@@ -523,11 +537,6 @@ int __init omap3_pm_init(void)
 	per_pwrdm = pwrdm_lookup("per_pwrdm");
 	core_pwrdm = pwrdm_lookup("core_pwrdm");
 
-	neon_clkdm = clkdm_lookup("neon_clkdm");
-	mpu_clkdm = clkdm_lookup("mpu_clkdm");
-	per_clkdm = clkdm_lookup("per_clkdm");
-	wkup_clkdm = clkdm_lookup("wkup_clkdm");
-
 	omap_common_suspend_init(omap3_pm_suspend);
 
 	arm_pm_idle = omap3_pm_idle;
@@ -562,7 +571,6 @@ int __init omap3_pm_init(void)
 	if (IS_PM34XX_ERRATUM(PM_PER_MEMORIES_ERRATUM_i582))
 		clkdm_add_wkdep(per_clkdm, wkup_clkdm);
 
-	clkdm_add_wkdep(neon_clkdm, mpu_clkdm);
 	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
 		omap3_secure_ram_storage =
 			kmalloc(OMAP3_SAVE_SECURE_RAM_SZ, GFP_KERNEL);


