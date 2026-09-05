Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665412C237C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788645905; cv=none; b=ApDy+DOZYAK4EQcATDIzWi5/olEzbwy488XbofKL+922LkQagU82mrwJtHZzx8g70LycgTK3/kkfNEPHIF8+9QNsietv/kwnvgoodMogY1AxKXBVPSScc/f7++dKWyKuET/gajb53+ubQeqw6tjNkszq/AG52dSMIfcDM/Ui+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788645905; c=relaxed/simple;
	bh=1QkzZC3o3dS5v1Ze6QqWba+5Ot4Nt9DNDg10lf/riv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pXU3xShxPvs4fKqyM508e1TB14rbVm7n+1AS7fv5FrO1gfa5Pb7ozAB+b8yPkAXzIEzov9HftEquU1dQTKwedPkk/eWCGFtsD7XnnmhqYm/hsNc9pFRaB7iDDWBdjVQ5FC1Ozmb15rAT45IqegXDssi58nZZXdcmbqUwYD6d8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ltWPEiJs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WXxGVDwZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ltWPEiJs";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WXxGVDwZ"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788645901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QkzZC3o3dS5v1Ze6QqWba+5Ot4Nt9DNDg10lf/riv4=;
	b=ltWPEiJs0U3bDr+wwO68beBhcE2hqAurm6vdyjoB5kNLiti2MEY6/3dkoc0kGVbSIWwfGl
	X0yp6g8K2WVILQ43AYr4tM1EMkHQt+VSILV+VYq4fa8RinJylSfTUU/w3Iu7CfyhkTA4MS
	ObNv9VknDY7jOdMI36NoXgIW4OngQXfwyET/ru/M+UrjMK/xpIuksjP4Spdwz8H4pYoWxz
	julsKrqtqOMrVnwIib3OK0EbGREhsoCaKo77xlngXLGuCTIoQDRUlVkr3N9X/1PsavdfST
	m/0+H+SufIUER8L7wKmKPCqcJoJnzamL9WoCK/6RebFrQog/brfrpti6WAZJ3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788645901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QkzZC3o3dS5v1Ze6QqWba+5Ot4Nt9DNDg10lf/riv4=;
	b=WXxGVDwZotvw3hnRNNzjVuzcA5EuQ0k1SEewiMsoiqxKqC+UIR0DNk2WPwGdBeYm9FZ2Ap
	nHKzpr2GuyBrYoBQ==
To: Bradley Morgan <brads@mainlining.org>, liushugao@xiaomi.com
Cc: frederic@kernel.org, isaacmanjarres@google.com, lingyue@xiaomi.com,
 linux-kernel@vger.kernel.org, weipengliang@xiaomi.com,
 wengjinfei@xiaomi.com, xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com,
 zhukaiqian@xiaomi.com, Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [External Mail][PATCH] tick/broadcast:
 Plug clockevents
 replacement race
In-Reply-To: <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
 <87h5k34cob.ffs@fw13>
 <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
Date: Sun, 06 Sep 2026 00:05:01 +0200
Message-ID: <877bkz4anm.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Sep 05 2026 at 22:24, Bradley Morgan wrote:

> On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de>
> wrote:
>>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>>> Hi, I have a pixel 7, if I could be asked to backport this, then I'll be
>>> happy to, for the fix, add:
>>>
>>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>>
>>It would be helpful to respond to the actual patch and not to some
>>arbitrary reply. That way you might avoid your tags to be overseen by
>>tools.
>>
> Sorry my mail client sometimes glitches,
>
> +Remove anna-maria, she's on leave, and she sends OOO email.

You missed to change Daniel's address which bounces...
