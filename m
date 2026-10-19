Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431585;
	b=x8009BvykA7dR0SDSnCE8WdoVg+N3NI6Otkt3LF8u7Gn+Ip2bkRBW2d8nimg30SrEXtQ
	 Ko9Dd8kD0WCtMbZL7RYKZM6uYUsyrJfJS8X0VILaTq0MHVfmYf90hFH1/Qz0pFcyXjmfK
	 GMOkr1TXTcWa8RI63V6g2oqQLvdZS3SWmBUMgtNIe2ZMVihqVH2ETOXvAI4q5PdGMB9c2
	 OFMkl083gpqc2Qg4SLQ4MZgRAKBFFImxzoe4KFR3xhhXQQG/SiHl9asdxeuxnJfHiTBss
	 OkCAKdH+Lz44bGXk50zOjr1Dg6f7j7nkMt6HzcC6Kk4EUlszuGDghvtpGaj6C2RrIsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431585;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GnQBvL9ThoitpYzUQcFIdzE3H2uK7kr1ppoIGal+PjA=;
	b=NPJmr+nj69mnZuOlUL1sROjotYHgNGrr+E72PtE+x8liUVmvH/sO3pf1oZ7HDNl8UmYM
	 KkhpEWX4/v5oFV3X0viqs0Ivjo5qsufnE8zid25izsRtatQjewGlMc8olLmcC5M0gcHah
	 oG/9nD6ooMBvGi6sJNPQpG+WIUe5bDB0ie06pQAOqNht5wFZR2TnW4/ZJNIHuItpLcHHE
	 EKm0RPmjBUyh4GT9cBstneYmoDlRtFTo4dANjLxfwHnuEItKzXgHu26FXvEFsRHzK689w
	 aeg2VnO+zGietNNGaC+R5HxNMMepZMNqrP3+n82Dw876AJqgKInIKTe9emDwrUlkqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkbMnleH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83FC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EkbMnleH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBC01F0157C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792431584;
	bh=GnQBvL9ThoitpYzUQcFIdzE3H2uK7kr1ppoIGal+PjA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EkbMnleH6Ux0aJawtFLpleM4XWROY17SoR2ZJUVHht30tBfxhMdGVLXQPeKAHJl4a
	 m/Z8JPoRveVu/5pysSp4L87w64yZqLzTCeH0I3RldQg3932x7x7HjTG6If0oePfWPs
	 Iquoay8yGHz9oP//eJtPewhK+vm4RNOxPMLfrPK1yZlbuHNONZnnKFQH4s/Xf238hq
	 /J0ODclJLzjeqfLwnlA2kxPObjzWwPwO5o3YK0FHiBtn/1GVjIKsw0eaLFEXQRrilH
	 DYLgxeGOaLNOeSssJY1nAy0dLbEb73T8Pl7tobbbBUo/BeN1EpOanMu0ZvjQ9ZrK8b
	 9M2xoZP0tW2MA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so2285442a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjX2x6o/hsFZm2BmV9Oz7zngddwPcHqQgRA80BeOdEVFVEhRbaFjX4TTosUc18jyw9Aesr+5EOqHWKsUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/ZKnuJMdinm6CYU2gfhLlENtq+KYEh1P0WPQTZ9qMKbxE85+Q
	O44WW/u+r0hwNZ6xS9erzjpZJdrN07VJlSwOCH33sR92PKqT9YVkrwcHLi6ZTl0VJ6bnSuhS4hB
	neCnY1NvD1+MenbUek9FEA8HnYAEXdEY=
X-Received: by 2002:a17:907:944a:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c419e648fffmr666097466b.9.1792431583119; Mon, 19 Oct 2026
 10:39:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz> <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local> <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local> <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz> <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz> <atY1vWRBRUwpISKb@pcnci.linuxbox.cz> <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
In-Reply-To: <20261019083529.a81910ac0976c1a5687d4c6a@linux-foundation.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 19 Oct 2026 10:39:30 -0700
X-Gmail-Original-Message-ID: <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
X-Gm-Features: AclHuK8n2lTFq8e9VdttHlGOs0y_QO-3e4ybHTHpOpRKbp8_vTnwjvldNPZm8AE
Message-ID: <CAO9r8zO41EromgLGhKv8H0aKXjrffH+t4CFGU6cLo59JJ3CEuA@mail.gmail.com>
Subject: Re: hunting memory corruption bug in 6.18.x
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nikola Ciprich <nikola.ciprich@linuxbox.cz>, Sean Christopherson <seanjc@google.com>, 
	Borislav Petkov <bp@alien8.de>, David Laight <david.laight.linux@gmail.com>, 
	Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, 
	pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, 
	Matt Fleming <matt@readmodwrite.com>, gregkh@linuxfoundation.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:35=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 19 Oct 2026 17:22:37 +0200 Nikola Ciprich <nikola.ciprich@linuxbo=
