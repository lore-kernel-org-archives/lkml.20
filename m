Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA15013BA;
	Sat,  5 Sep 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634754; cv=none; b=hQPEg4qEqQgKwcLy+IjYF1QpKYL750NDFyi5VAZ/xufxVWZwUqzCFw7ic3QonSTDvWf9TEwB9obLIV5U0wtj+V4qgjXFSwN74H+FqDH9+TGNRoeDPKrXilafhzXdUFHk4v221HNlJkuU0x97nO9JJZ3SpoexncHizFM07aWTbh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634754; c=relaxed/simple;
	bh=hkp+5CoJn5NbChnYTmCYc3wSE+LQuR/e/sNbxbn7nDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eA/gIt+AZ97EMJDM+jEIi19q6A8235siib6ybIOitMmRpWaGan5uXsH2H2F5igVzVL1MI8bKVcC4JggFxSIVtoOuUepQpWobtzdaBdHCrUO/cM8fqnW/kDw5cI+5I6Od8kMmrfA5EMO5BRlfJeSc98ilZl9tu5Sr9caJYb6WhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U91UmNx2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U91UmNx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A411F00A3A;
	Sat,  5 Sep 2026 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634752;
	bh=XQlcbzJ5lQYlPvxOzqLDVXHo0DuIxlazgvPCHrNmw/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=U91UmNx2eF2hjlFSJJPZbA5k7FQ0oUYhIm+dvxjvZZv4owy+ISH0IDgSb/Li8nhN4
	 HHxJkiYIqCYFtYgiTl1C/aI+D2rJ6HZyRi+1IWbwdjFZUv2Nt8OiA/bVmgHYi/T0GI
	 +TpNk8HYsNPqpOhoZq3YDfyRxhaQcv6QcIiKDxfvqCXNDAcAhjD2NRBw+7PE259JHN
	 PbCQ4QJsdo3aui4D22N3cpBwWUNV8sYPcThR4JhhSHOsSBRKJrHaaqeenVsnBsnFKk
	 WoUr5Hjk4V8nNLruABDKIcYQSKLBkORzrqsMo/9QC4HxnYwnzF0o3QsP6mlNAQkKeB
	 aeAQcphIRBDAA==
From: Thomas Gleixner <tglx@kernel.org>
To: Bradley Morgan <brads@mainlining.org>, tip-bot2@linutronix.de
Cc: bigeasy@linutronix.de, enlin.mu@linux.dev, enlin.mu@unisoc.com,
 linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
 maz@kernel.org, x86@kernel.org
Subject: Re: [tip: irq/core] softirq: Remove redundant h->action from
 preempt_count mismatch error
In-Reply-To: <BE63C676-1525-4E62-BD37-CF867671371D@mainlining.org>
References: <BE63C676-1525-4E62-BD37-CF867671371D@mainlining.org>
Date: Sat, 05 Sep 2026 20:59:10 +0200
Message-ID: <87ld9f5xtt.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 11:38, Bradley Morgan wrote:
>>Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Hi, What's wrong with my tag? I'm sure I provided it! On my old email, see
>
> https://lore.kernel.org/all/A86DF76C-F103-4BD1-A5FF-B4701B7A9FEF@grrlz.net/
>
> New tag:
>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>
> if there's anything wrong with my tag, please feel free to tell me and
> I'llcomment on it

Nothing wrong. The script collecting the patch ran before your mail
arrived, but I merged it the day after because I got distracted and did
not rerun the fetch.

I've amended it now only because I just noticed when reading your mail
that Elin's SOB was there twice and I had to fix that up anyway.

Thanks

        tglx
