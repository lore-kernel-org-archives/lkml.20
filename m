Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C072E25B08E;
	Mon, 31 Aug 2026 01:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141086; cv=none; b=D6I+jf/kNuIJmZbbdtaCS2A2FkLCjpBgSHDOA4TQZHYOwI46LzllQZCV8B4uP8l95UnGQT16bC6aUXuShNwXCdcm7teK4A3NCBc4Z0D4aK+6Ccr2rvBwVgaSYo4E/QLwhywONnrbdg2cgLya5W9N7jC0siK1VhPa77r2SnpTH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141086; c=relaxed/simple;
	bh=ulQZWuX5Ru5V19l+PbEpebg8EQ/cd0KfZ9NMBjMIgc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=avGHNUGw3lOnI3KCaDppZLLi7DqJCL/lHrKogasmopV+h4Ds/xO1YjZjrOhLtHuckvXSEwq57+WfomU+Lh1hlJiAMOvy9hvJbUMMOkBM5mwVH43rBortORjq+N5DI3KM7QUY/hkMf969+q4sRlItKrZe0JUD05HfuL34L060pvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K+E7KhdU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K+E7KhdU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BE9E840900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788141083; bh=3//4eN2qgQxMOP+vzZOHumUuWcxqDZLGFe4iZXkpqPk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K+E7KhdUX25hgH45kudjqWwv0OYLguw0KBU+F2B2LmM/RJxWFNDPIKO/ntQtsmyoY
	 DJXDZomiRviSWVVzwFmup42AiDM3QtPbw/8SIjhr+J4z2HBA4BWlSeCwuQzqU7zSku
	 FSNcYFsq8XX5mYzq5uy47SK+0lMV/CWQrSfFxcb+3CGCMaurOE2HYUAf/Vz98P+6iY
	 TLAFYxGQzjJKuUnqZekMikuMiDSCY+VkktyiU6Yc/JNoA6RKIXey96zzhtl+WxGlqg
	 NuHv8t0FXJm9tIS9lLKP6TgiHqB+qTLLao1Jjxzg5/lBfN1FePyx7hsC86qMaAfdJ7
	 knSM8wxsCJrKg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BE9E840900;
	Mon, 31 Aug 2026 01:51:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Giovanna Macedo Cox <giovannamccds@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Giovanna Macedo
 Cox <giovannamccds@gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: translate coding-assistants.rst
In-Reply-To: <20260830234515.63131-1-giovannamccds@gmail.com>
References: <20260830234515.63131-1-giovannamccds@gmail.com>
Date: Sun, 30 Aug 2026 19:51:22 -0600
Message-ID: <87o6ejjbvp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Giovanna Macedo Cox <giovannamccds@gmail.com> writes:

> Translate coding-assistants.rst into Brazilian Portuguese
> and add it to the pt_BR process documentation index.
>
> Assisted-by: ChatGPT:GPT-5.5

The requirements for Assisted-by have changed...indeed, from the very
translation you have submitted:

> +Quando ferramentas de IA contribuir com o desenvolvedor kernel, a atribu=
i=C3=A7=C3=A3o
> +adequada ajuda a rastrear a fun=C3=A7=C3=A3o da IA no processo de desenv=
olvimento.
> +Contribui=C3=A7=C3=B5es devem incluir a tag de assist=C3=AAncia seguindo=
 este formato::
> +
> +    Assisted-by: LLM [FERRAMENTA1] [FERRAMENTA2]

> +Exemplo::
> +
> +  Assisted-by: LLM coccinelle sparse
> \ No newline at end of file

Please fix this as well when you resubmit.

Thanks,

jon
