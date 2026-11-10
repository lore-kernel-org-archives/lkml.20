Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794348633;
	b=RPLjjU2YMdkpGaaXL48P2xjmGLiz/SRIvh7AdcDezumjmv0I5ua4LWy5xd25PuBio84b
	 DXXvqrCGQyZw+m1fJHAH5pjyMfEejUFMJSXrt/KmA2kwXf4CwnkQ4a8Bm10sVJ07gRGDH
	 Xvz3LRMD2g8GIooOQMOlC6D3pdUeqMyr7+ekoB3p/HUhMmZn0aVzVGI0qCDY6YzBgdwnd
	 YVUKKzbwpmuaDqQGB5LCv7NxK4SGZb4TUcPkMJacZKn6/4kY9+QWv5H07hiQqX10mzvD9
	 7J4IK3irPxOYU2Q6l0ADP+ANybn78SN+NqGsNXyjkSOen0IB5YUhUccfEXR1TFfOfuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=23Pxla0x0VyCOsnAcGwpllmJRatGxCqJdHyvmPf4tJA=;
	b=fOpsUxh7MLU5u3vlcaOBzCWF0SmrDwN7UIngHbu8tqIlLz3ITaLS3OmTeP8RtPmHQL4r
	 OUw1CBezM84O5A5MkOO3bCe4LUBElwUG4X3l5XHowDaXKN8PFit7Rg7Oklq/I2WSYhLhp
	 D3F6N9+DOtotJJB0LPCfV6vvdZOUE76htJfasaUXojI3Mk7lxrrNsaNl+3jTrquy+tVb5
	 MVpBXmkO7yEz7SDXk7UxtpxKNYip5zCIvAZZkyvxfiYChCYXDXSFYhdo6vV1Y3ymypiUl
	 cixXK+68KklJwK5H5+rihzL48wun8hdsOR0clsd/gmeLSL+16Os5xdy2C0ZCfdUfrEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EGvKviX9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A684606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A684606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EGvKviX9
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so26811cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348632; cv=none;
        d=google.com; s=arc-20260327;
        b=j9AQhtoq2pXygNMczJcuYmQfCnwD9ZyJ1Ovoh8VOpBaMsIhUYUIBF18UR5udyWNET0
         IAdqhc5yEKoROxpCd/mj5qmmOVr7kDM+/NBUXB+3j/ODnpDDJmqD3cVUEEB9353obrji
         GnoSJI1Po4KuKuJOlpqO16ODolFrQJJJIP58++nBGxONZ24zb+kXYQfsPvjwSA6eaUG4
         6QhfUqogLWh1lAxHWATTvdkUhA2WjI92LwTlGoP0SRhdRHseXUkQTEb+gX2K76/R7i8O
         uY8SMthryePKYk8qOMzT6/NyFAYDGEwmHSMf3iR0I/79c0NO7xPVd6J0CqnN0LRqDpdd
         W25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23Pxla0x0VyCOsnAcGwpllmJRatGxCqJdHyvmPf4tJA=;
        fh=jCTLFlL37qL26xGTx4RwtVFhlQWrjccUx3vR9U9ihFo=;
        b=WGFebVRuTlWPM/vUsp1PW+408cpDUwCyFEw5eguIQ/eyYIZSq2h1sEBMEizzsg5PpJ
         Tb/Y6+ovugTKf+IBRoFSpssn+oyizBOwxEweAzQ9/T51kwywT1C+efu3YB53imqfvxVp
         ay/zTuH0RWpA3Qg8SINfS944DnQd7qveGTP8F5zRPGGdCwehYaQh2iDEbJXc8iurenRK
         4Td5mQjjS46/JsXFvsNJZX07X/UGbxkTpsa6eVuDV21RYK7u+eKhq5KvzRgJBJ4IE53l
         aeGHg2RAPyjtTFErJbrooPHxtl0rNNCoZOaCPHBV86MBLAEqz4D0DfCeox80bSihMoQN
         yorQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348632; x=1794953432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23Pxla0x0VyCOsnAcGwpllmJRatGxCqJdHyvmPf4tJA=;
        b=EGvKviX9LR/v1fV8uIa6Cdte1WjlOLXl9MLPt0Lmyy+ssas7SbxStEHIGx0I4EX6aN
         RIHuPG/YUvqe/k1xPplN0u5qLzkiCyHFAudkbqU1mn2drnz+x0dKfoI9NWvPHzan7Eqo
         Im5b+dtb+Z4YxYEhya1ymLQGa34yCzMMb7D0WyajYIaImNZlE9ChBAuWALt4oGDCD3Ac
         tR5DwPD0bF4ZD5wLE+r7SUATCjUjXUTWIm10N3bJZ/pvP2/7hcqoRR/I4gWbFH6nzFTG
         aU/bk4VspZTg0fXWRhtdxFnNBL4oePXkVQfJFLxuYP9Q+5OYUh9fctNHpl9O9RF5l44R
         BBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348632; x=1794953432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23Pxla0x0VyCOsnAcGwpllmJRatGxCqJdHyvmPf4tJA=;
        b=gp6T8YU/eb7G8Bxl7KGRSrz16f8OqmcyPURWYlqFVHUUNVnHiY763fkDXQUfYnkjEd
         XWVg72KJA2lCjI2nMRkfWxiH2kMYeQln/XpCufFBtm7g/PBG1bmxGCosLR0pqHTus3yV
         76sqtbwoxsFzRYO5beSY7cW41iwvJw4oMw5lA+5f1hM57cLXU8OOz7mg/HQA08mhE/QK
         KcuMhxtGZzb5j3slkDp64T7gGei1DbavgYhsipKH8/9FjjEDuJUst361zjcBHpjFJ28/
         K5JWGGNppVTb8zHiHDRXg/2Arux+LGzkoIQPRnNwsOV9nV9uzFrF3dMj0m3TRzTSBQ2e
         BrfA==
