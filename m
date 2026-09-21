Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259384FE2CC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017213; cv=none; b=Lj6SvVSg7vqwWdD2CF2ezmXmLQmge3PqjiCgWhGaeXOG1LKNQ3TfJ217fIsoNQFHcxuVtcMDOXI47aRbAtR0TxaJL6cIQkfYQWsjNvYQd4wi9X+IvShL702xge3WzG//XGvyQpH/4sQNYs08GXKwJJ018Cq4cyscKZa8heavi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017213; c=relaxed/simple;
	bh=LaPGXWGgQcjKnfjO3z793iuW2xLAXRbHYoryZVBZqbs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dhgP0dCb7ltDYwlM0tClDyZ9i37TjilwnXIcNWijjuFWjZt7eLtpSgCwfhQZ06bIQzM74A+Cc1vt/p763lEVHIwaw/Inleld4NhcaPejk7yhrWTZQ3/pc0tCLkZWSPJx4EEITN7lj76Bt2Ts91zVnAr7s5Y39YA1VhBrTTzKBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMNuEFEd; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMNuEFEd"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so2215779b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790017211; x=1790622011; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bYun8S0nOqfarXTLSlvVxpXRKSkf8eIDnC2ra5er6xM=;
        b=KMNuEFEdErmfKyLOL46+Qq1fyKO6x4Zkkt4CFtYF/OVRL22H8X1wssRLuCcL9sKt7/
         fIOp1+eXD6ksjP8KlX3YnQISM0IPyi83o2oDjhgk3ic9fB94/qNcSxUmFGsD+aqDKk3G
         CFnaSvZxEW8cj+XM9JZ78zaJ+r6wrAZbWNlk1PCFcIjLc0FRBxidYz54fZvpP0GSV5Vy
         kIfT2qCulGjuTKI4CbI9geX8eGshoyyBfYCTeLsUKJQyeftCbNAyoBr7rZJBMGFz2Nb9
         CMdVnad2/bkKxXU9SyuqYofK+UgWrZOuRD7/ukB6dYLdt263xsgntfmj+kXJPALRcUVE
         VoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017211; x=1790622011;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYun8S0nOqfarXTLSlvVxpXRKSkf8eIDnC2ra5er6xM=;
        b=nCA+RMU7Y4ldlpG92mFZPb3LRtYdxtXwvC1+iN1TQfwYeRyE2tbKPE3VGmPK+5r+vo
         wdKvwusgxPH31j7SYuAaQ7PRW988d9gagaoI3Ng7TEOxxD9olu2FcWwE9QBBQeF947qe
         CezxmyTpkn0pDnohO3T20cUotqY9rHVR1uh2T7ZR7HBWUUAH3m2B16Firm8f9WbXMnvO
         w692jjTMimwxKKt/Ef93fcYxC+EVXjdDF8wqV10LlSLExjjcW0llLfWpF76UHcuBFpuU
         OttdE7WFt5k95t1slhsyt73hsFdJvxdgMvL2Nei2Z6NSzwe6A4lx+6jTkeqga+x/Js3F
         lfLQ==
X-Forwarded-Encrypted: i=1; AKwUvBycfkM+od4rvt+PaE4f70AXo9A7MHW21Dzr/CyYgF6Hlu4+vppV2s1mywDNq4pecWxfaH9LT6RyGLf1jq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lDzNyHlBlqoLgMcPIfwuXv+ziMDwDTUEMHEbEc10NEnIun/Zr+
	ueaxUUhQtRqdNlIUWzq58KKeKuBBnzFyR/zbwRf24JfaGqkrtwlfMZ9D
X-Gm-Gg: AYBFou2MpNy1prqLj2Hm5rp2W7VcpMR/4MgBlglw82QmqDlwLr4hc+m3PI7duHofobJ
	K0F9pgzNkWQP6chWrn/nTx7SmydzNHJHxiKymPkPbTcFR9lYLw5Rm6skr4jXt5xJlwxtXXCBjv6
	8c1KaCXv/4/FGyZ07S6IHOZpuI4WjNtSaWqlx6vUVtacoqIepgZ+ZVcIdiqq6IyQ6ZZmtMPnK6Q
	By1UvXV7GoghIDTJd7wCIEVgVknC4uzwEzLMV6G2NqkjOkTC5WGRFqCGZKOf3QpezlKbQvNc0Oj
	bK/eXghFf+MKrZTCzKSn23cgsLUjfaHJmFH5SVeUnpruDenW/DFX89PzPAW0iLh3BiIIVKvsIE8
	N/BsNGzBx+oKZfHzZz/yReqA59Sn+/vWA9cy+rBaHCGl3Yrh+r7bBOqZeBiczaU3Um1ah60n7ln
	BS2aK5aFTfYBVMMU6WvNzGFubkCYp7nwK8H4Oogruco49jq9/cOxqcPaIzUG3wnKjJ83VKFvITY
	bI733EX2Kk3oxmv/PcCPBpdlscjkNDHmFvywucA4jCn6/am6pIlLyC+bmc2/pXCFZ3TkpOjze/7
	7x09Szp4kU6prQ==
X-Received: by 2002:a05:6a21:482:b0:3dd:a195:dd62 with SMTP id adf61e73a8af0-3dda195e456mr13391303637.68.1790017211192;
        Mon, 21 Sep 2026 12:00:11 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aead0casm3912480a12.20.2026.09.21.12.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 12:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 19:00:10 +0000
Message-Id: <DLL8564LZU8N.16W933Z547TYI@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Suchit Karunakaran" <suchitkarunakaran@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: add diagnostics for rejected memory and map
 accesses
X-Mailer: aerc 0.17.0
References: <20260921154650.130677-1-suchitkarunakaran@gmail.com>
 <DLL5PFJLT64M.1W82K71YXNT3A@gmail.com>
 <CAO9wTFjK+oRT-maca6A1UDBrgYTGB0Zr48UiLm2Ees835POOFg@mail.gmail.com>
In-Reply-To: <CAO9wTFjK+oRT-maca6A1UDBrgYTGB0Zr48UiLm2Ees835POOFg@mail.gmail.com>

On Mon Sep 21, 2026 at 5:38 PM UTC, Suchit Karunakaran wrote:
> On Mon, 21 Sept 2026 at 22:35, Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Sep 21, 2026 at 09:16 PM Suchit Karunakaran <suchitkarunakaran@=
gmail.com> wrote:
> > >                                       verbose(env, "sign extending lo=
ads from arena are not supported yet\n");
> > > +                                     bpf_diag_policy(
> > > +                                             env, i + delta, "sign-e=
xtending arena load",
> > > +                                             "the current JIT does n=
ot support this load instruction for arena memory",
> > > +                                             "Use a kernel and archi=
tecture with JIT support for this arena load.");
> >
> > Did you read what AI generated for you?
> > "Use a kernel and architecture with JIT support for this arena load."
> > ?!?!
> >
> > Please apply human filter to every single line of "your" patches.
> >
> > pw-bot: cr
>
> Hi Alexei. I'm sorry for the oversight. I somehow misinterpreted it as
> "Use a kernel and architecture with JIT that supports this arena
> load." Is the following diagnostic message fine? If yes I'll correct
> it in v2.
> bpf_diag_policy(env, i + delta,
> "sign-extending arena load", "the current JIT backend doesn't
> implement sign-extending loads from arena memory",
>  "Use a kernel and architecture where the BPF JIT supports
> sign-extending loads from arena memory.");

No. That is still wrong. Put yourself in user's shoes.
How would you react to this message?

