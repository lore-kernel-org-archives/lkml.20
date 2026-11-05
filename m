Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897102;
	b=RO55BLf80Ws/WhNiroPY1wFQz7wEYpDCIoeodjs411OaOTQu6jtH/0ds8JevJIPwcAks
	 GmILpKeTPzotcq+7R6Tx2m3NVByUEKhaf3ZX4sWtp5qXWoI6w/qOkOfw9Zn6ZxAXafH1+
	 5HA9E6AYoq3yEgXG/bCW8xDiKmNf38O20SKa/ink+MHmDPwGrifeAJnVt/oe6aQyqj+nn
	 cgTQ55Vkkoe1TSjoUWau6lYl35R+sekhGLcZ/bVJ9c4xh+MJh2wopu8R76vb+7uqahF8w
	 s4x0eR/t23WZKDdKceWkQ3SO2TGXbCsRDHvE0wxzrBecgYykXJI1FXDCQXE1+3Eh3JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wdYtPMhw6iQb9Bu4pea/weFH8wbGNUV9dgjmliA9Fu4=;
	b=Ko0umcrPNcMPF6ZafbkLSDSzB56p2QahTbQ4rVQuc84vecefKCUSAU0wbPG1Tw0cDy3k
	 VC8HNPx24jjuUvi/BNFhOuvyRko+sEj2KeJvKuzXaYs1rCwc6ze6rYIvAGw++ZVxzlPoe
	 AJHul3zXUXPD87Btp9SrmRk6gtgClISal+K2BvPFaHXVrHAxfKmFq5nOwFSWMHlsHvuaH
	 pFxfVqMsmoNvLh8BXkC4Tzy6kuPZYMkN8RzmxdnUCCO9tg7CBKzWtKk3BnGceGTF2hnJg
	 u2WiMUWMIPD0Fw7uWe7IHx/b9scDlCntV3ZQutVYaXMXKZ4wgc5mxni4xOyIlxVjBKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GeWQn8+z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526A606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3526A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GeWQn8+z
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9f6a16afcso70435ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:45:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897101; cv=none;
        d=google.com; s=arc-20260327;
        b=Wu/HvvNAXaw5WIHBxxW08gihPC0iiCnm4jSkqKkrTmIAFD4uPnpwMnYgFT1cBn5MG3
         xrjvP0Kq+j7OXqRlPeCN26D8oyaM1HDGMAsj9WG4UYwr1RySRco9BNqC6ED33z4OtKxO
         RCNYpyDqEag07SgDLakS7ZR/DBXij62dqOOaOP9TKZzMXANfnNRw3LzFPVJPNm29lUkh
         k00kSi/C2ul0hs/NrfBjvuNSh16ZAfCYFu7bxLzcuRXH1PzDOLW40EkNuZEKUw+B4VyH
         jr1iI3VSREsp37PfsTnLYdwy//3dptuUqWHUGNwNEXQmqF/ag6Sb5o7ER8q3yZPGa/53
         a3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdYtPMhw6iQb9Bu4pea/weFH8wbGNUV9dgjmliA9Fu4=;
        fh=WsNJXEzcnUjFEeFD3eymHQcz/7JgGKYyWgOPN2NGrEk=;
        b=V1Ssv+lV5DAFo/gUUrKm741D/Y3oVi+4TPqkWoKFOcvoip2BZNftjapSTdOW5p51JC
         H7up4AKjS4n5StARstlk2epcX9aT9bJWKz2aBeIUP2Irlac4KVi4jgVTwVKZE9wU5DVi
         5eTsPcq42rXK0kXltjMvcGiqAauZuuNoG0tXirJH/zUHNGYzbz75Q0BwxtINN36GpydL
         WDZvh1cdzBrtOCzv9HD9rPfaFh/b3yKrpWG/V2l6UPLdMKiQvdQJ6urROG2sfjt1+QTx
         sPT0ExJqceR5vFmU+XkRN0i9DqoWNBWg+bs1eXMalWw1KcwMVt23Su0CAQ/f8NOad/dV
         YZ8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793897101; x=1794501901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdYtPMhw6iQb9Bu4pea/weFH8wbGNUV9dgjmliA9Fu4=;
        b=GeWQn8+zTCHvUtarI8ppl7DxE2DxVhnh3Q3uJMcuo811/kyKqNIvbJWgM44d/Z1jcF
         uxmZ4HtlFK3aSnR0TpKMlENeCTJ66Vj86SOJ0/Fdfh8t1Cj7stI7bnd17Zvp3zgU+34M
         bzAZN7oAmeii/J8KUcDC/yM25/Sbdl7PX+ToYXi5fBWmc3IFwetmuW3nrnkHhPSIrke7
         JMadU+uRc/vwrPc410zSBHmfVbJPQ8+Y7/0vOIJcm6g+X7vLsHIE7B3bIW/RS538Hi3A
         MbXbLOH0GrIrlZHra2msMNU/Bx1iAwPKcy2ZsFUi7kZl5+78lIcdmYBOerALR38eOCI8
         4SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897101; x=1794501901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdYtPMhw6iQb9Bu4pea/weFH8wbGNUV9dgjmliA9Fu4=;
        b=I5KVYoYSA6Lao9gr5cq6wJwhnmfvPZFK87Hov6HOL8nURCgwfw77XxwpK2c4MyfUwE
         WL4fTrlL49a5csCziW1pKKPHYLGQSeg8Vf5biWRC1ekYgVpeeZedvoA7NZ2BXwBTCG55
         PaK37162Kb5xdfRopyM5iB5yMCfc0/FxPF0HmTSksLKapEO/1qQi85/96i3e45BCWkBd
         Y8QDN7OYxVomsIVUpzhb7sbRP0oq9qs5AFk/fECnsf6dsXM5xjLUF9X7+TUK0dU/0gZ9
         bqQp2YNB0GLAflx/LzyEIfNBGCvriGtNHQZjbSG5csr+c9IRfhSIk6HTDnvtSunAzOIa
         hOSg==
