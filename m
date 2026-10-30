Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396096;
	b=tEySzYzm9eQ93PIlCCt5oI9OMNQFQOGYuaVfFU2ZEMQYy4sQbAzMJklsL4w0vzM8nF+4
	 W9nT20H15eQeuwtDezva0htdMjScHwrZfZtuO9GpdMCM+yJRk/bQ/YdsF1GgQclb3Y7uB
	 KoFbVC8Tn1R1CCJHIk/6UVlwzeSWNbWez4X2RSdd0iaNtyJ3+HyyrRHzfZT+sBvEXjraP
	 o7EqHYjZof6e8ezNhzkEcW7YwgWB+bycIYxbCL96u8JyWjBqK+XKeYLM3g0k2HeaZRWwV
	 Zb23vEeLm6BxgrMg1mJu0K/uKCuJ3LzI8ACNK7EUoj2uHQHVjq/PU4qFUWaRIviuX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396096;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Scanned-By;
	bh=czK2FaEAAT5EgZaCm6u1wCY1Pyc0aRHxwioYYEY0kh8=;
	b=2wVIoldHYwDgm/iuev+8MWByRawXIOvE+OPcVDPQk6e9DewJnTNA2txPmB/tDXGKsJ+a
	 ySAEtsY+y+eV7Iy9kGEmgoHhFiKFyqeeY5WMbFpekY4oZroMooB5V+DdAOdAN+2cB6eEF
	 GlanucroijgxnUAkPFjMBXJQzH+km5VTjrZpsDS9xutm7zMeRkxoKl8FizmeMQ6pftlE0
	 N/U+ANVYLLsSe4Q3Iyzx0zAHcHsUu1tZY+KGKcpyPgUhfyUxZfyc4JWrGRg82A7973Lgk
	 mzUkt4eiJsEvJbNAZGOLYWrsEN1z62Cvv4rtR1IUzYNn9C9KifKmpaMrkpEr+OJ4RPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kui4smJw;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28542606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28542606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kui4smJw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793396095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=czK2FaEAAT5EgZaCm6u1wCY1Pyc0aRHxwioYYEY0kh8=;
	b=Kui4smJwgN29YYeZ6K5qX6AiRGYgm94tyg6ZSL2ZJRWPxuwtFornT7vd5nxDH/QegdikpB
	HEnE8656T/YgEAbjsZNCYC1TGqOug4KZfxM/tPy1PuiOMm7aB/jizLyzPvGUN8DsNrH1pv
	o9L39nVyZm8sCnARyOMfMU384ynhvJ8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-4klCusaaN3WMpxi05gbJiQ-1; Fri,
 30 Oct 2026 17:34:51 -0400
X-MC-Unique: 4klCusaaN3WMpxi05gbJiQ-1
X-Mimecast-MFC-AGG-ID: 4klCusaaN3WMpxi05gbJiQ_1793396090
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89444195604A;
	Fri, 30 Oct 2026 21:34:49 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A91101956087;
	Fri, 30 Oct 2026 21:34:48 +0000 (UTC)
Date: Fri, 30 Oct 2026 18:34:47 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Joseph Salisbury <jsalisbury@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-rt-users <linux-rt-users@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Carsten Emde <C.Emde@osadl.org>, John Kacur <jkacur@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Daniel Wagner <daniel.wagner@suse.com>,
	Clark Williams <williams@redhat.com>, Pavel Machek <pavel@denx.de>,
	Joseph Salisbury <josephtsalisbury@gmail.com>,
	Luis Goncalves <lgoncalv@redhat.com>
Subject: [ANNOUNCE] 5.15.220-rt102
Message-ID: <auUNdwUqmsWDl9w2@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hello RT-list!

Joseph, copied here, asked me to perform the v5.15-rt release this cycle.

I'm pleased to announce the 5.15.220-rt102 stable release.

This release is just an update to the new stable 5.15.220 version and
no RT-specific changes have been made.

You can get this release via the git tree at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

  branch: v5.15-rt
  Head SHA1: bf4cb337444a99166b70ac3c5a4b5c3a16f12edc

Or to build 5.15.220-rt102 directly, the following patches should be applied:

  https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.15.tar.xz

  https://www.kernel.org/pub/linux/kernel/v5.x/patch-5.15.220.xz

  https://www.kernel.org/pub/linux/kernel/projects/rt/5.15/older/patch-5.15.220-rt102.patch.xz

This release has been tested under KernelCI as:

  https://dashboard.kernelci.org/tree/stable-rt/v5.15-rt-next/v5.15.220-rt102-rc1

Signing key fingerprint:

  9354 0649 9972 8D31 D464  D140 F394 A423 F8E6 7C26

All keys used for the above files and repositories can be found on the
following git repository:

   git://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Enjoy!
Luis

