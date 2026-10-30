Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793362473;
	b=tIFUkV2BqdxJsPOiEiSh69zYrOxZksPRpz8gaZqPLGk37ZRd1gQ1zx9CWoYdkNXFWLPC
	 VK2wmMe6ra8uNsR0LTTTLmFz51LiOK+mWijHDXHXNv8vB27G7MHKD/8u7QVjrI4jqjmJ9
	 MRVmJQtS5KAdL0bSridLukxuStgp47FD9w9TsS6Ph3JGVbO1YOuvHE+pZJCCy3g9vCdoG
	 XeZdkqbBrphGIC83qVFAtbeR1PNQ5t0IgIO5sx9gy98NRH6qIzSka+g4mtbG3w5bmxIsA
	 2QMv1FltOCmYShIgR5X5Uo02QZpZNyKpvBL5S79VhE6ohPBoo7iD4vB028Rfg7Deh4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w4dT7+zzouIRSasfVh4mCzZhhWACxjzEVFuCstv7SCs=;
	b=u702r0nTvC1U/CYpjnBEAxsJjpPNb9JHvFZH1djGjetAm2ZAhlGehbUTklK8FAoGMo7B
	 ozQ/CX/pYh1ugNTw/uPGEX0npRLwwh8aT7BNqu6hV4SMqzqXXOikGoIKceXcvjh7uLATV
	 DFm14d0mWl+LswFuBKdHhn1mPPy4V6YS0pi3+FGX1l/FRHBhLt/D7eshcog/Qvu41iz/h
	 +mlZ8rqh7vag8td5GSYSQ9nFQtUOZBhznl3sCvl6W/vK/4DpQ6MX5B4nq5Vh9s91hNTND
	 16VRizGG/ZmgKMhkCsePxE91/AnixNqNLh0tKjZQ8TlFPCooAJuKLC5al83ysN/mUKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ll2lyF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1CF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C1CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O0ll2lyF
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc365db987so425311137.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793362472; cv=none;
        d=google.com; s=arc-20260327;
        b=JVgo/vpB+hGnwGOwdTUpPakHlaJfZpv+C2xhP9Cc6ZLMAphGJG3ItYgt7tvsABS0ph
         y8QxPeR6fvracbnVv1FuQT5sOTfKivHDyzT7iHxiwOr3V1TaiAtVBdSTAYVuxhTkVkZa
         k9NLNzeEBKv3EYTBbin46/uCKjDCgfbNcJM5XlJDsMOfncG75ejws8uPZ3O6d5c4VLUf
         cUeAl0w4cpk6hCKj9Igih6cskLSHkMVYfUgzvOVMuggaZo8ig3cxa2kVLGGTxKeBNSj+
         zx5eQHtWAqxaJBRVWD/IIM3V9SJZh/IfreqGWur8Gkcgpc0hXg/b3oTrUcUibGu2XhSu
         uwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4dT7+zzouIRSasfVh4mCzZhhWACxjzEVFuCstv7SCs=;
        fh=ASey4iKkdRK0CcoSmm2Tk//AOdQTP8bocyV+UB1mVjE=;
        b=Wrf0kBf+dNJmac43hPmxu+ZJwsxOHu0Pgj8lAuhw8w+uD5AgqlP2OEapLHTFKHYSHw
         DgEdbkoqRB7HduWLR5KB92o1swXTpUJinFoiI3nPqtYwb0tav8ivoBspGovDH9IvPB1y
         u8CZHnu8j0MM2Yea/MspVvIW6DHHfc9yYvo6ml88CCNs3wRtdVdpyKW67MxcR3F9mmLp
         nnOeia6VASybnI6t0B5kXsFO12bf3/ji+DN/OriB4VcSgWVd9czyLqf8W+qCBx2GiGcF
         1FLoQxY0hNeQrdxZvvXOf/etDpiniiwmX3bTrvh2vSlFd4FQOaKUJcQqGjFpN65cXKox
         07KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793362472; x=1793967272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w4dT7+zzouIRSasfVh4mCzZhhWACxjzEVFuCstv7SCs=;
        b=O0ll2lyFg8yedCrW4diHl812+qZaA/T6lvBbBSloOtP+mbxSvKtL7ptL1s04aIaVXy
         M+EO38xWsDb8S1TxUVk/I46L+j3VSEMj47O+VP5xEbRPUL1E/L/EsX+fCNpvFnfHB2ek
         svhbUYeVGb0V84eWe4lGBLudh4HsiR/BoNmt1lUANvFCqc7QOgmRGEmV7LDqlIXEgmQ3
         mA07X9fB0z6JYbD0GbkJpZUnc7sKOZ+N3kidh+Q9s+abYgbBBn9pVgPkpF5DO6PmrMyR
         DQbLPirtNV2aK7prE3I1ssISnf1geVQK+5Fe+NKCdOI3owHOvYuJMMvBI8baMQj7B7MF
         EJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362472; x=1793967272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4dT7+zzouIRSasfVh4mCzZhhWACxjzEVFuCstv7SCs=;
        b=zONH05iJoR3DlqSNLppSsYC/fHEpDRmd0fXw7Hg+33TG5qtmOXRgBTytO065X1u1zB
         rNKXPaIN5fSH/IQ2tYsEHto2hPiEYi5d4D5qdp/Tl5uu9BU9c7HSY12V+nN6spIZTWA7
         RIW+5558JenASHMrD159JzEC4u7604K1ZmDlnd0YyoLxm6bXS1bgRDxjsNobDBN1EN+u
         SaYLWTFgLRqKuQ23aPvXID/qFtDbCLYpCESOM826W0zOsQwx8M+zm108ub+Lwmr8/4Kd
         g4DOoxFhvLgizY0ob5zp4SnUKVSFB6azMXMU+TUUK/0jAn2iUisMESTEu40D2XRE80uN
         0ksA==
