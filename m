Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562234;
	b=cTgEencAQi9SqJa3VHKMyWvWYYFlBBUH7y36ObOjAASZkS9r6Iuas3knMZIsA6+/lbkU
	 FRwgubI0xeLZ2kL2/g6pnghkBwMbQczDWgj+dISL1HS6wbUgxh4v3D3hB6z6PnPKv14u8
	 mySAUNfJG0b7swzMDt68/Uc8rqFNfjq7K9NzagGnFxryEukkpYPPBop85Wybj6vnbIWNc
	 eUEXqbH3kG0LYOqsEGCaITDThLpKFn2IV5mmet4SS/WkjK5T7FEsJTwljQtFQRBQGkI6N
	 gfaK9NAUByTC0JSLPoT5PrwpXEkUXjyuVvZaWEF/5CuuOKz34iqYyWEUvFASyi1B1ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
	b=XJ5FOWoL66Yd2k+1BSvzdW/f03fQWq2RCshNx/Aydn03WzoQlMXlU+isxUFanesQH4k8
	 Mr7r1RtY9KKisatLM6EviSor0sKRP9WHu4/Scw22hY4iAo7Dx4TPibuY6fS+mZwPmpJav
	 5bEXxUEPtBu0BBv+UvzcHz3l38SSc3iE9D7lMKdFIsVa0Hf6nUJbvRWecxcaMBdFZn697
	 5Z8CmjZHFwiQF4ztlRcMpO/Dy0LLaU8x9UCGcMGpbmoSmgJC5Hvqt9Bi1n4o7oVSSnOHd
	 cVdCoRrTB3Yuz6e0UL3Flx2kWCuenZHwekmNw4uwsq2ae7js86BiFk0rALpfuqmC8hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QR42KsUj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8599C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8599C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QR42KsUj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df4f540ebso133869f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562233; x=1793167033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
        b=QR42KsUjJMKIOY3lMvcJz3C7baB4skGwlhJbFR/TKC9NCX0texg2rJL7cv9wS1ZGnv
         NNgcnBADQnSYGBin/NafL3yfMauiI6XlinCOIiINqoL9ZvFMWZLLCPVMHETdlcHCiLxg
         MHTSULtHn6/JRjri2LpXKebjHZnashFgtkPEX9bwY4EQ3+B22pVnqQEK7dgUpmawh6U6
         Lm2bwdXo6dj1JY9Okd/VGcBGnvHn3qaGuvVae/YRBa5o3xhP4Z6pNJGSqNLe9DpUdeoO
         LXexMHmV+EeOn1MRhbCnDG4lcLxHGpbbmWVlcqsTLXH8g0BZKA/tpDfUlI/SSFUUoUIh
         llwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562233; x=1793167033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTBam0jinCye74oQhjo1li7sy5614NeZ+nwyBGOMSeU=;
        b=N2nUM72RFS2G4GKu3ar5OxsWGvv3aDGI++3/IUu4p595bKSVnWvzL+hXNKcZZm/sIr
         R80+i5E9hLF7iEsvxrMy4XR/SbRkTVINKnJZCsi80uTNynsLir7PpTkK+ZlvJVZ1bhOY
         1zZqZwvwG4en0qUGG9WPFjaf/Jorm+n+zOEOcL+8MeO3GNlR8h3MoFQyEl9ayGFzYLb/
         nSUDzsDZkW5HSflxHQoU5qO3M9HAWGn6rnpbDclZePsOStYb9wVk7G6r8otlSUL0TDZc
         JRmK24+r5N5H6Pji8307oZRRX4IxcfdPUFgFWWylt0UiVZpOrydibFixPSHq0E08XoWP
         +cLg==
X-Forwarded-Encrypted: i=1; AKwUvBzGR3Ma+mw12Z5aa6IvdggvsLMDKVlNSoDLs+icCpGPf6ExRwi5flW8A7FZH7QxOuQRSc1OwyPPlqLM9MM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIBBO+3NJGn21koMKnEWJ9rCJYh67Q0BlQoTB/zMqTQ4pTUDhX
	MpQx1oJ7MQqX3BbF5F7aK7ClCF91vCaFyO8CWIKfkkMQHFJSkLYnauKO
X-Gm-Gg: AYBFou1rkPF5otHUuKA3rtNqFFIgaOBjX1CQqHYRr4cI13ZeXxyfI+AcpaWYlCFqDd6
	2SBJc1dcg12avcHaS/GPLrL7e+PxcpskAoG+Zz45v3xb/a3NUim1BMaMIu/iPJUGTUTJKsB9Bav
	EwFwMOvYczMPS+TQTsAQbIOfS2bNgCLRPfnMUej31ivwk1AclSrmkPlVFGWbC4YeowFgDIg3SVC
	pbChHf1w7H2z9n+KLi625phj8c6m++D3FMR4kHyF4oeXMJRzFdB+wwyNLHLyIqCMMx51PKYy8bm
	/MszEKB6Eic5fosJDhrORVlAp1+CMfzonrhFTH9sa0WGQtIW+jtABjPFHA3c3Gu+kRSI9nRW4F5
	SX+vQjqxHvZ/5sjz8SWCtNQYFwPhRiPFH7v+/8ARSWzN4jz4ID51A+76+3EtZU0psFAlGzBCpF4
	FhPBt5vvIh44mdPHKNZ0BQHTowk3ozRtuD0NPH9z5RtaUENzKFiJLpv++5wxg1HEkMqQyTtQEPU
	HoPQxJd0vcT19VS42OgQmWSTSHjjRgEly5AftghVdKWF3mQlskr
X-Received: by 2002:a5d:5f43:0:b0:48e:bf0:352 with SMTP id ffacd0b85a97d-48e2642d37emr1773736f8f.5.1792562232722;
        Tue, 20 Oct 2026 22:57:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm3178383f8f.8.2026.10.20.22.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:57:12 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:57:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: fix crcsr_bus assignment on
 allocation failure
Message-ID: <athUNFUCEx4CJmB5@stanley.mountain>
References: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>
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
In-Reply-To: <tencent_A9C3CCA9DE8FBE61A3F51944B22D1E7AC606@qq.com>

On Wed, Oct 21, 2026 at 11:02:22AM +0800, LiuJunyuan wrote:
> Assign bridge->crcsr_bus only after bridge->crcsr_kernel has been
> successfully allocated.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

The original code is done intentionally.  I'm not sure if the
new version introduces a bug because I haven't looked at the
surrounding code.

regards,
dan carpenter

