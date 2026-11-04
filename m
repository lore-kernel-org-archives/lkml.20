Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802083;
	b=wQrMAJ+CsMnJYbcprbp9/RLGnwfsmQzgIyOJ21Ll3AXLwazlITMXgTZIGLP9LbjmhNzb
	 Y3tP0qv/qd3j7XIc3ika3g7cKd2ot1RqfMmFHcIXGciAr39LFFTe62GddPEOul1iMH+Kx
	 3wAbZjeOg5X466vtUNYTMOVTzxPBN4z1EP3/GDWLURGRnaXNnnwh25Ldffsf+rmsHYxTY
	 SMA9cRQeu/bWvAG4Oft4wOIeuPBDaiA1guB/doP0wYRlHygMUWgKuOBblTUMH7Z6nVrYz
	 82mRAW7pj48RZqGScapvDkk6jdUBf6WtL7TYv0m8Y1+Czb1+fs+ykZivOalIw6jHXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d3+qu57H6hbPzpfqrzDervo4ihTLFL0YK5b5tmW8eY8=;
	b=lmpfoz5tmXapk2IHPPsrhIX27tn5bdX0n1gEIZyYEVqPUx2dJXahsC22olUsJ2RJ0x81
	 gTRLk3iryv71wlBnOqP9iCEnAU7RJjQUg0+VEIa1ECpLjSIWhp1Pdc2+LEU4RSla5SRJh
	 3R99gtFkYBXGd7Z2JGAFECJtIWh6Jjba45cRbeHdgT5G1TTEzDZHjnesyPSWdELAmXdTe
	 Z8h3XL4SukY80Mj/fJ91BtgsaMJO0vd1IZGxqxKq/6Q2cMqjTZ2CVfFHPhSusr2WlkZUJ
	 f7MTju5iTxraCMMQQzq5kScNmj86wR0c42DsnsVIMwsXu1GJfGjDIYRVL0Dtevz4ssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NRUK2O13;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6BE606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6BE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NRUK2O13
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6339885e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793802081; x=1794406881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3+qu57H6hbPzpfqrzDervo4ihTLFL0YK5b5tmW8eY8=;
        b=NRUK2O13KP7Gat2o5FGPwGcMb8OoxTJoPqto3/DrNYgfYmyag0OkJNHv9C+XJAjorI
         5BwkP1AA0d1wWHal91K1CvZnlZlbWOOeSybWlI8HnNM/KXVG+ENJ0dkl7eqzusHxQ0ag
         I4rt4EJeN0OUTd1ED/Eix3F/6Sv5SlRdtwpo2rFGcwL1WH8YzhQSQVa4pAEU19YxAJml
         cw3JqwhjKH2iJXhONJKazNPAIq2iCDJsnqVNBO6Eb+k9M67TOVB7Aj3jA/XtPNdtSCXg
         CKJNMDdwpVhmC1ZCi91P2kJZIlunyHLo9iL8byA3ZPYH6OmCo0Ok9Gye5d2ZmoNI2gic
         hYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802081; x=1794406881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3+qu57H6hbPzpfqrzDervo4ihTLFL0YK5b5tmW8eY8=;
        b=mtwRaO5pEIUf4SiK6J3fYUs3lWca542xw52yQArlfZwX4Q3rSKvpabDsG6gttWPz62
         Hlr35vMGP56iSQ/8FacVX/FKDdV0+Yo8HvzWKT/WNcaJTa6uomRJoxgt0mGcIelmdil0
         A/1erSptDXzbL1/j+bj/prEs5KPSDUn62ZaBwm2k2KcFq95rpa3udAbXMwwmheXPIseD
         0Hv0Im9VrI6Q+JmXY/cuZSQsivDpuSDJPsqIQWXWZN+NRivA6ORYDB0CyWzcmBQRN5g2
         467mXTtFDpsBzH2oXZ7gtai+QQPaADNp28lO1gaDaOEk8ExpDW5Bqyo9ZAcIuRub8wmj
         5CkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg0yiW4LTwmK8CIJ9XtNdyviwJ3MjGacZQAJc7DfbBPjpi0vl5ffwkVcx7YxKOmJvw584aRHhqNL6bELM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Vvn8d3olOhLVvOlmduccUis8rgklOZY2pWy9hj+STdo7yBhtN
	qy1f9In9TKhc+BU034FiwhN+irPs1ZDdMeXNN1XbSoJJYUiSOaMbHIIEkVBLmv3vWgo=
