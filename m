Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792605023;
	b=1pEOeZbAlfr4IPaYU1Fuz02YGUGsHZXadJ3faTMC8Sg7lD767w76KEESqZGqIiFtL3id
	 dnEQvf2YY7Ln8Q4gY6XGU44CjZHH0nPQ4t14puiJCjbUL8vQvzMVxMD+g7wxme02BlST6
	 BzcLxPCUDnSEqdlf/J4Ko0N0x8KCSxQGpa+0DLsnbf2CJlWLZ44jTnQI099z3BYXsX6H8
	 8VLpibgnsm+H8LCNv5HIoyCWoNC0+KV8+3WHwgx6IoBLK9G6I6O4LXscEGZDi9LbigYPT
	 GXDdVakRw+rQ84++L30AYLpqTvdff2qFsrfKORVQ9fwjkwNpQW7V864t2g09cIHGDpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N57awaxA+dkCeAGkVjUy95fS0W5jW2cIwLYJR17RYSU=;
	b=bNrvCh2qbg3Y4gfLf2qtCP6T6M6xYBwOdRGKq2LBsnLSV1bJcbxl/hrNGc3R/Ihy0f/p
	 qxJknz7eBSEMedjX22k05dt9ZW0Ghp25KgpnzfUgNIAYiTILVfHWMfkjCL5+Um1dT1MP6
	 imDOyHgkQq2fARhxVpU4DpuNtOEZ8qEq06jRHTbFSTPEXM9JmGnBODZewRtxs51reAa1Y
	 l34flnzBJ4Heq+gn7P1D6X0ejm8qsnpdi8VhBjzflYQkLZQWzUhhaKhFJ7F2Fj+/uN3Pq
	 dNlwGx6/qHW6Roj9J9zjEGJAYaWiUtGApCLqA0N01bo1YD9NfGb/lxQ81p5w2lhjbTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OpqUSqGF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55068606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55068606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OpqUSqGF
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-82380b0f55dso519311a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792605022; cv=none;
        d=google.com; s=arc-20260327;
        b=MSjfAOni2IEsf45SETxM6EiI8yJBHOYMhc7WQVOcVZ4swwjptNFC4dde+Dzl2pbmzb
         0f3B01vja2R/ClrAieJWJ295AaCCojN8pFb/WwdW8JvPRF4rm3ZC0QoYehOKmyh19L7O
         X5gYQFLV62a8AonKyAqS4CWIxjvNIxjN8KfSHWN0lCHUp0WmjylTQ2T7y6OxjyMbbdkl
         cftjOnGGZtLnWQTqMZSlcRaTpNX7KCdTwYw5V5zAXVe0YOi2z3jACuf/rIw3h85QLhho
         wCoAa5cfLuCDq+9NOpbDg/oiXwoaF3ip5TvfEguXdpNLuCrRSbj2T5PkNtbhNsjE/hdZ
         BCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N57awaxA+dkCeAGkVjUy95fS0W5jW2cIwLYJR17RYSU=;
        fh=NtzgsjwUAPBlshGT9orIAaeOlhbhl5zd5uqtA7aMIRA=;
        b=RI31K7YEDxRfy0liS4eb7qdzPL9rFBnr0tYoG45ICPYbdHOJF+MqPsbArexOO7WXlo
         DR+Taby0MEgb3hVFCjmbZgSn+rKUpCVuvFitucPF7ABNYbFaE3JClu0uK36nifZlIzXC
         dXBiTQ1fyNSHw+zdUtBj0aJmmaC+bT+esMG4OioE0VLGRHrVmu61mH0Pcb239PHhOp14
         XTUhEUQdVyY45M1D48G+wbRGjpqCmyYEL2sToF8F346abz52T2ujJMhGo8VFz2rKL+ld
         InoGH8KPHTXRGmfKaiCfojC3Pk73IWnUlh3ssMztn92UThNef7TgXdrvnHKkcyJ5F0+B
         npJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605022; x=1793209822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N57awaxA+dkCeAGkVjUy95fS0W5jW2cIwLYJR17RYSU=;
        b=OpqUSqGFkn1eKG9vFI0GLyBTMkCJ/QOyJl1hQQ7is7xfVH2kcRWJeR/MnuBAWYodVM
         i7ZbAxwXZz/8zTi3xHhpaQrigyHYnKgdverfc2je3WtoW4i233hSgIMdyIiDu+z+YM5F
         ww3Wqw0Dhbh2/FhVQ++8jNPcOybb3hYPsfQeaBfVpdElUSLbdUq9qq3qOfAvxHeTcYbo
         tEzZ47I0TOnu07pImYP9LtNNfTCIGrDUnQ6XThyvbkrLvO0RlRt6FMkP7LHMenAlM7Hc
         9asEzOB5Wyl6hhaOITlgOQq61ASSpCZ9lQJ+2G37Z853BLPn8I6+tSUN5po8XkZ81zp/
         YH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605022; x=1793209822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N57awaxA+dkCeAGkVjUy95fS0W5jW2cIwLYJR17RYSU=;
        b=VOBLVtqRklP7HTvHbOz3CZaDbe6Q6YS1rs+v9ni/K+O41RDEhzsJcilsb8/sISE8lS
         nD8l5X4qR+WISPLCUtrg2FY4YQkVkdXzOdvMUZ+LfRV0viiiQvbv800l3wJJHJYzK9SN
         uvLfo83dewe9pstzODCDYS6gSuFXKzPdQ/ZWZRN0x1WFXfRDPR41X7c1DKqrJRLfn8EZ
         dWHrIu1tJYzDWb4UMY0yG/bqUX2ACW8pYZDR5CQO9jSRygqd+iBi5WjQy7W+tIR+RZiq
         MqIEC3WEp+gpDknMuz0AhovZO26HQwifRJ6l+VCkPUjeyIaPe8SsYC3c8cEXPzpCR7Xl
         OcBw==
