Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A04EFFA8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891200; cv=none; b=OE9EfZ89+Pv1o4NvkDWk5ljnl7pQ6vqYpvRTEN54va9zHMRncwpRd/UfeadE9fjRkOV8PnE3WIex98A6FzW+HqzZXE7G5Qrs2XxF3QE6gujz+cMWgwrEGI5WSOjC2fa3mNlRJV2+jyNDVsHXB35mpqqr4aUphz8fQCxBwDCMHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891200; c=relaxed/simple;
	bh=SeTmFJlc7xESDzB6Iw10CIl8mg+WowrPSAr6+Ksx4bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4I51dFJ88FdRE6QZLRV9dpTvbVOkltveYE42cu3jEZ38q2D82KDgUtA08Yds2KNzWNl8eafR0U0D+/Qr1+H0jchjOW49VyNqk+IohCCSVJEJbOgLymzBEfIEiyCwdJ8bn0qMgdAcalpc6DFvHTTcCAAjjWrI7LOy9F5b7f8jxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZxvGm/hX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZxvGm/hX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2649073f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791891196; x=1792495996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anitmvt5QBwY9lobKzDJl69qsHc8ScLJ3DQrPkwQ6aE=;
        b=ZxvGm/hXP4jtx8DwiIzBIY5Luo+1L+9vW9zRjO2ELp767sM29kcUSzy0xvZ+vs3IGU
         VDNlyTh07QSiqD7qhT4YlH3gadGkyufhVJgxzLPJN7YS6JqNioU1djtwWDjO32sVmIsk
         b6PlBO3f9RDEu9axLgVtCBawTGY56bM8UmOMIbNKnF1e3gNZOeXMXUFQKVf/PpYbwTHO
         oGCED6+Sv68ohJ6ZmTrgRrj7LO/Mx3TQR5rAZ/xVIg05bNrVJl3euuTG+l/W5BPP1omg
         Jh5pvCoGob7TXmKXOfUdDai9wDukHMm0yMa1QxGsDaGVRWpp6JOGhlvxvrJA+E1OdcOh
         REqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891196; x=1792495996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anitmvt5QBwY9lobKzDJl69qsHc8ScLJ3DQrPkwQ6aE=;
        b=SFyseuc4kgGR+EF+XdJTViEkzkxrvzTKzIgEelxCe2MGm+PExH0Zr2Rcof+BQ3681g
         fvgDcLjuCC64dIx2+ZFCgn6z6Sz9qJbMeEsI6pChFqOYbrFXpnKn+gr1zoBNHJvLOxQC
         JuOPqqxT4eu4GcrB5uOTEZNnSriqXsSpYV2iI5PrPSI0i6EVGDXFvgA1CiSwQF9+fK2u
         JZWUXEUhF1ZEJR60AldCMtL8+zrlDJepiwcQMFBb6vEATaeRaoEX9Ieh0WvX0pS8Fr+0
         sAxpP/qtUguAgFDHMJ6kFGL2OYPiHugmpSEMCZlVmcl9OijlU0B0b6UzVsNyolY4fMsN
         OqWQ==
X-Forwarded-Encrypted: i=1; AKwUvByKayronplwXNKORmqaQ79EIRk5UCihcoQ4IFwv1ypejfwSDEpSw+oIbeNnI9fxLv2rAAyVupVryZPoNAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpHkaI0PQg+eSiwsbHy0JWgCt+mysKHzyUuz1EpEOnB1kSSKR8
	X+RCAErzCxoebDRrItTYOS44kvFrZ/QBi3XKHDx/oUf4FqFqG0OX12mG6PqkckcX8aI=
