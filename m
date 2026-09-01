Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D493644C1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275690; cv=none; b=PXj7swcD+4tSBJ4fJywXu/KbuSx/TMfJ5HgvgMhMQzz8sY82vVWYE6mlQGaiVmXkiVridkwaSM0qdVTDnOjc4mndRS1KAkEiUla0Fq9uvM/wTmw94DUwOxeW1UNgA9YSkE9t7T57nCBr18fceZb0qtK9D7vsn3xFTWqFiuU8BK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275690; c=relaxed/simple;
	bh=IOnn4LQ3VDUNOBrsvvvmI1TVtsXR6+jes1ooGprk6eg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dAf1qoCoQJz7yZJkNxhWSuGst/TcYAYfXqKVa2GRke5cuyGzUTZubeAgnBuIicYA0nk/zCXhhcbFMNTj/8gKT7Z/2yWxVOEvXUUYTrAl/QGudPHQGR+p92XpLvsvKXvcO6R0n74uQ4xHKiiROMgdGUHmsquzCuUhNDXTM/BjPoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSrodKLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSrodKLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8351F000E9;
	Tue,  1 Sep 2026 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275689;
	bh=IOnn4LQ3VDUNOBrsvvvmI1TVtsXR6+jes1ooGprk6eg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QSrodKLIeVAT9PxqKqCWzgCpLLnR9RfZcaBC8Gej2s1ayOloKgHPQVTPARz7lxpH0
	 zOhtP/R4PmXMO2uE+5EmYXWhQGt7jVVvDN9eImgPnK2BDnizciAw9yyo/1E/zRFtdT
	 t8xY/Y5PDKpqrEtJCIVYEIn8J3n7Me5q2m0GT+WMMv1e/Pr03huZltFcUqlZq7htjj
	 BvQqFf4vhjyANV338gCsRo9CS1RbKxASUdQywBdbFmX8g+5H/fHul9Iih01Gahdd2W
	 w76SemvMY6nPn9F5tUvCBBEeAnRYrVoAfiBM0QtLv/wEnfsp3LOP7qbThf/NXD5bBt
	 FH6RtTg2x/GaQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Oleg Nesterov
 <oleg@redhat.com>, Hyunwoo Kim <imv4bel@gmail.com>, brauner@kernel.org,
 peterz@infradead.org, anna-maria@linutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] signal: Prevent exec() race
In-Reply-To: <apbSyHyRRczgEP2V@localhost.localdomain>
References: <87ecfki6l5.fsf@email.froward.int.ebiederm.org>
 <87se3zgb3m.ffs@fw13> <87mru7h09e.fsf@email.froward.int.ebiederm.org>
 <87tsofdvf2.ffs@fw13> <871pbfeaiv.ffs@fw13>
 <87zey3fep2.fsf@email.froward.int.ebiederm.org> <87pkyyd39l.ffs@fw13>
 <87h5kad0mx.ffs@fw13> <apV5A6IGNIe2Uh4f@localhost.localdomain>
 <87zey1b07t.ffs@fw13> <apbSyHyRRczgEP2V@localhost.localdomain>
Date: Tue, 01 Sep 2026 17:14:46 +0200
Message-ID: <87ld9latqx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01 2026 at 15:27, Frederic Weisbecker wrote:
> Le Tue, Sep 01, 2026 at 02:55:02PM +0200, Thomas Gleixner a =C3=A9crit :
>> On some far fetched completely out of order CPU that might be possible,
>> but it's moot as it's already established that we can't do that lockless
>> at this point.
>
> Sorry I probably missed something in the discussion, what can't we do
> lockless?

Flushing the signals.
