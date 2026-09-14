Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D336F8F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361816; cv=pass; b=OK5bdGFItIXYZIMsrPBFXl/KpKTGGQHFKzlksGdi/4hIzss+JCaaLqruV72ESLXCi8YQpaikF7B/1ZDMIGiz9dRnvoqpQ3iswOpft1jcQR8Xex/XGfhkVlw2V1kNGcs6M/R0TvoHDk5C1kgNSmXJevr8h1drWtBsCLrDXFrnwnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361816; c=relaxed/simple;
	bh=XJttOucUkwqKV5SIpXoyNSSoVR/yWjRXPTa4zl6qOJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEXyzWWFIcIhlkAgpGVU4ukdipToUKXYV+7rg2Sz0olWXHwo45d5ps5Xq1luyKcP6MNhJe6QCFeeHyUxPG3JQg2D1c3Q/2pdE3HgwzZWhREzJHdqqPxv2KjMNzO8Fcmw4OEMzVnhNRgFA3fm+//uughUrhD1oUXRVY86IDhdjQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHPiqd4U; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHPiqd4U"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so863467b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789361815; cv=none;
        d=google.com; s=arc-20260327;
        b=AF2rFHcoDjfPNvHC3xfqaKqv7dukx7TE6fcc96Bw8UuemwuWiF/+B6/pQT/vmR/FLH
         liF0GnpphTDLLt9saZHJLTpPeAkBIsf7rM4EC4PROWe7dPEtPKc5pxuzYUDgRHgAc0sP
         hsz337AVujwAJ6ciklPs3D02G/cBvvoBpR6juonY0J7NoE1tAkgs4AHZomM5zZaTTHBN
         6T9ym8Da1/IZ92su7UYd1c8QIuHLyrDsWxuhUuADvK/h3ZnEcIa5+QdWrNOIR89ZKg1g
         S6gjtKq+WGc8Uo1ieW4emUMdgBj5EYUxnKaVSd0m2we9BYzejaeM7NspCmaLSaykf+u/
         XVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6z8L6rXqNfxAj7abEXiX9kfEbaPtyTmUGq5VEFvzYo=;
        fh=O3N16t4rnrvHyE6/NiVeuCX7OAg3mI7GpVOZrggqmZ4=;
        b=WWDyqov8HBon9salynf5rSz8gqU5XhIZIJ+AUhZwuLMVFlFFj8X52uIkML4DrKyJiJ
         t/IsdcpOzgiD+slSGfdltrxaWresobhg7AQOPYFC9Lq5vuoRBc45hCRi7a+vNChMxNDk
         +zDppF5uUsOJfje7Dksw0HJQJMgRw2Ib8XmylMdWROTKn7dxCES8mBSbvh22gt2Hffpi
         TaZJqp1IcYTeznyzin9lUCzuV9lZA/U/qdPuRbCKEqnkzKl5q37JWMIlBAbD/+TfUGgN
         RLKL2HGGfpNWdV6F8mf8O8P/cFkvWTjA37IK+4yRMW+PT+8Nb/SCRuAUw3gryK4YUpGC
         Iomg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789361815; x=1789966615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6z8L6rXqNfxAj7abEXiX9kfEbaPtyTmUGq5VEFvzYo=;
        b=YHPiqd4UDJFcLSim8h6foqhDfLIQ3xRTfHsrqalCtj+JzOgTe/cksF2ThWOCC8Sk/A
         f2+hWx7Zncb8TyBclkIHMsvfYsfb4XLGryppNx5vhgR2ScNW4ilPBA3ZzUkcdzzTAMRd
         Zlen8kemyjWRSChH45qrNnMtUFYL/gmDRP76xJq9tVlfRSLztxLzDsrlA5FI10MmqKzd
         mFMVT3FSKHGNz1Z0kE+NlGUkA5ZtUK6E8vkTe56+08LKufB6pOU39CqLg/EMoghMm5zR
         yoa96SAFbX0pMR+Y8xxY54+OcQljZ9GR4xCpmpqpUXulTyoS1bK+G7j8J4VOyEt5TRl3
         n16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361815; x=1789966615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6z8L6rXqNfxAj7abEXiX9kfEbaPtyTmUGq5VEFvzYo=;
        b=QuYc5ICwi+SHulNbc13q/vEptXxmPyn7F1VQicEbsun66qEGXJmsfO+jnEdKmWFIog
         KVHqAIC6R8ibCsIb5WUlQS+hOIG7z8PTj87XL+4JjjG3WQJvljbAd0Elrh71aCbpoek5
         OQWw7xf5DnBDI35L1KZnUs29TqTEo6gAySOPd/7lhItVEyc+9oIYQMeI/mHnLxFJmvFw
         L8RIDUuBNZgVutVtoT/VVXOtL5wrANBAlY+i5R1u2l01IEXDtvk48RdmIG6bsjRLxrdy
         oJ1bYPBoS0Cxq6Rt7exJnBY4DS/1oqhPuc2b3wvlxGANpYRxoNmHXL/IKujAPYOvkExQ
         OSJw==
