Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80322E229F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048784; cv=none; b=iIjMH5SeLxDCMQU1T585mXiQea0q+TwwpC9LDoHXLZHW9aj+QFxFLungrx06UogPsRhR49Pj1kP1MdVpSlHTiYBky/4jv611AQDL7hAcY7qcLNFg3B455AVTH3K3V0GE50uDQkUbDdo2e7edRQ5JN0KeAxY0ScSDGgYk7EkPJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048784; c=relaxed/simple;
	bh=HuE3ok7xTcaS8YUOUOEI76GUmNHy3ylkokS+ebCgq5s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=luUO2OiXj7pJhOzep4boiaz4kpCdz38xPpcZ9tvCrkqhriQ0Q7Fc0LjqKLCvP876/C8G0J4VYuZ0E8KGKUxv3x/vFWlLcpwr2l1HUSkkiBTplZofqfTeQxWVyZQ5GH7blZnavj5XmUqOlopPZvUV1wg1O0JKVJtqmBfcsAlTMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QKsfj2J6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QKsfj2J6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC041F000FF;
	Tue, 22 Sep 2026 03:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790048782;
	bh=zZv0n6s8W4RcQuBAt0aC0jgduTzFU5fp+QZdqfQumEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QKsfj2J6ILwU9ERjb2WSsLzQ+4ZA89gphCmxkl3jxiHXMBm7NuoMVUVgYKnsN2ywU
	 Gkgh91/LRroaj3w2+ok/XBcq5qcYhcCA3il0AhkkdSPV/f3rEiy+6pIrGuEE+K68xX
	 MZbl0T5T9gWqm9j4MwityESBQo0HAlVb7H4P1PIk=
Date: Mon, 21 Sep 2026 20:46:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] alloc_tag: fix a leak and a deadlock around
 shutdown_mem_profiling()
Message-Id: <20260921204621.6724aba72798c03e19c235fb@linux-foundation.org>
In-Reply-To: <CAJuCfpEUYztqobQDHt9GwJZOcn5JrOs49a+8AVpu_ySUG_KkyQ@mail.gmail.com>
References: <20260817062726.106511-1-hao.ge@linux.dev>
	<20260826203914.347c42aa00081ee9e0eb858a@linux-foundation.org>
	<afa606df-3d5b-47c2-9972-f3e0c2e13c12@linux.dev>
	<af33dfe1-04ef-4bfd-8c79-0593b24c6bdb@linux.dev>
	<CAJuCfpEUYztqobQDHt9GwJZOcn5JrOs49a+8AVpu_ySUG_KkyQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 07:36:27 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> On Mon, Sep 14, 2026 at 7:49 PM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Suren and Andrew
> >
> >
> > Update the status of this issue surfaced by Sashiko.
> >
> >
> > round of review.
> >
> > Please kindly help review the folded V10 version.
> 
> Hi Hao,
> Sorry for not reviewing earlier version of your patchset and thank you
> for pursuing this. I saw your v10 submission and will start reviewing
> it. Due to time limitations, completing the review might take me a
> couple of days.

As I understand it, this 2-patch series "alloc_tag: fix a leak and a
deadlock around shutdown_mem_profiling()" will be replaced by the
series "alloc_tag and module codetag section fixes" when that's ready.

So I'll drop this series from mm.git.
