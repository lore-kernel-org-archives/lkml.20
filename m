Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957D81397
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787960402; cv=none; b=E/8DBZd2nn/POZ2ZLstGdrKBd/ihTd8W3zIK1PyrA6Mu8NGftNzmcErMY3E5GaRjI9sSmO2YSXNU/lLTYQLtdPX9hf5PduV64q/yCRUxLwPLaKw2pwkwxh4uN25IjJE1Mu8Hy5rfGo1flnVrI4f6D72xL/CzdfaUiF+Xr9T5rM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787960402; c=relaxed/simple;
	bh=bXR0bqSMlLFV90xAdFa40uxmYsZjgW309tZbJ//vDo8=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=QUwnAJDe7K5JMkDHhn1lGwe6QihcA9bERTSrx24Fqkq0hpffl7msPDT7R3oFgbnzYd+I10c1LeF1eOTtaHPPPXft9eqDH1qqW8AFpjWXKJE19YrxsyGSifHu8aXyS6EJVpD0k00vTRmuEI4C2U4xZVFopD7I3Ry+5yQVUFjORjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=B7YWZkkX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qLe7qu59; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="B7YWZkkX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qLe7qu59"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787960355; bh=fEj+v7KdN06tzExfX3wcd5h
	BMq6bWzkFtKx0nc4h4KU=; b=B7YWZkkX0p9IvrLU3ZU/+QQoSE5qI3MZAuknjZdwVchvdB3xaO
	PmqEkCeOz1dRL3xOhuo1CEqrddR+bCP2inNbs9LaIf1DV7d3SKYkL+V4W1ySm/orhMa+FNeqXnw
	XEpqhAkmQczd+btXZOQUzeN7Fvsy8Gn6q2j6fgsIjlQIRmS0ae/hZDRR1aqQ/+Oyc0v/FUGs2yJ
	tIhmRv63Ces/5b9P32a+1QWbv89pv1OillN6f0gn8bwnazFG+J1SfiiFq2PYsmQ+WXHK9bS7zwO
	9ESAWUcKn2L7nncHwf0bMQ0o3J0iWNOQVXrfIWKsc3lONv1ka+gP+y3cWA9mxSB2JPA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1787960355; bh=fEj+v7KdN06tzExfX3wcd5h
	BMq6bWzkFtKx0nc4h4KU=; b=qLe7qu59+s/0CKOCe/c8ScR4BoQ72e0nS5hVbmN/RcTZq/o+UX
	5KwvcIp/pcdeZdXSiQ/I/LkWeaEAaXfICCAw==;
Date: Sat, 29 Aug 2026 00:39:15 +0100
From: Bradley Morgan <brads@mainlining.org>
To: john.ogness@linutronix.de
CC: bigeasy@linutronix.de, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rostedt@goodmis.org,
 senozhatsky@chromium.org, tglx@kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
In-Reply-To: <20260828140218.232439-1-john.ogness@linutronix.de>
Message-ID: <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 28 August 2026 15:02:07 BST, John Ogness <john.ogness@linutronix.de>
wrote:
>Hi,
>
>This is v2 of a series to address some irq_work issues with nbcon.
>Initially motivated as a workaround for hardware-related regressions
>reported [0], it turns out that the workaround is actually a nice
>improvement for nbcon deferred printing in general.
>
>v1 is here [1].
>
>John Ogness
>
>The changes since v1:
>
>- Add a preceding patch to flush the irq_work on nbcon_free(). This
>  pre-existing issue was reported [2] by Sashiko while it was
>  reviewing v1.
>
>[0]
>https://lore.kernel.org/lkml/f3757a75-0ba1-4558-bf57-f19ab7e59a4c@nvidia.com
>[1]
>https://lore.kernel.org/lkml/20260827184750.203521-1-john.ogness@linutronix.de
>[2]
>https://sashiko.dev/#/patchset/20260827184750.203521-1-john.ogness%40linutronix.de
>
>John Ogness (2):
>  printk/nbcon: Flush nbcon_irq_work in nbcon_free()
>  printk/nbcon: Change nbcon_irq_work to IRQ_WORK_LAZY
>
> kernel/printk/nbcon.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>
>base-commit: ffe0486b139e45cd9c9ca2584f04a1910fe4f8a6
>
Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on Pixel 7 (ARM64)



--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
