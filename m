Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716028;
	b=Kn4Iin2qiL1v/OFAOiGhO5b2ap5U6f/YuxzO0pAFL2imxr394ejP+zhMJ6ofGGzoEq4T
	 pbZHMdK022v3ZTQrsKIzWzWm0oJ9KcnQWI1ZJ0KbFhHfN3aL42PG5aDhQZWCEqYEANpwj
	 hNiZV4pfj1vAQNSgEYe/drkA2eq5wNVCQn/reLNaRYWp4esVQn79BnOo2MsU6lWdzfVq+
	 j+cZDSVAhbScSaQYkVGOfkBc3q9rCAiwOrqkffvzt0S7iljJ0Lxdtgfjh/Kixg6nBz8lQ
	 yTBvIwgCN8Wvv1PT4q4rrT1yMbv1HLfmM28ZQ5b/CeIrJOoWy/6qDZuT+aKKWEEvhKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
	b=UVgoL3Ps27s8Jfvw+qfoT8WHlbVxXdNk6TpnqyfbKE0kyS5AAzYSBjMRo87PorbDQJHb
	 iqT0MsuSoa7jE61RLOcX4Wlt9alWSJvY0Mtw2vXRxxIbowOhWeJZvopEuXWT0eGWD+Uo5
	 AUmgakoSO1Sk+OEUoipncEhooxe/iS+nZNr9hNCz6TDrW+QHOro46HVgBT032eQHW55wU
	 //wCrfydFL7ghyncFdnn46rDVRocTXJeNyTT5O3wxri4aiPnM3pye3WKKcZe5KDoi+sFX
	 8am3DBYCaCAYSlA1EGfsJNAIudYp4cBzmXkrAhpIYzygWDFHSRcerqm5spBQ2hsNSWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="KLCb/S7o";
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510E606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6510E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLCb/S7o
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so338374a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716027; x=1793320827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
        b=KLCb/S7ocuj99JyVAApM/6QDX9Cz2zbxPrGTyACgHjD8EXkNbW8hpspKv0Lypr9T0u
         wtBN1hqypTjgzlYM1TfBFBxk313oO+wR7scKDe4hYdEq6AHqBh6bI79FtvtTxHw5ilPL
         nraSxLDgL+EZf51M9LuatFGFCZs3FbFYJwJEJPTQ42Zn6ajl6uAw8qaz0GdB1d+2pe/3
         +4S2FuhwHKJCXEOU8tARFmhEvLHWIU0Xmr884ARrtojQx2+9ERO4bJv5Ke/1O9vyP0py
         lYdyJXRqMPcJRywjXiBUWQ7a7KxNvH4042q6uLRwkp6MQYcUtKzZeL8T4GlOM5Q5sqM/
         SANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716027; x=1793320827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
        b=jBYEse8btjJwNlIGwRapg7FKCq0/cXh7LmHC/GT0Nq7THJd3zB7N9vODr6uJJWjZTN
         wCFsmADsIPdRTV1rgoQ2oiPOJp0kdHxnWWEw685CPkElRIM2+zrsyUNpNH42JjwvkdE7
         LSJgRSeAtPkOeeCO8LKyLOYhBqkeUX4vk3mMfmWCq7qryLaHpenZB7L5FLXsH9LJ5sVg
         OEeY6Nf0JGD2PbLaMQaK+iKVLAzJvGXVPbXzkV6VGXWv5kIcJpIrOf1YmuIbPKlg6+tV
         c77TNxTUElbbW4fCGF22CMkF99l2+KRsL+kFgHu8XHMmXZep5IH3ocSsCVICUuVtjjtk
         ea6w==
X-Forwarded-Encrypted: i=1; AKwUvBxEg/FacxTXXwh2xaGCncfrGIAkOtyANkrQrpQ4S2Y0ci2ihm9kl37Lg/56kqRdTynAA9fhbID2Da1SIVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlEn4g+9hHMzyBTq+6PVcHbqUEWbA6+U8VXuprypmJupkJmpXr
	yMrjxAmYQsPW/NohG3ihUptcyUmfznlJTiY5aZ6XuFfP0tX8S+efqaDu
X-Gm-Gg: AYBFou0ep5+o0l7+i2346VJMG2sp92T3V8QIzeZZLnF8jYrwCyvJg7tHH5l9q3DykZu
	8pIjQ+809OaeUcIuD4hWsNJYgtHSv7GBRn6cFDU5UrIQL0dbjp/tZLhNsOyWC7f99uReykvG1k/
	oTTSnRlvVL08dzPF3g1EX8tXgQyul3q/zmaQAXD35Rl9yYnF17nCsLGPrB1hLZ6R3Naft6GsMTd
	lZwNrPWbaKDZmSv/SSeddUhcPxovbB06Eqvx1sJH1UtuMvlIbN2Ppjj1gLHh7if27ZKOKCnj0lO
	rsfCK6o2LimLyAkAnCvcLLJgCDlVRtbG7NHYJcoNAQSy413HcJDKf/SFFPmonQLtSfRFvgGVuyL
	EH/Itx14HRK5tdUR5ybylLvewdA5liQfhtNkBp7zz12F0b+N+LVkH0Wk/W2B8h6IQFaIVCFg1U0
	XH/EtIVGH+vgcSqFgDzM0doC2Nmz/nn9nBcj/e6Wn2UkuzRqMwSJyRhojqKL3QjG7vAQREllG8h
	WJkbv+YTxs1NNn+68GTSiTKe20DbnV2fnGtNfzaOGI4OhkCcQdS2EUCjkg4WZKTKihRRxTUZE5E
	hUm46e1Xo+7+WVPgEHSaMZQfCkYhAj8dPhhY6Osd
X-Received: by 2002:a05:6402:e8d:b0:6b1:cea1:a011 with SMTP id 4fb4d7f45d1cf-6b432a94c76mr1525699a12.0.1792716026746;
        Thu, 22 Oct 2026 17:40:26 -0700 (PDT)
Received: from localhost.localdomain ([45.93.75.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm426013a12.14.2026.10.22.17.40.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 17:40:25 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
Date: Fri, 23 Oct 2026 02:40:23 +0200
Message-ID: <20261023004023.98453-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023003855.98316-1-mike.michalo@gmail.com>
References: <20261023003855.98316-1-mike.michalo@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, this was re-sent by mistake. Please ignore it: the patch is
already in ksmbd-for-next as commit 0fec4c24e197.
