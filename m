Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CAC4D4866
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726015; cv=none; b=D/a1cxpgOZWrxbVnqlrByFX1jRF9zXB0fhCIDOQ2+iptj5BYv32DFUWjZf2d+a6ThpL6oNTe2gWLD8VbgYVtRVwJxjJWTCVn3ALZWpwqnLizlPG2/8fYnETKPAviVscFqAGfL52cPUeMJc/RYgxa0ypqBe0XUapS091XqNgY4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726015; c=relaxed/simple;
	bh=cBNeZA0r7R9zvsiqu8Idtil55GSDTZMVR4PPevLVqOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXR9lpfYeVuqif7zxnPBbV03ZmYd8lTyXLEaD1JuOTrVhNrlpPshMojYwAD364X2OJGVGdO9cpNhm3jQqbbTajo7VFYMSJxNtISHYWzqFPIN8MXb74Tk0xE3ZKmxKHM0RvSTCn718OjGuhEmZnFF5UuyKpptFaZkVdUKCdPHaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAB3eTcaDa1quWsICA--.10974S2;
	Fri, 18 Sep 2026 18:06:18 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: gregkh@linuxfoundation.org
Cc: akpm@linux-foundation.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	petr.pavlu@suse.com,
	samitolvanen@google.com,
	shyamsaini@linux.microsoft.com,
	xujiakai24@mails.ucas.ac.cn
Subject: Re: [PATCH] params: serialize lookup_or_create_module_kobject()
Date: Fri, 18 Sep 2026 10:06:18 +0000
Message-Id: <20260918100618.3123807-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026091832-thesis-implicate-ba51@gregkh>
References: <2026091832-thesis-implicate-ba51@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3eTcaDa1quWsICA--.10974S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW5XF17Jw1fKw1xGr1DAwb_yoW5ZF1kpr
	WfX34ak3yDJrW7Can3ZF1kXr9xG3yvqrsFgF9Iqr1fAF45uwnavF15Kr1Y9F1DCry8Jw4I
	qF1jqrn0kFWUtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUOhL0UUUUU
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

Thanks for your review! I'll send a v2 patch~

> > lookup_or_create_module_kobject() first looks up the module kobject with
> > kset_find_obj() and, if not found, creates a new one with
> > kobject_init_and_add().  The function is called at runtime from
> > module_add_driver() since commit f95bbfe18512 ("drivers: base: handle
> > module_kobject creation"), which means two concurrent driver
> > registrations for the same built-in module name can both miss the
> > lookup and race to create the same kobject.
> > 
> > The loser of the race gets -EEXIST from kobject_init_and_add() and its
> > kobject is removed from module_kset by kobject_add_internal() before
> > the failure is reported.  The error path then calls kobject_put(),
> > which invokes module_kobj_release(), but that only completes
> > ->kobj_completion and never frees the dynamically allocated
> > module_kobject, leaking it (96 bytes) along with the object having been
> > detached from the kset.
> > 
> > This is triggerable by unprivileged users, e.g. by concurrently issuing
> > the RAW_IOCTL_INIT ioctl of the raw-gadget driver, which registers the
> > "raw_gadget" driver on the gadget bus:
> > 
> >   sysfs: cannot create duplicate filename '/module/raw_gadget'
> >   ...
> >   Adding module 'raw_gadget' to sysfs failed (-17), the system may be
> >   unstable.
> >   ...
> >   unreferenced object 0xffff8880188dacc0 (size 96):
> >     backtrace:
> >       lookup_or_create_module_kobject+0x47/0x100
> >       module_add_driver+0x73/0x1b0
> >       bus_add_driver+0x1d9/0x340
> >       driver_register+0xde/0x170
> > 
> > Fix it by serializing the lookup and the creation with a mutex, so that
> > the second caller finds the kobject created by the first one instead of
> > racing with it.
> > 
> > Fixes: f95bbfe18512 ("drivers: base: handle module_kobject creation")
> > Fixes: 7c76c813cfc4 ("kernel: globalize lookup_or_create_module_kobject()")
> > Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
> > ---
> >  kernel/params.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> Did you forget an Assisted-by: tag?
> 
> > diff --git a/kernel/params.c b/kernel/params.c
> > index 8b25133fed242..78f00d3f6a165 100644
> > --- a/kernel/params.c
> > +++ b/kernel/params.c
> > @@ -20,6 +20,11 @@
> >  /* Protects all built-in parameters, modules use their own param_lock */
> >  static DEFINE_MUTEX(param_lock);
> >  
> > +/* Serializes module kobject lookup and creation in
> > + * lookup_or_create_module_kobject()
> > + */
> 
> Wrong coding style :(
> 
> > +static DEFINE_MUTEX(mod_kobject_mutex);
> > +
> >  /* Use the module's mutex, or if built-in use the built-in mutex */
> >  #ifdef CONFIG_MODULES
> >  #define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
> > @@ -754,13 +759,24 @@ lookup_or_create_module_kobject(const char *name)
> >  	struct kobject *kobj;
> >  	int err;
> >  
> > +	/*
> > +	 * The lookup and the creation must be done atomically, otherwise
> > +	 * concurrent callers may race to create the same kobject, and the
> > +	 * loser of the race gets -EEXIST from kobject_init_and_add().
> > +	 */
> > +	mutex_lock(&mod_kobject_mutex);
> > +
> 
> guard()?
> 
> thanks,
> 
> greg k-h

