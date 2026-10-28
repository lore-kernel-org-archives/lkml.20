Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793228190;
	b=z/0IUwfDaCd2l7xMIVwqdzUeshIKZaFHB4YFuVDLzqTcKpHjk+Zg/GkR4/uECVMuz+Le
	 pZANdDDsToZoyIYZMaj/JNa+HMHk+7+T2dm4z2dyXuefbqNctip8GUhMJl2r6994tC3+J
	 RqtEjpzbseQGsdM5dVyvAmgEChuKQ9LZsj902zwbc2gzqgf1Lw0E/SvDNohe6mYb74zwW
	 sz6UlE4HgCq/eU0Zv2V1q+bMrFnL75Q0zrQWEpH0wdfhw3NAacWCUZeHIcccIkvMdGLNz
	 /VZ37Xls4XAXeNNJbdV/vZi+HSH9XFoVA8WYIEIJIDPRJNW8I4oXg/AtUcV3jjWZCUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
	b=g8jNyQvEUKSp3yoKfTIyI3EXj8ewF6XFDcGwBD5jdGECXywQCSzc87klFX0JKsxqfliw
	 +DT4GocpdL+jXaBGgdqSLTYVAMlTB1nzPPwkIWPQEzyHqE8hSdDcsYGEQUns0S1H6tm5q
	 UjZg70CZO1E8aAhdu5baxyqY/ic6Mi+X2yUFUwjAVUqC9quEXIsqc4N3sZ5AhpFH7u27b
	 6cYtJhYg342k6FqdVQ4y5+Q62vz6OJfCW9CGBq4RLSqhTCb6ZumMW3rO9jehZ2TKkmSF6
	 ZU4ESfnFXH0g1yh8DK7AdlCBnPo83KNjw9drFFn8qKE1K6uqSlYm3Vd0Qo2wOKv+uuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AD9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AD9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bZOSlVJG
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso1507694e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793228183; cv=none;
        d=google.com; s=arc-20260327;
        b=c5R9/nFwr9aPgM6ICVCjeZyaew68VQ1z1pgjz51q+uzCvaf7dYL+bgrlIuaHAU7Cit
         mmr1pQCmLjSY8/e1TOAYm9AG4oivhfPAeFDIc7NMooHHKtpubmqz+a0fH0XACRx5h68n
         7yoNKMONvRoOpQm1ENQygtPnIcCBuMTkJlE4flSzn9wXfM247Ykxn2hAkfV+XDAjEKb4
         LaJmXylumIbZUrt5lC5+ynhYF52s9Ngog5+aojamtmvz4y8+TqS6zyQ2IWHoG8m5ywxo
         eBF/fzw17tVHAq3EhdvIdbdsWZcWpLTh4gFXQZSl+HbtverHYX0XooMQrF7GO2E6XLVz
         YYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        fh=yVgI1I+R/RgQ0FeCNgBmb2VES9GKAcABXPEbS065M5c=;
        b=FBCYXqAWIXCIHgWT2+3THUmBxrBiEle55ZMmj8VZw0CnkYoLtKdblgCZU1B9Vx1Aj6
         et6BtmbuCIskW3zbKrsVZ6bgMBBshmaLmY2EgJSVlE8x4jtTt809KXyX4T6z40efGOFs
         683wQg6rA21bRJHIM19XXnBAiBfU5rLn75Lh0Y3UkFUxJIB79NdKxDKTiRbDyTS4DbeC
         Z3cYuoF5vb/MC46hex4W984w78fHsx1X8bKgvSyplYG9BxcqyrqhkKnrJw6PJHJ3nzBt
         IWK1zp4PzZ3HJXBvkaRAu8/WY14r7l97XqcWt2mwN+AjniiIbhmmY3AmGtqYAw72Ni0W
         M6Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793228183; x=1793832983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=bZOSlVJGtHEYwYd8P/JXTJGc0heKbmZ4zF6gCQsfAWUdj+V8lveZo37a35kI44zsZG
         8r9p4GP3JXlJVRf/lRQCeD7DpNu+EpwjtNRy8B/mAQWg4VrhYeyQL+tDoFWr1hQ8Js/1
         WmBu61FcofxUa9iC2o9+OqMJhIY2ZxGCvswPzn8Prxv7xx3PhcvCqjngxpEz26C3Zh5+
         QCDR/cnpyszjYnYa+NJ3GR//R0d+Eo5+XTYFDLb2ivFHUdLHCDDXia/PshsMR6SOBMAE
         M4o+rVXHudqK4Y3GjiNjn4cOkyeetgJTVfYAYDZGmr6blu+DiQE+KChOyTySu65qfvrn
         wIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228183; x=1793832983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0MpBzACJCm623um40rfrBkC0GCIrNAzwGLFIF9vVVM=;
        b=0UIiGPz56pOm1bsP8QvdWEzG6CeTfSxu2/DIYOtC/tBjf6u7UxL2gmzPYlgbAnJ5FI
         ll7yq1GSr4MymNI38/m7EChaySzxJu+i3o9En6F+p8v7H//PHjkZtX61PfA7y3AeBOMc
         zqx2wt+RazJdZ5LrfYxsem086AsOI8wmFlYtTmwyJRle5YnHy/c13mlByA0xvDTnhL9x
         5tDMnB3sTf0dysRkAuHyZYRwg9dnPSJaZqwrBBAeoD/E/ealLv/wYblYTuvQUcJGnS01
         Pe8CbB4LLyvhgNnnPEsIIQgk+87mzViAy50Mb+AH4fP+ZQRJ+xeey6qSCwcgFJ6279lW
         8cLA==
