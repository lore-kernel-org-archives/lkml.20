Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793381947;
	b=fWbaJN/qu4ZYjEDyR6Da7/RKXSNv+OFlwJ5BVqJBk+tgCrxeLQjOH/NVj4vmikowyacD
	 Hm9qiQaofy70F3yHEpY/z2W37UBMNI7xDQ4k4Hl7Hw29/kjmn7IEgXobqwqyNV4WPEUHu
	 R+G2s8elPLr2SKh2gxBlbMTdoFqZphLjGL7sDTYVSqX0ry619VrUPu12DTWtoZvR1DnN4
	 4I85LvpBZOgOTuZcNhQZArAhXfb4wlahrvXavkqNb9H4BDxN1Js8dD+N9d1gY0Js9TiUQ
	 ZWimRvk+e1Dxq7vKDI5fSASmDEDj5FZOsPKXCOUMRXW5drB/rorBFTguH5OBuX/excQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
	b=e4AywpE0N6mWC/Ne1BNYxOmFIHeG7Ss9o7TKby8jG9Ud/pqsw/ZxXjSunjUkTMgULH6i
	 JyHfZzM3PXrQX9fumoR5BociICm3AWxo+RbTbNn0uMwHf0u/Mf/Pz33BLKXqJbaEd97rV
	 EEPfcw9iLC6dVAYXBwrrbwKPNYlYKUy+gup06amDGsz0O0hNALr3U76xbYBkk6TPDnSeG
	 fPMGXZpB4c6KuUEMH5l0R2b70jlBP95D7PSKBORDDgmJ/8ZktucpmurPXck8VCestKsd0
	 BW/2zHz/AxGdRzbOynjSEVuOyXLnU67cMdiMGaUFBaRt4yLlaLdbA4k9UsNfUt9HmOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CF7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=phsogC6Y
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f22a8515eso88878585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793381946; cv=none;
        d=google.com; s=arc-20260327;
        b=XI4ShALqQwnC6qiQS58pRe0ORPVSUPsPgPd+sHCdkOKiKJA3P6IpoUsjpZhr3X9hR0
         Jl7dJaDdrbz23kQ7XKkmySHtAnYolfMlZdp1RlgmyOtJkas7seU7ZYVQgNW9/7w8Te2O
         fVn6/wACh694goHFQ5E8L0ZuLmapacT5kpUGbk/gt5+0ILxZFmc8dyiRA5UnPlVLodjn
         +f4K71wqZDplkER8ixwX3umEpo5z8n9kfDcKKqaPmspqTIFNT7YJBD/tWnCw3NK0dXa6
         II8M2WO/B+EbmZ//r7RCpnMhlVt3JKCV9ZRQaE2FvqTQQPLW/tC4bt0qWoSr4tVkfwOX
         MZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        fh=C3Y7H/TIPJ/iNRaREpye9fFNx0MS2ediU8Xu4aA7RhQ=;
        b=kBCT1V0BQECYo4Bom5R0a5JnkufDGT5yGu+ubL9s6vae0z8OXIjide4xrVvBeGfDE7
         prCy0YOjmhvV7MdXOFPWhVBYKOOGYAVw4uohkqVF120ekM4Lkw927LpqkCYAt2rcanNI
         +w5CYNhN9dVnltHsMfpcQsI873Z+e7yw4Q5Aw6Jq/x/4YOGOEVnfkmE0DyLsJexBIolP
         yH0Nu4c2A1XmjqmlILgAVYYmw6UzIlsxladoNDxcPBTjKKoLKelaeq2x9iRrECHDa9GI
         TlQzhjnHFciwVnNN0J1JQ/hlb6YDKtttUNFC3RKC51+LsoQRbPU4v2e1vrLc6CU7A4t+
         hYkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793381946; x=1793986746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=phsogC6Y+qtsb0QGVFGSDDf5T5Kh20EJJXMOsGlfuqX5VlyD6VMPQ8vSmR/mCfXDMo
         2GFmmgqHGJeNJVXfLqFbsvCh324IQWNuBvDyY3Pcci4A5ESkB2Z3hSC8Q/GovLQZtU8k
         Iwd/evxgoGgJvL5OMRp8Or9unuzO0a7dxUCCb1SUwkmIRNALmNb/9AEo3rA8zEPai2hS
         6s703AX4O2RsuiJcwFc0vfd5vPLtYQXa70N6TaP01xJsrNXxTVYKk/fFr3SOLlcEd4s8
         RDzu1j9SEC0hqsaxOtJpkWxdEywO/uUnHQY6XgxhjDO0E+SPt3O/kmthnolh6hc3rYrL
         CNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381946; x=1793986746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=espr7eMUoL4NEp1fFPw2X7cY1hYHDQwWESfnyLsQmNw=;
        b=lfQi6sBdHhyPoj3GR6d79J5Sv+Pf2HEHmSuKFWW5lEc0JUyHln/EtY3kyESYiIiXjr
         gh9Q0hnd1axYjZtdGM8GTW8D6bMjUFMnDxHYAkTSPnzyVDoQsL+T9ZjHJW5Y9tBxhc5R
         7hf00sgI1SFaQNMUc3/KM4P9R1wClXxE07pB4m/TrNtmM3r9PRL5CLR/DVlSY0SBEtZE
         NSjkIOUKnP9zYuPuu2DChgtQM8DNnKzTbDOQ3992wXnbup0t6lgWRiNUvxacQS1vCj7v
         DdB7FT991Q8bQPV5/EKVP8qLSphupxPw43v68SWYxqR7pjWRv33A+iFohJ41mGsYvWCN
         Ohrg==
