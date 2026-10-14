Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14214F55DD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976230; cv=pass; b=eiTQdCfV0z2A819y/jhfA1T4dey/hYNBZTFWD+DUqFjiz+q3pH1aOmaLpE5ijRNFevhrkx+Nwt1CNGQ7KjQqYAwNADiqTPIMhcNq4ZOj0AKxCFt8Fejw5G+aMG0+NlqrQ3YQXq4AOHJ+lGhi1EnmumJy78awyrBEjSLZdeqnRqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976230; c=relaxed/simple;
	bh=9DHQFxO3nsBulx/2xMbN/Yydkkg79eWl+cOzJbIkWyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq11YMSA0P6v4ccPxiUiUzLBKPDKsNBz3pGvAvtAXCRAewXFLPmicrjeMbArl2yTvNmIrfkKbrpcMdBPYazpXXH9sjieST/x7a+4jMUXvZequct4kV54D/eNGUWrEcHev0sK3t2nAkAG+VpIIYnpHEPSR2v0Mn7AoL2Y48PDHk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=W0BAwgTi; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="W0BAwgTi"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a75f960be3so10906011fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791976227; cv=none;
        d=google.com; s=arc-20260327;
        b=elZ6Z7xrbTdZ7plpCauH7VFZvwqH1bxchgS7KgFACmWqNd9q0vN0zsSfVYtRXeQJMd
         SunPKG03G/YnFARr+hMugavWupaafI9Fv29CIPMJjcqFViCB7t6QB/rdMtbd0CMob8jh
         iqHTOZvpU/uIiyEGYaMAwN5qCEfcdiBahW1TAzwrXQV2tngcE6wv3aNALR8Nz0FwB8lq
         6uqmoT02iOp7XRQwOX+nxVK0gYc6qQsRwDWuq+JGzLPzAFKp4SOQZT4aDjsQS9YKMOMk
         lJUtitsFnFCgTKhyePKWvJUBLKILNSAn+bSQ1ajntIuJkdUZpWhrZUmRhIytC7Pe9Jec
         gFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9DHQFxO3nsBulx/2xMbN/Yydkkg79eWl+cOzJbIkWyU=;
        fh=tb1ZsAT7yidgoteMIPewYGOnPxfYCnC+qC4iugCbg7Y=;
        b=er+cES32y6j3TSjs0OgGYsGpl15go8GzJIDUPUhesnRD9B//K2CZ3sLxC1ElTKHpzu
         bo0sSRFbLrc8hhyitYXC759P0KlNU05hwyU+Ruqf+Atuy2+6zr1lOLX3ROlSloBhNJFF
         gR/S1ZGnyRDpNbP2Z1cxNx1ISOqJwE1vxC0XPr+GnoOsUI9idLVyu7Jb46tSZ9Wbvc1G
         gxvyF7pIyez/Qyc5qTeBnKJGgjA5B3caXtKttoICBL9d+v9eEbgaeaKaZUkdrG2FzFNi
         pS1JFgvhTZ4RwwwyOu8fbUrUHtdFbnepSXxCpjQ+TfoKAwnokOTcdi0r45bvZGuQPYbp
         Fa4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1791976227; x=1792581027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9DHQFxO3nsBulx/2xMbN/Yydkkg79eWl+cOzJbIkWyU=;
        b=W0BAwgTiyUUJP5ogTDoSEenxyJ9805hbARINt1UQM0buBtr7JkNCdu5hBDXhxWomHw
         pyApLeMXJQGPNS2DOU3oh5J2Vtxfy5j1wMAcPm+Re65QkKzq2NjaVTuF047NUZubWrZf
         Lj4suRHPRFib9ayNxFku8BkUKDUT0RajRsvB3VDg+1IK1fOhgC3FdQFVg+KG1bGZEv6H
         5MUPDESRHrMb8A0PZ/qGLeBH90GeyBzyqXFZ8kuXoqmEPA5aUW8dXNOHuwmdtQ9ZKMDw
         71zbub/jIxFxOZEYq+tUFZvA2OMYpmmR9tpPWx079Xrtujl4sVJO6tO8GdpIfn4QmlPy
         jIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976227; x=1792581027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DHQFxO3nsBulx/2xMbN/Yydkkg79eWl+cOzJbIkWyU=;
        b=j6ei6lcZxikUMfU4m68ItFOp3SFhjQbDngMVAmP1/jttxYtm5KirW+C9LwOrRCaOGD
         fKelocyewtlZhodUYB3zxeJHXayDGncljuD7vVSjVriYLIbTKVEbv+Q7cMXXVxGFIhUJ
         ryxxkk8lUUDgngG3hlG0J2CG03qUeGzFNJM6Ek9lgvTvZWT/M8SOxW56W7o7vX7y7Wve
         fXAX4p43mDKTd3ZTXabbNXw9vfyAkMMq4wBXO+1aDSL0cXHJbwOrSTIgND/UgYhUEalJ
         a3Oa/1gf9SzmqsCe6AnJQkIHoR8IZEDxlBT1urAf++DNYB4PCXwjMXtFaZG9V6ZSQAEQ
         eEPw==
X-Gm-Message-State: AFq9FYIMzBWTmuSpR7j0EqzKVlceTHpfPgs5t34sygayjx2S9tVKdKFC
	PLZoOSC/eREMWUM2ehi/JFSt7ZDMtWwGveAruMNV1frbXg71QyAxl1G6eRfTffzszuTj/ZEMpXL
	ZgtW2UsFDhzZQXOaWRYvw78MPsgevNUGWzDDgxj35T24=
