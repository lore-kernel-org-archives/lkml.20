Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1633D6FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900322; cv=pass; b=f7LxZOltvzhUgXepclfv1AjO8qCuO5LW1RZuvUabX7CBknqQUdpheOaNHDy/NnHWtlJP2FsLpD3AFnZ+XUvEHtKllFQqOQzCMqSy8tA6ms5v30SmHIopq43EzRgIGBMwUcBYvch49LphDT+y6hpumPDLoz5fVN6kt7nws0P/EwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900322; c=relaxed/simple;
	bh=efwpqbn4KqWJ83/+b8Z3Sx2CVCm9Kiqp5MA7PhTFAxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNH/Wqapgj6djWHAFk6HRXKyBOplrPRNcYKpu/7xa/PrgBWhV5VyBuAzFVS8RLpBEKKlxLQSiz0i/JLvzCi88w8hCTxnLG8SIQui0JH+xmCg+m4ZNtDfgSgfh+dSSVZgvgYxhUr021FlnPToLRaH1TVj0IxKTwt6fMvzUSe/Uec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OILuzQQN; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OILuzQQN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed3993c1eso191483985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900320; cv=none;
        d=google.com; s=arc-20260327;
        b=pqXJpyG13kn0tJNkUdA8N5ApwtI62L7bwF3RYxkaU4kKg+a3HGnLu2Xnn/q2oKpR4m
         ByHybgpuPfYZKdGDWl/3bU8vrwbcVtrhV4iTYdedPX17+uEJnbzSmLy6D+PHmHX8lKzY
         PlJbhoAbo3JFXVtBuab77nXj1xizwmLSH5ZoQeYRQZMLhIEjxuBlr04b61LKnMIL47J2
         hBnuPyrVyfb4lNM4vDKr6TPn2cAKPZVg73wPFT5NXFL+k+PSFnhs/FiAfNNNiu7Fl2k0
         hqpHdGZgjtwZXnyYInLscNzx2bxC6IFIYNvXgu5uFb7zdUa0Z+iLYdt1C6Jt98zy8d1b
         djBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        fh=ueWR/HFfh6TE19udm7pKaE3wZczlRSlwSmedxwNGEGc=;
        b=X8vYSnaDJvuzFAuua42Y0YKAG4PLbRAKlnehJtHvPY5/LM2Fwqs6NPwWb1ENJPapJb
         nQQUfvwBzZcOwvSvFSWi9uvwH6ZVT9TTNKjKm05mxuuLJGbct7M6yp/wMEZPYsHZmbXC
         rNrTQEkbBDtEH7A0DK4hvgJCXXz5hsU4bHNdNxd4iwc9oR81KdGGTTDfdQ8h/VdP0G2W
         oSX79Bv3IZTNSyLfPYvOWR7FmjnUQTQ9G3nhsGhUcui440xJNwiOiEiVfAkFd+IuMfF0
         HNzcRkg2j1mVmjeM4292LvMHytlCd6Akk06YpkIVgiVOzOf3c/565BDD4i2td9WwRSri
         7/VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900320; x=1792505120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=OILuzQQNGHitUqKN6lSOHQRrLS5lHihOw7H22eT0VBoJwPqFgkweGJNKLeMOqKAjf4
         zvfkgJfM+GXapEQwdQkKBKXeJCp5lVdeKdkQnQ8CeODyN6OfoFsrNvgqGBwLJndNn3yv
         lsdEd0lkmZcaMkxR7sHIQeCzd7PdTPDXo5C8Z2oelqXgQbv7VmWVf94YaXpUjQD9N/I9
         VlniGbbz3zrOHWwP2aVA8tc5tsr72LpZ7gfdg2fJlXEhly2gmVTsSLGJGZfwpb5dI321
         pwTxc8xC7xTcvLqstvZghpwoK/b2LINceM4Sla6EoH8sec8hDHYlfhL1h1W8J28OVIG9
         71iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900320; x=1792505120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=hCV6Wp4gxmxLDhtQw3QDFcTOoF/1TzfsnfDQWBV2nOISSdj4VZGVEpn5CLLj3feLkJ
         rDkISt4J6ymNqiz6vqpoZt/ODlmkoIQloni1nmbaTpHc4+ox0d00UI9HDG2LzRSX2WH9
         FDpqrC2gxI38ppyaXNVJwwFPVN4dP6lIK53dWX7Fcg9AlBNhFLh6jviQ9dQogiHvEbSJ
         T3Rzj1TjMUX/f+gdrmN7TAi+HVBCiTCVT+1TlNk1wc2poCYAfXP/ffgZMiHK3EB40Hms
         MsmAvRQ5MKvfdlzjTgA+xxGhhyZ5ARIECaD8n4FgCeQeTlJCQhulgixsl4f1ZeAcd0nI
         bN6g==