X-Forwarded-Encrypted: i=1; AKwUvBwHp08eJ3x3lxpiy1t0qXsWy9tkA33MAzD3DytCvAnZDodDeNludP9jo+bi3zjbKus1gbtQObh3+zbV0c8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZnA+4eMgjLVPHkP9D8atiSOuqOvERZZkDXhgtS9sYPMa6M8ca
	xsAtqe1BNuVqXoMFvkwJWSsBH03tlkkO6RHXCGuQkK/OHaiMCQE+077GuIU7eqAOZfoYxkt8i7q
	xQI7/m0i9/JmhawL5xC9eSrjwNcbhD6k=
X-Gm-Gg: AYBFou2pyqOo6nXn1i+CBYF8aT4eIkfm/SeYxTTS/dF+8muNFlry9iv1r/zARwacHVn
	0QbhRatcrPyhEs4ZMl6tJpPqzZ2dNdAuQ7X5QM6VRqDrk/V+TOMEV3PT5qwL0rBCodE6sH7vDbx
	LM32uNH/f6DQyC+ZHNOewfcXKOpBydvEmba6OWYwdOPAXPTbWjw5p17CDF6dAU2/Jwkejcz9x2x
	ifivkcLJlguYI3HeTUeX2H41XAgkKp0ShUwElwfQo27I8gopAoqA46g+BrRVnXa+GchFR5ByHYx
	kjpTe+he5u1hqDAJ+ngzLE6AQXTeYmkDpeNjHdxaMw3gukrTRiNOoWa+6s0lzQwR06CdTQmI3L1
	wmrg6OLpvgVHNEMpuFK2CxElX0Vr/cCUsx7/t
X-Received: by 2002:a05:620a:1a08:b0:93c:9d56:a860 with SMTP id
 af79cd13be357-944217439e4mr528491585a.19.1793381946045; Fri, 30 Oct 2026
 10:39:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790512964.git.lanzonza@gmail.com> <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
In-Reply-To: <7ca8fe6cd6b4125813613bd4187ff6cdda72e4b6.1790512964.git.lanzonza@gmail.com>
From: Zac Lanzon <lanzonza@gmail.com>
Date: Fri, 30 Oct 2026 13:38:55 -0400
X-Gm-Features: AclHuK-QAySofGqN-BH0ysfW9wI2BwE9lRTbGJWzIzgQZTntV5tJ3u0NVFiOCeQ
Message-ID: <CAPusjWrmKH4wHK6LY7NFi1=+rzDY0uq5N4dgKC4FuUh_=xGhLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: (asus_rog_ryujin) Fix pump control source
 on the Ryujin III
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Aleksa Savic <savicaleksa83@gmail.com>, 
	Edward Blair <edward.blair@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Gentle ping on v2 of this series. Patch 1 fixes the pump control
source on the Ryujin III and is Cc'd to stable. Patch 2 adds
pwm1_enable.

I can rebase onto hwmon-next and resend if that helps.

Thanks,
Zac
