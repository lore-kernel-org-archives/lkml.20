Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BE371877
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765445; cv=pass; b=jgWWdCDkHh3+8552BSmqKvJn2qd0gmJzO+HjFvO4Kg7COnUMQUzRORZT3AixzAA1V8nc5UPze2VBov2cnPt8lb5QPNJL3LzWYQ0SndyqvYfQ04CPehNiWtFXxWqf542lxo4iKKi4RYOw/P0MS6kyaot+oEmeZrGepS6X69BSaho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765445; c=relaxed/simple;
	bh=6I/1+qMQ471+4RYnld66Y6RCA6m5prbOV7XKezci6Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnqfCR22OAf1tG8oXtJb8+ymZ6C6hGJRHZe++Hp0iP/DZYlsqaopdOa0cjWDI0vELb67p4Xrg9ofghOfJ57suV21RmD6w75hg8goW7AHae9+P4REVEC23QgzdmmzNeo/dw5ouIe4MKEXMBVONQYHEkyCdrZbS1jDQ/bAw3P0X+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vYo6voBC; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vYo6voBC"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-517dc520840so10748071cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787765427; cv=none;
        d=google.com; s=arc-20260327;
        b=cqu2GZt0zDKLwfgdvyyoZCnsvCiYTf/JjburjycaDyrvVLZtzNRhljQzN5BtwK9irQ
         1I4WAjrYiLVkXJztiM12N5vuz277LxZqZp1rSMUE+6E/T7pane2FZya/9oMqd8R3favO
         YEnrPP5Vv99FayyjwCzmDu71rsVZdpiJBHJsVZJsUsMI9oGujazmjxrRUUy2hKQblrLB
         Rc2YN7F0Z7E5tb22UM1owOORJmrNQzDv1QarUn3w4bvxATyI0jVDyeEMpiUc45cZCp5M
         l85Kx6mmDxC3uszJDO6v6H2czDqzuJuj0wRzi1LZrEaGHYB6ix//+Gy2GhntOdylvW7q
         /O9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mADOW/zXjYAYuEehDtg7mIumLwYtucuRE6QwBoqgK9s=;
        fh=7YJeO7lWPQ19Flw0Dchu6ofkvNx0wM2CPGYJ04R8I7I=;
        b=hWBi76TvNsDqS//W91jR2htsWXm5wKQDwCmeoCLy07edoQF5U/4Bm9QCyhpu8MByVj
         LYR7X7AAZjI9tT2m++guSyK37bbOlLzZ3JFHufVOsp0h3WEIDfrBdNL0fQ/MS2RvWKsz
         wtzoCVyhs30gTrOZjmXoSRkkfNIBgBabhuTULHW6i21zGIV38gsiayBmbS/jh6XaGjv/
         Ipkfz4JYhxEBy5oCvAdnO7YGpkS88fzE6PslnPLMb5l2n5gAi0/K6OXZOhBbfuKzp+Of
         pBEMG1KVCsbXmFDeXhnLuYXAOwh0mUGYOWGZUUzdCHCRWseD2ax1qxjSIlGXNbSS2spH
         7b8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787765427; x=1788370227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mADOW/zXjYAYuEehDtg7mIumLwYtucuRE6QwBoqgK9s=;
        b=vYo6voBC/2BgFQ4SxwiD2n2bJd0GVjymeEjikMl35kpmLBdbj3NS+ATEh6MTsXyqeN
         x2+Ou/joYg0moRd7b5+C2fHD/vYehytTAipnHAKslOVZJFwbMk6SO2ZKlrX1kXH3/lOt
         9CE0b0S/lXKVdJsuykaDUPWbP3Orz24rAv0lEqxRce1FuHIOz1iWL5tCdHT2xAaWzemA
         LPK8dTKM3Ty7wgKLYUZXx7o26GJ6BHPcVw17LrBgDJ126Uux28+82Gn1FfVMdoCs7uIE
         Qmoai63ljmAoeGWb/eK9aZqyiNYk8bLfWNhsWmdaPptimLbIisT5uwbtukhoHO7g/kfY
         439A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765427; x=1788370227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mADOW/zXjYAYuEehDtg7mIumLwYtucuRE6QwBoqgK9s=;
        b=CedqZ3bcQ0v3h/BngtWnkMbPYsm59e89oQfHVS4lWn/SlQdHiFjNZ7Un5DImIHu3w7
         AkR95bqIsVADtUmABQhrheSGaL04bYgl/WsaaVHfMv012f4GHcA8HxUIeNhMM7tDHpNR
         Qy0QdhRJMELu03STwajGV0Q4OxHWTPqH1MNWIGACqVpK6dmYKOVWlhInWEnGqDCfEp+s
         aP8Iu8SgyC8T4NeQXAwgg4/3Q2uZyBzdFLgAum/AjKBWsoQxOj9iZoRB88LEVqwkGmDg
         XZrpT/X8LnVhcWk0h4HHcY0oCOIm5y0hd1rmg7FfunLp9kB/UdD6J0qkthiCpytO9OuQ
         JvVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9op6qhExPVvZw8sBbdSfVf85QWPRyc6qeFNdsMUS5Rvbl6PLnMNiAMNoaisYb0YouAUXChCHlW4YtBZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lf6w4jlKObAzzkFMpkAhDzZy6KBW+juaCJGB7mtgW47gandEW0
	j+t8hZQyXfKtyy59rv3d5bOeDgc5qT1mfjITX1Gc5oienzsScO/WqJ9eXxsczaLE6jaocSnyp4o
	Hc8WzJpU+j2u2HraEM5VMGgWt6s6xQm14O1jai0vG
