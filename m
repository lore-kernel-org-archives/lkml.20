Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990A53B95FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788496686; cv=pass; b=cPfcp5JFvqsYPRLcANgHWzKxgbvb1si9c6xlDDVNfY5PNU2GiBpSvt/SuwR+DFkH929yvnqhPm8Vzl6Uwx9DQK0WMqsE9S8KOD0yJW8xH1WWzR8QhatR4aByhfz82E6noeUmMmEJca/ZarBgWk8hxDSWfFU9KAD0tB5Qj53F39s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788496686; c=relaxed/simple;
	bh=KOt8zCS4yfGsY5y+axjkZ/jNAn15opn/mKo1itsQKRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyzrYdaP8OdIQ53iscjhFJK7yLTZah5wGzZicE2jag4pNz8QLP0sNu4a2gS2PjhxMK24Bq8m0IKPUEDObhH72ycrzQEcKTrr2f+d8n0YNgzUZ/rZlIdePKZ433j51fQ9UG39UYhZdCelEHdZKk+Ao0DXYuV/eypaRT8a/mLU+zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NprHMnPm; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NprHMnPm"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936cda0e3fbso72989685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788496683; cv=none;
        d=google.com; s=arc-20260327;
        b=X4m1ScPo7FOTDdM9mB5OrTLb4Q2AWEHYty2TewsSgVDxi1TJNBQfYk/6CmgQVLuq9E
         iD4URomAIvOkKGcVGYq594JaNsTnMD/28wA6S/SGAQtqQLy/I6gGwyItgHYqsBHmNkK3
         wItZFm6a73RrL/owPSNaYRGpuHlJDpAWlRU2wPszIDLlUcBN7ie73s1WnNlyzwmVwlbq
         M+n6QRYnwU6MEBDd5h7LO76E7z5gSozfGqWE+dzw6E7TY0ZjAs7n9KA5MDyV9OsUl6Kh
         pvWqHqNNRFS4+s1Q31JyN2iATCGSZaU9zPcL+JOxn920bntKi3tjUZzfAYUS5fRdyAxG
         ON9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=15kgEqxoIaabk5O4SHM6AaUlfq/+yHWXgbci2Ixw6L4=;
        fh=ZlfxaTDtL+UAQtWhQDBAl2U8cFbxf+QpXBYxihgK5fw=;
        b=Z9PIIi9lip/Jsq9cVZEvcvbjJJcXIChfMJh/SEaLwT0/o3jtl0uqf4+KCDBCmnoBTq
         L71zH3Up3aVpC/ijNNQOA2VY8IcKoDTlBBAhg8rv82EfzfDjlB/o+p7cqFKIab0OflX/
         BQJCh6RTbQf7Y7dbMMIzyJW6mt4kiyXOHdQpPy6wuIIW3cWastibVL2C+N4ISTxDE5Td
         k1aZqnQffbVzKfsV5deTrh67vtnjU+GW8uu278lNqyvwag9tbncfEXUExz8AKIdZbU4b
         2olth1xNB3LTZRF9XpU+camzibg6oaJxhbwpxDGvCx9H5lPpsM+I3og8MES2CHEgV6mK
         rIWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788496683; x=1789101483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15kgEqxoIaabk5O4SHM6AaUlfq/+yHWXgbci2Ixw6L4=;
        b=NprHMnPm7rRg2zqy51uYWd0OYfcLFH8JxWTT5e5z1VWv5i4heXXN1T+I+htJQvY/xN
         vP2Z/mYxRM4eDMFZiq3vV+yzgE9nDP2zkSKnEa+hMo3n8imIp81x5ULrICfviAZaXH3B
         BysCw68M+uLRdRi3QfQI9npK3o7cqqKh6IeuN3ZHZkNj8v2Qerw0pO8EHbMKcpA3op3c
         TKstq4CEk42RklmGSREx7zXcPlbI4QnDKJJkrzbKVueKSVwt36F7xAMhopZNtW5lxst1
         t7UuU5SJH2olI05J/KPGeo+DqxSQYQ6fTT2qpLgYpfOe2LeNzc4pu159pupr65DpyqiY
         Ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788496683; x=1789101483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15kgEqxoIaabk5O4SHM6AaUlfq/+yHWXgbci2Ixw6L4=;
        b=aZIu07R5IzukUY3AiZn16mxwdedIGSLtHb6NBknb5xiRMU1klNCTj0/bA2vg1OL5T/
         P2vbaYkndVo+u4cRzKqm8qUGytuzcEEnr/T25PZRolUe3ldJE/eB2++tVnb4BzS3iHE1
         V4GihAPXrCfAgQUPNo8IGi6Moo65zmVE0zTkaMpYVxox5howsm6XAXqLCzYXRrmd2bea
         cewDEtvrv5J0932cTBGfzusVYRgs4D4sSxAXZ/7AcPvK79fkKBHaLpq+2M/qqd3OASm7
         v1f/v3d3kK/mUenHAz7nr6P6RkalDKMTYIKzdfSjj9hXtX42f2f3WxMdY+7uEmr46rQw
         MkYg==
