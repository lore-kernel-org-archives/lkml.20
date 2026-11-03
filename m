Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725727;
	b=P+b4BuUkFVtuYrhRcTj/gRsb8fxPxyHyOe5qFy539c/4b8WHUJdu/53Imlbr2TrUV7vZ
	 9RVnQ8X2v9A4DekfXkvZug8mAZ3TDcKlpNqQ7EZebRSSBrlbxi6Viy2LU4NmEJG+X2ocQ
	 r0k1ptmeM/VVy5VdgNGpA+Ce1CFPT+Rf6EuoNnuEnGoy/NkvcTPYkyTxzLfwMaWXKs0If
	 46TufSyWl/iNsMDg2P5j0c+NcB/U3udunZgeKTpMEYGg6crKBEIS54WRRoP7SHKbu9g+Y
	 kkFVCsmtsE9/7iRq1jpDpjci7B30olJA8NrYvrU1uThmw/iTOKtgW8Rbm15Z/T8qWxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FOzj02RcmS10D2EMFy9jEKs9fR1lBWoARctvxvCGdzc=;
	b=DaL4uZBhmIrSxNILdpU2q9IUCsZx+4Kggz5M9cpB/YEPeXl2HoCtGWJVo4RuAdGy0zju
	 dKNCvpyyNdEFX1f31AzwGINdvnKtpdqprIF0ELwTANWwq9WVfe9R4r5SESXEC9Yz4q68d
	 O+jspilSylfykwOxl14PYCghSWIPI++lbKzJ9dzi+gXf6QKIilFTYNbo7MhHd00DCn/X1
	 UEVv76BD5bxvB3dYqQWqQ+8KKBwYWWI/tMhrwET8Rq0NoGz0CE2EAyaRrIWI8wFMtoV+1
	 dR6DkNQ12EW09NhtC6AnmfjzkZclOvGqBlDklAFgewLZ02rFnkKcrJpAIj63PK7s+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JsmPLYdk;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AAE606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AAE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JsmPLYdk
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b042c0728so1102235f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793725725; x=1794330525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FOzj02RcmS10D2EMFy9jEKs9fR1lBWoARctvxvCGdzc=;
        b=JsmPLYdkzGJMWcnZISAvNy0L9xiXH0yTNvtgCGRq+z4cKs2az0TpVi85WpXYQwaibZ
         txlkbUXVdcdTKdGKBOAA066DXyvfrvEauIb6iwXLmYlPR/eytL/TRjHMnY7KPe5Ponhz
         TqGjEgGZ2smjCnNM5vikAhwVt3xMf1zZcecvXQhL21SBsgnNd3egtaR5OC1x6O+FEWRT
         G9YvRG6+CIzCHOGDrA1QVeDEqzQaZJBsnos2/1BQHwORsXVhf5peEqJKG3YWDkz19spA
         X/BKOvJQ4cPfujh8Iq7b/RK0914C01115yQ95tqRwokD/beLuVUuS6l0FTZIA1hEY/8C
         5IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725725; x=1794330525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOzj02RcmS10D2EMFy9jEKs9fR1lBWoARctvxvCGdzc=;
        b=WffuLZrtL+qQpGrw0zEAE3/LAtWNk2Jv/53W4p3rEuSJrNyb+0p9XewrgHgPawM7uB
         sdhmdJr5jqIbr9GfLNPgxcxyQkXuOsPB0yL1Vg2sjyxJwHufndoBevISON3e/XPe4U9/
         liHCHhhXF252vLxbej5ev5wYYzx5EoXT5RCEHZ/xui3gM9XDlbQyFB8Zsk2BOeyjS1D2
         pk++VbZ0pPSAfWycKB6AsjahU4z6uU/AX2p0D5bj1FBExEQPmeqDKooaFKuOaXqNPZtb
         QT4tJY/gAmPfKXc6s6+HO5NfFUjCsWRpS+k1ql9cbtHsnmC0CzNYYROsdWpm9Pu/5Ikv
         OUrg==
X-Forwarded-Encrypted: i=1; AKwUvBwW/o1rfLwYRKRgXn2N56dDwcOZmFx4zyNYwjRhKUB/i8/xyWtzc1sJGCtSrkLLQeIS4+zBMIM40YFVpwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P4eR17NhmxzFAy4RjU7C3wytYUIjzODEJp+JqoTvZEFKv5/WV
	MypEw61JoqR2lHsti0XSKSGSNrFZwFFC7piqJMiag4YBsSlWqh4nPJ3sGNZKTZiZcog=
