Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA62D473C83
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969607; cv=none; b=FHBREU3Zqj4JWwWnlWueQNEU4Hdw5YdLbxc4kUwDDv15ECut2Z4HjK5yJ0P0VboVTZExDUj450ulFs3IVF7DeY5abkY/3/8GfiwXwqZM44DHTjX9gn9p7euwUTcqC1AjBj8vEqf/US62EUpFj/+C/HSzWIjm5CuEkQfx3IlsD+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969607; c=relaxed/simple;
	bh=K/ZPEoEYoNG4vLkx89gLv8QzxGzlJNLqhFKjvYKb7Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCtUYsxkb9Mc9ZmJS6uMHrJldxEPZM6/t1mQrfOQqe5Wus4Iq9FLqwOLVMXdKUfp0t1BF/qHMcqdiRGXxc89lM083NLvzWVuKlCwQm4OrN7/qpoY1ElZkVwQXUPaA7G+V3ZEHDqYEDSioV7nTT9vQi/Tn6aZs7HrCf1FETBmzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=nrYPJ2+q; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="nrYPJ2+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sa/wXQ3J4sMRE9LoQMNp7noLXyScY+98MWEO9Qi8BGk=; b=nrYPJ2+q9AAWOgXxsnLFT3AH7b
	ey2nBE9yf5sa+0cq0kYKHHlF8IKPYy8+a4xovzrhM3xVg4eC5Viath+wwntZz/sbFEWkTzAf2i5ha
	QtHvGLQILSY6SRn1ZNG+zhQWg50R4xHDAeLc7oo6V5lqG22tjqDhtpckrVrAohC/YpfHFYvN2ZziX
	lhyqpIvSxzhVaV6u38V89wL0K5HcaTspf5Rmex68GBk0pxZaiub/7lXENXMSNoNFqR+8Xqy9Mjchk
	AXZAWCDuBzeJlkNtXBjlOgyVOO0t623xstsQ+JI+NJ+pqwtDZj7ee6EBZBm+YR36utkd+uj57SsnW
	As1nztgw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xGv9W-004Ima-0C;
	Wed, 14 Oct 2026 09:20:02 +0000
Date: Wed, 14 Oct 2026 02:19:57 -0700
From: Breno Leitao <leitao@debian.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	linux-kernel@vger.kernel.org, syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] workqueue: annotate the lockless nr_running increment
 racing with need_more_worker()
Message-ID: <as9JD--_aa9nsfdR@gmail.com>
References: <20261013112905.9673-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013112905.9673-1-ngocthang2710.1999@gmail.com>
X-Debian-User: leitao

On Tue, Oct 13, 2026 at 06:29:05PM +0700, Nguyen Ngoc Thang wrote:
>  static bool need_more_worker(struct worker_pool *pool)
>  {
> -	return !list_empty(&pool->worklist) && !pool->nr_running;
> +	/* Racy against the lockless increment, see @nr_running. */
> +	return !list_empty(&pool->worklist) && !data_race(pool->nr_running);

Isn't it better to annotate the nr_running field in the structure, rather than
at reading time?
