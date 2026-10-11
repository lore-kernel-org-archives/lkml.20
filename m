Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711285FDA7;
	Sun, 11 Oct 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791680713; cv=none; b=tRtxdIiTb48Ym8LSkt0zojSpXC2iEkuEhkkKru4IDM9FuYGHfxzzG6aJrn5AaPMsZOcbEMx6aztMh6BdidcjITUZMJqWnui0UxSGuuVVR65IqWQrT9OCbjK7EPbL/ZIUBS6MnYD+3LNS5Xwyi86mFv02Z//kqNuTCR31/kpQ+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791680713; c=relaxed/simple;
	bh=NwIrUga9b4XWzmXvsWtEd+RZQWZ+MDFrzNPkbN+jRUs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPzFd9rgpxJzN/bm0BhCoFa3dgv4eDbO1OYqbOyWTyFMcY5s7Cx/8a39vddl6M5fN7dBrTM0qT/CrmxCeN1rC+tR/ow7mcu8nMS6jetsej/lwannXn7uodNS145XNLholn2qXKOmU/c21rDq7or5qkByju1XnknxZefJKRo3LpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=rmEq5nPK; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="rmEq5nPK"
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id E041C1C3E57;
	Sun, 11 Oct 2026 01:05:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id DB4B42000F;
	Sun, 11 Oct 2026 01:05:00 +0000 (UTC)
Date: Sat, 10 Oct 2026 21:04:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it,
 apw@canonical.com, joe@perches.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: remove Assisted-by references
Message-ID: <20261010210459.754754db@226.227.38.69.naturalwireless.com>
In-Reply-To: <87h5iuc34d.fsf@trenco.lwn.net>
References: <20261009083137.3-1-sashal@kernel.org>
	<0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	<87h5iuc34d.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4nbt6z3zf33eoo5pptiukh5zyf9mt318
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: DB4B42000F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+Pl75A/KiiZqBTNpHl35AS59TluHgMZws=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=16sCUqLYV87A5p11CoByGeqqxFRcv9a/6HeCRuarGhs=; b=rmEq5nPKeHH8xeuZSPLyNgM8kbfzjYWIjs6km5UzEL732/RPAvvFBzLQLSiQ2f0uNmVzlKbREmnoa34tOx1YTecKfYGgQW0O8U/orbP24UkqAZgxXKpXG1zLNAcm8sM+P7Wu9d9t1EzIOUf1aiJUqamictCEzvfEloFfKEdnEIo=
X-HE-Tag: 1791680700-852726
X-HE-Meta: U2FsdGVkX1/0uN9GxV3sEBGZRmqbdDEYjZiZdVq22rujsl6GrghBp/KhJEpuSLA6IewMmfEU5DyBEpdyTHCemY9dK5MnVwHkZOAYNvD3shsL1Cbg8sf3ZZN/RhOVg4RIeL8ORVFaYi7k86ql8/4A1a4OLYhu1QPacJ8EcriF4USK2ttre9JyuyXplS7tMWeUFCPJOUSkIMmq+qelB3opTl1rIMH5JN4tEms6FPptNdC8UgfC4I0d1XWH5KF60SAFRZBF3UcgJ4PK1AEglCrPJ7fN9SLuslqc1WFaZsdngOGJE0LHIr9eXhijPjudL6TjgCt1pHwPGcTLebySpk2a0YD/As9o9OTeQxgt2WfjSj28EmzBjJwDXADXLPxePbVemjsqiCpXGUv0dOAeRnPTzg==

On Fri, 09 Oct 2026 09:20:18 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Krzysztof Kozlowski <krzk@kernel.org> writes:
> 
> > On 09/10/2026 10:31, Sasha Levin wrote:  
> >> The Maintainers Summit reached consensus to deprecate the Assisted-by
> >> tag. Remove the documentation requiring it.  
> >
> > Please provide here some sort of arguments used in that summit
> > consensus/discussion. This basically reverts/changes previous consensus
> > [1], which is fine itself, but it lacks reasoning.
> >
> > [1] https://lore.kernel.org/workflows/2026070224-unholy-commode-cf45@gregkh/  
> 
> I'm working on a report on the discussion, don't worry...Monday or
> Tuesday probably.

But changes like this should not rely on LWN articles. They need to be
presented in mailing list.

Honestly, I would like to have a "Vibe-coded-with:" tag. Why?, when I
do a git blame and want to ask the author why they did the change the
way they did, I would likely not expect much if they vibe coded it.

When we first started talking about what constitutes an Assisted-by tag
(using AI to debug, or review, or simply add templates), there wasn't
really any agreement to where it should stop. I have always been of the
idea that I want to know if someone actually wrote the code. If all you
did was use prompts, then you didn't write it. You simply instructed
a computer what to do. Much like helping a junior engineer. But with a
junior engineer, they would have the authorship and signed-off-by and
the kernel developer would likely just get "suggested-by". But we don't
do that for computers. But still it should be tagged that the author
didn't write the code somehow.

I wasn't at the maintainer summit to express my opinion so I'm doing it
here.

-- Steve

