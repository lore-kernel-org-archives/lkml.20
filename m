Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A044279F8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917130; cv=none; b=RPsNs5lTaM7+X+GpOONaveGuJ83kpTui5um+QQ2jK8LcbtpJ+ulOuD3yCcx3xVEMnhd8A6hmeUxUX6cwu5XM/jQ6d1y++D+8PKp3UEDNVUMyC8s0aYr1gFA7RS+dCiRYGEJ4Ek/NUCRzJ8Akcm79D1mfxl4luxP1EW9ynhDSRjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917130; c=relaxed/simple;
	bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E+IQpCNY7w0s2OhEbptFlQl3C1l1DrzLMCvGNBaDh0EtF5OnZ4uVHlL0XDrvy4Gea2fkShD31co1qasaOEmde7N7S4xY80J4GDuMRcz7qK2BX8MDoHgbDXtxEy7vbjbkEiexo7M4+GPkuX9E6D4zLTFw+c+sSazvwKZwSu0PX6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctHiZf2i; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctHiZf2i"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so14830465ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787917116; x=1788521916; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
        b=ctHiZf2ioYGt3Jm1wRubl+N493WD802o2/6q4EsXAFGV7NvtfWLpKdwcM++uWxiAnY
         oybNAiwJrxGkg2ltpRBMMxJ51h+aMkffcv4m3CS+WoFgN3rTTiGYJaRHZ0S/Je6OtYjf
         KXO77M2AkaZRQY5t5/mxYE5XhRIEjPpmDofE3xEXyNxxhoKKbIWNtj2dbHoWo+J66e0H
         c034Gtp+YI9dGe4OHkmL7fBKXx4kP5+e+DtqpdaY2MeLV2ghUMZnwrLEwkFdOJlnSB7Q
         WJWyHIQfSIIaWN0kuVzR1FnHa5n/v4IgzlT5S+e7nddtlBXcezVNC8h9SqSA6S7Jv1aT
         MPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917116; x=1788521916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
        b=D9o22u/oNh4Re2JUOqJyQhaioc9Vs4qZU0YQaXrJrmRE3OCck3BCCjl2XsDED3g1pB
         KIWXmLEGBD8d/P6K3lWCYA3u4ozuov3Vvptnflk0qWsjcjVJIYFAxGhPTub/ELj1U3Ky
         SJgIgVn/Q+OhKw+xpgCFnnWfOat0VQzGA5w8WYPib+UieZZwuBDl409z/TKoqPSaTe1R
         6Qv04TJ9FJ2+q6uPTw6oXIKLawc7oBXJEeYhzjLTHlIWqy6eAAHKGCsS1uXRT26RmDTN
         5Jkz32l4Wi5KD3ay/SOAZ3g9w2wyTUTvq8+94L+LU9YVUhWiWD+7A8QDmn+Ez6sxNPs3
         g0Cg==
X-Forwarded-Encrypted: i=1; AHgh+RpBfUhchCBxxqFCAhNWcLP32z/Hp5f3yT6jKebs1W5/w0t5yIw1asDsqOWVX8SbmMojj54j3ssM6YWT18M=@vger.kernel.org
X-Gm-Message-State: AFuF++mmdUIwk2z+ahYFIfVPA6Bmxr+G4b9DocFJ4XnQgY42Os7iYoXz
	w35yONMIqAK3rEajTTNJxsXGLihDoskZiETDsXPvS54oCgAurH9BldWiXbL1AO2L4BER0ale74R
	mcw==
X-Received: from pleo10.prod.google.com ([2002:a17:903:210a:b0:2ce:d12d:d6f5])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b08:b0:2ca:e62c:9e96
 with SMTP id d9443c01a7336-2d74dc51c7cmr135512585ad.5.1787917116239; Fri, 28
 Aug 2026 04:38:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:38:34 +0000
In-Reply-To: <20260813063503.4023719-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260813063503.4023719-1-wakel@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828113834.2354953-1-wakel@google.com>
Subject: Re: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-rtc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

Since Shuah might be busy and hasn't had a chance to pick up this patch,
would it be possible for you to take it directly through the rtc-next tree?

Original patch & your Acked-by:
https://lore.kernel.org/all/20260430120313.4078185-1-wakel@google.com/

Thanks,
Wake