X-Forwarded-Encrypted: i=1; AKwUvBzawR4DksJGnsNgQD9z/zRzfOm64F7ttMhyjC0oUVnyOAg0I0+mMmdc9VKOCypfK92cbGMDPVOjEuDqz2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCfTffhLqdvxk86UeCRydLfRTzMu509jxgz9y/LVyKMbg5oQex
	d0X8jg0RcoJ3EwsAPtuaEdibUVq5MEeqEbID9YldM5Mm4fP639JNdv73RdRMaUsV9JYHLYwcI2e
	+MKBHDm5icRSp8xHEHNBDNUOtf8trec0PVwgUwlyR
X-Gm-Gg: AYBFou1vLp+brmhM5VVTGEXsaFOnIK111CdzQr4+oxUH2p4zxnmXZsDqE8ZOH/fzEGJ
	Lnse3gfYuOq8+riar21LEuYMO5S3HCQshLblj9LXUQaVcIA9CTbiZCVGQwPJExXfxlQIirzbh6R
	1ZixuAgVvdZ86JGb7Evorgqn7iP6W6yqCWZTV0ztW5Ijk6SHj2gRZNMDXwi7yul24Ay7gF4b/Nw
	Cjc+vlPZQrVvnGGFdPuES7xam/ka+kBGW7Qon3NMnv+lFCuOCXGuXFRTiCtnA2HdDNuZ9pP2gkS
	qFF+HMkNPXXzzHS4O9qvvTsGsgxAgo2a2qL2nzcdqjpPiIVIyRrNXKHTEB3gjX3d8Lf8AKcJ0p1
	+7NKo+uL3OmAKiCibN2QQaFuZ3JzFsz55q5ra1w==
X-Received: by 2002:a05:6512:3e19:b0:5bf:c239:71ad with SMTP id
 2adb3069b0e04-5bfcad69127mr1282221e87.38.1793228183136; Wed, 28 Oct 2026
 15:56:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com>
In-Reply-To: <20261028221705.3915340-1-halg@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 28 Oct 2026 15:56:11 -0700
X-Gm-Features: AclHuK_P2NrO86m_OPGwNSCuxqmiVp7fbTt4tlVfFApQPbneLnvcqCjpUTpk6N8
Message-ID: <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 3:18=E2=80=AFPM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> When an unprivileged process creates a new user namespace, it is granted
> a full set of capabilities (CAP_FULL_SET) scoped to that namespace.
> While these capabilities are isolated to the namespace, they allow
> unprivileged local users to reach deep kernel subsystems (most notably
> networking configuration and raw sockets via CAP_NET_ADMIN and
> CAP_NET_RAW) that historically assumed a trusted caller and have
> accounted for a large share of local privilege escalation
> vulnerabilities.
>
> Many workloads and sandboxes use unprivileged user namespaces strictly
> for basic UID/GID, mount, PID, or network isolation and never need
> high-risk capabilities like CAP_NET_ADMIN or CAP_NET_RAW. Likewise,
> system administrators often want a host-wide policy ceiling restricting
> which capabilities unprivileged user namespaces may acquire, without
> disabling unprivileged user namespaces altogether.
>
> Prior work by Jonathan Calmels [1] proposed addressing this via a sixth
> per-thread capability set (cap_userns) alongside a global sysctl mask.
> During that discussion [1, 2], feedback (e.g. from Casey Schaufler)
> suggested that rather than adding another per-thread capability set and
> prctl() interface, capability restrictions could be integrated directly
> into struct user_namespace and configured via clone3(). At the same
> time, as noted in [1], a clone3() flag alone is not sufficient for
> administrators who need to enforce a host-wide ceiling on unprivileged
> user namespaces without modifying every userspace callsite.
>
> This series combines both pieces of feedback: it embeds a capability
> bounding set (cap_bset) directly into struct user_namespace, reusing
> the existing task cap_bset, cap_permitted, and cap_effective sets on
> namespace entry, and provides both a system-wide sysctl ceiling for
> unprivileged user namespaces and a CLONE_NEWUSER_BSET flag for
> voluntary per-namespace restriction via clone3().

Why should the task's cap masks affect this?  *Maybe* cap_bset makes
sense, but I'm struggling a bit to see why cap_permitted and
cap_effective should matter.

Also, I think that Docker in non-userns mode restricts cap_bset, and
the purpose of that restriction is rather at odds with interpreting it
as a restriction on newly created user namespaces for purposes of
vulnerability mitigation.

>
> In addition, because restricting CAP_NET_ADMIN at user namespace
> creation time prevents userspace from bringing up the loopback
> interface in new network namespaces, the series first introduces
> an opt-in flag to automatically enable loopback on network namespace
> creation:
>
> 1. Opt-in loopback activation on netns creation (Patch 1)
>
>   New network namespaces start with the loopback interface (lo) DOWN by
>   default, requiring CAP_NET_ADMIN over the owning user namespace to
>   bring it up. To block external network access while preserving
>   localhost networking, sandboxes commonly create an isolated network
>   namespace with only the loopback interface enabled.
>

The whole unshare/clone flag situation is getting out of hand, IMO.
And this new thing makes logical sense but is really about reducing
exposure.

Perhaps we should instead have a small list associated with a userns
(extensible in the future) of things that the ns's admin (i.e. whoever
has CAP_SYS_ADMIN relative to the ns) may do.  That list could
include:

- Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
no obvious reason to separate them)
- Create tun/tap interfaces in that ns (and attach them, etc)

And add a very simple new API to do these things.  Actually, the
tun/tap could just use the normal mechanism.

Thoughts?

--=20
Andy Lutomirski
AMA Capital Management, LLC