X-Gm-Gg: AYBFou3SsjdxI4Xys6gtsVQK6IRdIWcvv5NYpk5qeI70WhBZZ3oVvP19OToTItYT/Gb
	0ovODCfFwQ21fd8Jg0t3AhTl/TgNpNp5dVJP8m1Vm+2lSWIROwfE8lcQa7gAppn9u8JpAjqy1xi
	HNAL+QDXkG/UINXmrtmo0UMdRf/7AjfzsYLjbM42IzyFZbT7x9PkIbl0/fXUARR/VPB7qwdhdAM
	mMxmgWg9bCWkkZQ9IJPJ6KJ1844rA+Vocx6IPYfcqR5easLgf3aUDTXfnkVLoQEKmpTiLP7Lb9B
	18sCOIjw+2DtX5pNYBXSvRfU77hKmwpbHXSS44RLW1gwPlqaPJhlO2uerqHC9nX50ij3avRdIzO
	7sE+qZ9ENQQ==
X-Received: by 2002:a2e:b8cb:0:b0:3a6:687e:9cfa with SMTP id
 38308e7fff4ca-3a9c5384d1dmr38367951fa.18.1791976226868; Wed, 14 Oct 2026
 04:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791688819.git.zihanx@nebusec.ai> <9c51ddfce3069d585b6c9b87e7e1bf3a3b0a2761.1791688819.git.zihanx@nebusec.ai>
 <asukIMajFpbzx3PH@strlen.de> <CAANe3eQSU06GJAaaj8Fd=S+THSJn0Eu+1Bt_E=VNZ0=rAQXnBQ@mail.gmail.com>
 <as9cKonuO_37jfA5@strlen.de>
In-Reply-To: <as9cKonuO_37jfA5@strlen.de>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 14 Oct 2026 19:10:13 +0800
X-Gm-Features: AclHuK-36coDSsBSb9oeL5ElBY9SYxeXCeQt02viiLEFj8h4JKJohFPJ1jlVmf0
Message-ID: <CAANe3eTxmR36NS5_CqMiqu_WRQtmyepEB=TG=Sj368t1Ppa5_Q@mail.gmail.com>
Subject: Re: [PATCH nf v7 1/1] netfilter: nf_dup: preserve duplication guard
 across NFQUEUE
To: Florian Westphal <fw@strlen.de>
Cc: linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, pablo@netfilter.org, phil@nwl.cc, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, kaber@trash.net, 
	jengelh@medozas.de, lukas@wunner.de, vega@nebusec.ai, root@tr0jan.top
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:40=E2=80=AFPM Florian Westphal <fw@strlen.de> wro=
te:
>
> zihan xi <zihanx@nebusec.ai> wrote:
> > Hi Florian,
> >
> > Thanks again for the review. I tested the simpler approach you suggeste=
d:
> > extending the local_bh_disable() / local_bh_enable() scope in
> > nf_reinject() to cover hook lookup, hook traversal, and okfn execution.
> > The experiment changed only nfnetlink_queue.c and built successfully
> > against nf.git main at ab699d296e06.
> >
> > I ran the IPv6 TEE/NFQUEUE reproducer in a 2-vCPU, 2-GiB QEMU guest
> > in a network namespace owned by a non-initial user namespace, with:
> >
> > QUEUE_COUNT=3D1
> > PAYLOAD=3D1
> > TEE_CLONES=3D1
> > panic_on_oom=3D0
> >
> > The bounded run reached 68,881 callback iterations in 6.700 seconds and
> > exited normally. No OOM, panic, Oops, BUG, or soft lockup was observed.
> > This was a bounded resource-consumption run, not an OOM or crash test.
> >
> > The reproducer continued executing the callback loop throughout the
> > bounded run, so extending the BH-disabled region alone does not address
> > this case. It protects against BH interference during nf_reinject(), bu=
t
> > it does not preserve current->in_nf_duplicate across the asynchronous
> > NFQUEUE verdict path: the original ip_local_out() or ip6_local_out()
> > call has already returned and cleared the task-local guard before
> > reinjection starts.
>
> Why? You'd store the current->in_nf_duplicate struct nf_queue_entry
> at queue time ("this skb is due to recursion via nf dup").
>
> Then, on reinject, you'd set current->in_nf_duplicate to the
> value stashed in struct nf_queue_entry so that if we were queued earlier
> from the recursion a potential further 'dup' would see current->in_nf_dup=
licate
> as true and skip next duplication round.
>
> I think one could add a 'DEBUG_NET_WARN_ONCE(current->in_nf_duplicate)'
> in nf_reinject, I don't see how it could be set on function entry.
>
> What did I miss?

Hi Florian,

I understand your suggestion now: save current->in_nf_duplicate in
struct nf_queue_entry when the packet is queued, then restore it before
nf_reinject() resumes hook traversal. I had focused on the BH-scope
change and missed this state-preservation approach.

I'll prototype this simpler direction, add the suggested
DEBUG_NET_WARN_ONCE(current->in_nf_duplicate) check at nf_reinject()
entry, and verify the flag's lifetime and cleanup, including requeueing
and all exit paths.

This approach is intended to address the IPv4/IPv6 duplication guard.
nft_dup_netdev uses a separate netdev xmit recursion counter, so
I'll review that path independently.

Best regards,
Zihan
