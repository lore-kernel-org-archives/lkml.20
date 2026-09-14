Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1183A444717
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387323; cv=pass; b=rU0PWXLuy2HL7oARmRHgCz1Oasgqs1X0w7/cBgr7Qu23ztpyQW4DG0iv+fLq9aenbdEVKxY5bEu+Il+mSWKqIXHZ3dfw51nLKTo8mJv/kukXBV+JunsKBbj9sfu0zGXLI6qKmkV//+HFHCzEonpYVKcyokU41pQ/DQdHnjny3ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387323; c=relaxed/simple;
	bh=WDEUVrdLkKvz95MFCadBRmBNiLDw6jCMZuJuM4hcvnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyQsBvLRoE4JNaxaEC+n2W7aQHfYMbpfWpjv/ITXR26Cp44CdiuJdxLdtHVRwUn80DV3QnE8IhsiLW4oWBo/+jCMuvcHlRebdqZIwr186WCpWBeV99B3nFpH0T3DgO7JUKhENDyBfW9YswzY/xn5xY0taIpjj8Fy4/pZh1u+D6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKhIs629; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKhIs629"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c6920so1564750a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387315; cv=none;
        d=google.com; s=arc-20260327;
        b=sqmCGP9Shc5IsJgrviqToBbgksqjpDz8+9ZZtoszpSncrJuj2+KFz/gfXx7J5EU111
         J6wPufK7zQ+iIPnqf3lXAL59cnjIF3uH14Qil4XrlJGhIKu7dLfRUW2k4MX4x2Z0JIaH
         Eg9wN/cjRTm2jAWgeLrUkP/6iqM1z6D96z3oG50ctKwOmo/hji4BMKIIuB6/TuDAU+mJ
         fVDa1DO1zyOqhjzNoke+v0cFbfTWvpT3MlU7Iem/mu5OJP8VhB1RgYur+D5zuIHMKQo0
         r9zFSLB0Oaah4XQFQ3Z6Hy11RVpiWS+b+aqbLSPyK2IgxEWgRtFHKa20bnWyncLyShvl
         Auiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+mS7vtDPxxU2homzDGl7yWJhS95lRXjFbALRbsqqxF0=;
        fh=2LZZd+PX16f23JPl6GUognm1Gxn63rmowfo+P4YjQbw=;
        b=bEN34XOYNOsvzD0BSn6l8787nLMxyxqHKEDV40QAhvD3ehpKiM3FrPfBydneqYBHRG
         a2cJVSh8DSmQUoZ/UpGFDD7uWfnpaf24pwofwzY/Mt9b08MsbXD78NXHHDGNlfOfIc2S
         db4v4/kH0Y/nrDiOVJFsvzCQExCh+TeAniaXh7pLVopJ6eZ5GM1xzu/e7WEqtUF01tvI
         h16z5XYjeaLN3tvH2UIEIw6UdW2R82qyqGV9FQTzmUPvL2MPlbWI1NMNIN/0d6uQGMdt
         sieEp6kKZ4jOWgmyzbXfu5ZVpx9DbgxF6jJQ47Bw/9G6Nf1jdGXjbiiXC40/2zwBJdJ2
         ssXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387315; x=1789992115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mS7vtDPxxU2homzDGl7yWJhS95lRXjFbALRbsqqxF0=;
        b=WKhIs629A218GZQt3Hy92H/3HiwH8phVF8Icw9NquPk7R16RI7uKwI0BFWJEFu+7zQ
         Aw4PJpGoSf4blMElVEicZIN8iSEZ5bsBRPV827d9ape48ebvTXVfkBPsMiQRuRNKzrFT
         k2hnA25pjb2YWeQb9hdS0jJt8rvwDY4siVyAgMoBCFNFsHDR/vdeXq+BtnNUcnHHcAYw
         BRXGd3mjqyXx23w7c4Rl8K+p84UU4drDsKAmUFrvyzNNwNumCjK/w50ima7TsCcPtdlD
         an/mPKIQAJhOxkjmZBK2Nq1kU3FskeGrsA1smQbVyBYIF/9ylh/h6ay0G0nkVTcbO97r
         1i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387315; x=1789992115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mS7vtDPxxU2homzDGl7yWJhS95lRXjFbALRbsqqxF0=;
        b=SrRZ9HTUxdcYbyM+36u6kPjQyeQPrp4AE+nqaGnivw1CjGTSHi6jgnN7EU5GMVSAcl
         IqHjreNYoY85JCoFoUqTBT+Dyre2I8JiWoIspPcZNpQ+XA0SX5ze8a9ltJDTcVtpedZQ
         pKW3h+FFDIiWcIPfCtlis4ZiPW8WXpnLO2YEwt1bJeLf3g0N5yuw7qEQC8KlkBv71uoe
         Q+rY5rEv74vPJMCVEABOLNoqWL3dd+VXwmX4vWo0dvYXq/ce7k7mzEsHtNK8LQ26CbnT
         Lbax/uHPOeWJX18rG5dVOyHfeMuiTzYxggKeYMRdRte86MdFfHXFurRgWKLqzO9TpZRe
         eRRg==
