Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749735;
	b=ZUjnw1JyaAX4yLvs439js6wETK/O78ZhB/Eun/OBED5Dqra5I14cFG4vFVDBN7T/k1Mz
	 mEPX+ImY8WC3A+oRcytTW+uornO55TBKqZZB9+zu6pJwY3U1C3joC9nz43lTVPjXUhbZ7
	 8I5On9opM9sg8wt0tJroUTfOK53si89ubHlfZkHSOl4ABK5TDr4EiLIwtzgCkQdwThJhg
	 nKlNKBZqtbahGFVqdEQDZc+5aL5D26kJAfbQJvJONwY0ZLU7BPXrrUkPXSAHy9ls+axEH
	 hYxYQPvecgdK4gcL+H2Ngiry+fac7urx3Z/okfAzP7GhqUL2VnNLzh4zV4eFuBY5iSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749735;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=HFnlNnErObXHQNlqDCOkeot4xJU7j8HUrgsyCZKPuo4=;
	b=QOx5or0Sfrn/Qy7rPs24mtFGqAVcZxQ3u7aYjr7aLddUP5R6RzJ2lZWDZhUvwrcIZ3Oe
	 mvQ8KlRlI/DbLaXACM/5ClezA9u1SAgU984EiVmhnHCtcfKNfL874GWNtsIttCZVb2vRY
	 URfRsyAIXulWMFmNQyvlsdrQm5IKBMHQ9cMbIWsZMZ8pTvVFVn/nuIdmAsx5BVrR+2GT4
	 D7VPikUd1IIMpxticj2NPD1V6Ee6oERcUTvwmv40HDex4cdVPtm6M/aq1Wcq5PKK08SpT
	 +D6+JOSqXL5MIgDYhDTw/RglvHh0ILCIYrgTNbaClOC7NE3/1JAnOQGTZ9DqryF9Dvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eqOc8XuK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D09F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eqOc8XuK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792749734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HFnlNnErObXHQNlqDCOkeot4xJU7j8HUrgsyCZKPuo4=;
	b=eqOc8XuKoycvT1pkdchi3tJ4Yyh5BC2WVjUMn9PoXRA99U1Ro37K30KiTQuaU/XYgJ0Xc3
	0wzS9wBZV7kv52ue35iDXoYe4jD6OzugDiCsK9vycDTNMaYJJ1U43ZUMUP7XiYItNiGAXI
	zdGpnHcptY3oHWp07tfr9ytGUQgVavA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-PhRGOnoKPYyKA-kBdk6Gow-1; Fri,
 23 Oct 2026 06:02:10 -0400
X-MC-Unique: PhRGOnoKPYyKA-kBdk6Gow-1
X-Mimecast-MFC-AGG-ID: PhRGOnoKPYyKA-kBdk6Gow_1792749729
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC9C51955DA5;
	Fri, 23 Oct 2026 10:02:08 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 5FFFC1803A59;
	Fri, 23 Oct 2026 10:02:07 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 23 Oct 2026 12:02:08 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:02:06 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] signal: respect the blocked mask in
 dequeue_synchronous_signal()
Message-ID: <atswnpqj8VHJwqu9@redhat.com>
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
 <atn6anj4NRKpT-qN@redhat.com>
 <878q3po5a1.fsf@email.froward.int.ebiederm.org>
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
In-Reply-To: <878q3po5a1.fsf@email.froward.int.ebiederm.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/22, Eric W. Biederman wrote:
>
> Oleg Nesterov <oleg@redhat.com> writes:
>
> > And afaics we have another problem. sys_rt_sigqueueinfo() allows to
> > send a SI_FROMKERNEL RT signal to itself.
>
> I don't see where your proposed code is addressing this.

Hmm. It doesn't even try. And yes, I know it is deliberate, I know that
CRIU uses this feature.

> > In this case sigmask(q->info.si_signo) leads to UB on 32-bit.
>
> I presume you are referring to a signal number that exceeds 32
> being put into a 32bit mask.  That does seem worth fixing.

Yes. That is all. I just tried to explain why this can happen.
sys_rt_sigqueueinfo() is the reason. The kernel doesn't sent
SI_FROMKERNEL signals with si_signo >= SIGRTMIN.

OK, let me write the changelog and simplify this change...

Oleg.

