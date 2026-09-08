Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E842225403
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831115; cv=pass; b=BItURDDQunCoF/hVCUdX56YHX4BNWEHrFFzdlWsi3U2vyzclAlJ3AWY9PBZHe61kbC3nBpDEyZOs5Yh9F8RoAmllFOVmHtArufaqSQEJGlWq4gFITSfGikdtEDtEwNTX83mdl12oiCdMRRINhoqGh4gxEssda37rL1Chdk41bP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831115; c=relaxed/simple;
	bh=vsp8NB9Ce+scoB5bpUHT696d5VGCApzUtwBCWbqgvoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njk7MzeMj+RwiS2xVnqP2cSU5dcvm/8yolRFub7He/y//xNIZLOXbW3L0ygRmyo5dOUd+fKNt20BaqT6OTuapacA+CN8qZ0++vOWvG1CzyGRVmkCVi4GfdAQJZ0U8vgOBrWpc5DqZNYEEyMUYVH/X+6Z07AZPqo78vkKOaDM8c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=bPUbKzVK; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="bPUbKzVK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so3543000a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788831113; cv=none;
        d=google.com; s=arc-20260327;
        b=sjLERvaUAyh0YBnMat7wKV/4cbAsV3gpubiXq8s7Zwz6ejO22fYg24JDuQnrIpNEha
         ZhO1C9dXLVIr0i/cPEzFqoNDX5/IcIS5zQ1Gfqjqn/56+bNwklUFrzP72XgWV0xee2vf
         Ecqbp9V0kD5DvKevOKE8M5XknriuKfxyqJa8YweOvVdtSumk0bV74NiY07K5TZsw0RcN
         L3RqkMy7CIgzVsDY+bmYdG8t4Tt9c1N3rOeQfq3ULOm0Iql109XKsmVZaBlKdzR3tEt8
         0NpVJm9bjWTIVEnuZp1Y8kciSheJKg5DQyzqwpny9In3nE7o+B0P0blGHnXovF90pojI
         VHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wbadnWAV+8+4n/KnSSoBOp3mg67VI0YEDYLpg5GfqQ8=;
        fh=y+nlIlfuA6A/Y3mtVAjGty2EScccIMzNwiKqfVHlL+g=;
        b=V+wKQAkSaGMlrmcvr8ssCCeUxf7Nk27ldTQ2mElM3tQy2Bq1VZrugQSulo9lxh5z/M
         3kFDwcdk3lDH9KKwI7Hbfa3syf2ojOijbrNK2lzcr4yX3r54E13gKzB3W/IMd7NxQoR1
         3lUITo8/OKRArcXGiX/rLAthSrW30qyq8TT0BCw2VvNxgKrU5Am4Hq6LDlMbk5aRQvWu
         zGcP361IF3iMuwulNd3sRaRZOCFbEmguG9ommlv2oCyW4Fy+bZwWj7yIsE0YCmNepTE+
         IxWK8JAqyC4PKcwBhc6qcWtRIYSf05sLyrPtc82JIqE41/6g6AkcJhMd9O4F6gRj102s
         zVNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1788831113; x=1789435913; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbadnWAV+8+4n/KnSSoBOp3mg67VI0YEDYLpg5GfqQ8=;
        b=bPUbKzVKySYtuta+b6CU6zTGJdUdNNOYegygz1AlH4bmv51DN/YUUfrv0EegaIb9dR
         q8GFfLdSXpU3eSNfzm9/bgLXm+JQAQN9DvNECaa8Dlt50MQaGumLakr8olNZNBdwsDZ5
         b04AFn0yKZ+df4ESXw5Gzk05u8pjvaXbFTru5S2COKLmUQV2HD4H4FyiPq7q0oYvHHgK
         zOd3iXoiHLUfAM6ekHg9P3gnAbAge5Iqdyayk4TBlit7z0GxYOROKZCo8Ml9oP38HrcC
         JhdvBlXvttCF+iu4HG0aRT/bCS+s/zK8AnEfvdKEgfWjju0Xndk2A6ZX4MKtnzTEEjbZ
         Kwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831113; x=1789435913;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wbadnWAV+8+4n/KnSSoBOp3mg67VI0YEDYLpg5GfqQ8=;
        b=TumxkklfTmi7TCAZKRXThMTyqlpLWjSf+WJG0n9+nChLp7wo7W3cfkdGWvkA1eVNi8
         ImCGPl3CWdJ1yItjGRHAsdnx4bm0ssC15p4vKLugl4L+igK/H7unBPZfZ5TY1r8h50Mg
         m6dp82rB6Otyei+TAD+eBDsuRu+HlKdSOzuXZ1XsujzqoilsIbHEalj4ssFs/P0dk0UT
         6aVDgBalZ/FsAQVUaNHcziJhhmSEN5KCQMUX1O6azl0WfBD1wf4DCpgBak7ojQlJF/KA
         SNWm3pwIiMJO6jxgr6T23V2nBNe1UyrwudLSITax2BxZm9OW4Mbiod3XcCAed77Sx3bA
         aHCw==
