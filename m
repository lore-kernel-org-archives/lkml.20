Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17749B44C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997292; cv=pass; b=sCYSdEopIZfdm/vPKInzlquhqJhjFWsE5FbYdarKoaNmLaqccbu1IDIdoGtOU9AG74mx0ItPnmlD3eZSBlVdCVGyDakIRELDR0xTBG3sk/v/ejoe54FGWpxg/EsEbj274Xw9qAkV8JaF7DYmCyR5beJBBiz+9vE3C6S2N87sIqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997292; c=relaxed/simple;
	bh=ayinjUi8Pgp9G+S1LnRNG4EOwgo3RpV/l+nq7MHooFw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knA59s+7dKJ2PC/H202ox1KF02L9zb4msp3+urvEne/gmV1zSXly1C/Vm49vmYfxgatnFXny1W45Y4kuSDcqhNn2biP8iIkg6qG/9CgQXEEMxSNCVRW8xOeAV+I3c9aQyzov4Mc5q+Yhc8ScULci6dGCIVGoUi4Vn+eO9dR2Zsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ4RNPHT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ4RNPHT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso4904711a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789997289; cv=none;
        d=google.com; s=arc-20260327;
        b=QbmW0Wf3A9nvSo7FKQ0VIfeXBF9a+ZywAOdpv3p70zEu2zUYTlIdaldKNr6tbQZG1n
         etLYy0wrbqe6xt0oOSdUoLjiq6gnu1FJQ2R3vSuqs3lUjys9XdOkmiWmiiNmwyFLGVFP
         1j5WBOHa2dVK3FyrUKlJ3mfNw7fO3etNrVYnfsJeBH7YLdKurDVNChdPN4Ri30XI1TY5
         9RdNByPhlxwvsEqZ1Qr52ais4lCdssOw5cdmz2VMl7mprCu79dfj+0gJ3/cVxOQMSfw0
         5QUxWA+9g0/Q+VH92qWgOlEcK5lzK7HStDbwY5GIow+Pwt9sfGXnA0rRIX6fI3LQN0xQ
         4vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ayinjUi8Pgp9G+S1LnRNG4EOwgo3RpV/l+nq7MHooFw=;
        fh=DCCpk750PVBTTCk5PKpnYTAXMpcxyvcFNGYx4zDw6Ac=;
        b=o9csI40Lj0gDeJ2LoKpY79ugyA/ElZEjq90Xo3rp+AID9M2FhYor/AsmYqnP6P0J4T
         7ukTsPD8RgEptCq2rAfyDPh6Rrtf/MTuZCB1D1dgw0W18iw9YJIc3gY8H6mvc7IRY7hF
         C3JuAVeDtBp2ms9Z5hKifj1/Wg6cEFNl4XmfFb5AeFxfsd3wviG/QUNEuej0QM9s31Kl
         IzFSm6ga6fbqkEEPrv0w9Opo2r3plgWgOu8oOq/rBtaB9VGgkpN3W001bCAshyhDMRFA
         vDsZ8ChyyMEkOoudOK90fHWoBM4qDynX00VT8Jzut3vIIzqLMnMv9R+FUaYrv5+jCTGr
         YYxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997289; x=1790602089; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ayinjUi8Pgp9G+S1LnRNG4EOwgo3RpV/l+nq7MHooFw=;
        b=nJ4RNPHT2Tdrpq8mOOplE6tLzDf5+B/dgdK5CYpVR0I+5CknfJ8TEAi5eWt1qPh7m6
         4me1VDPsGCE1LpwhIaoTIzeP4aCHxmY1M5JleDB0SQEgzfzB3nXXWArHypw1vnX1TCcJ
         Sjv8KIIQwlt9XwmEbx03hRBQWqoK/rsfMSfwr3TlQD6I6eV2r5T+bZ2J5K+dpilGTcBU
         miqbKkoU2qhSJai8Uh/CJhJpmcw9R13EMcRpEsxXIfe27oHUoJ4vcIAA/sRzllqFddT0
         A+3j0xPaixl7Th1xPWjgaGVuyg6d4ZrqNTcQlyu52LmvB+zkUP9RxZgNATnuTFNYqDW2
         Tw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997289; x=1790602089;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ayinjUi8Pgp9G+S1LnRNG4EOwgo3RpV/l+nq7MHooFw=;
        b=G12fG5GexUqW6AgXC3MbIlMONp7c+LavNVwC9kjdnPZWenzu7+mVO5IVC3aR5UVu3S
         rOCfCqhMRX0OV6tn3ylqdwb8Ncyr+mnkufrqdYRwpXmUDPx+SXSi7mvH8owYqFm646hC
         7TjHcJ9RGBrt6jgVykxnI9mCwCYy0PQlWaihLmf8rqwxwdx8woNsGplA3D+vHKvUuPuf
         vL8ZAqFxmuvqwTh7R+AG65mjYI18Obl3B/L8TpSnHA6tvqHFav/3LmkWLguRKMGB8isw
         iY8oKUiDqEIdC31u7N00l0TcFbl3qJsdM8YtZLuARXYc/ql1aKMdaD0vhx1PBBpLyVV5
         +5rg==
