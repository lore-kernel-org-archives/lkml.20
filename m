Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AA237EFFD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160920; cv=none; b=jDv5J78qm/ATI6iOps2QXGj5FErBzbthFiUSzK+qD8KnOqzTNF007pbMdxznAiBSnkQpbIKbJ/Zg5YVu/7qZOs4QryD7b+/4OY0FbdhADZBERZKc2vbnaJPM49aMq96i5GS4zyzsayHNJ9WOqlOKBVG8Y5sq/JBrzOzZVgQXsbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160920; c=relaxed/simple;
	bh=tCiJvvmVqkDn9bBZcYj3gCwhrS0H3F9Qtdp20m+sp5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f0NHdrlMpbQdk6idHNQZTVtsUZqkrWrRYEo6/BbZx1HhnV4tjXPwbQqQLex0/aBFmiVswpTqM4g/1yvT6kmI1qfasZ9QuOHOZCpHdmt1s3Opxc0C1JLOrWoV5U9HO0PgEeeUDF0e8WMJmn1rGdlr+zKNo2AWtQ1RG8ZhkzLOzbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=FHqdv+3V; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="FHqdv+3V"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so10597164eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792160918; x=1792765718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZNDAA0XdcAcUqgBVAh4lShInRCyhCpm07d2o6YZC/E=;
        b=FHqdv+3VwCIo2+J09xi+YGOLak1/q7OXSZbyRS8Vl5Oi1QMPJQiA04n3Pj6hT22CDc
         7t3ymWfa8wbsAep8/pc2X5m7e+UwGg/xRAsOYoPhBSNwwy/QPLKf610iOHnwxfV/wc6I
         FajLQalN0zpeqlpItO3ZtQU87+MIhplG39URNEn7F6OfSc1Z//kAthnm25gy1MGUP97+
         MTJw6vR5eSiXGiAguaO8/wkqA3uCziRO6z9iwuhKnM/T9fpdkCTzKJT5U137bgYWc/xJ
         vdTYVcxRhucjvsDaEnLFbiY6qIbaqkstPRk2buvy7GUosej7lIiE9hcMeVhe9gIS69LO
         goRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160918; x=1792765718;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZNDAA0XdcAcUqgBVAh4lShInRCyhCpm07d2o6YZC/E=;
        b=mqDQdYBjXCZak3NCD5sTLU93l5BubsRn9cyYrPL46Rtk9VjxYPazoEacFEOq36Jwe9
         eL4KPFVHXqaloN8L4mYGXFsDvMS1y8MNpdlyBEO1jet2HMTclf3HZ4S+5t2J2XgvJ9iZ
         ZgDJT3PtSJjbEndGATB6WK1c+7EUwm8tjQd9CJTn+46s5psMM4a2e8KwHP111y+iqQ8H
         1/lg0rGXTg4VV3xjl8KUl7RdUfD3agkrnFYVDjniz75AASw8CRyO3efqU2zsTNLU+O46
         oPU2z3fSRFuyidB0PIkYT6DM33OQBW6RKq2ZI9kRo3R6UuA9rggrpmkNE+UL4OWRJpgi
         bmKA==
X-Forwarded-Encrypted: i=1; AKwUvByKt9iwx5gL3fLP0xXY3otCsMi+duuSY8NOWcWqglwy6d8yIbzls5s7880BZ7C0Afg4CZawIy66vQeUbYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ1Z0YHnohc7zpVZl/C/Q5mZBnGdhVCnuRaQSmGhtYPzXflStC
	FIWHfDMm8oCHJ/Oh8HyeBali2XaCa3c3gylJf1w+emEUNIvzuqfELR49gJxuPTO09TY=
X-Gm-Gg: AYBFou2sBpTdtcyFazWJ8LqMBlLwtMgSAD8lopeY6jICiW3ltfwuOMI+gcoAy7woiw8
	qnLOQ/Q8vi3jv0s/dA0cAwUm2OHPO7Jq8UcHeInwtgX2gTJFutKU6b1BCwSIaDgEBej9aYANMv5
	AEsAyJ5BAZ8SiYoGFgpQlwv4zMW3u7MWAmftO87HlLLhRSfPNlVzDFru67rc2/qbX7CfWqccFzk
	LJdpHU49rYyP4y11psk4ekcIYv4Fyr2fxqmj1QpRGfJ2BsbtIQ1scNdDbfaD3sI1Dtfkj2GTUEK
	QtS/2TfdnK2bqM2ePkvzo96Qe6t4XpAovJ1bJskOlfjdJxxJ3lkaKMeNNNcZBTN92tRIwP75lk2
	Ms3sIB2iyyxARh4HHTxGJrLneDKwqpUKQ8ALG7c6mj5YSu4PriRKinBTtT6CWeGvI3hgJFEVRNM
	o/Sus5pa3wk0SVIobw/j2yJlXg+DCBbkt4wD56ybaR2FceWE31DFcEtweyKBOvWBKmhRH3frTsb
	tpujXIadsOcfL4uQCN1a3dVA5sQxK5M3u+FroGPuogIgiaWtOmk7BrCOv7hftiOqi04
X-Received: by 2002:a05:7301:1706:b0:35e:6816:fa72 with SMTP id 5a478bee46e88-35e6816febdmr8708847eec.18.1792160916751;
        Fri, 16 Oct 2026 07:28:36 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm7150945eec.14.2026.10.16.07.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:28:35 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, sonotri <sono7ri@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261015120654.241354-1-sono7ri@gmail.com>
References: <20261015120654.241354-1-sono7ri@gmail.com>
Subject: Re: [PATCH] ublk: pin module while release work is pending
Message-Id: <179216091563.2070939.8848021281402109877.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:28:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 15 Oct 2026 21:06:54 +0900, sonotri wrote:
> ublk_ch_release() takes a device reference and queues exit_work.  The VFS
> module reference held through the file operations is dropped after
> ->release() returns.  A queued work item does not acquire its own module
> reference for the callback.
> 
> Consequently, normal module removal can start while exit_work is pending or
> executing.  In addition to the worker callback itself, the final device put
> can invoke ublk_cdev_rel(), which is also module code.
> 
> [...]

Applied, thanks!

[1/1] ublk: pin module while release work is pending
      commit: afc9cde716b29ce814798d649a95f9128ba42b43

Best regards,
-- 
Jens Axboe



