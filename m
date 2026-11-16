Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844419;
	b=u35iv4ev3KjDts7qNs4s09mroIngFJIrShpZx/fW/XaO3pCgfB1r/9hSe3MJg+GTH4JZ
	 FHP6TLePspvOvymhUlChHji7eBnCH+DEDkmGT85U4gVBqohenEgpEqwfAin2z+eufyBwR
	 8hjdbVQG+Eyf/JUHHrI6Rt/0fTx0sPmZpbYzrSOhB+tY9ClKXQohzchaG8Q1/eMtUCXbD
	 CxbLeOH/3in/DkaLPZ8mEIYFkQpe7eXFE85E04VP4pyQoAKL8DyqLFPNwfrT7qYeeempJ
	 MkUslAG7d1XiBvK2CFRFloAydiFSZdkRiAJy3hRgpC/c5my4B1as/ME4QrAtV03qJhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=77Vy6pi0eW8S6m5ZbqHe4qT2EgUKr5qQ13vlMUJ+mT0=;
	b=ZNEbrOfg8ROHQOa3e3wCnfmtBtJzcOaHY5bQc/wMQvAsqckO16t3yYAyWGHEiC/u7XIB
	 05A2E0jzQA2bLL+7cQqGSLEDRg9azgYygSTdUU2rpAUC8oIbQPnnXEd6eqdS8t3vMBrUv
	 BpADRiPdajHGYKLS1yeN1G6en9oK/hm7M2cS2GzL/8r06ri+lrr1OxVyaT9g4EW3r7qai
	 C6zjoMYGnpFatqf9/YTLV5pziqJZW+RY/KF5fQmBL4+8Whr2+mSoxtxpENqGsgr+jZvt4
	 thY8jXJOpYgrsID6XfrL9dAJC0/Biie43s6IRjIhujZKBZMAvEvxWOZjJxjpeTOZKbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Ngy8Ehhr;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E670606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E670606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Ngy8Ehhr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c45551fa84eso694884766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794844417; x=1795449217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77Vy6pi0eW8S6m5ZbqHe4qT2EgUKr5qQ13vlMUJ+mT0=;
        b=Ngy8EhhrtWEqEOxa6pPI65k1hs9RqdaD43N9DJQsN2fRCCBzBOOEB1xUhm9+s4HwH2
         LfN23J5mz+UboFz+2wxwXVTKsODa+b7AIovURWbWx56FWyBGLep9IcJfcQd0x/mnEV9N
         guA+6HSIWqN5TtRIDxx0IqeiK4rXS8TGvj934=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844417; x=1795449217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77Vy6pi0eW8S6m5ZbqHe4qT2EgUKr5qQ13vlMUJ+mT0=;
        b=k/zpNylodSbSqtH7KpIvhTYbO1dcXTDJ/dCQxqedTC1Y/DRwsHr3bnTv/ckQSmyP+y
         al8Hoj/5lienfZXslGHPOYOS/yeQ4VXrudky6fnJkpF1pYUXLqH1L3hnQIWe38C4aIfD
         FB2xDPpxabtZcgS9MgieX89hv2zQiIUgsAPTIAEyGZG54rniIiCZ4baF07jgB+1FE+gC
         GxSGjrEq2VoqPVUZDpShKdlyZYvKu1qRmuod96A9GGyAbPtiwOvs8018GIju/XTSZOxK
         X2xG8mWKAa1PZFJ4XBTzqtwK45NNF+RCXthMVk6Dz9jjTKU+5u0xU/tH4qbWLPc9c0w5
         UX5A==
X-Forwarded-Encrypted: i=1; AL+hErESEUGEIpTJcUaxJdAJ4EuL80Z2A8Owmz6OcOROGdDM/182tFBUEUsSn3uBn7iRDc6Hl5bi3UFQj0JYUoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6Y3JGadNvdbgVpHICRgfXXeg1sSFK4pPbew6vH7K80V8kZ+jD
	MODGtqAnToLZJ46IBqrqGwpqguU1uffAFLznUCpBKVRIJHdtfp8oV6Rv/C1vxc47kDITMa7LbF4
	Hd8XcalI=
