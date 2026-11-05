Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893025;
	b=c7y3/WKmDxo/Ew7iwCzaHD944WF/st3ulRF2N52E1l1IiXwcbTap5j7zxKIOYMF/hUFP
	 el1GPy5y72qcWxSNm+syYJeGSvnoGckR0SYoh14H9gw17oLIXRqYh9MOweQzyKWtMEJPb
	 1CFz8AGa1Z5lB0OiiPeaAtZpk0Mw8xOkCR8iU85ZHt61XicvnrmRCQYo5bWzj0wBMFbEW
	 ajnms1yXa9q2VSebSv/CRKM4d6o1LZ/rM9h0kMWIGvnTqly96tJXCKByYwLFNII33lyzl
	 X6OuwNqifHaM02Ltck+llEYdwpoMGNseS3aZk/BFjzAYotzsg7qr6EoP/xWgY8su74g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kvailjwqfOmhbJJjcy8TbvowePxzON+06QO6Up9gGT0=;
	b=bn/qxkZx4n7Tix7Jb46MoXGZf6npPS5/izax5bHz3V6e6J4fO4+vXmXpqXjaJar21PpD
	 tZBTTJ2pHVWeEhyPnS86g8ijwzVifRCFUvlGeQhijjpr3L3fdzMhCLhz+Rda9RRP7iQgA
	 6OeZw98a4n2GEvLIzOFa7+EJeQ1Pyfe6gm+cdmH6IitoErEH0jF/fwPbT0zgQoSjND/0U
	 KrAJXHge4nUbB1okU32+wfvkaqOiNCSXjig/lckhHqXVxprqsVEd11zPOFo5FLHTQTcpX
	 D4etdC3i6njdX8g0p2wXhRpwjCGDyuD5nhhzS9oRIMnZK4xr6FDqE4d8gDubEjLn2cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Gxle+Ke/";
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46734606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46734606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gxle+Ke/
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c42394d1e41so217500166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793893024; x=1794497824; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvailjwqfOmhbJJjcy8TbvowePxzON+06QO6Up9gGT0=;
        b=Gxle+Ke/ft0qPJDBX0JQWzA1ZLmQgVZzBrWyEVoNZxTcMrrajfo1O4ASCBG23EIcjq
         cUy28QM3QPVKkqYviAKt4UuDyzpJABmNQR4JRuUY/9J9Hkfes1ObSbTFJBTMv0xgyn36
         I605vsADiFHcxXf4eX61I0j4Gi+kKyS6oNG5NvaDGMqTtAbtArrAfHjtJRgz0KAQXT73
         KzZfmQgJwuEWSDCZ0Dz1NtIeuRDvR+OePZg4x0U3S37xPzoaWN3MauXtR0KYCrK+pAhq
         rsIk4Yf8fmIvbb2p7AhpUlOpetxQvv3G4Qgr9XZcKOy2pWy+dVo2136CYJcH164SwW/n
         pIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893024; x=1794497824;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvailjwqfOmhbJJjcy8TbvowePxzON+06QO6Up9gGT0=;
        b=CB1bF9HfibVKCES0peRxFAwU+y+KDv5LOFAzjHp9hFLe+jvUDH3hRbK2rVCcO6gxln
         byGytRGeL1nKk+3Z4vWTTUG9pGbUwCr82AYBqRZeTKHm+vWe2Nt+SOMzEbV+Tgoov8wu
         Alz2RF6BcRqdvQ5uaho1isha4kYONinNwZpi4JQBdpj8Xk65yMh3uf3n1O9h/r69sSky
         gx/6tq2Ep/UDECW9DHYf/sr8qzEJ+ytGdIPOqTsAv71s09EfkiJkaDBbBM+WYEkHDhJn
         8mVV6JonEPpXC5gkxSDEECrD2Qgrt1tLu9DBOyD38KrTn/Htmz2ikJEyPqBCnY7AXRm8
         zY8g==
X-Forwarded-Encrypted: i=1; AKwUvByRRlMX5sECJG6BoATK9fVpfoYSj/0+R5U/R8YI+dJ+P8KJhex1uYMt0igLSMWxuEjTlmmdGJHS7/xKviE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NJfXvwND/2LtZsOBA79v5RLq/HvI8sLPEgZHb1ZOiOLwdyLtC
	N2+kaEhGnMlFI5VOHYBxwQc4pC1YHlpRMGOeb1m7n2FgbL8OQfqZ4z5rEogMuZEjs+YfqeRJXg=
	=
