Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825914;
	b=FwnrnWJ2k74RCqmdcuP3jPEsroF91tPH4a0hKEoBzHMcIAn54tPPrJC2wQti5vmmiuxH
	 17CHCM49TnJRGFwV12pEi3ezfxWflgpDrt0JwBNVG2TJCpXbDEfabeAPhDE9Y5IQUdS0z
	 +UGwk2EEamUX7ulDl9woNDlKgKerJ8KkckvZZ4e3+GO7dEKHV6Fo0hHpAflYrCJYtmtuU
	 nFIvkKAaJE0bup06CD2SOXDBlUDMYA19vXsn5HcViY69r6OBi+KD01xMHbNrLzST/pKUL
	 uLPlYra/ES/of3Kj7yNMMYyKKS7SxaawlO9Nez10sFSKEOBDIJV6PV9swM10NQdDQ9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3u4qsRO8g/eT6nt0UNNI3jzlxW5m75Q0zJ98YGBjAV8=;
	b=XEJS0mTfYraJQEvcwrLdwR/xvOZpkeNnSB8rIUbJ5wtyBBoSl1xpGG1Xzz9fgBg3wcdh
	 b9bHUYvHfVBIbj0JFSLFtqdeS7ZuDOK/v8YimSgCJ/eiR4CYHoW1wsZO77J5WeISYd2yl
	 IG2u6tfgIbpqjQY2Hw+INplyDQsdo2T5cUTrSIXZYFM0Wnkbehl8IegKBdOJZ+FL+HgKz
	 Ep7amnyP1qo1kv+nvyfRIePda0zhtyg6Ahdn+5juSyyx9+ZwAJRSbJR/td65zA1LcMW/Q
	 pI2G0RSZnZQSMP7uERI/ap7sy0bRYqxYIBrmm326zUesn7o+z5JtnTbH2ll1shc453A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fR7AJlRX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BF606C599
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631BF606C599
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fR7AJlRX
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so859731b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793825914; cv=none;
        d=google.com; s=arc-20260327;
        b=OIgjmu1nmumgTaxRCNYThgDM7FMn/0d1+Ksr57T0uRyXMvdy4CRI/dgTIBa51uHwnU
         qiiJuuOSFVNMMf2hYkb7H4cZFbddkVbmYNGoWE1LRRN7inzKtN/L5wQrT4w4pIQSsOGI
         tIl+bcItvzWNwtOZdT40In2PCSn3cShNbgWiEnluPcysW78HuYNisPREcs07Gm7yvKMv
         znuBSgUz1yUTvroVzP4BNxmAPo4LZg0++5+ZrVbGaxCLMph86jiSzHwLWHG8OgcA5Vsd
         /8lks4DSOq+oigkAtbtetHQBbpyH2cBe8aRE1bDreSgdbEW4QBEtG7lUnJchJMGa133r
         59jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3u4qsRO8g/eT6nt0UNNI3jzlxW5m75Q0zJ98YGBjAV8=;
        fh=+l7RjPjO3zrBgrUmmJ7k7vEU7c9nx+vLyHxRwrc0TNA=;
        b=l3NL1NRqkZWArkH7DpbLn8sqzQnHb+qWee8EaQlzl08CR+IuKfY7S/cEl6X5WT43nO
         kUzrGOVy964aPoHqMfgaoAb9s43W/USIbV0SCDxqvQ9JJeFt+q5X8Y+CXilHCDHAeG/b
         ByKPkOpHq3Z/wWwkdNge+P4oSDABe5DMUpG0JGMSLdoblPYMLDkBWyYJs/0dzKLTgl7q
         1G94c7E0tCIXT9JTQjaXWNlW1tUOwuDgCzMOrfIzwFmpwkYGQl+LhEIdR2QuHV9hqIcY
         18/TyUTzwld+GrW9tWSAWdF/7+oHJ2x9Luaea7rmTbSKjziiTIOZEw5yUbhgT4ySr/94
         0tEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793825914; x=1794430714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3u4qsRO8g/eT6nt0UNNI3jzlxW5m75Q0zJ98YGBjAV8=;
        b=fR7AJlRXxJe+Nou6J/3N5NmbHU+4+tTxjLQ2uPrrKpNl4XdzMgCm6+MYeGk0R7XODW
         3dVHq2XXYIV5hdgXM+ifxXTnNSWsDA5frsVmV3Knzsrt9WsdDd1+eEWUPQfs5MMfi4ov
         wkSsA1ztfUBOGACSuUX5K5n6nQeN0WDXTOSEtRnRAz6uPsT0s2SbFer6Zks9YFwy9rbK
         ZR2qwnep6N0ASSl4ZFxKQKoE0inEizroQP/SYTAPxIDD40CHWgBLUTat3OheGjvbUMWf
         O57ryQk4WV+NAspycjU6aT0DbFd6GbMHUGe6vaf5lO0CxfMpQ7YeSywFxu32CXG7CADs
         1xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825914; x=1794430714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3u4qsRO8g/eT6nt0UNNI3jzlxW5m75Q0zJ98YGBjAV8=;
        b=aspaFJiPSW8dKB3TJ70+7KDtU8yorFVkwvwXhe9hVsIbOPinCgav+foBfIaKLCn52s
         XiJaWpQS0t15p2BMfsMcMfDhZWEK4iBTsEIewVaCrEmVMddtRuFFdOtkbAcsu86H+d9z
         1pzGt5Ns58jhPlrtvhikW1DHQWICuPeMWlcmIMiAPnn+YkkTnz//oXGQDH3uMeBXG5Hb
         p4NnUDR+pEsIrKaxbLfdZZH2j90l+zAqqH4T3PleMv2TFdQqXDEl5WbRWsfMCCUYevdQ
         x9Bc+3rK9w2hCajNe+lU/qjEZ0nzlnzfMdzKiC0435avJXARbzmN5uKKRTL/BgFykkh9
         4n/Q==
