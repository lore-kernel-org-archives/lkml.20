Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542CC5218A2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910117; cv=pass; b=Wg8aEZzXsHwMP3Wjcxc8LgKv2w2yCG5FqBTn9JbD+ZAaTvl4mcupaKOTg0INjnfvA7UJgRwN1lW0J8OM1wOd0tCWATDwKi7KKsrKDaJjLH8Jq22YoCUSrd8EqB5lcfhuyzbNt82Sy0aebnKftR+WQyykmJq99wdxHAB3W3QKzZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910117; c=relaxed/simple;
	bh=oNTVqVeErgSHUZj7WSVylb4NA02UV267PrLj1Ev9+JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukRpKrbixjtK2USH5flj5HBA+g5CK6LoGN5F7LoMLGohk2/XTxm4EryVsBKm2DZRmB7PEdXsMhID2kQcM89FhKXtvPJFOGIBhlvdUYbqmmhQQoqAMjRdRW+YjtCnOADHpy4nyoVpV4KmDUI0SZNgqkF20a9PkvIHHan183LqM6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SoX6Uq/n; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SoX6Uq/n"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so22514e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910113; cv=none;
        d=google.com; s=arc-20260327;
        b=Mx1daA5OM63JbJdBKUQiY3gGOgONB5EWscnicUFF6eGzEkxC7G8mdnUCOIDx1ucAhA
         dpOiAfNrn4jZFE+qSAUOSwDk95dr74NediiJ5139HJchO7NlBWcxVM7fg1SzAYh6Zws5
         Zrqhhn3oaXwtVoZTgXM0IwqK4f6KeOp+SwtNaBe88EUTK8IZbDaNfILdOSUpu1lfPRX9
         i/DVCuVzw4GHzMBWJw673JYasXTz5TMoSpCHHWjhNI817hQHvpfgxl1seZpdVznndKmX
         WN65qysuwIbG8hzapcqw+j0/AnuP+SbUMA7jweLDZP7bWoLydSLE/VhD2CZlz+9R1OXM
         D/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        fh=/syacGe5kJK3t8EAXruJ4j8k/OvlrSzo4EJJ2ZuhCts=;
        b=AfdcLY7y/PLqsloRrFnqQzWLRzXHWwVVYc91iRCYrYjQbPZhcr+bWBqbgZI3DA5qsJ
         IHtk8/ageX9vL1eD6abs87EUe1VBHNzG7F8iuD+nIRx/tHW+1i+DKCZtr/gwo6fdnc0o
         xtJ1HMPs2Acgh/pLijvCD+J82mxXEBR2KE8dJ7jj1uCKG2ztNs0ARKtqzGsZgZtfEQah
         kMBIj3x5ZVggO/rgDb+afOjDP7CcWciFWUwcQgRUcKNkGCm1QXB5RPpVxB7bc+H4HDng
         DbSbUEkHzSV8S1+fNBCopK5fR5tHtqP6o3kXdiH8apTR+L/Ria5Oy0vOC20/8H0pKVgp
         5vVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791910113; x=1792514913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        b=SoX6Uq/n1FNhma9qtPeekrjzVla8vSVsrhNziO9Qtbu/p1YHiCL4uf7mVk5EUU8qNE
         aDlftxZdWlOTZ4DD7knj2bKd4jk6UuCRSXs85hjCedWzKVBIspsHbqFCMEtRKu2XfwYA
         TEXHlXqBZ8HRVGqLrSH5oKvxBAKCEoovGWFu2RBePLxhTgzn3Uj4JlMN/GMwaU6D/RUn
         /lq/5NAK55C8trAnmPsOpSrQHSid+uTw3zfager8dJbu/KIp4IX+ZSbYO5/v8Kx+6tE2
         vr+4QuPFgZow79Eoo7Gy9/GaxFO7mcZ1h89n8n+WazM8frkcP7vH7HP+pypb7QdNuTeV
         bO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910113; x=1792514913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Srdy0h2xVrgJc+qNyo08IpLYsropKiqDQUfCZ0IZtLs=;
        b=eIUWwlK8fVMTyvjMnXFgRnBKESLmRQ1cFGfGMOQWnymt5+JXl7HcfdAgAvBF123Zpj
         wp8Zj3g7pVBQwNBsWcH/XrBDGf0VqcBnbNgAmRe7sEho9ZMAhdysZyQfqMYjWswC+CS6
         uT2T3eULSAVEOzlOf4NgfnuYpvSouzqAYvQYnRv0L+QNNXWFMSmXZveuAeVFfPZcfq4I
         l481mpkjEHAz7g1helnDNgoSLYbRWlix/gy+QxoMaO5TUdgYpxD70mNrzw+o6Ei8l4Uk
         s0Taah4Xet4Och8//T179fkkYp5BJ+HKICrZvfU6lcNG/cB7ACv4RaBf+FQevE5Y3bp/
         unzw==
