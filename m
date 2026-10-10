Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EFE37F738
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596286; cv=pass; b=qjTX49kTBRzyTDH+SZ5y3Rg1a5FSbOX0AeA1lUcSJ0ip3PO4EoW3XOVoDlQBerHt4DzUzv9LRjzAKaGlZjtDS3yMXmxBRQOXC0yxBK0LYwJwPOAvH7UB3i0umtgViXINxptRvmQqqyX2uFllZrWcixwOhYy40R1d40wCgSkhbXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596286; c=relaxed/simple;
	bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpnxiYt8sod/1ictMZl1ht+dTOMMAv0hdPwZcErNeJQYnyGxzYhYo5Q4cfuDwZCRkWI/T2ad9JV00VTg/Td9lVGhjVBv674Ni5k0T6z8x8y3Sx7vKOz06uSGCHEOZ0Q2apTBmcBWo3NRKBYBSUvSPprE/6uZU0PURREnT8JrFWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGxKbipB; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGxKbipB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so3056181fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596283; cv=none;
        d=google.com; s=arc-20260327;
        b=lbQwth+obSWZMx4chz381mV7ZLwG+0zhsxazv/wtlrmQV+bgRKEZ2zxuHfaqBnLBcl
         pv+6jzH1Yj3/zxnOZdFapb10NXA6H1xqIZnavc8uwkbghqCa17P9dRSGisNYeBqhNid5
         tMWrb9/q3jGpQptr/f9xwRFTrI+eOVU8k0Fg8e3rUZevrQjJzGcU2nM7hIlplEbsIoBk
         3x4MtM/qmgQHvkhpymC/mNOIuwPKypAeRZxMPaBDeYafQNoLAs+tS7+D/KPaQO1FA4eS
         fNknbvk5UhSBVjcxkCKOP4XIkXyo0zIl/Vaj2D3AqBqY5VWcpPL5inMBtUygg5gSh+nI
         qY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        fh=T+JaCZ9rJveBj4zP6KZm24cpzw4kH5dsm0TV44jSQHM=;
        b=Jwu8LHZAIkYDx+/V+xmRD+avye+pqp0/nXbseIilDbmvuxuU4THZ8M6u8OgRmR48Yq
         CVFK+y80K2cuS+ypokOpRjsA61RKkBpAP+7Zpq6KDBYM1lVNRO74YJG74D4lKs7ixLh0
         k9RJa4QgMsErvTH/KOJ6u8ErXWaHL6APOzG0TnIvHp1kSncNoZ/S8gpr+QtOTMMGntNN
         h3bRa4oSgudoE7ZkA6noBphi29C8fuXVjTws1X03SiUu31DXX1cAHWXEG2NRzSHW3nND
         iqPKsnHEwIa8d6MVGJg8WFV7F9w6AK2X6Dj0ZXvYvoDenwzJgAgJVaEnIeCv68MPzzAe
         RAmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596283; x=1792201083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        b=IGxKbipB68o0TLV6KLhgXmUvQAFN+0RSiZtmxi0ppjf4fOzeorM1N+AgzHHCvAo00S
         zemG2v8PcZ5y0hG7Jkfz/EjUUfoNGyeGFkozYyHR1VZdvUGJL4/p4upP1AcYdhP44zAV
         D0WVuRxaFq3e+tQPiPSrkFt+VEksullte4C2QE/qFjNKELOZJK0F98Q8XEOc87Rrq8R7
         LQvrmUv9sNYHMfMANvTO7NR5VC2RnX1wIG4ix+5XJhwrz42UiIDmkM8ayVUE9d4tn3I1
         l8KBHamES6AOV94Mm0f9nnXkE1Z8cl2G/KQbxTAqBAZwEz+vmFwWHnMWUMiGp0OaKbEA
         vbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596283; x=1792201083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1YUmKKSmMhx51by4j1VRxqcJQ/l6HdCcVZfWVF8o4c=;
        b=d6zwp9JyLRn79QGTw8goKyhLYUOUjNu8Ke/FXsSme2701GHNLZ3TS2dQPrDjq7O+8v
         pLbzberPn7db5mQDESbFRui81AZpAO9gRZ/kq1E3oIkQkCFSkRZSK7FsP2MUf3m8eZKm
         iS2M1yzhRrhr8s3A6oSVUAeBxvEpp/T907A+8Ec/D7peClYwKoQstBcqyR/COjiwIORa
         UvdiIHyKYLxUNRCMvWhUMqFG2ioHhYRF+pKSUnPKLpw7iGJuIh1Mgd69SwZPDXQFp7SH
         f9JbAEiFM6KdrLrpxosyc/uRoVJQc9iGLcpWSVOSjwIs7iDzWqo7g6ntjkxIZpJ50zku
         tloA==
X-Forwarded-Encrypted: i=1; AKwUvBxtS0noi1H5QNlapa41sb0J2N+GCbG+/x0TDsUYXSFofZu68y9FS9ilpgKyEJVe/2ctB/7pCvgOIjYlLV4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYWjOEULh3T6B7qLcMc66fSUfW2lRTEUNqIUZRidFENdeuU1Xv
	3Yclh3tXdh1L3bohZ1WYjn6/TMVIFklZYSWe+FDjCy2zUYUHmBYg+RUfGqVk7kI2dFkTiECB3km
	kCFpA6UPS4lJVlAWJThjXG6LrREtWzy8=
X-Gm-Gg: AYBFou2qdhlegYlgjvC8Vqv+Ovqgw5x7tht4QvKfZkhoVu62NRE737Rqsbb/5ekgYb9
	yK2gwZem6ezy/MGRI/XjLTbkUus6NhNGqgVPYkNBMs7AW0ksgZmX6khCXzsDORY33+/9HaUlneg
	z7NvkudadvGOXW9BSqNJkmSQFIFWU6p3WNIa/ueqXk0D1jHS42GRlBNlmVkbjqK2MsgJkX6mPei
	7VAPckxw10wqPEp+cHTGFM7m78ugy0g5WhYJQ1b/psacL273oZlrVVj/tbpYBkSxgH63X4cfQA1
	29ekGsDiWf0P+bkBNwho5sPTbpyeX4CVNNXoi3/VS8Pw1jNNBujoaRoa75resTG24GHC5ZKXvN/
	arnKoylSl7ypbLhrPU74I0okQrtuGP+349D+EtnBmDSmupDVXTgsxgJToCaWhwRLlFwKvwn0=
X-Received: by 2002:a05:651c:198f:b0:3a9:6f4d:b32b with SMTP id
 38308e7fff4ca-3a9c52535damr7619141fa.4.1791596282763; Fri, 09 Oct 2026
 18:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009115627.969047-1-linmag7@gmail.com> <20261009115627.969047-3-linmag7@gmail.com>
In-Reply-To: <20261009115627.969047-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:37:48 -0400
X-Gm-Features: AclHuK8JgdohANmvDTbCTJI-lrC0lc-owpC4Q1qv3oLAqF_LxjHp5E7akWIdg28
Message-ID: <CAEdQ38H7aFjEouWvwkVd-KX5+fW-+vT6ap1QRvZDbiRp9+Natw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] alpha: describe the Tsunami system machine check frame
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026, Magnus Lindholm wrote:
> Define the five system-specific quadwords in the SRM logout frame,
> as documented in the AlphaServer ES40 Service Guide, Table D-19.

Reviewed-by: Matt Turner <mattst88@gmail.com>
