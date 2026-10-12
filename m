Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D551624D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804167; cv=pass; b=l0nCmmAJoKFZPZMF0e+jXZAiN6uw8AAhjvHCkYq8uQIs1OB+v/CguCAFv3mzgp3ZOQpV7Fp4MPojhPzig0JKXVYr6iooZOLSraSv9J+w+1K378xDk92guVMAZnwKTWSPf+7Sqh+EU8PQ0XZtjzVezRO24jeOE9ldSlEtPsrvG90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804167; c=relaxed/simple;
	bh=Cu6g4P8eaaVMFmhl7P4pmrcQWyqeH0bMbfnLebqDS1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncP1Sb3BEILEM2vnWJEMARhZuQ9sWC/qyDpe9BJHnBw60OzN41tBdiULVDD8crFFIXZdueJEkGvGj4z8SIKynJ6USJp1LSfs0U9Q5ja6pxFa/97zNROxVTjbE9r+HSHM7qudnGREZ6rDL3rTKU/kMxOWYZkkzhjS6LNFCOd9wec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu7aFix7; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu7aFix7"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53582498790so22204401cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791804163; cv=none;
        d=google.com; s=arc-20260327;
        b=hdNLzuFYYd60U+pceFvzhKrUMCOZ38h99tTrAtFaAn5MnUd1vi5dzYKDikptuVY3re
         zQirsny1b/PExF2wHkrdBEj3pPOiYwbUDzk0xsCYUsiWgmgTuC5HAk1rWtJVbwo3woF3
         3DPZc5v5Lw15UrYcavWgxVsMfp9xC0lXZSZLpvSN4FQ/51cqNm15kctkqt7lY3+zQ3NE
         FBHe1WC8taJPCr4B+XCrZOEDaPN/A65VeaR6iS6y/DqBHZOm8yVbt85Lwg2N9KqYqO90
         WtLlaeqdiTV1j3lXCR2E9Noa1rRo16O/K8Uld5mCz77heIHgXi2/7uUmI6Hg/CBatnkW
         8eYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3OwFa260kD1QeEDOJDnNKPaewbdFhFz1lAeTcMiE4DI=;
        fh=5q8vHS/+xaw+NO8H96nv+foSTO3aB196tT+eME5z3aA=;
        b=Hg8FAQNplk/Ef+8GOyPMS+nHStonMAY0Lx5wW49DiK9oITmgyp2oapnRjiQCnH7khu
         LkQAg7xHZBHVCor2pAolAKQkgdRWoaDEf3nqV2qifsYJO0vjbhm6aOYVsTK/rVXP7T9O
         k9Fd3tE98QpwA4E/wptePovJOEFM36+gf8ypq7m5pVelD1TydTiqvfreJt0Zj1pbzYKV
         oHaDQ4GWJzFAs08x0svvaXwDf42QYiFs7WOOG+mvHPn1a3TZpsiz79ydCxk2LyVZqCup
         /lyhhtWfsDHQAsFFd/gWSNsajjzGY/KqELh4sygISVdYWAlupbsr5o/LX5O6zsNspLe4
         33PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804163; x=1792408963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OwFa260kD1QeEDOJDnNKPaewbdFhFz1lAeTcMiE4DI=;
        b=Uu7aFix7+2Js4PoT8miko7utuFvIs0RSi0fcNaI7UImzCJEql4zaC+XcUsTwrqp07B
         xrrWDBiiuXOHbhhAAnSXZUHitp7eyV4k/TDnbDjpELOwAlrTiWaDBSi8hnyhu042fVDX
         Enn+vJQ6F9S17RYRjiu67raSnnxiSJm4RtLn9vnkrSapsAXZg6Ms62CDOWZlbSeT4vVw
         qJIdGzmji2jB52717MKMrwPHNBy8eFJtf59DH9iGWxw+c8oxVb70ypDOm9c2wN/qrlpM
         IPKoJbcWIHoip8hCr/SyzpQZBK6wR7Ijai5HqKv/6jrAkhUzApmJPhYzWG+O3jOtAU6H
         0+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804163; x=1792408963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OwFa260kD1QeEDOJDnNKPaewbdFhFz1lAeTcMiE4DI=;
        b=VDjecRzDtvk+CkTZjNrKndxp+wVFHMD8yOi8bnxHWxYGp9iQwv2VIf/aTE1xD4a8YL
         7kg7peH/lqpDq7/C0xI57icmShDLq0K8XuWiE9lE0kYIoJfSzk1MYa5dwnoJlcPbsW2f
         d3X4CmSO64CkY2JPPxPzhumCCvbZG2KWUE9Jhe5dbQaLukr2WaHDsK6UgQmjs0MaPvir
         O5Q41lqzAnhMqXEIDVO8+QqXTS6PWwOjwl+Ot9YThVlzuW17XxPWere/xaLHSalIlQ0N
         tWF6gsn7D5Cd2c9KEh+179R7XN7VUZMH7+8DbY/jAWqg16JcCs2RIV9GnVOjov+dp/f/
         ju4g==
