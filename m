Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.99.196.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794086364;
	b=VGI7VXeFgwH8fOVjm0CugkTtM1asTvuyG/uK/ChuBzSmxF8kEZA7JPIYVM6l2htPBsyq
	 welZC7uyScNnK03sfGvVF2PM/MHybt98vtIx0Eo+TsPezkQ1S8dL3ws/9WLQXGku2jdgQ
	 9abRbL0IlKB63nOb/SW8Eu4/XY24kZPI9yU+l2ie4Mzp1lNl8ELw2mBZhy4TFaIs/QZer
	 qtXSyf3KWgnYUx+NIC70hrETKTHVrDAOSWhecf3ksLfz3oTecEEWsg95P7RaiQzoD2NwJ
	 yNUZV/7O9jW6KydkAFCLja8Qp7paLwbkjbBA8aUIjqsgwx3SrT0GTwWHltszRkKtDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086364;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=a5VasmNxRKjMBjM1xs2Ju5nX3Ego4Dss0cKOy36/3QQ=;
	b=mfdoV1HMMnelhiQMer71SJlqJEjoJywCQbZ9iV5OTAxfXynh5jLBdpK8vzaYhyVySwXQ
	 5Qs6GOwNgRQicSZD+mNlCRCOQyANpCWiF4u7lRUMuLb1Yceou0IT4AwcKGj2+G58cD+I9
	 0NQ6C/6UHELQGsvC/4vGG729B+m9P4qD0Atn1SXj5ZleRgA85DuxQwmTDsyYlbkEy8oUn
	 zJxB5Bq3WjKNZNZoHrbhjQ0DU1SmhUwIZ4zzcDMd40Rs2kMj9Dtk5Nnul1oMCzL1nqVmu
	 4gPAbYvtRHdj5vHqYmt+EYG56O/cr4wbhzgwjHRhpo4fFt+zoNH1RJ1sNk1QaWgSYfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=namei.org;
	spf=pass smtp.mailfrom=namei.org;
	dkim=pass header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=isEhFbh+;
	arc=none smtp.remote-ip=65.99.196.166
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAF8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAF8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=namei.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=namei.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=isEhFbh+
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 1058C4E0;
	Sat,  7 Nov 2026 21:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 1058C4E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1794086362; bh=a5VasmNxRKjMBjM1xs2Ju5nX3Ego4Dss0cKOy36/3QQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=isEhFbh+oQnsjjAKUiVi7TwZR377+AxMULPKLRunFYS6QvYI83CGYOLTFmK+nDqIy
	 i2hFsy6NQJz7wZW23rmRciNgCvLz6ttLf65l+E56ldILHVw8zk6raGBD0giXBDaSaW
	 8N7erauEJPbw9hlRwKfVBK6ThXViA5Jb2txR0MJg=
Date: Sat, 7 Nov 2026 13:19:22 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
cc: Christian Brauner <brauner@kernel.org>, 
    Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, 
    gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, 
    gary@garyguo.net, namcao@linutronix.de, sashal@kernel.org, 
    natalie.klaus@runtimeverification.com, willy@infradead.org, 
    linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
    tytso@mit.edu, keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, 
    ejratl@gmail.com, corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Subject: Re: Kernel formal methods mailing list?
In-Reply-To: <60e7a5f2-a1f4-456f-a24f-d53c441a0ac2@paulmck-laptop>
Message-ID: <214b8fdb-1d2-b4c7-312c-72f026a4c752@namei.org>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop> <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org> <e788b576-43a0-461c-9ae0-d7de3a6866e4@paulmck-laptop> <fcadb228-c6ac-d97d-8f9d-0b05f44f112@namei.org>
 <60e7a5f2-a1f4-456f-a24f-d53c441a0ac2@paulmck-laptop>
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

On Fri, 6 Nov 2026, Paul E. McKenney wrote:

> On Fri, Nov 06, 2026 at 11:20:09AM -0800, James Morris wrote:
> > >From Chris @ LF:
> > 
> > > Hi all,
> > >
> > > This list is now operational
> > >
> > > address: formal@lists.linux.dev
> > > archive: https://lore.kernel.org/formal/
> > >
> > > any issues or queries, please reach out to helpdesk@kernel.org
> > >
> > > Chris Hoy Poy
> > > Senior Systems Engineer
> > > Core Projects
> > > The Linux Foundation
> > > Perth, Western Australia (GMT:+8)
> 
> Very good, and thank you all!
> 

FWIW, it seems that list owners need to subscribe.


-- 
James Morris
<jmorris@namei.org>