X-Forwarded-Encrypted: i=1; AKwUvBzw/VemU9LKku6sOR64eOC2Z7qz62IVyPNhYTCWItL/KsPRJYkXW+MN19LGyVVoXqULNdmrr2ns/PXBm+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ls31RS/vcRM5SPhOAIZBfPZzbJwx7fv8BpKjRonbZKmK5TkOCw
	X+SCnnn1TsGqVing57uw4tSSE19OJGTYYWa3UuK4oO3s8O10uZ/8GKupFcdueIAeX+uKhGBgNhh
	AteYN5wzNWCFgijWYN3lfjU6fyXBwl7ZaZnUuyUIz
X-Gm-Gg: AYBFou23CeHdzwoEA4VwItby9p/AWFwo6Vaf70EYR+JS3+el/RMUGYeEI1KAtAA0yJg
	Va2ioVtDKUU/e+1RoPbJNiS+tj1Twor2JgxwBd+x/NoSzeMNmVoi1RHcwavU/5M6aeRBBIxJg7d
	4cvYAEiqxO58IKRiwAq0Hge5noU26zKdl+13XmYuAvWRvLHOMyj1YQV19/JOXlOb2zuDP/+mq55
	JyHOaV5SFQbAsHKgkO0knaP8n74X1ZgW7/09RvK9D3aaDoa7RrEbnN5qc3z0z7uNl0KRY9k551i
	QJzvqACFr7H3SF3Sbw7z5HgMGz20xu2+a7Cuw2H1GsXNaOg8uqu9JRItQJwchQKNVWc/WTghTaj
	pv6Y7AUc6/a/Sol6VPvhIUXXEXIw5CQ==
X-Received: by 2002:a17:90a:d610:b0:399:1b08:28de with SMTP id
 98e67ed59e1d1-39b2613259fmr38799995a91.7.1788831111692; Mon, 07 Sep 2026
 18:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovChS18paCd=ZE-7j_M-JtFF-N6+A75deKUqJ0Yy7ux=h2Q@mail.gmail.com>
 <CANn89i+rDqRXaOO2FNpX57rbgVERrBsj6=OAoMU00aeejYk27Q@mail.gmail.com>
In-Reply-To: <CANn89i+rDqRXaOO2FNpX57rbgVERrBsj6=OAoMU00aeejYk27Q@mail.gmail.com>
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Mon, 7 Sep 2026 18:31:40 -0700
X-Gm-Features: AcwNN1Vwa4fK0EnXQx1KHNDFwSf848WIdk6JGUx0WCNjzuhoeXrATl4puZiryw8
Message-ID: <CA+0ovCi9nOtLMQUWnUaT0h5NiC-OgkRuajhOC3TkygeMBr+Srw@mail.gmail.com>
Subject: Re: [BUG] WARNING in lowpan_compress_addr_64
To: Eric Dumazet <edumazet@google.com>
Cc: Alexander Aring <alex.aring@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, falemi@asu.edu, 
	linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000fadeab065aeeb2f3"

