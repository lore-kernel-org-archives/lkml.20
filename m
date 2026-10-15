Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F84B3EC837
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043708; cv=none; b=QJAzN1102L/WtR8o45MFz9DkyQpE3W00Mc65WMInAA2Nf3Vna+M+crUeh8pN76TvEsxJak234qaeTnnVtujYtEaOeeJ2m6jy/5sDWhrOMs162gtvKEpaZVn6/j57eGiT+W065qAD9nJgPUL0GvxQFZShqkNXT7CElPPaYQmVkMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043708; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdOCkxmgfXRh5/Pq9RtMQTKg5Hly1cTotqRgru+W1FjfCy7r+mQ2ygdh3eto6GBIj3AaQmNw4MA+ALyW+LvZGCwaafUEg59YOubHBSTyg3UGY0nn/CUQmoGjeIXNn/Zs1wvZgYRgLKpbCg7YRxEh7/a+pis814/GLNtybIE5ooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Nk9W4JX9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Nk9W4JX9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=Nk9W4JX9kTBAJny2IU8rCZ8gNH
	FOeUMSu5HAHkQtOHWYoYTbjeW+KbAvHpb7jdRirccZx2U8W9igcqXiNW8aeHdxC401s8YaG0i2Q3o
	kLYjTHaRC1hfQemim1FSMCMduorXFnlr96So3nFI0ILQGXk9NXMtHNQisXBo/3bhgp2Tn9GXe30ua
	j4WHEA1IuecHXK4+NQtDV3Oi0Sv8ikJFhFuMcXaUnhsJjxXGfZtGFZBoc75e8sgsetpRmuTDc+eQE
	T1oqZsXfNsoG7YTXxjFgXUxsLZzWZufB20T5knf8/hApVYcJ8RLFnk5RhBh9nRTAtEZ7swb/Fjg3l
	FSvsoD+A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQh-0000000Gtdu-2NJa;
	Thu, 15 Oct 2026 05:55:03 +0000
Date: Wed, 14 Oct 2026 22:55:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dennis Chen <dechen@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>,
	x86@kernel.org, Christoph Hellwig <hch@infradead.org>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] lkdtm: Make UNSET_SMEP built-in-only and unexport
 native_write_cr4()
Message-ID: <atBqt5-vHE0O47E0@infradead.org>
References: <20261014175859.30863-1-dechen@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014175859.30863-1-dechen@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

