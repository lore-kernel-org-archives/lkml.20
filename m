Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794862194;
	b=z1jO8dtUcfHRzWYrlaPqYB5F2hwbv2SPcuuWpIypjPxa6bX0QRs2LpI1wK22SAvPV9j0
	 arnO4STLFG3+epIToWYGXtUdn8RJmPNRX/iVfjmTMMQWyXFfipC32nsbrGACblGpBOaBP
	 EM6fxC4r2zFicZnUkfpolPKS9x+wlVVvt75+45AhxWPHzx6EGkS/X+I465/hoRhDpnFQB
	 JoNQQNf68pbuqdNtcZMDe6hHXWchABvjY85OM6jeGyV/4tWOyxj3RItZqtAD55TwXtBwK
	 wz7Og+TlUkC27sMQIhyhEnP2JRFNABCRiXwJ5Teq1DIAg8Bl5mWuhZ+uYzgdmovCIZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
	b=je8kqss/CAOiCNN/JbInIrSbxfRqPFy5nWmci30OfYThBVNCL9u4PbzRZPfq9rJc/9L/
	 IrJOrSdNVDlxeWcP21XxOst+n755VwEmxGIKFHYDeE8P7wNWASeL/xPskvVV7u9EAHv3C
	 Xqns38d3qQzuYl3O5H6nvSIlRM+j9zANeBN3Tv+Xlf8ee4FfujxLcik6lWRdwPAvEirNN
	 YdxFxryaI0apbhlSqr9cGiBgFnsgGa1zaFOEPS1qSU5fahWOXXpL1EsJTE+5hGov2RhkQ
	 Ilcku1NWr2Q02BJ/FER5xTdeXuqqcJ4IaFInAxS/xHhRKZ8ohAkHLo1V8SojpiVLp+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK;
	arc=fail smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B2606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A42B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae7fc5681dso118c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794862193; cv=none;
        d=google.com; s=arc-20260327;
        b=rw/U3qljESFR6b/cwZ7w60YYoPlyrCX22pKcvabLSVb0GLGyOAseFg8ymgrZfRi8q2
         1/ImIKELg7g0JLpJzi7gLpPZkRlBG9VNaoL9bOvRnVlNER5tp+UU2KvKONvbEepCVAhM
         dSPNKWG9ZDAkssLI9MEFd5AfvrPSSlpajaBxWk2YgKuLX9xX0WQkdvC5USt5imF/fkZx
         WneOi1L7JwPCOtJMnBY5r1tCPXjJn4LOr4uwC6kusDuQITiYg1WYO1D4EFSPb884by05
         2+z6sjyeRh2a94ZMqirdb2O/ZTbn8MQFXPDHb9BVB8iCn9i/DR85Orhkg1ivBOvzK/V4
         +cwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        fh=yADLEFb8u7MBnokcZqlOd2/ejA4C6PImzBrClnHJvlE=;
        b=r9WBvqDUDJ5s2F95sGobmEsjpKnV1ByP21kUTjfI0TYS4ku4gSecVm/xbBrYneVBfv
         ThnKp9nV705jLJOb400nPaPeDXXA8ggBZESOU/Vtoi2nFJoff0CtgliCB0LIlSvJZeW0
         OWI0jb/xxyOKu1TL1YNswRAQzESlMjdMwlfreWDNnhRlCNQkvza65R9ylzvgb2Tl3RZW
         DQ39BDY6jZx6l5TqauqFIjYW+VfbBYLvcGkQesRxfisH6fUf82Mw0d7SMiidIT/XQG2Z
         3JTbafsq8kGJ3kt5ZssxC6na09uoYX2MgMAemKPADVobHQ4SXbuEmk7AMzeg7/JZutCl
         /8/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862193; x=1795466993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=bEjcuIiK5ZzslMfTPogaDUFoWAzfW7XSIlgeWB+jQEocpZXi0A2/2ry9JGDzqWrV2C
         Otl+PiA4C4mRc5hokEx9Ps7c5fSKx2ScfDXDfJU1gjF0gzJU8OkE+ssimQcRSnQ0Sa7B
         rd1+f9yQyPhR38YklodVcnYCELRqxyttWQ9nWrVS8Dvdu4Q2MviS0naNBlb+7xI436I7
         xm1bwwLggvurvqBhTifKsHdDDU4yLf5vA1/oL8JC/MkxU/SfE4mkt1ycfr1BmU1aRz49
         mFSFZXKzWkq9N6y3IBU1i7veM3ukdlbhIzawVB38Qmm9r6Bkff1vIaeWBxXEXiYP56S5
         o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862193; x=1795466993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=c269GhxQY8md2qQiMt0g1cwiYAw1IucE/avwDgjvMZLcEROvXcbT+DkLifTFqPC/xJ
         SIVvsjR6eiqg9hVZn5O5vH5dfeXZ42Z9UoswKUwQRkizKDEqPbzyT5bE0t62cpojMDKh
         QudWdn8ou50zb+VrHD5z1ybPHzHOiKLNv2v2ZRyw0BVgtyPaDyjncWWj16kPy/bn1vCH
         3wxytn7YpTlIRw8xVzYcD5Ovjg7hg7r4EcrwiegCTfekdX7OFN6pbErK1PGy5oUiTCAo
         pIYf5xriOcpDNx0NWr2lgue4QTfzugb2U+Ih2YK8huC7lTWdsXfKAa/txwJAEi4/Hii5
         BYuw==