X-Forwarded-Encrypted: i=1; AKwUvBwfWto/sKxctxQQ0IRyjr93L9dAJD4UCBJTbRHuozkTPx0aYgpyNSgwVSRD6CFy10JIlLrgTK3m+/U/2Rc=@vger.kernel.org
X-Gm-Message-State: AFuF++k7gbUbpMIOAOTUTXTvfat7qKBu6sCbZfTFPc0IHUyxtM7h42YV
	N3L0eNaxq8ropxs7mFzSqideUUOnjjhMNKr0IL0NrQAA4EG6Oo6xlRikr2Zorrq6NbcIHNI0dsB
	6/gUkxh+GKXWhCsCBBJ4TcDDGIfpqpfk=
X-Gm-Gg: AYBFou2KHONLSxcU1DndzErUNnGHg4Rhyc95+vuAboE7hKiitSDThOx25xBM/VGhI1Q
	kOGpvJnTuwC/D1dwS21VNMnKNixintRt6Ecc5Ixs19mWfWTE/MEn+AXGkz2zdSafLZybD7zL8cD
	ASwy2D50RivtpdCbVXI2frKietN0QTLLhUnqTGKPBuuO4936ozYBBCn/FFqn08PQ6TPt76pDF8e
	LhQfgBEWD6MS8taMySZOZJSmX41qeu7jisnte6z4Cjc1OZCEE11EP7/wEInigPmm/iKz3Lg+A0S
	vE1NsN2zLaCQG1WAOzGXEIgPh24LJT0i4liEA5+5slmXS5Zw+umPhnKtsAVIDmjNXdYvhsma3d5
	+d/KoI6smrexe30CVWw2iPvackF+n2NFGOrQIpBICv74hWI67pw==
X-Received: by 2002:a05:6a00:1916:b0:86c:52fd:fbdf with SMTP id
 d2e1a72fcca58-86f863bb784mr1977203b3a.20.1789361814478; Sun, 13 Sep 2026
 21:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910142522.45014-1-cenzhang@linux.microsoft.com>
