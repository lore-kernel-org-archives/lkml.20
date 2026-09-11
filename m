Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982483F44D7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170948; cv=none; b=I0F5I+ml2Iy5OPy0o19PvP21lz8ZjW90U9rNbVY0a+YtiAY/4xWLdEL6JreTEe/Z8/i6DXHuOKAdBkUeFF+3aCx80zHNwS9ioGFJHN/RtKPoF8Ri4DNOLoZ15eFf4mlGCvhhTMm58dWHcW6uj+3qrNLlm6XkXsAxDFVrKBHmFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170948; c=relaxed/simple;
	bh=I6SJ5ggJLj2AxV3eyg+6asCncqJLVkAsiOyJc4auEkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aF8QbeRoDOxadbWSMn50s5o9xqLsdSVPaYmFdbbSTthdHKDPa1LIemTtm7Ia680/TSYNQ3Ovh/EKcIf6YtC2zfetE/RkOyPzJOIRhLgb+58adjCwoLQjxoP9T6xsQHpNLbbl6qjdSB8EcohcCp7sVNVqsratzob0ndXUFBCRX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QSp2oI38; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jmzf9y/v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QSp2oI38";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jmzf9y/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789170944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsguY4DXAm95SZ7REYznBx0EJ7rGK7P/AHxZrjkUh+s=;
	b=QSp2oI38plPUbqtZwNPPIyNMqITaTeWSK7uWJrF/NyhRLV/3hnJc8WBvHLroFJbEv3/6hw
	yu6hdgm/Y4ProBFzc1KaVYcM59VDU/BBZyyO8yrtTcZ2fUZDGLB9CqslkL7nLU6Kxovn4I
	82cl+2UDwsYzg1q8lrFVpGKC/wemXiE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-JqBMk67rNLqSsO4M7N6Cog-1; Fri, 11 Sep 2026 19:55:43 -0400
X-MC-Unique: JqBMk67rNLqSsO4M7N6Cog-1
X-Mimecast-MFC-AGG-ID: JqBMk67rNLqSsO4M7N6Cog_1789170942
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce8ad8002so29386246d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789170942; x=1789775742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsguY4DXAm95SZ7REYznBx0EJ7rGK7P/AHxZrjkUh+s=;
        b=jmzf9y/vMtmcPzrBYTCTOiddrCVhFNOHh0wIiSrfahkeCLeXAb9ub+9dp1RKzIGMqA
         fR2tiXwJufBs+b9EDH4iMkUtF5co7s+y4It0dEUXrGAV9RPUFtFhmnK8UbsAuvED+tCr
         9CYVTwl4KlekPUBO0cLio+BZiJTcxnYCKY6bUKIBG2LIgZKYiHpbhkzdt4Rqn8oLSS8T
         YpTPYUj9R8aamuxtabyRMRl1LyM6VmfLsE//SONX7oQPCLAj7qWP4obrRK0jHcCd5Qtg
         /YA6YzKIPKmdDMhHgtCNjqrwCYyfZXmbJgEf2k5XXbuBVcRjNg2bleyMotinXVpLxB1D
         vqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789170942; x=1789775742;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsguY4DXAm95SZ7REYznBx0EJ7rGK7P/AHxZrjkUh+s=;
        b=a1qXFwrj9pflbbvvJfShGyQAdAHVdiwEjwBpd/ERBsn/V+OxfkCqamaK4ioAVYvcTV
         im/DRFOZjnOTybiDKW8+Zcwai3u1FoH2T0C7z6Q0XrczTb9YDaspN00fUOlQ0nB1x751
         o8Yn6EkqR8uwCHWpXobGvzoTzZGZZ33kz9aNYVAGO37Xpep7cCSpOKaNbCBMk8Xr+aVi
         ytHHWQ3/SLTfmqqBrmzol1X9TnZzk4OQzcvTNEmYUDK/+p7c6s9FNSq5knsa66PXK5dm
         nmF53rYXac74AnyUh+bGWlMkoOBuQOHY0E/n+tNUJ5MKxbjZXcw2M0YetSUbrn3nuODD
         yfdw==
X-Forwarded-Encrypted: i=1; AKwUvBwJBLx6AnGwKVsLcu5f1hSlOdDMbuq48MpozKqQ2DugZcpS54O3MYEXxfaa4u6bK2ncG/iGJ7mKwSoNgmg=@vger.kernel.org
X-Gm-Message-State: AFuF++ln/PIj+6thHWIwfdFbYqFtB8tzdVm+hHGloNELfg9Am013tNXL
	zZLj6+Go94Xep005lEPZe6S5q0u0/beJ89frqQLSW3wWn10JzmuAjOt5pJChROg6AJGf0oL+6LG
	HQYrDJEgn5JLddQPysaysA/N4wm0ObRyuse5751Z874XMITC3G30iPYZXAUjT1H6Bmw==
X-Gm-Gg: AYBFou1yTZi5LKdCWsDkDjru2puX8+/+cL67sLlUzMtCin4LL9DrAcRndKB74eZn2qm
	ZnhJ93sUxxW9k9oWJdnpOJQ6JKoZQPB/AWTN3hBm7hXMiDtMFrGyaWtzwtB8OXsYsSh4oz6VbVp
	V6GeJM/nckTi639lJcugm8xF8nU8keUD/m0fVRBNUgsbe4auCtsJxxAi04BC57ApYXQZMLXcwsb
	urGeWzfaD8Z6vDjIOkuOx1/6XifKktRG/53irJeD3dR2LESnrn8PZFqEVy8lLLJctougcJ0yovX
	nUzxJAphyVbs2ZTZDu9wFk1AdmYztVmIrRXrSm199K7+QBN+ps/tEweOnqu91kYovx1/1LHSRPV
	DKgzGPPgNYBPyy1WA/P8FBQ8E9RJixo7YVoIEEyCa
X-Received: by 2002:a05:6214:5199:b0:910:6d8f:a2b0 with SMTP id 6a1803df08f44-9121da914b8mr10420996d6.31.1789170942588;
        Fri, 11 Sep 2026 16:55:42 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:910:6d8f:a2b0 with SMTP id 6a1803df08f44-9121da914b8mr10420676d6.31.1789170942213;
        Fri, 11 Sep 2026 16:55:42 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm33232836d6.27.2026.09.11.16.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:55:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260904214657.97370-1-rosenp@gmail.com>
References: <20260904214657.97370-1-rosenp@gmail.com>
Subject: Re: [PATCH RESEND] clk: nuvoton: build with any architecture
Message-Id: <178917093566.797851.4101832393028860468.b4-ty@b4>
Date: Fri, 11 Sep 2026 19:55:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=285; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ir5hyrKvguOWI/ck7R5+YC+PNjCsu30R1kykm3C7eok=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWTPmddYdH9/e2wvqr4dNLpE1ct/H2tu17EJu85PhdA
 WWB2SUGHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEcS8jwxWdiykrNvDfV5rk
 v7HDdEvcLys+U0V3Pu4T89XuBZcWMTEynIjJ28fYX2bScaF9+SwtljKPq+ti74Upllyekh9YfOc
 dFwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 14:46:57 -0700, Rosen Penev wrote:
> clk: nuvoton: build with any architecture

Applied, thanks!

[1/1] clk: nuvoton: build with any architecture
      commit: 061aca8aa0be5de74a4b267588bbcfb8beca0ecb

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

