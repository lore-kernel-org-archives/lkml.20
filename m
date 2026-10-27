Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=144.76.98.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098874;
	b=mkYiBPxcvWBeIjK8DMQaOX78SRGSA42sJNi3Z0EKgTQinp+4B7frHjU+sXP4YcYqGEXl
	 fWVe4jXxuHmnV2gwf9vRNClk6vTT7xS8pyzr3mmLdVXdMsQlF93ea7RRGBTynM52neSlg
	 RBf1EXhhHCD50IwStpkZUMjhSNBKtQ995HdGcyCjC4ZuuaHagj60HDKkGQDrNc85C5fvU
	 7AA3Hl69PkNdJo2xPawV8BTo9qCOe/6WX07dJFi2ijNjLClANJMLFxg7mXUo+sU1OUigL
	 66scsuXLER9x6gJ+/7AZUl8J6XP1KIy8ni/hZmhCfhAIOiGX34LYCynkVNKBb+4wTsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098874;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=vgn/+XBoLaT9001BrzrBGzKDV91J5TSEJlR/hOLDCBc=;
	b=IrJUliFXAmgii27I+KUGZwCKxmlzAg1+s34JJ1EiqX3CIlqIE6YA7w5Vben+alDSpdcN
	 XMS9JIdiF/FKSbkiUaK4NsA0ulyLYEySv3gecRbEU/6glU9tolhMQCGWISLcNWNCC4x8S
	 6ImFAw/HR1eDYzqeMpd+SQ3IlndPBaZfo9obKxr6WU5wqa8HN/iN/fiz83PCdizAwaYmm
	 BrE5lLSKbavl9NCrVWtlFhrtEl50QfCigRRMwTR+MTYXVVJ0F2r2YJmAbUuPun8POWRH+
	 iTLbpqCJGbYJlNYn/4s07UmXgyx1Y8nfflzuupKbX7pSQ05KwzXO7iNKm7kzBf/1mYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=F3jqO0tq;
	arc=none smtp.remote-ip=144.76.98.110
Received: from mail1.rojer.cloud (mail1.rojer.cloud [144.76.98.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D06606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=F3jqO0tq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793098864; bh=4pXZShZiotLNas5yd3Kknxfosgbwr5B+M9bNvsGExxg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F3jqO0tqnv8PmFHgSWzj0ySj7t1AbcDJMfZ9jpLJSxOsknAV2Grwh8P/gMZztA46t
	 FbEob/NJ7TzIcEHs+sg3zMoxa2Vep7jm/nHoVjIXpEXqKLuvpvWSKRZNu9q4rtT4yk
	 MHDvIhn5O65KAg7FxMCXRpUJBxelovh1G/Or9gTM882l45HKUx1BL9AsZ51yqjK8Nf
	 hRid+KYnMIRf8ADrc68rDdQ+jIWU9RWabY4V5CpYQVkkby9iznEjZlL2rRGQzza0OD
	 y8hKgkhBBkMpRfByGMcGyTStrBlchw0kxlx+e9FtnaOYzwqCI05ObdRqaUKhROwZZY
	 HFr2Dqp2kxiOA==
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id C2A201271E3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:01:04 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1866052fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:01:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4PU9rG3nJQTzzw4ZcLpaIgjlH2vAcUwkbd1fEX69ZajGumENKSb0P5k7X4gzUp4/NU0i0q4oZQO/HDRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdQzo3vU4mcPmw3Kx0kd963+pYAOkLnRpewJ8jNU34ErtQfwoZ
	m0nWug91EY/iLDLEZoNBO6BT7XJfddJxJHMMoGgytHADfwW8t15+ZpUb8K2MVktB6mUfUaawb5t
	Kl4MQ+P/YL7IvMin/BkkX5JMJoOHgOg==
X-Received: by 2002:a05:6870:2106:b0:4a7:4452:bcb6 with SMTP id
 586e51a60fabf-4a83f579d76mr6347732fac.38.1793098863284; Tue, 27 Oct 2026
 04:01:03 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023232813.2983368-1-rojer@rojer.me> <20261023232813.2983368-3-rojer@rojer.me>
 <4e8bbb32-e062-40fe-8ee4-363e83a68f2b@rock-chips.com> <46a26683-9d8e-451b-bc98-505b1c13b09f@rock-chips.com>
 <202610261435018282601@rock-chips.com>
In-Reply-To: <202610261435018282601@rock-chips.com>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Tue, 27 Oct 2026 13:00:52 +0200
X-Gmail-Original-Message-ID: <CABFmFwr0JozEeaDd4KErDzh+DWjkjkVRo6z61OxHG6BE=L_hKg@mail.gmail.com>
X-Gm-Features: AclHuK_qWW4rzaLnwQHFLDFsw_amnTa3SRrrRqVubNsZQXOOd4w_KfjlwheuRvE
Message-ID: <CABFmFwr0JozEeaDd4KErDzh+DWjkjkVRo6z61OxHG6BE=L_hKg@mail.gmail.com>
Subject: Re: Re: [PATCH 2/2] mmc: core: sdio: skip CMD11 if signalling is
 already 1.8V
To: "llj@rock-chips.com" <llj@rock-chips.com>
Cc: =?UTF-8?B?5p6X5rab77yI57O757uf77yJ?= <shawn.lin@rock-chips.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 08:35, llj@rock-chips.com <llj@rock-chips.com> wrote:
> With this patch, swt6621s can skip CMD11 and successfully
> enable UHS mode.
>
> Tested-by: Longjian Lin <llj@rock-chips.com>

thanks for testing, Longjian! so in your case it's even worse: without
the patch doesn't come up at all. good to know that now it does.
note that your reply didn't reach the list (vger drops HTML-only
mail). i'm quoting it here for but if you can, please re-send it in
plain text again, with full context.

Shawn, thanks for the reviews! you're right about the soft-reset vs
power cycle: card is soft-reset, not power-cycled.

Ulf, if there are no other comments, please s/power-cycle the
card/reset the card/ in 1/2 when applying. sounds like we're
converging on 2a, so the alt patch can be dropped. or, if you prefer a
single cleaned up patch set, please let me know.

-- 
Deomid "rojer" Ryabkov
rojer@rojer.me
