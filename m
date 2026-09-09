Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134571B4F1F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928319; cv=pass; b=TSK57JOSzLVmYLbWwu5DEmDqVQ+4a+hVhMTnuhuwDLYomZ0dvefu6UCzyKxJnC4a5Lsqp2Dl5mGoORPeoVb9O9xXMPRXUDtSO9mrL9knkMXofGrk7GSbWHsdDvn/IoRPKfZC8jnP+gOTOPwoHuwZOev9q0kMErvgKCyIKXF0bbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928319; c=relaxed/simple;
	bh=wCoAPXGQWo/3x8ZcHwjWU9tDfHvxRZZTr1ThfjC8Me4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVgaAT+FwRE/pdsuzLh0bKV/f5QN7+uRtxLCgZlbA2UlTMNIUuwtcTOXGmoAdEoogIKT7kmfV2wwjmPKHk78LdyqInLKuVrp39dEI/N7yB8p8Ct/KoNaRF7H1BjixHNuh1ebMPSw7epdgPCcApj7BKo2kFwiSrJdYMHHqz9Vhf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9qF87zf; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9qF87zf"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc328b43a56so4347429a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788928316; cv=none;
        d=google.com; s=arc-20260327;
        b=h2RHcgb81yUpn/4b55m71rVz8KYUNBLpkybTysJUtJ/9l0q/UKucuG9tg7p8UeG1Bj
         /OM078QvmJEJFV2qtNVKYaTKKoRnBAJbK7HDqyrpOwUVfmVKccDvdH69O5S+hUxcAYFA
         nVngAdyd8pX6AYi1z5vZMP809zO10ffTIngygE/Zwoj6L3LXFciVMrh1dp6cn0neqiZz
         ssrJpPN1L37m5WRe4PYK5zJO3bDm4C+69cxik1BacWJoB6Gqw51itDU0Vjvq3td4X40p
         Oj7eUpmsbfOLvTkrA39h3lufFmIbGHpRWLZviAG5h9JpCWEf3zwh0xRQmRFp7Si8j84b
         mTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aalq+Xsboz3fBB7v2n7ALpXM1NAPQRQmE6A5C22OVu4=;
        fh=Cisu90DYGTiCBXMQ3MDvse+lPgolWQruMv8Isae0zuc=;
        b=g7MrgQCyLp4U/Q19V5gSNd2OHRvkCc4i9dEkuujetIPliFPL8PZ85/fAMT8wMG4NLW
         Gp+Pok3SQfPJ75gOUfRiPvIfVYHZILc12qTsmXx2kADvml5W6edPgMye+cCxPO6zwcIK
         qvF0LDYnNQvI7WokNf4LcV+/XMXhAjdzgf2Y1awi8ebA/b+BUcpaIE5TEfib7+vP9r4S
         L+7AX4Jqk4fbf25A3x92e3U195qrMipgvbMEo7SjqdB32p5lNH0sgQsd0FYdpo43H7RM
         qjPoB/JbIiHrHAAEsqmXYrF8iyvbcwHF8v8imvBomMYRbJe1wnAf4UMdKVmxqZrm6jIP
         FAKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788928316; x=1789533116; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aalq+Xsboz3fBB7v2n7ALpXM1NAPQRQmE6A5C22OVu4=;
        b=C9qF87zfzUl5z3O8fzRZT5jjjtl3C+vdBjhhnAf1+EwK0XlSIgfREl0AfZoBo1DmD/
         LGcjR/+g2P75ajvEvj4mmCu6ckvnLcipQZJPNAZw2fIGSEObd3N9lGnpzCslsjdl+Hii
         kL3cPFYqYdivFfkDX1Bp+ve21ebs4Q/CHu+X+liZF/TC5VTm4VkLFImDLqvRdQrk1pXl
         Yq+I5k1RNePdu1ELc4vnFYGD7jAqChb1AY8yCXLcgc2FMTiF4/XKWyMGb4dwugvmyJtF
         yfrLCoY7VZ2nkMuvce70xqSKEpIG3x1HsAe9NbJzFBS1ueL5yNvEQaSSRctbzGu9xZzG
         i6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928316; x=1789533116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aalq+Xsboz3fBB7v2n7ALpXM1NAPQRQmE6A5C22OVu4=;
        b=TLbBMCgs7STeXc1dwUy9ZpzKE4Lx6H1AFXqSnz3uIvH3gr+ejEvQsGnALwjZFxpbnu
         o9XQHHModB9rXFOVaVKEyvujHCOv+xOzImK/x5qypOEYx/09GvpLZHOvH0M+9QxxxpZr
         f4uxYb2djG20NYpVkPTknvw1hEf8jmCRislTcouBq767HjvS+ruNAjcXTlxXEBLBh87g
         2avGlHZNWDuY2bRBHpdwMbEdt+rFQ2xPp6FwaKzwxIoPYK1dS9oRE6Q+/rtnLWAamCk3
         CEvomiwWowhK5aJ6hzB8WnFe3/RwdZewFvp41Dnvqc0Rt1udByRHAlF5Yo8INOZ0WXdl
         mn2w==
