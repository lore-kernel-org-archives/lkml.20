Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585079;
	b=OgtXyf97pLP2GeD/wwVHptAtTS2yHXlrDtOTyhMiTdkwckzUbxAohUaRIy0hYrS81ic5
	 gL61wOHw0SdS/J8K6JPiX4AED2UI0Ax+4aiZzIm3YFvH5qwX7muJIMObJWyssZxcv/AVA
	 V/bNSsD5bIWqO9vXbNxlY3Sl7kvy0Mj/6E6mSHsVJ0I9nqMrsMeOJScbZFL9eyDM0Nb3O
	 Ra6MtMMUjbXdK/YX/ig5HNI2nk6rg080Ec3l9V4/84b8bl+DW0bksbPJSjyfo2qdjaOl1
	 XlUICz9Y0WKkOug9daJGt3MNsA7WCRsTlq0lgA4xXSQ7su0L+cGBfSEQQx78t0TVE3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585079;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p57p3uxeYdPu3dO2jsiMkVBwtyV0ivwwKUFjRQ3jCKE=;
	b=AdU3qiWsL/VOOKUuNGMMMFrhhtRZqsZ10v0OCt71qDMX+dvidUzP0cf5gyRZatK7K/S5
	 /AdFe0ISm8M9tYCTzYswnoJR1lwhMl17vn3oaKaXkqqj2VkVWMXpNhIMOtqcQMcleZGiH
	 cnGdSHkfpCyL/rKy3yUu2PVPZTOHwkp01fYHhKzAqi/lSWdLeBpV2/qrfjYXeqteFCQNY
	 hJeJbDxRcwduvnEa2PMx6IzzysVxWmhFkHo3Bnz8S2hoRqnX5qDxjCyeCCkLKKqFugbMs
	 IJmZYPURyupQD2Ginu6/SF5ovbWABJxfHOTw2fUoG7l+e55kyiHQUt/lRV4mLXqJeaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FN0KJZ18;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFE606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FN0KJZ18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9C1F000CC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794585079;
	bh=p57p3uxeYdPu3dO2jsiMkVBwtyV0ivwwKUFjRQ3jCKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FN0KJZ18ufP4t34x3hktZCSe0aaNqse1xEqZgsLbeR/Frb6pvjQJH1OjkaSA0nL2e
	 7p76I6IxZL1Qkjw6zn9ySR0RQ9Hog9yoK1JlPGR8Bd+FIdJkhvdslZWi8YwW2ue/Tt
	 Kh5gtRnrLvsJKC4J1s9sBzYhyUTYpnaShRn4YIj+Lpl368qtwEOpaoCMyi61AhvgOf
	 7aNchmRnUy/4DcEGJW3/pD0soMaH6fuwC5ZIfWiuoZlg6CMoCSYgM+W7JjuWuRye0d
	 F36hfjXCIcLesN6/RITI2LR0nFsfPEbxKezOgyJYz7LJ+1f14XtOJVGCJkTrn5aW08
	 y4k5N8NW7Djmg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479be604so1412475e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:51:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHUgsuz6SUs9VK4vlPS5rBtgTkc33I/5Mi1vxa5QakOkk7B3JbXv0LL3EQfAYhkx4+LNYKiFfeDUZv8EG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jP22nk3y46MvkxmZsfIHzi/kQivPydlPXu8VajP4acAPvGnLE
	sMTIpGtQsMdBkUxi30vEIih6Qj5w8fu3R3x38cJgYD90MEe1Pam05MZwUgkpia86QOmMFjpu4K8
	nVtoikDu6vEX/Vxuk0odNubvH34QteHk=
X-Received: by 2002:a05:6512:684:b0:5c1:4bd3:ef75 with SMTP id
 2adb3069b0e04-5c1705fab7dmr1078301e87.1.1794585077394; Fri, 13 Nov 2026
 07:51:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002034200.920546-1-xiongxin@kylinos.cn>
In-Reply-To: <20261002034200.920546-1-xiongxin@kylinos.cn>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 16:51:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jhOR4yEoUEb=DqtRcXt3q1EZmP_bVV=e2dUJjFsWXzAw@mail.gmail.com>
X-Gm-Features: AclHuK9gRwE4EUxI2tZOxwW3kLea2bFo-TxB7U1voYMoOeRcICcneypDQhX9T38
Message-ID: <CAJZ5v0jhOR4yEoUEb=DqtRcXt3q1EZmP_bVV=e2dUJjFsWXzAw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] PM: hibernate: flush icache for restored pages
 from task context
To: Xiong Xin <xiongxin@kylinos.cn>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, james.morse@arm.com, 
	hch@lst.de, will.deacon@arm.com, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 5:42=E2=80=AFAM Xiong Xin <xiongxin@kylinos.cn> wrot=
e:
>
> Hello,
>
> With `hibernate=3Dnocompress`, load_image() submits the read bios
> asynchronously and hib_end_io() completes them from hardirq/softirq
> context.  The flush_icache_range() call there, added by the
> commit f6cf0545ec69 ("PM / Hibernate: Call flush_icache_range() on pages
> restored in-place"), ends with kick_all_cpus_sync() on ARM64 and so
> triggers the WARN_ON_ONCE(!in_task()) in smp_call_function().
>
> This series fixes it by keeping the flush in task context, and first
> closes three pre-existing holes in the restore error paths that the
> rework would otherwise trip over.
>
> Patch 1 resets clean_pages_on_read when load_image() finishes, so that
> a failed nocompress resume can no longer leak the flag into a later
> compressed resume, where it made hib_end_io() call flush_icache_range()
> from interrupt context for the reused ring pages of
> load_compressed_image().  The flag is also cleared as soon as the load
> is known to have failed, so that the bios still in flight do not flush
> from interrupt context during the final drain.
>
> Patch 2 stops snapshot_write_next() from releasing all snapshot pages
> in place when one of its internal allocations fails: the read bios do
> not take page references, so freed pages could be handed out again
> while the device is still writing the image data into them.  The image
> is now released by the outer error paths, after swsusp_read() has
> drained the batch.
>
> Patch 3 makes the error exits of load_compressed_image() wait for the
> read bios that may still be in flight before the ring pages are freed,
> like save_compressed_image() and load_image() already do.
>
> Patch 4 defers the flush on the nocompress path: hib_end_io() now only
> records the restored page on a per-batch list, and load_image() flushes
> the pages once hib_wait_io() has returned, preserving the asynchronous
> batched I/O.
>
> Patches 1 to 3 are new in v3; the per-patch changelogs are in the ---
> sections of each commit.  Many thanks to sashiko for the v2 review,
> both findings are addressed.
>
> Xiong Xin (4):
>   PM: hibernate: reset clean_pages_on_read after load_image()
>   PM: hibernate: do not free the image in place while restore I/O is in
>     flight
>   PM: hibernate: drain pending reads in compressed image load errors
>   PM: hibernate: flush icache for restored pages from task context
>
>  kernel/power/snapshot.c |  9 ++-----
>  kernel/power/swap.c     | 55 +++++++++++++++++++++++++++++++++++------
>  2 files changed, 50 insertions(+), 14 deletions(-)
>
> --

Sashiko is complaining about the last patch in this series:

https://sashiko.dev/#/patchset/20261002034200.920546-1-xiongxin%40kylinos.c=
n

Please address the issue flagged by it or let me know if that is not a
real problem.

In either case, please send the series once again.
