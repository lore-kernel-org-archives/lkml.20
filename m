Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C34FB9D5;
	Wed, 16 Sep 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565464; cv=none; b=oih3I5wsOmSVAoOnT5QNojs3vRiWdeeBPx29XL8ARjCqim8PmajDSL/JJUZdjzyIpeQVGgHbH4mcJXJyZ5segDikkUxwPTkQtxl08DBPBIawXGClDjV01CmyfoUeHaMOAwyTWHgP8n/guD6ZmkgQbQOLCWWpqHYwd7Ta3as8GTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565464; c=relaxed/simple;
	bh=6UM4aQiJqDDqz5Gu89HtFV/WtcHwQElzcbryzcKjffs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SxIZtAzQsW2q5sUs66ml2/AjCh4/MGpJhZJJ3YzjfMHLjmkkaPXBLYIcQmfQ8Cw7dvCVtOLn2yN5r9cNvx1taXqyg/ArNZ1iP6nncSOuQYCKS89L++pOmiqVoES/7jj/q1LdQvw6vwiCIaMSP5VAdsVrArIsHt2sI3IdU2zEyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WRHzbOPh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WRHzbOPh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4CFE5408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789565447; bh=6UM4aQiJqDDqz5Gu89HtFV/WtcHwQElzcbryzcKjffs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WRHzbOPhRgQyZ/XTVpuuHrHmPVJnMgYYMZuXsOLgShr6rQyjjQZE/ING/0qeoARmH
	 sOqkS5BGtYy4+i/3XiA+J5Ggvvj01aSV1W65zdcx96tPuwFEpxRH3YOwExXyJV5do3
	 5QXurQSLx3y1BckBM6PFf22BJA6pDiWqsVsF+3z3TI0wajHjlc47AM7ltmm9mLEJHC
	 haMvhvkAJhLX8W91G7ANDirhK+tEX61KkeLvfs/vb5eR5IctHG+oHXWoTbNr5Fdl2H
	 kqd0UFREGMpETBSPj13z153jTRTky9Bxwr0KPNr8h53VAZ2x+kCu/fgr4ChYtESswu
	 Ck07IbFnkxK+A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4CFE5408DB;
	Wed, 16 Sep 2026 13:30:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Lucas Adryell Ramalho
 <lucasadramalho@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: translations: pt_BR: translate
 stable-api-nonsense.rst
In-Reply-To: <CAMAsx6dyL3o6LsG_VAhKi6DKS5LTPXHMFnBaS6QhA_zYCOROJQ@mail.gmail.com>
References: <20260831-ptbr-stable-api-nonsense-v4-1-0ef5e58504cc@gmail.com>
 <CAMAsx6dyL3o6LsG_VAhKi6DKS5LTPXHMFnBaS6QhA_zYCOROJQ@mail.gmail.com>
Date: Wed, 16 Sep 2026 07:30:46 -0600
Message-ID: <8733v95nnd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Em seg., 31 de ago. de 2026 =C3=A0s 20:26, Lucas Adryell Ramalho
> <lucasadramalho@gmail.com> escreveu:
>>
>> Translate Documentation/process/stable-api-nonsense.rst into Brazilian
>> Portuguese.
>>
>> Assisted-by: ChatGPT:GPT-5.5
>> Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
>> Signed-off-by: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
>
> I'm fine with the change itself, but a note on the tag again:
> coding-assistants.rst (line 48) asks for the literal word "LLM" rather
> than the model name, so this would be just "Assisted-by: LLM".

That can be fixed on the way in, no need to resend for this (but do note
for future reference).

Thanks,

jon
