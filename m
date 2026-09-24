Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994938E8CB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261548; cv=none; b=tOUAaFjPAww2v3M7Gg5q/mTqHsfaSH0EOx7R1qBngtIr3RUdiNeZPpmSm7fUe9S+CD1MHohgNv+VIQ6r0D5kqwQ+hmoikbHjjHrT9RcDaYAJJ5DJp6YJ+yNVKcwSkLW9EEMJLnknOChzyGGyO9Eza8JwJ6Zg3vFBSyZkaAp6EsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261548; c=relaxed/simple;
	bh=hRY30TeL57M4PX7xHpe82ZiE060OSBRDY6/8NGTRirw=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RhHy+ny6XtwiME35W2jMs2hyYbaVcjGruHAUL0qZVC9+igfjA7GwYoTjQNsNPPi1DLp3ppinWvj2rCs1vmTDD/hvmKaajO53wo2UG8hSH3Csdfer5dWfqpcAqXdvEq7D91buYCxCYctfj2YrNZQvExX9Q8I2KkrHa2Syjl8RrPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=qCGGgBcF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lnvt/cX8; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="qCGGgBcF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lnvt/cX8"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E67DC7A0084;
	Thu, 24 Sep 2026 10:52:24 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 24 Sep 2026 10:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790261544;
	 x=1790347944; bh=TPULziU45xEAp0z06O6r8EtQQ9b4bEJhIQ+F3+c0N0k=; b=
	qCGGgBcF5IrMEyA+2Vg3Cm1E4TN0DCP9l0ZTmvbmTQpBxMzMfwEywk1U6pJM68ms
	KWYSfKX8oegd1y2i2t94iD5cpdil9XOTIQECEt377ticstM0ZiPpNa5SbEJyAydN
	iOS8h7X3HHIMWfCxRmk8MrFyUrnL3yfnPHFgtbLwY9YuYLB+Bm9Il1pDBd0G5IJj
	JyqHTLVLj87oExE8G/2kC2p+ilYAjpk0CAsCxbCSUr56uuZCpBpLWH5oCb6ndmcW
	t7Uk90mzn3vm4kMOnJeNy2QJF7JfZAQBzJqXBsD5MxfjMzQe/Kuj4QTdiDrwBs73
	mmwAoWf49FBZrEbfqfqBBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790261544; x=1790347944; bh=T
	PULziU45xEAp0z06O6r8EtQQ9b4bEJhIQ+F3+c0N0k=; b=Lnvt/cX8OPHVhRXjS
	W/Z7Ege+fNqGWht47wQcp0bfNLTV5otXaFngN1vh3JKN4KeqVDPuy/+6T47T7iFn
	77Z6551Bp3CNiwMNW1FUUKciZAE2D1l9W/Bgs3loq401+syY10n19kw4YOUMPNiB
	H1BFPjBw3siZ5Qe9rrmixwv6UpF15NFOxBPoUz9EplvB1SqXdp5W5SlY11Sk0pgz
	Hb/076aK740Ind4M6T8DR5zsPShFxAEeT93FHVOtPdtCyXe2PdXfD2KtAsAf8X/B
	YT9aqgfAkeTpPHR/DZ3kALemLSKaufK0v5hHrbtSVJCCPAH1PrXosQlTyMlCi1Oo
	/IhJQ==
X-ME-Sender: <xms:Ijm1amU4MuGj2WbKrK--olIUbFKTwdbyODGljU6MCwyqO35qM1hQGA>
    <xme:Ijm1ataUt2_Y3AQwf7fLZ75BZWdkf8UH8foAJlOn_zNKBNs_xXkI9FJrWjgnetgsE
    ZKQHAICUi9hq5j59lMPicxieHQcL9-fQw6nkuYsL1djQl0U0ITche7P>
