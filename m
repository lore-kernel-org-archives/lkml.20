Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718985;
	b=dmAM2R32VSAxlbwPnxNWRuJ+8syX9SGsAonLoxDfJR8HvExd49jXhOafUKTKJ5VS1pX6
	 b2/QYkA9ppl2CXmoM4MZyUJMi9qMqsxqaGQGZYgPorAcVP+OSKSkrC34zSNs41jwdJ8DJ
	 CS7YPkJISqMH/GmU7l1cxqrxXhTytEvlsmdrzjbCz2/+gPxhMKdcWUqdo44P5EY9v51xV
	 8e4Hk4+21BCtsB+zZLrH4aYPYMHt3sle/nXzS9sAOKjqVG5t1GriZ15Yp9cceSZscWTb+
	 Cgo3FEvsWKJnbbQG3ax/DxWLJIgUo1wmPNSVbn0nMkca5sc8YioaWqzIcOwTiK02Z9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zeBNxshxb6DgEihcaxPe9j1hiaj6vLwi0FqpB5WjRps=;
	b=J/Ji3Jnr5XfpTyAhE4RA7V5Z+8xuFjuZQJfQ64n6f72OurAF5hL9dbvd1t3Oeak1lTJq
	 ajjoWy4sLKu4Rth7K1M5K/asTdLQEuGN16Hcj6JzfhfeX28BXSyjyMmr1DfH1QR8ZDp8Q
	 wWvGYmT/yj8xwdSFDv1T58zmsG9iuhGlHIuAFcGi0hfz0W3/GyuHZkrVFov68a6HFmS+t
	 FIqCPeQl8oPZNV1At64qwZzJjnV8iR1Bw79XiTRB4lb1YaaWWczF3UbtuaI9Jzzyg3n3a
	 FovIhnKFLZxc5MhTfDelVTnGnIglwiyRxqpQxtqhtcNjxquswofDfFpfANR9bKxQ+8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eov04Zjd;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF05606A7BC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF05606A7BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eov04Zjd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso35196505e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793718983; x=1794323783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zeBNxshxb6DgEihcaxPe9j1hiaj6vLwi0FqpB5WjRps=;
        b=eov04Zjd9u+vY95HpNFS8O+ChOhYE8fgu3IAbtZ4R/4MzulsOknb96JJiYZ45rfCaG
         yI7rQNYNY8ZjB02Say37ngzpKWofWzLMQG78xi0eZDmp2BcPvH9HLjrRg4eOelFGeX0d
         AmV64e0h+rIEHi7PRtGbtJqEiiqtfjm4PkF6F1VswAVbKcjOhPnTOdsQiXeIneDpAEMJ
         1ynnDS+ns53UUc8pEcQr/owMRM5qIDqCBYWPJIEyfp2KUQLbp8T1At+IpKcp44Xu/cvf
         GF1T0ZykeXi3ghFXpvcyDDm79waujqF0uCjEhcmLcUjyPs8OGgeoPQ7rCfZzZ91WzJ52
         vdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718983; x=1794323783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zeBNxshxb6DgEihcaxPe9j1hiaj6vLwi0FqpB5WjRps=;
        b=2QgT88Csb9LyEK3uIhT5e71djWxZOQXc3hw0b09OLRPS3ZiFJMcqSHMyDlPuksiH4x
         fYvhX0Ash8/eUlLAAyy03sbMcEp+WkL7Ft45GJozvCThUEEv3BAwjuJBm5tuX52V4/f0
         58j/HwaJJPcjm44dKt1cm5nEVSaCrRBEzdd6+MBBzEIVu5ttYJ4P0hZaj2ZzO086m0a5
         rYirCgpBxOktvMhO3OvpzPtq/wDEKC4PURnLQ8WHRWfOP3zy5vWYY8NS5Mt9JT5R89A3
         yJKC284Kk0iLcCuml0gDP3nFpO2l5T2OUB66pDvPwtqkQIquqB/hYYjUKMF6sJMAz9ie
         fL1w==
