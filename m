Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA438E5FE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936243; cv=none; b=t5qfnQl8K4JH7+FfeFnAKMImGJVdY4ES7O9VMaqFoLKoKuET0enfgdIDc3AuqkXKIRuLWr5JJlvV7PXu1yq6YwWaEzAVehGUvgouB6Fi6WrSmPwyoN784f8P7mVQSxWinuiSpytEs/Dc2SYvlhn7u9RZ6hNVNdXA4gg34SQ/mJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936243; c=relaxed/simple;
	bh=fF1N3e8fDmDlaR1Qwut9sEeRm4wTOJlhz9arcSQW7ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIVpOwZUJJjD/eaWxHWouPWjR5v2ZcGMwkWxXOIlYHMaqIRgtDk59cqS8RgLUnYLfilri/NrkkmlRENMQlw4nvvo/7vBQ5auD0MsEXOdVbTz+WkJi0K8B2cxS1PbTJ5/M0U2QjIdZqRtEG1BHM/UfbAPyyh2fp9coXwVQ/qQlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Lg1Zbz2j; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Lg1Zbz2j"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so288012a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787936237; x=1788541037; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqWP1cvvzzLBgenvSOHjdbQzbLJm8dhm2YNn3syViIg=;
        b=Lg1Zbz2jw7M1yP3H6AZbxdgs8qVDIgVqBqRqxl5Fsm9Zm95ckEEu/IsGeB027Q4L5e
         MQj+soNeQZseChBCei0uRDYEgZBhzZDcfhV/cUJKku3R26dk+DIhMUhdT42Lf+JRnLGd
         Y5lK5ajIGHuAcDvr84AihbLoxEsGKgO71R3EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936237; x=1788541037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fqWP1cvvzzLBgenvSOHjdbQzbLJm8dhm2YNn3syViIg=;
        b=LOiqGd4rvqADUd08abTdhCbjF+VVm7PzRMDETKQpSK8jOmQW6z0C3FIt9lDPDLAIc0
         l8SxmS8clvTr4SM0/ei6Ioi+4D+qZEb/gXMBQ++97lt4padC08UEtHkRv2qgOSW3bLlI
         DcHRySm/Q8qKDr7n59ql8PY7a7uVHgmtYh+UlddPGScrxFukfzc9QXMr/DV2D8abCCyZ
         obVQJdddhtV8xS6SF0MS4anUjaRnmusvy/ciLVXRQBIhHfy96blW9K9CtwkQ/QaTX5kI
         9CxCdTUnHcZbYyVxh8Pm6Fl0t+2+Ni3FT/GHZrLsrnI7q3KZvwySHq1d6BgEb3niwOmC
         kHXQ==
X-Gm-Message-State: AFuF++lttZA4PiUW//GAY1wjVtJhEsaggF7Z8KtuKdZzTiGNJln7Y3Ad
	xhuCCEq/nEbLvbjnCDuLj3eIuiyxgtb9cb4iGFrzkWA7njjn+21Yq2kwtPkSSF87Z0TlWiYrFGA
	dT1qZAvA=
X-Gm-Gg: AR+sD10GXtPRpiMKulS/ptj2rlBhJIoc1xu1OalYM8aE0T3MsKv+SIdh66m30JUvLAY
	CbP6XyX7t7+ev6nkzYEFqT4OXnwR6yGcMcx0D+Bemj1fWZ4gKlQQS91kg4NeO02sPkLEVTrHngW
	h8NVZjOMB1PcqVySdCQx1Q+pq1pH/O1JDZEqzZwS1ChhLg1PQy3huKLufw6Y/diPFKZ/eacSuyD
	JESOeuO2ANNuwF1KBFbzPVkXxj9urzJTjn3K+bEPBnNocVxu7drxaNzDB3sxDqkMC00MZyUP1tE
	dQtFAUekrl+PMcB2/HE8lzdKsMI4toTYhOJLBMPfODrZ+DYYLNrtZOZ6mPPvrs6J96ANGgrkiFi
	ZW0RMGWstiTauFo/jSg4u62rbtaOFzStu+UQbYqXEkDuWNLmA+IiG7jo4uH4uSe+gyvYvfXpCd5
	w0J6HFxZLGoZii4SUwWL+/8LhB5WkQZI/4ThvrapJCVcMLRWD8n27L4qTgOmXXhblQuhXu9aE69
	1R5/+Fxflkam/vIvEsDDQZo6TYCmr2X/DkhYA==
X-Received: by 2002:a05:6402:304c:b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-6a60d3c6355mr4883283a12.13.1787936236671;
        Fri, 28 Aug 2026 09:57:16 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38e82sm721469a12.19.2026.08.28.09.57.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:57:16 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1784563a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:57:16 -0700 (PDT)
X-Received: by 2002:a05:6402:24c9:b0:6a3:714e:f5b4 with SMTP id
 4fb4d7f45d1cf-6a60d3a5f5cmr4955636a12.9.1787936235799; Fri, 28 Aug 2026
 09:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apG8g-5krNRUFUuD@casper.infradead.org>
In-Reply-To: <apG8g-5krNRUFUuD@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2026 09:56:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiY22BnQkAMMc8-h6xaRksvVAbASpg=pj+=kVaXXQYo6w@mail.gmail.com>
X-Gm-Features: AcwNN1WR0kJ5fa4772K72bkb1NaLJxumbwJKKrqGtowAymofDWBsxumI0FifkBg
Message-ID: <CAHk-=wiY22BnQkAMMc8-h6xaRksvVAbASpg=pj+=kVaXXQYo6w@mail.gmail.com>
Subject: Re: [GIT PULL] Remove dependencies on pagemap.h
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 09:51, Matthew Wilcox <willy@infradead.org> wrote:
>
> My apologies for not sending you a signed tag.

I'm not pulling non-signed stuff.

And it's way too late in the merge window to try to fix this. Make a
new key, and we can do this next time around.

                 Linus
