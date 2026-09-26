Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D83793B1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790407267; cv=pass; b=UOWN+R7Td3ov0AGyc6dShdKPnI9k7pkqiUZuYhQHSE5AvuCbPDhV33OAuedgF7+SVO1/2VIi4L4R1brH/2WvcNYjno10ri2pGr9j2Ep9BJHKDgsuliVxcljVzQ0HU5ExLgfl7jbtOTUKz8laGkvhD587JDwL9cM9JKFrlFVxzLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790407267; c=relaxed/simple;
	bh=JSaZbVji5Ea0/OPC5PqKZgfN3e3cz3ZXBga9A0C+uKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1SHXcqIyfTQK6RmL7P4A5Fj8mBTNmSNhPQkHFZvEXdNymc93QImBlxbraPkOe1MAJzWAy06loAen8WrwVFviYB82iZqohUall0KZ4edynUYgccMlsWTa9msCErStap46yyXJiJUuOJl+hwaA6yfjbuuwQREQJrVQFV/Ks4JklM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiFKN0jM; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiFKN0jM"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so780518b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790407266; cv=none;
        d=google.com; s=arc-20260327;
        b=QEZ3CAXP2O6YMl6rW6Cp9UFbp6yom/tMqX0yOvoFx+e5s/qo3TJ/NCdPL7Q9XKrDJL
         B8bJULla6SzPA4kuORGSPpiA4gvhrTTJoj6c78Lq2wrX1xBciVej6W/aikG1VueUIdG+
         M1G8LJf5W3nKhu+M7zgs9huevdHoEMUmJcdX/n1npPJIdgo5i7ivm1wOL0xaXLj4FA+O
         Zj9uBU9ewbN8Ze6Bn+a6EnQja8c5oVEOKvteB3ZHwVNjt2V1tcpoOop569DLdExeRf9U
         WDMFQ84+ztJryDWEgzlmEVzqaA2/3o/VhHlQpljWAkm0qiOmHtT3hWa5Sci4h65ReH3q
         nukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        fh=OLq8WmyPCWrnW/Kf8mm8K/kQyXEoLnzrHbViujpBa/Q=;
        b=ZF69iVFPcxSUpzUD9ocRWzOruJutxY7NvyttjzJsa/cNaIMuW9mDAg+1Jel+FgEJ2F
         SBnGHx0XP4BPSncg1I3mLwMQeCpNHxjQxha1AUZ3haApk0NlzZKQUPyya2Z9eiOWrEJF
         xyJK8cVd5mDRQhqYT8AkXW343KvIIUQNj8id1onHx5tPjiHTXITpc/iBI+pCqrUje9P4
         rj8dbAohz4R9Pf3DbGYISwpm04yboIFVQy8DwjdX0xFBkZhf8XyfoLuweWzAy272oHF9
         CnM3MjnuknBKG2PjTVH9oFMsiM9M7mZ8xACkqYTgFKSI6W7OxF/LjBh/Sk4oesccRpyv
         svjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790407266; x=1791012066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        b=UiFKN0jMrvECP/uSEfD3uEzWB/mgENKtlUlqBAspgFoegQ00d62sHE6Q6ggA60ftk8
         epA8RuPOvmXFTzAcxhugyXkhrxeZBSFWo4dfkaUggmdZ/Kfr1QIHno+qiLZaqNH4jyqW
         KgtjPoK+1FkQd0Xg2ou0pSriUKwUN6l9ymxub4oVhorJhoExSRQNLYGBNzfkiq50sME8
         S3bDbbYgXUsbdZgLiOyErwjO98SC3iz2YmjVVlht8n5pruVeXvnhlmUGZUbxLY+QEQSN
         xlXgAV49GRLCtPuazuqGgPxPy+YZiYJZjDVOr2jCsWlCTc4wSJBcyC5XJQMZdWCtVQSd
         0YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790407266; x=1791012066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fxaPqNTjN/pMftWjOpORDKiV+ubgNTjPPityCn5HVI=;
        b=sfvwrSI9Vt99RLjkIpAf8ynh+eTbHHRoyGNsDQ4ilDsY79pXN8ymZs75YHeGPkJSt8
         P0+TMZk96VbqY8iXuzQ9VIx1teHytzIQI8ERAxRmED7NQ8wi4VRqeiCM3L1qYi9GBo0M
         JkliIQ9VFBdFkizxzeXPEEfJu9CF7OCYW0hbGoRFSCue20e+6J9DI6fiD/4Ndvp/dipI
         kusTiSpQkrWUT676lnBJ5qMWUc5tOuXg8tvMkxhDz6+g9o3A3Hl4zHGyZhHeOQokje1g
         suRyv83hcDpRrEd/3O5QXrzeHnH9jqOpYvvSFBVnBhLZyLKyKCwtKUriS5x6yADQCLVO
         jfeQ==
