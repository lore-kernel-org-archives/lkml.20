Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5935036E48C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484536; cv=none; b=iigVGrTd6TRp5omTlij/RVpItMP1yFe2ayaHCJqEcRsVlj6qulQqCV+TfHnNWF4wGGmWHIdROZlzJGR1AvI5bfVLvq/phYhEL6y/jpam81VBXFg3e9U1pZPr4N0EGxyL2i1JMvokpGQlAjcRJ4MH/vKxVfXk4rnyozMH4NMt/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484536; c=relaxed/simple;
	bh=LeoEc8cQOT4OjFAy291yKLk8XTBON/pEKdo3QZDiZLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayRBoVzDrQsFNjx6wVhSjWZSQtmhuOsXJNZjEeAdVglsCFvr21mgctjdgpmiiYZZ6lx4njPpQtWrK/vTY1ZZoBads4B1ats0KYcMDKp7bzW3ZXpi9e+D0evrDgYYtTQfh1MNJcdCXbWEAb4q5hZhLW6aaGyghTELvzW1Yh9D948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=AZiudAtv; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="AZiudAtv"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ab3aaf416dso34080387b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791484533; x=1792089333; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0T97z3jJR8wExZaSoTXfgxsp5uU387qTrmZ967ydos=;
        b=AZiudAtvhA56byDkpD0Zg64xxaAcJW5diIcNM1G4Tlx0YDwjbYiWkAcPqcfjEadlOS
         Gqx2Q6qXsh2jdP5LHwNOc6ueJUXQU0BNKJThx2Iyi5ktf366oVvPnBtkMYTgejlZjjju
         0YLh7QndgEOytoC948nmTqW724hPUNS5Bix/jtaFoeRG+c5Uvc5PESjhmL07rJJUqVrA
         lkr2FRFFWhr+cFxTx8G6k2hY+rMfq0N5g+PFlmNtenw+HcE11YHC3Ud8ryTdmMolo/uK
         pTiCIFux1JmcSWcYtM5t7NMcO1xBQN8duprVHTg6X3cgP0CpVLwicfjpowan5K8oYu5B
         Wqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484533; x=1792089333;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0T97z3jJR8wExZaSoTXfgxsp5uU387qTrmZ967ydos=;
        b=h54HFiPvcdrzvjbvDUkP+v8uRqfBTz3qpNR1vwXhAkDMzlSlOu3gnIo6FGwNIC6UaF
         sQvz7J8CmhCh54sFfXd0wOUVdNBrRBUGQO+fAbtzRH7getnFewae1YhLX1QDxPPbteeF
         njYjATbVnXhL406P9186EPkWr1x1mIgWsHecUIYr2f4Xi9ck4DZsrrnytvjn4On7ogk6
         UvyvtApas0zX/JrZK6ZExFNReNblcP2bykT6HivzcdlzZYBw7pQmv2c1KVQ7MJ98MD7y
         NbmvtNggsCul2btKjVMom7wlbR87ikLo6+T5mc1FScWIwO/Atw+ygNAUza/5LzkZy0Xl
         a6OA==
X-Forwarded-Encrypted: i=1; AKwUvBzQQivo5p+tdw1BbJwrVExAKT5QC9UeN3ndp98ThuQioUCg4DojfBdnI7LGuhAv/OubA4S8xuTyeS1yHdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhpXbiOEK9o27oy+1QFqD68pu/fiQYtjcUmbBbYRtAQsBnxD3s
	pQPdk3oSNjDcPb48pbT3xDExnJ4jBiWwSMB/SR+DWeSNUKxqLVEoOyQyUnrUhI0tHl4=
X-Gm-Gg: AYBFou3KjoLwIgRjd6oOv6d6q8cTr8kApmwN3NwR2MU6kd+I2KydV+Swt7yXWHdayhj
	tDjFjN50oPxG1UMBBVKaHPPI1DdTRle5jZ+eOUQYtp8Jan5NixDF3OabFVEAru/AWUWxZKKJz9f
	fyZcrnItnp7jWYmSjN5nUVGCKYpZ5aVd5d9MfzgbFbA83+ikyDNAJdoCuRTAL8smPBZ95Tt42VD
	UEr3rGedEKgxZ6G7SMBwbtmy99l3Re+PN1Bm9ae/98jdmfTmetILfkJhANFbjG5ORciyPiNMY9P
	R9C+ta5JznskUMl9flZ8Ux+MK3wAVpkgtjoowQUsnAGcP92dYSYmnt4bdyhWuU5K+IXLs0Lv6Dg
	efUUCFdq32J5MspNk3h/K2RKOP5Hux8kZEGiY9dWuoI+fjjENycBPODimXcmlbVwdzKmF1lOwzl
	22Pvr6Q72zH3sWRHkFv+BvvwCAFa9YGeSi5zCTGesphfvTqPYIkPZHnexx1stA2hcwdSm36NfTu
	WpzO2MTbFcVMqJRJq0S1a0YtDRa5jKDBuB2iw==
X-Received: by 2002:a05:690c:f14:b0:8a4:aeb2:acfa with SMTP id 00721157ae682-8b05afc3ad7mr41482347b3.54.1791484533157;
        Thu, 08 Oct 2026 11:35:33 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07d1af1b1sm261407b3.0.2026.10.08.11.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:35:32 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:35:07 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atishp@rivosinc.com>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, David Laight <david.laight.linux@gmail.com>, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <cqdum6vuev3c3vrhsa4uaxfbjy3jutdbdhz4g3tl7pgjalttkt@xax6i7oaaimw>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
 <20250619190315.2603194-3-rkrcmar@ventanamicro.com>
 <650d23e8-b51b-85da-f9f3-52a06fed81e5@kernel.org>
 <DLYI0I8PT4LZ.ZSXV160QVO0H@qti.qualcomm.com>
 <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d94ecb9c-def7-a9cb-456b-60b18489d0f3@kernel.org>

On Wed, Oct 07, 2026 at 08:46:57PM -0600, Paul Walmsley wrote:
> On Wed, 7 Oct 2026, Radim Krcmar wrote:
> 
> > 2026-10-06T03:55:12-06:00, Paul Walmsley <pjw@kernel.org>:
> > > On Thu, 19 Jun 2025, Radim Krčmář wrote:
> > >
> > >> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> > >> pass the actual numbers of arguments for each SBI function.
> > >> 
> > >> The remaining trailing 0 are intentional as they represent an argument.
> > >> 
> > >> SBI 0.1 shouldn't be using the sbi_ecall, because it's only for 0.2+,
> > >> but allow it by passing 0 is the reserved register.
> > >> 
> > >> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> > >
> > > Thanks, queued for v7.4.  
> > >
> > > For everyone, not just Radim - probably it's worth looking through the 
> > > codebase to convert any SBI ecalls that were added over the past year that 
> > > weren't covered by this patch (e.g., the MPXY drivers) and to doublecheck 
> > > the overall argument counts.
> > 
> > I started working on a followup and noticed a bug.
> > 
> > Please squash the following change or just drop the second patch, since
> > we may be touching the same lines again soon, sorry about that.
> 
> Thanks, squashed in.

Thanks Paul. FYI this bug is causing earlycon console output to break
on blackhole because it uses the SBI HVC console for output. Radim's fix
should hopefully solve this.

> 
> 
> - Paul

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

