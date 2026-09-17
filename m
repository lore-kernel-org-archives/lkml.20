Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22243B4E87
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661801; cv=none; b=O+XSfGQ8ASfmvtiLHxLml+QyJ0HhtVlzrAy/K3dJBXwErd1tfDppFVL33EA4FbiRsSly9XtMFXbqgPVKXrK4NXl3b/Y42jqQxMcYQr6X8TbfippnYOpTIYLNqJM5xMslaV2fMCJPNwKg8gugZnfDsBsGKywwanZYKQ55Y4+Mql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661801; c=relaxed/simple;
	bh=StYVoZs+P0v4KPPvSmD7KOKFeOaNsjFoLZPXD/nyYCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sk2rMoGJsIz0bxJKgErfCz7g5GD2FGzNC9qgfyWJsrJTmw6Oih7hgTN/6OLq/yYoDq8hIyzZUid4YkPgAXJ1CYqQF7k8zaekgJHTwA+SEgeuMD5kzCy9oPkoYPs9hd0a1AQ8LIUJ3KY+N4UQm3cJfYfRHdWXBxDcRKeSfCirVOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HNDubItW; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HNDubItW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=JS
	WPOvHKx5syjq4OmyakYm9eVQVy3+7T4Rf2oT9mLR4=; b=HNDubItW7tRksSFNlQ
	S6jT+54yrA2od1zURyiOlnCdG9EQBAJdawYKug5iAAy5duj6bA11jl6HHoXX46oB
	CSb5vxkodlG1MbRZ9pORAMYQ/IfQCm2zK3ErwRn08VKIBaMmLSYOadyFFOutBWmZ
	XUWM4AC4hiWEVpgir0AgqyUN4=
Received: from deepin (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPA id Ms8vCgDnZ9MSEqxqOJccAA--.52591S2;
	Fri, 18 Sep 2026 00:15:15 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jordan R Abrahams-Whitehead <ajordanr@google.com>,
	Marco Elver <elver@google.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	Edward Cree <ecree@solarflare.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: Re: [PATCH v2 1/2] list: add missing empty list check to list_cut_before()
Date: Fri, 18 Sep 2026 00:14:56 +0800
Message-ID: <20260917161456.9181-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aqwFiYq_SjheX3T4@ashevche-desk.local>
References: <aqwFiYq_SjheX3T4@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnZ9MSEqxqOJccAA--.52591S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrWUXrWkAr1Utw4DKryUKFg_yoW8GryfpF
	y5tr4FqF1DJrnaqr1xC3Wjk3yF9as7Jry0yr95CrykAwn8WrWjqFyftF4fZF9Ivryku3y7
	XanFgrWqyayDZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNxNOD2qsEhO0pQAA3z

On Thu, 17 Sep 2026 18:21:45 +0300, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> The kernel-doc specifically says:
> 
>   'You should pass in @entry an element you know is on @head.'
> 
> Do you have a real life example?

No, I do not have a real life example.  It was based on code
analysis only.

> The room of the lines for the body of the commit message is ~72
> characters and not 56.

Noted, I will keep that in mind for future patches.

> What makes it different to the similar cases in list_splice(), for
> example?

list_splice() has an empty-list check too, on its source list:

	if (!list_empty(list))
		__list_splice(list, head, head->next);

list_cut_position() does the same for its source list:

	if (list_empty(head))
		return;

But list_cut_position() has the same kernel-doc wording:

  'You should pass on @entry an element you know is on @head.'

and still returns early for an empty head.

So list_cut_position() handles an empty head before doing any pointer
updates, even though the kernel-doc contract only requires @entry to
be on @head.  My patch makes list_cut_before() do the same.

I agree this is a defensive change, not a bug fix.  If the consensus
is to rely strictly on the caller contract, I will drop this series.

For list_cut_before() specifically, making it match list_cut_position()
seemed reasonable.

Thanks,
Ziran Zhang

