Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F24E77EA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564079; cv=none; b=pdEcDLuFKfGApxVzxcEVTdUDigHBiIrktPsC1BlpbpALGFddo8xGC5+iKTyD7HFbGCzxgvdewD8hTn/c+M62Dvh0ExAgWxxAG0ou8nl4F+EtWtglYzBF6jahapgp/6TWYHmnzPfV1C0rTAAci0eJwE8pAIrvITWa4Z/rdf3WuT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564079; c=relaxed/simple;
	bh=+tBdaXkFhdPfXEouXheDWZdgtHuGiEfut3HVdRsmEpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUWoQnlBrwnGMy2GF2K39s3n/pLnBGGgGK65PONhg/TtbzZLzD2pNp8IDr4ZWGhnRsnu3bIgKKEqkspxS1t6TxOHIWjkcjZJmqa2w0ASThRE4NtdGnG58qdw390kWhhvLNvByYho7ZqGPqxXZnd0M3XziUFH7SaNxrC4OW1RtJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=MRDfSgiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="MRDfSgiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E961F000FF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:41:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=MRDfSgiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1791564075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tBdaXkFhdPfXEouXheDWZdgtHuGiEfut3HVdRsmEpQ=;
	b=MRDfSgiSOM6O8HVtmqtD/lS6a6HYYIH/McsYUGMD0vUEwU223P32rMTwOdm+s/w4ycyYzm
	b6oHYMKd2x65dwQ+Y/mpBmIcjjYpYORvBIUHUVb6GLi1vGV+z5Jtod7AtAgWZIqiWhLo3c
	SfCRcJj0+dKWAuarrXgqbfX/gIMHkaA=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 7ce7e2d2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-kernel@vger.kernel.org>;
	Fri, 9 Oct 2026 16:41:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso4766066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwS/66qXMx3z/6lwuD9HhrKnV+qAzJKLWScSCKQ2zyYP0txkDOQqSIVksg6lOQ602XeLldrt8RLe4RZ+8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoRN3D0EoieFoW2M+icauygNSP3WIRwSiJlXwyahS00LTVFjBr
	kLeMQ4BngCkM+TixgDAAa5c9GpbH6eP1CXge23kyrzPzrPbSFv81N/iWOx/jKrivfiloq89ANsK
	mJ5EuAOX0K9FYSiO8uygZ00R8/3YPrfQ=
X-Received: by 2002:a17:906:c110:b0:c2e:32d3:1b5 with SMTP id
 a640c23a62f3a-c31aa079e98mr243759166b.32.1791564073534; Fri, 09 Oct 2026
 09:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <CAHmME9rh7k0vNrBt4yF7fOgir3yuhrFawPnmsJpeYBCLg-r6bA@mail.gmail.com> <20261008-quiet-lucky-ferret-3498cb@lemur>
In-Reply-To: <20261008-quiet-lucky-ferret-3498cb@lemur>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2026 18:41:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9pURv1-37C+iT+Ywf2rgWgQOwVJGLG-gm7dfZ7FHOk4Yg@mail.gmail.com>
X-Gm-Features: AclHuK9ifNj-QcTYCS0j7UOEop7vWTdXfPsWTby448ggOg7cwegrTSMNeqR5IeQ
Message-ID: <CAHmME9pURv1-37C+iT+Ywf2rgWgQOwVJGLG-gm7dfZ7FHOk4Yg@mail.gmail.com>
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:10=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> - THE REST actually works as a fallback
> - patches@lists.linux.dev is included on all patches as an archival list

Couldn't this list be programmatically populated? Lore is already
watching every other mailing list. Can it simply post ones to patches@
that patches@ hasn't already seen? Then we don't need to worry about
the folly of trying to teach people about another list and such.

Jason