X-Gm-Gg: AYBFou2EaE0TOaBvjcakzS4aiDJBdaQfx+JTVgjMCDQzxtxMMBKqjfmhbEtEEoSBatM
	2XXYAXTRbuj3luOIyDGf8YXJxmC7bE0TIZRzrP5ZbZ9wQyx0eDwJlwKrJPqgdmBKXVTjTwQY/Hc
	rZDN4beaa5ybz/YxrSbyYOuzZxY8B1DKB/dTMj635zo/PJZwDZNQTcq8owb7AlSiAj2hBi7U1Uv
	0UNEIzpqAFTlPH/Y/hD/Q9DQGOEtP8e3Lt+55P1/ZNpjfw3VZrU12oXQ8nL2YzhwpxQ9ZXucPZS
	hg25v1qLfCtABxFrLCvmQxHNs5hpvdkgysnmmxmp4Sab5Cx/SJ7BjIh+/codvWbY8EVAiczlTwV
	yHlb+dgAMEDQNH+knygIhJVNdAdklLkl7LgUTDq0l2IO92bMOr1OXdUyiGZcLVDQz8AWnN6c9+y
	M35SanyZO1X2YT7bjybj83aM7M+2GleJsyRh2BTpKNfdjBUu+acewlLpUPjLOUtE/bb31dFqZ7z
	KLoBzt7vkoSlw4wjv6fHaBUcsqTmej+unmU2Lt44sg36rL0dLe2BBq0SDKwH6+M7JJX+Nc2XK/S
	y3AtM9nlICAh3UXlbb2OYgnIoORXMA==
X-Received: by 2002:a05:6000:4312:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-48e6e2eb205mr33073518f8f.14.1793725725104;
        Tue, 03 Nov 2026 09:08:45 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm27804793f8f.34.2026.11.03.09.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:08:44 -0800 (PST)
Date: Tue, 3 Nov 2026 18:08:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/16] printk: Ensure consistent name and devname when
 updating preferred console
Message-ID: <auoVG1oK7pNftvws@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-8-pmladek@suse.com>
 <auLxQDWkHLV01D1t@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auLxQDWkHLV01D1t@chrisdown.name>

On Thu 2026-10-29 15:09:52, Chris Down wrote:
> Petr Mladek writes:
> >-		strscpy(pc->name, name);
> >-		pc->index = idx;
> >+		if (!pc->name[0]) {
> >+			is_new_entry = true;
> >+			strscpy(pc->name, name);
> >+			pc->index = idx;
> 
> console_setup() can hand us an empty name or devname:
> 
>     console=,115200   -> name "", idx 0, options "115200"
>     console=,foo:bar  -> devname "", idx -1, options "foo:bar"
> 
> For the devname case, __add_preferred_console() matches the first name-only 
> entry (`strcmp(pc->devname, "") == 0`), e.g. the SPCR "pl011"/0 entry, and this 
> hunk now treats it as new.
> 
> Then index becomes -1 and options become "foo:bar", so the SPCR console never 
> matches again. Before the series that command line only moved 
> preferred_console.
> 
> For the `!pc->name[0]` branch below the slot keeps looking unused, which turns 
> into list corruption with 14/16 (I'll put some details over there instead of 
> duplicating it here).

Great catch! I think that even the original code did not expect that
anyone could pass "" as either @name or @devname.

> Rejecting empty strings up front, after the `WARN_ON(!name && !devname)`, fixes 
> both:
> 
>     	if ((name && !name[0]) || (devname && !devname[0])) {
>     		pr_err("Adding a preferred console with an empty name\n");
>     		return -EINVAL;
>     	}

I like this. I am going to add this as a separate patch.
As mentioned above, I think that it was not handled before...

I have the following as the 5th patch:

From d7990601069c2facc8ca47efe7ed36ac21038be7 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Tue, 3 Nov 2026 18:02:20 +0100
Subject: [PATCH] printk: Do not accept an empty name or devname as a preferred
 console

The current code for storing preferred consoles does not expect
the case when an empty string is passed via @name or @devname.

Empty console driver name does not make any sense. Avoid handling
such entries completely.

Suggested-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index b7543fea865b..6bba67e142e1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2558,7 +2558,9 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
  *
  * The function adds or updates an entry in preferred_consoles[] array. Also
  * it updates some global variables which are used to make the right decisions
- * in register_console().
+ * in register_console(). Finally, it enforces some rules:
+ *
+ *   1. Do not accept empty @name or @devname.
  */
 static int add_or_update_preferred_console(unsigned int i,
 					   const char *name, const short idx,
@@ -2576,6 +2578,11 @@ static int add_or_update_preferred_console(unsigned int i,
 	if (!name && !devname)
 		return -EINVAL;
 
+	if ((name && !name[0]) || (devname && !devname[0])) {
+		pr_err("Adding a preferred console with an empty name\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-- 
2.56.0

Best Regards,
Petr