X-Forwarded-Encrypted: i=1; AKwUvBzv72EEbBZEZL85K97AGVIJ7ZU15DVdjdmw88I5ReqBhTvZW3l0KNrRLT84eJqruO0i9yCIxMp6iRidlx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ5kUk77vCdKexyR7QWWABsf+/7BQkoTqRngh85wfnI5cnSNN5
	oXlhlQ8oSbJV84aWq5i/OWsC2RuS3Cev5/oDNfz0t5QGkUuXWneuTNc/Ii93GnPAJhxynuv4cPE
	yh+MTRJS7G2PxrrvZpBgEIH3uU0LIuxMAXJ8Gkv/X
X-Gm-Gg: AYBFou2UYUyF4aAnRm00VeumVr3ZQt+SkFMx2mXa6gI01W+EgRuh28XXl/U8I/KHygt
	lrGiu+uSfqEAFzmCdfIm0g25ufcloGPmHeyOlILcKqPl8vIISsBc0dpsyxqdiyRuN1OSQzP0TtJ
	dqsKi/CEQJWvmrDv7SVRIGlGEyWpz1Udu6oxAhLnexzZZnmfMvycIhIu8EHOPQqw9YIvjSXnC3t
	qbmC6cD3RBUypcetflSj9pfzBqxnYMcEJ/mmBDWFKyGO6jm6/7pYDMCO/BIpuMZsptbEQe+tN4V
	3z1+WjurJ8oVaL141Jl7VHQljMor6Sbj9Z2zX8Q3GKQap3ym7VC6qRVLjkvzC/5xb3eG0oPX3bN
	OJOtXftp8tTB8H7NwbW6FRSezcRUKCrYb0W1+05nxIA==
X-Received: by 2002:ac2:4c50:0:b0:5bc:fbf6:2352 with SMTP id
 2adb3069b0e04-5bcfbf62537mr260722e87.9.1791910112814; Tue, 13 Oct 2026
 09:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b7c2f7d1-40fd-4d83-8ced-5fc27e3be051@rowland.harvard.edu>
 <20261012171609.88273-1-sanglardf@google.com> <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
In-Reply-To: <b819ff38-6916-40e0-b2f3-1b19876971bd@suse.com>
From: Fabien Sanglard <sanglardf@google.com>
Date: Tue, 13 Oct 2026 09:48:21 -0700
X-Gm-Features: AclHuK9FA7yWhRGCICaPBsKXGhTVaayndv9XDXdeDu_su-lMXIp0-gBcubArVJQ
Message-ID: <CAA92w6=OhNYXF_kQFV4tPKa19xdWRkdQbFXaqhdxfqW4N9zMVg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: Emit KOBJ_CHANGE on unbound interface
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My original patch focuses on fixing the silent failure for usbfs
drivers (like ADB). Since other drivers survive a reset without issues
from a user space perspective, I wanted to avoid being disruptive to
unaffected systems.

That said, unifying the behavior upon reset would be elegant. My main
concern is whether some existing udev rules or netlink listeners in
user space might break if we generalize this behavior and start
emitting unexpected CHANGE events for interfaces that successfully
rebound (which already emit UNBIND -> BIND).

But it might be worth "trying". I am unsure what the kernel team
philosophy is in this regard. If you all agree, we could trigger the
KOBJ_CHANGE event unconditionally inside rebind_marked_interfaces()
instead of conditionally inside usb_rebind_intf().

Fab

On Tue, Oct 13, 2026 at 2:35=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 12.10.26 19:16, Fabien Sanglard wrote:
>
> > As a result, userspace clients like adb only see UNBIND and must poll
> > /dev/bus/usb to detect when the interface is ready again. Emit a
> > KOBJ_CHANGE uevent when device_attach() finds no matching driver so
> > userspace is notified that the interface can be reclaimed.
>
> Hi,
>
> why do you want to limit this to that specific case?
> Why not not always tell user space tat a device has
> been reset?
>
>         Regards
>                 Oliver
>
