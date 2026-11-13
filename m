Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579076;
	b=kGWtIKJmwJZ30f6Vy6l4i1vTIEt/XRzEdqVdW6tQlWguy/O2Uihl/0HLiAOsGm/DN1CJ
	 dfizlwjIou/HTIzrYcluGa1g6zOLrhEYBnM6r98DtK4TV24ea0awHJOnSlyL8YdScE1tz
	 W/znoX8sTSmBGK4l3uMY5XVOS7sSHVad/OpZp8MJ8hiJbWZc0PnFr5+R/4A2/ha9nu0QL
	 uOhAV2gJnM3E6Zh/+jfrq4fxf1XeScK8mHJVUtgCU7ou2qq1OBMzTJLyoxME8TMmP230D
	 RrxuB7dcMfpdnePDw5tD8Vd2FaHZIX3Sepln1fkxR+IQnJMXNRz9+gKpCwHEESaNieQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=CjpUzx3i2QdrmQAq6pyxpP9zjeEOXQZCXG5tsLV8P14=;
	b=KhQQ6A1FAHXlJkQrqIJsLfGMBITcBz80YXt3j2YpvAkjRL4UfzfpV5zdYjiNi4w4T/6Q
	 Z2kZiE60vnw7PH+rzvjSbvxClDUx8PGCxfXikUaVLFNxvF/Ch3gjlII+m5jZZXyzULGk/
	 v1Osa86OlzBPUYlkzFpb4+eQrEi6WsWuwxV+SPdqv5LShi9vYoZnBVPLREPioAd5eZRrr
	 jWQVi16JTj5o6oWfXbxPxZg1w+4shMgeh8FQhPxyRF116c5LM0tU4aXJSbXcMtthM9qLV
	 gBbak7/b8WFbJl1KUnjuPvKk7w4387DvauTyb1rG3mv/eHEsKHoZIbadG++F/QqKXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X15Q5nmx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D380606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X15Q5nmx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3311F000C5;
	Fri, 13 Nov 2026 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794579076;
	bh=CjpUzx3i2QdrmQAq6pyxpP9zjeEOXQZCXG5tsLV8P14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X15Q5nmxuFshajAZkPpInhyRazb5nks+5oxJpPWIlwieizJe28gJhNw6rIG5J4PUO
	 9JZ/KbhgKyywd/E5aDHxjd3O8taPmq+BGUrhkPPIA8OPBqxaI5vkB94dO3yp9mp6DH
	 1eVdBKc0EL2RrdR2sYaCa52qwdz/QaVopNQTzTvp2JFnzwOIaVZDikAKfH1/C5goJL
	 hc2Z7eUbht4e86unDu7fWE8CoOaaLmFWpb0oPoGm20Wy5i2l4YE/amfkcA4Xiq+XXY
	 QEK4oPUuUK1H19jttADclCp8vi1CHj4mTe/pK5HFwNy2IRqZ2n4OqcmCZkZFIOjNcU
	 0m5gm2tNeWK2A==
Date: Fri, 13 Nov 2026 14:11:10 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Oscar Alejandro =?utf-8?Q?S=C3=A1nchez?= Lucero <aleszlucero@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/folio_batch: document missing struct members
Message-ID: <avcabz1mf4Zo27DW@gremlin>
References: <20261112-folio-batch-doc-v1-1-e5a1c013e4d6@gmail.com>
 <5ca50c99-8dfb-42b1-b593-16bf264581e8@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ca50c99-8dfb-42b1-b593-16bf264581e8@kernel.org>

On Fri, Nov 13, 2026 at 11:17:49AM +0100, David Hildenbrand (Arm) wrote:
> On 11/13/26 05:10, Oscar Alejandro Sánchez Lucero wrote:
> > Add missing kernel-doc descriptions for @nr, @i, @percpu_pvec_drained,
> > and @folios in struct folio_batch to fix warnings.
> >
> > Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> > ---
> >  include/linux/folio_batch.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/linux/folio_batch.h b/include/linux/folio_batch.h
> > index b45946adc50b..7731dcd249a8 100644
> > --- a/include/linux/folio_batch.h
> > +++ b/include/linux/folio_batch.h
> > @@ -18,6 +18,11 @@ struct folio;
> >
> >  /**
> >   * struct folio_batch - A collection of folios.
> > + * @nr: Number of folios currently in the batch.
> > + * @i: Index of the next folio to process in folio_batch_next().
> > + * @percpu_pvec_drained: Whether the per-CPU deferred LRU queues have already
> > + *                       been drained during __folio_batch_release().
> > + * @folios: Array of pointers to the folios in the batch.
> >   *
> >   * The folio_batch is used to amortise the cost of retrieving and
> >   * operating on a set of folios.  The order of folios in the batch may be
> >
> > ---
> > base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
> > change-id: 20261112-folio-batch-doc-fa4f7e18ec85
> >
> > Best regards,
>
> Waiting for more review before queuing this.

Dreams do come true ;)

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