X-Forwarded-Encrypted: i=1; AKwUvBza10l4tD8qBTGYytwLlx4B8mTHayzcCvOjBahL+fjPA8nCju+M9rH9nZwyG/paYFBpr4+3urlM581U848=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jwvZrr3I1ugakvscVwBLmCn8Gh9QmQYiozPXKQAHLz22OE7+W
	SSHjuH6lyobYCJd3OLInYYefMiES6/k9U10Fy/3TIIXIE6hGizdmVZFoXb4i3K3z62xLGr3MMUq
	l6Lv99I8WR+BQHblM/NHOPAHdDtMjLBsqZ22jynejmaRFCRdqXZt7IQ==
X-Gm-Gg: AYBFou1nVpb/wfkuRrx2cDoJt+KqMJboUTdMZsBQTiT5oM6x6OvOFurPFkMBX7aqkbE
	xcPFw+FVSLGKQBaLv6THn1ULNo4ln1zDn7QKML92dhB8xtTWM79Kfmu5U8mhIK0OP2aujHsEyyp
	ILsqTqVdqw8VD7pp4jsDmN6RaND/a0oPYvdHthuGbzXpDD6GwGd8BBFoijivfyd8iO4oaW7tpBK
	hcEN6LGXG8b9svcXTHkZglP63GAypJa4bonqO7VSbow2En6rRz4k2vpSoFaxQPrDg0YJ+ukmuOi
	hhKGMFosqFB3pKHWyQy8bZu9Xb81Ebed7D95YnI06YjH6nzt983y3wYmScrzpzoYpTpWSbMAztF
	Nt8wWdK0uxgB7HuzQR8pkszkdqaOR4iR4REPiG+T99AHpLmLAt0g2zQ8vy68d7U6XFfxY8H4mYP
	aCHW1u/t/zKRDtKg==
X-Received: by 2002:a05:6a21:a94:b0:3e2:9f69:35bd with SMTP id
 adf61e73a8af0-3e928cd50f3mr14704044637.34.1793825913688; Wed, 04 Nov 2026
 12:58:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014165532.329933-2-blum@kernel.org>
In-Reply-To: <20261014165532.329933-2-blum@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 Nov 2026 15:58:17 -0500
X-Gm-Features: AclHuK-sTQRosfk6KioQIcgdkHhd6zNTYpIgrN0o0NCORE_8LHez5kzEc-RAYyk
Message-ID: <CAHC9VhR8=-yiV5p93sDvmnQZK3QmnDdmZS+J12muxx7VXPq5+g@mail.gmail.com>
Subject: Re: [PATCH] tomoyo: Use isdigit() in tomoyo_numscan()
To: Thorsten Blum <blum@kernel.org>
Cc: Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:55=E2=80=AFPM Thorsten Blum <blum@kernel.org> wr=
ote:
>
> Use isdigit() to replace the open-coded implementation.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  security/tomoyo/common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