X-Gm-Gg: AYBFou15T8ymzWJcJn5o1SFdq/PDI9KVwiYb0ED3HxBIxP7ise8qA4ke6tSEvkKhsmW
	rNG39UdXHlvYj8dGfwgwdmyID3no3VyzHOpY1ePFLGPtbd4BsY8ERreczRV7uo0Zeq0Lxdt0gP8
	i3pcpwoF1t4iMuPWT/Hk83iY6crPiSKE3lF8AUZXhfqCXEEUYVkTi2zxAzTJhXDVCwi8ae8Q/sf
	TRl6tBDrVi3UR0ut7deN9ePgDd22RwcG8kWt4Kr3GDYgkTjKB+84KAhci3OnHiOTSJ9uVZOF8u3
	qBehKusBt3cXp4Iq5CxixR25bJFDA81EXf1X5GO8uGbHPJ3kJHCNA7CEoC/iOdEtfMw5vL6zA1Q
	LsCRQOt+JWBdGURtSNnm366+lfsg2cDceta0D9RZlxxcPtam1baGCD050lsGNb0UptNYPJq1ZFQ
	lGpyUs1/0YdKh2VEDwlzT2VkfivaJK78XPBm/sZ3xYCoXQETqFVNbRj9k+q+e2vvKH70Lxc4B/P
	y8PGwThPfkIf6TE+VDgQARPOko5wC1XmtG84Yf/oc/O3Slj2M1ivFS7KJvQHcdGSpZesZcKvwlq
	0qpYXYL/IZAr2xfpGMGJoh73m3qhG7xn5imXMREnJ5IY
X-Received: by 2002:a05:600c:4e12:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ac1765cf2cmr385352135e9.19.1793802080851;
        Wed, 04 Nov 2026 06:21:20 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm83584475e9.5.2026.11.04.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:21:20 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 11/16] console/braille: Lock console->setup() call
 during the registration
Message-ID: <aus_XuSPZYByvYmg@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-12-pmladek@suse.com>
 <auLyiUrOsr7W8tuo@chrisdown.name>
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
In-Reply-To: <auLyiUrOsr7W8tuo@chrisdown.name>

On Thu 2026-10-29 15:15:21, Chris Down wrote:
> Petr Mladek writes:
> >In braille_register_console(), the console->setup() callback must be
> >called while holding the console_lock. This prevents a race condition
> >with a possible active boot console that might be using the same hardware
> >registers.
> 
> Acked-by: Chris Down <chris@chrisdown.name>
> 
> >index d780f6de303a..11d6b854ee63 100644
> >--- a/include/linux/console.h
> >+++ b/include/linux/console.h
> >@@ -699,6 +699,7 @@ enum con_flush_mode {
> > };
> > 
> > extern int add_preferred_console(const char *name, const short idx, char *options);
> >+extern int console_call_setup(struct console *newcon, char *options);
> 
> Hmm, now that console_call_setup() is global, a short comment saying it is only 
> meant for the Braille driver might discourage other users if you want. But not 
> a big deal either way.

OK, I am going to do the following change in v6:

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3957,6 +3957,12 @@ static int __init keep_bootcon_setup(char *str)
 
 early_param("keep_bootcon", keep_bootcon_setup);
 
+/*
+ * The function is intended only for the generic console registration code.
+ * It has been made global only for the Braille console driver which
+ * is partly using the generic console registration code but it is
+ * integrated with VT code instead of printk().
+ */
 int console_call_setup(struct console *newcon, char *options)
 {
 	int err;

Best Regards,
Petr