X-ME-Proxy-Cause: dmFkZTFNCD4DWmQAaFWTOGsv/CF2h+xmNG1ovTwUC57jy09Mk/vbeUN1WVFCfkhb3zlhM7
    hNZwa6C1sfd+PQXMSgPkMwBe+zekbozFVQqoV10InDO71OTGq09Cm+Ap1pXO0JROvLBbmg
    keLSciWQ4tCYgATN4l44Sg3P6qxbDjofAzcORov/1+XjJKdCGqUdtd+yke7whuM4JXpe0X
    6yfwhj3sREnHjuqI0scuYPawe6FnO35ZY/nqpOD0IqV6ygxdzbsTR/J2hsbTMYl3F0qdji
    aDD+4Nth2ckN9YygQol+KcosXIGWQbEFRZHooVQmVAduCKTPJ/0Xt9WJU0reuqKWjGuDcY
    xBfA/RmigeRy8MXgr+/AyTUr28gzzQGauUNFfaipVoG0HTgfazJTvomVFASVN8SPc2anwV
    yPuIqYBc5o+hIH1J8gV3Pc9Qq95QJrE5wqUYUaYBUv7D9OP7DaWn6/Re09Ua7KxwcXjkr7
    SwBOVteOkn7nRl9O33sf0rQ5+2mGB+OqxD8Vv7IXtjFtboHavb7aIKUv9r8Uu0asaQ6Xrr
    UC5RaAJZ6+oen0FvvdCrNoukfpNM7XNzgT/jFBrepMovxt/rSH7MdW0FIh5J9zkeU2JwoG
    yb0Rts1n50atu72+z986+glU7SjE9M96Dz8IePd72PulXdL7/vq54QCZAZCw
X-ME-Proxy: <xmx:JDm1ahWjnrtAimoL0LAeJfkFcqLSoPVQ3nrcYM_mZEP7llpBcjw_vQ>
    <xmx:JDm1auI0OG6SP-6xzmGvN19l9sg5BaNx9EzfPBf35IiIklIVbCQY3g>
    <xmx:JDm1ah3Jb53UQVDIQxQvZv5-YmgsMSJDym7jSDQ_asjQXL9SSTbOTA>
    <xmx:JDm1arKweTTUxAVmrqa7J9RJNsGyWq1Uz1T8342HkWYkQ1Wht-VB5w>
    <xmx:KDm1asPDuVjh6ZoUctJfXw7ZadkhM__uBbuFWhizoCUiSQQn69Aj5kTr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A607332A0087; Thu, 24 Sep 2026 10:52:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ax0R8qDxSViF
Date: Thu, 24 Sep 2026 16:51:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qingfang Deng" <qingfang.deng@linux.dev>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nam Cao" <namcao@linutronix.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <c0ab08f9-2258-41da-8fc5-0b95ae62ed1b@app.fastmail.com>
In-Reply-To: <20260923013913.357710-1-qingfang.deng@linux.dev>
References: <20260923013913.357710-1-qingfang.deng@linux.dev>
Subject: Re: [PATCH v3] riscv: use generic relaxed MMIO accessors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 23, 2026, at 03:39, Qingfang Deng wrote:
> The relaxed MMIO accessors duplicate the generic implementation, as noted
> by their FIXME comment. Remove those definitions and their empty barrier
> hooks so asm-generic/io.h supplies them through the existing asm/io.h
> include path.

This seems fine.

> The M-mode timer uses the lightweight asm/mmio.h header before the
> generic relaxed accessors are available. Use readl_cpu() and readq_cpu()
> there, which perform the same accesses and endian conversion as the
> existing relaxed accessors.
>
> @@ -17,18 +17,18 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> -	return readq_relaxed(clint_time_val);
> +	return readq_cpu(clint_time_val);
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> -	return readl_relaxed(((u32 __iomem *)clint_time_val));
> +	return readl_cpu(((u32 __iomem *)clint_time_val));
>  }
>  #define get_cycles get_cycles

I don't understand this bit: Why should these not keep using the
portable accessors? As far as I can tell, the readl_cpu() helpers
are just an implementation detail in riscv and could be removed
along with the custom readl_relaxed() variant, but with your
patch that becomes harder.

     Arnd
