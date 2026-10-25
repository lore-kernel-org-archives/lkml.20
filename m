Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792938093;
	b=fR5rVbi9wNFQuF/5wZzxBN+pnXU8z38VScEsbO/bnuVYIPk72xZsUN2s6BKaada9BuiB
	 kp8OkqDwjINav7SNQ32XV/YzQdnu+8SCLYZaH+M94Ptp0nBUCq2gbqq0uZGFk2gR4SHKA
	 EMdCi0BsDMdq+LONHp+2e+yRxaRdgOMcpu3/GarGibZi92I9zNnNtF/hMX+dLZ0WfdisF
	 3uLrZMa5RBH5afzFMiZjtYv3zmQOhXJQCl02sPWkPQA1WSfsR66GvU08bjUBnLt0OAaVj
	 1ACQd8ULzPBfQrLIRZT+jZhFVF5hrxqeqxNTGHRB1+tzSoVpvjweD5RiZd2XGSp2eUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
	b=s/f8olo17e2hDK/AUB580XU/cIygMMAy37l+ux2OByAsEn/1uoq46qv8h6t5miaC4d/T
	 cO/ps95sAnfB+bmsTyRR4evv0TmURZmQbRFcowNcIG3CBjozhFLtPFu9unR3UasR7tipc
	 qz96UHChJt+WMIMRRg6mmrKtc1Lv7Ouu50pUb854CrT1TM+86BV/Nu0dOM+/Dijxf/YA/
	 3YLX9AB3bgy93ndr8Lt9XBbFvLCNb3NEod2JAyWpUJDxpLG8TGtVuOzXifjwmeABZBrJU
	 286pR96MQj/wkBWbKuWx7gOPlniXPZ1dc5V520tbaIf81nq1i9a70pmVyh6eVRB3KAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yeh32Jht
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b834592afso27712666d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792938092; cv=none;
        d=google.com; s=arc-20260327;
        b=EqyWQt0JPfjbR/D3Mo9ON7x/a5XAiCIMmTJXNtKv8XZf/QbUTjPbBKs523RmqBy/UE
         8A92eQ5UkSAkHMqWqHxOuXVgvpwmQFhuUZZ6C87wg4cnwEoazxo3moQti6sxVAE8SH+i
         YcpqPE7Hit3NSMOeADcYqLcBG4QDc4m9mWfLh5kAAJO9rk3sNbFfbt6BNiAEwS5NDEj2
         kfXYaGrmKt1VAYDUBPomM6C4lVx+i2TF0C7VUuCyJ9VEhKUFinoYZUfNu1hKA8feUVfp
         baIN0dIN/99zRhj/LW+7nW4FatPL1nSXOy3f56iZfzpX2ht48dZlf7FEjOS4xrsQCQjh
         FNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        fh=VzAdGZQDwGC8XbyUhQoljIwukkirB0UqDNbvPIKVKlk=;
        b=q/SdQ4ahG24+SVRCCi835+78xKved4QZC2snk740kISaI8iX4+E56T34csJOJNfXjB
         MNd1+FMayfrB6uDkKQI26U4EtWmQ97nouFap0YdL5r6bMyAAjSJIRx/6QoxkKdIUYQDl
         Zj4N84qdCxJSyd0r9wjKWgomBm/et9tsOHoFR11RYJAIzI9lJluh/LG/EQfvAIjbeNnX
         1KcY8nXMjXUw9H7WmRZ20DjiQOmNEIMJgwh9SWOl0UrkJm6nKla610jsOUjpG5VJ5d+a
         ukEcXf5PSthHlhNX1tbUfd4zXaaNIR0dvRM6TMqHFl+3ax71vsnHYzLwKx0MjsTeg5XD
         kkkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938092; x=1793542892; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=Yeh32JhtZmd2iC8QTwS3rSPC+4TSmNn+3v5gKoXld8RdwJJN3cxGhjaNGyXCto/O4P
         f+0jqrBrGvdQ2aISEC/WD/zgW5r7eSNj777rU0XiNu6UxMDUoRoJbJwRsvdMZwj4mVG+
         fRjhzGU1uQdgxHWWpYYg98vmTb2p0MK8hPXv80QRvnCu13AO68UzamMdcIiBnok+vEva
         aJVL++M0Y6f/ATiSXDOghgwOzxw4RiHirD2KgIemhiWiXjM+/P6PA1iES9c26TFg3nRY
         52ZwfNNhRZfVaFU2TG20+8PUDmVIeP0GLoiNDmaft7QhSttqZbo7dMYsXeBVR7c81S6Q
         3otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938092; x=1793542892;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SM7Yv/1HjzmGuGQj9J0EPWbZsOFrrCqzpNrPuOL5wcg=;
        b=zw/YQ0Jah1ZzFJTR7SzPA7rP50dRAYmg+6uRrT1O7dIl1hWtz2B7Slmz1lOlZwJFo5
         ZtbxdePYpnD8M9/fhmggCKGR+iLdF4p1PAZPlgIxA2E/x4tfWmjmz9fdz4Esk1FwhIdy
         rZJrGjNRTp+rfo1scLxuGLPrYx45iCLKYRtt4OLWIaJxZ7ugheo9lRct7SK6Jsb6Sbbt
         ab2klv3kV78OWc0Ro3SYCCEDfbJQ59HBhQfE94vVTxvL9OqVOWhGI17w8gOeZvLYr2nT
         isrWrzcQ2hTr3AP8gSU/KxN5pnFaydzu9Lciswb7KHXMLZyPQx/n5X2Dqp8buxT3y1eM
         T7lw==
