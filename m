Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636468;
	b=k3FTucFNg0YP4shxSoUNhEEzJ9LTHOV1KDJ1gZCagGE1LdutCDjDSmQb9kmY3XpHG3Fm
	 1sCL7c8nwCBTpdl1uDKGWAXdaQLBqYi0O+zlDmUvdakfRYV2daiFul2UIqknpd8B2vCrY
	 LymzlJRpiRwY0IajQYtgyvXE3w5XhemeJOmBH0NpxZewABOz7BZwQ3v0qakUZOx3C0Sho
	 3jZabUBDk8F461d0IZik1eZfG2fDTl206lF6gwdRxfILRWWgTOgAcZYEeRkPPN/45JPyY
	 tgFnJmlEV42oMszvu7I3jj0HuicHxBOGVdK7yHYNiYaiHAtLiaQTg/GjR5SHLcoKzww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=5mo//5iszunT69Ntkv8F5KhrsTxnizkW5ppwaMrOTwU=;
	b=08Wxw6sog1Bxq7mqlRJkMsOL6SToMXROu5GeM/rS/00jWsRvEVqHMxdmklpIRmj+NoRY
	 KH206ukQhma5+GfawSgLD7d7GZupG0cofo7tpU3a9aImcZuK6uai3idGeAHEVrJ15fM/K
	 aQXSNiNKoDvV/dVyuCjuIfRyGavzgDZHazKCY+xZtZ/ljM9OWSuuyoBdhn5wB3of0BLkJ
	 9/DD+johD/Qb4hk+8d4/sPDtxdFR3pDVKb8pLf7Sucn2HNNHBWZs2SzS1f4U8QfRojyF2
	 GzquhE+5N934En2xPW/Hbk55RTAxN6iDI9u1kNRra1hULKRAdQx3MTUMWFg7iY7W9Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlWMI7ef;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82771606ABA6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82771606ABA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlWMI7ef
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so1491152a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636468; x=1794241268; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mo//5iszunT69Ntkv8F5KhrsTxnizkW5ppwaMrOTwU=;
        b=hlWMI7eftQ8W/OE8uU3ILgMYzQHry+3zhXjvPuTaEaRJcpSsrbQHF4OF/9RCyzKcre
         QbfN+fMOFcIfH1vIe2QYShyHlsMrQiqkP/r1JJMP9WnuYgzGkX7uhuqNqgaEA3lVj5Q3
         1lgjCB2OOCjtZ4r99ogWkCgzewD6Tc20aV/ryg2L8mGEHZHgI14mfOJulrzLihKlJNP7
         y0+CN5VBHjwRNaCRq/KSaBZnxNv8EDfuXZWlhKgguoaWKaLwXH/uYDZbG+J6SoXlWDdD
         VdncapUpaMiXFOBDItiBK9S+SvjdzRrkYUSWMNSo0DYaTzKOHPuxb1nzrf2Jw60WPQy1
         oRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636468; x=1794241268;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mo//5iszunT69Ntkv8F5KhrsTxnizkW5ppwaMrOTwU=;
        b=zeUE75Ceoxhd5fiLw6oJmC75HTjuhsB/oURtVeFFPfdkK/SltUjgj3yf9Wy/31VbcP
         C0piIMNdnPZzhr4NGw/lAzM6kBfmrO46iY6wAc8nJpXBKSxWV8ct4XruQYkuUI+Vy+O1
         WEBLhNlvGpihCdsGJZLrkreO0m5oKWkIf4finiX+5TOlo6LdWYpPDZGXuZv2RqzXAlfa
         ldBNwfv4oPfRv0ujnyuk69R43a2A/SvkGIKYAxLw9F3UJyOyB1z72qw+D/s2tpN4ViOA
         6sABoAtA2BspW9IWI2vrvOzPehYrrR63z36l7s4DQFdkkuW2fn3bDfEQxVilcQcmqLTc
         +bUg==
X-Forwarded-Encrypted: i=1; AKwUvByZ/OV4S6m0gTYH+qR/4sayGK/w1FODddX8lArKXsLcNJgTETdmmdTqFcdGh9YhmIQqa1+ALkaIOPW22FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NFF5x080QZH46tdPbdjy5THPPi/nwQDvttrRoJsRxkE0CPeyP
	V5QbjFLV+C/FVv6WtWb5eLnmgIzg93cDmGC3lgcUnEd5uAye2ykE24GX
X-Gm-Gg: AYBFou2C8IkHbpMlghP6Zvpoh+ateAj2YdV6zlfp1bCntJszgOlXsrTWwaL4VYkLkQs
	log660htehvmqwhxx0ikZOQA+fFAUCcIH0RBqZZp0QFNAZp1N3Iz7ZA5+8Fq2w+hAsv8a1XmOV6
	Q51WMHL2zn/3oykuuz1NV59qFz7gt0DjAVmPsWqaucZRwYrb8dy5zJ5Vg/9BRU4bEHMkIdpauFG
	X9Mnxa6nKueCoxTPuda7AY80HzE8o+Ebh/7viH/v73lRIT+5+v05YIepyEgqT8PF2Dx0TqWU/oi
	ygTxISY6jZ9/RedojAlidr1h051yhMKJ51ZsRI0O2sFlDR0oS269JbWnggE0K8DxgQQtp/Z6pz4
	m9z6Mp6nZiSIU0klqnrYalAA3uo5pfA6IWG7idNe+/5Xw6Rj+8Cww/ta6UtVb5YxXtGC6a26ow9
	jmzQqOhzxrw8IKlY2MJZboQh4BJke/uMGXn83k1nMQqMV6a8eLPW7pSFR2QeIJk9+2EI0FMWHCS
	3imcpY+9puUasDIFtdt5uaXPm313fZFW7SKrJnsOBNmGq9wFGNMZivvRVDN0SwIJ44SzeS4Eg5K
	5UXOXhJZzvFpTAmuJEM9B/viOMoz2T9rkcroJtLYq7hPuaPkU63QIO7jzd3vv8jz/Dy/eYwopMd
	5oPnlI2pTY9XmJsIFyvFBpSBisbG0RLRIrQ==
X-Received: by 2002:a17:90b:4b8a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3ae8977737emr7944503a91.40.1793636467693;
        Mon, 02 Nov 2026 08:21:07 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d5b8csm19939285a91.1.2026.11.02.08.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:21:06 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 16:21:06 +0000
Message-Id: <DMKV29CMKFZB.11MEZ8S0HXFE4@gmail.com>
Subject: Re: [PATCH 1/2] HID: bpf: serialize hardware operations with device
 destruction
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yifan Zhang" <yfzhang23@stu.pku.edu.cn>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 <linux-input@vger.kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <179362071770.29269.481376767482231629@stu.pku.edu.cn>
References: <179362071770.29269.16022650793604369465@stu.pku.edu.cn> <179362071770.29269.481376767482231629@stu.pku.edu.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 03:58 AM Yifan Zhang <yfzhang23@stu.pku.edu.cn> wrote:
> Hold prog_list_lock across HID-BPF hardware operations.  Device destruction
> sets destroyed while holding the same lock, so it waits for an operation
> that has already started.  Later operations return -ENODEV before reaching
> the low-level driver.  Apply the same lifetime rule to output reports.

sashiko is right. This will deadlock.

pw-bot: cr
