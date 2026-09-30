Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F54DAF9B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780549; cv=none; b=svNJPB/QnMYuIqa5gKR/YYRmghjvhHNZFBQrt/16aVNYUyiiNPNSLUUxk7xIzkXaKPLkO6z8WHpopnfrdrynWFQKZPIz6m2A9lj680iG32VEuey4iYB5fzHP+OnsVbAV7K/eJA9h+C2BinRwQMVlCRRw0/nVEyVvLbOfgTvWn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780549; c=relaxed/simple;
	bh=et+Drx6YdkA0OmFZ8A5zPCscUG0WQh2QP4yccQGJySk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=R2kK5hvmg5Fx0JK5TdIGOgItMvtkyWbCKxOCONILmH/QYsKTQ+atdrKQL2O47KIo6B+T+jRCgIcBFZfNn7i9Md2aFeRDCG2xBqdyTXhgI5d173oz64ZtkxUslPGMKTp5cta3Wp+tklCh1FcErwImA1nQTna431OiUM6L+qNf3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1WuR4gz; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1WuR4gz"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8ab4b4f3d6eso8202037b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780535; x=1791385335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6/kYvub5z3tYxzJGmlTCicIu/qxHQ3oYOee00hBbq8=;
        b=l1WuR4gzmgiQp30ee6KF8BYqyFF96ZmkB+3/3lWNwvvKcf0bxtmN6msaEKAf/7HYC3
         858AbfaQWIDCpZprxRxQ6faNtyZvIt0Wn+F7gwz66AfHujgZSKYw/7RCophZmxjuE/34
         G9GeYWl3KG+gAmDEfNm480qjJMMjVrsfQv83o+jLfaPG+KLL4KHkbNnGWlAPUXEE+OI1
         reG+qXXArC8hf1GbPmzvoho7a9XXTJIFy0SGMhY3zFURHTN4C1ebnNn9zxY8HNtTsqN+
         g28RKri9SxygDE2zbzXpTNJcqWT+Z3T8NBzW2F1P3cwwA1Vr1unlYMjdj3I74Fc6UByL
         BZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780535; x=1791385335;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6/kYvub5z3tYxzJGmlTCicIu/qxHQ3oYOee00hBbq8=;
        b=zqID+y/f+Xsu0MTFc/r/4mL91v8EE2Prb+2vei1xUGqQSPpRxFOvhiXNrg8OulpsFC
         dFlTG4otFlUj1pVA7Lil+UGZABcQqtDcGL62CRANA3XfPIrRte0OkXPTvmfhHVntKwWG
         IUGEjnDOVgwnK3rrADzorrQ7CYbMtp26sf7Chr2hL65dDf93LPssYaP8HZUHHD70yuCg
         KPRAs5Bt8PWk7KYo359VMNtt7qytoz1AZtxhmoesCXsGc++feZe1kxqRjlT6R1ogdNWY
         yn4K7VdluTn+dXhuZsBjhH2z1C+QY/ybSjFB+Snh5aOFJkQQbX91GWolXqKlDIWzVwds
         MqIw==
X-Forwarded-Encrypted: i=1; AKwUvBxjZQ2OYDQcRfC6O5ZPEV3xklA3aCvhFicLL9Fwp9QCU4OTxDSwo6gHYTAWgZ7FpEA3grJgo1IZcOgImDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCDcTkDmlt+i+W5v6LclVrDkK0da2yKqhJf9JS7R5xZ0Eg+euA
	lTsrMUSkmyzCXlin58rr332fxnYIN1mb+t4czBF6c//b7nVMQFG+gfEu
X-Gm-Gg: AYBFou2PdMx2FLL9+nu2xaUjDolf7phyeYfALtvMCEFZt3o8dhS5l+SQsiigSRyYmG7
	6jfRv+DaRFDfgh1hARZr3c+itNNcXmI8XXKZMXiGe0Na1Y896NQO0hFLAgHlwER8ZqCh1ebSsFW
	MHbQYjgKJS8Bh0ctO1ih3rIqWJ+OfEwFW19fIcmQUW9XDeZSEqn2cUQGpYu1ypPPUNkVwcK0SCw
	0Z3ZLXFHQhPvhsTzreuyfaMa2dfHq+rOoNAnluJBJZDTEXHSxyHuItjmc5VY5KUrethSF8vSp+/
	TfDwiBm2nI8A0d0Wu7LReMFYYKVMxfAPHaPxRPBO/bCysxS6/Ux5bOMRm3676L0nfLbXokqN+Ig
	vGsz7dfsXOrwYXNpVuWFOcqVpvnj7DKZrhdk/qmlNsfm/xp6LL7FBctSMvsChJg0iYB1rHq5FgG
	RD3Xkfa1zLQRkR6OcIbrKyJclUMAQ0LKwUPcoEOLqcyS33gF39pjGfms6zT/edyWOt7tqqZDmmv
	uX4fMGFv+AYqFiTT5pxwW8tj1ftFA1zWO6FEl7EMULwaW6vKydJhg==
X-Received: by 2002:a05:690c:38b:b0:88a:99a:6ef7 with SMTP id 00721157ae682-8ac978ff21bmr5593247b3.29.1790780534647;
        Wed, 30 Sep 2026 08:02:14 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ac5438bd45sm7210827b3.41.2026.09.30.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:02:14 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:02:13 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2082eadbd651@gmail.com>
In-Reply-To: <20260929142238.41742-1-umangpokhriyall@gmail.com>
References: <20260929142238.41742-1-umangpokhriyall@gmail.com>
Subject: Re: [PATCH net-next] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Umang Pokhriyal wrote:
> tun sets IFF_DETACH_QUEUE in the flags returned by TUNGETIFF when the
> queue is detached, since commit 3d407a80b62f ("tun: Report whether the
> queue is attached or not"). tap_ioctl() returns only q->flags, so a
> detached macvtap or ipvtap queue is reported as attached.
> 
> Cloud Hypervisor ran into this when checking queue state on macvtap.
> 
> Report the flag from q->enabled, as tun does.
> 
> Assisted-by: LLM
> Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
