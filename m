Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086559;
	b=QtLhHy9+y5pXLZWN5rHC1EyszXBTdmYqCs7QhREhJeNGeXmDfN6TzOLCWpg7RhjgFQrm
	 fmWW9wRcCqMkDpjZyhxyQeqhJlpv7KNJm8PHz74J8eq15X4IFgZoIxQnPfRM74ePiNwXI
	 XpeewNGMHYfyIfnLA8/JW7pqsPTuUdclx6CxyYRASykv5kgugs1iOMjJ0a/cGwtMU7FHD
	 k/6SVLTACe5bFrMKFYckhkYIPTQ3xoW8am7A5SybzZWK5lkeeU9YUs0sMG6gR9fR5PllA
	 vtad1yV8mAl9lIJxd+ZI85lBvgXnEnPYZcFkS9TmUeCG7b2rW0mcIiB0XkqS6mWt2GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=6E0S+uXvxCCY9NURW5MnDCU7JCLtVND+l++tVq3/Nd0=;
	b=kkUZ+8p1h+CrtFeZzqgRkyaV5bYEi8niTDb1bCXpXV4Jh5CQTcgj2EWxsaO/E/HgH/WF
	 ynnNc9QYJdJ9JMHbYC8nfEYkXHI3/rprDIA7PRklJPohYWzxCq7URFv24kwKegp4pbzHG
	 QWS3BFHG0501DPGEQ6IOpVUA9jOHv6yLpKraDERrWxsPdN4/DtWME80dDbhFzrXdhQhZi
	 Y8mxjYW2qPfbFb5Do5hrmMS7tHeZPhj9maP3lwQ8m3nucCcXnGqXh6t2FyppCUnTvWe7p
	 zxpXQHUX/oqbJtNImAosjND7hEesKMaMO9SZwiWAU5O+yIwUWUm/psO6UQ+eGxEzABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JOtQcny+;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA484606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA484606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JOtQcny+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6E0S+uXvxCCY9NURW5MnDCU7JCLtVND+l++tVq3/Nd0=;
  b=JOtQcny+b5mLTak2U66iLvzd1HVB9izcX54lm0hPTrWCAbbNp1qAIMhC
   GQfQ24OwYPE6hm8fWqu6DjcKHrXlIrUmhtl6IkTIuDWc96Fumo3yPyI2N
   nhd4r+Q4L+KQY2GyyzBZj3829KFAnfuArKph6CwCm7oBuHqkZPHTYcyNt
   I=;
X-CSE-ConnectionGUID: 3NFC+lkXQIq6L8VyU14P1g==
X-CSE-MsgGUID: gpXHzWPnRseh/b1iJF1A4Q==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,200,1787004000"; 
   d="scan'208";a="162060581"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:22:28 +0100
Date: Sat, 7 Nov 2026 22:22:27 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: James Morris <jmorris@namei.org>
cc: "Paul E. McKenney" <paulmck@kernel.org>, 
    Christian Brauner <brauner@kernel.org>, 
    Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, 
    gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, 
    gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org, 
    natalie.klaus@runtimeverification.com, willy@infradead.org, 
    linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
    tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, 
    ejratl@gmail.com, corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
In-Reply-To: <214b8fdb-1d2-b4c7-312c-72f026a4c752@namei.org>
Message-ID: <3b133b3b-46fc-872-968e-ebbfa67697be@inria.fr>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop> <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org> <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop> <fcadb228-c6ac-d97d-8f9d-0b05f44f112@namei.org>
 <60e7a5f2-a1f4-456f-a24f-d53c441a0ac2@paulmck-laptop> <214b8fdb-1d2-b4c7-312c-72f026a4c752@namei.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 7 Nov 2026, James Morris wrote:

> On Fri, 6 Nov 2026, Paul E. McKenney wrote:
>
> > On Fri, Nov 06, 2026 at 11:20:09AM -0800, James Morris wrote:
> > > >From Chris @ LF:
> > >
> > > > Hi all,
> > > >
> > > > This list is now operational
> > > >
> > > > address: formal@lists.linux.dev
> > > > archive: https://lore.kernel.org/formal/
> > > >
> > > > any issues or queries, please reach out to helpdesk@kernel.org
> > > >
> > > > Chris Hoy Poy
> > > > Senior Systems Engineer
> > > > Core Projects
> > > > The Linux Foundation
> > > > Perth, Western Australia (GMT:+8)
> >
> > Very good, and thank you all!
> >
>
> FWIW, it seems that list owners need to subscribe.

Thanks for the reminder :)

>
>
> --
> James Morris
> <jmorris@namei.org>
>
>