X-Forwarded-Encrypted: i=1; AL+hErFijtY6c3Th2mGssYoIjJ144YDWAD2SlOZuEErLzM4f8xQrRLc4tFOIJn7GGzNYPIEl7UgCfa/jF4K3PgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h7prEOxAoEfqNczMZgnsYWAsb3y/wgCmT1KQNse9KV6OLOF5P
	mt5Lq+Z2Iwq8I073yElELKwKzqoKZgeYJys5QMFm/omvrG2T1d9+fFCBNg/3k4YyYma5V8G0QLv
	lIQpTVY3QeomkFsjXYZCvydpEwcH4+uHCcNqwax6qlzqx53gwZ2aUoZvv
X-Gm-Gg: AYBFou3rSBQND03cOMaUJXNI9RCECn0sa/gdTBxxLpg1mlXrE1JbDS/2lK4dVhZlgmx
	9XpcdYgX7uBor3cWgMtfu68DmeFE/rd4k9QLMjOF2YLaGtnGVvVCGbApemyk1H1Z+LXkjrzNOzY
	OXJXYSn23+ntlT+d0U2lZd8XHy5sReVVqiklskXyvag2Y14DvmQQR1Z7cpm4kk+SZIcWAMnx3rX
	8XfgiHX23zBhvV8xxq/6NzQ6C/x3VjOkkC3pLS3bRcLoKLD6m1Qg6xe6RNuD6azbqjWxT9Hcuu4
	uvuNpB77ALhXzMt9bV7yZK2/I2lJ+CdSfXYsL9ugmgKxmzLDLR2s2bCO/1Y9iqexddqXuuJkrw3
	HWTM1LpW8f6ULHF3uoCzNpkl77FrY0jKbSAPI7tvRVrA8Uq/1d10E3Hxw
X-Received: by 2002:a05:701b:4184:20b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b53b1c311emr17544c88.11.1794862191699; Mon, 16 Nov 2026
 12:49:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com> <179477333507.3291.8047663595939414550@kernel.org>
In-Reply-To: <179477333507.3291.8047663595939414550@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 12:49:36 -0800
X-Gm-Features: AclHuK-aQ9C1I6-uUlKXpnPxjBY0WWDeyp9bVBRmMdCUZbStYerQX917Ww7ppsE
Message-ID: <CAHS8izPmV_Ap-L8rykyMpc2acTrhGuU0tT-8bCMUE4e3vQNiBw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: devmem: support leased RX and TX
 queues on netdev unregister
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 12:08=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Ugh, I think I dropped this description somehow. These are follow up
fixes to my earlier series that fixed the device getting revoked for
non-leased devices, where criticality high issues were called out for
leased devices. Not hit in production. It's sashiko code review issues
that are correct from reviewing the code. Not reproduced on real
hardware.

--=20
Thanks,
Mina