X-Forwarded-Encrypted: i=1; AKwUvBwBME3m7NrUFgBEGhZi3uBANuARBmc0r8j8bH1eFmdpsrRtaE6Yb0PQqD6VYujQK9OyJVIECj9HqMuW1FU=@vger.kernel.org
X-Gm-Message-State: AFuF++mAjsim73d9b/RZ2o+qCmSsWtKMkmAQ3ZgJuLeqEf22FSHuaC0c
	i5rppEc3eOSoGaFCTRZqliyd7QaHvEOsvCzZ4Qpor/Oi+sgBvcoLXe26+OXIIHGGNE+szk1e85y
	/7sFupU/1LTbslkxrgwI7NLKLZjh6qjA=
X-Gm-Gg: AYBFou3GEPFHJKbOjXz1K6Jtlkd5wNYZNx0jny4MFPhmvVM6ARMlPOpDASk1KTMTUfY
	q7BC3FLdwhvqF4aYK0muUn7x2B79Oklo1la/hfGwFCOoNvCqPTbIsPYWFhQQAt5IkB2JXXnnldj
	hrTK2Yt73pYbeYJ9vD/GnNbcceFFEBU4qb0dki8C41qkeL7+VdvKlzMpikCQDVw3Mw/IdfyaPMo
	FzingnmxX8eZE4L74dUO0C3Jpq19wmfh5JLwDBcaWsofF1U0tldltLkjrdayk7I2jko2ccsSlII
	DYF19ehuZogaYRreTPoEFzL3rhIRDLweLh31j+1TLk3dJqTfn4SVmgF6f68f29Xq2Bg=
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id
 98e67ed59e1d1-39debdd2283mr4798231a91.0.1789387315260; Mon, 14 Sep 2026
 05:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908060410.3982-1-nashuiliang@gmail.com> <20260908133636.2ea807d9@kernel.org>
 <CACueBy4BvJ6E0RuUDsQmwPq_zt9Xh6T19DOAkA5MW-uU1yNpKQ@mail.gmail.com> <CANn89iKYQMPm_LyYY4v48QmoFc0MwkkKQwggd_BLGDJL78=8qA@mail.gmail.com>
In-Reply-To: <CANn89iKYQMPm_LyYY4v48QmoFc0MwkkKQwggd_BLGDJL78=8qA@mail.gmail.com>
From: chuang <nashuiliang@gmail.com>
Date: Mon, 14 Sep 2026 20:01:44 +0800
X-Gm-Features: AcwNN1UkEpUCQ5OcMo1LKsk15DqENpfvJz-tmdqzx1eSl3HXKATXLGI1WggOLYk
Message-ID: <CACueBy4u-2yHHysZvs_a=VQLe4PtY9-qjkdZ3gFn_eVKmyspOA@mail.gmail.com>
Subject: Re: [PATCH net-next v9] net: reduce RFS/ARFS flow updates by checking
 LLC affinity
