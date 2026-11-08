Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175677;
	b=sqrovOMHiHEqPz+Nnzt5YcjqzCZQjpzX1Vhc5vHL4dXwSxoOVkI+I1dRTlDw9Egbp+i4
	 1eAQfGY8z1TN8tt4E2oak35WSzx6nf8ShfZ8k67d7Qe6MNdtgf09vAoSUd8LGIfNs2gR5
	 jXitnZbfe+MoinURVIW1echkLBFKWax2uD10563qU5HYMAjK45q29xBu61azMpBVCRVtR
	 v6/MT+KFoFkCOY2maQzEwXg7XCzK+6CqftAFA2DyA7NjTEqvaFjdGSYWqaGnOwPFidMVQ
	 c5mh2Mo7qJI1nc+BLsNsQAKNtZKeHjTlw52/nmFFneseasAXtwlnXzqBpC5jpf8DscQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175677;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
	b=fKxSkBBPWkOqdZ7wBta0Ra9W8U5ZCKJzLMjDdY1VcxIO3vPScE+Cto96zRn+9wwcXo3M
	 uqUVnTC/vf+Q1Oy/iVKVB5FPgQVLcARNEIYZuwzZlE9ouK1nZUTu+7S3XquaRrhEPR02Y
	 tBl4/MWiWXTpOnnyxmKBTbWDE1+yQLzYEs0r1wyzfCre/5GpZ1xVSQ/oODETnU6BsmF3l
	 emB5Kceg5XIT+T9wo9QhvHhRF/K09XCQaRzEy1LxntMHwYwWGASUDYey7R7KYgaTIQz2z
	 6W61DpercU/5H+tLSKbTWt495nDryzmxOfUmTeB9l4IFYkUtef89eMJn1cRuJcVzICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92ED606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D92ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb9f760337so115755a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175676; x=1794780476;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0eejaiBFkeUZP6gkE2+qDOnCeE0Ygw6Yg4Ofv8gSs0=;
        b=VSjgXyKbueOpBUqzNV30FOZ4jz89wpUvJWfPQY048zJahN3aaUzmTq3V3krNIiQjEJ
         iQaTYvXT5xuYuDS3r8cpDXoVdiQcop3ZwzuJo2NHBhLX/kSyt1ARrqkBmrzRLzJKBPfl
         3PykSnFxFG88v7r4E19z5wg3q1isbsmWPXvungBEdBt3X/z6QJ43Bj8Hgu6cldnPIIJM
         4Hra0mzxvMVFBGVBFDJ6yU4j1Kyf/al/roAOlWvYrCV+sxvkZ4WtrRvBQJmYomLES3+O
         /uRXKv46ezKGxvAB80yJk01L+EIOQ7DrpyOgUwGSiZCXPc9kDemofu95WOa0eqwmnhF5
         OUVg==
X-Forwarded-Encrypted: i=1; AL+hErEYgosOB0nMFKd7lJdy1zIM3Y/y+KqRI/Wte0DBZEqExR+pmMK+nvcOk3Dh1NxrDaEWAfKxMAg5Cq+m9i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MWBQuT20QnqX+pVtLG8WixlDORvBs82x/pkriZrEAApZzNR5w
	AP0ud8R3AnOUjmeE2gfO9YPwJnEADuZzRrJEgYSG1xhNJ45nH6sWFApfjCfZkcLF
X-Gm-Gg: AYBFou1cijFw2v5OnxwAgEyy/BWeFGF6tfmynJ12LhJwB32LIOhN/87Y9JcRYmf1pyk
	0MHzaNVsTwOygQBSwjeSpyC2KvPcAQTa1qcuc3ugGIiNTRl7KlN6GdwY4X78LW7YVfwAf1ftQlW
	4ojTMQ2N3Hsa9nZ+5sycBzUp5IqRHKtablZTFnGlcodAK5F20BeXFysySDTrOT0Ka9DECZjbZIQ
	3cjaJ4IMr/QoWmUnXxuT63D0iLvl/bNsMMR4Ix77EtTqAzcbF8LK729oagXQwPElq/NJyOaE3xD
	CfZcaOjwJXCCdWYzAT9OOrjJedKcHT3rc1tNTxK09I4r01EwVScH1X+Se18wyDK4794tmMvFCJO
	SEZubhjXPQbUfjZ3UwqbPVx4kNiHt183aJ0Hsv9OW5z1Om3Gt2s6jH5tANqQqK3U4BoAnLtlZJF
	knf59MzjYOUSz6RC+3zM4LtWWJBNv/WvwlSc5F/yNKN2jAvuzoaaojCP7WA20LnCXNeZf7SR0l2
	Q3PJ2AbP0R9VXSsff54hftscZng8726/X/ZrSvj1isLnYucLs/ZzAQ0VEA8tQ9e7NHYX7kO6Dui
	jNn7fD6xXzcPQaSP0mUhb1bpvWn3yxyUIGZp41Fh4bczEpjdNcNZBCxKsPPMdwKJVIp/yvuDl5L
	aybbvB+CUlRQFncLlgm550AQsrIG0iegIpOOPaA6YaSI=
X-Received: by 2002:a17:90b:4b12:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b12d4ddfbamr1508692a91.25.1794175676153;
        Sun, 08 Nov 2026 14:07:56 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc487e05sm5008781a91.1.2026.11.08.14.07.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:07:55 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so473050eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG0EpHD2ckdbrU6IDC7L3CaEKKTmJl42lNWBYNrbzu3tQjFGFZP8bc7uvCyuaUmt/dh7RLsooyg8UxGWPY=@vger.kernel.org
X-Received: by 2002:a05:7301:1630:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-37250ee43c8mr3901672eec.0.1794175675139; Sun, 08 Nov 2026
 14:07:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <au4HsW2aMYKyMspF@monoceros>
In-Reply-To: <au4HsW2aMYKyMspF@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:07:43 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
X-Gm-Features: AclHuK-O2KZKYumWb4i3a2AuPWKubDs7etlgwM1RvUJeTI6jva3RbnRyGORGlNc
Message-ID: <CAPY4CJ4O=_44w52Ci94wjmbgZfFKp15U1o3t5rodC2C6YB7CnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 will include <linux/device-id/of.h> instead.

Thanks for the review.