X-Forwarded-Encrypted: i=1; AKwUvBwib2Z6CJUDScgiw7NRHXrLKztCw8vDrlgOgZiXbKyQiOBmgWpbN7t45+KqO6GWNyBaqXZ8TrTV5IA63gU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkfbTSACWoYWrpVd8d53Ho3xPYGLr/gEnupKs6gXCGrBPC88t/
	g/MNy/hDvf7WNoMXZEjozg9IqxQ5dgeJ98RjuRmyL9UQkwZu31pzpZDN0AwXulX11NSRgNCLrYX
	ZEd/AhT3K27cOFrupOK6MJ5K/uLAGHfM=
X-Gm-Gg: AYBFou1JpGnJtlhbfWuxZK7O2bG4IUOG8dL43BYMHvlCxbI4Xb8NgIIgrrTC/SPoEUq
	RRYRzXewpHawDT1BCEOwm41qi4yleEXZzJyJ3VasqW8LYuXaq/j7Kje3pWchJryrJtmFNKAQJy1
	FzaZWzF4oDvcYrw9RycHnP3kHoXFmZMQM4LGJ44nmbjj+BU2fCoYM8uQK9iBuH525TWntRx3lIl
	t1HgpEbMS1sTP0LLx1yDs1BF2fYt/+uDxJkqBgBMC97nip1Jy8IfMJg36IrODrMQBsv7f8HyEat
	yijP4YDkDUE0xplHim3Iz6hXqV+9kADniYaJZBfRUSA7hWxtF90PO8bA1DLUv+MS7+7nJDp2Kzy
	YMMQby2rxpbnIcIiHv3WWhTHqPlKQEuMl/bA+yhLjsVdGsKmhhwzzp346
X-Received: by 2002:a05:6830:6d2a:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-84d08e11d78mr2095087a34.19.1792605022209; Wed, 21 Oct 2026
 10:50:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929232621.3745312-1-avagin@google.com>
In-Reply-To: <20260929232621.3745312-1-avagin@google.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 21 Oct 2026 10:50:10 -0700
X-Gm-Features: AclHuK9866WT9FqtkwpPHjFKwbyXZFYzk2m6LRY-owq9pWpIpLbdTCQ4WDRj-oc
Message-ID: <CANaxB-we88mTkgX90LEvFdBsLD+XbHChODJJKmjPp_M2_KJtSg@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/fpu: Allow restoring signal frames with larger xstate_size
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andrei Vagin <avagin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 4:26=E2=80=AFPM Andrei Vagin <avagin@google.com> wr=
ote:
>
> When a process is checkpointed on one machine and restored on another
> (e.g., via CRIU during container/process migration), any signal frame on
> its stack carries the xstate layout of the source CPU.
>
> Commit fd14edd82077 ("x86/fpu: Pre-fault only required size of xstate
> buffer") enabled restoring signal frames created on CPUs with a smaller
> xstate_size than the destination host's default. However,
> check_xstate_in_sigframe() still enforces that a signal frame's
> xstate_size must not exceed the current task's fpstate->user_size.
>
> This restriction prevents migrating a process from a CPU with more
> enabled xstate features to a CPU with fewer features, even when the
> process has not actively used any of the unsupported features. Because
> the actual set of active features is recorded in the XSAVE header
> (XSTATE_BV) and validated during restoration, a larger xstate_size is
> safe to restore as long as all active features are present in the
> intersection of frame and task features and the buffer is large enough
> for them.
>
> Cc: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "Chang S. Bae" <chang.seok.bae@intel.com>

Chang,

Could you please review this series? I remember we discussed adding two
arch_prctl commands to get/set which FPU features are actually enabled
for the current process. I have these patches ready and will send them
soon.

Thanks,
Andrei
