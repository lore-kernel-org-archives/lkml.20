Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5E04C224E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829707; cv=pass; b=QOZJ04M/MkVk6FWVRMw/HTWuoQQRrI4w1KJIGsxlyOqzctdfJbJ/fZB+6qj8+tx8iO0Ba7VIl3zb8S18xAZxuHMyUZloEPKWJaY0o+JNthErNdwycQTW/SFLukcmY1Z6Jn979B33oonTSHMg4dxlTxUCjyJhOqmoxZM9GjwubQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829707; c=relaxed/simple;
	bh=2mmj39FVD9H+6MKCykjknuGWjn7OlSg39OOr5Z+KSK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHCoiVPjP6vqHkS/l8fxOeTxPaAvi30NAnkwzlcHdRwZkkHXrTjRNNpCSjcNhjGpZ45Sfp0YuCqTpc7A+ydU7u6AbPNF+DtGMRGcia/P1D9q+vSMr1VN83dqqldn2WfOKltbbcMPtJW6nHvA/7X8f+1hwrbFEoCbAWCP/5z/9a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1F8gvmE; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1F8gvmE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso284528166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829704; cv=none;
        d=google.com; s=arc-20260327;
        b=d98vmS87S+CkaU4WjprPxkXCdjMjt2tiTszU4dcsZf7WdivML1r48cD0SioXyaOayz
         PE4Kx89oBG+SrZUsWEmpLNVDH3E56Yd5wDwFTcfWUwNO6TGS0zBWkhQlG26/ZLuqCmPC
         xtCquSfHATNfFAm8WG3H6JPR3SNlYtf7l78waq/UFfTSmbac69D+aYRp70Ef3Ml7cjIy
         bJrXIvK2q3NtWv3cmSkR2UytlMjmvJYdKz624ZSMKP0IbmEq1HOVxRcYFVzPV0jcstS1
         ocDL2Lu/yEtu8Th8JOkGZZ6Y69nIc0RIXZy1p/ctO4ilZ2K1BdEko3JXvD13q55ecb2m
         QRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X1HT9Pt+o9MrzBBoQCfbPBHKtSg9tMq6DaY0MoNl9E0=;
        fh=2uPI0BSxY/Pov0uSdIgLijzxdA8UaBSR1JOYXAwYn7M=;
        b=VtCGeCHi7/d0uOh3RAs7a2AqYMBPFv3O+HpGYZb+AdTeuurKn4gggeLeAreIw18ykk
         +udjVhOHKFwAXLegBP+u2GKzn160OlRPwr69tib1Zfjz/3LHK3JslNqWVpR+V3XlHyjB
         T6MWKpm4qCsqv2BkuVNUurzb2xViUZXcM34NmsIExnNB4eovBCFuFffeSLnOTC2L1a9P
         /qVpGWY07o8sm9ciWb34GAKrqOuxnRU5jO4gGw21dADMA/1RIpm1wtOhnQ1KzqYjdHUH
         1HUj5AbwBGX0gJYVn/oe72dCBzkdj3aK07Y7p+A3LJMNsXYHUbWhWFkffgTarkkNncU8
         UDTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829704; x=1792434504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X1HT9Pt+o9MrzBBoQCfbPBHKtSg9tMq6DaY0MoNl9E0=;
        b=p1F8gvmEmuxDM85inzvPGWZIKFWSxCvuHUMFU0Dcfcc9175Pjn4qJP24quyLliM7U5
         5ytwz/AAI1YJvcdhymS2LHZr8zjWh5GFOF7Rs+N3yFbdSQmCUEZ65XFgmVdYOlmyk+bs
         gsJvcZPgY48YRCwUfqeNiECUjbEWdw6M9NeIsRzQkn1s7a8mNXIwJiqIltzqwfAVvfrx
         e59KEWsRUnl5X9bqD9ZvjJj94tkaEkSf+yrI6FwNZU8//01f450zN+IIJNdlS291ztSw
         9Wb7TRi5DjIV3KqABYMu4eI+5Q93FmFKrm7BIwLyokBsRVGFvjdl5EvynTmGDl46IECv
         sB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829704; x=1792434504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1HT9Pt+o9MrzBBoQCfbPBHKtSg9tMq6DaY0MoNl9E0=;
        b=Eo09grnfJw/zsjhJuaGO0mXaRi3w12Oe9d89enwBfBT/34bn7Mg2h63fQnCfhEj2tS
         Kr3ViJAkkBnSAE6Sa44x0DR1ipewnKzxpstyB2FFmWWr6wFX5iiDs+zZrV8D/GDtlPAf
         fcUOXmn9Fxs2UJl8v343PWJRHbeq6e4S5Oy7UUBI+dlXAhGIkl2X4lbwGXO5AA3IHUru
         AcirIRXA1TGsmtED1KXinirJYXS4i4b19NiMitsgX5Srbag9d22TjzW+zhmwZB+0BBWS
         Vb7u/ijnxEU1HvdtfFZathJe9X1+ra1NV4p2wJxmtHYpJpVLpG9PCSQIorVWvYfppZL0
         aqjA==
