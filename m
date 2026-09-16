Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A74F55D1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567896; cv=none; b=NdxU+TBbACch2lIsxZ+wX9IAjU53q3tEaEu12nZWD8vprvvD5kRv1j6ezf3JjTrC6EUzSJn0c8/CmcMEfXDssuWmY9VdiSRddbOMZH6EGVCIq4NPEBw0gfnsJwnX7syZWT60Wz7Iwf51+KsDxh+vVbacvNcG3ivTuooAcQUBk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567896; c=relaxed/simple;
	bh=w/eXQPGbd03iM9t96bJfR+o+/5L1N7pSYa1fCCqF8nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrK10OUUF+IupEs54eGyOTk9W7uxTY0Wep0+aNVklKfZbmagBH+1QBkOicgZ2P82lWumSTAzQHj5hRU6aE/NPEzl+XJ9pMCmv/vumNW3+IoB6EiGMcFcvZdJ01W32VFvR4qdwrDqVUtzW59026MKIigPHItWEfc/wgJnYHDHomE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so286875241.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567893; x=1790172693;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8tYTO2oWmvq4rR3J0AZylxe0N8AEtq4E2BxgNYjJbc=;
        b=PDegEZQja+YBSaGdXS9nMTAbeXLbMi6qH5B7uNr/NZghPgBg/HfPKo0QkrpI1zhnya
         YnawFCWL2ST1MKzol2GcCyxp7qYnvO4OZ/FMWXwlcEKyTgPwKYivv1pyh0WsXKSUE9Zc
         JkM2cZAUtlIj1WOfmu74LdQmoCgODpagwQluvTK7uWW7cYExrnn0c6Ti//5m59KiNnfu
         qqcbZK9hUNYhQqkOjWv2ZKSxlcvBPmVUfAhNa/LinTkd4AZyUwk583LvZnSdwFh222dn
         /igGIs8cPKdLTYu1oR0/gP5PRt6egDlQBOiiJt1q6sENIdpzuj+IQZVYlVQDPdPtm1vN
         1uPQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3rnMpTy8w2/+mtveDbxSxjqYBU1E3/cu4DpfKJGmfXSWBU8m8TS9aUVGuA4arBS6rLfbvOf6xA43BzZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+ksfRRXLuy9xijb/yezkyfWkuiGMtWgcFYz6WHsCxELz8C4ix
	N7C6wBGYfp/j3+laf47N/pjPacNgqnHK9MHB/tTtp3p2sCi/IdO3tYPYE4aJcRk6Los=
X-Gm-Gg: AYBFou0nP7PUanOYpVQ2gVbLhnQFHV9xBbrZNEPFrHB7W5AMvkVz8jJahffcb4BkYJ1
	F11bZZKEfXpiP6DDRgeX9nyeKMyVmmmpo+N8D/pG6rLGHlUIkZK8kCQJJMtuu9cTgJIchX4/ziV
	l7RzmJSlRsozc3m/UlZZ/E9w7dtFZv68/m09QM+183JqXk6mY/FbampC7prsusqCn+9AlT8kmsc
	gF6ZwbwM4Um5JsrC8f/X+fJurH6pB5h2mkefGP7MgO4dtkgtVluIMQpG88z3Zxnny6t5/gK7JvV
	fUOODHQ4F/rUuTj54yPgckMYAkaMXXrQgx3MwgOaA/UbZhnor+XP6Z63s4Zd2GDLUQEytl33mJt
	3flmLaxsbw0Hv0e0Uy0JwuYWYqlf7gVE8O9nlGLY3QXg1eQv6xtCu9uTVCXM1MVjEbEINkDjs7q
	Q7KbSV78OauUFq6UTK/URe1ZRGAdGnbJ/G0NlnMvQSFccWEVVJ7xTGyCiGEK/++j8/2yHz7rxC5
	9R9ANhVsGhu2S3eAmg9cUOWdttFOM52eSwI
X-Received: by 2002:a05:6122:f8b:b0:5c6:58df:5826 with SMTP id 71dfb90a1353d-5c99ac9815amr3463441e0c.5.1789567893049;
        Wed, 16 Sep 2026 07:11:33 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c998a65a83sm2845075e0c.10.2026.09.16.07.11.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so387704e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlcmu+YrRLzdMZG4qD2RxnK0LXANmwN9HBP03pVgmCpsCAw/MglyEEg6jTZPimohfG/xZScLglj/1cChI=@vger.kernel.org
X-Received: by 2002:a05:6122:2986:b0:56f:6cc0:681e with SMTP id
 71dfb90a1353d-5c99ab5599emr3306736e0c.1.1789567890852; Wed, 16 Sep 2026
 07:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:11:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
X-Gm-Features: AcwNN1WJafhDFv8HErK5k3kvDPcaoO0zG6c_BSadTCdG1pMVoaBKHlljZ751d3o
Message-ID: <CAMuHMdX27+sdJYd06v3T9hj2=z3ADSKOVGvu+02-qe+Jp6R4Bw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hwspinlock: add low level debug capabilities
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

Thanks for your patch!

On Sat, 12 Sept 2026 at 21:19, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> While developing the hwspinlock core or a device driver, it can be
> really helpful to change states from userspace. Add a debugsfs interface

debugfs

> to request, free, lock, unlock, and test hwspinlocks. Because this is a
> potentially dangerous interface, it can only be enabled via source code.

... code,

> Similar to writeable attributes for clocks where this idea stems from.

similar ...

> The created files take a single id for a single lock. To test all locks
> in a system, one could use this oneliner while in the debugfs directory:
>
> for l in $(cut -d: -f1 hwspinlock_summary); do echo $l > test_lock; done
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c

> +static void hwspin_lock_low_level_debug_init(struct dentry *rootdir)
> +{
> +       debugfs_create_file("request", 0200, rootdir, NULL, &fops_request);
> +       debugfs_create_file("free", 0200, rootdir, NULL, &fops_free);
> +       debugfs_create_file("lock", 0200, rootdir, NULL, &fops_trylock_raw);
> +       debugfs_create_file("unlock", 0200, rootdir, NULL, &fops_unlock_raw);
> +       debugfs_create_file("test_lock", 0200, rootdir, NULL, &fops_test);

Perhaps just "test"?

> +}
> +#endif
> +
>  /*
>   * subsys_initcall() is used here but controllers may already have been
>   * registered earlier or will be later. The rationale is that debugfs is

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