X-Forwarded-Encrypted: i=1; AL+hErHMJBLVmOvcp9EP5utOSsX6My9dPlN3aB0fNbePH/7m71COPe+w3RjTAJMvmvNWVjOTf6c8yTw7ATs9TRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8cnssNpPAJ18nnh9ck5/EmGyhLhaYrkmEM9AMCdc1SFT9QruA
	LDtmxcZfEQXrNYsgFjIRp9flGrVBPp4dW+rBm82eLbYBDVxRSbqdf3Q0NdgahvoI+ePbEH8gz1E
	pkIFJjwglmzt8bIb/jwyuPODUwKrgihBnMQ2hxlKw
X-Gm-Gg: AYBFou0hDl3b/vy70R+XibIYSkapO3cW8qOE+VewzjDirPzZuYikHpBulqCecNSf2//
	Gf52aOcBvRu5p8H4OgIJux8l8R8RvG4a04KZ06OoddeS2EJwGnlL4vfda+1HuNBg6r6dkxVzzPu
	bg1ixkUciRjzRD0GZJtc3mMGh/AnglQWRNkCNCtxwMOFmDsy2T5lLFSoXYsTvvPDaVOglUTPw4+
	jtbmO6mochpn3xA4rpr8/WTQYIKvq2t7W9RPk6JEgz3e7cfgnozW4TSYWFx4qcPXunMi16xDJci
	L7KuodeWbnaPoS9xj6cl6d0nEyMDLl3YpZqD+zweIJ27EhhMCfh6XZwkYZlN7WIlqBdDNnwfohx
	Tk1YkK9fa2xrhsLaMok1JgvhxTXU69bLM6brUwu2PddnV/4gwrLiusg8BGrZF6iUy4ZQ=
