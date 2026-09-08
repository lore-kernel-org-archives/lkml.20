Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7810D54854D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874357; cv=none; b=dAOapO3KwkWmSrQK0jy565ZOat/uFUYs0cZHWR/TDR3gMh0Yt6QBWCZOL46WAqeXsFK2AsOpUcTPpx6gbCHSmTAp0PNNPsy+K3qTmFDcYdtvchQhUdDCrDk/00LGkaWhvThbU7MMekDKV/jQFlJKGxz+eTYlkFIIfRPo9q+HowU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874357; c=relaxed/simple;
	bh=JW8E21rO/guihDfBOIiypt5b2Kbd9O7FW/DxbvZgI+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWUWQgBiFX+RFMuWouxtYa938SzJzUcMNkPybFQeV+v+OYYCx7a2Z9MaTmzY+gNCty92KefeO+lhVP2XsxYZfPPSJi/Em4YKBfb5QlzASpFBig4ikedErcNevXYu58s+cDCnsU7L32010Yd8JyV6cnAc1p7aAMuK08E/oKwrFzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFveYJvN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFveYJvN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso33918845e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874339; x=1789479139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHr0816mueEvVlfbn8Ovuy39Upgj12tVPzmZbr/dOzI=;
        b=pFveYJvND6/CGC8UBm9wZVQuezI9TCKL/J0voAOemG3bcZk1bSa1N3RXxbN4RRIUeo
         nafz4EwHoTD4T8woWrTZK9OsjOnyZhLd+ods55Yex8kOIP4oStVbW7bWa1cqrjUFWNH0
         Wh6oFKfZMQ2ETWba1a7Mws92liAQRtiQbOyAXbRbdzRra/kKMakO2cWKuejtKB+GG41y
         lpc3yY6ZCs4cX7tJYV8vZ1GSyR5LZkOwk2Q3NnpiVzggDikYlZKbMRaEX/66IDXd3pcf
         rFnK299EiGvZCBZHURiJaLCo4BjAGik/vgKGzPCYewCKQnhlJWx0teodX0EW1ZFYd7Ny
         JhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874339; x=1789479139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHr0816mueEvVlfbn8Ovuy39Upgj12tVPzmZbr/dOzI=;
        b=scAF53+yCoO9SRL1Mi0sjWpncrkGwwDXmK9x1/TB1C0BXq47/015ECROq4BZqHHZN7
         MCs2tiMhrWg+Go3LAw8NsXKK1NRMiHAwGv0mqTUSJJywiPDmqOzOW6zHY4BNpiN6PzRE
         clZ9ewTZYFSAaP6Gft/+R0+H5cGsDNkkZchGaqEk/2MDIXxBtuJJxKYZA4KpEkjSZ5ZB
         FmuUDrgQP3CW98tiBOGm9U1+fmKK8coMYDYXXUetxmSYFMKEbYXHkfdsX9gRYycO6wRS
         0UFQ1ym9DgiZoHjL7kUKk/hqELMUu8LoKTConiU2GT/2eHhYgcBjgPlgh2aGYuIlBGog
         wxkQ==
X-Forwarded-Encrypted: i=1; AKwUvBykAAwj7R44VBxBMg3HEg6nwamP3ThtgWkxQhbGU4TnlDkQk3CtFXhYSpal/+gc/c6zmdAmGsdFrfdQEFY=@vger.kernel.org
X-Gm-Message-State: AFuF++myOFKLEr9eKgOB+kDbVVObJ7vd0DJPVT/vZxBondkZV5RlLY5i
	LmTvz6w/leaBgvI6u3T6DFdgyuVvn0h+GI0P2TPVNjPLVSyH69CRcTAJ
X-Gm-Gg: AYBFou2Ji+PyuNsWQ+XTgBpRv4b7QpP6JO7kMLLE20nYjfJi0n+etqfkBSK0VElSBbF
	bgVuJ7lN/9ZzLAAHGBcdZFCCKA9D3/bhn2nRP/xzrpWHwdmwLL7YxU2mV9GeN9s0rIO1ndwggVi
	x0+rj28t8acy+zjUUJR4y7tCgHT8LmDg16BbnZ4uXAFYlK4q8It7mRXbyRxijX7ZTUEV0YRszeg
	Fg/KS1ldKig1fHOp3a3b2P0BLx3x1KeTLrsNYDGVXB0TsvNpY6ZbzJgVrRIPDslntkEf+eQdwoC
	F76uYv2KV798/emR+w2F4e9PufoXuGPPEgRHJdM43LES0F0ZD0WksuzNMsHjC2/0gimJhG+s6cP
	7L5PDutOCuzXQhRlfUfGwoWM8oFTHfWEfDuHasJyKC5XiQYR1pwn8Fb9lfmFKL6u+y9T1oqBKvx
	Sa/2fsa4qg50psLFJQTzbFxzDECm6Ykn6cff3Co5h1396t5rwnaWBrykd9epyGidRiv0CmJqbpR
	WVAJFd5QXq9Aw==
X-Received: by 2002:a05:600c:4514:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49d1e096970mr28504975e9.11.1788874338695;
        Tue, 08 Sep 2026 06:32:18 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.32.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm302377855e9.13.2026.09.08.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:32:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:32:13 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hrtimer: Use hard expiry when updating timers on the
 same base
Message-ID: <aqAOXfiVIJl3T5id@andreayoga.localdomain>
References: <20260907211134.3854-1-parri.andrea@gmail.com>
 <20260908110946.GE687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908110946.GE687043@noisy.programming.kicks-ass.net>

> Can't we do something like so?

Yes, I'll fold your version into v2.  Thanks!

  Andrea