x.cz> wrote:
>
> > >
> > > Sure! And I have more good news: after applying 55780d8a1dcc
> > > to 6.18.56, I was able to perform more than 30 migrations without
> > > a glitch. After booting back into 6.18.56 without it, both VMs
> > > crashed within 2-3 migrations. Furthermore, some memory apparently
> > > got corrupted on one of the hosts, since various commands started
> > > crashing too:
> > >
> > > [  303.466091] traps: systemd-logind[3085] trap invalid opcode ip:7f7=
b5667e616 sp:7ffe1afdec38 error:0 in libsystemd-shared-252.so[7e616,7f7b566=
6d000+22e000]
> > > [  303.493810] traps: systemd-coredum[11269] trap invalid opcode ip:7=
fc6bf67f614 sp:7ffc075da958 error:0 in libsystemd-shared-252.so[7f614,7fc6b=
f66d000+22e000]
> > > [  377.528955] traps: systemd[5607] trap invalid opcode ip:7f791447e6=
16 sp:7ffe83e61cf8 error:0 in libsystemd-shared-252.so[7e616,7f791446d000+2=
2e000]
> > > [  377.556993] traps: systemd-coredum[12080] trap invalid opcode ip:7=
f97ce07f614 sp:7ffe28b56a88 error:0 in libsystemd-shared-252.so[7f614,7f97c=
e06d000+22e000]
> > > [ 3746.173043] traps: hostnamectl[45846] trap invalid opcode ip:7fe00=
cc7f614 sp:7fff89916e48 error:0 in libsystemd-shared-252.so[7f614,7fe00cc6d=
000+22e000]
> > > [ 3746.202305] traps: systemd-coredum[45847] trap invalid opcode ip:7=
f7fe9e7f614 sp:7ffea227cfa8 error:0 in libsystemd-shared-252.so[7f614,7f7fe=
9e6d000+22e000]
> > > [ 3750.581940] traps: systemctl[45903] trap invalid opcode ip:7fbb896=
7f614 sp:7fff733e5748 error:0 in libsystemd-shared-252.so[7f614,7fbb8966d00=
0+22e000]
> > > [ 3750.612651] traps: systemd-coredum[45904] trap invalid opcode ip:7=
f90d347f614 sp:7ffdc7f55148 error:0 in libsystemd-shared-252.so[7f614,7f90d=
346d000+22e000]
> > >
> > > I'm not sure if this is of any use, but I collected a vmcore of
> > > this state by intentionally crashing the host via /proc/sysrq-trigger=
.
> > >
> > > Anyway, I'll give 55780d8a1dcc some more migration rounds, but it loo=
ks
> > > promising.
> >
> > 500+ migrations back and forth, no issues. I consider this solved and a=
m rolling
> > out the patched kernel; I=E2=80=99ll report if anything new turns up.

I am glad the commit fixed your problem!

>
> Great, thanks.
>
> oops, we haven't been cc'ing Yosry.
>
> > Definitely a -stable candidate. Andrew, will you send it to Greg, or sh=
all I?
>
> I volunteer Yosry or Sean ;)
>
> I think 55780d8a1dcc should be repackaged before sending over to the
> -stable people.  Its changelog is very wrong: "The bug is benign
> though".  Update the changelog to explain that the bug is in fact evil.
> Otherwise -stable and further downstream won't understand why we sent
> it to them and won't understand the impact.

It was found through code inspection, there weren't any symptoms, and
I think I know why my analysis was incomplete. It assumes that
svm_recalc_instruction_intercepts() already ran at least once for L1
(vmcb01) to configure its intercepts, which generally must be the case
(L1 must start L2), except during migration :')

About repackaging, yeah we can add a note about the new finding and
the necessity of the backport. One question tho, is there a way to
send a patch to "all" stable branch (the same effect as adding Cc:
stable retroactively), or do I need to send separate backports to all
open stable branches?

>
> And that repackaging would be an opportunity to add
> Reported-by:/Closes:/Tested-by: you, which is the least we can do to
> thank you for all this diligent work!

Will do.
