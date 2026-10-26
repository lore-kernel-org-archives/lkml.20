Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996320;
	b=TtXtn4YJuzRHmhE4e9ribsc9bBmKOgLIx7uYzfzuadY7d0fr/VkjvtLmBbQqRboCtfoX
	 8LQ4X98HB0cOmexUJR4kUTpgsqWZjedFClJwwobS8MHoc7kn37L0iPUQyBDOPEL0yDK8i
	 aW9n09rA3aSIcvE0BOZA3fy5SHSRjJrx3o8oV60+F74VwN4132albYjHTA8H+t9LAINsw
	 PCDt7te3/cT1qWTdb6XEMa9RPwFxNK14hupyHNp8T0GQnFEANJUWFEFFC+XoAV6pKNbdS
	 ZbX/b0vWqUyzkjoDWdPJrEgR7q+mIZbupDDM2fd8sB0mHtJ9I+BnsgNuWLe/0NCY4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
	b=VwAA4/0Vb1XWxE7rcQVFgFWoYV8Z5Ph2U8pLCD4GRVLbedDvhmA+c/XpGv2Ijw1crZwC
	 InGVGwyIg7b0y0JgCtvwkBBryX/9ZYsk9S58nsZA41ybG11H6RLPxzwe3jAXRb1x6G9qw
	 4QwXkvetSUNNphUkDtzue9Dy5DJf0k9Q9Li6KIqR4TpKzWLoMunXObV93wTjeYAob5Rvt
	 H3d5ZXHXJlT+I02eQNE8KOk1CrcazLCrdnjUjOBAEjgYjGELYABNYjpoRjIbrYbzIOUkO
	 WZywBkQxJwL3memR97PLJuMKWFkAKXvJtGQ0A64WqxRDejjiK2SQ3F7XK+YtSh/J+yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M6hSArX6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E925606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E925606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M6hSArX6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so7662125e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792996319; x=1793601119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
        b=M6hSArX6JTjMluSmjYq/GJ9BD/s2nFPth0bRk6RiRLDEulLnGhekr3ymAjJj4S4Eg+
         1fIChaBCXkBKX/HIsDnMjJVeWIJouPP8kZqF/WtRHZ+aDk/Iu6rsAqKs9w1T7EPmf48e
         q22bq9/rbFr6UIR67MtYv2oad5mmlv8NF2kyrgEoLMFLJfCcImAhrkRLPStxXsjCoqv2
         aA8RDdpB+qkRR9rQcPT6cE39SamMygPkRCA0oS5bapvyXwgK0Hl5WH3M1brU4wCiIhyj
         sUdWThdie/Cwm80dTJQn1jh9ESiKc8DVyAImvnTmDCjFUW8ICV4KS8KPK/FxIGRxW+KQ
         PsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792996319; x=1793601119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
        b=0XAlUW/WwOtQHlBevZvV8GZFkT6SEVNud72wMFkUpSmvk7Rlu2fQqb0GsBWoDMGWOo
         BdCINqw04zV9F8Cp531/14Im1b5JLQ9gjMWT8iW6bWeSYRsep8AkcBLZF0cvMYRJ3tyf
         STMgBAwCTxJ8A0kCKfXoR5yvLyHEuwBwI6J08gMjmsTUbkW8lZ1CsbQSR3tBJg6zvVLa
         o+9uVI43MYt8Lc/PT767GSn1cqzd7Ya9n6fpOv5kNbdZCLN3ciuAj7P3a9VucBTMyA1J
         jpSCzQU8WJ5yRAWvOCqsHy9N3Y2Hz/Z1xZYfO2ByM3hyraXxkZr3Wol9LQQWaqVKiLy3
         jSUg==
X-Forwarded-Encrypted: i=1; AKwUvBx6h5be6pDrNnoCaO6IDUSTBToggKTNE11koUZJ9C8GUSreXVoxdIkVppnJIZMklagbcJRHml4WlemCMe0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmUTyRpOXWMEy1oq4C0vmf+6xUehSry+eVkxyN0lTVLzEqqxia
	j5S0KFiSFdsMGOWZMljhhhbaM6Agw/woXDKEO5HqkLFjmdYKy47YrjNE
X-Gm-Gg: AYBFou2vCg2VSwuYUO21sUn/TKT4+5agp4dPD5KI8CKMG2n/bPGZrLEfyspBMz3iZnI
	nlQIijjnUS3t5D2dOUpnlNrUW54QKorbjX0/4R25vmgZNncZrdCFLztuwjcj3anzb9qdVZd2AmF
	O30VtgvdTkcso3UuhOkpvYvVS2b987cDbbR5weBxwwI+EzN6IwUqyULd8fV5IIRvZG17vSlE7cF
	1vOfziDwaytQgrscX/HIgi/oXriJ3Qw94pxND1ch7R5SUxS0tYx9NkSXjiFwasa6VAuVdbXIcTZ
	RiQrVK0zuW2qLN5raq+Epxo76xRIbvEc8UJ3ecGsWFnb8AmMonJH7Pp2C2AuRFabF2CYQMVNt4U
	RL5YL7Dcmp8ZM6VpmRml8fSpQWFVXZeYOfxlTzGzGAQgLHO06QxdWi+kV6Cjg0NdVBI1makEmjA
	UiFtn/Sq7ICMcs2T8PNmmr4RaEB8hXsI1znbY1x4pvi46z0XUXAZwHeBSVMFqqpq5kEGx4qSiPe
	2rUyA9KrJXN3DQ5+eWOZdHTzoR2nJXsvLFbKJTbKsPCke+ArWvzJw==
X-Received: by 2002:a05:600c:474a:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a35acb9afamr106677375e9.33.1792996318690;
        Sun, 25 Oct 2026 23:31:58 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm170484255e9.12.2026.10.25.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:31:58 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:31:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7z2oubp02WQb1h@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain>
 <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
 <at7s7We7bxdmmmSM@stanley.mountain>
 <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>
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
In-Reply-To: <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>

On Mon, Oct 26, 2026 at 11:46:48AM +0530, Himanshu Bakshi wrote:
> Hi Dan and Andy,
> 
> I have not found any call site for fbtft_init_dbg and just assumed
> that it might be useful later on as the driver develops. If you are
> considering removal of the macro, please let me know, I can send
> over a separate removal patch of the same.

Yes.  Please do.

(also no top posting)

regards,
dan carpenter