X-Gm-Gg: AYBFou2txqloAcxBb+Fe7fKRtNRCCp2Lktz0nfX7hLHah0J528zTogbltnnylMNDcYE
	aRietbFVHNlyTE6577nD5G//POjIhCKkqYt9itMjytwTWi6sZ1NAHQDHhkxX/cNaxU2d20MV+4Z
	1KvX8vlHX0RiuAWHy0zq1pweyuzWeA8DyFZn2PviqSEVOSSU2c6VdSL4qDjDATP8PZChvy4QJjW
	QgFSrlwCDQoqF7DL4qLhxMBhqCDzsNH2oX/lX64QvPqqE3DGX+BrRF+U/vg1tbjgl5HWMd/dsxk
	S2E4wQx19gI0QZFITz5aThy1lJN4e7zmoyScCqPvRL9d6pF26NAiBz0TdrG0lck2FCl1go+ft0x
	wcqnAqnd1iQ0Fono4FZoyfbyoA9YDlbB1z3r6c960l0aLRqk4Khqwlx3D8xl2wDc2tWbHAfwPMM
	xzK4UvYhrnZJHR5VcX11bXg5wnxIXMZ84cjmTzg43w/AERwXOqvKdOBYVYuHe6xKNfXv5Xhxbs
X-Received: by 2002:a05:600c:46c5:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a18e4cd224mr244258165e9.28.1791891193452;
        Tue, 13 Oct 2026 04:33:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm5960955f8f.49.2026.10.13.04.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:33:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:33:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: jim.cromie@gmail.com
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@net.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org,
	Philipp Hahn <phahn-oss@avm.de>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from pr_fmt
Message-ID: <as4W9hToBqAvbzJ-@pathway.suse.cz>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>

On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> From: Philipp Hahn <phahn-oss@avm.de>
> 
> pr_fmt can be used to add a common prefix to any output from a module:
> 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> 
> But adding additional arguments breaks dynamic debug:
> > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, but takes just 3
> > |         pr_debug_ratelimited("%s", "Hello world!");
> > |                                                  ^
> > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > |
> > error: ‘DEFINE_DYNAMIC_DEBUG_METADATA_CLS’ undeclared (first use in this function)
> > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I wonder what this error about undeclared macro means.

> > note: in expansion of macro ‘DEFINE_DYNAMIC_DEBUG_METADATA’
> > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > note: in expansion of macro ‘pr_debug_ratelimited’
> > |         pr_debug_ratelimited("%s", "Hello world!");
> > |         ^~~~~~~~~~~~~~~~~~~~
> 
> Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> any additional argument, which `pr_fmt` might add.
> 
> --- a/include/linux/dynamic_debug.h
> +++ b/include/linux/dynamic_debug.h
> @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
>  		dump_stack();					\
>  }
>  
> -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
>  	static struct _ddebug  __aligned(8)			\
>  	__section("__dyndbg_descs") name = {			\
>  		.modname = KBUILD_MODNAME,			\
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index f594c1266bfd..5d701952e739 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -742,7 +742,7 @@ do {									\
>  	static DEFINE_RATELIMIT_STATE(_rs,				\
>  				      DEFAULT_RATELIMIT_INTERVAL,	\
>  				      DEFAULT_RATELIMIT_BURST);		\
> -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\

IMHO, this changes the existing behavior. The prefix added by
pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
Is this intentional, please?

Anyway, if we do not longer pass pr_fmt(fmt) then we should not
need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().

By other words, we newly pass just the format "fmt" without the parametes.
The 4th parameter was added by pr_fmt().


IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
BEFINE_DYNAMIC_DEBUG_METADATA() and
DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
to accept var args. I would expect something like:

#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
...

#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##__VA_ARGS__)


or maybe, we could "eat" the extra parameters in
DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
DEFINE_DYNAMIC_DEBUG_METADATA(), aka

#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)


Or do I miss something, please?

It is possible that the macros work another way. Or this depends
on another change. I checked only this patch...

Best Regards,
Petr

PS: I was curious what Sashiko says about this change and it seems
    that it does not review this patchset from some reasons.

>  	if (DYNAMIC_DEBUG_BRANCH(descriptor) &&				\
>  	    __ratelimit(&_rs))						\
>  		__dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);	\
