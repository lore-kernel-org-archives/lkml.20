Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261B35A39F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196187; cv=none; b=ewIGViogUF+SnbhS5MZLYBRNiaVuCxvrxzV0Ni+6+8XWegsTxAIkjOcPbKcHGznYX1ICiXdkFCapEuIFUwCXSe88xv3lxsYtc4d+OmC48Zk0uWyyqDEhnRktBHKJ/jOcUoe3waMHu6rKD+PQ9ynKTQd+71UW6bl7mZ43s3xBt5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196187; c=relaxed/simple;
	bh=AlpzePPV9+6z39ry0lB5XfFqxLPzpfEHJT/XGwJwcXU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tqYzNtxudqB2BPCDxD1J2pIppQvnB/2yvWFqgEfAJbDMUoA2rVVrvPgTdmLscPs8s/9jwxEnBB1nGU3vyyOsFvmqqn9zRpnTZbkGJqc7mUS4pBrP/Fatb141EpRRaIDpZRpICRZ7bi00QI6C9j56jYFvDGCvhj6I9W8+AArcf7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=03JWdFRt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="03JWdFRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131FF1F000E9;
	Mon, 31 Aug 2026 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788196185;
	bh=qJesAYSTVzpoXg/9Zj9W4p7RBJ2PVwQ/TQe4n2On7M0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=03JWdFRtvhR6VDV6l0PUGA1DVunpqddI6VSWXI7dNneFUwRvZ3V6Dx7U6aGRkK3M7
	 PLcfwDkv+py26b0n8Lj5Y0GA2w1/IcEx6iHOlg7lrm7IlsnrZ1AEovAIcVX0coIofm
	 Wj8rKpOXWwJABIA1jG+/4VHCfqVr+8y0MsMXWmI8=
Date: Mon, 31 Aug 2026 10:09:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Taha Sezer <tahasezer.is@gmail.com>, david@kernel.org,
 vbabka@kernel.org, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: vmpressure: scale window size based on machine
 memory
Message-Id: <20260831100944.ccb2a8fe3b036ff7a258820a@linux-foundation.org>
In-Reply-To: <apV_VwQx-7qXks_a@lucifer>
References: <20260831130316.448-1-tahasezer.is@gmail.com>
	<apV_VwQx-7qXks_a@lucifer>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 14:27:32 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

>  I do have to ask if you're using an LLM here?

If so, it isn't a very good one ;)

I asked Gemini to write a reproducer for the Sashiko report
(https://sashiko.dev/#/patchset/20260831130316.448-1-tahasezer.is@gmail.com)
and Gemini told me

  : You spotted a severe mathematical regression in that commit.  Your
  : analysis is entirely correct: the patch actually shrinks the
  : vmpressure window size for almost every machine on Earth (up to 8 TB
  : of RAM), doing the exact opposite of its stated goal.
  : [much more]

