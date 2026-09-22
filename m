Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A12E7378
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790038104; cv=pass; b=UQU5RptOh3cbr8/Kd4fVf/2K6XzP15D/2PWK/hNurPjkgon+uhNFHsW7KlNgRwOy9aaBT5G5FTUdb3rp0tStj6EZdXpsVfAEvH7OxWogGt/jVmY7WPbSxe2SpqwQD7Eg7RWzyX10/2PYu+wsL1OCibhesWB5OXOWGy2XFkBuKSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790038104; c=relaxed/simple;
	bh=BnrzXWHtRfdiJ3pqOPR5yk4FSFhY+j/DDmjhbz0Pj3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVh2swPHp6dWX3Rs6kjtSSyyXzoFlPRTe+1lWz9TSctX9vlFYXDHimcYzYuUPAl8oHUHWU5UPPsC3aGO6ZzX72obBVI/cHEDjEEZ4g4ZIPUBUee/tO6WSOYcHie3Q94nlOxIFZL2mxeEM7ztLK8KXRCkF/6/eM1BPq5tKHQUzVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J8ZSWqDN; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J8ZSWqDN"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so27483211cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790038102; cv=none;
        d=google.com; s=arc-20260327;
        b=p2xpAjsLTB33EOUIFnwf+3YMsifxBieFGfI7m9BCUm61FBAHcURYFa4lmVh7qFS3sq
         aDPOvvU1xcl7cD8/wKvJkDUTZTn00kwO9bygxCc0gDbcXYIV+AGrEhbP1uBovVsq3L1m
         cORjuU3qePfuR20WcojQ1evHgvoIRCRDvFPTOnnFnVZSxaeept00DPVdXJhUS0MqWDYO
         N2xLTCKnweWPZW0StdrgNhBBX4SPGMDdORTXt5EAYmVuf1+LhUjRP722NJGJioRuyy+D
         cXMir8tgQUFE55gIPf5anu0RoQfNrakjmMzIeNV05JoelgIIM0z0TIDnfnBBB14Slz2u
         Untg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LK+ozKSylFUUvnjcXsMMo9dDb+3ZVbSVsFuxLr9rAA=;
        fh=7HWQxRQMxVvYP40SMPRZAbuwn0NgKGBv7+J3YPl2Ghg=;
        b=AmZa2PxcPHSbsDG7lIvqxAzUicCMwD84YIxEantzgBR9Z52WXd/6FsDJ8XL7AjS7zN
         pB7zIs3QVqD3As4TU6vviVDA2DLSHYlkZ0EvuJH70+FPV5zyAeJSMotPX6V6DpNJCSKy
         8NOexy7N93lRjU+QJZVlwU/BloaPoyMCt7IATdcNjgj/oJB8fHnMm4vJs5vA+toCfAi3
         X1xLYiSBnmxBsBfdS99APcpMSc0Ie4bQSYQyAbzR8mx/vc8jV8J1KXMg7juBpQV7TJ6M
         zD3zhmbQ6YY/8xYmFQe0gbQKrk6VaIyIwxRj2SwDIqF/aBMcZbqfmNHPuFtl/mLDvIdU
         EQhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790038102; x=1790642902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LK+ozKSylFUUvnjcXsMMo9dDb+3ZVbSVsFuxLr9rAA=;
        b=J8ZSWqDNsFwhCuzOtu3NhHQ36LmhGohqELCoJJe7RvR/BuzAmgGAXX9RYZnMZsWO8e
         H9lU1aJKE2W7c68WPoMjZq3msxqZoMxdZwvE/xsv6BBRj5pteb6D8Fmf3WWI295pQ7cb
         EA9VBQAnBcqCBjXnHDz1Mt+4e2MW//jkHRhxsdyV5o++ADfDzmq+V28mNv3lQfQjQ/t/
         zdqU/oGB3RT9oz/JXCkLJoTChZKzqlI27qRlrauomWhkurzIwEVO/jJ05bRN7eCBZcBg
         mvCJMcj/3jF1orwmRABQDiytjxiD7iL+DmLz38gn9VWgpyOxL7msw9e4MBUpJmj76K51
         6IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790038102; x=1790642902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LK+ozKSylFUUvnjcXsMMo9dDb+3ZVbSVsFuxLr9rAA=;
        b=RppKQWyHasvnz35C5aEoNxJsph/oAZrrZlq7y5eqVPKBKQThtMKNV0uaTe88JpyXgE
         EzAkNGUd0DKqmgXIVYRxKziclE3diWVxeERxKdtoXv3V4qN29mGbituBcMlwig7JBBPl
         wterCnyXmOiNRcihisqe76Z3tXQQBHvghX6VrHBV+w6jVLsA4LwybMwuliPCDtK/KIAl
         QWAWumJVw0rJ6/qsrvi6d848ZoT4vcYTWfBExa1MrBm/bVDOXGWmsw3fcDAN2Y1k0bdT
         Ct1Onjw0j53wSXvZMasr4enOHcnmduJzf/BVkwKXPCyfsCj8VRclDsIlDSWxBz3FwzgG
         DycA==