X-Forwarded-Encrypted: i=1; AKwUvBy61vMoJnDSk2S3BcvYlF8cvcxChUCEuhUhhKMUur5WeEPMc57brP400qTDNLwHpgOko52fHfGgtri2JPA=@vger.kernel.org
X-Gm-Message-State: AFuF++kGb0ZWvmYFCnJ++CQnd/rN0aZDudz0DgWcmGMfUyY1Bko5wFKO
	2knhfnMPwnq95kcJZPd+njq1WcU5z4ofNJX2az6xBe7RaKv+mEdSBQVTjJ9PyQkfCkD/G2q6y8Z
	K3wmXLigYtijoLqUvzcu+vcs7gBIVgc4=
X-Gm-Gg: AYBFou1LsRKzTAkx2Xptf+dyxrAKCXHu9in1oO1IJSrGuF1AQk1ymqYpO8iBStB0A0Z
	yFMbNGyKQdilogzGgklF6qwUB9znODJpqt8Seurof2eemSDDbCdbr4mUDOzm4MukVd0cHodQ2eN
	vo5nRXZXaWXbdcNZ7QIXw86TYUICno8hhAcCmgvzFTOojKi2jGBIUXbMgNUUiL1gNrniixFdA+t
	B8nECUlPOuYdNRFl08m1Rl20+AAQV1pPlSYg0Ouh+CxXoRkq4uP/WBwWzPnxrtZ362MvekfpqiY
	f+RsxNuAUzU6g4KRlqWPtKTCweEWO3JdJFD64aDbGKHaDPdFZIfQqHozNG1Bmpqh2T+7tooB7ji
	KqhnyUVjJ5c3sxPmoi9OnhHpwQrrbAV/0Rxz9HMftG9I6oKG0DUeVSI/uIim8CdMoBbWN9dx9YZ
	f+QGP8m7oB8hH4QHFk41MOKa7E6h9R14Q=
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-39b26101c20mr49310336a91.9.1788928316092; Tue, 08 Sep 2026
 21:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906030429.2085375-1-xmei5@asu.edu>
In-Reply-To: <20260906030429.2085375-1-xmei5@asu.edu>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Date: Wed, 9 Sep 2026 05:31:44 +0100
X-Gm-Features: AcwNN1Xjri9__-XXqjMy6AxNsRDi7V3Sjo2MFCmVHnIjKnO3ilsgeLwUCFBs4a0
Message-ID: <CAJwJo6asOVa21T==+n7qdso1DBvH6Y3rXo24DdieAQS6XeTutw@mail.gmail.com>
Subject: Re: [PATCH net v2] net/tcp-ao: don't dereference NULL current_key/rnext_key
To: Xiang Mei <xmei5@asu.edu>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Salam Noureddine <noureddine@arista.com>, David Ahern <dsahern@kernel.org>, co+2c72469dbbec34af@bugs.sh, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Xiang,

Thanks for your report and the proposed fix.
I remember I wanted to write tests for re-connect() on the same
socket, but never found time for this, as it's not really used in BGP,
as far as I'm aware.