X-Gm-Message-State: AFuF++nLlx3zVl54ujSSPenXInvaMR1ZNxiFwgKcgikQtgTykeYmWt4C
	jH93at0/2W24uKl6Q84AL/pZ4nln9y0St8E1UWmKA5ajGDPbu6C2M1qVb3MfIqzWnG3mPbBlV1j
	CxTzc29wMtXCv9JtATlL4cALfTCcXseU=
X-Gm-Gg: AYBFou1vQMqV4tf5e8/ASM5pOn0c/kNSdHiGQGOHPlfSBiL5ZfY9favs/fiT0UL56hp
	TocmOVOPjPkCv6JOiM7ZRrFUF4esy0oTaJtY6tdhBzQeeuYvaJ/f2AtbwiGV550RFrFsVPBemxs
	eC5cQ0SsGvJzqPI9Xl5ye63FNXEYSqQgR+s71fP0nKKO68xxRoNfd7/pFKKH+sLe9wiTdjcZcqK
	+mqofXeDf9WazZR7tEfteg0+ce6AYfsAm/sZ44EWDnSD21K9mYPNSJL32g/wz/speIx2UR2uXOG
	Joisb+VTLziibgNenrTi/nQ2iPPXf8ZyuaZMcRhnua4Jx3SyGRVyJRCD8qcIIwQwGw6Xral/Prb
	FcIejER652oeepVL6+1uQ2TvPrWG/9wtAn1NZNeckSlIdLNQbz6CXvQE0Iuzi+hs=
X-Received: by 2002:a05:620a:8016:b0:939:4abe:4517 with SMTP id
 af79cd13be357-939805ea526mr306978185a.16.1788496683454; Thu, 03 Sep 2026
 21:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831032947.3430049-1-rdunlap@infradead.org>
In-Reply-To: <20260831032947.3430049-1-rdunlap@infradead.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 3 Sep 2026 21:37:52 -0700
X-Gm-Features: AcwNN1UE9Ajr-h4EAWc0vlmY79-C8CU2jOjdlHZMsnmvlxO4JXpBrlqOnCxi_6k
Message-ID: <CAMo8BfJzi1U9qBuODvr7hcdCvAbCUq-DnoXdXr-d4Dh3-R8Xhg@mail.gmail.com>
Subject: Re: [PATCH v3] xtensa: atomics: drop kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Chris Zankel <chris@zankel.net>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 8:29=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> The arch-specific kernel-doc comments were supposed to be deleted in
> commit: ef558b4b7bbb
> ("locking/atomic: treewide: delete arch_atomic_*() kerneldoc"), [1]
> but these were missed, so delete them now.
>
> Warning: ./arch/xtensa/include/asm/atomic.h:45 expecting prototype for
>   atomic_read(). Prototype was for arch_atomic_read() instead
> Warning: ./arch/xtensa/include/asm/atomic.h:54 expecting prototype for
>   atomic_set(). Prototype was for arch_atomic_set() instead
>
> Link [1]:
> https://lore.kernel.org/all/al3q54jxOKZujYue@J2N7QTR9R3.cambridge.arm.com=
/
> Fixes: ef558b4b7bbb ("locking/atomic: treewide: delete arch_atomic_*() ke=
rneldoc")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
> v2: drop the arch-specific kernel-doc comments (Mark R.)
> v3: rebase & resend
>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Gary Guo <gary@garyguo.net>
>
>  arch/xtensa/include/asm/atomic.h |   13 -------------
>  1 file changed, 13 deletions(-)

Applied to my xtensa tree.

--=20
Thanks.
-- Max
