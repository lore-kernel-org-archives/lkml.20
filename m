Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB213EEAF2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531499; cv=none; b=fzuaSGTgSqZ9OGROIZ9COn8CEisuuMHFWx7MEAny34j4LefDPg1P+uP/4xUAHxMIUXYiNCOc/LeVn6F7OUycVhCEh3qPg9OAe7xfmI1hELa3NOFNNVJ33i/uNkkeoZiQugD583KMt7PqU/ghhl48zaRMXNPbcFLXsgqxogQDGfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531499; c=relaxed/simple;
	bh=uNLixg9Om53qk3/LW06q9lxGKynTrGmFAPLimwn0KiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGgyWFipRIP1rbDNSO21sE07i0nN7kUJ7/mUl/Svb9DbCcRgs9TMgKvnh6tOZl/ut1L4Hc39EpCrfB5UefU+eRPFeYe7Ucz+pUoA6HX/1K0DZpsT47JYzmP574yV5VTI3h9hCmRnayDCNKzpKT990KYimjeuxC4Kxf15hPlIY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfmvuPvy; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfmvuPvy"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a886df36f6so10802707b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531496; x=1791136296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxCoAEdqbJ08U0inGBb/kA6iY4dI/TH3O/5tNhidk5I=;
        b=pfmvuPvypl5Ay9fi7Qi23CnfEMdYjsSw8fkJYln6ogqAx25RCBn9qxUe+V7ZL7Dxhz
         NyPeeWFeQyKMy/sH2oGhRY+Xzmm5jl4Oe5rA65527rM88qNbY7GFoq4u60dSz2coKzJK
         35Yue1uSxdDl4cu5mlZ59S3QS+Zu3VnoGSrbSo0vhgULjQ10crHx15QGtpYlO4BD7T5N
         Lg5RCAPu1SwC2VgPh9MfGuSn60vdC0ZUYFS8K+gt66JADiH3R7ZY1V6/+ukrYzccG60/
         TWkBLLrQ2Oh8sMAJd6rMgahvNE2iQ2jUQNis6YjFkUfSlD6n4+iIn877uQ4FS9BlEwnV
         KnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531496; x=1791136296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rxCoAEdqbJ08U0inGBb/kA6iY4dI/TH3O/5tNhidk5I=;
        b=B2w4bRwQYY/PP+SiYs3ecpMLA3H4LGPq14LPPXzF2Zby9/VpLU6KKzPcAMI4mO/0fa
         7KClftq2Z8g4yfdMfujIN2yv00gfwgAPMU0RSyItN2Hy1UwyJxtMLTugvGxJARIyZ9nF
         3JLkOuYESBBSOXN8C+TC1hkkTa5JEGOfRnMTfOLucm5GcjpboSsM5R2+FdFC79+AZ6t0
         iUxkCaaFKZJ36eLcyzN03zbuYpSLTjMLUE2XLW+9qPLcxVC27fLYvUcBChR0lwY9GBJf
         mTis2UmW4YUN9dBRU4aoslaDQOX4UycXjYuxQobswCBt3pH3NWwKGygB18L7phzs1tBM
         pIPg==
X-Forwarded-Encrypted: i=1; AKwUvByKt+3zOWDHvTw+hOLD0gcDz/TC3bhSuVrHSG6Q/ts9dsJ3ZY4sT/KJCnlXZ3AKI5hR2Sibw6ojq9QDVIw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzzfYx/kspdIprVhi2dMlr6Ob2KdlmSnDHIgnXKquOyNhIlEyM
	8MbqYcI3FY08CYk8jkR3knnHo3PVKfmdO9YzmsYNcYjj9uncXyX7ya52
