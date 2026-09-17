Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8F34A4857
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681063; cv=none; b=Sxq2HCCQnx5V3MnZM4Vk3l5Mdm4raeuIS041WtsyLXWPwPWHpWvMhg41VDdelZsR9FolLT55HU+PzswRUMjeqiFgGuz0hC4vY3qJzgTWophrrL4DIHKOhFrXP1JKKi/+Y0ZMnLRA9zuvD8hcCRTCS6xmC24r/AGjUQ58s3mi1z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681063; c=relaxed/simple;
	bh=sH4Q7Iw5YnveDNiquvLz1EhMbIA/QOJ0HDEq62MmxxY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Ohuv7cbwkcmWp01i57z95IGsH1CAiioUFbkkBp3fKVHJGUx2r4+Jrs/bHohxKBiQNLvmoMgkgR1lqJcYvv3ybRhGsNRz8nFs+5odB0HXfDNujKikHmFOgRKpFl0nxkzn9AaIAQQH1HckLYBz54JIRww1bbCREF8QWhhf+gYWQ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nPZQh5CN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nPZQh5CN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5851F000FF;
	Thu, 17 Sep 2026 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789681062;
	bh=9od6YZgHE1EFRuh97Ngl/oK4VeeKcRGLduLjaJ5FsL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nPZQh5CNy3BhIzqYDyFVJ4z+kxA1DnJoPD+paFsiHwVU3i2F/gFrI/sO1cT1R3NLN
	 EoJzEX0zdpCr7YZ6yVVnkwWxQpjXfe7nzvN3JXqSaUh0JqE3a1PawT/ytytKz3648x
	 dSmnsjLmrXoM3Ou8kRHxF1mbGUTq4May8upgtvaE=
Date: Thu, 17 Sep 2026 14:37:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kstrtox: delete saturation in case of overflow
Message-Id: <20260917143741.7aca97b2029c23d4124f5ea2@linux-foundation.org>
In-Reply-To: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
References: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 19:17:07 +0300 Alexey Dobriyan <adobriyan@gmail.com> wrote:

> >From 161367fd1e8b41e938274923bbb3d26de69f7a7e Mon Sep 17 00:00:00 2001
> From: Alexey Dobriyan <adobriyan@gmail.com>
> Date: Thu, 17 Sep 2026 18:49:18 +0300
> Subject: [PATCH 1/1] kstrtox: delete saturation in case of overflow
> 
> Partially revert
> 
> 	commit 6e30111dbb4075e3c26c230417b32bc4a1c66831
> 	lib: fix _parse_integer_limit() to handle overflow
> 
> Originally, kstrto* was written in a way to keep simple_strto*()
> functions as is, so that they continue to return incorrect result
> if integer overflow occurs.
> 
> Saturation doesn't do anything useful, it just creates second incorrect
> value and potentially breaks simple_strto*() users.
> 
> Caller can decide to saturate itself anyway.
> 
> Move saturation to memparse() from where the idea came from.

I don't know what this patch does :(

Can we define/explain "saturation"?

Should we be updating lib/tests/cmdline_kunit.c when altering memparse?

