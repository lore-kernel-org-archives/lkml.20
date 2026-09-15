Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D347FB0E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468046; cv=none; b=rsOaSAW7XkxgrFDH/lNE95xgLGrYiul58ZDjPExcSz7eyVsCxi8wGQLs+buBkTYIzZnL7Tj0cFXiY/rtYC2WiKGUCpj9ykIHQmXNaXhHDWIQ8zLbZpBIY7LLCKe3u9WmZfUc3gu/uDZg2RGNdGAglKwEyCkC9IofkfA7dnghYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468046; c=relaxed/simple;
	bh=YSewos3xtxdk+prNKXaxelZ75btlblUdxtzeQBE8jXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDFEDDKp42DNOAAGhYGTsYMO1+sbrhFX8I6lGyhQk8eA36i1CPa5B+e3fQwyFQJlQmSWHdJQi9yJmwLlqFqtrApuo7Ci3w/wfSdmrINaKuap+p/iaOlgMP008lMIuMzoy+vioMT8MuCjop725THXqOpl8BgDHT/8bXqxZeV66iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GMdzIQ7c; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GMdzIQ7c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yqxuhklxm3wMqMiqJjzJAQ6bz6QwRVOq1Bpdvcb5rkk=; b=GMdzIQ7cB+pUr6XJoRX+kn4BpR
	QAa7Xq1deVr2ugxKOPxscTo4Wmd/PR/P2YT3jAlWuGg6a75wtQN8ZiSouRICsqiRSTtBSV5sWtnZ6
	82ZmYTPfRXiglaSM2JhFU1VL0+QdKbEr5RZW9orpMY0hCOacKqkSiZ5ug2czJ3/mP04IGhwsIae6y
	IEviqdBDUQEy/DjyUQ0weYRTzqCaPeBXCcbepvIv7Hu7cdBB7IC7ZAi432ureBaDbEly5l0Pz8O8q
	iY2PlxNWjJkZPzeET2U1fvzM8VqKADKsvCnOADLjhmqpWQPJdAaEGBlRLjGuAK+q/7fguIChqZ5q6
	0edPlNHg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6QNg-004KHd-0x;
	Tue, 15 Sep 2026 10:27:16 +0000
Date: Tue, 15 Sep 2026 03:27:10 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Message-ID: <aqkdWl7NemLu_iim@gmail.com>
References: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
 <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
 <aqkUU-kSTOz8NntH@gmail.com>
 <aqkapYE-xtS91laq@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkapYE-xtS91laq@J2N7QTR9R3>
X-Debian-User: leitao

On Tue, Sep 15, 2026 at 11:15:01AM +0100, Mark Rutland wrote:
> On Tue, Sep 15, 2026 at 02:50:27AM -0700, Breno Leitao wrote:
> > On Tue, Sep 15, 2026 at 09:39:24AM +0100, Mark Rutland wrote:
> >
> > I've also dropped few other lines, but kept the benchmark values I've
> > collected. Does this look better now?
> 
> Yep, that looks good to me, with one minor nit below.
> 
> With that fixed up, this all looks good. I assume you'll send a v2.
> 
> > Author: Breno Leitao <leitao@debian.org>
> > Date:   Fri Sep 11 02:57:34 2026 -0700
> > 
> >     arm64/sve: Don't zero the SVE state buffer when the SVE state is live
> > 
> >     Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> >     not necessary in the common case, and avoiding the zeroing has a
> >     measurable impact on some benchmarks.
> > 
> >     In the common case where the task is not preempted and its state is not
> >     altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> >     is clear. In such cases, only the live register values matter, and the
> >     in-memory copy is stale regardless of whether it is saved in
> >     FP_STATE_FPSIMD format or FP_STATE_SVE format.
> > 
> >     This is worth doing because the SVE state is discarded on syscall entry,
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> That should say something like "It is worth skipping the zeroing
> because". We deleted the line saying that skipping the zeroing was safe,
> and so it's not clear what "this" is referring to.

Ack, thanks for the feedback. I will send a v2 shortly.

--breno
