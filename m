Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223543;
	b=iHe20mWLUzcelIGYcnSGLvlkRx3spxZvnjvWRaUrBqpvPOFkPaMqpuEUSCQNfmyChLoc
	 K15Q5b89bBGm49e20DZv+wOqhXiEhfyLSL9pFEsXUPejczW8jZPH+g9xWumo6PvCPqCPk
	 i0n+zXic38ok/u5U4xv5OShouCPL4S9HS2TbDCMnhQXRPg0VOZGRea2mLmd8bXZXi3y2/
	 pGMWt0sUnvMEcpe/ZFnt0f46QR4udwjhSrvLqg495A5HDPhAE3o23TwbFE8GtNuTrHIqt
	 FSfurvHXMq3zhsK7lJsFNI1lKs7OdHWMAaEWMa/1YW3G1idpUy7Ui69T2pCccQN3xJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223543;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CbwDqCCHasq9DNEhUXtm1GHYFn7se7+hF+mPE/dcVHQ=;
	b=UjOCa0qcWMpV+Srbx10jnqTGC24kGog2oBafY6X3uNPjW+qPJmnvAAAJhT2gf2sU/C/Z
	 7rKrY0rzSIIEntxYau1oZojaB6II0bNxdlc28dmWlXxLblHK5KIi9O1ESFIPqS9Onbqi5
	 xdpIqzavJbjLSVPmWv0cO3/yyeNPw3PJe9U+BPbmUzCAXjJBhHEPkRO5x272CAnrT3R2C
	 hFZAPaMWdy0C7rJ7pPEMzh9QMiyDT6YIn+riE2vPAKzeOuP7iLf3QTZIvcghrcxwZedkZ
	 JXNfI8kGn0HKKNnbLNNhy23JiBpCb0NBpEXlIob1P/Me9RJC0UCNGkdVVqdM+lG+8/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AvwjWz/i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B185C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvwjWz/i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A2C1F008A5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223542;
	bh=CbwDqCCHasq9DNEhUXtm1GHYFn7se7+hF+mPE/dcVHQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AvwjWz/iXuzr70RNpq1/onzvj2lFVw+EnU3AanIh3HXq22A2Nv7zDdh/djlD5SrKj
	 6dFpL4DFUtAJTM30Pfc8Jao5+2vgQZ3hsHKLxDNZr8Ftz1VzNsiOO6a62r6PVUPwhT
	 SAwUrbce31AWT1h4z9LHjkUNA5Ftk/Kiz0icLOL4+WSjTygInWD+871TKblub46vhr
	 rlRB4vHI6ZNrnI/veFZLE+5dqoAJwBrhAP3+u5MFEH2Tn5uP2SPhIkf/HCkgkXpmyc
	 3izRrp73dnFUijKNHSemm/q0a9AzVmMHkHzVHNYcChSUst2xir3JozdbUQeg8Py5+A
	 5Vi3c9pFVCRpA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so95493566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdY6wI2tl9DOiS8nCmnveGzTGZeQFMmT1szKxzl1eBytqCDrK/fMXUmcuz/denWwGA4+7U38R/cbd+gqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rhZ4BXCzgZgpGrVVDFQWTY2wy57+xufiAgMhjhYXD7PzniKiv
	ajyBdAIWjHIBK4xJgsA2lHmeJckizUdXpe6Sb0xsRjJ+zkg5ILLM52gVYaHajtirZqYXTvrZSQx
	JjWsRifF30FpSc3EJbfWojUDpH4OH6j8=
X-Received: by 2002:a17:907:1ca1:b0:c4c:b681:38b2 with SMTP id
 a640c23a62f3a-c4d6d4f2e14mr249925866b.19.1794223540939; Mon, 09 Nov 2026
 03:25:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108182011.1888520-1-icb@fastmail.org>
In-Reply-To: <20261108182011.1888520-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 9 Nov 2026 20:25:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8dL4Ci4JO_R9LNeW_KXQo1=snVK+=NReZJToWN2nXSXw@mail.gmail.com>
X-Gm-Features: AclHuK899ETLng_czFSgyYAfA-cg4CGy-TppyQBm1yWxdmk_WuZ6i9jpBAneUxQ
Message-ID: <CAKYAXd8dL4Ci4JO_R9LNeW_KXQo1=snVK+=NReZJToWN2nXSXw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ksmbd: fix explicit DACL checks and parent-derived rights
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:20=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrote=
:
>
> smb_check_perm_dacl() mishandles explicit access requests. It can turn a
> deny ACE into a grant, ignore earlier deny ACEs, and treat guest and
> anonymous sessions as Authenticated Users. This can grant read or write
> access that the stored DACL does not grant.
>
> The function also ignores rights granted by the parent directory.
> FILE_DELETE_CHILD can grant DELETE on a child, and FILE_LIST_DIRECTORY
> can grant FILE_READ_ATTRIBUTES.
>
> Patch 1 evaluates explicit requests in DACL order and excludes guest and
> anonymous sessions from Authenticated Users. Patch 2 obtains explicitly
> requested DELETE and FILE_READ_ATTRIBUTES rights from the parent DACL.
>
> Patch 2 uses the authentication state added by patch 1. It also restores
> parent-derived rights that patch 1 can remove from guests. Backport the
> patches in order.
>
> Older stable trees first need commit cc2f133e80eb ("ksmbd: fix maximum
> allowed access checks") and the preceding DACL fixes through "ksmbd:
> grant a caller what its groups and OWNER RIGHTS ACEs allow".
>
> Changes since v2:
> - Patch 1: keep the POSIX ACL fallback from replacing the DACL result
>   when an Authenticated Users ACE is present, including for guest and
>   anonymous sessions. Namjae found that the fallback could otherwise
>   grant access denied by the DACL.
> - Rebase onto the current ksmbd-for-next.
>
> Changes since v1:
> - Patch 2: let group and OWNER RIGHTS ACEs decide the strict parent
>   check before the POSIX ACL fallback. Sashiko's review of v1 found that
>   a POSIX ACL entry could otherwise hide a FILE_DELETE_CHILD grant.
> - Patch 2: add a comment on which MAXIMUM_ALLOWED requests omit group
>   ACEs.
>
> v1: https://lore.kernel.org/linux-cifs/20261107062233.1579198-1-icb@fastm=
ail.org/
> v2: https://lore.kernel.org/linux-cifs/20261107231941.1824289-1-icb@fastm=
ail.org/
>
> Both patches were tested with KASAN on ksmbd-for-next 6f42553e493d.
> Its fs/smb/server tree is identical to current head 2f14fe2d5895.
> smbtorture results are unchanged.
>
> This series was developed with LLM assistance.
>
> Ian Bridges (2):
>   ksmbd: evaluate the DACL in order for explicit access requests
>   ksmbd: let the parent's DACL grant DELETE and FILE_READ_ATTRIBUTES
Applied them to #ksmbd-for-next.
Thanks!
