Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219072;
	b=tDaBc0FfTkM4yrbnQo8VPeDvd4yBbFsE/Xs54cPmsNqW2QGOCRt1U5czoymWIv7j5wCF
	 laicBJUD3mI1yU9dZE+xKkLHqinWgmE0a5q1Htz3issNLk/8AYu1KDWMV3r0sVPXlem1e
	 oSUlYYUBaOt+HnaM0Jyduu8HQ86qxn32qXsbmB480Oo4wOicGBuQ/YYO8kznJVPZQJng+
	 uu5Hj8VcpZLpj6SKUtUtQisPUTe5wJRUrs9ahGAou/5rNwqmuHA+I2zf7+AOAc6Dwp8js
	 wyPYQQfzf4vTxO0ePc9Ix2qqz9y7acNrs6/YmAfpHOqDB39PApso98Pf+nw54Q4a+dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
	b=Cm7RBrUK+JINU5PQcZXKrrMSzAM8sPbBbza7GcYl0D9ni+6PsZmSigcvnR9G4rEbTX1T
	 zhPDgNz7H2ZuuUmSNxdeWWSvIYLjZfjOgx8GIv/CTAoMS4APYddGyEEkXHiDZbb+Ju30B
	 pVctVeCGMaUlWUG2mJ1SuvJdbIPcFn+zclMyHL0SC3rEArVufDNtvTRm7J9pwZipgQPbz
	 eWVpdysGmtSJX59ZEn1Nb6V8iKLXHJIf3c4D9JKLCom6u2KSS22fi0HANgllozKXpkrW5
	 cZ3Q+BJWItDadcOABTG/FctT+Z1IudaI5dB8AD09zFKvGBdBk4Q/t2GvV4PZHFdlMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CUXRjv9P;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0131606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0131606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CUXRjv9P
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso868582f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793219070; x=1793823870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
        b=CUXRjv9PZSBaRi4Wr5D8+F2lxZ45eA+WHxVPHavMmQwNXaeV4ess/InR84ibks/mnX
         aU9I6nKsVRlRaKBP9vrQVXkJiHjpN1cek6LE3Xix9Y06b8ZWe+QmBMosbkVgJCCf1LQz
         Sb/cpp/y5p15sN46rRyYK9ZwahZk9BPH1tjoacBuCjdRipjylWbNrDmF8qVwuhAlryI+
         GVyclxvFwoJ0lUd9cCNoxYGp4QxoMDq1aKRq8lOSWgfveIDS4OIa7aQ1P9jYjR7eVqKa
         LNtqRjnGYpJlK2m4ofSEkTGYlXQ9szu4c4akgBBTB7irBAN5yNng/GEjJuc+v0i+uUsp
         nCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219070; x=1793823870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
        b=gfcMs95wzwAGnsNYDoh53tCi+Bxs4bcdKMXoDeTs2LQoR1gx8pG+RDp5NyjgVh1fKJ
         nI9uaNMaCCy6rrmDyk17zk7azo+A11s5arqoLX8jIUa1nTuhUoxMam6kmNk/VOVqNnu2
         4dC0CVWIGqZFOK62PVEvzepkDQcgEyUoNr597zZR7jUioSieA0qwuA2nrnOUwmUWLaYZ
         VYlM2b/swVm/4W1bkTyYbbopJ5CQXQsHjj2rDVCUHKb7ceWjRx4rZKypGgfiVbN7BFXl
         fMNy8CxvTOs143tLS4/HGPzwvh8BgCB2pW4sxPV22x2sLTJiT8aFQHYom1rRPbG/vqFV
         3I4w==
X-Forwarded-Encrypted: i=1; AKwUvBxoXu8LE/wzrM3bo9wXm4SfOEn9fkvcYfQsUHVVn5qs3MR38n6iTBqbnVF7pj5PZZgrkgK6kRqu14KlDBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ9rv84xlmWmHabvIo/RQsg4fJwdXQPN0uFG4XGYINsWLDLvfX
	2yW/+90e3cr3YTWOm5usFpgKb5N3/YrvQMEYIGho002DgkFrXvVc21LMm0VtLIXzFw4zGnZvSM4
	PyvGM
X-Gm-Gg: AYBFou1bIUH7GZx3lIW9sZiT2Qz1iNbt2u6jNJJLCQtZZ019sopxoJAQLMMzJ5Hlt1H
	Z7NOfpdYYLtAHpF4DOg31hW3rOkoMuJLphpInJMf5v9UZxj55fRMEfcSyfgdWjXLlJnGJSKoaCp
	hzFGGzVnxwhfwKZj2oHwFgKmp897jiUUdGvJvB4fcp+KJ6QywIiU0FE9sc90RZKPL2ExgZ/pCWF
	bynNph6jkIsl0mmPrRXx+dnbxDRUUraYaiVrE1u+tfkyjIdmNbdylSfW0lej8r6BuZt5TFiwiUN
	pS0Okr/NoL6u90EyTzyi+SH1hdaZHd2iReVuRhJugE7aXbEPQyXQBRjsMdhUcTNY97CPguuHuVN
	16m1l1DY6ShiEsDiftPxp2BBjcTH3tHrbHTS5L8tPtD7zfkxfUv5KW5ld/Z4zc1ihJL5Gg1gH0w
	VtSRE/P5fZB44LcHkUEYMbPw0TVbCNaVBRc1QnRTbfheKUUit1VeFFvLLjvKwja8B2uoDwLRFyL
	0Kxutd12gZOaE6C6quxOPDq2qi1slSn8eYZtY7U0oB0WnALXu+0x7MvMqRrTjZzyga7S4erX86S
	A6u2dm8Y8UL34TVqjywexfMG6E1zBlfSWous+U7FLLiGbbvSMpcjAaoUeUFCW2/GEw7RyneLvSU
	zmlAQm2jK0Ls=
X-Received: by 2002:a5d:5d0a:0:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48e5d58cca9mr9393565f8f.4.1793219070045;
        Wed, 28 Oct 2026 13:24:30 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm28563439f8f.7.2026.10.28.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:24:29 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: Frank.Li@kernel.org,
	dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dmaengine: idxd: fix crashes in the probe error path
Date: Wed, 28 Oct 2026 20:24:25 +0000
Message-ID: <20261028202425.1144329-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028003708.834341-1-jinli@purestorage.com>
References: <20261028003708.834341-1-jinli@purestorage.com>
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

Hi Frank, Vinod,

Thanks Frank for the review and for pointing me to Vinicius's series
"dmaengine: idxd: More error handling fixes" [1]. Patches 1-3 of that
series cover both patches here:

- 1/2 (double free in idxd_free()) is covered by their 2/6, which
  makes the same change to idxd_free().

- 2/2 (destroy of a NULL or already destroyed workqueue) is covered
  by their 1/6 and 3/6 together. 1/6 adds the same NULL check in
  idxd_conf_device_release(), for a probe failure before idxd->wq is
  allocated. 3/6 removes the early destroy_workqueue() calls, so the
  release callback is the only place the workqueue is destroyed.

So please drop this series in favor of theirs. The one caveat is that
1/6 alone only covers the "never allocated" case; without 3/6, a
failure after idxd_setup_internals() still destroys the workqueue
twice. If 1/6 and 3/6 don't both go in (including to stable), 2/2
here would still be needed.

I've replied on their series with test results.

[1] https://lore.kernel.org/dmaengine/20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com/

Thanks,
Jingyi
