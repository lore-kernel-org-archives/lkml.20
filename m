Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968701;
	b=ObdQ2GWC1j0KYUDh1a3Wkd1WcjZKusfQDmA95uySZLqjlBaze2c6eXhMQBV9vpntpzuL
	 NOHN3iCYkTjHHPOUTnOnIao658vZKKEg3PT/fYBukXC83WNluYmX8UK/nch9Ej8+hvnL4
	 st6I8bMzg9p2GioS+SsikkNg0goEyjhSr1nIF7rjhvzGPAignWORPgci7N6r6/yg4n05g
	 zpUycfADgfwrhE/bfc+SFjr3WvRX5Q3zEPrlb2xrpE+hjqYfqLlJzbYtt2ho0We7A2NZh
	 sS8cgkilDc9n3Od5no9q2lwshgtgcUYgqj7pWIZIgnPotmUB5/RNoE5n0vM/hwxoUfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
	b=iCRnwlzAaxCCUYAFp4BFcqpjQo6HabZpJbw80v6KpGDNcO9Omlbjjf+X1kv2ieoOmt3S
	 3n9PMuWgXb9V8cNCq7nDs5SFIaBZg1/k1+QXpLLhWmxEoeOFXRGfmTRrqlC+BSzVdwoy1
	 RQeHxziu7+kDrYwFwic+Ul4Vi5ceNjadu1PE1x8rTz9TdV4RrFn86k6SO+iwdjcndD8h5
	 NhR2Pc0FwYi2syv1/VYdsG4uC9hDIJarIP4GUqfyA0ZAXbNbYdOeJhWcINPKE+zGjmH1E
	 k12fT61ioZoMTXmy3E5SZlM5hV/fQY+pnvEkgSowox0SZ+ypcceFpXiI/sVAq2MjdXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PPnu9a4;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A76606D80F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A76606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PPnu9a4
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so465664eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793968700; x=1794573500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
        b=0PPnu9a4nMKujTp22muJ94wO+R7V9guocm/JWcpKOn1OnJQg7/2UJkg4ZsT5snJ310
         sDm+zhMGCLlJyAeKyM7VF+jffxNqw42kDBuWHXJqp9w3nSQ/ko3FPCtqmYMJeyyXhf9i
         hBQu8rAFHUs7jIqsRvv6I4CC3r6RMayq5Ezi0Qgt1laI7Yg3DSsuCugLoeeH40IC/Ay/
         ygOo1xh8QgsQwpjfogJMVbT+smQEXIbZE4psyLUl+/8LfcadHXj/5RxBezq3ZBM55nc9
         U7jo7p3j/jocDPYd66yVRuX/TcQOmr0543welB5ku89JKyKIcIQGoZTTKrL7Z3B7Htnl
         tklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968700; x=1794573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QsrEde8nJ7HRPtmUzm2UfXTLkbUTS89YPJDCTLgdY4=;
        b=XhwMRRuXEyjXXrOdco9yJE3bJdjp4PPBOOFJqXWKQ8urQsqmJpDpqt5xMePble0Kg0
         tp8tMT/mWIHCP3gQV9Bv41vtAJzwg9wNCF+bSmSdMNBQZOkL4SiIALAampAX+Aa4PiAV
         wOMS7MinKQSU7IeTxYCaBNbnDh33PjV+LRFCA94+9zDZsLD8kg5mwL52hUuRCtrLyROb
         sI71xKkgfpY7U6Zvyt9e8md7ivT0EYjntFqjQK4OGzJFmXe0+3CgJ/nTAmg4/inDXm9O
         CjA/gO9RbDUyeowZImycHZzO0sSC1e6jbqXqcq/LkeYdrKbvB3hJ0MZwEoRXB2ZyeiGw
         VzqQ==
X-Gm-Message-State: APuU4Z+y1BIhoVZB7eeiuzeZV8hMTPYfXgk3RNhxUFKvoweJzOcBNHaz
	3yeTyCnyMOHiDX0bIXnSNNkFp6Klf3Sfgj4UOLDZT0Tg+JpTpAHIs9YE
X-Gm-Gg: AYBFou21b2kC7hVjv+NogHXi8I7VdYWe5+SHrPmM/JxIEtlo9lZ5Z46tJeEmWSnENhk
	rtEmbuMGTg2GEpFltybgfZl4/FZd+upVoai37qXqQvbP5vG7RxZ+tt0PMxQBEnX5Xxx0ZDc6rP0
	xe7gEHqZf2Ovge4PcJs/vLazB1mDZDW+RjSmWyOWoG3t8aEuD1QL4n9Jjic6YbLesgSjzmxfUjn
	uU+quUOe4J2UWl6coqdC5r8hvpmgRiHmWnQVYwYDOIvjd363hqbvhlghRHb4br8htji8+ppup9W
	3NtNqg0+rz/VWyO6rIfvqqEQ8gLChsVKhUhgyatZY+ITAMfZqGHxri2YrxMEP1+BZ/VtYnyxOsH
	6OScEDtbSO65s5eS2ELstSggfo7VcUA7XgfKT+I2xG7y8yB5CYRakEuurrUH3iiVNRkvrYOK4n9
	Zf/FhHIANRqy4w4tsuZMzeeEy9pthFrnvbLKwrVAboiS2v7rtxoQ4XcFuU/nq7zw6SbemfFPujN
	C3QtZjOIZU6D7ziJiKfJtvEijG3M+T3mDhj/hMlMBHsit8EBIo2WwuWw9G371CBUSzwxmP78BpW
	ODQu3LhjRVdsouXagNBU2KMT2byOrQhk7cikEwkjDcFkoQG8XAz2
X-Received: by 2002:a05:693c:884f:b0:358:3426:d601 with SMTP id 5a478bee46e88-36f7398b911mr3264870eec.2.1793968699691;
        Fri, 06 Nov 2026 04:38:19 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm6411411eec.26.2026.11.06.04.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:38:19 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Fri,  6 Nov 2026 12:37:50 +0000
Message-ID: <20261106123750.2981-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733tfs4cg.wl-tiwai@suse.de>
References: <8733tfs4cg.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for reviewing.

I added this check because I thought the available frame count could potentially 
differ between channels, similar to how the alignment is checked separately for 
each channel under CONFIG_SND_DEBUG.

I understand that the ALSA plugin framework normally keeps the processed frame count 
identical across all channels.

Is there any condition or exceptional case where the available frame count could differ 
between channels? Or is it guaranteed to be identical by the plugin framework?

If it is guaranteed, I agree that this additional check is unnecessary.

Thanks for your guidance.

Best regards,
Sreeraj