--000000000000fadeab065aeeb2f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The patched kernel (this patch on 28924df2a08f) does not panic on the
attached reproducer.

Tested-by: Farhad Alemi <farhad.alemi@berkeley.edu>




On Fri, Aug 28, 2026 at 12:46=E2=80=AFAM Eric Dumazet <edumazet@google.com>=
 wrote:
>
> On Fri, Aug 28, 2026 at 9:22=E2=80=AFAM Farhad Alemi <farhad.alemi@berkel=
ey.edu> wrote:
> >
> > Hello,
> >
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> >
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/182-warn=
ing-in-lowpan-compress-addr-64/
> >
> >   WARNING: net/6lowpan/iphc.c:937 at
> > lowpan_iphc_compress_802154_lladdr net/6lowpan/iphc.c:937 [inline],
> > CPU#0: syz.9.76/13660
> >   WARNING: net/6lowpan/iphc.c:937 at
> > lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952, CPU#0:
> > syz.9.76/13660
> >   RIP: 0010:lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
> >   Call Trace:
> >    lowpan_compress_addr_64+0x4be/0x9c0 net/6lowpan/iphc.c:952
> >    lowpan_header_compress+0xeef/0x1ef0 net/6lowpan/iphc.c:1242
> >    lowpan_header net/ieee802154/6lowpan/tx.c:234 [inline]
> >    lowpan_xmit+0x4c6/0x1420 net/ieee802154/6lowpan/tx.c:282
> >    dev_hard_start_xmit+0x23b/0x620 net/core/dev.c:3904
> >    __dev_queue_xmit+0x11e7/0x3250 net/core/dev.c:4870
> >    packet_snd net/packet/af_packet.c:3082 [inline]
> >    packet_sendmsg+0x3d9b/0x5150 net/packet/af_packet.c:3114
> >   Kernel panic - not syncing: kernel: panic_on_warn set ...
> >
> > Our reproducer.c is available upon request.
> >
> > Happy to test a patch if that would help.
>
> Thanks for the report.
>
> All these WARN_ON_ONCE() are bogus in modern days (panic_on_warn being
> used by fuzzers)
> Developers probably used them to catch unexpected packets.
> Guess what, fuzzers do exactly that.
>
> Also lowpan_header_create() seems to incorrectly return 0 instead of an e=
rror.
>
> Can you try:
>
> diff --git a/net/6lowpan/iphc.c b/net/6lowpan/iphc.c
> index 37eaff3f7b6940b73924c38c360adf482d6cceab..dec04f63f1b2599a7291d020e=
662f4d129333c14
> 100644
> --- a/net/6lowpan/iphc.c
> +++ b/net/6lowpan/iphc.c
> @@ -180,8 +180,6 @@ lowpan_iphc_uncompress_802154_lladdr(struct
> in6_addr *ipaddr,
>                                         &addr->short_addr);
>                 break;
>         default:
> -               /* should never handled and filtered by 802154 6lowpan */
> -               WARN_ON_ONCE(1);
>                 break;
>         }
>  }
> @@ -820,8 +818,6 @@ lowpan_iphc_compress_ctx_802154_lladdr(const
> struct in6_addr *ipaddr,
>                         lladdr_compress =3D true;
>                 break;
>         default:
> -               /* should never handled and filtered by 802154 6lowpan */
> -               WARN_ON_ONCE(1);
>                 break;
>         }
>
> @@ -933,8 +929,6 @@ lowpan_iphc_compress_802154_lladdr(const struct
> in6_addr *ipaddr,
>                         lladdr_compress =3D true;
>                 break;
>         default:
> -               /* should never handled and filtered by 802154 6lowpan */
> -               WARN_ON_ONCE(1);
>                 break;
>         }
>
> diff --git a/net/ieee802154/6lowpan/tx.c b/net/ieee802154/6lowpan/tx.c
> index 4df76ff50699ede5c187c9cca6f0cc10b19d2123..9bffe01cc448fcb993883748f=
359cc71b879a729
> 100644
> --- a/net/ieee802154/6lowpan/tx.c
> +++ b/net/ieee802154/6lowpan/tx.c
> @@ -47,7 +47,7 @@ int lowpan_header_create(struct sk_buff *skb, struct
> net_device *ldev,
>          * if this package isn't ipv6 one, where should it be routed?
>          */
>         if (type !=3D ETH_P_IPV6)
> -               return 0;
> +               return -EINVAL;
>
>         /* intra-pan communication */
>         info->saddr.pan_id =3D wpan_dev->pan_id;

--000000000000fadeab065aeeb2f3
Content-Type: application/octet-stream; name="reproducer.c"
Content-Disposition: attachment; filename="reproducer.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mtrzl8rs0>
X-Attachment-Id: f_mtrzl8rs0

LyoKICogUmVwcm9kdWNlciBmb3IgMTgyLXdhcm5pbmctaW4tbG93cGFuLWNvbXByZXNzLWFkZHIt
NjQKICovCiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8
YXJwYS9pbmV0Lmg+CiNpbmNsdWRlIDxsaW51eC9pZl9ldGhlci5oPgojaW5jbHVkZSA8bmV0L2lm
Lmg+CiNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KI2luY2x1ZGUgPHN5cy9zb2NrZXQuaD4KI2luY2x1
ZGUgPGxpbnV4L2lmX3BhY2tldC5oPgojaW5jbHVkZSA8bGludXgvcnRuZXRsaW5rLmg+CgppbnQg
bWFpbih2b2lkKQp7CglzdHJ1Y3QgeyBzdHJ1Y3Qgbmxtc2doZHIgbjsgc3RydWN0IGlmaW5mb21z
ZyBpOyBjaGFyIGJ1ZlsxMjhdOyB9IHJlcTsKCXN0cnVjdCBydGF0dHIgKmEsICpsaTsKCXN0cnVj
dCBzb2NrYWRkcl9sbCBzbGw7CglzdHJ1Y3QgaWZyZXEgaWZyOwoJdW5zaWduZWQgY2hhciBwa3Rb
NDBdOwoJaW50IGlkeCA9IGlmX25hbWV0b2luZGV4KCJ3cGFuMCIpOwoJaW50IHM7CgljaGFyICpw
OwoKCS8qIDEuIFJUTV9ORVdMSU5LOiBsb3dwYW4wLCBraW5kICJsb3dwYW4iLCBJRkxBX0xJTksg
PSB3cGFuMCAqLwoJbWVtc2V0KCZyZXEsIDAsIHNpemVvZihyZXEpKTsKCXJlcS5uLm5sbXNnX2xl
biA9IE5MTVNHX0xFTkdUSChzaXplb2YocmVxLmkpKTsKCXJlcS5uLm5sbXNnX2ZsYWdzID0gTkxN
X0ZfUkVRVUVTVCB8IE5MTV9GX0NSRUFURSB8IE5MTV9GX0VYQ0w7CglyZXEubi5ubG1zZ190eXBl
ID0gUlRNX05FV0xJTks7CglwID0gKGNoYXIgKikmcmVxICsgTkxNU0dfQUxJR04ocmVxLm4ubmxt
c2dfbGVuKTsKCglhID0gKHN0cnVjdCBydGF0dHIgKilwOwoJYS0+cnRhX3R5cGUgPSBJRkxBX0xJ
Tks7CglhLT5ydGFfbGVuID0gUlRBX0xFTkdUSCg0KTsKCW1lbWNweShSVEFfREFUQShhKSwgJmlk
eCwgNCk7CglwICs9IFJUQV9BTElHTihhLT5ydGFfbGVuKTsKCXJlcS5uLm5sbXNnX2xlbiArPSBS
VEFfQUxJR04oYS0+cnRhX2xlbik7CgoJYSA9IChzdHJ1Y3QgcnRhdHRyICopcDsKCWEtPnJ0YV90
eXBlID0gSUZMQV9JRk5BTUU7CglhLT5ydGFfbGVuID0gUlRBX0xFTkdUSCg4KTsKCW1lbWNweShS
VEFfREFUQShhKSwgImxvd3BhbjAiLCA4KTsKCXAgKz0gUlRBX0FMSUdOKGEtPnJ0YV9sZW4pOwoJ
cmVxLm4ubmxtc2dfbGVuICs9IFJUQV9BTElHTihhLT5ydGFfbGVuKTsKCglsaSA9IChzdHJ1Y3Qg
cnRhdHRyICopcDsKCWxpLT5ydGFfdHlwZSA9IElGTEFfTElOS0lORk87CglwICs9IFJUQV9MRU5H
VEgoMCk7CglhID0gKHN0cnVjdCBydGF0dHIgKilwOwoJYS0+cnRhX3R5cGUgPSBJRkxBX0lORk9f
S0lORDsKCWEtPnJ0YV9sZW4gPSBSVEFfTEVOR1RIKDcpOwoJbWVtY3B5KFJUQV9EQVRBKGEpLCAi
bG93cGFuIiwgNyk7CglwICs9IFJUQV9BTElHTihhLT5ydGFfbGVuKTsKCWxpLT5ydGFfbGVuID0g
cCAtIChjaGFyICopbGk7CglyZXEubi5ubG1zZ19sZW4gKz0gUlRBX0FMSUdOKGxpLT5ydGFfbGVu
KTsKCglzID0gc29ja2V0KEFGX05FVExJTkssIFNPQ0tfUkFXLCBORVRMSU5LX1JPVVRFKTsKCXNl
bmQocywgJnJlcSwgcmVxLm4ubmxtc2dfbGVuLCAwKTsKCWNsb3NlKHMpOwoKCS8qIDIuIGJyaW5n
IHdwYW4wIGFuZCBsb3dwYW4wIHVwICovCglzID0gc29ja2V0KEFGX0lORVQsIFNPQ0tfREdSQU0s
IDApOwoJbWVtc2V0KCZpZnIsIDAsIHNpemVvZihpZnIpKTsKCWlmci5pZnJfZmxhZ3MgPSBJRkZf
VVA7CglzdHJjcHkoaWZyLmlmcl9uYW1lLCAibG93cGFuMCIpOwoJaW9jdGwocywgU0lPQ1NJRkZM
QUdTLCAmaWZyKTsKCWNsb3NlKHMpOwoKCS8qIDMuIHJhdyBJUHY2IHBhY2tldCB3aXRoIGEgemVy
by1wYWRkZWQgbGluay1sb2NhbCBzb3VyY2UgYWRkcmVzczogdGhhdAoJICogICAgaXMgd2hhdCBz
dGVlcnMgbG93cGFuX2hlYWRlcl9jb21wcmVzcygpIGludG8gdGhlIDY0LWJpdCBjb21wcmVzc29y
LiAqLwoJbWVtc2V0KHBrdCwgMCwgc2l6ZW9mKHBrdCkpOwoJcGt0WzBdID0gMHg2MDsJCS8qIHZl
cnNpb24gNiAqLwoJcGt0WzhdID0gMHhmZTsJCS8qIHNhZGRyIGZlODA6OiAqLwoJcGt0WzldID0g
MHg4MDsKCgltZW1zZXQoJnNsbCwgMCwgc2l6ZW9mKHNsbCkpOwoJc2xsLnNsbF9mYW1pbHkgPSBB
Rl9QQUNLRVQ7CglzbGwuc2xsX3Byb3RvY29sID0gaHRvbnMoRVRIX1BfSVBWNik7CglzbGwuc2xs
X2lmaW5kZXggPSBpZl9uYW1ldG9pbmRleCgibG93cGFuMCIpOwoKCXMgPSBzb2NrZXQoQUZfUEFD
S0VULCBTT0NLX1JBVywgaHRvbnMoRVRIX1BfSVBWNikpOwoJc2VuZHRvKHMsIHBrdCwgc2l6ZW9m
KHBrdCksIDAsIChzdHJ1Y3Qgc29ja2FkZHIgKikmc2xsLCBzaXplb2Yoc2xsKSk7CglyZXR1cm4g
MDsKfQo=
--000000000000fadeab065aeeb2f3--
