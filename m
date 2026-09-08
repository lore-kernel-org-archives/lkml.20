Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21C549381
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874353; cv=none; b=spZjF6q69hiC4hKtiqIetPZ+PkHKfNH7iPhYQOrE458gEhXyuV5IzZaUUHbLJtGJ6xSRg2OoHiLow+fhLQYW+DUTBzIK9ktxylmApYg2I4O4D5KsPq07G0FC9K+5FZ3IOXbtxAsnGKZ7pYx+T9fKKBxmyYZg56/DRFbiqtCmG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874353; c=relaxed/simple;
	bh=WkJJWZ4SaxJF/zyHzYEhTuM+Mb9yokH8po4OGhCk8uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kASLzKP543Ic6fBEmetVcj6RdJh944BuML7qLcQneAF37iAe6Wx0dtp3sT277CMy2oe0vki2cV88y9h+9o9hCkHgI9Fp2WsjsbYzN4Fa+Y+TdO2h/AzD0E/0o/g7XcllgTcrlgXrTEYaJDr9iTbhN5P6qR03ETTzwz4BJa7zqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SSAFH46W; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SSAFH46W"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so44647735e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788874334; x=1789479134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzA37jUw1zDr0CBMAEx16zABWeBDZswZOBHILRhm0ZI=;
        b=SSAFH46Wc+tnRKi/RlRlGjt4dqFT80tRzWBvl4lbx9tVjvyjaUSpA95KM880CkktGT
         hPz+5JVQVxsj4FzWzmNY0P/UDTzwgbPPqdoOmtkroc6bLBbWkxYRQ5oTf+MXMP8xkWyc
         TNoQt5yVqu/YdBx69Z8bo3ZGCBjES7vO0Ayjl13TIGtKOJN3cyaGVmA9oA/fghGPq2p0
         79H0MIXRptvXiP6P8WaHgKiIKj6lrVUc0lELsNsikc7CjVoKfhx1vIaw2kIdnaSY0/Z5
         H2xYQJiGwJoDGQ2P5i32QUHs0YvNgQ+s8SnsTGejvsHpKawoQBFSrKXf3sA98rErs0Nt
         cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874334; x=1789479134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzA37jUw1zDr0CBMAEx16zABWeBDZswZOBHILRhm0ZI=;
        b=EfnIZbUFlfPaNQskj8Zr3FbhMjuSCI109aX3X7qbNwq1ShRr9dhluIlwraMjkZRgH+
         eVsttnA1lJrp/xnB6jzk9KQ0gon0U2xt8IkB1roLuH7ZTd2wLceRu43+r/AUWgCiieaa
         79ZAYfSW58ezjn5SP+6hQ+c8FH1oRrqkMag/5uQUs215pWh5wTWR+3p2TbAizZS+kdFO
         bjUp73F+J6A1CuePV5LWtEac2Yupsj0Q5PDTum9Vk9Y4uSAnFUeUOpG0RnXQw5L6zyBI
         IXAHv+6MWrjc9zJhRv3qnwh3W+lydzZY13vJne7jwwIX81WfFjlhCmKwfQYDMPB7tves
         9rAw==
X-Forwarded-Encrypted: i=1; AKwUvByC45YoLQ1/x5JGOxZKUuMQoDok43o9zOYnZKweIfZ126dvTKfPaeMszWvCQ64hr0cjnPVnj9GIppTt+FA=@vger.kernel.org
X-Gm-Message-State: AFuF++lMAFHrnff6JUrycHPmxnwxtHtQtL7uSjzb+cSG5dQEl5rwh4Xi
	RGQOCkjFPvmHR1BaZhgAGon/fqtGOj/SQr0+KcZVTV0HWVoA7v7oHbbM/1mqM2YsF0c=
