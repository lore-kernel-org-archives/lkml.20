Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462756;
	b=alWdeeIHQllwqpg88ztIfYZkhgY+cDtZJc/P5ea2JfgaDjG36LecM0i6I0J75cDgcN+C
	 f33/qzQ03HAsuMA4SSrDdTLpPn9m3GF3YhpII3uKb2c9aZVu0K7dzN7/98/gYDYzKPW6H
	 nqdDn83MxrqSFDVPijQwalbHiU3T/3YQj6ZYpOqtdX0lqrgk9iSafu6c3guW20mpd9llC
	 AVvFSqyEBYzMn/NkciPim2DOqwabc23AS3mPZOMgA3BBUmp9ObKeXv06BPS/3B2Y3XWvd
	 o1UjpQgI0AoaebnqEhca75igFk9zzryPCLsotSWjMQ64Zs3WoqVRwjcMrDSlLfw8I0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yoVQweUhBNvvHzzBSqhEC+QBmmp2aRaw/Ip0znuFVys=;
	b=PJhnFUdiBAUqC9shV6Az0Z84Oo9+J6zkqzb0oGfxwLMyzrRXdsL1c96Y0U3MbKWF4lWz
	 AjIdaS6UutPdu0d5szLl9rUCYGB0NwliyFmxuNxmV136K3fZ3essgcbHrxmUzQf2xK+4F
	 FA0YubmQqxD7IQgvxGtzJVLs7EJawSW/OGSCsH9oR9lCG+IF/2nM+qyVGTjkIW04DHVS5
	 HwaMGF0MDdwiZhQLGK2p1S4/QZzFLG2kbfjU82XNmaLeSUTMbihuyL6WnS6fea8w+KW2M
	 HtcxuDo0N+QBWDKUt4YK/68zb8qdNJ3GkEClWAHjErMcHkCW/l47IyJ/36zSh5uJAXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABKsVenN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451B6606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABKsVenN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so21658345e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793462754; x=1794067554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoVQweUhBNvvHzzBSqhEC+QBmmp2aRaw/Ip0znuFVys=;
        b=ABKsVenNXJ6pPb+KgqwprBr2Oa4zrVXF2hlOOUxI50ZiMl2UPo9qrUfMstWHbfReJU
         nkbq7N+LnFd74vGmV20nPi06hu6YALPPEhLlHw9yWY6Zs/jg/o5VYQkxQdgNmRTj8+sP
         ianCNXbciDBzs24ME/3caaUiyfJFy/Q3AXGOknNvr/cd951Ytf7npYtPPCYgiydyX820
         beeUJLTOC+Pji2cUGplwPek7TBOoj9WicrUTbCmEw301SCDY3AQ4eOVe15z4Rlyg3iFK
         6b8VIowDE7+RnBvAxQBU2bHzW870cBiP1pfdjH/v1X9lJrFHPhN3oUJ11jmd3SQLJXDU
         5OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793462754; x=1794067554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoVQweUhBNvvHzzBSqhEC+QBmmp2aRaw/Ip0znuFVys=;
        b=Uot3RPvgkbmIW1VHXm8w4bPZikzVeycEaowX9oQuonJeHtXWG8TIr6KsWfU3RNzwOL
         +T4ADZM14wTkG//lKrr2+aCi74urxezHNi3IQwqyEKcc5GJaruPXnwofV483g8r3MmyU
         FXcSfAtD36rzMQ1PCkUtlZ1LgSAZ4fc+bB5gNanZERST8QebGKuwpX1KK1Aur9tMdPse
         PPnSt159Sv62THi2rRywYXqjFJ77UmHrb/2vq5Y6gHs6bjk6Q21aTzsysIjew8Oehd6Z
         HInALEIBG3qay3VJsmz89epXsYSd8cpKO8mVdXLagpE8z+j5/ctoxVuWuXpEuksZZqn2
         lgBA==
X-Forwarded-Encrypted: i=1; AKwUvByDl6gEPI+kkQMlkBjRChH1vKrFU00zomSdMsyZ+bc7JwPGCt+ukVDSSIRRV4DfVP9UiV6iVXD/o6O7Rm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDYQ8fgQQ2VC4iCO1w2sQ4nZjgvpuWgzI4sB2bTBHnoCkXKrqO
	tx3far1khNfcruu4KMLJ+NC2J60CZqAnJmAoEbrf8jb8fpHPlqWU+bF5
X-Gm-Gg: AYBFou2CB0VmXsc9ssImjP5pwV8wR3IivE2WtQwaMBw58yKL315xcnf3owvEolD3psQ
	ZgXF+SrtUDLxQmJQU4H+NoyY5X/CiBaIs8isMN5Gija7F2VB1Y6AyOmbcKvnR1bkYbUBbRKEiF+
	hgVMXGORz3j1jXEsAGzv4VMH/pxmK3ReC1+YgwhEoS/FanqlGhWFz4I5rX3oBj/FXZe01miSFcQ
	ngyWO+BMTn436fcWxtxU7eREvHNkgTNR+cV3+US2ImDjxY6PfwhhDqoZC3UrBg/UHZnQHzvpSLQ
	NCsI6fjx/qDO58mpqW/z4sr2UqFaC65puSs2fweCtA83H0foRAL1mxC9yhO/BopvGjvH/5SAgK4
	RBNzeBovhTZdgR6ZkAAotexnOkHAzznCYipM5/CasQYeMFm8c8Ycd9W8Y4f5ys34PphvfIM8ycn
	eWPh/GXFWiYz9DiP4O2Gx1drDtO6APt6Cri46QSAsjJdBnMwTiFhSJkP9pu5CSBScGagjzsOAfS
	O07AHnnwJaNb+Dmd8ZwSWd545GSaToCZ+SjhCtWV33cr/hLoN3poCdGjGL4tj80Jg+5twb9ORda
	WqXGY/xecRvXwGyQU1l8GslwSAHKf5GT1osmZQ5XcmLoGosYzAZM9uCYB9zKGTm5RvIeEhJjYmI
	MiNM7FQFAOczEmhdjS2EOTdMpmrrgU/SfPhmpvGr0RsG5tONWI5hz2C5rBduvgoZVIchjTQtBVc
	MpsmkLR1GyvgEW8yHXc5xbw9zvc3UBuueLLimjFCDSJmAMtqFkbAGosRIoJCCaSw==
X-Received: by 2002:a05:600c:37c8:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ac16acd93cmr132615215e9.6.1793462754293;
        Sat, 31 Oct 2026 09:05:54 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm212385695e9.8.2026.10.31.09.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:05:53 -0700 (PDT)
Date: Sat, 31 Oct 2026 17:05:48 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: accel: kxsd9: Fix potential use-after-free on
 removal
Message-ID: <20261031170548.5bbd2c8a@systembl0wer>
In-Reply-To: <47d9e9120165e819d706f922c798517701019bf1.1793377431.git.liguangshuo@mail.sdu.edu.cn>
References: <47d9e9120165e819d706f922c798517701019bf1.1793377431.git.liguangshuo@mail.sdu.edu.cn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Sat, 31 Oct 2026 21:05:38 +0800
Guangshuo Li <liguangshuo@mail.sdu.edu.cn> wrote:

> Unregistering an IIO device with an active triggered buffer detaches its
> poll function. Freeing the poll function first can therefore make
> iio_device_unregister() access freed memory.
> 
> Unregister the device before cleaning up the triggered buffer.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 0427a106a98a ("iio: accel: kxsd9: Add triggered buffer handling")
> Assisted-by: OpenAI:gpt-6-astra

Drop this tag, it has been deprecated.

Otherwise LGTM.

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts
