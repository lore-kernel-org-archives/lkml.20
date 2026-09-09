Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049CB3783C4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975445; cv=pass; b=KcozgZDfva5lm+6aBerD4OD7A+62owyenBH1MEagojne/jau2wvp1OCyohB1/y6s/TZYm+s2tJZDjmse6mQ7waFIfzzzsykAzEGPyutsh8NaHvPlgH70MO7drzlTRahpN6X5HL0yPQ9UiQ/qY5FLXVRxSLtouhBakp/S+SZPVw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975445; c=relaxed/simple;
	bh=L6EZGw8SGANGHrrGkcSveLb3zd9izGncX/8VAKQnZiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3nVswSAk2c+tJqYJRvzO7xajg0/G2Srdjf3N5omD6dyfFU2NSA4RjDD1yB5qZQtJMRKV+T7JYhPkt31TEr2g6batIZzdWcdP9TcSyA67/9LoMUTGB8+ABmm/3wuMLmPUwJzM/WoesOnYuUESQohOZWCENFvO3Wv2FBftiJxZ9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=z8jqWRYA; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="z8jqWRYA"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so494054d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788975441; cv=none;
        d=google.com; s=arc-20260327;
        b=dzXI+ZcTh2Ps/zmWEDRzm6M1iNghR8EjED9TYZAz8C3/DKx32dh5MOHpkuFSBu9sND
         Q/oQ5p2eTCUbL021OyhEpL7FhTtUpMbTkGfy2QIQ3Oms+gCC9Hl7gfqRyQoKBF3BQvFj
         JlQjTBe+mQywGLyQFqoy0azrdtsoYTAMn9XmpaJ0H0p3U9HDgRtqb+HaAZsUnsun1u+C
         jIE5iflz3u3njWERRkFHPbxIAJC7lIQp093ce7I7JFUuyQqxnLzIkFSCsC/CxvkHlpgY
         k8zH4arnVPSCvwo5MhFPqXxKBGIrN6PI3RsMh307r3zw+2k0rB6iS+z4TG7ta7O8LmHW
         KbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Af6ITtfBEfomuP9/zSoltzeiZzdojuJAWeTn9uFF6ek=;
        fh=ukLyjX0VHnM4luPZEtOo5XLJqaiBDLpfTUVgw6iiVLE=;
        b=c5WdIwg3yMsd4L0ln4GzjMNCt7igw2Sgfm+YPffQTgLmLH6puWQFnRYkga8ZkAjrzX
         H3xoqc4bYXrRKVuA8o0ydlEbpPiqVI076YmdmL2U4KQuura1PtHUUCCg/tXupGKMOsBb
         dX2e07UJVQztg7nwvxM5GnmeeoSdoVH2JI5LEZoMP7UFZlNbAmUwdKQt4li5ysF33yWU
         zH5ZyegW8mKqu7j5h0zdvPOrPEIRjdjcJI0O0OgGsqh5pbYTqIzc3K38fn8+xDw0moSA
         R9l2IpI6SkKZWUgYKQrEnb8n4OF95S1AWbaK1Cfk62U6zTE+MqWwybMqn3w5vU3G7aet
         ol8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788975441; x=1789580241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Af6ITtfBEfomuP9/zSoltzeiZzdojuJAWeTn9uFF6ek=;
        b=z8jqWRYALdUGBkLxezUs8C+xjV5pUXYMTvjAM+dHk0vJHl285vdrgg+tiQs06BsHzO
         wgnRt6jtOn4koRztyEO7uUt7jGml4eR8vDalIXRM2dSa4IecKuidumQDJD66h6mA3/hL
         dnUlh7nWPZTgXLwOLsLrT6fxinNoS6qiitnhAAkU7SDN9IQF7CA16KattG4mqNuKQEkp
         c1QI0rO1IqhwVnwlBbHvZdQZ0oiL5HP39gJGwGO73V3zy+rmLYGFOKMlUwbuMvGsLbRI
         thxWKSCd7M7+fVvrtGg0mmBJtrrPeQkZ8RlFFfXV5l6cyati6NxJEnLxjn8qkpIQDlWa
         ia+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975441; x=1789580241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Af6ITtfBEfomuP9/zSoltzeiZzdojuJAWeTn9uFF6ek=;
        b=mkw1MCVKWeITkdjVyF/8ctk+2u3f4Mg3ktQeRrGD/7Tmeo90q0xc/jkEboBeB+SSRt
         0mvoN9b0piIORHBGbjkidxkvRF9k0b6l9OSq9EIfsZzgwM6Vby9wYMY2F3g7gJDd9Z2K
         X3tbpuXqMyCOImJOlVWUBkYyPDwgkbG2fnVno32YXtGswiKlnNaix4cdTE9efertBTkN
         sDDmNrPjGQNgYvhyo9ObvOXF0KlGbIOncKw9l+xPRBx+KVxHa1lUO74zlXW05xuV5UoH
         gFczdb7vgbKmyEiLUPPT7ePjd8g6jWxOZmVcdJTm5+Y/OtQbpFLgXp2czwgbSuaTTZdx
         RQ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsHt9S2tWcqp6cowOztWMRyBkq5Vcsi0zn6XyAcAzrmtLVANhX7jmgnS+3at2D6lqmdfTQnfYjDmHbr2k=@vger.kernel.org