X-Forwarded-Encrypted: i=1; AKwUvByBXp+hDUJDnTnAi1OqPTSKgERcEt/b4ErsreSF1ki2m5FXUSn3nVLZOn8+Ckq19I1m9cxdlBbFCpHOeJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeA20ICNnfupMnWJkipn1b/7/stq1GqgbMqQGWNXQtXLCTBQo8
	+9l20LivJrpG8DN2ZSnaFrSgyj7QaUvg3HRqJTVQGh6M1eTDyzNwxbWMFgROC/1BXcRh1QOPYDf
	Tk2Zcu1l1Cu2bs1ZaajiBP/e+DzJyLFs=
X-Gm-Gg: AYBFou3lzPlQX2Y6ZM1rq/pjgARX/Q1/c46K/nqnlOdOZA42tnBExjxwV6y9vgq0WH9
	Fuuvs+kkvUX2NiXbO0ZNQDghGNYJ/PiayVZphh9820EpkTU+WS5jOp9Z5P3sYyipLxp62RD5wJn
	S+L2BBKuM4zu4/NLm0A8rhWPAuGLgKH9c/KkSS3BONz1dtniUBt/69TSWofmtAIqVGrXyQ1l4n2
	EMbE06FRSCZTEHT94LgwbAIoiscGljRM+be+V66N7hLZC52LocvZBGD/x43EOI9JFYgg8Jxpxx/
	LmAYdzb8/xwj0B8dji5axqnhNyV1ARv344YbwY8pNBs9l3907L57Bn2WPuV/uOXZmkylq65HjF2
	mJJAC3B4SPe0EAfLCPxf6lHysGu18vwDO1jA6ZwyfqIBFwdtDfIWVLvKGV5RUIgeOgkIHLmi0EP
	MBQFpXGzsMnUIkqNNTt2MNmgJyUuTBYL43KLzpVkL/NGwIOfP7zpyjJdB+1VDEZX2APhcdoVfT
X-Received: by 2002:a05:6214:4601:b0:917:a943:c4c2 with SMTP id
 6a1803df08f44-91c48e56a20mr74345036d6.23.1792938092287; Sun, 25 Oct 2026
 07:21:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020142534.3533478-1-sashal@kernel.org>
In-Reply-To: <20261020142534.3533478-1-sashal@kernel.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:21:21 -0300
X-Gm-Features: AclHuK_3A6YoAPopWYDdBpyLpTtDAS3DEQEhpWyYqeQDBqHn86Lo3m1k1XEe8Gk
Message-ID: <CAMAsx6ch8bztwO2w+gA1xc2H8JEM-7haUd05dmyODN_=VWJ74A@mail.gmail.com>
Subject: Re: [PATCH v4] docs: submitting-patches: say which commit a Fixes tag names
To: sashal@kernel.org, corbet@lwn.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brads@mainlining.org, 
	gregkh@linuxfoundation.org, linux@leemhuis.info, mst@redhat.com, 
	error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026, Sasha Levin wrote:
> +Name the commit that introduced the bug. When using ``git blame`` to find it,
> +do not settle on a commit that only moved the code. If a later commit exposed
> +an older bug, add a Fixes: tag for that commit too. If the same bug was
> +introduced separately by more than one commit, add a Fixes: tag for each.

Hi Sasha,

I went through v4 against the tree (docs-next at f857ff5bf):

- the new paragraph sits between the description of the Fixes: tag and
the existing "Note:" about the stable rules, and reads well there;
- handling-regressions.rst does ask for this ("Add a "Fixes:" tag to
specify the commit causing the regression"), so the reference in the
changelog is accurate;
- I built the process documentation with the patch applied and it adds
no new warnings.

One thing for information only: checkpatch --strict reports the
"Assisted-by: LLM" trailer ("Non-standard signature" and "Unrecognized
email address: 'LLM'"), because Documentation/process/ in docs-next does
not describe that tag. If it is defined in the agents series or in
another tree, please ignore this.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
