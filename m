Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B398C2EEE67;
	Mon, 21 Sep 2026 05:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969640; cv=none; b=WZc4hTLcLEyxeYiQinjGhLdgpN7WrnqOPDqp0lLIkAMLVr5wtjmmHABdE9HHhoBYJJT9xoRk8mvDsU6ziP8CJSo+2h5tbEEUd2J3ap0t3Yf07ND72eshlSqf0fS529CiicXwzVWPXTqgcDZAcMzTW3GrlBx6Gb5rekUBU93+/hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969640; c=relaxed/simple;
	bh=V/Vug2RlqixkFaXTypOw+VY47ihsootWxD/0hfxVxG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h/IcbpuPa9Fg6RbWxkViVgxWobKXLfcjssY+pbJyUkA/6aKfbf2ZZeyc3bS7Zt0AcYqW6J253qBom1gBLvc0WEi2NdfznONPeOjb7c6KWSLBh7hKEaE3j2nalZvpZBAyqvOsUnWbYBlvlz9mKb/wnDhf9Su6lxn9trI7k0MxbiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OhVQZOe9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OhVQZOe9"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 523F24090F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789969632; bh=YOCb5PDIZfjavIu8Tn/O03ibiuTI3hY3aKhvJg4NzvM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OhVQZOe9NlvwmNG5si3VbkPxTHjUQ2XGFOyi55xRKmhKsOfCFXdYlqwemAKdsPtwl
	 K1HN6AVKn/k8/QyR9KZqWBH/IpQzUPyQGQumHm1OXm98som5weK4YEYxE8f++s66IN
	 EdofZEAtLMgG/hM9goU43T0lwFPXuScwuaLLtDZKSV/sTqij55u5lxsjTVnqM2usFF
	 JA2AIyQOuqLX1WUKfRyqfqZDta1QCLOLhW/4PapV+paBgiyeGiHtEWrYqAuy9jokhG
	 vosZp4cWrMRytHXoWrZy2L8RZf/HAwC7jlMbtoWkMWLe5qHv4KsFUT/VGvdZijCgla
	 d9+Nx+MwZz68g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 523F24090F;
	Mon, 21 Sep 2026 05:47:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Osman Ahmadzai <osmanahmadxai@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] README: add a reST version with clickable documentation
 links
In-Reply-To: <20260921050038.76985-1-osmanahmadxai@gmail.com>
References: <20260921050038.76985-1-osmanahmadxai@gmail.com>
Date: Sun, 20 Sep 2026 23:47:08 -0600
Message-ID: <87o6dryx43.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Osman Ahmadzai <osmanahmadxai@gmail.com> writes:

> The README points at some sixty files in the tree, but it has no
> extension, so it shows up as plain text and none of those paths can be
> followed.  You have to go and find each one by hand.
>
> Add README.rst with the same content, wrapping each path in an anonymous
> reST reference.  The link text is the path itself, so the file reads the
> same as it does now.  Anonymous because a handful of the paths are listed
> twice and named targets would collide.
>
> README itself is left alone - checkpatch.pl and get_maintainer.pl both
> look for a file called README to find the top of the tree, and the
> Makefile points at it too, so renaming would mean touching all three.
>
> Signed-off-by: Osman Ahmadzai <osmanahmadxai@gmail.com>

Creating a second file with duplicated content isn't really going to
help...they'll be out of sync within one release cycle.  Better to have
a single file and use a symlink (or else to simply rename it and fix the
other files as well).  Or, perhaps best yet, see if it can be integrated
with Documentation/index.rst.

Thanks,

jon