X-Forwarded-Encrypted: i=1; AKwUvBwJpNUn33dzZOytexPXoFamYBCvlbQii6YX2aGUfUKcTd2w1hx6InMQNYmcoHy59QDTTT8Y0I2ia2tZL2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEp4M4C99F24xnXGskn6NZAEabR6qHh1Y/yY0PnJcmrWW8PqPV
	LqwtSfs5wwxhLvLh2VyNMptjVF9HA1SNtlfaX5naYUwf6Hy2j1EWxXLi3WXbI+FjxQcLxZedQCP
	uEBEbn0fQb0X8BHQJQx0tRaMCCBNQR+g=
X-Gm-Gg: AYBFou03dKg7cUluBUsdqYw5yD39PuTvHN9I13/tp5z1VWSYWmjnWBtPAbaUeHk/iEm
	Ipc9cmRvo4pqGWsREh4fBJddYuOzOtkgMU05akDCQ/pX9ql7ko8dasiu8G0Jv4wlBDcLXucBC2S
	mRYUafDlCUv/XayEw85kYyTmzVgafNY+q9b4LMLU/VvNX0j/x1vF5tyzHqdUh5buo2kE/kqe0QC
	sMeav4LmuTpSfhl3GrxXrsweOEuMvpIfXUenMIKtpm73MOFe6P21XYZVysAdcxTM2eYaZ/Ne2M1
	aP1Hdd3gAvizCau+Ih/2t28Cj+7tW3+zYcXSM/rE9vtriIMHwh4ZYRrmqZsPS0vX1i/eAFTAXvS
	viiZCIIbZyZleI2mKKiM8TSG5eTbnoqVgowAtkC0W1kyFrTJobjs2aOVGrLkjgbTXRqFKxRBOM8
	6FqcGsG3w023HSJqmaGAo1/PthNKHz5OYqH8AF/iOk5gbwsh0vaPWHwXoHmPTPKTKLRut8VN9+T
	kA0L2YkH81XFu6HXhzVZYSmIkYmENHJTiujufi+
X-Received: by 2002:ac8:5cc8:0:b0:534:7742:e5f7 with SMTP id
 d75a77b69052e-5359f059b4amr158442881cf.0.1791804163302; Mon, 12 Oct 2026
 04:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011111606.14753-2-jain.sm@gmail.com> <179180390054.434549.3187163637190599944@kernel.org>
In-Reply-To: <179180390054.434549.3187163637190599944@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Mon, 12 Oct 2026 16:52:31 +0530
X-Gm-Features: AclHuK-d1p7euAL71QPQsYvRtvGGJgHBCTIGyH35IF3f6bC2DDgMA90_5vS1ZS0
Message-ID: <CA+FWx=n4WhnLeO6NcPR05nDF3NtqGOuniyvtXummuwEB9VSM-g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] tcp: don't set window_clamp from SO_RCVBUF
 before the socket is connected
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuba@kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026, netdev-bot+sashiko@kernel.org wrote:
> [High] Does this check cover every case where SO_RCVBUF is applied
> before tcp_connect_init() runs?

