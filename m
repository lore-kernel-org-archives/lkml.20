Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865B3603E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876172; cv=pass; b=dCZvjQrIOXSX8eQQTDwxWnmV5jj19dPjnstb65XEACGsMw12VLMA5BPwQP2FAnRSvx4ZmzccjffHfM2OpVsgRA1YyH3SF5OhphysWQZpmhECo9Ec/oapq/4+BIODlU2KR9ncsf/lwwLRnDuqxtnzAxEjI8K8YhT/P0Y4nTDNzhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876172; c=relaxed/simple;
	bh=GIZazYhF5R8zbEp/RJupHjIdrZsaOaYkLXIiwTPq6D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oo7VHqRfgYYUe4FObzAyY3c66rY3FSnPNOew4Cci/9FF9xpZMeGFvMdIGrsYTNO24KvmWGKod+vUbJJwTdi8ohJy3Vg58Z+i8YCtHp+u22WzSdld0POAUVE7UvwJpvNO2I8bX44g+C1atW/68iFnRs+n6lwQNjxgwEpgc1wcAAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2yWGc1K; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2yWGc1K"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso25637125e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789876169; cv=none;
        d=google.com; s=arc-20260327;
        b=QKphzF5Ozuwgol7QbrjGDHCxkfkAGO+wB1xFoYtM0Es37Sgt4Zfh3MsJjPIsh9zDCN
         wDtmINXrFOJ1scYyhLEF6tg7jTo6PQRm4yXdw4e3RJhtxdmQnevxibzWgWU9+vmfKUrh
         3+9T0w3Wl1c1P2Ienphe5Sa3rXPe+NxY1PrepSbPTDLjlBUOHNGz+perLsjgD8DiR0T1
         WYYxFmT3V0qAg1gASsKbLwSXNo3w5UfKhnaufG6c0aTGg8x3TeXiXC8u1ls8Kf6qjEWz
         dqnyPM2IHsEorPz5RAU1su0hgUXQTlG3l/jRJrLdBDpiSn9Ykmzr8howoUgb5euFQHld
         bQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GIZazYhF5R8zbEp/RJupHjIdrZsaOaYkLXIiwTPq6D8=;
        fh=FfUeJ/JMN6EHRkRa5DvfSresB9uoLuDP/T7MMacIPC8=;
        b=cO/g5X8CAOpDL4nV/nCHircVfWVOsGP/9HvLS/m8bduJ7bUSW9EATpxKOiUjNAbhw4
         c+yD6omlcNvCvuRSd+t/Xbffx8WQKuPoDuyr4GB/BqxNXkhDdFYLotADuhXxEGOU4l9Q
         xgXBJKklwhBRYH+pgyOREi/lbLFgnDaHjb4YHovhHmviJ/HC5Dtvu/hqwYFtncSPOzWZ
         FxN0qSHH1UQ5xBBoqBtKTsEDqBIgSOeEbVFf6E2SGVorjr4uEF+ehiIhc0gKpEVkVX4W
         YFzs2D1nrOSc5WgHTEm3geY+337YBztczCylWs/khQoVlEbvGoJTeXbpyPamzh2RPYvm
         pzIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876169; x=1790480969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GIZazYhF5R8zbEp/RJupHjIdrZsaOaYkLXIiwTPq6D8=;
        b=m2yWGc1KIaSghpc/RrA5ajhaAcPPEOv73BGwRRUmsn6OaVtNASH/KFt6E9LUmMEaGt
         aAlwKBxLEZe2PHTcTVcFuPsYO2Zrt5yP29y9cQFvQ71kYOVV3WugkiZxuCxbVuyi9T6X
         89MJ3gELpFDjLp1ONXZaJ5YaNsTgGzMEWj7xt6s3/MEaq/5O3VPa5zr7Mj+8Tf2BgA7o
         lUgB2wDuMdQ7CAmrV2uo7jgkuJ4iIo9qRnb81qHVE9b+pWE1kdw/6S8THODFkmcVIvin
         J6PIIfy3bxW2J1GDLrk9+5NF8RBhu6Y1BrtiUDu9N3QHjANkO9PyI4jPwRP6VJl9+ogH
         j51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876169; x=1790480969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIZazYhF5R8zbEp/RJupHjIdrZsaOaYkLXIiwTPq6D8=;
        b=RQ6v/kYsZalZbFKYjqSl1LL44jf9a2Br92wuU7F001gh8/aEwmWdlZN9F9HScm2ZHW
         pSaDXahGCwiUi6Z2X/4TPWsY2yNDcw7iyzA8Bef/WtjS9RwF0nvblyc5g3U+g/Yx6Fnb
         D7RoLCy4ntpKWwAUAT1HRi+UJLiBPyX/44kmHDENRqm2M0Vj4Te6Nk5/Hl0o8Ci6oxnU
         991vgP3ZD+zDRGttX6BU9hAPcbFwpVunKcjZSdUvHYjUVus68zbJ9ec1e90IDQN2jkD2
         G2COPNi79FIxwmvDLUr6ZeLC5NqQ85RxKy4J3fNJLZnRPi3kCH42imI2ml055yF25Hg3
         jdZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxInEjQI3Z0kp3hh5yDXkRROxvQH4Yvvm48eYdTQhMDCGotDuVsl+VVrdBcsAReZofTxnd5AxDyuJBVCNA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEmIiTXVq+Fz+yXDjUqDxHXn7VwqKTYt1jmk2k58OGV/fchIHC
	zY+mzr774UBkmxaw4AfUJL7f3UJeumZkN5V5TavxzWFGgCM9q+I4A40BxvapHCzaKqlb2sc15K8
	c0S3nOMfJDngVZDDsHLK9nIvliDgEPwk=
