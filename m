Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E03644C4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785210; cv=none; b=BAguU9xeqj3uWBiB74+salo97Wr6j0F+ejClOc+YVyASA9qx5ZvGXhTK4au3ld+rsULAW/19Y1ohg2qmMB0tb4wJt5JYAcnWuLLa/CK5zlseGVktjxsPTZxCVLiXCqemKI+kVUxXgr3qM63SaZpzSkYauayWsF8EQ4GkitGMyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785210; c=relaxed/simple;
	bh=+BEqCnHHclDjuLHOc3NkaW2NSsl8fX3sGxz3SHV4JrY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cm69OxOj58ExafpPEd5A7RUe37iCf7+jspek1E/C6/sqoYPhzdSiNwdn8dwbTHa8HYrYjyFwesr1s7SOeU7zRosPVcodLdBWb+bxMcA6LYofSGVC9ugzD5TCbgk1KWtsw47CLRdyjAxLsGb+vMKImC6scuShHn1DeoOzos+vC7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HP60QPGg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HP60QPGg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dc1508191so171103f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791785207; x=1792390007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7vkTy2G13GGSXxsehf2L4ItoE0bTLRJIAaTzfMdbDvY=;
        b=HP60QPGg5NJfJ31gz6LE6hD4rF2/3/o2ftyY549wyhFVHAmP1ivrU+54HCF+mWjpp9
         s3nbiw/X6xQ7R0r+wkv6TGXCXCfk+Jt/MPG1uOHyHY607zvgq0uBykX+Y6fahDgZDOd+
         yZc8V6QtXTQSp80gLW+6pU18YzlHSkPjs6W3DNzVfs10aIkASKt0tGDZuhS0ojJOABcV
         FVsW5wAg7M1ju1Y/yNZ8U2Hu6Tfey911SgXTuBFCNknYQqIuM23+6o8T9zz3g2xpo/sl
         u3cAPe4vqwQDgG4YLWfOch9dIs8owQ1hBxsXJyCSxnUFs8J4z2L2TntwhT3mOC7mygpy
         cFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785207; x=1792390007;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vkTy2G13GGSXxsehf2L4ItoE0bTLRJIAaTzfMdbDvY=;
        b=ZBfISqtchcdWV3yApv2JrZ5aWx0T7OL0G4tCaT3z06wJw3pYj4Rl4P6K4BJZwL8cNW
         MYUdyjNQ/xKNBqa0uNqCwCsGL8D7/F9BBnj4tYzKwzVufJXd9Nukw8Bs0KXNgj7iCaB4
         XohJMZzA/O8bvGTphrFbI0ohs4Esz7WEGFLpPuxgfvM4y7iGtvYaD2N+U0pWOMkkgMJg
         gFNbAuaZQ1aTKKobtBJ1LWu9wEW6Re3iiiM9pHIY4i57xjmEvWYiAcQAHxIuYZ+k1DRV
         4w+pPA803qxr2f+oc3cKyMzIXXBKp3RqEflKEp33Q4cFP/n0xx15O+/atgkf5ibyRJM8
         9XpA==
X-Forwarded-Encrypted: i=1; AKwUvBwS6G6cOoeA5gqfydu/UFq5t1Gh7K05XCUEQx3Mt3UzQ7NUthCvBaglNMcyKXfquYw4MSJCcpav7KiUnI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkpgcZcT2q3b+Ngwo6VR86CPW3KzXudk3sYEGGQ1BObf/WG8Av
	8uPoKmeZyGU0py5clWlWoHXpu4oXsfZlv9fz4la0F3wUlcNwQ2AfjeSWVI9TC2y+C2U=
X-Gm-Gg: AYBFou3Qs+K9TxZnyy+JdC04/lPn4pqakuZNngbgjf17qrxartQ/mADlk+qe/RCfHFa
	vNt5N3NOZGv5X7GlJnxw1uC3zBI17BRd1lxFPqskZvcTvf/ZIjl7R9UBr2USYOhWBQbajtgwDbh
	09XO7nrVzL2lnjVgQ5LFB2ccCvAem+fwMQP0yutFU8OyvCVdFxtjCl+p3DUaTvohooutnEe5ZcF
	gcD1Qa//VJvNAtWjy+BCpstyOLMi+M79YFkH9Z3A/MZzDUTaq8eG3tQrV5hHDwp9vFplX66PJRM
	7oZWiE9zkzQ8POK/tQyZcVZ4kW1P94ShalXw2uw/yZfC2gIklbavADTpzlP3Uo/byWdgg8unuK2
	wVhLChoM+CeBi/J2gaTa9oD428LfyEpT8h8KUdTz8R4xJYIWi3VOxxkziySw9ibYVyYOms9mBFg
	ytS85eQLqXbz3DqweUPAhtQDYOORBUr+w9DNm56C9wb52bG7YnHmDg4IA+bVx3yyrwuQ==
X-Received: by 2002:a05:6000:178b:b0:48a:f5c5:d077 with SMTP id ffacd0b85a97d-48dba7a9f96mr15057202f8f.2.1791785206815;
        Sun, 11 Oct 2026 23:06:46 -0700 (PDT)
Received: from mordecai ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e4018sm17892670f8f.11.2026.10.11.23.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:06:46 -0700 (PDT)
Date: Mon, 12 Oct 2026 08:06:43 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Hans Peter Anvin <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Subject: Re: [PATCH 2/3] x86/tsc: Define and use HZ_PER_KHZ and KHZ_PER_MHZ
Message-ID: <20261012080643.19d39c70@mordecai>
In-Reply-To: <asjvQ-3mZzYdtTie@kernel.org>
References: <20261009100436.1133518-1-ptesarik@suse.com>
	<20261009100436.1133518-3-ptesarik@suse.com>
	<asjvQ-3mZzYdtTie@kernel.org>
Organization: SUSE LINUX
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Oct 2026 15:42:27 +0200
Thorsten Blum <blum@kernel.org> wrote:

> On Fri, Oct 09, 2026 at 12:04:35PM +0200, Petr Tesarik wrote:
> > The KHZ macro is ambiguous. Sometimes it is used for conversion between Hz
> > and KHz, and sometimes for conversion between KHz and MHz. Use two
> > different macros to distinguish between them.
> > 
> > Convert plain 1000 constants to one of the two macros where appropriate.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > ---
> >  arch/x86/kernel/tsc.c | 39 ++++++++++++++++++++-------------------
> >  1 file changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> > index bac81d37a90ce..8b905c4dbefe2 100644
> > --- a/arch/x86/kernel/tsc.c
> > +++ b/arch/x86/kernel/tsc.c
> > @@ -41,7 +41,8 @@ EXPORT_SYMBOL(cpu_khz);
> >  unsigned int __read_mostly tsc_khz;
> >  EXPORT_SYMBOL(tsc_khz);
> >  
> > -#define KHZ	1000
> > +#define HZ_PER_KHZ	1000
> > +#define KHZ_PER_MHZ	1000  
> 
> These are already defined in linux/units.h.

Oh, that's cool. I'll use those for v2. 
Thanks for the pointer!

Petr T
