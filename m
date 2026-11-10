Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312353;
	b=oYPhNBCZT+SyVohU3KBqlfNaZHA3CyD1UE+m8rhF+iosYmucOLV2D7tgSdAjeO1enP6t
	 TY5dkTTUh7T8HuhvUfTluJTDorjWqNgfTvQv0lB86/JbMBVJGDyYCxKchrv1saq0r2iUB
	 vd3hYqjh6O0nXJa61lR0qu4UEENRi2sZ0xjLvyIuoiwJutOwMXkGJdMRCbQlk04xWPfCG
	 RHs3ZugzFhdeZEiolk3Sskur6fiHJ0FUSzUCxvTP9ilymXGID3I8d3m1KxKY/LecbQAxI
	 Up+agQMKgd/2rVDgJCjLWKWKt0zhoXG6dGpOylUjXecrZ8YO5W3wT5Kh1EvdtIJNXuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
	b=VeUkM5yqrLuEXet7+4oDvrq8xBk+4gtYUKBXyeGxUDcWg0pYWqfLzZIxs2OyEmrh2Nvk
	 F6W46rkABYGBuHxkk1kDhkVPdj93TPTqDeHMk+MxLnvOLl0sDp2BPijQ/334RZXxVosa/
	 Uxybam241Z0b+0mkyAcdnPhJduEN6cCYFT/hC/CcSf+/icO5DzobeMJkwvyVWUWc9wyjE
	 r5cfFXnNrCF++oUbLOgaZVQLvdZkYGHOwDJcjkdYoyD80T2bf+AYwlH96MB6ECMGt0JtP
	 62Owmmo7CKah/lppJg8bbmiWr7qLHeSV8ESu5FiuQrwO6BPlTnQcnnlq3FAVIRzPSRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A287D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A287D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so1873503f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1794312346; x=1794917146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=LF4BFKzrTfKOrCuSfp4DCyhP5JXW6aLC8XDTOi3QC6I1vLZtLE95OOLLw8+PaO15OD
         Mqzsu8ibEbOPvk0C0LZpmcHuoWuVD46E4lCbRLNSR4rlywp/TUbyv5jDIrUHnqRKUN0+
         VgYmCiQFOWw3por3vt60eXOGS7VxhrTSAy2uD5KjqibIYZXvhF8xkBxmfq26pC90h+jz
         nKnTq6DPVdhiHAlRe3p9KUoVmEpDTiOAWO5AsRJkCiuO3TGigutjr1wKeh2R+kZU8E2o
         7B4YTnJAghxXdSsuvEnENaGO3330T8hm5HVDo0cO+QeGHXLRYcSbSeMAQmUnkuj/DUfe
         xkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312346; x=1794917146;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jpxgMCCbAUfPdT98Oq2wh4v9R3fJXQgdQPolxS8WuxM=;
        b=0D2R6r6y/itj/s+AGSrQFO8qMXW5K9tFK1UKNtT0YdNK9ffiJDVfpYCSZjZGiDIMhD
         Ds2ASomENaQIh6QNi/iFtrmb+I4LJzSBuD6EFbYIQMlxj5tTOY2Nqfwo2EJV1HsEU0Rz
         jJdQvsAn63tmvHhPuVAQahPVxbGtnpHbwVR0ztVnf5aE2h/ft/SP2/INbXF318b4/Otm
         d7C9nftuP3sLPGCyPEjqNPow9l4K3y5ASuZhN5/23J4hMAvEt0tAocFkAoKIuA2rpqMP
         ONWF+AcjXVOntV03AgVA9dJwh+HGLXkV75W3ZzF4hVfbkgzlLDpqzOGfQGBIkD/nBn6N
         37PQ==
X-Forwarded-Encrypted: i=1; AL+hErGSyls/AUOPzeoO7MGOxLyxblec/pFjlnF373M8fBvD82QQqBf3MyP0K9SW7nGq0N93Oy4LHhvsJsB55OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n7z3QVC8NjTz+6yBY5Tw0yRjhG5CmXRu3geTLQQTdyevjBjGd
	b63XyuApzPgDIMimDOc0e9VMrGeJiRTOMP5YTJkt7gSoOWfCkrtqj4RNd5ifoWIWigk=
X-Gm-Gg: AYBFou3shMiJdSpUwHwKfO9sGZt2pHbcZWpxwcN93HdUynFLa0iL+h3qGT5BD3oXBe6
	+cpxoYqOeUUMCNKBpuRwVGSemKPboWiPoczwTWesspP4EiyHaGm7081QUS9iN5AHzwsLyYPBiLf
	bvxqm5F18UBIC0QBqcP0g3XLV73LCr1njFdy0xz7UCp7nAR2D9l85J3EprrKhl2lhQjsO3/91Q+
	FVldEm/zJBXlGhvd9pZApDxC/7Ul2hGxETzo+qDg5Z8Zza8MOi74oKGo4dYFkugWWH0KwUlg2lZ
	jKPE46L0HAJIq7kO78T1X9pktksvD2eqq+4al9yqkDNsaE5KxUnb+NoKDAs+LKT/YXoKe6nusHD
	2rDevmRgDCpR2+lhqMjHNzVAnCxZrOC17Z3pOFzwZobJZSgBdTpaHUbqfUrsuf9WcQIzo36L3Yl
	8GDRZxh+VzfABMgScVKUtJSL7cWNsJIZPDAiWRi1XuB2871s/l/cmualsS0KRX6xN7XDuXi0eM4
	rdoNQ8DxLgWjamI+vsHo89tsiOToqtqrGZD/Nr195l1qdP8kDlmePVrzPKbkUa1t+BLOpX2apNO
	1C4ia6hM2K4rY6dmhb9YAD1q90uucV57VfyTl+YXPBzndNehTJSI+BsbKfgH07w5sKgJTm4=
X-Received: by 2002:a05:600c:3b8e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba023367dbmr51948635e9.10.1794312345435;
        Tue, 10 Nov 2026 04:05:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm61119315e9.14.2026.11.10.04.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:05:43 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Message-ID: <dbeb92ed-4bce-4de7-9699-6a8eb6a07284@tuxon.dev>
Date: Tue, 10 Nov 2026 14:05:42 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Cc: mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com>
 <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
 <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all,

On 11/10/26 13:38, Geert Uytterhoeven wrote:
>>> Thanks, but six weeks later they are still not visible?
>>> Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
>>> resets in top-level"
>>> https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe- 
>>> mkl@pengutronix.de
>>>
>>> Am I looking at the wrong tree?
>> I tried to get stuff into the last merge window. For various reasons it
>> didn't happen. Anyways - I've pushed all queued Renesas related patches
>> to the can-next/testing branch. I hope I've collected all the latest
>> series. Can you have a look?
> Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
> something is still missing).

LGTM.

Thank you,
Claudiu