X-Gm-Gg: AYBFou1fHP2s/nNho+R9rGO0U3wZcaRyAcdT8rnji2nB4o6bI1tkDvK02KJA1YyCIgR
	/K3oWJtfTKbnX+LmvhKc4atiq64v09/lqDqrO+rNXdY6EEr+vu8nBKpkwwDaSCq+CPEoXgpFvpR
	UXhVDK3EayOHYjQTdkYwZAjtwZZ1XEglQkW7FQqdDdbEq10miAY9uu5Ca/Ryyme4V+AvZdJBlgr
	FoOp+gpfVIg8PyKukDas2uPCeCf77Rd3Wj8t93p0Pa0qDp849N6eqfqUelrLtKo8/gL8FMhXct/
	O7uYVZ8VoltLsi/THLYMPeIyz+Je0Nvcb2/0FRsWngDeSZDsfga4j6vsdf29u9n/5ei9aGiJRpu
	O3jrKktoAL+yPeA==
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id
 5b1f17b1804b1-49fc572f27fmr91797455e9.21.1789876168923; Sat, 19 Sep 2026
 20:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920024550.2278408-1-kunwu.chan@gmail.com> <CAJhGHyABHDrYsnfMMr6V+rWt5qe6g1+Q0vHKqLbES7uEAzNYAg@mail.gmail.com>
In-Reply-To: <CAJhGHyABHDrYsnfMMr6V+rWt5qe6g1+Q0vHKqLbES7uEAzNYAg@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sun, 20 Sep 2026 11:49:17 +0800
X-Gm-Features: AcwNN1WA8Cj12d3wa7JzCniWQ7ab0L0T-33WqHCSX57dTbhgUDNJrYzRZ-33xHo
Message-ID: <CAN_Opa87Z1Oz2GCfbddYRqkocmdoYLg=KfneqU6RqH3hXwDx4Q@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Drop redundant rcu_read_lock() from dump functions
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 11:08=E2=80=AFAM Lai Jiangshan <jiangshanlai@gmail.=
com> wrote:
>
> Hello, Chan

Thanks, Lai. I see the distinction.

>
> On Sun, Sep 20, 2026 at 10:46=E2=80=AFAM Kunwu Chan <kunwu.chan@gmail.com=
> wrote:
> >
> > show_all_workqueues() and show_cpu_pools_busy_workers() are called
> > from contexts that already provide RCU read-side protection.
> >
> > show_all_workqueues() is called from wq_watchdog_timer_fn(), which
> > runs in softirq context, and from sysrq_handle_showstate() through
> > __handle_sysrq(), which holds rcu_read_lock().
> >
> > show_cpu_pools_busy_workers() is called from wq_watchdog_timer_fn()
> > as well.
> >
> > Drop the redundant RCU read-side locking from both functions.
> >
>
> I don't think relying on other subsystems to already hold RCU is a good i=
dea,
> except for contexts like IRQ or scheduler code, but not softirq.
>
> `rcu_read_lock()` has almost no performance cost and makes the required
> context clear.

I was looking at this primarily from the RCU correctness side: the
current callers already
provide RCU read-side protection, so the locking is redundant for
those call paths.

Your point about the helper's context contract is a separate design
consideration.
I'll take another look at whether these helpers should require caller-provi=
ded
RCU protection or establish the context themselves.

Thanks,
Kunwu

>
> Thanks,
> Lai