X-Gm-Gg: AYBFou11O5N+GVqkcf7e3bSTGJRr10out/jwFeDz6w/KibR5bw79VRlIqPDH4RUGpAV
	JtzR5ooGDwNJali0PSEesTlbCIE8KIO90OR8UiuiCIYnnxInzhu11gMrZ0u5wejAecklJ4ec2M5
	HOhdh/s5Gi2qcYg4Neg3ArWJe9RoQ16l0f7SHfObe9ElLx/BkcUshno+l3cmZd1xT5auXn88oBq
	1kzjeRYpIL+yh6y3DdS22opkdcjQU+S99duX1hjMl+JVa8YOEmieyA18hIYKgA1rWtUWGauPugM
	P2qJZtYaAoUMwWgljm1a9bt7vdwMUre9+myqqcrFGOELwhdeuwmAlktd6luh++I0EerqOiUCqt8
	yR7NymAbz/8giLpuX+5EOSva60su5z1+Qp3cwVDMQrSCI5RXleSFo9N90OzLReV/Dbt3svjKb25
	tnXBOlxpW7QD8ZPuW4wo/OjVywyX4dnqLdpFplKIk7eXZDGZvEXIU=
X-Received: by 2002:a05:600c:3d92:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49d0726cd2emr409557115e9.5.1788874333600;
        Tue, 08 Sep 2026 06:32:13 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm518069085e9.14.2026.09.08.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:13 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:32:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, joe.lawrence@redhat.com,
	Harry Hsu <x90613@gmail.com>, mbenes@suse.cz,
	linux-kernel@vger.kernel.org, shuah@kernel.org,
	live-patching@vger.kernel.org, song@kernel.org, jikos@kernel.org
Subject: Re: [PATCH v4 5/5] livepatch: Clean up klp_init_object_loaded() when
 fails
Message-ID: <aqAOWrmq1YgTbgAi@pathway>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-6-pmladek@suse.com>
 <20260908122549.193F41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908122549.193F41F00A3A@smtp.kernel.org>

On Tue 2026-09-08 12:25:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Partial relocations are not reverted when apply_relocate_add() fails midway, leading to permanent state corruption.
> --
> 
> commit 3f6df1b4ed699e839abbdc8919a6c7de5d1850c8
> Author: Petr Mladek <pmladek@suse.com>
> 
> livepatch: Clean up klp_init_object_loaded() when fails
> 
> When loading a module, klp_module_coming() updates all enabled patches.
> If an error occurs, klp_cleanup_module_patches_limited() cleans up fully
> processed patches, but skips the patch that failed midway. This commit
> updates klp_free_object_loaded() to revert all and only changes made by
> klp_init_object_loaded().
> 
> Closes: https://lore.kernel.org/r/20260823062313.1321B1F000E9@smtp.kernel.org
> Closes: https://lore.kernel.org/r/20260830175608.4BABB1F000E9@smtp.kernel.org
> 
> > Next, klp_init_object_loaded() has to clear its own changes on
> > failure. It just returns an error when relocations failed because
> > they clear their own mess. It could call klp_free_object_loaded()
> > in other situations because all relocations were done and other
> > values are just cleared.
> 
> [Severity: High]
> Does this actually clear its own mess completely? Looking at how relocations
> are rolled back in klp_write_object_relocs_limited(), which was introduced
> earlier in this series:
> 
> kernel/livepatch/core.c:klp_write_object_relocs_limited() {
>     ...
> 		ret = klp_write_section_relocs(patch->mod, info->sechdrs,
> 					       info->secstrings,
> 					       patch->mod->core_kallsyms.strtab,
> 					       info->symndx, i, obj->name, apply);
> 		if (ret) {
> 			if (apply)
> 				klp_write_object_relocs_limited(patch, obj, false, i);
> 			return ret;
> 		}
>     ...
> }
> 
> By passing i as the limit to the rollback function, the rollback loop:
> 
> 	for (i = 1; i < limit; i++) {
> 
> will terminate at i - 1. Doesn't this skip the rollback for the partially
> applied section i?
> 
> If apply_relocate_add succeeds on relocations 0 to k-1 in section i, but
> fails on relocation k, these partial relocations remain permanently applied
> in the livepatch module's text. 

This is the same problem which was reported for the 4th patch.
It would need to handled in the arch-code, namely
in __write_relocate_add() in arch/x86/kernel/module.c.

Best Regards,
Petr

> Subsequent attempts to load the target module will fail immediately at
> relocation 0 due to non-zero target memory, converting a potentially transient
> address-space layout failure into a permanent -ENOEXEC on retry.
