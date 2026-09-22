Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F8522683;
	Tue, 22 Sep 2026 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063747; cv=none; b=tLUv8F2/B8DliyRxcrFpW39zwtWTQSoZazsxcTF7NbMVGnN+KWsl9C5cpTpKB4QCxiUptm6WdBq6tLIMYBG3Bszg8O+rAQrfGD8SSSzwBMmNsg43Wf4FgmmpuW0UEkAFxgZPljCg+3y85WgmCKiCOG1axap4CErv4b0hyEPoSUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063747; c=relaxed/simple;
	bh=EpMl4UEbjXu+4EGNYTYZt5hS2OKJOPvI9CJpSv6iYX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSbvDxoCcmPGxGjHuvEvc4ZBlhuQy3F70X27/twx+4SIzP4IZgNdGca2DT/+bzQ8S9mTfKh8uiC0kPgz7dXC0NJMCNWBs39mk7yO2HKMdGSEiFWquZojAt6If/iwyUlVMFAiWKCzn8r/2EUEnvk5loB5u+pjHgNYNgYm+USire0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=enlw75C1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bX+htcEE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="enlw75C1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bX+htcEE"
Date: Tue, 22 Sep 2026 09:55:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790063726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpMl4UEbjXu+4EGNYTYZt5hS2OKJOPvI9CJpSv6iYX4=;
	b=enlw75C1Y0LkyOJ/M8Srxr6wk0P7NgIgglaLot5/ijbGuf+QmkLkOd+I5mzAyd6cI4weoQ
	8aF8j+seVM8h65Mq8Jzx0zvHKwKt+ErL9iFLESDrNlPBe42y5xmRY+d7RBy0gfAp3Naahd
	hkV/zuKWIbTQpADdFF6AKy0ASLiIDY/FehP/Sthxpm5Z2f09Xn9dWalhGokzeDjrToHNMF
	Al7P5hDk6GrHc9Dyhe272M29Luh1juJwvle6HBY5VLWBpwJ71fmXUjCsvP4Z+OcdbB0v03
	Aju6BWsjlEdofueMkI7BKhYpmmuqbuw2c2OSBESzuyJeYPIm2jIht6ySaYXwxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790063726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpMl4UEbjXu+4EGNYTYZt5hS2OKJOPvI9CJpSv6iYX4=;
	b=bX+htcEEghcc9TDpAKTHVhauA95dvpQVRjCXu/ywSYtQpU2gcdR3IbiNjb8yoeIWzJVjWF
	npnqrpIctbog3qCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/doc: add a preemption model overview
Message-ID: <20260922075525.INLFCiYI@linutronix.de>
References: <20260921113050.lwG9IphF@linutronix.de>
 <20260922070619.70145-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922070619.70145-1-quchaosheng000406@163.com>

On 2026-09-22 15:06:19 [+0800], Quchaosheng wrote:
> Sebastian,
Hi Quchaosheng,

> Both patches are held. If what is left is too thin to be worth a file,
> say so and I will drop the series rather than post a trimmed version of
> something you did not think should exist.

If you think the documentation is worth having then it submit it. The
only thing we have is the documentation for preempt= in
kernel-parameters.txt.

> Quchaosheng

Sebastian
