Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674F41D223
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767725; cv=none; b=VozB0O+FjJ/yprhpgjqQuaesmUBwNKR7zYXjz2qdb/MJbnuvrBNMR/Feb1tCqCgTKrlofejf8cKyvFH4hmKyCUiJVc5cRwxMj8lwuX7SVcrEVvDTHTOPt27MKt6OPVjt0Y/k17iFefIWsFwJXbACEvB6tFqPhr9/jhxEiLErFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767725; c=relaxed/simple;
	bh=7GdhpKrgZ2WB4RU0gYhIS81qEJYA+jbVIyxXa68rOZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ddv8Vt5mtHcCNm1i/dvUarfOvXddA9u9fWUAUxum7DPVKp4EIcFoXii3Hrr3gRJpLsHk6PADdre2RvMu1dX8GCT17HazSj8+3lIqPB7DNF8OC4UPh/zHitvQ52R/kp9lgh8JIoXwmWMtx36/T1qh4h2+fsKRJ5v5Tv5aQYKa474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Dwve84e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i9NwL8uO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Dwve84e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i9NwL8uO"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788767716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GdhpKrgZ2WB4RU0gYhIS81qEJYA+jbVIyxXa68rOZY=;
	b=0Dwve84eEPMxBlBnhHCpf/WsTrg4Uzl5SCti+J7F7HsxU/HJZOXvn2FxmGQrms/xkLujKa
	DJW+MsrRLCwbuL37PRfmfFU22Uab/f4mgDX7FRSl8MxD4NfxAZ9DmQUCE84FKnhvvJjoR3
	FJTbDamWFQTtVgspeUm59HVWtxA2Xru9RVKbdVrj9VUVmTYUzwTWBPK6G0xAgp82LGANGx
	FgFDLn/6Mx7G32xgO5Plhg3TGbHi3goJZIbahLssF6S2F1Knxmx9V1jEQs7oT27CxtR2fM
	6Rkd+RFNFxXtcXmUh2I//nx5Ae1HXAcW2ZavEI+as6qwF09StAn5gA/UEV6nNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788767716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GdhpKrgZ2WB4RU0gYhIS81qEJYA+jbVIyxXa68rOZY=;
	b=i9NwL8uONjeXoYrJ62HsZB4Pel2xJyrbZDyxR1d+UQkfGyXTpLjkUaNaZzXy0VGTNa/KnB
	/Xmgg19hr2toKkBQ==
To: Alexandre =?utf-8?Q?Boissi=C3=A8re?=
 <edu.alexandre.boissiere@gmail.com>, pmladek@suse.com
Cc: linux-kernel@vger.kernel.org
Subject: Re: Question about desc_push_tail in Linux printk ringbuffer
In-Reply-To: <CAFiazsFb8TZUKp8oEx=4jkEHm9oLHn8M=c2ksBC1SbeF-zmM7g@mail.gmail.com>
References: <CAFiazsFb8TZUKp8oEx=4jkEHm9oLHn8M=c2ksBC1SbeF-zmM7g@mail.gmail.com>
Date: Mon, 07 Sep 2026 10:01:15 +0206
Message-ID: <874ig17axo.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On 2026-09-05, Alexandre Boissi=C3=A8re <edu.alexandre.boissiere@gmail.com>=
 wrote:
> I have recently been trying to understand how the Linux printk ring
> buffer works.
>
> However, despite it being heavily commented, I cannot understand the
> logic behind the condition in the desc_miss case at the beginning of
> the desc_push_tail method (lines 716-719 in commit b6cf8b3, lines
> 801-804 in the latest commit bf56987c).

We originally did not have this special case. Petr discovered the
need. You can read our dialogue when we realized we needed this.

https://lore.kernel.org/lkml/20190709090609.shx7j2mst7wlkbqm@pathway.suse.cz

It is the comments related to "two-wraps-old".

> From what the comment says, it is meant to guard against another
> writer currently reserving the descriptor. My understanding is that
> this can only happen if there are concurrent calls to desc_reserve.
>
> I have been trying to figure out a scenario that would make this
> condition evaluate to true, but to no avail.
>
> The difficulty I am facing is that desc_push_tail is called with the
> value of the current tail (or the new head one wrap backwards), so for
> this condition to hold, the ID of the desired descriptor would need to
> be two wraps behind the new head?
>
> However, given the way the ringbuffer works, and if there is another
> writer, it should either contain the value of the tail if the other
> writer has done the head CAS in desc_reserve but hasn't reached the
> state_var CAS before the return statement; or the value of the tail
> one wrap forward (which is equal to the new head) if the other writer
> has finished both CAS.
>
> None of these two cases yield a descriptor ID that is two wraps behind
> the new head, hence my inquiry about this topic.
>
> Is there a scenario that would make this condition evaluate to true
> that I am missing?

In Petr's follow-up message he goes through a scenario:

https://lore.kernel.org/lkml/20190709115814.5nykd6yroae7wmxw@pathway.suse.cz

Please follow-up with a question if it is still not clear.

John
