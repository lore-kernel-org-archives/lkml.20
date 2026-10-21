Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544872;
	b=crQMiRYAbWdLvPDzUC/iCGHIdg82IBSAJu+MxlRksGCtOcLli+LiEFtjftcyB8uRCoWL
	 GKrA+b1ZgxXk7VytRiIFZivxai983kGgcUdUYj/iyMEHBoRXOyoVyWAx2yRKQnJElzDMb
	 HrV+vT/vK5C2VXrLA9KnmLP76ysBXpEKBSAx3FTkqbkShfBHELH/wP2QKGF24dgavJZU+
	 vHKb8KZM8HfvZloOECLMGnTFev5sCAeuCb2tJh/EtYL/NyOTGQcjQ4W9On4h8pNDayvuC
	 GoKFMdhLChnU26XPRQWIvtfKnL8YMUHQoAv6wlg6PCkc4SIhS1/nxRTRwX4fFJNVEUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544872;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XMC/JKLmO6GsbdiZMLRSa5NCpQOlGMpsGRIQ+M5+oIo=;
	b=H7I6MKfd09mB3OB+x3vHb3cVwYUejaZfXaeugLGbTJoc2RjEi/7H/T4Vx5EDp+PQEJdP
	 a+1OoPQdT6nzBEofRX8CsedStedD3gsiq6HHfueS7pIBOseb0qLPfPj0Rrgb9TnJMlNwp
	 U5EXury7D4uD1SX9dYEeTXcuOTzsV+L2L2nTITnDe704bCDWNe7G/lALVZ/K1IS4PrsYL
	 5RFtFbpweEOMj7NIwIQ640yJH/BEJ6nVHzkGGocFNya1ivMINARTlSFX6AoJUHfyA2/I3
	 dwTlpNUHMe30bQq3d1SkOk6PtTUSyvQvXzvzvJwAjvm9g6Ne7pH2b7l5WzXHgFqcZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C09606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5821D1F000CA
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544861;
	bh=XMC/JKLmO6GsbdiZMLRSa5NCpQOlGMpsGRIQ+M5+oIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A6g4egyVkvIfeRMzGFj/0XleoEIllH8u0WDTi34CWFe5bPLS71whXNLWRKfdy1gZF
	 Lmp01+B6m805ExLRitei99IbcjU/Qg+Qurb6jB3pz0oNxr8ZITmoaN87jmUnkU5rQq
	 cyCHpbjef3kllYiZ7Nnjtz+x1CQ+ukv19rxgAY+ME3fSLKow7RlTO7miJ0m8XJVTBs
	 34VFYfX26GLSXPc3uyoP/sWR/WWdvALpWU8bxDFYbPY6FuDBkmKNVmLCLbmt580px2
	 xZZREyd4eWCJluqObxiK3UbdBZH5EV4D/BxOipUBBASnp5o+WZWUiKUMH+mCaPyG22
	 +NZHz8MGc+qfA==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c43373ae89aso15036466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1QtVwYNJnETLCfZA9X4pc9u8cFt3HzRIL4hjwf/ZFvpAP118/dQJt5gUmEtg2JdO1OThi4nHZscnoDJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO8Agz99FCGWfaJrC9YRN48/XO+5xWESprf4DolcM0UqwvRNDQ
	OCTyKTjBFbA75YOL/g06TdhwEQUoDDd8s+P9LNkGFNqFF+8Qe8krvdMGnO9OGddg/FoerfqggMt
	ta/SSvOG86bfigUodXK18B3f2ParpT5M=
X-Received: by 2002:a17:907:9693:b0:c42:9ded:6a8a with SMTP id
 a640c23a62f3a-c46795f0e10mr48388366b.16.1792544859963; Tue, 20 Oct 2026
 18:07:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAD37_9gRtYiiKOV-efL7HAaP+_F7CUhv6k-iJhfwnEwuYt3GWg@mail.gmail.com>
In-Reply-To: <CAD37_9gRtYiiKOV-efL7HAaP+_F7CUhv6k-iJhfwnEwuYt3GWg@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 21 Oct 2026 10:07:27 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9CNgQb0XxZ6Emue_cXWw8YAbmGuO+nk=DVMCKKR15p9A@mail.gmail.com>
X-Gm-Features: AclHuK-2-U9dNuIKJYVW1bdcw0b-kMfroshV1U87z8YoDffsr0q7mmj1JJ86qrU
Message-ID: <CAKYAXd9CNgQb0XxZ6Emue_cXWw8YAbmGuO+nk=DVMCKKR15p9A@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: reject foreign RPC pipe handles on IPC$ read and write
To: Mohammed <mohammed.saad.alquraini@gmail.com>
Cc: linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 3:19=E2=80=AFAM Mohammed
<mohammed.saad.alquraini@gmail.com> wrote:
>
> Hi Namjae,
>
> Patch attached for the IPC$ pipe-handle issue I reported. Tested
> locally. Thanks!
Appied it to #ksmbd-for-next.
Thanks!