X-Received: from ejcwz8-n2.prod.google.com ([2002:a17:907:b048:20b0:c4d:23d9:b0d9])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:cb88:b0:c26:19e3:e98d
 with SMTP id a640c23a62f3a-c4ca7af17a5mr1750569566b.45.1793893023363; Thu, 05
 Nov 2026 07:37:03 -0800 (PST)
Date: Thu, 5 Nov 2026 15:37:02 +0000
In-Reply-To: <aunVmg42/S2uUDWR@hallyn.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <aunVmg42/S2uUDWR@hallyn.com>
Message-ID: <auyink594bxptAPN@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 03, 2026 at 06:37:46AM -0600, Serge E. Hallyn wrote:
> Generally, if I, or some users I support, need to use unprivileged containers
> or user namespaces, then when an 0day comes along, I can hopefully trust them
> not to exploit it.  The biggest danger comes from the fact that, right now, if
> they can use them, anyone can.  So if someone can trigger some other code running
> as user nginx or something, that can become a root vector.
> 
> So what if we had a built-in feature or LSM which implemented a credential based
> whitelist, entered at firstboot?  Something like
> 
> ```
> # Default deny
> uid == 1000  # approved
> 1005 < uid < 1010  # approved
> gid == 1005
> security_label = lxc_user_t  # Not sure how far we want to go with this
> tty # must have a session
> ```
> 
> Now, if you want to use user namespaces for generic sandboxes for all
> users, e.g. to confine browser activity or nginx modules, then this model
> may not fit.  Or rather, it might need a few tweaks.

Thanks for taking a look and sharing the credential-based allowlist.

The latter scenario (generic sandboxes for all users) is actually the
primary use case that I'm targeting. I want to allow unprivileged users to
create user namespaces, e.g. for sandboxing, but without granting them
security-sensitive network capabilities (CAP_NET_ADMIN/CAP_NET_RAW) when
they are not strictly needed, given the historically high risk of local
privilege escalation associated with them.

The two approaches target complementary layers of the problem. A credential
allowlist at creation time controls who can create a user namespace, while
this patch series controls what capabilities are available inside that
namespace (and its descendants) once it is created.

Gating creation works well when there is a clear boundary between trusted
and untrusted users. However, in a multi-tenant environment (like a large
container fleet), we generally treat workloads as untrusted by default.
Because we still want to allow these untrusted workloads to use unprivileged
user namespaces for sandboxing, it is essential to keep the attack surface
small and follow the principle of least privilege whenever possible.

More specifically, this patch series enables that model of safe sandboxing
across three key use cases:

1. Configurable capability stripping: Administrators can enable unprivileged
   user namespaces for all users to support sandboxing, but configure the
   system to strip CAP_NET_ADMIN and CAP_NET_RAW by default in new user
   namespaces created by unprivileged users. Basic sandboxing rarely needs
   these (except to bring up loopback, which Patch 1 addresses via
   CLONE_NEWNET_LOOPBACK).

   The per-namespace bounding set can enforce this either globally via the
   sysctl, or explicitly via clone3() at the container manager level. This
   restriction is monotonic and persists down the namespace hierarchy.

2. Selectively granting CAP_NET_ADMIN: Some containerized workloads
   legitimately need CAP_NET_ADMIN to configure advanced networking for
   sub-containers. Because an unprivileged creator's child namespace is
   bounded by:

     parent_bset & (sysctl_ceiling | creator_effective)

   a container that is explicitly granted CAP_NET_ADMIN in its own user
   namespace automatically propagates that capability into the bounding
   set of any child namespace it creates (unless it is explicitly
   dropped).

3. Dropping capabilities for nested namespaces: If a container with
   CAP_NET_ADMIN needs to spawn an inner user namespace to run untrusted
   code in a nested sandbox, it can use CLONE_NEWUSER_BSET to voluntarily
   drop CAP_NET_ADMIN from the inner namespace's bounding set. This
   guarantees the nested sandbox cannot access the capability and the
   restriction persists for all further descendants.

As a quick clarification on how this interacts with the hierarchy: the
bounding set restricts tasks inside the namespace and parent tasks
relying purely on the parent-ownership check. It does not restrict
tasks in an ancestor userns that inherently hold the capability.
Therefore, in the nested sandbox scenario above (#3), the parent
container with CAP_NET_ADMIN can still configure the sandbox's network
from the outside (by using setns() to enter the nested netns directly)
even though CAP_NET_ADMIN is stripped inside the sandbox userns.

