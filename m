Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793238825;
	b=Pzd9Q9E6UtRiV25NFGA6EN0xgSImERsh4s9nqDtxp92OCVj0s18CU9+DlNcXYUS8ndLI
	 fTayM9PBksaadDdlQoELAGe3I9KV4IqtNr4XtGP/tJ/LumRXT087Tp+2pxsd7I/eGGmmr
	 +HypX3lblOYkUizvpSfyR8hsywfQ0lqD8u5l0ELCEDOKSeJoxSyLcPDOspaMpi/f3uK4n
	 cTSCZGtufzy+u/2dq49/AyMkgRpdH4Tqz7RT64cE5NKzf4IPflUQ7R4zGPPXldTYAtJoU
	 OQ3v47z7Bso5fyOhk2/dYHTtqmPLdXFCtwTUlObFxV7YeSvSO7F3vY42KFgOBbC8oAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
	b=llnfTZn0/PK3AgbjOoqU5JbnqLxofz04M2EcNtNneVnWF8tvhmTCHFYc98BRF5KcFssp
	 X7I601X6Mzaescd+kfjW2De7LsdOuA1Hs0OFuj1OlgfsjidDxXYcPH2zzuBduG1D7N7J1
	 1Egn12Gd40yiXw362SmWTPnXF4uPFa2ZGQh8NTU1BHiXEXBhInJVIz/BvsP006o0GxYqm
	 PX0ik4m7Iwbo8rdBsCCuvnG+PFcXDRip6BqLOgSN+WPJ2XjXMigVLYovM6QEWdGImg/Me
	 nLv7dXbuvpf8GRww5QecM2Ofg2gJHyDDg3owrEnmsdwWAAuGZV0xRoJViYuSlX6bvBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VJMzm+5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5DA606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF5DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VJMzm+5y
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1981560eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793238824; cv=none;
        d=google.com; s=arc-20260327;
        b=N4QQeGAj2445M402vT7PP3l9NGRBQi5yF5AjU36eLL5lf785L8L4pexZjITyo+XQuO
         zksG6K3wIFDsjlYwrv/4u7r5QRqGpvCjkCLTr7qcLKK1DQ7miHcSl7P67GuCDxyX2RkM
         b78Rhx5uHweqcsWjgXQBa7/yd9LUdbp3LeSkXzBZYgLX9L6Yc7xP/X8QEVFlR/Cruc4T
         yp/aGKtc1XlMJiluj6hozeFQtDocBSP0ybIYtmHKLqHm9RUdJ0BxS/b2urg0X3q7adLu
         ke4LivLbTN/98ZFkb96IEqD8E2gzMcYbKHS4yhQlTPpHJV+JVOpznyey6zuxXvgOFL9k
         T1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        fh=KUq9arT6OaAld/+/NMYTreT5crCcwr2kV9q4wdsmYL8=;
        b=HvYvUg925/E1+Nz3EjIzG70gcRL5cA03L2s+N4e+yeIuQOvaJWlz5xLujFpJJaNeYT
         3TAJi7POavnysUh92N3yB7RVOh2ts4jy8hK6jiGTVFCl87hctQwc79F+0MdJ4O0qLMgc
         2Cy0mosiEfVyqQEJRM9ipEO6MX3tQXu0HDDg5QWVHpuvC5IyHhNncohoPxF0tsx2VBGq
         vDfIkkvdLKCcPUfx4zc4yKizxn688zTlZEel58KPwOJzMLOFP5tjoIxzYDdsUkOjcH1O
         sHWL+av0otypapXXUe6MvcukO/BH1EDrjgMie2gYeMlruP5urYU5FBPWgmcTYPsQ5lNo
         uKtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793238824; x=1793843624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        b=VJMzm+5yD/wIGHVb+4KCC3ZIoBHwdyH59pUaKB4/gMct4nvQyIr2wWO9MLgEISmdE2
         uB/52VoBo5XGV2qq6eknNQRI7sDqvlynkCX6gXlIFvQ9WN8zW6sF6uMxmjYsaPrWwQDZ
         9aPPNiiCI6s9pR8d3WmkxbEvTLweIzjoXZhqaPA6zXQiku/+ST+0/BiWCNgIllf0nTbi
         4CuxBgFA36h3YyUTfk1wtsg4MxCFBsrDasyRaJJtGMdEtQyZtD5aylVNvwROoLnUWsWU
         110wWLj7m8gMQlWLPLjNm4F0y5lFAKBKm8U5+URAyRD4lfHsDAfBbvVaN5SFJxhMz66a
         wV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238824; x=1793843624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        b=ErLnvtrUoo/C3qVC2UouUCxTN3BeHF5E+zu+xHNg0WEeKAA/1nxhvdiOm+fjHhTMWq
         wzRe7ylMFrcL4lyuGClxzajL1pdetAFsb99PgtXaWlj307wTrPTdRLrtMdWnVoOf3vCR
         KCunaj8Wp+aaQ18vjOjlT+9Q5bW7GDwBgteCqhPBoeEG3oGyfJgPp0fmXPkIrhMD4+4S
         VxTjrp7W5AeqhEdIcbEJP44YQQVQM6WpjMHda+qyKF9C9VN8yH+uV6M1kSH8ExJfPjOp
         Lj6agT6+J36IfUuglZMuoIAVOyfVHU61Nj3G34zVq9vZ5yZHtbFT32Vaiv1dS6LMqEYQ
         OS8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwz2VPe24MIhW5C4FUoFYLXg75fJaSwnE9BQ/V8S7ITzdytOk3QqZTx8rIYX8x0ziCwmOO52mRF81JHkRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvgN5drKe7mj3vzY/80VlPdw2y6/epVUE7F/biw81R8o2jU7AC
	ylVHtWWebBJrRzS7rqJZr6H7F6UVuCPkMi9UJZn5GgIBcURZj/T8jGVsUIVJYgxlQk2xfV+J6vX
	0AhCodEe7zMleo/of//k5Ir2dUB4yrUPOjA7ctlfC