X-Forwarded-Encrypted: i=1; AKwUvByvG/gWBfpdH2d46twNr4HZhtN060VjzGCQZ5ihJXCVtPK9NFJl8vDBvBK7bA7ywErwfov3qDoGW06iy8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z83obQxA3nWfxE1gdr6kQr5Fgi/G+y62MT74dZFPHzyR1bYefpm
	8ssxUSoOfIZd1hH5F3hCqki/t/MiqOELubDp+aeiZgUjPdFfhcgy358TCaDrn4dE+qQ=
X-Gm-Gg: AYBFou0u+xDXd0DrP8yShS3oa7WvrgYpZ8LgFb4X4huq4L59apxD3Vr/Dvp3FeeiqTe
	t3DOSMMCwXX+R702A4Nk0bbP4xa8t9tdLMGxUkQXKLFy5B1JSvZasfe+5ihiIuct+867xopMyDw
	Juu6/LwMRz9rkCUcYAhrsNeSz0RwGIHJcTCjoyS9W3y4ZguF8u/ITCcIk256Fk1+EDbq4ZdhC2V
	ckug+dHwVJ6o7KLN72Ruoty59gnttIHbafxheIQMTtlrU9eePIJwMnTRwwAW5HPU3hcx3DaCAam
	viFidzKHYsrSsxKLpdfVkRP96McmXdK39jsKTLh3LcRRW3A1y/OgOSMjKvtg4VreNCUpmw2YzR+
	eE05b0sF78IIORL4s+0SWZodBYrtjLn+V7jFQDSp0ldcDS/onuRgrOFUaeTlTfZAJu4d4cq/9aO
	TPPqur//PJRbZ0J1qcv3m1/jQdnVhDe7R40flWAYanw19dKBHl9rNUgOJdgQNoFVKdqJeS2JpfU
	SySfyFXCS2z6uD4HQfT8k8yC6ODwR1WGUn2c65F44aBZNW/p6jrYFnVY1B7pWbfkuVHJmlkYwOn
	5md0lM3+vqv2ESHCVdcE9x87LpADCw==
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr127311205e9.20.1793718983430;
        Tue, 03 Nov 2026 07:16:23 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm96533835e9.2.2026.11.03.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:16:22 -0800 (PST)
Date: Tue, 3 Nov 2026 16:16:19 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/16] printk: Rename struct console_cmdline to
 preferred_console
Message-ID: <aun6w-F0Upzkz2hd@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-2-pmladek@suse.com>
 <auLvy8826MGpqeMI@chrisdown.name>
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
In-Reply-To: <auLvy8826MGpqeMI@chrisdown.name>

On Thu 2026-10-29 15:03:39, Chris Down wrote:
> Petr Mladek writes:
> >The structure 'console_cmdline' was originally intended to store details
> >about consoles defined on the kernel command line. However, its usage
> >has since expanded; it now stores information for consoles preferred
> >via SPCR, device tree, or by particular platforms, e.g. XEN.
> 
> >@@ -362,9 +362,9 @@ static int console_locked;
> >  *	Array of consoles built from command line options (console=)
> 
> This comment still says "Array of consoles built from command line options 
> (console=)", which is exactly what the rename is meant to stop implying (as in, 
> the array also holds SPCR, DT, etc). Could be updated in this patch if you 
> respin.

Great catch! I am going to do the following change in v6:

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -359,11 +359,10 @@ static void __up_console_sem(unsigned long ip)
 static int console_locked;
 
 /*
- *	Array of consoles built from command line options (console=)
+ * Array of consoles preferred via the command line, or by
+ * some platform-specific code, e.g. SPCR, or DT.
  */
-
 #define MAX_PREFERRED_CONSOLES 8
-
 static struct preferred_console preferred_consoles[MAX_PREFERRED_CONSOLES];
 
 static int preferred_console = -1;

Best Regards,
Petr
