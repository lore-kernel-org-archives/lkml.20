Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793378250;
	b=1mmP1aMke+IcU+nfA4UHaYivOfhJvbp7dXJqTfQp/0BAmvlDTZG4ytiYRSbmkFhQ2Omd
	 yVZmHQa9F2jThaSrMgcBGGuDaVErZFrBjSKdTXChJ/qXPtiZnFDdvx+2pf9p45WmRvZre
	 bNuPaohHD+vfpMjIOh8No+Dh0vE7T3o7jWlQTkaWo3XIGcg1CAQGrKpJ6TNVZ48SJO7C/
	 sNID+Zd/zw3tdZEi8VReXSO40KhLPabHva82zWyvH8dBQbnIEag1X64hWWqFbfU2NwCdI
	 45l8lpx7zKsgRr2b2NcMZcfLCsvxlQR2gaRIT2yY5T5utFr8pif5Z2369LIkhMXAFww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zAYL3j86a7Q88ddu69k+6OJol7/H9flq8cPsx2AHE54=;
	b=SyVjVXl/7otxxFjwjdSiUjecQLvCPI44zZd7qcawA7ccM+RxNsJL0JPrEEhRfF2QxMat
	 5DiGb+1xG7lryZP1HQ+CTyUwV2+CHk9jVaVv3jN0l2aLlLnZkF0cuWxSp0gQ0det30bEW
	 c0cC7VvZdPVZLEaNA4WPfQ0ZyyVb1FvdTNB3/7IjarLVnNZq4IyF2Do/wQeQrMnaXVPEU
	 kJWwLPg6OZcDSBAX4+2YFOpcIbsqarObKFtD1IGAW7UiLDexuVrodOlAG4PyrmVo8aLSz
	 2hoXVi9z/Wa4s2eCjM3qAAiaUx++rfs7G4yJ/rcEX4LDNYznCUzYtT18Z48CaS/EG0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKB03Jte;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKB03Jte
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eab93a9862so211687e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793378249; cv=none;
        d=google.com; s=arc-20260327;
        b=jnWffD1YNmnqKFMZmjhuLVW2abEGvRSI59F5MgiFH+WNVqePHA/m0RKOlkGL6ZagAP
         3QbtFmBRxkTfu0MDj5ys06E7qYMTsRC8ay91IHupWPtNtGE/ubt/SgumfFCkngLBdacM
         yfejdqEbzpTSnvZjXOAZqpkGrkMZfPM6OgZwNc2lTWJy/R4mZ8g3z4fWRgE3v/rnQ4AF
         bqFsYoMWERviXo+TnRhdLx9+311sC4Dibp2AnJdr02XRdbT5EzqjGsGOSILOwdLjNxL8
         iIIWjSvAKMN6jDjL29AK0gOQVDIUx6OAytrh1DkNFR0SS13QHOZ0Cz2jCbpjNBKZFj7G
         V64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zAYL3j86a7Q88ddu69k+6OJol7/H9flq8cPsx2AHE54=;
        fh=NTKIsPc8s9kXjnjk7v5tM2cKMaV6fwrwLh6frBc3cM4=;
        b=qCGT/v+WdhTeuLW3EvDQmKMrb+IJRz7oQS0kYyXuwClaqD136d+/gLE7uLVGD98/KE
         OTCC1XgaJffdv+tiRYhPxlNH0aBhU/OlxeN9KftqvzDisHJpuuqzyXgz03J28Co0+eqo
         jNl2DLIKAhgk117rlrNjaOrXntjEmWkNRa1TPyxBvPUQNBhkca05Wm1zCHxzF9Qkd9j+
         3Snlqn0d7Ch3jgR5hcby2/lPbp9zHc2kqWdUCuq77Gyfp8lX20NKMtqBpj8yOReRuBK1
         1R/hE6N77dU/TS+8Rpj0KyYCkBPSH54SXi+DAoo1xxpihISUB7OSsQr23Ow3xF+jTUjc
         BNGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378249; x=1793983049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zAYL3j86a7Q88ddu69k+6OJol7/H9flq8cPsx2AHE54=;
        b=JKB03Jte4+7R2ngephq58nAE/tcbmHPMF2QEwMNcXU2F7eetDr/WOmYYlrl44yTqtN
         RIh8vMqfHczAbS7oGRzxCVewG5/XeZzhAJyX39H6+H0XsFYxArtwVV6LWtWjhdQIbx/V
         KI9ZYuayZ4HpVmreMInLlqienLA+uWClI4EWmg606uOzKOtFAf3NtWYG2ZjrwUCojYMm
         je+haQM3/zKDV6LHPvT3lA2D7L/EzQl5NYYnuokdS8L0VywnuRIO0kr2ekPxYeF+wBhm
         vPFJGJlNc2AQkjhbFmM50CKxUl3Bp/vnrm0svDBLygp6UjBwL9P8qCzytttXGRW7vh8n
         ZOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378249; x=1793983049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAYL3j86a7Q88ddu69k+6OJol7/H9flq8cPsx2AHE54=;
        b=NrZrxTXBAW7fmZOzgHhQRdhVmizez2aUXnnIk2CjlZlL1Uid6DPhDEc+sKw9+9GA92
         zvXZUct7lf/kKJOSyGxrbApYvif8lXhpR7jZDkUovwm4itbl+TFVY1FYN4jEbVkz7/ZQ
         fQprNHnsq13XM0nZgaTTuw/u2dcn5ympohZgc1E3MkWT4sW678NtBf5qL9jQFU47Xv8i
         +sACHbhaa6p5ouMP53yTK8a8LTG96H7NUJXOkpqjC8YhoEu1gBqZnSv8TjqI/5FUydFK
         zPeCfjQ3b9b3w0uGZfpwtq9U/jgENqme7GfGUkkK7D7VvvCmtORhoyMgO7GUxpGn7v6e
         oMKg==