To: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Hangbin Liu <liuhangbin@gmail.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:14=E2=80=AFPM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Sat, Sep 12, 2026 at 8:50=E2=80=AFPM chuang <nashuiliang@gmail.com> wr=
ote:
> >
> > Hi, let me restructure the issues.
> >
> > > 1) Also not sure why you're trying to touch RFS, the change only help=
s
> > aRFS and you could avoid bulk of the refactoring issues.
> >
> > The scenario is similar to the one described in "[RFC] problems with
> > RFS on bRPC applications"[1].
> >
> > I attempted to enable ARFS on a Mellanox CX-6 NIC. While it performs
> > well for simple workloads, performance degrades significantly when
> > running a bRPC[2]  workload on a 2-node NUMA machine. After tracing, I
> > identified patterns that ARFS/RFS fails to handle efficiently:
> >
> > - Multiple threads use epoll to read from the same socket, causing
> > frequent flow updates in sock_flow_table.
> > - Threads reading from the socket migrate frequently between CPUs.
> >
> > I tested a PoC version using a bRPC service, utilizing funccount [3]
> > to monitor execution frequency and perf top to observe hotspots:
> >
> > Before Patch
> >
> > The mlx5e_rx_flow_steer frequency is over 380k/s, and queued_spin_lock
> > is a major hotspot (6.30% in perf top). The application also suffers
> > from a noticeable drop.
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer              387594
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer              390142
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer              386694
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer              389094
> >
> > # perf top hotspot:
> > queued_spin_lock                         6.30%
> >
> > After Patch
> >
> > The ARFS update frequency is significantly reduced. queued_spin_lock
> > is no longer a hotspot in perf top, and the application's overall
> > performance has improved.
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer                      43
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer                        9
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer                    207
> >
> > FUNC                                     COUNT
> > mlx5e_rx_flow_steer                      26
> >
> > > 2) You put a very fast path function out-of-line, why ?
> >
> > The reason is that tun uses sock_rps_record_flow_hash(). When I moved
> > all rps_record_sock_flow and rps_record_cond modifications into
> > include/net/rps.h, it triggered the following compilation errors due
> > to symbol visibility:
> >
> > ERROR: modpost: "cpus_share_cache" [drivers/net/tun.ko] undefined!
> > ERROR: modpost: "cpus_share_cache" [net/sctp/sctp.ko] undefined!
> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> >
> > This arises because the patch uses cpus_share_cache() to limit the
> > RFS/ARFS update frequency at the LLC level. To keep this in the fast
> > path, I could move cpus_share_cache() to
> > include/linux/sched/topology.h.
>
> Hmmm
>
> If the LLC affinity check is performed in set_rps_cpu() inside
> net/core/dev.c before triggering ndo_rx_flow_steer:
>
> net/core/dev.c is built-in, so it can call cpus_share_cache() directly
> without any module export issues.
>
> sock_rps_record_flow() and sock_rps_record_flow_hash() in
> include/net/rps.h remain 100% inline, retaining the zero-cost static
> key NOP in the TCP/socket fast path.
>
> No exports, no refactoring of tun.ko or sctp.ko, and no fast-path degrada=
tion.

Great idea, this indeed minimizes the changes.

Although there is a slight semantic difference compared to
net_hotdata.rps_sock_flow_table, meaning the CPU recorded in
`sock_flow_table[flow_id].ent` might not perfectly align with the one
used in `set_rps_cpu`. It is still the least intrusive approach.

How about the following simple change?

diff --git a/net/core/dev.c b/net/core/dev.c
index 3a0dd1f98084..7c513bf14221 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5236,7 +5236,7 @@ static int get_rps_cpu(struct net_device *dev,
struct sk_buff *skb,
                 *     have been dequeued, thus preserving in order deliver=
y.
                 */
                if (unlikely(tcpu !=3D next_cpu) &&
-                   (tcpu >=3D nr_cpu_ids || !cpu_online(tcpu) ||
+                   (tcpu >=3D nr_cpu_ids || !cpu_online(tcpu) ||
!rps_check_llc_affinity(tcpu, next_cpu) ||
                     ((int)(READ_ONCE(per_cpu(softnet_data,
tcpu).input_queue_head) -
                      rflow->last_qtail)) >=3D 0)) {
                        tcpu =3D next_cpu;
