Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340652;
	b=La/ECvHL77Bz/7NKrOqZlyCXIKXD5AYnmkNmqmTiDD/nQ8nHRLwDH3OT1hTQRUgSTYa1
	 dJKzy7jXVcEPV1XMJZ52Iyn+jvYeUHRYW7dIg5wiAN6Y6ZwmHhIRNnK//ZGpN/BgllazS
	 V6/MSVAlv7owirxwQxIQGWGILF5aOec7StvPXWAbbDo42FfMii87KDlr0S86Q1iswxC0z
	 nmja04ONdzFatETndS36c7fSQ9La982mz5GpR0HlrvDumMNsHTIaSSjtEr08ekGZJMOrF
	 jJLPjpkxieUefhPFNJ4iPY2TSiO1oYbvkXLxciETSFmU3QijsVzf9urq8UaS+D50L7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340652;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eMxOXDCp+lLHimw0Ajvi6bdsS4XBDctUyG1YUtNMsak=;
	b=r6o5xj4erciTsI9uf7NqMCepq4k9zL20MD55j9LpbB+jXOZ9RcmdOkkGUWuRlh+GnmK2
	 xT4Wtwn5nUEkkn4+9+FdVcPfG0vHH1Lb7tqv6qo//XWGAnKms+vyraIAqWAV3K9QR+ChY
	 eK3qEiZn+8CS9AhLkcB6GSHtARsjYj0CNAzLNAFiWXoEk/iG03CFsX2Bfm1cjGpyv7eFF
	 sWL2tWmEkKzouDiZ1owGNhkgXl+LHD6q8EeXKDR1tWBCe/zMOwS9O62JyA+IkC8W9w+Jz
	 7y46PR1l+YiZGy5BLiKfOhloWlkgkpJQrzLdQY/7D3dNhTJDCX4MXaLJNaLUVxuQbow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=pimCZgrm;
	arc=none smtp.remote-ip=202.108.3.162
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90702606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90702606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=pimCZgrm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793340649;
	bh=eMxOXDCp+lLHimw0Ajvi6bdsS4XBDctUyG1YUtNMsak=;
	h=From:Subject:Date:Message-ID;
	b=pimCZgrmnSAq4X4zHwmGbeg0TQBKyAWzrzBm7c0Wv+V0PmESo90ZFNbhfGyoFNcx8
	 WETgK3dMuQkNHI1uP6lczctlmL57g75/z479y0FvksdVbGKb+22jJqrZahJGDczlFC
	 Ox1zm1ObaSdE0cw7AlZcSFcBklRqJZAqkcy8iG00=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.0.223])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE434DC000034D4; Fri, 30 Oct 2026 14:10:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8079216291752
X-SMAIL-UIID: 10D141D9B4E846BC8D24E5D11E86C7F7-20261030-141040-1
From: Hillf Danton <hdanton@sina.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org
Subject: Re: [PATCH v5] KEYS: key_garbage_collector(): process in chunks
Date: Fri, 30 Oct 2026 14:10:06 +0800
Message-ID: <20261030061030.233-1-hdanton@sina.com>
In-Reply-To: <auPjLi6xocFw7r-k@kernel.org>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 02:22:06 +0200 Jarkko Sakkinen wrote:
> On Fri, Oct 30, 2026 at 02:17:31AM +0200, Jarkko Sakkinen wrote:
> > On Fri, Oct 30, 2026 at 07:41:48AM +0800, Hillf Danton wrote:
> > > On Thu, 29 Oct 2026 19:29:17 +0200 Jarkko Sakkinen wrote:
> > > > key_garbage_collector() has a design that is not resistant enough for
> > > > workqueue lockups. The duration scales up relative to the number of items
> > > > in the serial tree, which causes a reoccuring theme of being guilty of
> > > > causing workqueue lockups.
> > > >
> > > Given cond_resched() the gc work is not a cpu hog, and given concurrency
> > > workqueue can get individual cpu highly overloaded in short time, so what
> > > you delivered is a half backed croissant, HBC, as you failed to make it
> > > clear why lockup occurs when the number of gc items rockets up.
> > 
> > Please, read:
> > 
> > 1. Documentation/process/code-of-conduct-interpretation.rst
> > 2. Documentation/process/code-of-conduct.rst
> 
> And: I'd suggest to do some self-reflection and not use LKML for
> trolling. There's 4chan, Reddit and other more appriate forums for
> doing that.
> 
Can you answer the simple question, why is your patch correct for curing
the root cause of the workqueue lockup? Because it has nothing to do with
trolling.