X-Forwarded-Encrypted: i=1; AKwUvByStOKuQE16T7Jxm/EMSsT/FyWZ8izigQFzcVvGu0UUHTUmfcUV9Xnc+ERWNpPa5bP1d6wUOY4Va6daorA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFp/6tt322V4Ha3YIHc89/REq1WeYpjPrmgy92uSXIX0CFove1
	sdFb2rY7Ps1Xa4hivT+lGSeN8nw8nHCD8NS1FhtNuyh9JhfZuGBSFTm5Rm9ynCnFlIOeDw5gaVF
	O6VHQ45VbK5Qm5gP28BT6YwYS/4apfhA=
X-Gm-Gg: AYBFou21z/DTwSB7SlOOBnY+wk8piodYGwV6UCUv6jfIo86lBN3u08cOjPQVLCFZuqm
	tMcrU5AueNrLiNskchDa6RmQkGoOhsDxYMagKQH05VI93j3xXQCMAN6TrLv94EyFmUBQ2VFuKtZ
	Yi4eEtxuH+2L137qvZehTNgwz5+nGPIJVD4NnumFTTrWya36lFJ0XNo5Lm1EIVDbsUt3srimE+9
	PApXkm/IAJ54HFOT4sFL2XRRm6jCEVVhhF4Af8D2KgeKZ80LcCCN/o3sB1nePKIGjs9uCwn8Hoh
	uBlWltwULFBNqUMtEp4MyNK9Fk/MyCpz81m3wKeelpVDKId7tBH2KEb3w8OJTMFYHygxrtviUDx
	vj0/KG6uBWW0Ang9AteJt+u9q9hIPstC7Tb9tgZTk9poqu/ub0mk0I0QGdVfCkrx0k/+5lXDfro
	qWrB6/MejCjedir8yJYOH4dNclDhJREW+V/Yvd6QmoqX/NycImqm2ljgrLOFDKZ3HdX+NMdTap8
	8J1
X-Received: by 2002:a17:907:6d16:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c31a9f8d2c1mr953059566b.33.1791829704105; Mon, 12 Oct 2026
 11:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012180052.55578-1-rosenp@gmail.com> <a877ad04-c4ed-4e32-a1eb-da524146be14@kernel.org>
