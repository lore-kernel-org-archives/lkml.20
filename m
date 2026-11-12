Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487121;
	b=T22MUpDIot9LFhKdbZcJQmE3/DEMIBS/UDx2S9H9kzZ+F66lpIFu5Gb68atI/R+mSBVp
	 JwRaYvU6mxiMC+oHjpYdcX7sQqC0oY0DyNLeWo6/w75yrb++dTYkbqZXppfMtlU3zwAEb
	 /hRM3VVqJghEQ1YCrRhqO7Q2mbhG7KbvaRJkF2KbhMTdDtmc23SCu2mx8I6Ik1ZwwK8zn
	 DV/6972+jIIFwZZFXZxp32/GJmCAAR2FtHAPlX8sN0VG3hTdvskt2H4C+o+bPx2zPcQQp
	 yDKAuvctx14j7qQB/dPE1ff1gJiqFUVZhIAtrhs+yA7qze87/wOm+XCNLLD6CRe+0Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
	b=TufnlvTtPlnVAuz2DZHVWereD6FxrJRxoKsIcKdO0cuwjwxjssRgxYGxwFTHjwTCm8Ib
	 qyc5cfb+Qgx2/nIeUDJT5AoRPZY2f4Ml5fbH11NzHpJM+SmAuVkxEXS/30SFDooE1PV0g
	 RCi7GkRKom2f0j+MJedjHoK+L7HUfAYD2DnIHon8I/xLmxF/xX/83IQqtZ61HdJ9QjSW2
	 LouE+jJmQ2Guiv1+44xBkDJmaPiKLwv+YYl2Ku0OfjV+TuSpNTybTlx5b6n/6A00vbEGk
	 oSimypOQ9fLu4vxNyJgHEPWI/VJNTfl0zACRrpTFZ45RLsA7x6gdXQtGb8am3Yo32kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="K/XrF1+5";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A78606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A78606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K/XrF1+5
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so4150551eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794487120; x=1795091920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
        b=K/XrF1+5uQeap9pI44P2RPX4tS2GuaNG9a3B4XiYyNz2g5kYkyS1mb6fEnQnNet0/r
         8Hdb1SoLF9wDC9aBHqNWb+evQNYbf9k/eOZmSo6tZ8evUUZnWi2e0Xn6l0CqYgFyierW
         dTkswGclAbjt/UzUwT5OUOLwjJhg2O2Pg7K+GOdO6pciJPqXixIPbzVOPaFNVYBNUt2p
         /8aJJ8i7jPVea41VNU2UVSyiVszV/UHnVXNVHfT0bMbgJHME8xFBCytunzLSl+XGW/uT
         qENQCu3U9Dz151E2bpyakraQOj21EMCH/RLVb85kJ1EQsNIU9yrhxvBwSlJVvUrIfyr/
         t+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487120; x=1795091920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UK6/KKi1vmJaH5c+RsMG+pBls/fTxRgXLxWMTuXdtA=;
        b=1XKSQhIL/y+XNvHDpJn7L4BrM5Bw2TJqnbJh5AxRIYUHqo1779Jnru4n3CF92zsK86
         sR1H554OzXALeOPto2dLG+ibaCWsqWDTmWG4ABqcwFk3p8lTRvG25gAZD4sO1eSW/viG
         66NLawbQzsoItCJGP5nCEUDf6Zy83A0LbIVuJk0R/GuBKi+OKuOdAzleQqnrvvuZQbt5
         m1xjM3mEUnKkJAVZViZp7mnUExnEtFX5B0tz5dhXhSTuXBAuqMmFF0ce98AtwJx1AK+R
         Yr/1ogpDQTbkiJ3i9XP3EjFB7yYnW4pxZcZkQNieSu68dXUKrPZFxI9tW3MuRR1uowLA
         FWtg==
X-Forwarded-Encrypted: i=1; AL+hErFkTATji5fFpY7y9kSUgKqRsjdKDtjw2/exp5Ee9dZ+gmooqjO/Mhu/c+RRAdhYr+6q3E8Vt7+8WlP9XVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YMrVMXLLqQ+4AQLC81OIH9yoBdNeRy4vkDT5eHtxMHE4v1/F7
	EW4PI3FpCKsHxm0srcmBAQ4iyRaryv8c4XODuhuqlw6S4aouHTfeC+Dy93doiU9p75haJO4etLp
	DTmckPd/Np1KW3aLh/QbV9Jgz0iyYaA==
X-Received: from dybcr35.prod.google.com ([2002:a05:7300:aca3:b0:36e:b3e6:ebe2])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:65cd:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37686176002mr6158828eec.20.1794487119392;
 Thu, 12 Nov 2026 04:38:39 -0800 (PST)
Date: Thu, 12 Nov 2026 12:38:38 GMT
In-Reply-To: <2026111212-unearned-strike-a7a3@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>
 <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com> <2026111212-unearned-strike-a7a3@gregkh>
Message-ID: <18e74c87090a4d29.3137322e32332e3235332e313736.1e2278.0000sendgmr@google.com>
Subject: Re: [PATCH v3 2/2] rust_binder: account for deferred work size in Thread::read()
From: Chris Wiseman <chriswiseman@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 07:26:30AM -0500, Greg Kroah-Hartman wrote:
> These patches are not "threaded", what went wrong?

My wrapper script around our internal sendgmr mailer failed to capture
the Message-ID of patch 1/2 and stamped an empty In-Reply-To: <> header
into patch 2/2.  I fixed the script so it fails closed on missing
Message-IDs going forward.

Patch 1/2 is here on Lore:
https://lore.kernel.org/r/18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com

Let me know if you would like me to resend the pair properly threaded
as v4.

thanks,
chris
