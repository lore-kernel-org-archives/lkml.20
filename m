Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009109;
	b=oWkGkUbmUICV6YEp0T7Y1gXjteotEzUZeN4j6DEPik8fCQfFUlRlkGboZLJJhpEc7b7M
	 gpbivWgVBss2we7jeg1gHPxtgHcY+NawCh4iGVBNBQHdbrXeNskyojHC7NN0zDNrzNsWA
	 Uudq6fqQHPdJT0T2iHkTOBErGQEuO3MnxkSE9IFOdt03299Vd8tOr0BoUC5K9eC1gi7sF
	 6ywc3hcQ/ckDKlpTh8I/it4vjUGtiG4Fqq1T50KWBwJjAvRNWFDs59D+Ovbl1Hb0NzKRH
	 ktWILZvF/wVyUsHpz6+lBpI8UDA/vy0XdoQYXc/N1oNe0BEKq90XV/R6XwVh2pDqg5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
	b=thkGDY0LNWLfsDl7qu5F5cPnkHmkBj94+CcimpryR9ruxu3mFAimiCwwcL9OXQ3Vb9OX
	 fPL5cf+yMVq2pGhVT0LXzhKsMx0xeAAXlpprqgiRE/d30O4iC0oT0c7Jz1rUQkiberRIY
	 I7VNKr6AjLru3TXlM7VxAx3KbQiE0d+CE+V1ItKUsm+UVWI4EFoG/5QF/BcgMnm2SFMhN
	 H+UWai3iogVbks/hsY7wSVxjbJ4RIxlY1LDMgkf5qoopSziV0jWw1ALH1yfKhrMhFbzDE
	 /icVjAQER/e0pMEiWCpQMt5xjpq2NGCUbwh4uEZh9n07iidkEHDoxBleI+l/9n2mEaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl01zkq0;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D260A262C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44D260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kl01zkq0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20edd106so2422728f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009107; x=1793613907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
        b=Kl01zkq06dWabUlLX29Q28eAyZcSkjuJhQkb0WJhvRCUt7UM6rDkfWcxYDVNWKMA4u
         IIxkhL/34d5UdRnBH3l4PKNDXIXsOavgqZnWqKKKGUqXnJREYgDD2+90GlP60hZr7/Wv
         4pQ04ADE6NT6vOMSO6VV+1TOfKBecmW7CnyePsMTJd2nX7U+CUwQX83BQ5bW/GjhuyWt
         9ycra/1N8dU9NBIaP3eeb6Crwq9UrluRiauWSGf3PEFZQ2B188pMbkw9xBczcf8aqkp5
         dnOeSblm0bAW7Ov44TjXDhaZrKxWSnApxyjzCvifnU6MLUFco8vnDI03WlyowW/SzZne
         37Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009107; x=1793613907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxukyNQLWFXILJqtxON+jKNDyTFtWUyLnLvPqii2FBU=;
        b=NkVJbTjRNlErHlPi6I2zRKJX6Wy+cLUUbZMZ9kp3cXJEYD/xP7cN7176fVgIh3TBy0
         3oZiVI2ya+tqUHTXW4+Miy0l9USK8vKa7qS8vYtkpxZC71WC2Z9CdRdCXaWA7Jik9yg8
         Ai+urp7heU5SAQ3ncW2zfucvTfUlJxeD24MdAUlb82BZA5qvpYDFuZPFfsh4wAjSxECI
         aUPCC6aMd9mIGfApfNEaRVV6Jk6Yeinp+vuqjn2t4tsOc3gcMfcZ6RV/tq5JiHbwkZBk
         iw8zl95CEBB0dnKH0cJfatif2R7yJwrTuxQE/LuzifWD455Xb712E22KvuzuPfBvO/kP
         tN9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcvZQcwch3qidsGj6R9f6ZdVWVtxXHkE6k8l+5vXEb2364SBCNVHFlTFWx+HPLBTU8a60ATqS9Nq+j3+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMfiQGZnGrrhH0WnC3rBf5/tV45TTVNWYTQRP9Zs1tyudWJ8EK
	VVt7AbFrBFxRjEPLr2oOuF66eTU39yNErNyIeLM5HlWs9REksbc+XRCP
X-Gm-Gg: AYBFou2Di4Ar+O/1vKOUPlsJDl1wahTN8HkPLIGDDH3LP0pVq5YcWaIRu9HLKJHqEgX
	rxtOzEwB6/pn0mc/5QgRHiafL0CjRmcjHoAHiH/tkR/uXabJ137vpJhtkMivuDEk0H9bMME7iuB
	4CR8OVedjoaTNFna/VGPHlxTnQWdJ0k0aHIx1CZteghWTUs19GBEBU6HFwbT7MtmVMAZpsJzAtg
	qIOK86xlup3OFyoc2lmuKM+pNwgEu6eV056z7hFZraIhNIMVO0blU6v7wulo+jR/EvVfWbZRqwG
	2zBouspVS5DnLuT0vD7e70DmD45vQd37m6ibZHuG8Y7sDgobD62CciQjheEGlbwGjFjAQLq0ihq
	46CCvmcFQHRVDv18eFxkut9IQsFdTjbw0MKueFdoANfg+JkRtXF58kXClj7W71LildVWe1cTIA9
	qHPKhdUSZAj0rYw2UVgHYvY69f/5m0TA6JXswkVJp6QfM2YbBQuVv8AJx2GIV48uEGRx2M6jiYG
	Dr8wjJJXzcBFx3bqph7p1FWVH/Q17qYJHObop+rYqp5NJdNcJsp2BAi08b/PeYDvBqC0BKVbg==
X-Received: by 2002:a05:600c:870b:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a35ac95981mr110653645e9.14.1793009106828;
        Mon, 26 Oct 2026 03:05:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm187916495e9.4.2026.10.26.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:05:05 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:05:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Message-ID: <at8lztOr7xpvHEdo@stanley.mountain>
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>

On Mon, Oct 26, 2026 at 02:54:23PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> The fbtft_init_dbg() macro is not being used, so delete it.
> 
> Reviewed-by: Dan Carpenter error27@gmail.com

This is formatted incorrectly.

> 

Don't add a blank line in the middle of the Tag block.
Tags are supposed to be in chronological order.  So Acks come
after the S-o-by tag.

> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---

No v2 text.

Please, wait a day between resends, even for small things.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