On Sun, 6 Sept 2026 at 04:04, Xiang Mei <xmei5@asu.edu> wrote:
>
> TCP_AO_DEL_KEY with del_async=1 is accepted in TCP_LISTEN and NULLs
> current_key and rnext_key; tcp_ao_connect_init() clears them on a
> reconnect.  Five readers dereference them without a check.
>
> tcp_ao_time_wait() leaves tp->ao_info pointing at the tcp_ao_info it
> hands the TIME_WAIT socket, and tcp_done() skips inet_csk_destroy_sock()
> on the tcp_fin() FIN_WAIT2 path, so the full socket stays in TCP_CLOSE
> with its fd open, sharing that object.  An unprivileged
> connect(AF_UNSPEC) + listen() then clears rnext_key while the TIME_WAIT
> socket reads it from softirq, and tcp_v4_timewait_ack() dereferences it.
> The segment need not be authenticated: tcp_v4_rcv()'s do_time_wait: path
> skips tcp_inbound_hash().
>
> Check both fields and drop the segment when the key is gone; without one
> no valid signature can be produced.  In tcp_inbound_ao_hash() this must
> be a drop rather than a fallthrough to the keyid lookup, which would let
> the peer pick the verification key that rnext_key pins.
>
> This removes the dereferences only; the two sockets still share one
> mutable tcp_ao_info, leaving snd_sne, lisn and sk_omem_alloc racy.  The
> first Fixes: is where the unchecked read came from, not the sharing.
>
>   Oops: general protection fault, probably for non-canonical address
>     0xdffffc0000000010: 0000 [#1] SMP KASAN NOPTI
>   KASAN: null-ptr-deref in range [0x0000000000000080-0x0000000000000087]
>   RIP: 0010:tcp_v4_rcv (net/ipv4/tcp_ipv4.c:1055 net/ipv4/tcp_ipv4.c:2333)
>   Call Trace:
>    <IRQ>
>    ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207)
>    ip_local_deliver (net/ipv4/ip_input.c:262)
>    ip_rcv (net/ipv4/ip_input.c:612)
>    __netif_receive_skb_one_core (net/core/dev.c:6264)
>    process_backlog (net/core/dev.c:6728)
>    net_rx_action (net/core/dev.c:8007)
>    handle_softirqs (kernel/softirq.c:645)
>    </IRQ>
>   Kernel panic - not syncing: Fatal exception in interrupt
>
> Fixes: decde2586b34 ("net/tcp: Add TCP-AO sign to twsk")
> Fixes: 0a3a809089eb ("net/tcp: Verify inbound TCP-AO signed segments")
> Cc: stable@vger.kernel.org
> Reported-by: co+2c72469dbbec34af@bugs.sh
> Closes: https://lore.kernel.org/all/YG9s0PiBKJZcXAKld3MToa1IVRJOUoKiaA57%40bugs.sh/
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
> v2: drop the incomplete v1 fix; adding missing checks to avoid null-deref
>
>  net/ipv4/tcp_ao.c   | 6 ++++++
>  net/ipv4/tcp_ipv4.c | 4 ++++
>  net/ipv6/tcp_ipv6.c | 2 ++
>  3 files changed, 12 insertions(+)
>
> diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
> index bb7bbc20ba3f..9c2e5c8c8fe3 100644
> --- a/net/ipv4/tcp_ao.c
> +++ b/net/ipv4/tcp_ao.c
> @@ -857,6 +857,8 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
>                         return -ENOENT;
>                 *traffic_key = snd_other_key(*key);
>                 rnext_key = READ_ONCE(ao_info->rnext_key);
> +               if (!rnext_key)
> +                       return -ENOENT;

I think this is quite a big hammer to fix the re-connect() issue.
In theory, we could even restrict connect()/listen() after TCP_CLOSE,
but I think I have an idea how to address it "properly".

I have a draft of a patch; I'll test it today and send it for review.

>                 *keyid = rnext_key->rcvid;
>                 *sne = tcp_ao_compute_sne(READ_ONCE(ao_info->snd_sne),
>                                           snd_basis, seq);
> @@ -1026,6 +1028,8 @@ tcp_inbound_ao_hash(struct sock *sk, const struct sk_buff *skb,
>                  * matching the rcvid in the mkt.
>                  */
>                 key = READ_ONCE(info->rnext_key);
> +               if (!key)
> +                       goto key_not_found;
>                 if (key->rcvid != aoh->keyid) {
>                         key = tcp_ao_established_key(sk, info, -1, aoh->keyid);
>                         if (!key)
> @@ -1045,6 +1049,8 @@ tcp_inbound_ao_hash(struct sock *sk, const struct sk_buff *skb,
>                 if (err)
>                         return err;
>                 current_key = READ_ONCE(info->current_key);
> +               if (!current_key)
> +                       return SKB_DROP_REASON_TCP_AOFAILURE;
>                 /* Key rotation: the peer asks us to use new key (RNext) */
>                 if (unlikely(aoh->rnext_keyid != current_key->sndid)) {
>                         trace_tcp_ao_rnext_request(sk, skb, current_key->sndid,
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index 9f053eb8b46e..93e073065b1b 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -1052,6 +1052,10 @@ static void tcp_v4_timewait_ack(struct sock *sk, struct sk_buff *skb,
>                 key.traffic_key = snd_other_key(key.ao_key);
>                 key.sne = READ_ONCE(ao_info->snd_sne);
>                 rnext_key = READ_ONCE(ao_info->rnext_key);
> +               if (!rnext_key) {
> +                       inet_twsk_put(tw);
> +                       return;
> +               }
>                 key.rcv_next = rnext_key->rcvid;
>                 key.type = TCP_KEY_AO;
>  #else
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index df9c29eb5c1f..0fb75d139430 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -1182,6 +1182,8 @@ static void tcp_v6_timewait_ack(struct sock *sk, struct sk_buff *skb,
>                 key.traffic_key = snd_other_key(key.ao_key);
>                 /* rcv_next switches to our rcv_next */
>                 rnext_key = READ_ONCE(ao_info->rnext_key);
> +               if (!rnext_key)
> +                       goto out;
>                 key.rcv_next = rnext_key->rcvid;
>                 key.sne = READ_ONCE(ao_info->snd_sne);
>                 key.type = TCP_KEY_AO;
> --
> 2.43.0
>

Thanks again,
             Dmitry