X-Forwarded-Encrypted: i=1; AKwUvBzh6ujpD/3yUUN4KMyFHy1DD6WO9v/jCAlGjRcS8mDCUVLOo6hPMjkm1k7yxMLF15G7C3f/RpeH5Jj8Ayg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb7opHeZMCCqJu8852j+Mn/jM3BCukyrmg2bjL7H49I7m3Jt4f
	lvXssIYpn9lTNEbqB/ViwpG+pyyyY7l1r4eyyGNgcLQ1NlvUfEGHQJhB1PAmozXqXRw7ptGWHLC
	DIiKIqPR5YSXlrTIkvZ9dtR3sXyHh6nE=
X-Gm-Gg: AYBFou2NA0XepnorI/ZmuX8rup0+uUl3yaAkOu09nTyQwiEFUShlXztxppvjlgAyZLY
	Y5X807WAncBIGH8bdZ23IY2zmSXMs7HfHnV+ulUn3k37Bk3tD/gPdvsv9QxmU+Q7a/6e35JqwFZ
	sH5JARz/MGF2C2O6t2WiEZPaIms5XJG7Q4Cslq+9qX1olQScFF86hVby6/LcOPxuZSE0PnTMclw
	sDjQBNNVgE2PZBJcdX8l0MbCQk36XniNPUmfOb0BV+EjrmAMkDxPr8rIdOh8Lw8bF7zciJi+uiM
	25EJo2HxR1otw+qz8oH36FYFAPLRVbED3RKE3nQzQqlQYQY70NXqbfZfFMqm2e3AZjLnG7GYmgQ
	6K4L485YXyXu+isreRxabGOI=
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93ebd24b2fcmr2220976385a.37.1791900320079; Tue, 13 Oct 2026
 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-9-kunwu.chan@gmail.com> <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
 <as4ooZSWA2lAIceu@tardis.local> <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
In-Reply-To: <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 13 Oct 2026 22:05:08 +0800
X-Gm-Features: AclHuK9Y6wjNtKPnooCMgRZOapMzF0kyKCufRscUU_wsuFWoqVB6jP59bjMM3m0
Message-ID: <CAJhGHyBd5wuLO9H7bHJDO==2=z8MGQ3ehvszLiB1brztpRXu8A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun@kernel.org>, Kunwu Chan <kunwu.chan@gmail.com>, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-13 08:48, Boqun Feng wrote:
> > On Tue, Oct 13, 2026 at 03:40:36PM +0800, Lai Jiangshan wrote:
> [...]
> >>
> >> This breaks the forward-progress argument used by the underlying
> >> hazptr implementation: after removing an object from publication,
> >> there should not be a continuing stream of new readers acquiring
> >> that same object. Here, the bucket is never unpublished.
> >>
> >> For example, let B be the bucket containing key K:
> >>
> >>    Updater                    Reader                 Scan kthread
> >>    -------                    ------                 ------------
> >>    Unlink K from B
> >>    hazptr_synchronize(B)
> >>                               Acquire B
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               Acquire B again
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               ...                    ...
> >>
> >
> > This is more of an implementation issue,
> I agree with Boqun about the point that this is really an implementation
> issue.
>
> If we care about forward progress in the scenario of a repeated
> address reuse, we just need to wire up a "0/1" low bit phase tag and
> make hazptr acquire pick it up and set it within its hazptr slot. This
> will ensure forward progress in that scenario. hazptr synchronzie
> would therefore flip this phase between 0 and 1, and check that the
> pointer it's looking for is not set in the other phase, in alternance,
> handling both phases within one synchronize. Indeed, this phase concept
> comes from the realm of RCU implementations.

Regardless of which implementation approach is adopted, this would effectiv=
ely
introduce a new read-side synchronization mechanism based on hazard pointer=
s.
I would prefer to see it introduced under a distinct name in the
kernel, so that its
semantics and intended usage can be clearly distinguished from those of
conventional hazard pointers.

Thanks,
Lai

>
> I think that the overall mindset so far has been "RCU does this" and
> "Hazard pointers do this" as if those were entirely predefined
> mechanisms. I think the way forward is not "one or the other", but
> rather to combine the strengths of each of those mechanisms into
> something better.
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