X-Forwarded-Encrypted: i=1; AKwUvByHx6XZSc304IjvT0nqhmDJeCiodL424FmWQcIP/ftTdlrTLJObAyWhz9PqOg+JZSeBfaR+/Vxq41CR5wE=@vger.kernel.org
X-Gm-Message-State: AFuF++nycR0DI0htrNife8wsWcQOIB6hUpP1G58eCMISUPti3KmO15Aq
	o0pVAQ9gp7Hg/dEwpmBDfZMTg/f2BPjpr7TRHUH1C1IE+2fLTMQ8AQMPvwMYi0lfXWBgcQW6wVH
	z2+o4BE1KkEAXy5nUD/HOle5v8H9H+NQ=
X-Gm-Gg: AYBFou18tZWsbVDZp12BCPFL/UeUEHXrVPnweGjDPHF04R7D9Q/YvWWAZRasgIIYIxd
	46rEKYu0aFSnH4ravxoBi07n6/Y+cQpMqZYn7xvGg8TlzgFHFxjgwPamjVaPn55oRQUo7FYx8L2
	pZIQIR4liHYQYf4Qmm//LPJAxX9JPKQxAJqkdEPl6ZPTj3ciQtIkhUDHadoheLWE7BHbOKuv1iX
	5YWmvvBmv0DbNi0uEydCKraBV5BLzYbTmi9IZEjJYVJfFjtjG7V0AuWoy9DhdHwTW7Qq2Sf+8J+
	k/lbIydW0PeWSX7yj/wBr88k6FuDAfT0UuYrxaItn8WHUg8ve+k7nQI=
X-Received: by 2002:a05:6a20:a11d:b0:3d7:dfbf:7435 with SMTP id
 adf61e73a8af0-3de0e6cda41mr7552780637.25.1790407265676; Sat, 26 Sep 2026
 00:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923205028.711077-1-kolyshkin@gmail.com> <20260925-zugnummer-intolerant-unwahr-2cddd52e435c@brauner>
In-Reply-To: <20260925-zugnummer-intolerant-unwahr-2cddd52e435c@brauner>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Sat, 26 Sep 2026 00:20:54 -0700
X-Gm-Features: AclHuK8CjebxrGLaeQF03zgqQYXxG7Ana61oRaZrCBoCqp-gd9qKzgfSLqEq9J4
Message-ID: <CAGmPdryJ32KFtJiX3X+3X_9Fkesj=9GHjPN2qm3H_ctd4Z0bdg@mail.gmail.com>
Subject: Re: [RFC PATCH] mount: add OPEN_TREE_SKIP_MNTNS
To: Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	David Howells <dhowells@redhat.com>, Amir Goldstein <amir73il@gmail.com>, 
	Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:45=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Sep 23, 2026 at 01:50:25PM -0700, Kir Kolyshkin wrote:
> > crun, a container runtime, recently started using OPEN_TREE_NAMESPACE t=
o
> > set up the container's mount namespace, and open_tree(OPEN_TREE_CLONE)
> > for the sources of its bind mounts.  This turns out not to work on host=
s
> > that have a mount namespace pinned anywhere below such a source: the
> > recursive clone picks the pinned namespace up, and move_mount(2) then
> > refuses to attach the tree with ELOOP from check_for_nsfs_mounts().
> > This was reported to crun in [1].
>
> Yeah, I think that makes sense. Please split this into two patches
> though: semantic changes separate from test changes. Maybe call it
> OPEN_TREE_DROP_MNTNS_MOUNTS instead?

Thanks! Done in v2:
https://lore.kernel.org/r/20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.c=
om
