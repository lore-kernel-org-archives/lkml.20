Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C694DAF8C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955169; cv=none; b=F1GeWoBwqCD4662EH7Mj3BcGtLJQHmjTBMfqVomnB6E1m1nxoaJhsKqVtUOlWx7US8Dr0rro3CDcnnZdyFBtelSOWkTzLjGtEyfpckkSB4SSafbVVavA7V2SoK6fbfLGH3u9fQByvGO/obCpzxkmi2NwemG6d90OtwscZvgPXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955169; c=relaxed/simple;
	bh=bDGuX94bJ3IG0f5Mime17d62AsTRDc5bEeW6MOLTzL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm1ypX9WgLEP4aUt+DB4/TJoQ7q3eqeEhb6A6mSKEZ0IalifDts0Fxw4CXWcLUFSvGgbulZBoqRUZUMcr2aEcGm/9bYGltGJkYG3Ucf9XImT4hL0f3sLy6HRWhuuOlWrcLwYgvggTZxkC/zzA38afOcBql2KW+pUr/ssxOmDwnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dC89qHdI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lKmQxI2A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dC89qHdI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lKmQxI2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790955167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
	b=dC89qHdIZCwopivBNCmP1iATKVDxjYepvpeaiUFmfb3tQpQSfMBoABBA3CsrAY6LFl1eSS
	zFYyD7a1Suo0dZyJmvbDaym7/S8UmkDGC3S5V064OPJM3UJMVEOWOEk0osaPoW1PIjUbPJ
	PlCSDfotZ9YjYBYzOMXtAcKzH8XM/6Q=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-_w3xZssyMX274e3QIz1dxg-1; Fri, 02 Oct 2026 11:32:45 -0400
X-MC-Unique: _w3xZssyMX274e3QIz1dxg-1
X-Mimecast-MFC-AGG-ID: _w3xZssyMX274e3QIz1dxg_1790955165
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8a88d53c7a6so111799627b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790955165; x=1791559965; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
        b=lKmQxI2AjinM4NXkPnzQcm7mbTd2BwDNwAhNWW9sk8vZVKPpwPytdIaae20Q710zPS
         I5hd0D0Y2UxeZYH/4zyOz1iYwJFHGCz1aUuCGh8yId62KWOdinaNRYr6IBgs70P9+W1I
         GV/5eyeuJiJR4QSI+ZAM1kcwB1HTve/lJ2EmoVY2ibDcqtv/LvzN3IFejLRu3X8mvZSw
         JEzZthhqWndz/nRtm4I5/NAk9w4J2D6sW57S3/dsAy6YisW19qeu6FLfE6WHi6pc9g0J
         D+mKqtd20R89iXlAbijSf0kpXrYiy/mf7YyxCNenmIdap3Nt2ExG/OJQcSAZZFgZQjcJ
         wABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955165; x=1791559965;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM3irjUs3GXfAQv16un+h5EqRZdho/ZwJo9GcwW1/Ao=;
        b=pRRy6/IH5zl58I+/dJGxBukCr0rMLy7XMhWs54E6poYqk5+sBI9h4+xYS0cyfDbO4r
         deieTvKbj9ZA5KpY0HAK7sFi9kWI4Z7haRGImT64i0EXmD/JNCCcI1l4qReSWJCpcbKQ
         8/VYI31DstVps1zvgTYfCAHSLe//dW55B1cz/gGqmr6lXU3TuAzxIInKHKH6s4KyQQ69
         pm4GgIXqsY3Xx6NDaqJY+5ceimV3HPCCw7kI+r4GAcr21WhDcLUXdL4fVBBp0+TO3awN
         J1EluvEJIq/q3D2nXmwT9QkVLfgJaIJw8pksvZpb6kZejrflq+gQRzmxhq9SYjRuF4Mq
         PrxQ==
X-Forwarded-Encrypted: i=1; AKwUvByzpkgedQudWPVd/kSyzyltneVtgw+JSuLVCFiLRn8PgXQ2xwQ5jVJg0h3nDBqhut9/abGIjNpay++9Gh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZGo+SzO+2JUFea380QdoQsDnomSs0Vx9M6tbr34K9jMo+fAL6
	AH9MUY8UdRs7s4Ef9kOemfd4PyBQuKh//vq3ZCr334IwExj21yYiLuuYP69H2+yQq+tKEsZTYMa
	f0BZ3HVupB+58rJGHsL0MKTZ0ulLhoPE92o4GdUktL/DcifmmP/1Qazxffm+0ZqkKUA==
X-Gm-Gg: AYBFou2RiiHT3xvhFzlI4fUiiHHyoR0QpJr7zTq7hZQKnW8P8i6/8m0ALcWtgF+2SJQ
	pN9XMZJrF7zT/HbLgqqbJeRfFFvC1ZaOdmTQE7Y+qTmuBvZuRzpoFWwuMtPP/jEwhiWOQMjThpZ
	0PLgejDEnE8qieZPN3ry48XG/SL/f/iFDN2AwJkjMjtGMbiGjMTCQ9g+T7Zfw5A+OXGKSA9XYuy
	F8dBRHgppwDCh/YP4bqBs3Q5OJ7Qhhe6wXFLhdaId8kbxu5Le3nYPW/txPAHUdhKuiySBAvD/0z
	pLhmEDSv74C3JlhROyWR1vkJEaV+vda9FObmBKCPoaLD0slyiMi3m0nlJeOsfGr9scOTBiyonl6
	yofwdCD+dQ/EFXMCdJir9EWZBKKPd5dsvxBY=
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8750327b3.108.1790955165149;
        Fri, 02 Oct 2026 08:32:45 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d7:b0:8ab:41a5:63c with SMTP id 00721157ae682-8ae3b61c99emr8749997b3.108.1790955164570;
        Fri, 02 Oct 2026 08:32:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm22528436d6.19.2026.10.02.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:32:42 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:32:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Cc: Joel Stanley <jms@oss.tenstorrent.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update RISC-V Tenstorrent SoC entry
Message-ID: <ar_OmdW-3kWo55_A@redhat.com>
References: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Wed, Sep 30, 2026 at 10:09:36AM -0700, Drew Fustini (Tenstorrent) wrote:
> Add Anirudh Srinivasan as a maintainer. He wrote the Atlantis PRCM
> clock and reset controller drivers and their DT binding.
> 
> Switch my address to kernel.org, which I use for all my upstream
> work, and point T: at the kernel.org tree that the clk and dt pull
> requests are sent from.
> 
> Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

