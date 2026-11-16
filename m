Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806897;
	b=2jURT8bTHfSGW68LpL7YdOIogPSyOe+O9nuMgcteC4mQBpox49/ItOHglK8eNMg0Y/Xx
	 sJNotNg/f1EYbC8PYQVF20gFl4eNTfRcp1NWra7PKYn+HQKZHiT2s266OVI7YDTYOEI/1
	 hzHsAGv2BUNJBHrk3Djfe72uhS1xrPltXDIyhgx+4vwQthYR2QxuEAcY2hdzfZCM3XSiq
	 wDvHibn2SU3k7NBe+mIIGRHzrp0XL52xnr9/eLXzQMotn6vSNE/Qa/OMb5+bLUiHcce97
	 Ymcwix7lkmZgo0A6MYPv3c0HSg4qk3601+pVrEjYq6XhhAOEoXE7ZPWexeOeTcCkANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
	b=H942O/vxjIlbuaWvQIDZ8MXiP99qPJoyL0O0t0gZqQPLahTPEz2DzTv416XTAWwUUj4r
	 bvWBf7on4xTxV194pcRvau9GXIIZkGtmBwwFKkGlXigpwatS4996IfNtK/Y/7R791om5b
	 jdFkUXWV2rp1LAIY/x0fVlmVaRkZ1KL28EM5UVAr+FiO9h3P5Xdtxk39076bXFte+aTrN
	 8cA5m7PA/UP53Y4FBswBW6fQ95iZCInio9P0yQnvHv8iV1jtDwAJjvM9SeG46fYJ04hRl
	 YhnqXfRaiNe6rpY75bbP8NVDrVfUtaOWBOPNFI9aiZheD7NVIXSpQp3lf4mz6DAynZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfNXMyLy;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADCF606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADCF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfNXMyLy
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so1591265f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806895; x=1795411695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
        b=nfNXMyLyzYCOxqnv5YneIQqn9o9PKyZMvKb/72zsc8yR9ffHUafkRyNJpPTCIho3Ez
         IbwGAdp2na0IdGWo46qiQPHJft1f0FL1bRL9BtGmTw4sALTtbghViiF07Bxjlerhaa+q
         XK9Ce1hUAGa3/GekwQ6n++7gCUkBqwvsVYKx1Iw5aPhqHZlutn3iDAcKk5e9EGpQq6Fx
         Sk9Uq3ZagpqReMNXFpmPvnQYexxhq7g793HNVPr1ALZk1QpG+PAjwg2uCv5i319EesNV
         Q+J9EcPB97AaO+6Z6aXyyjz0KhqDH9NJFS46FHIL9dDjS7JtkUNw0a7CX3wK4IpS6Zgp
         tKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806895; x=1795411695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
        b=EBwYkIj0pf4123ax80cPrqxPJ0RZY1uO3YB+RWuy2mullGFCaco7qU32SC6RaJa8yX
         aV6CUtN6cwfT8afk7scylp+uJDOyLjxjVBr/UaImuxZQw6rvmB+AsRI3uUCi8Lnt+zVg
         mYE8mGo0bgNBe2sV8Rp/hbGBUkqz7JrfG9oRY0Kspng3o09yE4Csu2y65licuPzdEMYe
         bOIrrYjUbb81KasUbEwDlY8RBVxCHuK8v2o3rKq5zODIajY83VWsmtXxkpc7npPDq1HW
         amzXFfixyg5wTX263hvCbSMbALs87wm5UmIdvGhJ9YNqAvAsCl0tr8/tt9JKT2c7snes
         Ojcg==
X-Forwarded-Encrypted: i=1; AL+hErFoXI5JtFpSTAHRo92ZELs6oO9Aeo6BY9mg2uFllRgMEXFaTNtvggEHObWFhzWilxz3TXW+Z6QWq6sTRmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tF74Oji4A2TFXwIFrjpN6nR/fazFGwphA+kWzIoS24BhQJ1IK
	HoVe5xmhA5Z0YJsIQCDbTOCrqBu2B+mz8DazcIYAkInXS1Ak55VTDb+VMsoC17B97ssfS6dQ
X-Gm-Gg: AYBFou0Y+88ogy8y7S2WL6YCx22sssXv0cHyUdH8/wTieZwVWozmoMRcRCjAeHOsg2G
	3Qwlvgu4jk/nOwNjut1s6pZINtsQ/37RSFiTSV8DxkAq+CB5XeMlK0HW1AwV8cbJlIiCtk3ljLe
	EntK3vmU0gtebV0XQNlzCaARAFplJCZSk3fZQ3fKhPIobVYyZVFZxMwFqgyBc4MB3IonkdQfIoV
	z4iUxfJzwr7WZU7UqDu3WuMaLkABXk3ofIFKJDAbLbnzWz9Uq9AZ02Ye++3ZA9jNFO42gGFUZHh
	qQsbvU/HFGxs1Ql7Wx701x11V1tEZwmttLSQ3q6Ndsk9+UeBMVkyhoXIQJFinQqRe/bhrDnGCAj
	ib7XZH/o0Pw8YQDRASNMQhXPrR7MyS38bVewPZ2iPD4GimxXvN7e2Gy9CFy96lZeBpL7mZhe7sp
	BtSKDFrAtY7CIHgtz0puVwhjeYKOLKxXZLD1OQZOEy4uPAR/RgUC1vbCZLj6yA8rZowWHCHezYR
	gmt9NCK2myAhrs2D/Yz/bTwQwRe9cPk5Z0Mv7XUL5YbUjuj7cvoHdlXf4qfss+jJpA4jAYRxB5s
	HRQGJQr/b1cTMlU/jLbYV7sWFk+wPXG8TgKr50G9cpJX5Dv3M8gBVAOxWZNZ7rUBK2DZKpNtmUQ
	48YF0i82ahGkxePSc8TWp1XhxJKwVprS9xxxInTU1m+F3Mz2BmXJjNIer665IujJ7rW0=
X-Received: by 2002:a5d:64c8:0:b0:492:a72:92fc with SMTP id ffacd0b85a97d-49c740bcfa2mr19526408f8f.44.1794806895504;
        Sun, 15 Nov 2026 21:28:15 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da11c5sm18757547f8f.54.2026.11.15.21.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:14 -0800 (PST)
Date: Mon, 16 Nov 2026 08:28:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oscar Alejandro =?iso-8859-1?Q?S=E1nchez?= Lucero <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: fix asymmetric output buffer pool
 accounting
Message-ID: <avqUa87gQnzKyVF3@stanley.mountain>
References: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>
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
In-Reply-To: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>

On Fri, Nov 13, 2026 at 11:16:22PM +0000, Priyanshu Singh wrote:
> In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
> from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
> the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
> (err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
> 128 instead of 1024 as the expected buffer count.
> 
> This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
> false warning ("Freeing of pool 2 had too many buffers (-896)") upon
> draining the pool.
> 
> Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
> constant across cvm_oct_configure_common_hw(),
> cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
> and deallocation.
> 
> This was found via manual code inspection and is compile-tested only.
> 
> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---

This needs a Fixes tag.

regards,
dan carpenter