You are right, it does not. The socket is already in TCP_SYN_SENT before
tcp_connect_init() runs, so SO_RCVBUF applied in that gap - via
TCP_FASTOPEN_CONNECT before the first write, or via bpf_setsockopt() in a
BPF_SOCK_OPS_TCP_CONNECT_CB program (as samples/bpf/tcp_clamp_kern.c and
friends do) - still writes window_clamp and still overrides the route
metric, and a state-based check cannot tell that SYN_SENT apart from a
post-init one. v3 will instead distinguish a user TCP_WINDOW_CLAMP from an
sk_rcvbuf-derived clamp, so tcp_connect_init() and tcp_openreq_init_rwin()
apply the route metric whenever the clamp was not set via
TCP_WINDOW_CLAMP; the selftest will cover the fastopen and sock_ops paths.

> [Medium] Is the part about the case without a route metric accurate?

No, you are correct. With no RTAX_WINDOW metric both the old and the
patched kernel end at tcp_full_space() - the old kernel through the
"window_clamp > tcp_full_space()" branch, the patched one through
"window_clamp =3D=3D 0" - so the advertised window and wscale are identical
and derived from sk_rcvbuf, not from the defaults; the patch changes
nothing there. The real impact is only (1) routes with an RTAX_WINDOW
metric and (2) a TCP_WINDOW_CLAMP that a later SO_RCVBUF on an unconnected
socket or listener overwrites. v3's changelog will say exactly that and
drop the "any application" / "without a metric" claims.

pw-bot: cr

Thanks for the careful review.
Shashank

On Mon, Oct 12, 2026 at 4:48=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is incomplete.
> - [Medium] The commit message misstates and overstates the impact.
>
> --
>
> tcp: don't set window_clamp from SO_RCVBUF before the socket is connected
>
> This patch makes tcp_set_rcvbuf() skip the window_clamp update while the
> socket is in TCP_CLOSE or TCP_LISTEN. The aim is to stop a clamp derived
> from SO_RCVBUF from overriding the RTAX_WINDOW route metric in
> tcp_connect_init() and tcp_openreq_init_rwin().
>
> > tcp_connect_init() and tcp_openreq_init_rwin() treat a non-zero
> > window_clamp as a user clamp and, in that case, skip the route window
> > metric (RTAX_WINDOW, "ip route ... window N"). A clamp left behind by a=
n
> > SO_RCVBUF call made before connect(), or on a listener, therefore
> > changes the window and window scale advertised in the SYN and SYN-ACK:
> > the route metric is no longer applied, and even without a route metric
> > the advertised window and scale come from SO_RCVBUF instead of the
> > defaults. This affects any application that sets SO_RCVBUF before
> > connect() or listen(), which is more common than using the route metric=
.
>
> [Severity: Medium]
> Is the part about the case without a route metric accurate?
>
> __sock_set_rcvbuf() always sets SOCK_RCVBUF_LOCK and then calls
> tcp_set_rcvbuf(sk, sk->sk_rcvbuf). On the old kernel, the clamp left
> behind is therefore tcp_win_from_space(sk, sk_rcvbuf), which equals
> tcp_full_space(), or SOCK_MIN_RCVBUF / 2 if that is larger.
> scaling_ratio cannot change before connect.
>
> With no RTAX_WINDOW metric, the patched kernel sees window_clamp =3D=3D 0=
 and
> reads a zero metric. Then this block runs:
>
> net/ipv4/tcp_output.c:tcp_connect_init() {
>     ...
>         if (sk->sk_userlocks & SOCK_RCVBUF_LOCK &&
>             (tp->window_clamp > tcp_full_space(sk) || tp->window_clamp =
=3D=3D 0))
>                 WRITE_ONCE(tp->window_clamp, tcp_full_space(sk));
>     ...
> }
>
> The old kernel reaches the same tcp_full_space() value through the
> "window_clamp > tcp_full_space(sk)" branch. tcp_openreq_init_rwin() does
> the same for req->rsk_window_clamp.
>
> Wouldn't both kernels then pass the same window_clamp to
> tcp_select_initial_window(), and advertise the same window and wscale in
> the SYN and SYN-ACK?
>
> If so, the visible change is limited to two cases:
>
> - routes with an RTAX_WINDOW metric
> - TCP_WINDOW_CLAMP followed by SO_RCVBUF on an unconnected socket or
>   listener, where SO_RCVBUF no longer overwrites the clamp
>
> The message does not mention the second case. Neither case is "any
> application that sets SO_RCVBUF before connect() or listen()".
>
> The message also seems to contradict itself further down:
>
> > The "after" values match a kernel with b025461303d8 reverted; with no
> > route metric the SYN window and scale are the defaults in both cases.
>
> In both cases, wouldn't the values come from SO_RCVBUF via
> tcp_full_space() rather than from the defaults?
>
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index f4c9101e5996..e523cb71b905 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -1858,6 +1858,14 @@ int tcp_set_rcvlowat(struct sock *sk, int val)
> >
> >  void tcp_set_rcvbuf(struct sock *sk, int val)
> >  {
> > +     /* Without a connection there is no clamp to update: it is chosen
> > +      * from the route's window metric and the buffer size when the
> > +      * connection is set up, see tcp_connect_init() and
> > +      * tcp_openreq_init_rwin().
> > +      */
> > +     if ((1 << sk->sk_state) & (TCPF_CLOSE | TCPF_LISTEN))
> > +             return;
>
> [Severity: High]
> Does this check cover every case where SO_RCVBUF is applied before
> tcp_connect_init() runs?
>
> tcp_v4_connect() and tcp_v6_connect() switch the socket to TCP_SYN_SENT
> before tcp_connect()->tcp_connect_init(). A clamp written in that gap
> still passes this check, and there seem to be two ways to get there.
>
> The first is TCP_FASTOPEN_CONNECT with a cached cookie, where connect()
> returns early:
>
> net/ipv4/tcp_ipv4.c:tcp_v4_connect() {
>     ...
>         tcp_set_state(sk, TCP_SYN_SENT);
>     ...
>         if (tcp_fastopen_defer_connect(sk, &err))
>                 return err;
>     ...
> }
>
> If the application calls setsockopt(SO_RCVBUF) before its first write(),
> tcp_set_rcvbuf() sees TCP_SYN_SENT and stores a non-zero window_clamp.
> tcp_sendmsg_fastopen() later calls tcp_connect()->tcp_connect_init().
>
> The second is a sock_ops BPF program. tcp_connect() runs the callback
> before tcp_connect_init():
>
> net/ipv4/tcp_output.c:tcp_connect() {
>     ...
>         tcp_call_bpf(sk, BPF_SOCK_OPS_TCP_CONNECT_CB, 0, NULL);
>     ...
>         tcp_connect_init(sk);
>     ...
> }
>
> sol_socket_sockopt() allows SO_RCVBUF for bpf_setsockopt(). That call
> reaches __sock_set_rcvbuf()->tcp_set_rcvbuf() while the socket is in
> TCP_SYN_SENT. samples/bpf/tcp_bufs_kern.c, tcp_clamp_kern.c and
> tcp_iw_kern.c all use this pattern.
>
> In both cases tcp_connect_init() then skips the route metric:
>
>         if (!tp->window_clamp)
>                 WRITE_ONCE(tp->window_clamp, dst_metric(dst, RTAX_WINDOW)=
);
>
> The SOCK_RCVBUF_LOCK block afterwards can only lower the clamp to
> tcp_full_space().
>
> Doesn't that leave the b025461303d8 regression in place on these paths,
> even though this patch carries the Fixes: tag for it? The selftest in thi=
s
> series only covers SO_RCVBUF set before connect().
>
> Would it work to base the check on whether tcp_connect_init() has run yet=
?
> Another option would be to let tcp_connect_init() and
> tcp_openreq_init_rwin() tell a TCP_WINDOW_CLAMP value apart from one
> derived from sk_rcvbuf.
>
> > +
> >       tcp_set_window_clamp(sk, tcp_win_from_space(sk, val));
> >  }
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261011111606.14753-1-jain.sm%40gmail.com