X-Forwarded-Encrypted: i=1; AKwUvBxTc3SNkhFizt0RCzrLn32jILr8BDJgB8kW+VYOt17HnxfIvITElqirEst+E1ECSuvLsLJ5h1RBYWcMw3Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxv/fSamIpb0/6YMxHbajI69MgGLUvYQ1cUQAVG2ElapSoYmPH
	SXXDy1kSS+V1R3p6ypATtMFIntlB5VkfU2dzwv+Lb7FHq2UEoXAc8rAax7zfAlgTJznRuzVlRrx
	CMqN1fDeBQsz3ZZRH3KJ7hDMLuyqLKhQ=
X-Gm-Gg: AYBFou2dVsjJ2oI5GZGhivIAfWa+K+hDjDCKHBIAmqujjPUb25UcHeOQm+Ot4aQSyO6
	wskuG888tf2bz1Z8NRb1MbhQ8nYzXjbMq0RduOHjeGEQYcW8BKulRHkBCDWy4BGG6FeZTkxifHi
	cN7G28nzMMlXse3V7lDmuXoTbzqnOdfmyvIGMzcyx0higacNjQlCWjVelLVpvmR7Ti2eMXWiOoO
	poGQ/eZlrJKYibj2mhk4Hr4+21JXsh0EJhCqtdrc7Kka1e4rFRc7WN1BUhzvGAbNFYvgxDBUjlT
	yPKPJfjM+7fjpWbHA7HTUd2bnxNlWLLpLscjSlPpy23EbXRkGb5whmCL+o+8LTpF7B9Cp05KdF5
	Qaorm2ddhKdsiJfnhx9Um9fryT5d6JR0x01KPnjd/Gu5ab2ID5hh1g8je6D6Sc85Iv2oDaNKmd+
	YNgaF3RUxZ
X-Received: by 2002:a05:6122:3d0b:b0:5ea:d1c4:7cbe with SMTP id
 71dfb90a1353d-5ec6899a08emr1698294e0c.23.1793378249305; Fri, 30 Oct 2026
 09:37:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030161046.1497894-1-gourry@gourry.net>
In-Reply-To: <20261030161046.1497894-1-gourry@gourry.net>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 30 Oct 2026 12:37:18 -0400
X-Gm-Features: AclHuK94a7ygO8e952sy9QWMqMjYz7wrdIjjao0GQyAzyDD8wGX-wdE4eecWNOg
Message-ID: <CAN+CAwNsU5cOLvvHttz=9FOdqHEy62cmvVmJzhL4_1EhHwfyVw@mail.gmail.com>
Subject: Re: [PATCH] mm/mempolicy: use one node set for interleave weights
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, harry@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:12=E2=80=AFPM Gregory Price (Meta) <gourry@gourr=
y.net> wrote:
>
> From: Andrew Morton <akpm@linux-foundation.org>
>
> From: Andrew Morton <akpm@linux-foundation.org>
>
> Switching weighted interleave back to automatic mode while memory is
> being onlined can cause a kernel divide error on x86, and a panic if
> panic_on_oops is set.
>
> reduce_interleave_weights() scans N_MEMORY three times, but hotplug
> can cause N_MEMORY to change at runtime - and torn reads on that
> nodemask can cause a total sum of zero bandwidth.  A node that
> was hot-unplugged and then hotplugged back can then cause this
> loop to generate a div/0.
>
> Record the nodes visited while summing their bandwidth, then use
> that same set when scaling and reducing the weights.  This gives
> us a consistent state even if N_MEMORY changes.

Makes a lot of sense to me. Thanks for the fix!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
