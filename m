Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243061;
	b=bgGg2NiGvZB1k4Ga2vlpcHCUDwM0aEV0XyegdKCO3+ltU995OIXXFfkDuK1/CUtzQhvF
	 DEK1a+PL5uEKt/1PWoY526i5wRZNfxJVbWmV5AyRPPYE00hAQPtTYL9ZyponwSqB3POqj
	 NQ/ErtOnt/M1ZNEHH4BGxASovkFcWsglrUBuDrAzeaojlkI+4a6Mj75bMHPuIq9fZP3JR
	 KCovUXFXSACRRJ+i+qn0PmxAllrc9BM6PQLy2G4FJCR0w1ZJHh/V2TO56yduNQPBMEtVs
	 vq7e3pOTvhhOlCBH7hrKKxH7RfuoiJhJN1aqzetcYDDL2/nz5S6U9JKQEZdT8Te5NyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IS1Mfm51OXnwhxZbYONc5jZW/Z2yaZ+F6WQ76H4U9Pc=;
	b=KGt0WN8iUTKbkGl3j+NSrEao4UHqx4tdBCW4mJhwdSfIHZ/W8QMgFowZoyzFz7FPCL4+
	 NaVY4tjq/E+iq6D3IudBjS6H885yfKZaA6W/RX1TbO+8O5S21b7ZXzGnsDMz/t7X6O4ek
	 cPExNBqgpbG5HdRnQlMo8sNOKoB1GGgZ0CMLwLOmHvJQkBDaST0x8NjIyq/zuZxvYcbes
	 90ivL8ZsCg6mx4iPFXH/yRfUGLt9DmE7lvu2fyGttysH8QF/4Kat7uC7Is/Wy4yOdhn8x
	 32ZbqgNWp0PsHRtWhijj8IiWlrhlqjtQd+xi6HTze2zfkbMW5rNxSHyB9scAE51wy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtHi+5FT;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DF606EE84
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528DF606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtHi+5FT
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9757695e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243060; x=1794847860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IS1Mfm51OXnwhxZbYONc5jZW/Z2yaZ+F6WQ76H4U9Pc=;
        b=NtHi+5FT8sSMrqPVn2bfj+WSGVIRPUS81smJI9xvYLMNB9lliq289J9mp1qechVBDq
         dzRWpDKsuXQ5CnyetVYNEgz6PUwqA2IdHPuDMYFmMwI/H5/0XSTgBjn1qFWDUlcoGfdj
         fdi58DtsyeQPYXIj6IgX+Zmz8H+uq3tMPIzfSeVk2gNrvp4Ib9bYIwdQz372siJV+9G6
         O+nKnScnTOyPpjYLvE4y3cofok13SKe/1qQ2sk4IgP8/4yiPWw1R4Vnj2TPvPamLJAbE
         OgqqSc/4voTWPsLIAnM2U72qVROZJ7wNARrWTCGoa5CldVFshyqlpVlJ+4KOdSBFkl35
         UYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243060; x=1794847860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IS1Mfm51OXnwhxZbYONc5jZW/Z2yaZ+F6WQ76H4U9Pc=;
        b=g+AqpyunkQ7CuY3dE+T2Rzbp8dvvJ56gPobASWGU7+C+GyE8e+tRKcCstU6dyoCRGK
         Jo77RihZwWGMaWmtfWtiNIr4wNUHpfZMpJTszJ+3SbPIGCnq4yPyd3/EkVZwmemXuOsv
         9CT3PjAHzo8FFgrZQ0LPe8bxi/MaDFf6vhd1bJu6+Q/eDtEJLs+1hyqosovri/qx0812
         rgeyZnCSQwKmNQgIgFJmp3RlTK8zqMP3OKMaRkjD2naui0zogIEkeyW5uqqVgoiAkd57
         lSZW3qrhNTAA2DayhEMa+aKBuBS3Jcjot7+qXF7SpD8bKJVrRHGgSJja7V2Uw925rV9s
         qjQQ==
X-Forwarded-Encrypted: i=1; AL+hErHYTTkACUvoQafzLFzQEwnjQsocPB+A96VQzu+ApPYlB2QsbCd57wMVGinIiQCOZ6mFeqrkj5BAmZcNLPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lOW1iA4XEqi2TVxXQz8N8AJvir5p+ODeeMLN8d3a07OBeTCN6
	sHzuXDDb9QDMKBslh0+acSVf6acKztcWbC71p16TYFgH3BplyyZ+4CNxtVSgtw==
X-Gm-Gg: AYBFou0LSxc9dN1PIIzhDkMnt5aZGHZPUb7gFhPL6faxz3p0QPT++IT3T5J4HPA9gBv
	P10OJCyJXWTYt3XPtg2dKte5/TYmYhHwXmX6xk8kozHYABO4qIHSrkFbcNS44yGnDa66btUXt3f
	hqd0uguU6ueu1LmUVMO/h3w/6g/2mqeWmh5nApVKl7lw3gKVYhbLRPEXnb6l23Og154J2RmlOvX
	+1ZeAtpYHVBm9bNpesJeuSN3sk13r27nPgn1ija/fURGS9iTDFq72/uCyuW8bXm5EY/bt91+T6p
	JyQwUwZ9bBLtw8qdjPNJpwQ/TQDgTiHAIQr+GlRdG85+tRf+dAq8vv6X31gzlMqugAHeAjJr7rC
	HO6NR04bbRC738hwlNdKx8K4Egy+Z9iObSkM7Jg7srifMocy0SiZw5Yg/GovID3uyY1KC0YbCtp
	VlWofV5VtvpiUH5fxSeiz/fvGf3MGq5JaCEWjtABPbKcU0MhGXQgl7ln0BqKjUpNi+WBAi9Ar+Q
	gS19X7P7Obe+0PYcVzYsAYoM5xegZTrp0I0sLv5k60tCHBs0sgATyFNg/V9/PasEbuRGaVSIcYF
	PxVO7ARHAnIB5eJ8a9WX5vvRnToQP3m8UYL8
X-Received: by 2002:a05:600c:c16b:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4b963c6754fmr82890925e9.13.1794243059544;
        Mon, 09 Nov 2026 08:50:59 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b2066esm11035695f8f.52.2026.11.09.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:50:59 -0800 (PST)
Date: Mon, 9 Nov 2026 17:02:32 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 bpf-next 01/18] bpf: Add BTF ID sets for fmod_ret
 targets
Message-ID: <avH8qEQmhj7KhBOD@mail.gmail.com>
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106210314.1767267-1-a.s.protopopov@gmail.com>

On 26/11/06 09:02PM, Anton Protopopov wrote:
> Add BTF_SET8_FMODRET and the BTF_FMODRET_START() and BTF_FMODRET_END()
> macros to declare the functions BPF fmod_ret programs may attach to.
> They work like kfunc sets: each entry is a BTF_ID_FLAGS() line and
> KF_SLEEPABLE marks targets sleepable programs may attach to.
> 
> Teach resolve_btfids to find these sets and tag every listed function in
> BTF with a "bpf_fmodret" decl tag, plus "bpf_fmodret_sleepable" when
> KF_SLEEPABLE is set. The sleepable tag never comes without "bpf_fmodret"
> and readers of the tags may rely on that. Share the set walk with the
> kfunc collection. Any other flag is an error. Nothing in the code refers
> to the sets, so keep .BTF_ids in the linker script, or --gc-sections may
> discard them.

going to send v2 to address robots comments + rebase (latest merge broke CI for me)
