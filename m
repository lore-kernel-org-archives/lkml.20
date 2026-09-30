Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072994DD3D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776595; cv=pass; b=cTKjcyb8Xz3amy0raW1v2/gopIwd0ilz2yfxFZpOWc2FJyqLAwEq+3mu9FvvD+fE4fnJ+M7PHtjCzSpVPhZbABVRLPyhQSYcfCdWaGoUlv/5WzEe4zsy8XAJM7GZyLwGVFxOV0D5KIGbG9UNK1yIKp1YWIgHUKg/fm20CpbwlIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776595; c=relaxed/simple;
	bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwHWcR6kRLOgr13Pv39WTkWI2DaoJrF2ZcEhTUf3Gyysnk+rVwunyQZEgKs7ecwz0YD4T8fz3eZxEXYR5jLYSzuXTkMLAuwo5N3Q/bsWVvaApR1netfLMNKCYym9D4ys2+vqaiyHrqHxo8OJ820gQstdDH4r7MDRsX7XW3iNMG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NAu7vgGs; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NAu7vgGs"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so828244866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776578; cv=none;
        d=google.com; s=arc-20260327;
        b=PqMtwQQMuUh/wE8Gljbk2k+qaiOuW9fmXtGZ2n3l3xQt8hEwDwZezaFkfrdSshrw44
         QYKp/p7w2FRDGvy1tn/FzSorwz38STlpW7eo850iklUu7Eo9LOLSZ/iKq0oTF8ShOA7D
         yvZ+BsInQZzxH6T/6VAPgYuYHXvFTQaFiS9s4HXea34HLoCXkOYhXq8reFW0SuYiPmqm
         EDIg86ZzMlmZ/sPuEQqzge84XMtSHBADi1iTPJ7oDz2sjrL4DVQZJGS069QbIkI+m97h
         JTnuo374I6U6mZd1m18cgM/QrqTkjYQdpxQ0n2RIEjLrJTdCIwFTuNhMRs4fitRhP/2Y
         3l/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        fh=yW8lydqAvc6j/ASoHMHBr1oVZjxK+tF9ftSf2zYe27I=;
        b=oiyNcADCU9y/52EkfmWRobNEyWcwcvPMRXJDye6NGdPvU1uVurWf6VdMiT7gcZRJV5
         eHkaprPLXdkEl9RgS5HOBFe0yXdKt4MQlFg7MyUWEPIOeOepMt2GThD3/XjHNVlMXklu
         2xnfwpNY+RcP1MOZbVI40XHmeCUAQNI6szwTpxA0rLkyGsiB5r/xdJNNwO/Skf8Er3O8
         hI5FC9e5qkqp9mDl0FyzNMi6InEx56rKqHkYOBN9e47sO0M1HX7A/Tepd2JOAjsAkLQa
         l+m9Fp+IPjgtWXf3Yc1HnqmOxgM3nCkavaVKq+cCNU8c0kT1XWVPIqxz77GCElTf9L5w
         R55g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790776578; x=1791381378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=NAu7vgGsXVtRJM3kyMtlMOwhzm55urhiUSDyX8sptKkvZEuu+DxtLMgX9bOD9sV/PB
         hoheU8pY/PcwwObO9x8Xww3BZ9xopjEfolEksoJhIui9UCsAG7apD08uEnAQvFYikcY/
         cq/eenmhC6S/AUZV/GQmjiyaVscpLL+/fxy2q2Sneisl0spSawpIpX4aj2SwS2/4f+Ob
         +L8etTYb3ioJVKe6KdzzxRHtBeGkiHLsPL48wtu+pG70JmkvRCLJ3KQXvPP8VT1siadX
         USmbbSz/GhOnArUa5YyW5JePpFN5XSy797Kfx/kYeAfFnsqaQRMPkJJRmSbkYREG11AI
         usPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776578; x=1791381378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SwTqNdqJfRK/IUxZeFy/sI9epuc4z6THWr/paPSz7A=;
        b=Sk2SA7UOeTePPPiY3LbZw2j3/Y76zUlnzwLR+PV3V7i3GOsCABDD0+PjD0zKJ7iyji
         zWQrU0IHxI0AczfHDIqOKX/mQKdWNv0EotpVAkw6xcfazr8+i58wWMXaVQwAgJWqHkv1
         aULBVF5psfCwY2P/z84OCK3L3B27a8sFNnwKs5jzHiJVnoA6Cf8SgOnh4pmt1vsPR8Fo
         a+sQ6v0jcd508dIHG0QcvzM+AS+2HdYe6skMLioo7NAKPaS4u2ob6UcR30TlUvHqszNT
         4GBIHgTPiuX5//pfLR4QceOdNeG2gGtT/6KUEPCz3l62teGQsQIrmo2eMEDrkWEcdUq6
         bWBg==