X-Gm-Gg: AYBFou3mlfwI0iKsVKC81rnfHuhiJNuZGVl4dngHMQpB9kEU0RJPyp6as5NZbxDx4VQ
	Hc3azSeU1lQbc8xuw/I/O5qv1AU9gUoRMF9YsGXxAff/H6UvIGxdG4/KCL9OJ8/X0LHCROleKdK
	5pGsSeLd+g/ETwsizYH5g6TxeppO436gfOC6Kcv6IiH+ILlKiza3/DJfzoyHjf6uzClstVBnmoL
	J0cE6ENTIWfs5FhRg8XLltzaKp36b+5L7GwFg0m5SPKBNNMkzGq7mxE6Dc0Zw122YovDXvBaaHH
	zidLzOKa57DP2VIq0x61yPwowHqcv7TYaV/3LxabKlBL35nMSsBl9QoI02ag4kh46ZRNjwlDHdV
	g959GxrEuYjnfIgAyWtrKI/vCR1XILnMdRjav62BI6EZerY92KLZy/w7GR6r9ccl4BjKl5vvO+b
	SnA/vSETi6qZCXdf8kMHllEzBL7QD0dFPXUYu4mebw+c/wQseOy4skXQkzWXqlkgzXXIEM2BPy5
	1w8jP54OA==
X-Received: by 2002:a05:701b:205b:20b0:194:f017:5a01 with SMTP id
 a92af1059eb24-1a6d1f92f62mr5111887c88.42.1793238822982; Wed, 28 Oct 2026
 18:53:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027104701.296240-1-jiayuan.chen@linux.dev>
 <20261027104701.296240-2-jiayuan.chen@linux.dev> <CAAVpQUCBBaVmaZUv+D+a4anSbGSR_pKukYVXvRJRzSGVnjb2kw@mail.gmail.com>
 <eb85d54b-778e-403e-a5a5-56805b23b560@linux.dev>
In-Reply-To: <eb85d54b-778e-403e-a5a5-56805b23b560@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 28 Oct 2026 18:53:31 -0700
X-Gm-Features: AclHuK8XDsp5T4jIaX_MBCMs6DhlHPSgPvRq7TjuW4iyJKF7VUF6t-zq0kYU-QU
Message-ID: <CAAVpQUCHeydud7_NkMuUyK3tdNYLD9GrCGJiGQO6gV+r0-GuHA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/5] ipv6: restrict gc_elasticity to 31
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Willem de Bruijn <willemb@google.com>, 
	Maoyi Xie <maoyi.xie@ntu.edu.sg>, Jiri Wiesner <jwiesner@suse.de>, 
	Gerd Rausch <gerd.rausch@oracle.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Yung Chih Su <yuuchihsu@gmail.com>, Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:47=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 10/29/26 7:58 AM, Kuniyuki Iwashima wrote:
