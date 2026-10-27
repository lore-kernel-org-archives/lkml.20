Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793128692;
	b=H5dKAOZ+6+3iOMzp8+56ThbC2Ma0EECLActfsT04uYpPHkcTW3uc9qG4WW4243+u73Py
	 qBoxQVq59oQw+Kj/ExeeImWkKAa1tgrpWQpq4VJ8sChvmUM7mNEBUiI1niz+6RD2PStr1
	 P1tR8QzrkOPr2HMq9NW/odGg4KEX1MFYz/lsF1jb0Gp5A2t6aps8B8aN09tI9zoyPZr8B
	 lShdxL29zF96YYbsa2SLEDaZkHp3Ko+MKN6r9BelWWU+zDRiUGyW/1/Fr1mB83HrvF3lT
	 Wn7FQQOxKzCRb0CQmfKmKlz687Kl9vHclFg8MdGkcI0kj/l8ctKx/mv/8UUEd4+/uAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=w6DfYLs1UPv+m99YHcAmjcczztFRxn51JTNHeUhcQnI=;
	b=qrED3sIkC3q5ETiCJBC8RGD5VWs589tPp0EKYa4W4pF6/gfhN/AQPTJCzfgJFW6CPq7x
	 LbN3Kx6frpJwO3bDMtieAH5wfhplYzYfE5vkfexLNL/yE1Pz+Uk0ewsShRKibvP4MSQw/
	 qGMJHfYwdQcaQNSr02PceJqTht8Ta8UHmd51S/ROzkfosAaufIkPE/uovhYlRW54AsFm1
	 yX5WZELMbArNaWCSXX1pQ2nPb7L/FzLxZOB2DORydD8N5aIn1WX6kKqlqVyeD8oDtsUtU
	 8SSs9B6ApCGmKX0Ua36A4yHRAwgNP6d/Im6cCSyIlgivcDe53o90C7i3jm3hLPj2voQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=baLZvn2f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C674606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C674606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=baLZvn2f
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-843c8bbfbc4so57887a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793128691; cv=none;
        d=google.com; s=arc-20260327;
        b=hC6JRiwirlfwYFuabV/k/6rfJxaWOoxgELr4mXFVAR49TwHr5PW1oPJ646ifcp83g+
         Z6xGFCPUilIzs6FxVoAiwKs8CbnMsiMhTMRERx7MoDP7JW+hIJnrNp5JjcuW69PJfMqk
         yeF7AzOomkhOz+BT2iTeSGkfGQzQo86TFKZI3CDEj/wvCIlJCBYwG/nHeT983VMRwDGg
         CAac0Pcq/tDjfmAUHJF9tUDSBdxilR3vR8lTWrtndwxkkWtnB/DcWZVckVoQQDFRCsTl
         Ae39zRiWQK2w395sSg5vLix9icZ0qjYxgqdLBLgCZvvtGyjrgPLY/PKhajFXEhz59h5S
         75Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w6DfYLs1UPv+m99YHcAmjcczztFRxn51JTNHeUhcQnI=;
        fh=eyIQmd7p59e7KsRQuIoM2bol30CfQcb4YMY0GbPZlto=;
        b=Ic4PqwbXOmlKVzOd0Drc+Rbo6k7n2In1dfQUIt/kMRs6aSSYKdY7HnzuAtj0cWrP+3
         twvp6cH+d0wn5MBr6JzK626R6u9B7myz9KNPlpa7AFf9Mi4ssilIg6xuhaT6KVJPQ7I6
         D9mA6gXSSVBPA0hslQfXStPQTy9RTaTPKYLXOlZvj6Qm0BACcNuYQAzfBX/vmC4XAHvq
         xYLgDsThOyzwW/srhRfLnAZ+yyOig5UwWSiURL/CJeRRySIcK400WmZf1dNNyyFkIvJe
         0Uwkoivg+EpqvNotj20+mfSpDRtCkqwOC8SEkyGKt3Jjr7rGv9hbeOCR0C77Luurn8k8
         OYtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128691; x=1793733491; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6DfYLs1UPv+m99YHcAmjcczztFRxn51JTNHeUhcQnI=;
        b=baLZvn2fpvO3qD3gDdl72ehJsNqPbkEh4qsrJhy4LfxIWvzPobzyQIq0z9hdZiVfkF
         4WlZnT3NFrz3P3SQucv+hiLyjndF9TZHjJwNN0TYcDoDjvrxb2DZ9yz5W3EouncJGRit
         kIf18mBMkKlaiwM9CfI0+2xMAfOv3mq7oZwOJebua9lL3JgOQ2t+iH7AOSrAemwTavQ1
         VSkaDvByApNQ0gcC5pLMzZ6rhs+0LeVln0l3LTwbq2Fo8LObI9FVyh9YwcCbLANAum+8
         1mzUZBFUJ774JewRyHDsWOiKQomHi/KREbtqSZy3sGVISfX8mxre8Budizbflh0PP8KT
         mS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128691; x=1793733491;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6DfYLs1UPv+m99YHcAmjcczztFRxn51JTNHeUhcQnI=;
        b=OGM1SKUq453xNvwQTB/XU19/tHFwdw1tWGKnz23xeIXzPFbt39lafKD82vX3uzycRL
         vONWU6wjUiB/4M/Lj0VKDfvpLXTj4mZcLqhq3pU8wvf+JDlOPyfQps6DHn0G+r8m2QH2
         gtdEy9scZDRWQJxU674GsbZT5GMZibyw2SgkJxiu+hJG66F2Xl5N22/gQnOSpVSWAluW
         baxsZLUB6c4NbrD857bSVQfS2kNxMmM7xcx7VTnXcs4HSFkxR2JVuQ1MB73YEeudZDfI
         8EdLdMMHmVqPyPMaJ177ZxL8d85nh52lxTYJYWyavP2KV/Z585VTmkIq57w8+WpwBcum
         cYvA==