X-Gm-Gg: AYBFou3WsTtbweC0z9MN2Zf2S9maHgRnv5ekuEzhJ5Muol9Veu9zWdn/AZTyB76ZIba
	h13geoZBZKkz1Q8fBVYyMWr1rLXIAInRxMPis7p0V+skp35EjXgAYJKhh4Ui2HXWE/jRH1HY9tR
	GOq1l001y/ZQSj4zzEblPFAi+IEDVT7NRLW6RjyigmqfgsGl5t4XD0+saWrvtZpu9kHPLSOYZSX
	N/rpXOvl9FdCtu+BHNksLFXNX+Eg25Ydx4BBs5t6H25JwPU4hYw4seeXHmv/OaJZUcZVxGftS4E
	bBuKnoqBROvyCk/yr+UyNj3BIuvHxs8BZO4kASIOwIIDrECg+2LcKJlb2lF7ttsh0Q9WuuMeeVy
	nzZuPxGQjUL8rIgWgBSVpO4rWo/+KeXzd0K6tN5MLkP8iYXgANzJrYVFXVecO6LyzfereBAiUhk
	k7lGWPU+I9j0j9fYEiyfx6vHdRBhgGQT1pxlCf+WrpRJzy2HsG26Wu8nqvX9ltegKBzD20KicJC
	Q==
X-Received: by 2002:a05:690c:6e84:b0:8a9:693a:326 with SMTP id 00721157ae682-8a9693a0d81mr16220507b3.7.1790531496465;
        Sun, 27 Sep 2026 10:51:36 -0700 (PDT)
Received: from ubuntu ([69.209.117.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860fbd09bsm33564127b3.26.2026.09.27.10.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:51:35 -0700 (PDT)
From: AnishMulay <anishm7030@gmail.com>
To: idosch@nvidia.com
Cc: pimyn@google.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+ded267b328e950a7c0c4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ipv6: addrconf: drop "BUG: " prefix from pr_warn()
Date: Sun, 27 Sep 2026 13:51:34 -0400
Message-ID: <20260927175134.1909-1-anishm7030@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909115655.GA1344764@shredder>
References: <20260807131300.2677228-1-pimyn@google.com> <20260810095136.GA2582170@shredder> <CAJWNTGyLJubRHn2KbqQMeV_jqexSgaLbzTe+xJnGzUw=RUtntA@mail.gmail.com> <20260810103517.GA2626301@shredder> <20260908043143.120335-1-anishm7030@gmail.com> <20260909115655.GA1344764@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 02:56:55PM +0300, Ido Schimmel wrote:
> Does your reproducer rely on both keep_addr_on_down being set on the
> loopback device and its MTU going below 1280?
>
> The loopback device retains global addresses when this happens, unlike
> any other device [...]
>
> So, given that this state is quite broken and unlikely to be used by
> anyone other than fuzzers, I would like to simply align the loopback
> behavior with other devices and avoid keeping its addresses when the MTU
> goes below the minimum:
>
> [...]
> -	if (!unregister && !idev->cnf.disable_ipv6) {
> +	if (!unregister && !idev->cnf.disable_ipv6 &&
> +	    dev->mtu >= IPV6_MIN_MTU) {
>
> Regenerating the route in this case is more complexity for a case that
> nobody is hitting other than fuzzers.

No, mine does not touch MTU at all. dev->mtu stays above 1280 the whole
time. My trigger is a second addrconf_ifdown() racing the pending
addrconf_dad_work from an earlier up, both inside a single "ip link set
lo up" call (that fires both NETDEV_UP and NETDEV_CHANGE through
addrconf_notify()). The route gets deleted, the notifier gets skipped,
and the async work later runs with ifp->rt NULL.

I checked this against the source rather than assuming it: your MTU
check sits in the NETDEV_CHANGEMTU branch of addrconf_notify(), and my
reproducer never crosses that branch. So I think these are two separate
entry points into the same broken state (kept address, no route,
notifier skipped), not one bug with two descriptions of it.

Your fix looks right to me and I would support it landing as is: it
closes the MTU triggered path cleanly by gating keep_addr_on_down on
dev->mtu >= IPV6_MIN_MTU in addrconf_ifdown(). It would not close mine
though, since my race never brings dev->mtu below the minimum.

I still have a patch that regenerates the route reactively, at the
point the DAD completion work discovers ifp->rt is NULL, tested against
both my reproducer and the general shape of this race rather than just
the MTU case. I think it is worth sending regardless of whether yours
lands first, as a backstop for any other path into this state, but you
know this code far better than I do, so it is your call on order. Happy
to send mine as a follow up once yours lands, rebase mine on top of
yours, or hold off entirely if you would rather keep this scoped to
just your fix for now. Whatever is easiest for you to review.

Thanks for digging into the MTU case, the unregister argument asymmetry
in addrconf_ifdown() is what made the loopback only behavior click for
me.

Anish