> > On Tue, Oct 27, 2026 at 3:48=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linu=
x.dev> wrote:
> >> Every counted IPv6 dst allocation runs ip6_dst_gc() once the number of
> >> live dst goes over gc_thresh (1024 by default). ip6_dst_gc() decays
> >> ip6_rt_gc_expire by gc_elasticity: the smaller gc_elasticity is, the
> >> smaller ip6_rt_gc_expire gets, i.e. the more aggressive the gc.
> >>
> >> ip6_dst_gc() reads ip6_rt_gc_expire into a u32, but gc_elasticity has =
no
> >> bounds at all, so writing >=3D 32 shifts a 32-bit value by >=3D 32 bit=
s, and
> >> a negative value gives a negative shift count. Both are UB:
> >>
> >>          val =3D atomic_read(&net->ipv6.ip6_rt_gc_expire);
> >>          atomic_set(&net->ipv6.ip6_rt_gc_expire, val - (val >> rt_elas=
ticity));
> >>
> >>    UBSAN: shift-out-of-bounds in net/ipv6/route.c:3369:53
> >>    shift exponent 32 is too large for 32-bit type 'unsigned int'
> >>    CPU: 2 UID: 0 PID: 615 Comm: ping6 Not tainted 7.3.0-rc7+ #364 PREE=
MPT
> >>    Call Trace:
> >>     <IRQ>
> >>     dump_stack_lvl+0xc1/0xf0
> >>     dump_stack+0x10/0x20
> >>     __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
> >>     ip6_dst_gc.cold+0x15/0x1a
> >>     dst_alloc+0x4e0/0x620
> >>     ip6_rt_cache_alloc+0x189/0x7e0
> >>     __ip6_rt_update_pmtu+0x68e/0x1160
> >>     ip6_update_pmtu+0x30c/0x3a0
> >>     icmpv6_err+0x1fa/0x330
> >>     icmpv6_notify+0x303/0x770
> >>     icmpv6_rcv+0xc12/0x1670
> >>     ip6_protocol_deliver_rcu+0xb4a/0x1520
> >>     ip6_input_finish+0x19c/0x400
> >>     ip6_input+0xd4/0x240
> >>     ipv6_rcv+0x1fd/0x330
> >>     __netif_receive_skb_one_core+0x118/0x1c0
> >>     __netif_receive_skb+0x21/0x150
> >>     process_backlog+0x37e/0x1200
> >>     __napi_poll.constprop.0+0xa5/0x5e0
> >>     net_rx_action+0x4c0/0xf70
> >>     handle_softirqs+0x204/0x9b0
> >>     __do_softirq+0x10/0x18
> >>
> >> Make it a u8 and reject writes outside 0..31 with proc_dou8vec_minmax(=
).
> >>
> >> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >> Cc: stable@vger.kernel.org
> >> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> >> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> >> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> >> ---
> >> v2: switched to u8 and proc_dou8vec_minmax(), as suggested by Kuniyuki
> >> Iwashima.
> >> ---
> >>   include/net/netns/ipv6.h | 2 +-
> >>   net/ipv6/route.c         | 7 +++++--
> >>   2 files changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/net/netns/ipv6.h b/include/net/netns/ipv6.h
> >> index ffda15318be59..aefce37c04a4f 100644
> >> --- a/include/net/netns/ipv6.h
> >> +++ b/include/net/netns/ipv6.h
> >> @@ -25,11 +25,11 @@ struct netns_sysctl_ipv6 {
> >>          int ip6_rt_gc_min_interval;
> >>          int ip6_rt_gc_timeout;
> >>          int ip6_rt_gc_interval;
> >> -       int ip6_rt_gc_elasticity;
> >>          int ip6_rt_mtu_expires;
> >>          int ip6_rt_min_advmss;
> >>          u32 multipath_hash_fields;
> >>          u8 multipath_hash_policy;
> >> +       u8 ip6_rt_gc_elasticity;
> >>
> >>          __cacheline_group_begin(sysctl_ipv6_flowlabel);
> >>          u8 flowlabel_consistency;
> >> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> >> index 94e5ef1c4f83e..abc8b811cd423 100644
> >> --- a/net/ipv6/route.c
> >> +++ b/net/ipv6/route.c
> >> @@ -6579,6 +6579,8 @@ static int ipv6_sysctl_rtcache_flush(const struc=
t ctl_table *ctl, int write,
> >>          return 0;
> >>   }
> >>
> >> +static int ip6_rt_gc_elasticity_max =3D 31;
> > as you need v3, s/int/u8/
> >
>
> Hi Kuniyuki,
>
> proc_dou8vec_minmax() put extra1/extra2 into proc_uint_conv(), which
> reads them as unsigned int, so the max has to stay an int like
> tcp_syn_retries_max and friends; a u8 there would read
> three bytes past the variable.

Ah exactly, then please use unsigned int.

Thanks