X-Forwarded-Encrypted: i=1; AKwUvBx2YUUleiruw9BqR8wdbWCUXxEn/WMx2M2DiYYxPtIbbleRggdRVfzmpzmNeoCxVEVp7sL5Hsf1QE1e8k0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRSo18b6XKZMm/kEW/HZCjHAys3tYg45uid1RPxv2GcU3qlIAr
	RLKFdTtIWNVMsXxvuuYiHbs1T+SFDBrvtNMURXXT7IhgY8uiE5WBV863ThPbazgI2Yeq2m1Jltg
	I4EeeCdYFxtBqMROF5XqUOCiuXmIsI5ZDXn8JqIzwYA==
X-Gm-Gg: AYBFou3dsGS77UIejbzP5x+/FwZm8e+3VN2XCbA/1TgJ5YTXbruH6Tk5kdZWtiz6Z4r
	J4D6QqzU5M9kkQhgBE3KlQQabaiEmOg61IeP5ObnVjkc3xOkvjtPQVM4Qldg4/s0rPTorxzhv0B
	EALjXo33KWhMjc15cBdEPBNY+ivH5j6ZCNSh4BFLKuNTncct7RWrjlbJYkA4Jt6O/C+6MsBWG0X
	SUnLlQfexlN1/HOPa+HOqSIfH9b4rYTrwYPWG2YBCcIJ6U6ki1iyP/efwDqqEvmud1ohMKtFZ+X
	Ywliw/MXx4NyaLSZ3F3cxu1ygw/h9G15G+lttRVkgk0Y54UkDy5Bzoh2zhboVVvJAyG3iNwH98Q
	WOJ/GX+JRV7Z/IIOMKZ1q329cRd2S2OMIu1RbIZCbWieZ0o/VouhfMcx7gLq1G5FsI9Dda5Bp
X-Received: by 2002:a05:6808:151e:b0:508:c44a:63f4 with SMTP id
 5614622812f47-56382684c39mr91413b6e.35.1793128690829; Tue, 27 Oct 2026
 12:18:10 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027082236.56724-1-dennylin0707@gmail.com>
In-Reply-To: <20261027082236.56724-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 27 Oct 2026 12:17:59 -0700
X-Gm-Features: AclHuK972QVjxsr7ZPA1BMTiS7Y8E-jpvVDMCciChlRAHi-jepLN9cibkbn5rwA
Message-ID: <CAGEkeHfWcuoCk3zvnpaSXKDduVB1UWAJtRGV-KjJmt7ws2gbBw@mail.gmail.com>
Subject: Re: [PATCH v2] tty: discard flip-buffer input for TCSAFLUSH
To: gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'm still investigating and don't have a replacement ready.

Fixing this properly involves more changes than I expected, so I won't
be pursuing it further. Please disregard both v1 and v2.

Thanks,
Hungyu
