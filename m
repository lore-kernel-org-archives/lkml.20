Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476831;
	b=3dHmmYgbjgF30waAVrpZIatfQUUeRHPLFlz/jwa3841JFlHBMiNzRKBTg3lju4a5rIJU
	 FFrils+bmbce2OwEgfL6QDa0Ve3iMouM3T8upW6cbZJQDZsu1wzStuTNbN6MR8e0Da5xS
	 6x7IOIq/Qi5HkGLe/CsKObeMhdeJGGBd7hoyDENjbHLkIfnflJa2e/kJ+/mvbk+fxKkxH
	 LAt5oBXsKNJjmNWTtm4qDdULykCmejUomurcYIyt2ByVTZoxs7PEJFy1t/xdSMkDGuD6z
	 wPsGTd28uRQVARGif5h7g/ygaEFPuGHOnZjI9xPC0+IEs0Ms4CypcafpETyuuZhralg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476831;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Status:X-Rspamd-Server:
	 X-Stat-Signature:X-Rspamd-Queue-Id:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=IUEN/06paFC/THJ4bOAKhrNup8nm5V2kwQONxp9Ne0U=;
	b=V3vpLMQe8vBd2KImKjbvz0oAcYis5kAObTtbPbDasxutw9CUsmM05eTzE5f0xPM+r+Kk
	 ShxTBj9Zcs05ijVO/avhmpPWr6VIlmfREBRT0z31zM64FOMDegrayGdw5Qy/Pl30TuU05
	 E0oA5TpIiytBkVjaQGiwr/+gGzgerlQxbW+C9bfqCEtTkrrDOd64ja/njICFjq2BFbn5S
	 Pu3WJVrEjUBWm/zAeaTaj3DwF29XmMiN+q3UnXd7UWwSst27epqsTQ+08qO7f/y5gEXng
	 AO+ikwriDB0d7g5NmnbgqEWnWAdmhiZtb1HfV1B7ZMe9fKckq1qXzVxfuLsxBKgjgnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=Vf4Fla3c;
	arc=none smtp.remote-ip=216.40.44.11
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC32606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC32606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=Vf4Fla3c
Received: from omf19.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 29044120537;
	Thu, 12 Nov 2026 09:47:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 1BA5C20029;
	Thu, 12 Nov 2026 09:46:57 +0000 (UTC)
Date: Thu, 12 Nov 2026 04:46:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mel Gorman <mgorman@techsingularity.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Seiji Nishikawa
 <snishika@redhat.com>, Mian Yousaf Kaukab <ykaukab@suse.de>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] sched/rt: Do not account migrate-disabled tasks as
 pushable
Message-ID: <20261112044642.0f28f038@fedora>
In-Reply-To: <20261110232057.4144723-2-mgorman@techsingularity.net>
References: <20261110232057.4144723-1-mgorman@techsingularity.net>
	<20261110232057.4144723-2-mgorman@techsingularity.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: 3wh15w3pankncthe4m1tenxjrd5cj1x5
X-Rspamd-Queue-Id: 1BA5C20029
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18/AcSWmWtkvlWspLm0pnOlLUK1ECZEgiw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=IUEN/06paFC/THJ4bOAKhrNup8nm5V2kwQONxp9Ne0U=; b=Vf4Fla3cQzMGunZlPTfReLpNS+X+9+P07s3BW4lkweLcLkRvw4dDLf3jendkPxhPmyytmGMWNcchuipeaRISj/4/zYCV27rPolOJh+jiyzkRSOiu5zcqbNaN4z2FlSyODtXBwdz9Yp6nTa1fa6GtPniaWiBflE9cz089IvaIuyg=
X-HE-Tag: 1794476817-755240
X-HE-Meta: U2FsdGVkX1/18wpdaowKmmYygTzzEim+rPEGV81vmc1LnWonwQYISCnGVnZN3/fImtsuqh/50jhk5YdZJ6knwD01Imo2ThqqieUXmDyKMBajlzf1fajFIpdrbmQ6Azx0pmcAKq6bIoLcpnHNS35D9Y6lv7rFM6FMD5g3IK2T5NBGg/qQ4dQE3UGSv/oyXuxQ8lfg0EmN6qiL1NBgLfqQdz6etXwljRdWft5zDhk+NMs7pS2lYCwlQGVxidzm8wFoTO1JCvAlboCx12AHF1mz2pu5e3sqvqURQ/j58mG8s/Y+bKC/TcPa2exr0D7sX6dhLkg+yxq5ZgpIrsWYplCQCjciN91Hg+detHXM8UfNZV88nURuJfZeD931uqLJzPe8

On Tue, 10 Nov 2026 23:20:55 +0000
Mel Gorman <mgorman@techsingularity.net> wrote:

> -stable warning: This patch is part of a series and applying just this
> 	patch on its own breaks the !RT_PUSH_IPI case.

I don't see why this is 3 patches. It looks like patch 2 and 3 could be
folded into this one.

-- Steve