X-Forwarded-Encrypted: i=1; AKwUvBziV2vqSwg3cI7swhxtR1imzURNRVOg0jU1r82+10oB00azSQsF/aamVB/0oQH6t9HWhOB9vUzS/OLawgI=@vger.kernel.org
X-Gm-Message-State: AFuF++neXEEereiUWKliLhSzMFCZDlKKMhjj5zsV7G++iHCmLEFmNI7S
	09+QH6h8N2hY6GvYvDCz2nzC/81Oha2hwRUplNTFni2TvxAIvi5+fdDMtgHkZeSG7oK0Dd6k2qn
	/nGw3yay19U+EBvt++EBK70MdzflhV51n6MUF6kE2KA==
X-Gm-Gg: AYBFou3v2/YqwN0QLQ72xB6333asWbjL53y/xHqx2ynXslIoZueC/svyBcJgoogv3KB
	biGUSPNEppWnVdqvlBRLoXKsXAXToFTifQQ6pEycQQVtKr4pCfSuRBh1jpgmmjRYB8fPi0MrA8o
	HGQVjGtr8ksitdh6Th2P7cnB2aBlH5qDG2JgOGop4gVhGNg38BRObUg0wqfFMgyjzrvzNfRjKQI
	wRcZ2N0qdb0ItJjwgaNBVUxLULV8lu9J5XNmcctDfkvZ2/V479BGA6uFmov+8my8+BueydAsH3Q
	ODaRmjL3eQ7r3oNuCobCRRQB5xxQH3S4cnpQruJWDfYMxynb3DMt1coYgxSrByv8e6JdPvGfenS
	aHHiuRio3AqWd9+DRyreX3Jk=
X-Received: by 2002:a17:907:1c9e:b0:c25:c67d:53cc with SMTP id
 a640c23a62f3a-c2e23cad0fdmr124499966b.8.1790776577897; Wed, 30 Sep 2026
 06:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net> <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
In-Reply-To: <20260930-hulking-swan-of-enterprise-94e2ae@quoll>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 17:56:06 +0400
X-Gm-Features: AclHuK_LS1pgpfgwaTzGiwreXcQZqQphizrD9-WsvYxGfaJqBGmravJ6aAw_W_w
Message-ID: <CAKTNdwG0NBZUez1Yy=jk3rYrD9W97oRMwvpX1qMXwQsP=_LvNw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:46=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 02:28:18PM +0400, Alexey Charkov wrote:
> > Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
> > when they find 0xef08a53c in the register they take the boot mode from.
> > Add the magic under the name U-Boot already uses for it, so that boards
> > able to request it can do so symbolically.
> >
> > Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> Drop, you cannot test it.
>
> What is the point of such blanket tags which are not even applicable to
> 50% of patches here?

I'd argue for 40% :-D

Anyway, I get your point. I'll drop the tag from the bindings patches,
because Shawn tested a driver implementing the binding and a DTS
implementing the binding, but it's perhaps far fetched to imply that
the test covered the binding change itself.

Best regards,
Alexey
