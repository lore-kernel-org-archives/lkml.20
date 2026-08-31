Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295739B972
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165501; cv=none; b=UJ5StMbgUHspWcxUaeC4HQzXhFKUhnN90XBUHlLHLphJDu7gFiLYEP2lQjwANm+ICcTjyrSqeDp6OvDB6EhTxitxAhuuIRmXAX3qYIXw5fxkY/QgBpccZG1Br6Md5JX2TGoNaG5LmFgKvSAk+9BnbC/eUG5O4SWT8HRC1Qe/7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165501; c=relaxed/simple;
	bh=h2T0KnwtqfceIYMxiPuTWbVHYLTrX3LOu6aA4hJBvRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tv1xLds6vWfStsCjHehIRMz3gBzL5CIt2nBvbrgwd4jztW/GWve5ZWjoAg9H+rOxKLHmTFHYSKKTFtTB8lELHrTNwziiqI9y/VAXh/povuer56aPa7DJ5AmAfLjzwqiv4MXxssHgLEMq3BdP3ihcbpEqX7/D4SwWH5DWyFe23wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jt8wBDSr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jt8wBDSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788165490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou/5XoFexd0e8prVBcAXXy3JrQFXRsZ4yMs9+bOlChI=;
	b=Jt8wBDSrFFDsrMyWZsVjU5EO+hm+whEa4pXQwZZl5LMfPkUvRFF8gE9rf9npswQK7TIAwo
	DyzCTpVTp4roE2Fj+cv8rplRT+yoEnyR8wi6E6mW7ao39g7U7fgLLca9Hvvu90hcS6TdMs
	7iE6E2F9s3Vw8bc5IRH1bqUVuT4c8ek=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-NLdu_ygwPhaMmUjBGX6utg-1; Mon,
 31 Aug 2026 04:38:06 -0400
X-MC-Unique: NLdu_ygwPhaMmUjBGX6utg-1
X-Mimecast-MFC-AGG-ID: NLdu_ygwPhaMmUjBGX6utg_1788165483
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B62C185514A;
	Mon, 31 Aug 2026 08:38:03 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1FC830002F5;
	Mon, 31 Aug 2026 08:37:57 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: odion@efficios.com
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,  Peter Zijlstra
 <peterz@infradead.org>,  "Paul E. McKenney" <paulmck@kernel.org>,  Boqun
 Feng <boqun@kernel.org>,  LKML <linux-kernel@vger.kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Dmitry Vyukov <dvyukov@google.com>,  David
 Matlack <dmatlack@google.com>,  Marco Elver <elver@google.com>,  Sean
 Christopherson <seanjc@google.com>,  Wei Liu <wei.liu@kernel.org>,
  Mathias Stearn <mathias@mongodb.com>,  Chris Kennelly
 <ckennelly@google.com>,  Blake Oler <blake.oler@mongodb.com>,  Rich Felker
 <dalias@libc.org>,  Matthew Wilcox <willy@infradead.org>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Carlos O'Donell
 <codonell@redhat.com>
Subject: Re: [RFC PATCH 1/5] rseq: uapi: add rseq operation definitions
In-Reply-To: <20260828153349.8061-2-odion@efficios.com> (odion@efficios.com's
	message of "Fri, 28 Aug 2026 11:33:39 -0400")
References: <20260828153349.8061-1-odion@efficios.com>
	<20260828153349.8061-2-odion@efficios.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 31 Aug 2026 10:37:55 +0200
Message-ID: <lhua4q28z30.fsf@oldenburg.str.redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

> Introduce userspace ABI for rseq operations: a per-thread list of
> operations the kernel applies on return to user space.
>
> The main motivation for this work is to encourage TCMalloc to migrate to
> RSEQ v2 [0] and use the glibc RSEQ region.
>
> Indeed, TCMalloc relies on the behavior of RSEQ v1, that reset the
> cpu_id bits in the RSEQ shared region, to invalidate a per-cpu pointer
> cached in a TLS. This hack requires TCMalloc users to use a glibc
> tunable to disable RSEQ registration for threads so that TCMalloc can
> register its own region, overlapping the TLS cache.

The commit message does not quite say how this addresses tcmalloc needs.
I assume the idea is to reset some other data structure and not the rseq
fields.  Is my assumption correct?

Would it be possible to use actual CPU instructions running in userspace
for this?  I assume not because it's not possible to restore the
register contents.

My concern is that this would turn into another bytecode interpreter
over time, basically reimplementing BPF.

Thanks,
Florian