X-Gm-Gg: AYBFou3UgCDKlxcG5BRgbZHOErzseaqtPD/8MI8fZdZNYsQqKTtthto7KQC6caMc7qt
	xsel64rwaL7DPZnvcm0APwKfgsRtl2h6zGWyAoxeaEiepptXEyp5xnx+GcsYe7LA5f4/3kFO8V2
	yEHluadU3wTqadL3jwbvB7HG18rtLDx2h+G4Rep+36z/0DkxCvQHg1uRCzyjpPsPoDLT+NLk09l
	GzyCd6hDEqMrt69mO6q5resM3DFNigX6iv6MKiT9PC8eTEPoF4+U2waQVS5TxfmR3kQ9JqO/t6j
	GKKoHsAzHRL0laMuKvdv+SDpwkcCA9BHYqWc+v9JOoJgzT+y/gETcVsaMfuhl53MzNJKVR5PPQJ
	vXVsfTVXC/Xbe/Q9WcHkozLaC1iKFenowVSzV7q1CK/jK+NFp4yQgOyV71q8QHCKd4Jw284RtIM
	QHAuyQFLc6rkF2WGrPw+nNnHiOncXYRHgidFl3VzVzDWFSn97e/CcDiTDWYaIzgMh85T5AwGjjj
	ZFKnm7IOqIQiR1/AP3JogsaUyt1oL+BS84264VmcRrxX+42hQMtNwsczxxF1JZeJaxU5BQ4ebwv
	fpgvEh1fKpO0nN5volATjI56a0GlnbHdOvNxBwNGzWLQDRojpjPyOrCfH6p13pjlG5CqaohJXmS
	czZ0=
X-Received: by 2002:a17:907:968b:b0:c40:6ed9:b962 with SMTP id a640c23a62f3a-c50963fc222mr929659366b.26.1794844416938;
        Mon, 16 Nov 2026 07:53:36 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b58ec6sm431741866b.52.2026.11.16.07.53.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:53:36 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso653565166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:53:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEFlzmH4le8/PGkW0GaraFQhuf7cC5j9YscLWe0UdCDXmO5A6jDl3N9SvsKKcLdBW68pi3+4UzQFGrYSI=@vger.kernel.org
X-Received: by 2002:a17:906:ee85:b0:c4d:906:e979 with SMTP id
 a640c23a62f3a-c50961992c5mr867398366b.3.1794844413120; Mon, 16 Nov 2026
 07:53:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179480914308.3191731.6125228756396043444.tip-bot2@tip-bot2>
 <avrPcQ4sOkgJPbkZ@gmail.com> <20261116130159.GA1327949@ax162> <CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
In-Reply-To: <CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 07:53:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wik3FXL4wPpu14MLt-9cbvDyPzqBoqiMGKbUCfqTd4tzw@mail.gmail.com>
X-Gm-Features: AclHuK-oq9zA6wa45J4bwxg_9Mpam6vUSgLuWJ97x9ACi2ZaU1ZwVndk4hAsNuk
Message-ID: <CAHk-=wik3FXL4wPpu14MLt-9cbvDyPzqBoqiMGKbUCfqTd4tzw@mail.gmail.com>
Subject: Re: [tip: x86/urgent] x86/build: Do not allow X86_NATIVE_CPU to be
 enabled when compile testing
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org, "Borislav Petkov (AMD)" <bp@alien8.de>, stable@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 07:48, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Or even do '$(CC) -v" and '$(HOSTCC) -v' and check for 'Target' being
> the same, and having a CONFIG_CROSSCOMPILE thing for that?

... and maybe we can just make '-march=native' be a generic setting
and *not* make it x86-specific?

Although it appears that at least on arm, it should do '-mtune=native'
in addition to -march.

                 Linus