X-Forwarded-Encrypted: i=1; AKwUvBzCYdBDKwN9EIy5P8c6cZts5xtDtHZ5ZrG26LQh3+4ZcqQ+GZZGmgGdGQ6LFVNMcHSReDTCXCyz1JldkEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pooXAJH9X25Ag/+jnAeqM9ChkZQScTwPI9lo3pgsXjzWoqgAo
	a+8ZRM2vxXjK5DRyKQ/3P/qCFaZ85xbObK/QZyVsoBzRu2tGE+1ttGBG1P/ubFSG0CTkr8FX1Kp
	LaamKhZcj/jGRN2xU2TsTniMBWR1Qbg1I1Xyt3f5KjwbmwfSxx0i+N6OO
X-Gm-Gg: AYBFou2iMDukM0zj/OC0RJIhAqvwG2yE2FZAoSstfMcAYUBx0aeYFuZBJE23zMvl8de
	rlYegPo47fts4+4tL+YMB36clktAmNPDyejZXGgC1fkmpwWxYFeOHFdfSxOcCMYRchEKoj4ED55
	kKTB7/Uk/TDWSSztDaB94R9c1WwnMXnwIBXc++LpswuZsj4h0NBy3mcBQrMYXuA3cT2lUqQl9fi
	dCAKFfkbfZo8lWCxhQntL3yPw81LSx4WqzZaQfuJ8KJFa/TaE0giLaQJFY1mlRthlwbkC2ZYSfO
	LjzoWzE78XybCFlEJJtlZwa2BKSm0m2i490iS7cXpB77dKKeNqFcBp54nWp7AsaUJKFbjVABU09
	4y1Ujjo4lWU87hIG/VLB/RdXDRnJhqT0aYP4JwaF5CeVrvbSl3CLg1pGWBj2CGazhzm8T39/70y
	1qQ8TGzYGeDvCq1G5UyNzNYaA=
X-Received: by 2002:a17:903:26c5:b0:2e6:344:7bb4 with SMTP id
 d9443c01a7336-2ed27dfcd4cmr5295155ad.11.1793897100818; Thu, 05 Nov 2026
 08:45:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-19-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-19-59422ed3e465@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 17:44:23 +0100
X-Gm-Features: AclHuK-fnefOFLp1bzMgat_Ywl30iLttA2NtTvDkjZ9zj3bJEHqA_bwaqAGV1Yw
Message-ID: <CAG48ez2XEE+U4iyhxB6b2Zm88Mj6a36iQX1=X6NyJtB4o6hJ6Q@mail.gmail.com>
Subject: Re: [PATCH RFC 19/38] proc: resume readdir after the last name it returned
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:26=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> proc_readdir_de() counts the entries of a directory and resumes a
> listing at the number getdents64() stopped at. The entries are sorted
> by name, so one that is added or removed in between shifts everything
> behind it by one. Listing /proc/net/dev_snmp6 with a buffer that holds
> ".", ".." and "lo" and adding a device whose name sorts before "lo"
> makes the next call return "lo" a second time. Removing one that sorted
> before the position makes the next call skip an entry instead.
>
> Since commit 895b4c0c79b0 ("fs/proc: fix uaf in proc_readdir_de()") an
> entry that is removed while it is being emitted also ends the listing
> right there. pde_subdir_next() finds nothing after an erased entry, so
> proc_readdir_de() reports the end of the directory and the next call
> resumes by number, skipping another entry. For /proc itself
> proc_root_readdir() takes that as the end of the static entries and
> moves on to the pids, so the rest of the static entries is missing.
> And if the position is behind the last entry when a call starts
> proc_readdir_de() returns 0, so /proc then lists no pids at all.
>
> So remember the name of the last entry a call emitted in the file and
> resume at the first entry after it, like kernfs resumes after the node
> it stopped at. An entry that was removed while it was emitted is
> continued after by its name as well. If the position was moved by a
> seek in between the listing counts from the start like before.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: 895b4c0c79b0 ("fs/proc: fix uaf in proc_readdir_de()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>

> +static void proc_dir_cursor_set(struct file *file, struct proc_dir_entry=
 *de,
> +                               loff_t pos)
> +{
> +       struct proc_dir_cursor *cursor =3D file->private_data;
> +
> +       if (!cursor) {
> +               cursor =3D kmalloc(sizeof(*cursor), GFP_KERNEL);
> +               if (!cursor)
> +                       return;

(For both this and the proc_sys version, you could instead do the
cursor allocation at the start of readdir() so that you can return a
proper error if it fails, but I guess it doesn't really matter and
that would complicate the code a bit more...)


> +               file->private_data =3D cursor;
> +       }
> +       cursor->pos =3D pos;
> +       cursor->len =3D de->namelen;
> +       memcpy(cursor->name, de->name, de->namelen);
> +}
