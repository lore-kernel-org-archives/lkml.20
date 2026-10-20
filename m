Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498235;
	b=E2yYMn8pmqV+TZY0+/HLTsC2/PQjs3X1jlC/me0lQsKVIZE7aOadknasD7xXqmr33hzD
	 mkvkHqKIqqhshL+XVLd7BunLHsjwpaxWssm2PCBHF9/uudnTLQnLSG3N2suTZMbSXlSMo
	 +B3KuFJPQdy+qU/Ucck4qArjEa3px5Vy+ek5F41v0R3Aum9oPrP/qNMLhvdqXDel6Kpqe
	 sJ3la8XgeCvR4QUcA/YTseA5imregHu5+RQHUEap7sjxWZGX98R+yv3RqjZ9qsveQidO/
	 EeL2MJ1nSk8V1hc0d/DfogfQ0UaDBlaacSjBfRWYx7trKyISLZEERmeJ3x53RO5PAkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TP3lHd7ZCrOKSupriqyX6PtdNuECuFfGjiY9AbgLC+E=;
	b=PmE0QQlwDTFr4h0hzDT3nf+7AtNsb6KsAPS/zLKStPYnLwHp80kKT3lLvWMJjJxAHNRt
	 XymTRn66vHT/bI/vriIC1TVLbouerSi9ym5SHkoSCrHwWDnjrUX1ZlVjD4xaMCM0ZXY/6
	 7VeJZGXWmIjV/ZpYAxpdWAkUw/FSuZ8YYm856iEfXqpORF1agUn/UURWhb3BajR051iFt
	 zoOdh7Ox2gk0dnVhuk6Ne1ErLJL3nGQyw360KAzVdfRex61EHsHKAxtl/c7q6CpqN6vvE
	 EGAe+TN5ZkVYcu1eWSQPXxmdOygmqAvL2PO08EgxQ4EJjMcYAuDUUQPvWwLrCMJMg3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RivgTgIb;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C86F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RivgTgIb
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2244798f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792498232; x=1793103032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TP3lHd7ZCrOKSupriqyX6PtdNuECuFfGjiY9AbgLC+E=;
        b=RivgTgIbsmhNiozCHhxpiackjSI89ckS6Y0/0KLOUziRvM4YY48oqYzquDAmwWZxhT
         z+NtSzyVT6wtvVEoOSrlZA4GyMkaaKaTNHRw7RYCq3v2xkcNE6DcBAAVUL7AoGoCXHFV
         FxKoUgufgtJ4/RiMeKLE+/4EI1ck0CJf85jTFjtY7mVnDldDYTmsOJj9HHPz5nYoogJ6
         CEd5O/nTy+QWVcbcVu+oICxT1Enorljx53dq3h9VwPWtVi02Ep9RULu+/vCV0TTM6EVf
         1gFWUmOSxW+9zdkPPE0ep++ZsSK/6JQQtc8m9uc4rSpMRVZb3iuDcDyXWStqMOCppVA2
         UItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498232; x=1793103032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP3lHd7ZCrOKSupriqyX6PtdNuECuFfGjiY9AbgLC+E=;
        b=n4DPzMs/fODP60k90Bp3XPm0trM5b4F9MO/oGdNCPoPgAW+XlQsToZ4wPZ8tlnVUv7
         bpM2Vrhot5uAZyt3daPdjCyjrZXSVzAjTl+E42ibg98TW+6aUF9EUzaViORV7k6iP2gn
         tZEkk9dAlnEB0nq0Vh+cRdt8oQBNAH8vyx9zROOVqFIKQYo/e24BaaMmk44LjSMoAjmE
         G4Vryh5SYZl6FVfuVp94/oEl6GDwqieWYpsWqxytmzvYduJgXypu2YR73j9qtv+XB8+J
         JI9AHJLqNJ7+A5gnVmA6gh1mEbjh5oK4jCY+4XBjHUNMdkOR5w9IzKIaQLfEsIpj9Xza
         0qVg==
