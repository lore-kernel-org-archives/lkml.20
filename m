Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877684;
	b=kR2Nuy48SUlPhEOeFfdYvg3M6V1kaW+kxKZXtyJuHgximEv09RSguTMWMgb4d5PDS+1a
	 7CnCkP2t2gHIAlV0AQTlX44gnDrZ2zgD9S5ePEmuQDfUzc6PlfLrS2Lq5jldqvksacSr7
	 eJzkdPM6AuAGnX8vzvbjxeX6hlKp+tcphavaKLeIjgkv4wdw6NrPtKsnMqaF5WV6ltyqk
	 PGGltqeS4Z6PcecYFztmqtPH9K+u+7ObrFTnCUSxKVNmoTHSkTQXvBv5B3Sl2ADx1bMRt
	 HPFadjxWTB7lssIIljet2n0xOXSv/v4s5+NJFLR85Ln4MzHba5Jpfdjr9rIF7JHmJ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877684;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=XdbzovvwSk99PZMKZkCbqK04cZmQqVMPaRpFbjr+z+4=;
	b=XNuFZ8z94VnHkTKzr8VzSqISTW/5TGtvfOrF0O5mgi0oUu7Db6Ybe+VivwWlvMkNeiWD
	 zekOarh+R4Mmk4ZEtP9NIoScLB/LjxNc9lLeF4/o/a9PKKUPWNtgatFSM9ifIzfP2ziXb
	 DsWsrNJF5XTkXNSD2hKjoLO6XC9SF7PE0VwdCD8ZPO9ey9YaGKdeexra9qM8Un5Ql0eDi
	 t/U14t6Gqf/aZZCX2wLFjdXs7M6VOvnS/gl61mo06tN5UNP4PLmF8V/CCjO6GxeUkG3Ep
	 FFctM7aG/Kb5FS0iti4DbhCz3wgDlB40BN/oYzig32O3kXWsnUPGsOyFttNNi1iLn1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=njV8wLyt;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8C606A328;
	Thu,  5 Nov 2026 11:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE8C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=njV8wLyt
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jL0HY4Pn5zKqL9;
	Thu, 05 Nov 2026 12:21:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793877673; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdbzovvwSk99PZMKZkCbqK04cZmQqVMPaRpFbjr+z+4=;
	b=njV8wLytjMNaeOBEinOo3eTUdTYGUYGxJJuPikjp8AuFNCTh+p4NMVS02uF9AeZ7qmoGH/
	bTTP7agcl8lOUxOgxdG654aWWSKJYyEOe7p6SzErFH3FtECEFwGqNty1pPHTwrwFuRbiTZ
	oJXY028uxUPvNmv/2knxNEvKz6A78/KYpNNLPqJQdKzio868XCwHRpZsmKq8tefdSaLh8/
	ccBezvXKfsAecZixVKex0CC+7hbIGIqoR+yIoMISS4W8mbZnUjI7rTWa1C5LH2ci0zhuPi
	0xlK5jSBOjb7oBe6UyFEdODW3l20lYyyzc58VI60mLerRDCFj0fVKS2prKRJ+Q==
Message-ID: <32c82270b2ad0d10546af6f13daad9d01b55d234.camel@mailbox.org>
Subject: Re: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence
 reference counts
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Edward Adam Davis <eadavis@sina.com>
Cc: media-ci@linuxtv.org, sashiko-reviews@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	robin.clark@oss.qualcomm.com
Date: Thu, 05 Nov 2026 12:21:12 +0100
In-Reply-To: <20261105093546.61098-1-eadavis@sina.com>
References: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
	 <20261105093546.61098-1-eadavis@sina.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: diqbmt5rucdqa356ab5fw9o9ka4mcgmi
X-MBO-RS-ID: 3579bb5641e3cc744d5

On Thu, 2026-11-05 at 17:35 +0800, Edward Adam Davis wrote:
> On Thu, 05 Nov 2026 08:49:49 +0100, Philipp Stanner wrote:
> > >=20
> > > =C2=A0drivers/dma-buf/sw_sync.c | 6 +++++-
> > > =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > > index 8df20b0218a9..261bc98b1ed6 100644
> > > --- a/drivers/dma-buf/sw_sync.c
> > > +++ b/drivers/dma-buf/sw_sync.c
> > > @@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_tim=
eline *obj, unsigned int inc)
> > > =C2=A0		if (!timeline_fence_signaled(&pt->base))
> > > =C2=A0			break;
> > > =C2=A0
> > > -		dma_fence_get(&pt->base);
> > > +		if (!dma_fence_get_rcu(&pt->base)) {
> >=20
> > You must hold the rcu_read_lock() while doing that, don't you?
> dma_fence_get_rcu() is simply a wrapper around kref_get_unless_zero(),
> it has nothing to do with RCU. For instance, the use of dma_fence_get_rcu=
()
> within sync_pt_create(), as seen in the SW_SYNC_IOC_CREATE_FENCE code pat=
h
> does not require an RCU lock.

How come the function you're using here literally says in its docu that
you need RCU?

/**
 * dma_fence_get_rcu - get a fence from a dma_resv_list with
 *                     rcu read lock
 * @fence: fence to increase refcount of
 *
 * Function returns NULL if no refcount could be obtained, or the fence.
 */
static inline struct dma_fence *dma_fence_get_rcu(struct dma_fence *fence)
{
	if (kref_get_unless_zero(&fence->refcount))
		return fence;
	else
		return NULL;
}


The rcu_read_lock() protects your kref_get_unless_zero() from running
into UAF if refcount =3D=3D 0.

That's why dma_fence_free() uses kfree_rcu(). Your read-side-lock
prevents kfree() from running so that you can safely read the refcount
=3D=3D 0 from memory.

If we think about it, having kref_get_unless_zero() without RCU doesn't
even make sense, because refcount =3D=3D 0 must mean that the object is now
supposed to be freed. That's the point of refcounting.

Or am I missing something?

>=20

P.
