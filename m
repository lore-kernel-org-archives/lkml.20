Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467DA50278B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744619; cv=none; b=sCehg0GI6B4kUYTkj4b/1kFSn6mbiCFgfOJL3VQD+yyE8K4o8XPOEj0cccMpKzET4G5WFS3FjDNQO96mLA6eTLgeSaH/3yDc9fGtcndjpowvIbDwsnIU9luS2kXEnpWHJzzzTrp7/NkV3qOSktrqeT7Q9stYzuGE3hNcYpnnl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744619; c=relaxed/simple;
	bh=jphqnC0BJPFoukGwzn5oIBT+VOOEUPId25SrqKFAyq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJQLLpYdHrBvikSwVN7VmIeTquc/K25bHBtKxLRKfrL/3Aq3YQA5bz25dB2bR60vhydIvZda0QMF7CZGZECVQqMpOmDvfVHJfe0LF/aZ12VzoR9/cSeXa9+HES2Uy0cpOfW1QBNTx+XWi0QWXC0ZcZwS6vtrq+yVg0ko7DPZOhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPC+T5cU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPC+T5cU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6269B1F000FF;
	Fri, 18 Sep 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789744617;
	bh=vWbnyU0SIgiw4rSTlOVLNiUE31FvcrcAMlwh1SgQDVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nPC+T5cUcjp6iaN/J40YL68Dl+5bJoR7Rw5WTThvM3jFy3nWIVshYKMj9XXJUqoMR
	 MXf0sRUt0t6r/OasTbxsgTRjKq64QY0fS1ztlPaqSxh2ixrSQqUrGvnENhOAmVykSR
	 x8OPoMNZRm8AXX90K/4c+YDX25l3dHNUgeWTUS+utU+HdH7HkwiGU5jF67oOyjn4q1
	 JNP84gLuk7y6QcUhGZ1O+YldtrsjMtj0yG6zUOzDdFHweN55vuyxkzEVK4wconYMUk
	 EueTij/SfG+UF0T/ieaLWhBccNa9QSJ3QrGg/iwjWZv8Dxe4F2ITZvxbCzEVBv+O/W
	 f4DYaK5f8Lt/A==
Date: Fri, 18 Sep 2026 09:16:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-multipath: fix underflow in ANA log bounds checks
Message-ID: <aq1V5znTxOjqRGMX@kbusch-mbp>
References: <20260915021956.3142320-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915021956.3142320-1-4ncienth@gmail.com>

On Tue, Sep 15, 2026 at 11:19:56AM +0900, Daehyeon Ko wrote:
> The number of ANA groups advertised through Identify Controller sizes the
> ANA log buffer. The ANA log header and group descriptors independently
> supply the number of groups and namespace IDs to parse.
> 
> Both bounds checks subtract an untrusted object size from ana_log_size
> before comparing the current offset. If the object is larger than the
> buffer, the size_t subtraction underflows and lets the parser read beyond
> ana_log_buf.
> 
> Check the current offset before the first subtraction and compare each
> object size with the remaining buffer instead. This rejects inconsistent
> ANA data before dereferencing a truncated group descriptor or walking an
> oversized namespace ID array.

Thanks, applied to nvme-7.3.
