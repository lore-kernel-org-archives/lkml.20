Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285816;
	b=W6Bo6snCe2gtM77DOw2RPZ5iGE0ps4jy5q+rU5+ma0sIOEUqYXCBmsVAX4KsiB0pUj0l
	 4rsOqx6ltuqDrO6aQzV9JHQHYarOt2Tk0tMQ0NYQdFoJEBkn99yT8ac45A4/ezBtnn2Nb
	 c4RBqgxzJ8psPlveqnDYo9XD05d5nB3s4Q8UfTu2otAl6Mrw5JUcx/1VBbB5xOoaF8FTw
	 CBe/IrI2zKmfCPMglJDkKQeqL8nrjpiTBR1K/yZe5CXH2gTpJmbrok5bdnSkskp9kUgG0
	 miTL01TK1+rR/h2omfoWIeoSSU9+2yk171KEKGB9EPWkvQx2A14H0YTyW/Df0n157+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
	b=BZlrnu0j6VW/g+sBMNmXVcbtftcMyiabR2BpX0hS2tH2Na++F7+sZj5G2mHKdzikLU6Z
	 ZGA8mIkien+DTmx1LettLoAMm7jFcpLBjfX89gkHNpqHr+AziP1f59sz3+7zqViEJpnHr
	 TElL1mFF/7KvggkSJSl2gwCZw1ISpgZXLtotzmi1kaIIuP07NoMR+S/UsdiGKJ/DHtCHS
	 ts6cdSkggwxAwMdZGSBadBasg2WXmp8OJHMqSHVNwU90jfsnvvSLtaHSquhSYZxq8vm+Q
	 xZ67QqyJyz0y+rFHqjt77+6izOFwr0kESsdEzxtfJqf0bpztiIK0dizQrF4EgUTVdQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VBBtzV54;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CBE606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CBE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VBBtzV54
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so1727569f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793285814; x=1793890614; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
        b=VBBtzV543IUjp3L3nroXQrlC/QE6S+8gXo6jr4I0eHzp4Q3/fgQ96if7xtxcQ+VqLz
         s19qARniM3o+7h8g7xtxQPTJw/6p358LWMNXRgqkJIbnJXHxlMrWB7nJPDaF+NKET7mJ
         0JgVER0btUhOoW8vZ34IN5qvDsQpFvfF6CMOLDdw4Cr5yB+LzHLeARk1o3ukGjmCmDUt
         kXFNpVftEBMuvndsJvgf76u6usMMe1SZa9+N1Z3DTuOK6veiNZBgg/utXmh9//asLtiU
         DoqQFHQyI8iPg6OBshBXAjQR+NUPAsqfXG2eCbmRTIiNmqjpPisFlRbuRJxjKj3j8X9p
         322Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793285814; x=1793890614;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PiLUJIzj7M85elEEaNM0ojSu5Qbzbb6E3aVU0YwZNoU=;
        b=t5CFBbQVtu+JJ57lJXWSniZdJ6QcZdASmte7ybDLBk3qLe03uz8OqAs7wRjd0oVjJv
         aUs6HxZ6zBzxUTSyENthksPNNhPsvN8KoE8dbpTIkPMrLnL/cocAIOjtp3OyO3aK1oh/
         sW0/PezOv8KBlkJ+Vm7BrH2tzZT0WS8NWvHYEko4P7iZJ39l5xEOccqSzoE+4zpwWy5A
         OEuzNeWfZVrW0I4kKpWeqcC+KPl0zdbFQGYjRbLiqGCZow+o9aP5hKc9/y5gP4uZH5zm
         GL7CDBVNFQhZ2tSNebbgPS0EBrQKe7JJRODMdRdKt/MIpoD7tsEkQ5iLlKJJ9XGKj4K/
         Cv5w==
X-Forwarded-Encrypted: i=1; AKwUvBwD5bag3fGhM80pHyE2yfxcd7daelLMgoaTMs49VUEADwAvZExNPtdlqumHVEVX3NA+xW+Cpdgxrhalg/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbTXpAtNR7qSSUlk4HouoD63EgusVu5uhXyUCIcEoqcWMvJphK
	lzSxY1rn3uLQ5sf6TGvIlbfs+1UrOsu322f71D4cpic45PmgiNyYPk3btSl8z1O+iCk=
