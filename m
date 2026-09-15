Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838104CE690;
	Tue, 15 Sep 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499431; cv=none; b=BB5Udm9vF3m522421FFy65vc3erOhi4lZQgOQ5WrGu//fafnYHztvCllXJbDwkc8psWPxzNRvv0wlagAaAxWet82NuyvZVAf4AvQKqAN+jbF8vFwWRjuScL+8E6EfXGPV9sgSkDAQ5D9q3Q1ow6R2vinkMs/pv0HgAj5eQCsxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499431; c=relaxed/simple;
	bh=QXPF+LWACvBR0a+zgwCS16Pxa2nXVYmxwBKbI0jFp9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X4gnN9fo3XUK+f9HA6GqxrWmqRwWHTYUT4vYzVdn47G7kYL2oGhkHDp8yp0ctCtEopiniLfojRjbahrexbe0OhW9RTo703LReb25HOzUJXqBhjLr8vOPGvwOda7/Ad1cyM1LgBCraV2etD2Z3PtvYIHTClTiSvpfdk3W6o1EV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i7d1hEWH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i7d1hEWH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D622F4090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789499426; bh=9KuEiuYGPagJlZgo8YJa5ZXBSRDh56B4CM4Kt4acBWQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i7d1hEWH5c32DIQ3GLYw0DrqbotuUZ83K8ZRORxHemoPL6T7Oi0b6XNKgSV4PpAy9
	 12PvHYtoWKCtU1eZBRGGTEcG0hz/e3HG6Flaee6HTy6njpfstb2Xj02EV/MU8kj6gL
	 /P5AXJ3FpNVt4Xiq0GA1bz9bv1KC9V/OpxpBmmeZcySbVyuuQYCsZxHkM0+A58rsC6
	 4tlUcKmssI6mNBTV7pgfwjBYbM6mrjhlJ35UhDCETnP1ozLzuOYFtoizdtADwjzNDM
	 Agapol7fPGEV1jb6h7sH8T1kfX/fxhapRZTSOyU0gHHxPwnEt6tr7Si3dUA5dWjLRz
	 q4I9ceXPaMkLQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D622F4090B;
	Tue, 15 Sep 2026 19:10:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Thorsten Leemhuis
 <linux@leemhuis.info>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] docs: verify/bisect: fix typos, formatting and
 punctuation
In-Reply-To: <20260909134135.1358766-2-manuelebnerli@mailbox.org>
References: <20260909134135.1358766-2-manuelebnerli@mailbox.org>
Date: Tue, 15 Sep 2026 13:10:24 -0600
Message-ID: <87wlsm8h5r.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Fix a few typos, formatting and some grammar issues.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
> [v5]
>  - fix changelog
>
> [v4]
>  https://lore.kernel.org/all/20260904114606.756700-3-manuelebnerli@mailbox.org/
>  - remove 'Reviewed-by: Randy Dunlap'
>
> [v3]
>  https://lore.kernel.org/all/20260903154336.732305-3-manuelebnerli@mailbox.org/
>  + incorporate Thorsten's suggestions
>
> [v2]
>  https://lore.kernel.org/all/20260902115121.687986-2-manuelebnerli@mailbox.org/
>  + one more 'your' -> 'you'
>  + 'it'
>  + incorporate Randy's suggestions
>     https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
>  + Reviewed-by: Randy Dunlap (added by mistake)
>
> [v1]
>  https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli@mailbox.org/
> ---
>  .../verify-bugs-and-bisect-regressions.rst    | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

jon
