Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AD43FD0B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424480; cv=pass; b=BoXAafbtx/6mJoOAORBbStCiDzJ1FzxO08DgAvhxl+hnsdf+KGo1m07BCeSWSNJMcIfOw2waVI4A3Rbmpo1W+TgxLCJhKImrQLB9Vv73ZJXE+oRMEG+vipFhk4PioZAbncz/quwlBq7jUFwuvfY//oxvSmOzEJ9oAqLF7DWRANc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424480; c=relaxed/simple;
	bh=etd187TpI0PP1zkb6tbrAxzEXe26dhX7HU1+umSCHVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6DfwgkhAa+4M1sM4/BB1QEY3yKLddABXUYyQX4ht+MUQYztDY5CpmEgVzYCrVh7oNvouiOnTY2vx0wD2vWWYlFvkQmOhlkbAQeU23UJvP59bO9JkRT4a2aivoQTTwZfGiFrp4Llkt7VZxO+n/3Xk7Cqq079JeDlPNe+Aekx1+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2ijmpn6; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2ijmpn6"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3332541a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788424476; cv=none;
        d=google.com; s=arc-20260327;
        b=ARqdxoyyVKgy5LbXYa7sCl72ylCRmzqzpJ0arw3roamNuhRL1f6lUu63uurevF0urV
         ArTfqNxjtmozjivhuGMS8WFoY+WfT/wvi82Zqpd4a26731Bb5roHLK0DowOklBE4qHy5
         keh/479/H/AykdoqsaldEr/gpTYVL+fi5W8loaYX/J91/pDZS1ZAIBWYvmcpq6wtT2Nm
         gl1N6GFNeU87lQrnb6ByKymGPZd/3R1dAEFZZ3fx8spp2KwcJ2AAbqU7SF0E0SiNzlo4
         6iN8nvXaYbbprxraWV8047F7SXqoLKYZkhunWCo7JDi3YGCrO9twgXnvXd+d8mUXIbAs
         Ffxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dolvj6C6tALOBaQBqhpP7VTgcMtPNpSrLqCXlLOQM/k=;
        fh=1OM/MVIlsLbQIBECEwuGb5vAOEp1EWltyfDnyvQZKZU=;
        b=XwQYo9u06harp0/lZkC5i3h8QzL8dmGuGEvW4ATjD5fXd9DIda64zSnanrudvq7UGg
         RQcbQSNy56VmlVTwPyj25V7Hh4JsLNfN0MTqccFFUhrjGBwoQCg4Znxhz3WGUt+CITaz
         /h5YQqBDo9oh+SntuELtn4bcli6D4qTTQ6604JeXWGYYuDRZZaLiCWVQ0SZmPH7SNUbm
         OwmbmGfcVFgKAj3qGz9n53XOr1KS6ecm76Rm60ZN2Sbew8lJJIjZYtf6wDo0lcVBbOuA
         kgBjjZFf5g3E/7GlROdK7UTybMQaBqDYd0GZC8qNW1S8fCryO2zC+L3C6LzA2RVlztjJ
         Jb1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424476; x=1789029276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dolvj6C6tALOBaQBqhpP7VTgcMtPNpSrLqCXlLOQM/k=;
        b=S2ijmpn6XQlC1B61kQMoEx+4+WWnDwtAbnhEpJkai1nvl8VGvjaoTkJonykVgDVuNI
         ec0ufjDQNuaycu20mqKmutMsJUmf9h60aE8Y/rLirnaRVQoDCaG1Nzkyp+J2Ay7qUJQz
         QZFzHGGqTqTrG/8Xx/ElHMp4EUNOE2Rfmx7sImA8ET6GgRD1P6zJ73iogLBd4JnOUHvO
         pNNXuJ0RwC0NOX0wW8ZUXfWWCCLfYlS6Gpnp+fyH4Irn0vgv1FHolPBjrtEr7dhmskJx
         Eec1M0QcXO24OpjU62X0vFd0wj0OcDK0nZSWQ1VQuhztnLxEeh/Rcaind98VDX7xxwvh
         QEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424476; x=1789029276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dolvj6C6tALOBaQBqhpP7VTgcMtPNpSrLqCXlLOQM/k=;
        b=IPjzc8x87uB1jtUUsOB869lArxFvc0HNtRaphGHWFnhrD37z/W8HrBreUA8uOGwjpT
         3Vd6nrvnVAi9OiUuzoYNQw/riHAAKiwp5j9d3NqcqbZ/Tq6B89TD9GrkAqG6UbdoqFB9
         TEA5/AUN+RtItoODEwMfQ7JfLMWQcyrG6peilDwmWPhzil/mNhXewqe2GydHp6I2s1s+
         oXH7R35/PCfjSh5FwlPAOeYG8MrWmfl2ftYbVAGwCOH/uoqDAeKSs9c59F+ecqQd0OlY
         hLUDUqfF+u8OeOU93UP1TPjVRJd4iLWR5/cW7aimt9sVHwkMZpuC8D72yRDJhzKLaXot
         Fpog==
X-Forwarded-Encrypted: i=1; AKwUvBwYUt3bxdrCx30dNVG1Sd0FxhVCOoNU8jrGznhcIpjkyfNKSM5z9b3qThsXF/XeUwj8Mo3ytYgIJYKq7QY=@vger.kernel.org
X-Gm-Message-State: AFuF++nOmXiKexYhmshxNEi1zOeunOGEjKAUsMwPLyiBX2KtX1s47EtP
	ui+LMN9QZnD305r84XaKXjmb+W1XxgiIHtqByGRYQmy6owf8bWmc8gayzzHQuHqcg85NkS/fv/o
	5/L1rdvPBGy0oJ99QztkXV52QybDeEs8=
