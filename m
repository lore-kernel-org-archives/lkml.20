Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714964;
	b=03fYw8gnnN86ckFHZLnt2M2cNF2hVGDyqx1JepEmqi1yW6Kx0gaPuFYOzuCvm9b2+kyq
	 TBtsV0un1eA7T8cUWZ3ixTRcJ1Lg+O0KekUJoG18FJ5fasSJruFRIosBx3tj+0DTqCM8m
	 gyVTqMXVTT5At30TENiynMhR2B60soXBuFtxvDEl3ySSrLnG3e2rTSZTBYtzWpQapp7Yz
	 w7mfhE3+DUAfuRi9uLUiFmOXFYIja13LGIBIAOSI9ywG7Aff+bGVDRWxiGteXzvoULQ1G
	 JlX9rtjui/F8XTHTAIg3LtBb5joveTTo4mOrY3TllaGWjtonqCPiyQXDHFUmU5vJ2eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NQEmaoC7qVxS6XvHOnYxy5RPxkM/mcRmN7qqE1HnMCM=;
	b=yf2T4fPOskyV8WDg+mB+0Z3IYJ5YBjek8usjHEJz8v3pDnSd1IYvVFsoYbP1H6KYlP1y
	 fB98EI1wrIp/gpTm5x54ocku1QUq1NlW2S5BM3MjfF8UT4ECKi7Mwku9398KJTnQBfMtL
	 vXQLeZnhjYvq1oPq7VerNcX56Th/pz6YRkK+lOwzfSrPt5wX9m4pYlD5aPeOazorHrqsl
	 fS6XuebE7alqluEWuk094NgoUe8AF0EvyOftBxlH0MUbNPHNzScwcY90ynOuqpU6l/GoP
	 g28CsoaOaW97xrFbYdEt1rUxwMuk/Ye8QE86HsaSIhBkYwKSMZelNkSQ0kYMJPGdvGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J7JDr+ei;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82485606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82485606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J7JDr+ei
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1740089c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794714963; x=1795319763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NQEmaoC7qVxS6XvHOnYxy5RPxkM/mcRmN7qqE1HnMCM=;
        b=J7JDr+eiO+gQ3eT9qn63Yn4awr44BpD8za0ph81R/U0f/AJm+uxQacIwv3PiGwPtMS
         uzvxRdvs78I+LRdm0WSx4Q/ZrCab2qwr2KfXqmNBsNL73vjcKrQEyi88jaB1lz2ZQbGn
         9KdMx9K90VknzL3z8mwNBCn1AXB4lcEtPrHZqU2NQ56akAm0yOYaX+3FQr+zS2ZvQ9LD
         rK4EwVTB3wIfcNgPw20b4As87lP/KIdO423ia1Cffl1cPP/tieGVMBZzhGaASHao3qFb
         sc/gESnlQdFBD4YMg+5a/ByJX1gnCqRH8KFb0Lsz4idGAhGJCbudHMr25u7bE5gc3sNN
         UCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794714963; x=1795319763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQEmaoC7qVxS6XvHOnYxy5RPxkM/mcRmN7qqE1HnMCM=;
        b=xLDfGyXFuIvmREU8gmSNzJQeH1d4acEb36qpKcklEhCGstWYP2/nwdgV7mBeFiLffW
         91b2akMXZkUokOGiyWWlImgR6LxbAC11E00anAqYTGjkhRez7roKY3PsGl8L9KbCFVaF
         rYPGS3nholemzkIqsCBwo4lnGQ7jPS6vFXY8+ZkyuIYoGBr3UCJHnRC1U1Ibr23OtEbn
         OjiL0naYwpqAxinWVxfrbyDFPlY9dAWLz4ZhzNwAWRVjMUCblWFY/ZTo3f5RrIBKElng
         n+y4+XZQsQ9vmCnJXRmUM5nC8ZozzIWaY7eNTwt3FjSrJXwCqFKALeIb0sVwCQKSuvtX
         BF5g==
X-Forwarded-Encrypted: i=1; AL+hErGRx24UiadPlyYW9e4RmQ7Rov9wwifAnuH2JerDVz0aw7ZgWo/wfrpjakhL/umGRIQIH+jUmvo5dHqog8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6QuUyPrYJJ9GH6IUqgJTFsNG2XdldBVWMDSZ1asiefqeDuhJ8
	OyfSa2c8S5TFV6WP/B4JW7kQapHsBDT9wW7+jI1MFhnrmkqOlXW/84w47ByuahEXhYc=
X-Gm-Gg: AYBFou0Dl8fBBOQYVvyh92/j7OHmw7D68Pr3A/VYIqyJZf4F7RmDs8Abrdgkvko4AIT
	ADsQAO0yqBlxMgKsoUrkFqv2BQ2EzD3eCZ6v50x19JyR7parnesbSD9TM5EAqtaRfTfcKF0gZfu
	8si68Ewc4ux0mr0BvxadND++QS+T8pgSyS73B58Be2iotA1qsxTh3zAwupeWemgR98FZq08fFG7
	7zyHlgeIfNt0DVHIEMrt612wufXGPbovq8uDUaWm3ZJvzmVbiwlFGL7YiGtvo9tyBu0njet/u+G
	uowlHWcEPC3iMDxpoG4CPMbKFy/y+fj5Co9CtBq3/MTgsjx1F2pJqm7djwQIMYYEOul8KTCldpv
	uHTDCmTufZai8iCSTqylWOedwO7BsImJFI6QrGSSVqCtutzqZUcC2BpqIInWJz7PheVXC7iwY0M
	BpfHb6FVWwC0k8DMDT8NISiKfyg+bAQu+37AujfjQViXMd8G1uCzPrvsIuG7/1IkVNgWVQ5vZnu
	d2kE8JPknMBn4ZXnYvYZRQREdjLnOAXKN7XRooxXQ/yR+HG3+57poUHSbmUG3Y6pQkwHmN7tNhy
	q34e1tFwa0S121toDchAWrvr4hJguTk7/dDGZmY/NBcEKjwl0wDIzrdEbQoXEVjCM3UIYn608Pv
	ed0J5i6rdX3eE+sAGXzSWcWW7+RrNIazKgRX5TRsdtP3vrU8tzJYT6ktxJDh+oT6rSXNoJ4WbEP
	PCgeMMFhsbeb56TGNtlP40J+wp5Be0n/Wv7AmPPp97XpmevXlUMeWsLMkmz4V4vW0=
X-Received: by 2002:a05:7022:1401:b0:1b3:a87e:8040 with SMTP id a92af1059eb24-1b5030bb56amr6063090c88.20.1794714963419;
        Sat, 14 Nov 2026 19:56:03 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b27dsm19457554c88.2.2026.11.14.19.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:56:02 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: accel: msa311: use devm_mutex_init()
Date: Sun, 15 Nov 2026 09:25:57 +0530
Message-ID: <20261115035557.178492-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115020129.10259-1-niloymeharchandani@gmail.com>
References: <20261115020129.10259-1-niloymeharchandani@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 14, 2026 at 06:01:29PM -0800, Niloy Meharchandani wrote:
> Initialize msa311->lock via devm_mutex_init() instead of mutex_init()
> in msa311_probe() and propagate any initialization error. Include
> <linux/mutex.h> explicitly.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
