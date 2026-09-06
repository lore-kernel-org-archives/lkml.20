Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFA33C1AD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714516; cv=none; b=esj2u2aGzzDQnCJKHv+v6MEfEVye4xg+/6V6w/9jVk2qK1yN3bZqEx1bKANuYre7V2eRFP4Dbq9Ulf6+UFgAqgKvJpNSBJqfRCU9f5WcLGal9LHPFfPJiuTxJ0nokuCNbFHSQGDk8ZwDv2bgNf/iKjGfqtXI5Z4iEsnTt0aATIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714516; c=relaxed/simple;
	bh=o8dhmQZK6NUEp7bIlN+A8R8OEGXpbaUT6LyILEBVyOI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qn7hK3sGPP07tQ3bIIibTJ82D8Y9k3jORDbsEgBtMY2Yy6byO/Vc/3YXaMe9J1bTddlh+jDnJBiz+bogq2LwQz00LnZYPfue/n6sb/4MR6TUOSW17ZG1PA97RZV/zuXIHUrtU8jBfpokDfFqKLzwtbzAWDCZIswa2QUcLoTbdfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEv6t4aQ; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEv6t4aQ"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66c9995ca60so3663988d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714514; x=1789319314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=waPq+1f8MAQW2drA+fK4ok8lWk2s9MiqHdPG9dnO1bU=;
        b=ZEv6t4aQcic+gy/hKOjAcSQTANeUesFAGoQ+uFLcxv/XSccm3lUeqw6OOGFqgwWIo8
         ePfOTbmS1kKN7mAcxdrZJGPLFs7xeeWhPW2wJd/MJgG9MBWFZeiC44nvnN/zU+7dCJtA
         VZZjCk56VEPEc35c1gq9pYB+uGRfM/kuVGyKpasfWlm/vCswwUwTTNfmRw/mx4FFJS0o
         C0cpvXyntZxGXhturuUdWQTW7c9ZQkBfGGvmdnlvf3NwqBAlkzibXWigrucfbF425q5i
         bM4p1D7GvO7UiJ8+vhx+097VQzY+5zSuPBTqX1wCD5ld05Ru7zSntkhhDVswFd8b0elp
         d+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714514; x=1789319314;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=waPq+1f8MAQW2drA+fK4ok8lWk2s9MiqHdPG9dnO1bU=;
        b=fWazPYcHmsjq3d+ZA9yBUyDLQZrdYWCmaHwTiypiF91JxizrAYf/rgmbAZyHwayKxx
         qECaZLVzsWuUZ7LyvqvsWb5K921caYBaayi3MXpF4PZCF/KtqWveag6OubNmjNOyNjjW
         x02llcd0+GUjNH0cqwUoaTVPxbVmgOme0/H7YKDlwqvjOrlL+/Wto3CSLkz1AviwXJ+l
         rlxANhT7pkMr0XPFCrd0k17MePniZ/+ojWQzm35je6tBiCEmRO6esVsP3Oi3FQ5b0CAf
         E8iTySPrKQDfwIF18EWu1ICI4w2Gi3NxOBFzYGuqj4sTcQsWpU05PZ9bRaYSnmpvJQy8
         NOYg==
X-Forwarded-Encrypted: i=1; AKwUvBwPkc2jCYw0B+sBZ2nshcU4NPyURqTv3sELs4+r4ZGORrz2PFjZOfa3bezzb7yqzFizGkJqkuIEYAJLNaM=@vger.kernel.org
X-Gm-Message-State: AFuF++nz83J7LdoJdi6TkuO6o4cNyTqk/vZys5Pe3fVMH6o6vdRuW/Fz
	RXMkMqL7fBTmNPxI7fomzhJm3HNSNUB1vfR2LRpd8juz7uwePWV9dKHv
X-Gm-Gg: AYBFou1rWkRuBVZfK/EAWFvqtgcA+zZa/BIB1kYDcFXR2UgYHpJA0fWcBFJytB2gZSD
	lhvgD/rqt82rlaCYHnTvC7WUqrArS79kjeJZqwrWTEihlA+bxA770yunIgrADzF5gb8TFtGy+6K
	HepP1lGsbo5F+B+MxmzP5arqTRyBWOpCowQBNWb7LERBcJSD/wNdcIzKHXC6pAWr8PtV4GfzHo/
	wGzbKIAfLBWKTNrsCotZHLN4F/VAE9GzCCn2T+YbVRLUPMTlNMUo2Y3vloheZaWmEAk49gW+05q
	SjR6P9asfrcQ9KrrMTyeVjY+aNHWildGG4GWOm4xmpPvQsx8WYnNKwQ+m38C0BM2IRzcINVjMbH
	J1212kyopmSjklJKi1XDoP7RODq5FL58AVlbFfgtM9krMw0LwIfU1Exq9ZBDKjtlJFJ1oDEirkS
	HXFyQcnoPeyXy+w1L6Avad9v7LhijJHIKp1DtFZYvI4HhltEJvWQS2N3GN7hoK+KNYCQONtDnk9
	ShkrV2fg0+xNGhZV++cnRRt971oLw++VAwwKBuRPA==
X-Received: by 2002:a05:690e:258f:b0:66f:c1bc:405e with SMTP id 956f58d0204a3-66fc1bc44d6mr1456669d50.38.1788714514524;
        Sun, 06 Sep 2026 10:08:34 -0700 (PDT)
Received: from gmail.com (234.207.85.34.bc.googleusercontent.com. [34.85.207.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316347sm58780277b3.15.2026.09.06.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:08:33 -0700 (PDT)
Date: Sun, 06 Sep 2026 13:08:33 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.160e8de2976b3@gmail.com>
In-Reply-To: <20260903-psp-prep-v1-1-d47e9c4c375d@gmail.com>
References: <20260903-psp-prep-v1-0-d47e9c4c375d@gmail.com>
 <20260903-psp-prep-v1-1-d47e9c4c375d@gmail.com>
Subject: Re: [PATCH net-next 1/4] psp: refactor psp_dev_tx_key_del()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> No functional changes.
> 
> Lift the list deletion and tx spi validation code into
> callers. Deferred key deletion code paths will need similar checks
> that a tx key needs removal from the underlying device, but will
> diverge when it comes to list handling and when to call
> psp_dev_ops::tx_key_del().
> 
> Also, move the predicate for tx key deletion into a helper for
> readability and reuse in later patches.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
