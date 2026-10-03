Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504943BBFDA
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791052942; cv=none; b=rqD8ZzaREybzwJ1XvKHw+tHO2udF5YA0pKEJKC4hGdYtTZtNZG5nLSsuWwiG8n3GC6U6x6tlFFOA6ryAa5eFdcQaY7NlmQT+J8Ne3YWxWfjfu2Ak510QW9jUDGCu/uv5nRjiNhj/sQaToaZtivuhNYFzgp9HGuOr1NRyVzRb4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791052942; c=relaxed/simple;
	bh=DcxHkkjowzjjQfxCs0Tz8a1UmmA9KOa5xk2Zh+Krr0w=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=k9qKGpSXs7vHAC0EyHQJjCybO/zINVk/UxjWZjYV1NZaWP1LjleKBzxFsk7hecO47dzhCXpYrQA2vVCSEsB0RtX/rCtPxpNV9XHISbqhUeoqjQAvwpY4U+XV7HVM5mztXyaiYz/KnREK6D8ViT4BNVxxJ+2ZAX8NxkDv24jJp+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3BB6B6t; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3BB6B6t"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8a83d2706fdso4167017b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 11:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791052933; x=1791657733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ymzk38tiNxzMGTjhcCuavqN+NmrxJFDts1CbeHFNODw=;
        b=K3BB6B6tuKDLKo7yX1ysnI9hMBQxf/qGMGPqKe81M5MiNzRYe/ry5MrekVH+0Hzw34
         Ah+B1AJ22mkG5Z0gKYTJcNNw1kALnjhd26RDDXXCYYaCyrHlvEpJfLg0PexWoqkXCJMA
         aXD5t3sW6jiMSgeY5yua8pgPDhXYYyHRXe9dgff7BMIQW+s6fVeVQqnYGF5/IJKBf0Hk
         fS+6HvoabuMLk8MbOGjcQwxQKkm7N6uOS+tfsEZR2RH2Hgi+/93Spk+HMOaMn3VBWYM4
         2mWhmg8u37r3XbLEng5MAUy7bKjPz5YdhgKwKew7KtLIG8SZhAIPDyqTITaCdSQgy72b
         Cvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791052933; x=1791657733;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ymzk38tiNxzMGTjhcCuavqN+NmrxJFDts1CbeHFNODw=;
        b=fBEp2FOZCnFMVrOkxAXIbDrutvqlXwmDdiI2GgeySIyNG/kAOE7Bnna8nrr8qt3lUn
         jwTELrxgXNqMnmQ99fJBHM7ixrH1M2ccBhXtuese7VCSggt3zqF24vCdnMZaUVsszWZd
         Kk6kc4gQTtWVhFkdpuPTiBom8u0ss6KH5fEMIZIVNhl997B4eByD5/Vn0rwJTX6tnlzQ
         WpgXUGL18zZb2KX0CkiCb1Eznij5++M3Vmu3xJx7vIU20jrh1Z6UxTURIa6rvndwrT0/
         tKL8Kbw5SRObWpbAAUx0CNodEbor3NlGx706i1h/39Od+YV3lMHpo4A0iwU4gkA1lESh
         +jMA==
X-Forwarded-Encrypted: i=1; AKwUvBx4DKL97MOcr72vjhWSz0pXDkm/IIpzt1tOBpLCjpuo6aQOukdnIbX6zeQj2om5ysRAWYpGur/UbIL658E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLarMWripVK4pY1SbeuubjfrXBaqxG+Wczrl6YuNcwB8ps3GSEn
	As4msjL2aqQbA5V2LqOpYePBQ1SZhkq09RbMJc4uyMJh7U6HZL5eRrqb
X-Gm-Gg: AYBFou3VYEUSFCkmuGYU1LOiVH3CKBfiCmBp9WsCnOQgY9lNR0WlzzweApiYr8Q8r3s
	/qEGrDKP/X7tPtsiKLyjDQO8D3kGLzJ3CDDoftb21JfOBmqAxfLKs0a6SRDVspn4wAZRXEkIR8S
	APOrosMXYsg/VOU3M/lsDoyeZUxljX+xxPDANgsutAcTVvUQyxv6a5VpWSQKIKCMPJYO2qrKmJZ
	gmuX6T5s3Z60fnDw54WGbE0wPk0IMscRp9knOjXko9QQoj8dkieZu922aUFH1YT0g38PAyTn1kq
	3GUIj9Rs3ROomLinqFb+EBXgA7/Lfy6FTU9OZWYpiaPOhEtzuX3q/cwCFwplcvU8mdZ3rDyVrrk
	suqokjzWl0LDN4AP8YH3HLJLWiX3rxbZq4lJcAMjHILzfUExUq1b2ZQX6z+8Gg4A4YQsrYNSR1P
	vYQEPN8Rfhbu8QT94fOQngzTDjtm8h/dFqZXiQqBQJ/rtBnRLWZCgGLO0xy/4KXEAHgNomNc5NG
	Z8WmUjJG08UD8kxTVGu+fWsoZg60Ded7v3u8Wlhp0mlZ2gZymUc
X-Received: by 2002:a05:690c:6e84:b0:8ae:844:d95f with SMTP id 00721157ae682-8ae9466a2a1mr11852207b3.0.1791052932852;
        Sat, 03 Oct 2026 11:42:12 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae2ed25172sm22773897b3.0.2026.10.03.11.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 11:42:12 -0700 (PDT)
Date: Sat, 03 Oct 2026 14:42:11 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jiale Yao <yaojiale02@163.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Message-ID: <willemdebruijn.kernel.2bb89b342a6a7@gmail.com>
In-Reply-To: <20261003093822.544964-1-yaojiale02@163.com>
References: <20261003093822.544964-1-yaojiale02@163.com>
Subject: Re: [PATCH net] tun: Drain eBPF RCU callbacks on module exit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jiale Yao wrote:
> Replacing or clearing a TUN eBPF program defers its destruction to
> tun_prog_free(). In the device teardown path, tun_free_netdev() can queue
> this callback as a private destructor. The rcu_barrier() in
> netdev_run_todo() runs before private destructors, so it cannot drain the
> new callback.
> 
> After the last file or persistent-device reference is released, tun can
> therefore unload before the callback runs. Drain outstanding callbacks at
> the end of module cleanup so they cannot execute from freed module text.
> 
> Fixes: 96f84061620c ("tun: add eBPF based queue selection method")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

In response to the bot, from the previous series's cover letter:

"These issues were found by a static analysis method"