X-Forwarded-Encrypted: i=1; AKwUvBwkdsCTmoY2F3PdY5VCOjaIf0C2IYkZUuKRKiJ+MOeklefZMH9cEOYA1U1vtmFuIRBzzbzb72IjU982zxc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa7V5ZD6doYTgf2RhTq+fCrDAir33dhFvll3URtMN7VktgVKeY
	1sys6mYEdV8QrhVGXjccn/B2tczRdF00rmZK3619iSogRinMWMBQcllfLPe/sTVaRrM=
X-Gm-Gg: AYBFou2zeigYoGcy0WNjvpghZSmm/N8TWYTOIsyH/v7KeafmdBQbDy+V/yWDzSZXu3z
	5LUuD32pTo57jrzKMHYnNsQI5E5QXjXDczO1TdlZ8jv3QzFaJRi9rkHSWV9S4e8qvk8abqf85eS
	Wb///8WUm/gdXma3+h98kUQ52VvrE2aR3LQ8VZ6D80dxCGoMcmUQwA8MtDqW6Ei+EkSjtNBm1Lx
	iRsBHn7SNvqKLBCvDaGqAUxT6AG5U3SOtSIVU6OR/1YaaJ+hVRn+BQU9Ov3c90ECoa1eFI7DQqU
	yzzc6XmVzvPdRCQZU7xQt9TD2MOwF9qd5RQRvfFQ6/TvnCnLuVGtJsjGIrp5rIUPokNOm/iXhMQ
	+/ilgZPe4FMomArobiZdO6Gltw3kZVpRjPdazzWHQTrlh1CJaVLGfoX8Fk/Jf+nvcfYvuK8wPUF
	tc5YFEHtBudI6XXOG/U/vT/ucyVp/RuYcW5UD0M3MnMGCsaitJI5MF5Z/sJwgfRRUjgYNJ++6n8
	cln0hqwDsc=
X-Received: by 2002:a5d:5f51:0:b0:48e:412:3813 with SMTP id ffacd0b85a97d-48e07bb2fc7mr21324149f8f.20.1792498232549;
        Tue, 20 Oct 2026 05:10:32 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823cfcsm5747053f8f.39.2026.10.20.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:10:32 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:10:29 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 2/6] crash: Notify pre-kdump callbacks before
 switching kernels
Message-ID: <atdaNQts1frMB8Kq@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <9ef573cdbbf5e659eea16fa23afeaf2488049198.1790014793.git.zack.rusin@broadcom.com>
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
In-Reply-To: <9ef573cdbbf5e659eea16fa23afeaf2488049198.1790014793.git.zack.rusin@broadcom.com>

On Mon 2026-09-28 13:55:36, Zack Rusin wrote:
> Fatal x86 oopses can call crash_kexec() without reaching panic(). Run the
> pre-kdump chain from __crash_kexec() as well, after finding a loaded image
> under the kexec lock and capturing the original registers.
> 
> This covers direct crash entry without moving all panic notifiers ahead
> of kdump. A missing image or failed trylock leaves callbacks uncalled;
> the shared guard skips callbacks already invoked by panic().
> 
> Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
> New in v2: cover direct crash-kexec entry in a separate core patch.
> 
>  kernel/crash_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 2b36aa9fade0..5d9fe9e00f39 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -23,6 +23,7 @@
>  #include <linux/objtool.h>
>  #include <linux/delay.h>
>  #include <linux/panic.h>
> +#include <linux/panic_notifier.h>
>  
>  #include <asm/page.h>
>  #include <asm/sections.h>
> @@ -139,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  			struct pt_regs fixed_regs;
>  
>  			crash_setup_regs(&fixed_regs, regs);
> +			panic_notify_pre_kdump(NULL);

I understand why you did this. But it makes the code really hard to
follow: 

  + This code path will be called also by the 1st __crash_kexec() in
    vpanic() when "_crash_kexec_post_notifiers == false". It is the
    default.

  + The panic_notify_pre_kdump(buf) in vpanic(), added by 1st patch,
    is called when "_crash_kexec_post_notifiers == true" or when
    __crash_kexec() returns from some reason.

None of this is obvious.

I am going to think more about it.

Best Regards,
Petr

>  			crash_save_vmcoreinfo();
>  			machine_crash_shutdown(&fixed_regs);
>  			crash_cma_clear_pending_dma();