X-Gm-Gg: AYBFou1u9jA8sTZR7LVEyZy0OWgPRDRKK67JFHut3XV9BNJr4ImzpVNsiJTTQ2wjoSp
	J9RMoNpS+sUs3S7DatrMikfm733Y13XTU5zT9QOL4Eo3YbivMTRhG/DiyzyAvEBfDRrgXcPM5Sp
	gpl9Ii6FbpBDPR5LPvdmWlTAhXg+Iw1aCgrnAcwDS25ZJmjdBzwbvwJhrd6kLUGMvqEllvRHrzZ
	z54LRklHhhdki7S+yR5oUxW8fioVg0rVgI5AUT1r0wcJEHodDeqWR/3fMFNn2c3v/fIRm9tU0jR
	6i/zihSw8fT+ETs/sM3bDAEFMnlxTLOL+xuhfNxkdrtDYlDzIf2XuW8e1YP3Fi7guxzkG9VxyeJ
	lVYGo8zrq+bA4ios56ByepUYbUuoSbk0WmmqTEXFps2pWfTMdygxiIRnrHbn93iro3xPift28WL
	HWBqZLmeHRYn9gjck2LfZG3JYavCecEwixWK8CM3p5xCpLWT4h24VGuTtiWqCSaNRLw7LxqQSZI
	PQczOmQWiAkCeen7njPE+uqj1jrjtgvlqxQ/yh8bs3lKdcByXZ7+nUIYTxLMUpCjA5AaKD93uQM
	kcsfBqo8u/IfIdVAB85ySKXkJooWAGdpYCk=
X-Received: by 2002:a05:6000:290d:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-48e6a234a62mr3002384f8f.54.1793285814407;
        Thu, 29 Oct 2026 07:56:54 -0700 (PDT)
Received: from pathway (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm35816798f8f.10.2026.10.29.07.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:56:53 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:56:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: jim.cromie@gmail.com, Jason Baron <jbaron@akamai.com>,
	Shuah Khan <shuah@kernel.org>,
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
Message-ID: <auNes2b11NqUey3C@pathway>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
 <as4W9hToBqAvbzJ-@pathway.suse.cz>
 <20261027132253.5f3a461d@pumpkin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027132253.5f3a461d@pumpkin>

On Tue 2026-10-27 13:22:53, David Laight wrote:
> On Tue, 13 Oct 2026 13:33:10 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > > From: Philipp Hahn <phahn-oss@avm.de>
> > > 
> > > pr_fmt can be used to add a common prefix to any output from a module:
> > > 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> > > 
> > > But adding additional arguments breaks dynamic debug:  
> > > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments, but takes just 3
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |                                                  ^
> > > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > > |
> > > > error: ‘DEFINE_DYNAMIC_DEBUG_METADATA_CLS’ undeclared (first use in this function)
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
> > 
> > I wonder what this error about undeclared macro means.
> > 
> > > > note: in expansion of macro ‘DEFINE_DYNAMIC_DEBUG_METADATA’
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > note: in expansion of macro ‘pr_debug_ratelimited’
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |         ^~~~~~~~~~~~~~~~~~~~  
> > > 
> > > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slurp
> > > any additional argument, which `pr_fmt` might add.
> > > 
> > > --- a/include/linux/dynamic_debug.h
> > > +++ b/include/linux/dynamic_debug.h
> > > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
> > >  		dump_stack();					\
> > >  }
> > >  
> > > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> > > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > >  	static struct _ddebug  __aligned(8)			\
> > >  	__section("__dyndbg_descs") name = {			\
> > >  		.modname = KBUILD_MODNAME,			\
> > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > index f594c1266bfd..5d701952e739 100644
> > > --- a/include/linux/printk.h
> > > +++ b/include/linux/printk.h
> > > @@ -742,7 +742,7 @@ do {									\
> > >  	static DEFINE_RATELIMIT_STATE(_rs,				\
> > >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> > >  				      DEFAULT_RATELIMIT_BURST);		\
> > > -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> > > +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\  
> > 
> > IMHO, this changes the existing behavior. The prefix added by
> > pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> > Is this intentional, please?
> > 
> > Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> > need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
> > 
> > By other words, we newly pass just the format "fmt" without the parametes.
> > The 4th parameter was added by pr_fmt().
> > 
> > 
> > IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> > BEFINE_DYNAMIC_DEBUG_METADATA() and
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> > to accept var args. I would expect something like:
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > ...
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##__VA_ARGS__)
> > 
> > 
> > or maybe, we could "eat" the extra parameters in
> > DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> > DEFINE_DYNAMIC_DEBUG_METADATA(), aka
> > 
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > 
> > 
> > Or do I miss something, please?
> 
> Don't think that will work.
> Won't you end up with ".%s" fmt as the string without the extra argument.
> So you need to keep the expansion of pr_fmt() together until is is finally
> substituted into a printf-like call.
> It is possible to enclose it in () so it is passed as one parameter and
> remove them on the final expansion.

My understanding was that the format is stored in the metadata as is.
I mean that the string is not formatted in this code path. So that
the parameter values are or can be ignored. We just need to make
the compiler happy.

But I might miss something.

Best Regards,
Petr