X-Gm-Gg: AYBFou20nuWtim+DB9tSVASuaMpJ1ISkl+Bsm4LJNh4veEG9SrvP+JITNieLb189Bs5
	ERKvg1970lnsEQh+mX/FW+rzonLvfbUcIud5L2Ofy1bhpxq/SomikjraafbtCqXzJZeTmbW21Zj
	qedzT8GhfdFgVTVEWX6X7n5Ae6vxdc0S0JQ2HCJ/5n/XML9VGwg+pCfXe3mYG7gSbRf/m1PYw6c
	2kKPEPf8F2FsLoNXA5bxbu9PRmYEjxdJTN9QsKpTV3ko5trciBLR+hVTv++JOsxUWCu0EjpZi3B
	JzIrvzHZ57tM8IDHEZGSHXSRsWW1oi1TKITOjAfaBtPWdw==
X-Received: by 2002:a05:6402:218a:b0:6a5:f912:b092 with SMTP id
 4fb4d7f45d1cf-6a68257bd75mr7434639a12.6.1788424475997; Thu, 03 Sep 2026
 01:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903033359.1042529-1-cui.tao@linux.dev>
In-Reply-To: <20260903033359.1042529-1-cui.tao@linux.dev>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 3 Sep 2026 10:34:24 +0200
X-Gm-Features: AcwNN1XgB3axVosVAZNnl8gVMfhfG0JIK2RYjsYKflkRqfw1XG5URS6oXQXwP0Y
Message-ID: <CAOQ4uxgyPhJQueqUJuwS8=4wGxTAC1Nhy+gfFxrEfaL5A5-EOw@mail.gmail.com>
Subject: Re: [PATCH] overlayfs.rst: document cross-layer file lock and lease semantics
To: Tao Cui <cui.tao@linux.dev>
Cc: linux-unionfs@vger.kernel.org, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brauner@kernel.org, jlayton@kernel.org, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:34=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> Locks and leases taken through an overlay attach to the overlay inode,
> while opens of the same on-disk file through its real upper/lower path
> operate on the underlying inode.  The two do not conflict, so an
> "exclusive" flock/POSIX/OFD lock or a write lease held via the overlay
> is silently bypassed by anyone reaching the file through the layers
> directly, e.g. backup tools walking a container's upperdir or another
> overlay mount over the same layers.
>
> Locking through the overlay succeeds and appears to work, so the lack
> of mutual exclusion only shows up as data corruption when the two
> sides write concurrently.  Document the semantics, the affected
> scenarios and the recommended practice.
>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  Documentation/filesystems/overlayfs.rst | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/file=
systems/overlayfs.rst
> index 16c35b491dad..546b77e66016 100644
> --- a/Documentation/filesystems/overlayfs.rst
> +++ b/Documentation/filesystems/overlayfs.rst
> @@ -884,6 +884,33 @@ The "-o userxattr" mount option forces overlayfs to =
use the
>  useful for unprivileged mounting of overlayfs.
>
>
> +File locks and leases
> +---------------------
> +
> +File locks (flock, POSIX record locks and OFD locks) and file leases
> +taken on a file through the overlay attach to the overlay inode.  The
> +same on-disk file opened through its real upper or lower path is a
> +different inode object, so locks and leases acquired through one path
> +do not conflict with locks and leases acquired through the other.
> +

Hi Tao,

Thanks for your contribution, but it is not acceptable as it is.

Everything written above may be true, but a document needs to be coherent
and this text was written without regard to the context of the document.

The most relevant context is:

  Changes to underlying filesystems
  ---------------------------------

  Changes to the underlying filesystems while part of a mounted overlay
  filesystem are not allowed.  If the underlying filesystem is changed,
  the behavior of the overlay is undefined, though it will not result in
  a crash or deadlock.

TBH I am not enthusiastic about documenting what may happen
on changes of the underlying layer beyond this statement.

I am fine with clarifying a bit about the lock scope, but not as much
as you did -
keep it to bare minimum which is useful.

Also when writing text in this document you need to use terminology of
the document, for example, "same on-disk file" is incoherent with how
this document refers to underlying layers.

> +An "exclusive" lock or a write lease held by a task that opened the
> +file through the overlay does not prevent another task from acquiring
> +the same lock or opening the file if the latter reaches the file
> +through the underlying layer directly, e.g.:
> +
> +- a tool running outside the container accesses the container's
> +  upperdir/workdir or the image layers below it directly,
> +- a second overlay mount is stacked over the same upperdir,

This is really a disaster setup. I won't even discuss what could go
wrong with sharing an uperdir

> +- the same layers are shared between different overlay mounts.

This is obviously normal so not sure why it is relevant

> +
> +Locks and leases do provide mutual exclusion between tasks that all
> +reach the file through the same overlay mount, and a lease taken
> +through the overlay is broken by opens through that overlay.
> +
> +Do not rely on file locking for mutual exclusion between overlay
> +users and anything that may touch the underlying layers directly.
> +
> +

These two statements are the only ones that seem relevant to me
and I would add them in the context of
"Changes to underlying filesystems" not as a separate section.

Thanks,
Amir.