X-Forwarded-Encrypted: i=1; AKwUvBw6pFkyFcyDtS2CVFiD45Or0R2f0pFe/NVW1KSeCT3fQY1WI4WMsEplSzYYuaEAcmWDx1YCnMT9jOUzphI=@vger.kernel.org
X-Gm-Message-State: AFuF++mhu8k75506nZt+IxLJLc7uUTiWmetqY8Jexm5movsnS9eqKu+M
	LvhpSxupFg95FWGBSyVJimN4m7vM9lQWSgQZljsZtELmQjZ6lXXUJVuXXAFgWiOBIPZyPAVIKm6
	jdGnl2lMh3P202AWaq7nyUAvKghyhYYWOMs/dRnI=
X-Gm-Gg: AYBFou3oIw7bZJmSV4DSqhTk6/Qeycr6bbaX/HS+8YdUerzxbtO3P2kPB4Ek4WqRDaf
	w5kjZUnziIcOe5yDN3BS078PTMHZAXAW4R2H1ylrchfgMD7viF1HAdQYG6YyAJtr/27v4b+KejF
	PfC2W21eK6FW6qWMd7mVqaaTaiYNc8FH49RefrFD6twnab2rwn6xoWFAu3q5v5VAW7WydxNL0b2
	4l9TegLdBFIZlKRerfujURRxHaQyfYvvsVX/awKr/zKeueUsCx5waSrA9JbX4QHYUdKbsfjD5YY
	Iw81+WPMTepOr8Amtt8lGE8opl6ywcXtN6dSEE30W0Sw2wckojTCyVZrDw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:324d:b0:6aa:4d8d:a08b with SMTP id
 4fb4d7f45d1cf-6aa5316a711mr6298513a12.14.1789997288686; Mon, 21 Sep 2026
 06:28:08 -0700 (PDT)
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:28:08 -0700
Received: from 292895732794 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 06:28:08 -0700
In-Reply-To: <<arEkgM15qewERAOJ@pedro-suse.tail5790ac.ts.net>>
References: <20260725182628.221603-1-nsd.project.dev@gmail.com>
 <CAFLp9PEQQVuDpJPwrNvLN1-u3w3TMwZPUUrf0+rOBrvDjBBf1A@mail.gmail.com>
 <anlByPDZmvEhWeXI@casper.infradead.org> <ffcij36vnozf3rginqd2opd2dwqyki7xhtdo4veuty734hhgba@utjav2k263o6>
 <nsd.1787001235.35928@mail.gmail.com> <w7vte4itudtkw2yf4vbmuofiumfffmp2y52dpu2bqvqtdgjvpd@5femyiozss3e>
 <CAFLp9PGkVYZcQT5qAx-RKFOF-urZ92m417zpAeF7ZQempbS1HQ@mail.gmail.com> <arEkgM15qewERAOJ@pedro-suse.tail5790ac.ts.net>
From: =?UTF-8?B?YXloYW4gYXlkxLFu?= <nsd.project.dev@gmail.com>
Date: Mon, 21 Sep 2026 06:28:08 -0700
X-Gm-Features: AcwNN1WBEO2eUe_0S1kQSTFGaynIVHRfEIP-ijo60mrzoXWfLkGAo2lMMObTUKE
Message-ID: <CAFLp9PGgfLJtqeSaTqrG0jcFAu4stP0og4Txy=ewCw0ZxFdCMQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Neural Storage Driver - learning page cache prefetcher
To: Pedro Falcato <pfalcato@suse.de>
Cc: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the heads up, Pedro, fair point. I had an LLM help draft
these mails and it shows. I will write them myself from here on, and
noted on Assisted by, will add it wherever one was involved.