X-Gm-Message-State: AFuF++klhppUtJl4uvZdBgU2BF1JxfB+iderL/Df5Q2s/HS7YNyRfxEj
	OITJhGftdkqa51J0Le8jng4hHJ90PXSE/Bu74Reje73WtWTWt3+Fe87HK36Ns9AoBX9XUOdxiFZ
	kiiLzWv+EJP081kPeNXPmOI1XA570xMjvouegKZxG6w==
X-Gm-Gg: AYBFou3lLcTkrjqAUH0J6O+rn1eFLsKljkfsLUV+stemZTfKEbqAM5PVkUtynN/zX7s
	wPnAB+Jke8hTSUg/hmR7Q1DT9Cf/pPeeGs7OkUt9DJRVQJ3p/69oTe2XZTrUueP2aC9MqGeyKEU
	z4Y0jihr0geFSF+d11kiVN0Kw6KREsT3UJIWTibhN4sdMfGJstxzRp0V+ZmAmtzQtLlnwaiOsS3
	VvUIqNIC0S9vZ0W1ocQmv9wT8aGJzx+VBG3fUFBY+5SGCVdWvGzFce+/X5/s442AwIeMnQwM4LS
	CAQlyG/+gXa5zXaUlJRBDISjAoqzM4kFUM4FkQdjrCc/mouEdFAaffZ/eSPV4VzV
X-Received: by 2002:a05:690e:400a:b0:66d:93e:f06b with SMTP id
 956f58d0204a3-671100b5114mr953412d50.38.1788975439124; Wed, 09 Sep 2026
 10:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909135324.60165-1-cenzhang@linux.microsoft.com>
In-Reply-To: <20260909135324.60165-1-cenzhang@linux.microsoft.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 13:37:08 -0400
X-Gm-Features: AcwNN1WDkVwiFlZuDNEwXauBrRSu0q6NKwPjowBV4De_y5EG6aHsz-Bo8i1LExM
Message-ID: <CABFh=a4VyzxsQqsayWpTKjxY3HL2C072u=pbecEpNDbL9eBNKA@mail.gmail.com>
Subject: Re: [PATCH bpf v2] bpf: Fix non-linear SRH access in bpf_update_srh_state()
To: "Cen Zhang (Microsoft Security FORGE Labs)" <cenzhang@linux.microsoft.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	sdf@fomichev.me, martin.lau@linux.dev, ast@kernel.org, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, ihor.solodrai@linux.dev, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	m.xhonneux@gmail.com, dlebrun@google.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, AutonomousCodeSecurity@microsoft.com, 
	xmei5@asu.edu, tgopinath@linux.microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:53=E2=80=AFAM Cen Zhang (Microsoft Security FORGE
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
> directly. Clear the cached SRH pointer and refresh the BPF data pointers =
if
> the pull fails.
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
> Signed-off-by: Cen Zhang (Microsoft Security FORGE Labs) <cenzhang@linux.=
microsoft.com>
> Assisted-by: Copilot:gpt-5.6-sol
> ---
> Changes in v2:
> - Rebuild the SRH state after End.B6 and End.B6.Encap only when the skb
>   length changes, avoiding selection of a spent Routing Header on errors
>   before insertion.
> - Rebase onto the current bpf master branch.
>
> Please queue this fix for stable kernels.
>
> Testing:
> - Static checks only: checkpatch.pl, diff --check and patch replay.
> - No targeted selftest was added. BPF LWT test-run does not support
>   non-linear skbs, and the existing SEG6 netns test does not create a
>   split inner IPv6 header for End.DT6.
>
>  net/core/filter.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 8513167a858a..b037d70e5fe6 100644
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
>  }
>
>  BPF_CALL_4(bpf_lwt_seg6_action, struct sk_buff *, skb,
> @@ -7033,6 +7034,7 @@ BPF_CALL_4(bpf_lwt_seg6_action, struct sk_buff *, s=
kb,
>  {
>         struct seg6_bpf_srh_state *srh_state =3D
>                 this_cpu_ptr(&seg6_bpf_srh_states);
> +       unsigned int old_len;
>         int hdroff =3D 0;
>         int err;
>
> @@ -7058,32 +7060,37 @@ BPF_CALL_4(bpf_lwt_seg6_action, struct sk_buff *,=
 skb,
>
>                 if (ipv6_find_hdr(skb, &hdroff, IPPROTO_IPV6, NULL, NULL)=
 < 0)
>                         return -EBADMSG;
> -               if (!pskb_pull(skb, hdroff))
> +               if (!pskb_may_pull(skb, hdroff + sizeof(struct ipv6hdr)))=
 {
> +                       srh_state->srh =3D NULL;
> +                       bpf_compute_data_pointers(skb);
>                         return -EBADMSG;
> +               }
> +               __skb_pull(skb, hdroff);
>
>                 skb_postpull_rcsum(skb, skb_network_header(skb), hdroff);
>                 skb_reset_network_header(skb);
>                 skb_reset_transport_header(skb);
>                 skb->encapsulation =3D 0;
>
> -               bpf_compute_data_pointers(skb);
>                 bpf_update_srh_state(skb);
>                 return seg6_lookup_nexthop(skb, NULL, *(int *)param);

Sorry but sth we missed on v1:, We need to do tbl_id =3D *(int *)param;
before we start
pulling. The verifier allows the *param pointer to point to packet
memory, and we may
be freeing the packet in pskb_may_pull(). There is no good reason for
*param to be
pointing to packet memory, but it's still possible.

pw-bot: cr

>         case SEG6_LOCAL_ACTION_END_B6:
>                 if (srh_state->srh && !seg6_bpf_has_valid_srh(skb))
>                         return -EBADMSG;
> +               old_len =3D skb->len;
>                 err =3D bpf_push_seg6_encap(skb, BPF_LWT_ENCAP_SEG6_INLIN=
E,
>                                           param, param_len);
> -               if (!err)
> +               if (skb->len !=3D old_len)
>                         bpf_update_srh_state(skb);
>
>                 return err;
>         case SEG6_LOCAL_ACTION_END_B6_ENCAP:
>                 if (srh_state->srh && !seg6_bpf_has_valid_srh(skb))
>                         return -EBADMSG;
> +               old_len =3D skb->len;
>                 err =3D bpf_push_seg6_encap(skb, BPF_LWT_ENCAP_SEG6,
>                                           param, param_len);
> -               if (!err)
> +               if (skb->len !=3D old_len)
>                         bpf_update_srh_state(skb);
>
>                 return err;
>
> base-commit: 15e2565f1c43771af0bc5324971cabaad79ac286
> --
> 2.55.0
