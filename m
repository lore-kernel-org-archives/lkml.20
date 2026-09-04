Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D742218ADD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535356; cv=none; b=tYTlDYKoKrabMOBN2oN//AHeAN0RNuBGrhZHBMD2NDvky1CtxrXcbzAFZcYMCsbDgi46Tk5aU8cETjVWxfqbTy6ROl90sc5fLemH6qKlSkc4tY3cqBz/RxZ2DhLw+MhkNKugIhZf5WVRsnUBR1D57vUzz/lvS3AQSuA8c/+Rp3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535356; c=relaxed/simple;
	bh=M4+ki+Py0psA74hqxlO+alXPMyKGmPPSW1IzTNtzjz8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FF1Yyqaf20T3bmbin9jO69y+QCpYpRp77CN28BU6k8mnelKXb3A+cETZ4UsWUUKvGrbAFVnYDHE/2DAuXEATR3N2FDD8dSN9eaG11uyvrdPBDRvljh/KfvTdi8bIRf3soWBpKJd07PDM05Tl6P4K46HAKPK5foXQ9ts7W1JLR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm057xqo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm057xqo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so8438835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535354; x=1789140154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vs3gmdekTNn5iwIXejCrVVf7IaQmTpkBLLWvv7YBNgA=;
        b=Tm057xqowst/FOp+M6pHPuoCOsg6pACoXsuk3E0X4A3bgKnOEJFnva3s9XNMXZ21OB
         HLtbqVYEgIu5kcqVstEqO5r0FzO/3/V8GK4usvIAu0J8zx4E57pBUaiV6ZoqsxkWKknB
         pnT1jrlUINt4m/2R6CxyIW5iIyRCJbxvb3rw9sgRrZJmnVnDTiBSRT9XZSHvI1zXUqsR
         0GXazLlcuoqNcHRr7riB49FdUK60lmJnEqWq1SQgtNZlprc0mOKd4g6+Qmm8CwIPij9a
         JUyJU13fjyQl2GZ8FDLIj0iBleyZzwZCzTAyO1N2C82bhWx/6KZLwYxK5eXNC3hAVpvR
         KkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535354; x=1789140154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vs3gmdekTNn5iwIXejCrVVf7IaQmTpkBLLWvv7YBNgA=;
        b=U4a3gR0/OLMMK29e9CF2dUpmuVhvG+vcziaUYrQTvviQNkf/LPHVqC2UodWV3l/tl0
         KUrrG+uVQVmo4NtUoWh65HLOtZkrMCcuCrBvdhrQnnIDrcSyNcaGwe4YBC/siCcfYqjX
         njnfLUv7ENMCE2mNhQFUTR+kHrUpCR1ai/FU4eJ9tInsnnkNkbHnsfljcXtH6Iep7WS6
         G/5SRHsC9U/Z033A04jqD2SlNeuBapD0WU5/7RW43+m8BTko2HmdHxRr8aYxbeLu39Nh
         8oGImKGlntMoUFbQ8+WQhJ0eIQOhaM9UDvkQEUAAQysyA0g+06TxIifas7wEIMDBD3v7
         ljBg==
X-Forwarded-Encrypted: i=1; AKwUvByZ5lSKQds43DRFDFlGjgBC9JYZ2mClaF6CTZBFEa7pEvHgkuXw66NJhlZ23F+zn2iX2dkiFgSSUAGQI74=@vger.kernel.org
X-Gm-Message-State: AFuF++nMjB31AJMoSBp8MvdumeQv78nhgS2oD4vZ0N1vZhGQjcPJmn4r
	QUjds7VxqZia1hiX4smlNFzkTQG9UPkjKHW7zhhAXOKQqAi+WE/cB4N2
X-Gm-Gg: AYBFou2PeWiA1ODNyQFKISMZJukw0iTpU6R3ST23swcF3h0s8sG/+wldBgqjmD1geEc
	7/ak02FSrR9D7GmNG2upVok7yYTJvvzLbK00+KZarwZoLRX/KVTm0PQzmFQuM4+FOXDS6Z0INuM
	b+25P4Mq7ff5mbvcUREFANpQQkphplhvx33ri6b0n1fakjFwXSsVZzv3bAuqY+G7m7zShwJ53QR
	wup4UOrkSlJLrj97bDRajuOOyJbro6FDNhb1KvUZosvmeM/eNvK+jGt9SZ+M0kixy9wuyulAjyX
	JBooaa1tiY8aAw4IYdqFe16oJ6GgvDVegcXpaAMwLMSWASmLL6oZqwZmKt5TBdFK6Jt5nhxa0xJ
	4j2IW9T2Ck9rHHYHdsrP7iM11y4+JNkcaB8DqwreRuuuDTG9070kTOMLSxxIWZ51hl4spGFISdf
	nrmOEE55YEuUSABLp0p9ayV6KTD5Kf74rtFuMKbGvKZteTvxyrqvfvnrmlmdwv3gnRRW6PR7+Gx
	R8+mpBTti9iTaJTg38Mbsj+ri9fCpuB+YljLeIUnV6+o8j6HOJIoOsQlWWS8C4q26DGOyOqjGJX
	vjCjJKwvZyk7q2XeWp+ULCbqN1VFEZOUWodhrKqv56WEWig/bE0zMIDZ44cvVtiiKRD5pf8wLRU
	YUPKQKdt0FsLtiff2eaBHYDAV06anYpIoUoqZz4kqejaSmMjZt+FvDQh6P+rr/eOGyx8ycazJCk
	R52FcHZckSAi+GFGe+
X-Received: by 2002:a05:600c:871b:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49cf82cbac2mr58224775e9.5.1788535353501;
        Fri, 04 Sep 2026 08:22:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm160442515e9.15.2026.09.04.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:22:33 -0700 (PDT)
Date: Fri, 4 Sep 2026 17:22:31 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, linux-kernel@vger.kernel.org, linux@analog.com,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH] iio: fix typos in comments
Message-ID: <20260904172231.00004b28@gmail.com>
In-Reply-To: <20260904121628.25537-1-hemanth.selam@gmail.com>
References: <20260904121628.25537-1-hemanth.selam@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Sep 2026 17:46:25 +0530
Hemanth Selam <hemanth.selam@gmail.com> wrote:

> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5

FYI, the process now is to just add 'Assisted-by: LLM' as to prevent
free advertising in commit messages.

> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
