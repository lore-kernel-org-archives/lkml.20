Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6509350298
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120785; cv=none; b=hF4rVKmtiLyoX+gQN6KN5EB+TeWEr3Yx3wqUQjqnN96eBScoXnRRPhBkjf52TeGK23kLaeDwPmyeDon9hKUY8j25lwRrOGBgjIZ00EayF+onjzOiCLhHnfPJc98O6L+5Lt4UeE0UanagRaSvYDgwGUNWb0/44Zq6Q0hXfRkQFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120785; c=relaxed/simple;
	bh=LectKxnVPgl6kp2WA9jYepcXdH0Or/Oem/uGNpqc0Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pe9oUIYUGBREWK+G3gvvdF6+FLHpsO9ei4ZuGltPqTkDaNKILrtZMy1ARJFmkMVZ2vDp0LSO+8k1acI26GRncGnASwCIvytUFU9h6LLK7dnaRrAlPq9LUaXyiwzOOViDn9dce/5+iR0on62Oww6ZCR+Z7VoLfiFfJx4mxJomhzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg1ajv6k; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg1ajv6k"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so2723730a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120784; x=1792725584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TOjkNOOOYODKC3hy+v06oUAuoKTO3qPUXNp5ApotnM=;
        b=Kg1ajv6kjU0Z6cZp3ZH8xseV3tBQbqf0kwH+M9ZHdiCPjZAEN6I4wLs1M7PaEZr9qm
         kGOg8iqybHR2ijRzXVm4AkdKalva+ynnn3wMxaFUXlcF58ltcPv2ETQNRIChI/69kZax
         gFTUD+tIpQPTa1EBY2owCxv4N/kCV1h/H61pRo/0v5ZnD6whQGXlcSaYRVj2QhrF7JMb
         ODxa4gJbvlEGRBMYUIjWE1kefdmaElTa9G9BSztApSJ5xn37LyL6aTIwjcSDzCHfPu/C
         jBZb3umQh2GTTFXERqqiJfSfhGY2C/Oke3I1Xo9HJyEpKJshLeLMa04Vt18OM4sxEO1o
         Sg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120784; x=1792725584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TOjkNOOOYODKC3hy+v06oUAuoKTO3qPUXNp5ApotnM=;
        b=ZvoBnQy+Q3VOLTUkG4GVgzt8iLdmP8Ja8ij748QT/8VWLtcuzwFfvgU8dadza4o7a+
         /FbCiTcm9nlf9pMm4ACl5CSPR7MlAQllHBWeUHQToWj4CduMJ8uYaE49DeXekuaj0K56
         ZlT0/aLiJIC60HPrUEmoqEWQeYClZWrYgryCqxTTK4/idiWZDkv4tYp18aOv8ileXUp3
         l0QA2LzPxpOYKUSYj3fh5Raf7Xee3Vx3YyMUdaN7AnivDbGMcWlKmlt1XGuw9+jqEc28
         1DpAEXTlSbZLoHc+JUFRKLJYV03EWCsiZ6CsliNHrvrh2xCWiSmgnnPSkPLGJgDI839G
         kPWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2oMa0WTnmhMN7Ck6WIbIts0y0T6mF4OqIFDINeSCBaNGQY6ApvkMTEUpV8PixBerm9nAGqN1HJh0bY54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIXfcyYaNoOvHHtbVwwtxzWOpDlBKEQWAeG64gJTZq1EbA1zCn
	sRECc2eK4An1hCmQsscpKcyr0CSNQvQwc51HP2r7n8HnukcYEZyKziTX
X-Gm-Gg: AYBFou0pVXUdvltgCHYmEezlYoWXvZQiohaEzNathByLU3v3Eqb68JKzEfIdMgVaGeI
	3gGVZ5mPBXRYaCJ6Guo/E3rjpdCPr2YnjjRK192tB62f6cOuIf4xQc7ZknmW3ORTwUyeOxXn79r
	PLwNX/fjVZvNityB5poADHtRase4Ay9JloBNQjLjuWy5+FewQ3ui60rCuJotJCdPd1z0y0Hrs3W
	BwcAnEyR69HyfJFkWqxusqYHdrsUb32LzBIuLlaYSvp8kBI3JpCGMmHjQwgXauFpftybLU3/fU6
	lN4oG5BzmXA/D+IeF35O9N1nxK9kQU+qIuGAwK+eyl4VbZRSKExhS74sFzwttz67nSu4PFYUzPr
	gyHYZcUJLcV5cQGaY3cYt6UPQTpETb8acb2kn1yDZk/OFoZa6JbXw7HDqU3RWXJbSjteluqNWof
	KVLIxX3FZ+teut6SfDVKKhuy9OQbE9ofu0FAIA+eivyCzZEaOUgpHt6kmRRCZw0kOoSKufaybEl
	7DtsVuDL7QnXPNUQto9P5oXoZQdNLqtY0wuSdd02KiCUwqHavkcsJzuZjlzs37+bFKhz/TCErfY
	woEn7d9/m0ZlDq9HfF7N7CNQ45Bpjn52TkI=
X-Received: by 2002:a17:90a:d44d:b0:3aa:f4af:1e17 with SMTP id 98e67ed59e1d1-3ab3a9d6d17mr15840009a91.39.1792120783938;
        Thu, 15 Oct 2026 20:19:43 -0700 (PDT)
Received: from sanjays-pc.govzhome.govindz.co.nz ([139.180.93.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ebe40sm1960144a91.6.2026.10.15.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:19:43 -0700 (PDT)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: santroller: add driver for Santroller controllers
Date: Fri, 16 Oct 2026 16:19:37 +1300
Message-ID: <20261016031937.824565-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-173648@kernel.org>
References: <20261016025403.779635-1-sanjay.govind9@gmail.com> <sashiko-outbox-173648@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 03:06:58 +0000, sashiko-bot@kernel.org wrote:
> > +	for (i = 0; i < SANTROLLER_NUM_PLAYER_LEDS; i++) {
> > +		if (sc->player_leds[i].brightness) {
> > +			player = i;
> > +			break;
> > +		}
> > +	}
> > +
> > +	guard(spinlock_irqsave)(&sc->lock);
> > +
> > +	sc->player = player;
>
> Since the brightness array is read outside sc->lock, one thread might read a
> stale array, get preempted, and then overwrite the hardware state with an
> outdated player index after the other thread has updated the state. Moving
> the array read inside the lock would prevent this.

Agreed. The LED core only serialises writes to the same LED, so two
player LEDs can be set at once. I'll move the scan under the lock in
v2.

> In the driver core, dev_groups assigned to the driver structure are
> evaluated by device_add_groups() before the driver's probe() function is
> executed. Because hid_set_drvdata() is only called later inside
> santroller_probe(), drvdata is strictly NULL when this visibility check
> is performed. This causes it to return 0 and skip attribute creation.

This one is a false positive. really_probe() adds drv->dev_groups
after call_driver_probe() returns, so drvdata is already set when
is_visible runs. In testing the attribute is present on the gamepad
interfaces, and hidden on the configuration interface as intended.

> > +	scoped_guard(spinlock_irqsave, &sc->lock)
> > +		sc->output_enabled = true;
> > +
> > +	ret = hid_connect(hdev, HID_CONNECT_DEFAULT);
> > +	if (ret) {
> > +		hid_err(hdev, "failed to connect HID device: %d\n", ret);
> > +		goto err_stop_output;
> > +	}
>
> Does this mix goto-based error handling with scope-based cleanup?

The guard can't be jumped across here, but I'll move it into a
santroller_start_output() helper in v2 so probe only uses goto.

Thanks,
Sanjay