In-Reply-To: <20260910142522.45014-1-cenzhang@linux.microsoft.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 13 Sep 2026 21:56:42 -0700
X-Gm-Features: AcwNN1Wb5k6vxqdzIM7sidRn28OXJvGl-UnASr4hD185qUY-L8N3wMNZHMnDeEQ
Message-ID: <CAADnVQJceTGftun8NfbyQdWe1FqLDsd6Ut5mrQFxuVkAvrAAEg@mail.gmail.com>
Subject: Re: [PATCH bpf v3] bpf: Fix non-linear SRH access in bpf_update_srh_state()
To: "Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>
Cc: bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Mathieu Xhonneux <m.xhonneux@gmail.com>, David Lebrun <dlebrun@google.com>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	AutonomousCodeSecurity@microsoft.com, Xiang Mei <xmei5@asu.edu>, 
	tgopinath@linux.microsoft.com, "K. Y. Srinivasan" <kys@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:25=E2=80=AFAM Cen Zhang (Microsoft Security FORGE
Labs) <cenzhang@linux.microsoft.com> wrote:
>
> bpf_update_srh_state() locates an SRH with ipv6_find_hdr() and caches
> skb->data + srhoff in the per-CPU SEG6 BPF state. This assumes that the
> returned offset is within the skb linear head.
>
> That assumption is wrong because ipv6_find_hdr() uses skb_header_pointer(=
)
> and can locate an SRH in non-linear data. The direct srh->hdrlen read and
> the cached SRH pointer can therefore access memory outside the linear are=
a.
>
> BUG: KASAN: slab-use-after-free in bpf_update_srh_state+0x1bc/0x200
>  net/core/filter.c:7027 bpf_update_srh_state()
>  bpf_lwt_seg6_action()
>  input_action_end_bpf()
>  seg6_local_input()
>  ipv6_rthdr_rcv()
>
> Fix this by using seg6_get_srh(), which pulls and validates the complete
> SRH and reloads its pointer afterwards. Pulling can reallocate skb->head,
> so refresh the BPF data pointers inside bpf_update_srh_state() immediatel=
y
> after the call.
>
> For End.DT6, make the inner IPv6 base header linear before removing the
> outer headers. Pulling only the outer headers can leave the inner header =
in
> non-linear data, while ipv6_find_hdr() and the nexthop lookup access it
> directly. The helper parameter may point into packet data, so copy the
> table ID before pulling and potentially replacing skb->head. Clear the
> cached SRH pointer and refresh the BPF data pointers if the pull fails.
>
> End.B6 and End.B6.Encap can insert a new SRH and reallocate the skb befor=
e
> a later HMAC calculation or nexthop lookup returns an error. Rebuild the
> SRH state when the skb length changes, which indicates that the new SRH w=
as
> inserted. Failures before insertion leave the existing state unchanged.
>
> Fixes: 486cdf21583e ("bpf: add End.DT6 action to bpf_lwt_seg6_action help=
er")
> Reported-by: Xiang Mei <xmei5@asu.edu>
> Link: https://lore.kernel.org/bpf/20260901183151.16648-1-cenzhang@linux.m=
icrosoft.com/
> Suggested-by: Emil Tsalapatis <emil@etsalapatis.com>
> Link: https://lore.kernel.org/bpf/CABFh=3Da5iLOEJdPhoaWUhLc0eEqAuhnd83_jJ=
r9MVZZG6gSJAEw@mail.gmail.com/
> Link: https://lore.kernel.org/bpf/CABFh=3Da4VyzxsQqsayWpTKjxY3HL2C072u=3D=
pbecEpNDbL9eBNKA@mail.gmail.com/
> Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <cenzhang@linux.=
microsoft.com>
> Assisted-by: Copilot:gpt-5.6-sol
> ---
> Changes in v3:
> - Copy the End.DT6 table ID before pskb_may_pull() can replace skb->head
>   and invalidate a packet-backed helper parameter.
> - Rebase onto the current bpf master branch.
>
> Changes in v2:
> - Rebuild the SRH state after End.B6 and End.B6.Encap only when the skb
>   length changes, avoiding selection of a spent Routing Header on errors
>   before insertion.
> - Rebase onto the current bpf master branch.
>
> Please queue this fix for stable kernels.
>
> Testing:
> - Built net/core/filter.o with CONFIG_IPV6_SEG6_BPF=3Dy.
> - checkpatch.pl, diff --check and exact-base patch replay.
> - No targeted runtime selftest was added. BPF LWT test-run does not suppo=
rt
>   non-linear skbs, and the existing SEG6 netns test does not create a
>   split inner IPv6 header for End.DT6.
>
>  net/core/filter.c | 39 +++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 2a84f9d01131..06a748c07747 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -7017,15 +7017,16 @@ static void bpf_update_srh_state(struct sk_buff *=
skb)
>  {
>         struct seg6_bpf_srh_state *srh_state =3D
>                 this_cpu_ptr(&seg6_bpf_srh_states);
> -       int srhoff =3D 0;
> +       struct ipv6_sr_hdr *srh;
>
> -       if (ipv6_find_hdr(skb, &srhoff, IPPROTO_ROUTING, NULL, NULL) < 0)=
 {
> -               srh_state->srh =3D NULL;
> -       } else {
> -               srh_state->srh =3D (struct ipv6_sr_hdr *)(skb->data + srh=
off);
> -               srh_state->hdrlen =3D srh_state->srh->hdrlen << 3;
> -               srh_state->valid =3D true;
> -       }
> +       srh =3D seg6_get_srh(skb, 0);
> +       bpf_compute_data_pointers(skb);
> +       srh_state->srh =3D srh;
> +       if (!srh)
> +               return;
> +
> +       srh_state->hdrlen =3D srh->hdrlen << 3;
> +       srh_state->valid =3D true;

This is not equivalent.
Pls tell your clanker to be think xhigh.

pw-bot: cr
