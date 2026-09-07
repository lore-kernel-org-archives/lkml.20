Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E4472F74
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783482; cv=none; b=mP3GoHsJ41NNylDQV12+4DvDZTQa/+5VjHzKWJLxNWkmjWnIWtCFfZctADhPevVHyaBHZGwBV3+3tkD7MuDn19BvZYKpLIdixOP17w0n92JQJW1OMu470wxqtCeE/iXXeVFpNVye7QfV3tN2f2hLVA2Lu0Gdg0ymtFeNwlTTnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783482; c=relaxed/simple;
	bh=VEx282xJoSaEd9yFgg0bC7E3UZwOapIeeglnsmObeHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MT//iz3oBbTX0AGqn3Uz3nedT+nAgj8HLpxg0GIREZChauqj5MfiWYqKMf4Cty2bs5iT6GUs762I4VzKu8d+jiYx9WjqZYcVC/3pDc28FgDBHQGrtuJ/sJLDBpXTWPFR7fYhTFA9W/t6s0Kfqg9Qa38rn8xI/TIQcYME9IqZjow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c66eefc868so3468093e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783479; x=1789388279;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ICs1H2dY7Gpq4y5UR8p+p9hgLN+TaINBuRZGUQCEu4w=;
        b=GjGFFyAvUm3cSJP5NClo6gns+ZcydP0cvC7sf2nLDss5ZnLQtKZzvAm23Ea1Dd/7i1
         i1jGyPfLpiMxz+8TS5ViTuhJqAa1kleioPqiswHfo3/l2cxw6+AUtJttm3x6ommIjQY6
         EPjtZgOD039QzA/Ovejeqyef4vOLo0BHQ1Lu98eCM2KrA4m+8nzhTBri7H2WSYDhAzeW
         s0II6dK5hE5Fm9fqeHz6Y51gfgJsOaBWBJbckZzMGYqdydZxi42B8Sv10+jsuMBdO+Dt
         KovJlsRliz3Stcr0l+Sr/2F9/tqrlafasav1vu5CEV1N3RELSRwpx2HSRpXBKGJeZLKP
         EPLw==
X-Forwarded-Encrypted: i=1; AKwUvByos2x1NhqlPRAgFaGsTs090pcOoKpUc4p9Gt16VCPaqhU07cHo+6hRQgPbWfFr9p6ydvSQRIrRlGTh6Po=@vger.kernel.org
X-Gm-Message-State: AFuF++mkfYUs1aVpcTMRhLU+9zJ4J4Owa0CE7UTpLlJ90yFJyfXnCkUP
	hIzjkWmWeXCrzBZ41HdhBsxRhaJ6hsyyy+hi6pxRgdxtyeCff8H4bFdoAh4M2C2W
X-Gm-Gg: AYBFou33DgJAiCl2XeOewqtTYKl6SyIWHX+l6qo80Eu9w5QPa051joH3mWe/xSSYG66
	kxeFavTrqgL0FvxQdJROOeqxNmplOt8fy7m5Zh6Km+yq7fA/1uL2/ojoaaT/3NjXdK+wotg6jlL
	OKq1U3t5/KzF1KHs/XMwf8CR9JLkp03Qacy67azwbFarRPFg7pUAhFcgs9mdiZ03oSxQL7oeCUa
	jwo56EyizwHc96qtF2EIgu4u7VtsESXayBgM992MJwyaArM8/XHEM0RZ/5B9kk0tv7Q9HgxKKc3
	xQFTWftl5ZhdnY89NnIHYkUnIA7mgVvyBTVvQGrPlDzscIYM0PQooM4Bcy2LNstj2AvHyXC/eMl
	2kgRKu+nkPiH15OrwRww6Cy2T3nxPExWmbiDfA71L4aaRXsiRCZgShpjNu+XnXXMKX63L8VB26w
	DnpqO3xC/Yvqo7dEiYEJvZOC1j0TbKvMctbzz+rNRtekP8It3Y+qaKioLtwIOpBUt/4/NVbmtRD
	bHFEUzTHy4cZmg0373PjOAJGw==
X-Received: by 2002:a05:6122:da0:b0:5bd:a5e1:c7c7 with SMTP id 71dfb90a1353d-5c7ed485cdemr9897706e0c.1.1788783479314;
        Mon, 07 Sep 2026 05:17:59 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm7485735e0c.10.2026.09.07.05.17.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:17:58 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-782af6c753cso3243692137.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQFVXD6SlXYOyn47bgTXh62E5QNMZBlVi7CMDu7P/LwB4SXaIzf3e03b3KFRtMQbQf5zviK3LQS0nCjB0=@vger.kernel.org
X-Received: by 2002:a05:6102:5126:b0:785:5a17:739b with SMTP id
 ada2fe7eead31-78a4a4944femr9543602137.0.1788783478176; Mon, 07 Sep 2026
 05:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816153809.7067-1-jakovnovak30@gmail.com> <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
In-Reply-To: <aoLCr8JEYaYxcJcQ@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
X-Gm-Features: AcwNN1UGIwaDEpSQZPDqi3a020L7heHOErQjuz6sflvRFDaDCrMR20u-OR5PZhk
Message-ID: <CAMuHMdU_Rx4ZGi9SsNxKUDyYmV-GbD8rD9NMVzYginBMXdZDMg@mail.gmail.com>
Subject: Re: [PATCH] mmc: vub300: fix sleeping function call from invalid
 context in vub300_inactivity_timer_expired
To: Johan Hovold <johan@kernel.org>
Cc: Jakov Novak <jakovnovak30@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	Ulf Hansson <ulfh@kernel.org>, Guangshuo Li <lgs201920130244@gmail.com>, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>, 
	syzbot+1ee4f3b9228e35f14677@syzkaller.appspotmail.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 17 Aug 2026 at 10:13, Johan Hovold <johan@kernel.org> wrote:
> On Sun, Aug 16, 2026 at 05:38:09PM +0200, Jakov Novak wrote:
> >  Currently, the function vub300_inactivity_timer_expired, which gets
> >  called in a softirq context, calls a sleeping function in the following
> >  call chain:
> >
> >  vub300_inactivity_timer_expired -> kref_put -> vub300_delete ->
> >  mmc_free_host -> cancel_delayed_work_sync -> __cancel_work_sync ->
> >  might_sleep -> BUG
> >
> >  Fix this by replacing kref_put(&vub300->kref, vub300_delete) with
> >  vub300_queue_dead_work(vub300), which does the same thing, but in a
> >  workqueue context.
> >
> > Fixes: 88095e7b473a ("mmc: Add new VUB300 USB-to-SD/SDIO/MMC driver")
>
> This isn't the commit that introduced the issue. The blocking call in
> mmc_free_host() was added by commit 1036f69e2513 ("mmc: core: Cancel
> delayed work before releasing host") in 2023.
>
> I didn't look at this in any detail, but having that call in
> mmc_free_host() (e.g. rather than in mmc_remove_host()) looks wrong so
> perhaps the fix really lies in MMC core.

mmc_remove_host() can only be called after a sucessful probe, while
commit 1036f69e2513 fixed an issue where the last probe step failed
with -EPROBE_DEFER.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
