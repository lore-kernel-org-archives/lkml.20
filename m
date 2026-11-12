Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524283;
	b=OFpOIu2Gyx3/pN3Jg+6D232iiaQrOnASeczB5juU4tjUEy8whPRWJJpA37jcNCJsxyXU
	 9tUpd25k+1cMc36xiWKHsS3LubF40ToDIIa0Obs+nHe/djbPNLIzLHQEz5oLUkwbafkeE
	 l5/OhVnu3MRzNVFCiCINoDjxlJV87DB5b8m1DhCLQsDCIuAAh6bSqjCupXRhDgIRPwYsx
	 l8kSDNsg6lJIeJKpOVJs3CdWSZgjKtEiRsYlxsy/OtpmwjCzdWTSMqXGc/c5+PqeZ7Q0w
	 /3YHk/FOsQ+DOkIh58DXN66nP8GUoIOS+W3nK15+icaSeuGEXH3UyAXNPmLtznrId0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JU2KdlNCWChtwOGEK4t+3b5U2FFf6L0dWazuccFpC00=;
	b=wbDJ4ugW0ot16s5PFAoBloTkqps4Qupl7Jehppk+HQhnfJSJp0W6z37kKRZ+e5+L1rpI
	 qmXiXJYT9dx749flhmyQtJgG54N2iovnORHm6F91uN4Q8/JdOy8B9ubhVBY70yHYX69KQ
	 Ihg0V85RRJQJ+5mStGgSWmAwbgnZoVvGmCuOAOmp5xnLBXNSut/WdvxiqOhH4jt+L5DMx
	 hbK8XwvcugXqMscM2aMj1IQKYkUgUGpXdrKF99I/FLW92rGlPVEZvHTwY70VQIuHLcLIO
	 5nsQuDDA4eUcwuLegICJAO00MFM1zMSmi4ZRDmL5kylvrAdi/XxqYMlUGjKYUOde2Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLzKbq0S;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ECC606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8ECC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dLzKbq0S
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso99708f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524281; x=1795129081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JU2KdlNCWChtwOGEK4t+3b5U2FFf6L0dWazuccFpC00=;
        b=dLzKbq0S9jffvXmHMq6+KAu1wJiPnl6u+w60yb7r5b9HWZblYVLqfAvYuYzo4ubX5o
         yJ0U48SXMhYAfvV5F0J/XJBqSfTmDENY8FJ+bFyiBgp7tKwahFq9RSmeRh4QhzF93OZP
         +0CHO0X6won5A3/Mly4fNV0++g4NAKTTVF2XNjwajQyNQv+YMPMbdp94Tbh5g5rzg4j4
         J2KTGtx8P/jPq8X+fvW1h+WRjVI2/kT6fT6EolOyGG1XAjTX+rWBMCuspx/bKLO4iD9j
         IMWZBCmP/5YtCx3ISxaGrR+NngPSUqb/r14cqDltV4gOoGPvmJDXQ1qcqpdipltnzpaV
         XSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524281; x=1795129081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU2KdlNCWChtwOGEK4t+3b5U2FFf6L0dWazuccFpC00=;
        b=R0SdzwZVqz7LAxM86vrGkiTurPCXvyotaKaUEK7OqgRgAwRlrNWc1Exl/z+6HsnsLn
         iPVR1wxmh2XB91+SxoOLK8/JCMKBpZWrcP54ECQbz/KvmQ0Qx3OBpHZwPmd82IvqNvdm
         8aV0T9IZcr+6s1ohapA5cNcN+cH4ycZfhyOuSlDPMX23DEmPC+q2shDKoPclYQVkm4fS
         0L5grsUQKFQiPCHfj3OrNvSP8YgcB7ZRxEm3uagqKeMNHZ4VaGo9/rVtuZnOg32VSkjx
         pjrOQH3vfeWwaync9yhcJV9xQQ6Z3O82CjIsEP8grfP7kqHa2izC8wZrlcXOkmsbsdGh
         lurQ==
X-Forwarded-Encrypted: i=1; AL+hErFHSuIibB1P3OaT/zvLGqMg2PF3dh+PIg9qIdu+0U0B8Hvf+DL+lNv2TN0zEQuiCT3/5pmXA6BP1rQPx8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sCG3W2SpGE7JGWlOpuRCjVlmFHzauEL+uD2CZD18c9aSAsdDu
	T8RyW7mAwUajutZvp3TdEtkKYTc5GyHShe2gdv6mBqG4qouWZ51M1KXQ
X-Gm-Gg: AYBFou3FOHHcryGNh4zTKbuVrbNDUObi20hWLXStX/4JB9RUBFUP5hXUt6rfAPWoJjf
	RnebzdHoWtCIJ4YYaspSEFuRdjy6zGiNzmlq3THhNj1OfZ4XVZBpXnrfKrJwd1Vy3HmRPvkazoN
	njflSLvUrlY1pQ6Zo6n7P2/o3wxZpTLGL3ZIVuCjLI07+pO6wua+fFfKjRZ8VZqIQ3EO7WRmrp+
	1m2HM/QRCJzbRgcCaHNqGsFP8QB6qhnlfreZLF41admdgRc4w6/gh1VsnfEpZrZHPHJJnw4/xaN
	qawwb2irfZcZNNR6OgdAIcRNcFWbrK0jf4QqDo7XhznDRTRjdjgADm1jdQVhXlym97VAcnjHBo9
	EMasX6PAd5LdDvS/06dHHqB8eQsg9gQ0bhNCjHBfEYepNw+NVuJRrlvqOSxZns+SI37G9591LEa
	ms+ZLvzOnw+XCpEfpA1eTRSjh53YgnC5c7eBIHGteaLNo8m8VLwlWV2xev5virWXpkLKKGB21FL
	fVtweWC2tIi+TG9PBkbiFUiuSEecNTnBscZKJDvt9k/MtlKQK2PAhXE6HpgweMEkaEa55Ns5ajp
	OPpuFT5H/SdiwRsTF9lrLmwRXo7tddWvm+kg0PzLFedpn8Ke9LY9K2EfIBHR4AfrJQ==
X-Received: by 2002:a05:6000:2587:b0:490:2bd4:5c42 with SMTP id ffacd0b85a97d-49c7353bd0fmr1523749f8f.44.1794524281035;
        Thu, 12 Nov 2026 14:58:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm2000159f8f.2.2026.11.12.14.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:58:00 -0800 (PST)
Date: Thu, 12 Nov 2026 22:57:59 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org, surenkj@amazon.com, noodles@meta.com,
 kernel-team@meta.com
Subject: Re: [PATCH v2 2/2] tpm: Disable TPM on TPM_RC_INITIALIZE
Message-ID: <20261112225759.67730166@pumpkin>
In-Reply-To: <20261112-tpm_unresponsive-v2-2-7454d2c899ef@debian.org>
References: <20261112-tpm_unresponsive-v2-0-7454d2c899ef@debian.org>
	<20261112-tpm_unresponsive-v2-2-7454d2c899ef@debian.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2026 04:30:18 -0800
Breno Leitao <leitao@debian.org> wrote:

> From: Jarkko Sakkinen <jarkko@kernel.org>
> 
> If the TPM has been spuriously disabled, the game is over. Let's reflect
> this truth with TPM_CHIP_FLAG_DISABLE.

Shouldn't it be completely 'game over'?
(aka panic time...)

David