In-Reply-To: <a877ad04-c4ed-4e32-a1eb-da524146be14@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 12 Oct 2026 11:28:11 -0700
X-Gm-Features: AclHuK9om4-s7JbX2EeWgr9wdpDS-k9VE1RFDW2IRINiiqHf6FMCUdMdoAcCjcc
Message-ID: <CAKxU2N-VQ9fWGvdNvyZ7te1gp08qMSvbSpgLrKRkqDO+Y+bYwg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/lib: prefetch ahead in __csum_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:18=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 12/10/2026 =C3=A0 20:00, Rosen Penev a =C3=A9crit :
> > __csum_partial() walks the buffer linearly and reads each cache line
> > exactly once. On cores without a hardware prefetcher, such as the 464FP
> > in the APM82181, every new line is therefore a demand miss that stalls
> > the loop. Packets received by non-coherent DMA are never in the cache,
> > so this is the common case for GRO checksum validation: when routing
> > TCP with GRO enabled on a Meraki MX60, __csum_partial() takes about 30%
> > of all cycles and is the top entry in the profile.
> >
> > Issue a dcbt four cache lines (128 bytes) ahead in the main loop.
> > dcbt is only a hint and never faults, so prefetching past the end of
> > the buffer is harmless. Lines that are already cached, for example when
> > checksumming data the CPU just wrote, are left untouched.
> >
> > Measured on a Meraki MX60 (APM82181 at 800 MHz), single TCP stream
> > routed through a qca8k DSA switch, iperf3 median of 5. Only the dcbt
> > was toggled at runtime, in the same boot:
> >
> >                LAN->WAN               WAN->LAN
> >                Mbit/s  csum cycles    Mbit/s  csum cycles
> >    before      495     30.5%          439     27.2%
> >    after       599     15.3%          520     13.7%
> >
> > That is 58% less time spent in __csum_partial() per byte.
> >
> > The prefetch distance was chosen with an earlier, slower driver
> > configuration (median of 3, Mbit/s):
> >
> >    distance    LAN->WAN   WAN->LAN
> >    none        370        341
> >    64 bytes    430        381
> >    96 bytes    438        397
> >    128 bytes   438        385
> >    160 bytes   434        386
> >    256 bytes   423        383
> >
> > Prefetching the first lines before entering the loop made no
> > measurable difference and is not done.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> csum_partial_copy_generic() does the same, so your patch makes sense.
>
> Wondering if you should use MAX_COPY_PREFETCH instead of hardcoding value=
 4.
li      r9,MAX_COPY_PREFETCH*L1_CACHE_BYTES /* prefetch distance */

LLM comment:

What changes per platform: MAX_COPY_PREFETCH is 4 on every 32-bit
config except 8xx, where it is 1. So 44x, 47x and e500mc behave
exactly as before; on the 44x (canyonlands) build the instruction is
still li r9, 128. The one difference is 8xx, which now prefetches 16
bytes ahead instead of 64. That fits how the copy routine already
treats 8xx, but I didn't benchmark it.

My comment:
I don't have an 8xx device so I don't know if this works properly there or =
not.
>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
I'll keep this in v3.
>
> > ---
> >   v2: reword commit message and retest numbers.
> >   arch/powerpc/lib/checksum_32.S | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/lib/checksum_32.S b/arch/powerpc/lib/checksum=
_32.S
> > index cd00b9bdd772..5a14d45c7b9d 100644
> > --- a/arch/powerpc/lib/checksum_32.S
> > +++ b/arch/powerpc/lib/checksum_32.S
> > @@ -43,6 +43,7 @@ _GLOBAL(__csum_partial)
> >       bdnz    2b
> >   21: srwi.   r6,r4,4         /* # blocks of 4 words to do */
> >       beq     3f
> > +     li      r9,4*L1_CACHE_BYTES     /* prefetch distance */
> >       lwz     r0,4(r3)
> >       mtctr   r6
> >       lwz     r6,8(r3)
> > @@ -52,7 +53,8 @@ _GLOBAL(__csum_partial)
> >       lwzu    r8,16(r3)
> >       adde    r5,r5,r7
> >       bdz     23f
> > -22:  lwz     r0,4(r3)
> > +22:  dcbt    r3,r9
> > +     lwz     r0,4(r3)
> >       adde    r5,r5,r8
> >       lwz     r6,8(r3)
> >       adde    r5,r5,r0
>