X-Received: by 2002:a05:622a:488d:b0:536:78de:775f with SMTP id
 d75a77b69052e-556c399f89cmr1771181cf.15.1794348631513; Tue, 10 Nov 2026
 14:10:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013231430.2163505-1-irogers@google.com> <20261022204627.1813821-1-irogers@google.com>
 <CAP-5=fXh4VD5bimc-pEezOJXLRX-pYHOzx9j=sFo0VRiPgsmsQ@mail.gmail.com>
In-Reply-To: <CAP-5=fXh4VD5bimc-pEezOJXLRX-pYHOzx9j=sFo0VRiPgsmsQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 10 Nov 2026 14:10:19 -0800
X-Gm-Features: AclHuK8wEnQfk_-sHOPur9fgjbLia7lKpNE_SXlhvIz0_WDZZ0WArK0Fic1f-50
Message-ID: <CAP-5=fWjYyr3dfkrUYxp0y=_NpNOiimWGvxTy0W6Gx+Xx1t_yg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] perf build: Support building BPF skeletons with bpf-gcc
To: irogers@google.com, acme@kernel.org, cupertino.miranda@oracle.com, 
	jose.marchesi@oracle.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, andrii@kernel.org, eddyz87@gmail.com, 
	james.clark@linaro.org, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:52=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 1:46=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> >
> > Currently the perf build requires clang (>=3D 12.0.1) to compile BPF
> > skeleton programs (.bpf.c -> .bpf.o). bpf-gcc (>=3D 14.0.0) also suppor=
ts
> > BPF CO-RE and BTF generation and is already supported in
> > tools/testing/selftests/bpf/Makefile.
> >
> > This series updates the perf build to support both clang and bpf-gcc:
> > - Patch 1 updates Makefile.config, Makefile.perf, and bpf_skel.mak to
> >   prefer bpf-gcc when building perf with GCC (CC_NO_CLANG=3D1) and clan=
g
> >   when building with Clang/LLVM (CC_NO_CLANG=3D0), while respecting
> >   explicit BPF_GCC=3D... or CLANG=3D... command-line overrides and fall=
ing
> >   back to whichever compiler is available.
> > - Patch 2 adds make_bpf_skel_clang and make_bpf_skel_bpf_gcc build-test
> >   targets to tools/perf/tests/make, reuses tools/build/Makefile.feature
> >   for feature detection, and verifies with
> >   'perf check -q feature bpf_skeletons' that BPF skeleton support is
> >   enabled (or disabled for make_no_bpf_skel) as expected.
> >
> > v3: Reuse tools/build/Makefile.feature and tools/scripts/utilities.mak
> >     in tools/perf/tests/make rather than open-coding compiler feature
> >     probes, and explicitly check for exit code 1 from 'perf check' in
> >     make_no_bpf_skel so crashes are not masked by shell negation.
> > v2: Pass only -dumpfullversion when querying BPF_GCC_VERSION, guard
> >     against an empty version string, and fix version-ge3 / version-lt3
> >     in tools/scripts/utilities.mak so empty or <3-component version
> >     strings do not shift awk fields and evaluate as false in version-lt=
3.
> >
> > Ian Rogers (2):
> >   perf build: Support building BPF skeletons with bpf-gcc
> >   perf test make: Add BPF skeleton build tests for clang and bpf-gcc
>
> Ping. Just to note that the 2 patches are clean with Sashiko:
> https://sashiko.dev/#/patchset/20261022204627.1813821-1-irogers%40google.=
com

Ping.

Thanks,
Ian

> >  tools/perf/Makefile.config     | 83 +++++++++++++++++++++++++++-------
> >  tools/perf/Makefile.perf       |  8 +++-
> >  tools/perf/bpf_skel.mak        | 36 ++++++++++-----
> >  tools/perf/tests/make          | 71 ++++++++++++++++++++++------
> >  tools/scripts/Makefile.include |  1 +
> >  tools/scripts/utilities.mak    |  4 +-
> >  6 files changed, 159 insertions(+), 44 deletions(-)
> >
> > --
> > 2.56.0.307.g5fe7bd680c-goog
> >