X-Forwarded-Encrypted: i=1; AKwUvBz5CP1gxUKcVv6tSNAveCuK0iLamv0+L0VWtR946x+9Z/JFV5W5Svb7mPqP4Q8xuJ4gXJf4yqqqnUHIul8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJICLD4UU8Xd77JIxbXvku/RwE8om5fJ/R5sTja+pEtn1cPH0py
	ONkQkK10Ny8ufBiXdghOcJxkRtD7oDR/tB6cQ/AxqdAivmz/OKehiY9Vj1odut65jcoColT+GmR
	7HP7lg3XOB7+ZsIMY9JnkbRKaldqbi60=
X-Gm-Gg: AYBFou0/lKnGZj69K5GN5ZU+MC9x4+TtXvLSLmjxN8+6kzVazyaRwjaTTvyTXb1eoqg
	1gQZMLG+9kaNjbPOdRSBWb/jVdK71drI8s8G5lke7RWR/qcmxeSN6ITs+95Vup4P17d4znLBRko
	HIFZvN+CdlioqDLMxmdnmKbitXI4ZKdUky0Hnn7MEgsrTtfMk75iI4RUMAENu5ikcjDYvGbZl5N
	fsRSUPLYpx8RK9LAm2JInyKU7wthaBRNd+7jXA1YnriHAOgFPI73keyrhQRDUM4W0sp3QvMaVTC
	MBy85YxK+65TwqqWm0yjDyhvv7pbDnLvenE3uZSYgC9KoNxeklP0YAi9rhxRksbcV13WSngTu34
	muk705GzBUJezEkeBPcIxgkew7DjPfm4KkT9DayV4qjM3T7gtbuv70tH9vycTXDwRUzed94wOrJ
	dcIt3Gi3/EkYnYPSk6WTHWUW1pSSXrwkS1WD87qrJS0dT7kfr8sm/OJhAYp8ewfeoCorjMJyNo4
	mbAIFUo9/UYv4OMIB532in5rljfhebRtQpI38zs
X-Received: by 2002:a05:6102:1481:b0:7cc:33c9:b3cb with SMTP id
 ada2fe7eead31-7d072731e9amr1107407137.29.1793362472486; Fri, 30 Oct 2026
 05:14:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <undine-1792936915899334889-d965251e73c20670@undined.local>
 <cover.1792949723.git.edumucelli@gmail.com> <undine-1793319942513765724-cc2757c235ae029a@undined.local>
In-Reply-To: <undine-1793319942513765724-cc2757c235ae029a@undined.local>
From: Eduardo Mucelli <edumucelli@gmail.com>
Date: Fri, 30 Oct 2026 13:13:55 +0100
X-Gm-Features: AclHuK8g4qDo8Jre1l7QNAtNn_dnIUq8Ecn97-_j2MMIyL44eN0BKMtSNrY1Tr8
Message-ID: <CAK0NWSNp75-8m7+nxO0ot4yPSFRTM2+eOKZUwGm-JLmRMEL7-A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] tools/bootconfig: Fix histogram filters and
 variable names
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Masami!

On Fri, Oct 30, 2026 at 1:25=E2=80=AFAM Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
>
> On Sun, 25 Oct 2026 18:35:22 +0100, Eduardo Mucelli Rezende Oliveira <edu=
mucelli@gmail.com> wrote:
> > Hi Masami,
> >
> > Thanks for the review. I've combined the two fixes into a series and
> > used the two sed expressions you suggested.
> >
> > The first patch keeps filters when exporting event triggers. The second
> > handles underscores in histogram variable names, so the exporter keeps
> > histograms that depend on them.
> >
> > Changes in v2:
> > - Send the two previously separate patches as one series.
> > - Use separate sed -e expressions for [active] and [paused], avoiding
> >   GNU sed's alternation extension in patch 1.
> > - No code changes to patch 2.
> >
> > The original submissions are here:
> > https://lore.kernel.org/all/20261023084947.3264289-1-edumucelli@gmail.c=
om/
> > https://lore.kernel.org/all/20261024110837.696216-1-edumucelli@gmail.co=
m/
> >
> > Feedback is welcome.
>
> These looks good to me. Let me pick it.
>
> Thanks!
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>



--=20
Eduardo Mucelli R. Oliveira -- http://eduar.do