X-Gm-Gg: AR+sD11EcsFUhy7I0We+1Q9NKkv+0AS9qNr0ynu0ha7RCOZLYkGVQA0Uu0V7Ig3x2lY
	4vdxhEinsltU4QGoFDeCT1hAfe5kVMq8zE0BG7RIAEpSJUCmziCNa7Hg4pjlwPgTK3JYU8SpTnB
	L3K/GtkGZ32tdTZZ9Uq0vCMbfABdTJwLb/dJOqryC9GO78oam1+5kz++hRBGs+JcNJoGtNxKqpu
	SDe5Z/ZcBuzLJMMGZ5rTk5tWl4H8s4BPjpOx9WzJP8l8sZaMHt54VRZ175juH2Pt8CR/7lD71WD
	r8xWN/YhyA50/tignLd8mGUHMjul4okptby06iYrzASaAqxzGgRQUTeI2oTdNMit4Vid26kisSi
	2rooV/1SEjnoLv3Y8qG2hru5s9IKNWzCfecNYSXvioDOJCpWOougrwm41BVo=
X-Received: by 2002:a05:622a:3d4:b0:52d:7b2a:93f with SMTP id
 d75a77b69052e-52e422d73camr87475071cf.3.1787765426178; Wed, 26 Aug 2026
 10:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826171344.4133-1-blbllhy@gmail.com> <20260826171344.4133-2-blbllhy@gmail.com>
In-Reply-To: <20260826171344.4133-2-blbllhy@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 19:30:13 +0200
X-Gm-Features: AcwNN1XFn8gzzgrjQfG4ZiFeGArbznLUn8IBe3QpZkDe5XgxFwMYGCWbJrGLGFE
Message-ID: <CANn89i+5+3-u3T0Tbu_NeDSc2L1_Fpqtf_inKB5k0tN=9SUaiQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: fix use-after-free in do_tcp_getsockopt(TCP_CONGESTION)
To: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Cc: ncardwell@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, kuniyu@google.com, horms@kernel.org, matttbe@kernel.org, 
	martineau@kernel.org, geliang@kernel.org, yhs@fb.com, kafai@fb.com, 
	andriin@fb.com, ast@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AutonomousCodeSecurity@microsoft.com, xmei5@asu.edu, 
	tgopinath@linux.microsoft.com, kys@microsoft.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 7:14=E2=80=AFPM Cen Zhang (Microsoft) <blbllhy@gmai=
l.com> wrote:
>
> From: "Cen Zhang (Microsoft Security FORGE Labs)" <blbllhy@gmail.com>
>
> do_tcp_getsockopt() reads icsk->icsk_ca_ops->name without holding
> rcu_read_lock(). Since commit 0baf26b0fcd7 ("bpf: tcp: Support
> tcp_congestion_ops in bpf"), icsk_ca_ops can point to dynamically
> allocated BPF struct_ops memory that may be freed concurrently via
> setsockopt(TCP_CONGESTION), leading to a use-after-free.
>
>   BUG: KASAN: slab-use-after-free in _copy_to_user+0x37/0x60
>   Read of size 16 at addr ffff888013505260 by task exploit/149
>    _copy_to_user+0x37/0x60
>    do_tcp_getsockopt+0x158a/0x2460 (net/ipv4/tcp.c:4585)
>    tcp_getsockopt+0x91/0xf0
>    __sys_getsockopt+0xf7/0x170
>
> Fix this by holding rcu_read_lock() around the ca_ops->name access,
> using READ_ONCE() to load icsk_ca_ops, and copying the name to a
> stack buffer before releasing the lock. Also annotate every explicit
> icsk_ca_ops store with WRITE_ONCE() to fix the accompanying KCSAN
> data-race issue.
>
> Fixes: 0baf26b0fcd7 ("bpf: tcp: Support tcp_congestion_ops in bpf")
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Reported-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> Link: https://lore.kernel.org/all/20260821182449.79785-2-blbllhy@gmail.co=
m/
> Cc: AutonomousCodeSecurity@microsoft.com
> Cc: stable@vger.kernel.org
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <blbllhy@gmail.c=
om>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