X-Forwarded-Encrypted: i=1; AKwUvBxl2WAXUPNSFtTrDhOdSbZ4Lu9gOIfhKI+5WztZul1tnWTrNTuwiNcEVCSSngOYwH5v+Lr5J9++LoCCioI=@vger.kernel.org
X-Gm-Message-State: AFuF++lEiR530HRhfnskitAva/YR/y75cLxgnwuXtyXc0VVBcwq/59sr
	XBLQbmUnuwYA5r6B3XI0Dg/4ML/OECkJL+zpJLKnRSf+zNnqrgc6yj/q8d3E+Jch4PYtjm4DgAA
	3YEF/Oo+S9379fCmi8nZjB46qz7dSa8lJCeo8RvUt
X-Gm-Gg: AYBFou0nOQ6l23Ga7kFQiq5YEVXkFDoFDPFPYMKY2eBIbTG+3QuhMHifUz8RfSOFzZx
	/sbqVHXGaN6AALLEHeWRwFa/psM//giwVYkFWuK8Id1AQhUg+hmoZsIgY2uCaMA4xO6DBIPJvay
	yvDdMzFG4+ZVj1WmSTzBFcHKJehBc9kVsyEOfRhAjqBvW9TZzLptvowMR8GbGfg4XTqg2Guyt4o
	JFmXaLCtbk8gjL6GVdYSFgQMoxnNATL8F3TK+HFLgfaaGrGPIK/jVbsHyk3+kmqzskjAkc20WXO
	n5h0eefnPoZmS7w9oKI5G4U75uBA6Ths/S2deV7elEX6Uvfp9thehGpC8yPxJSWVKXrQEXAA1pU
	lOMekBvbwZPiQoOR1BZki1qLmyTcSHGd6FwEJFsO1BltsILl27lCsJUuZ/EoTH/ij9DufC+LArw
	5CVksv
X-Received: by 2002:ac8:5cc7:0:b0:530:e8e6:bb67 with SMTP id
 d75a77b69052e-532d8e6e2acmr32479001cf.59.1790038101714; Mon, 21 Sep 2026
 17:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260916050144epcas5p3f7d6a44556baabd24027af8f4bce7893@epcas5p3.samsung.com>
 <20260916050255.1379192-1-irlanki.s@samsung.com> <20260921152604.2df7daaf@kernel.org>
In-Reply-To: <20260921152604.2df7daaf@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 02:48:10 +0200
X-Gm-Features: AcwNN1UYkBPuOvUGMNKq9NIUmTu6yNeNhs9fCtxsErhjcC2hyfYApg2nj1gadtI
Message-ID: <CANn89iJgAXaoepX1uvUbYhnutjvOPknPFheThf-gRWV-PbZZxw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] tcp: add TCP_ECN and TCP_ECN_OPTION socket options
To: Jakub Kicinski <kuba@kernel.org>
Cc: Irlanki Sandeep <irlanki.s@samsung.com>, ncardwell@google.com, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, davem@davemloft.net, pabeni@redhat.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, lorenzo@google.com, maze@google.com, 
	sporeba@google.com, motomuman@google.com, srihari.k@samsung.com, 
	g.pokhra@samsung.com, r.kumawat@samsung.com, raj.kumars@samsung.com, 
	ts413.lee@samsung.com, ramyashree.s@samsung.com, daeil2.hwang@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Wed, 16 Sep 2026 10:32:55 +0530 Irlanki Sandeep wrote:
> > Currently, ECN and Accurate ECN (AccECN) configurations in the Linux
> > kernel are controlled globally via the net.ipv4.tcp_ecn and
> > net.ipv4.tcp_ecn_option sysctl variables. This global approach lacks th=
e
> > granularity required for modern multi-application runtimes.
> >
> > In diverse network environments (such as mobile operating systems like
> > Android), different applications route their traffic over distinct
> > physical and virtual interfaces (cellular, Wi-Fi, VPNs, etc.). In the
> > wild, certain legacy network paths or misconfigured middleboxes (such a=
s
> > routers, DPIs, or firewalls) are known to blackhole packets with ECN
> > negotiation flags in the SYN, or silently drop packets containing AccEC=
N
> > option headers during active sessions.
>
> My gut reaction is that we shouldn't be adding a setsockopt here.
> This is a routing property, really, IIUC you're adding the setsockopt
> because you want to use BPF, in which case isn't it better to add
> a kfunc for this? Why go thru all the sockopt plumbing?
>
> TCP maintainers, WDYT?

Speaking for myself, I also cannot see why we need to support so much
flexibility.

BTW:

I have on my plate a complete walk through of recent fields additions
in tcp_sock,
mostly from the AccECN support.

ecn_mode and ecn_options have nothing to do in tcp_sock_write_tx group
in any case.
This patch  would hurt performance.
