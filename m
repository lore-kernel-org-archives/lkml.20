Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690104;
	b=2mQqy0xhx8z37DBXWsBYgFoUWbgVBua7VFFclQkBxxkfgvnJRdI3TR1X1L9gjt5Zx1CM
	 kiANZIB/zvkVNXup13qpGM22MoahoBP+8UcSHG5lGpxyYIYTAXNoti9glzlpDHYCqMAV4
	 WU/O3eDAH3rsljn0AhOW7PyOv22eqjk/c2egULujYE4MFWMB6dtxWiTge/EGRh6wm1T9C
	 vpAXCCZ8wn1ctjYhiUQIi805vEcePktaKcB3h46qSinS8UrncFVgXU1gzyY6zFOYJAANr
	 j66I9Qd/VTfWYS1V3F0PKv8+z3IzCDnxurFGHvklcMc4hfn93euy65LxKojdchH/brA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
	b=SpRpeiiK6YSiG2JVCMPX8vGxGSZJNN41ngPc8KRSWeqzUhW4ZyAL3naYSj0vW/M6SKec
	 WXFMVGnpJExs/5hN98eGNWa3lMsT1YOvWJOeAJ8FMdvHCGT3n1Yfjaf/y58olK0Bh4CgJ
	 8NXe7e3OoF010kYQa6XBQWDVg7fgckLdGCAVZZBYgpfEfbImwWZfZEC9hDf9jUEOe1BN1
	 9hwzX8zmj34vSX9JQNb02r+qxqQcDmatW0OrxJRHOVKQQDn/8vMEegqGN038yVy4qSaiu
	 4Dqr5rEAKjqcYcNDijA+dWX5fDGHyAbnIdT0JGSPMu70NREMYis/4daXWow7UBHo39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1797606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1797606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErVKCOcU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so25781665e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690102; x=1795294902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=ErVKCOcU84Ds/S6P5yAsvjlHW5ED6oVPBK3r/ouFYhcuz2n/ROUmxaT9uHw4Jy22v/
         lyiifSzSIhKPRtDn3SGYSBs4tjbeoPHnx/QMFTqmsIz7qfpAwmD1PtAqnvwSI9/9L/6W
         dcAg953KhZHdNTUm0AHbUTwLc7qwPzzEijyTJs4ORhfKRKW3+yRWltH6Gme/WLFP+nYm
         8Z8vh6aEDglOT5K8tE8u6bHNB9IDPbZdLepQPHRRL6R6Qb8723yNEBioOUSEj0ekfDAp
         Hy5WYGRYR/BD0lzP0v+1Uu3IjweGYQ//7IdOF385/tfadcHzJmDovFZU0TI99XW/59tT
         IHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690102; x=1795294902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJ5ePlRQ3ctDArxbodZpAid0v47e6mJlXhyHTr9zcZM=;
        b=hIFlmxfAcW89j2JUI/1GDNkzXE7zyuYUhORs/8SGqpbLyXviCq3z4IHE4Rq+e14Tl/
         DBg5K/d32QePm3KABqfjVPjohz4SKsRzlUQj+j/2IksRJOgFTZ7tU8Zj0elzWQvaIx34
         GcODiPZ36AEgEUZ4xJmlcNUc6RwgSMqd8KLfirjiLyiOuttEd5j/5KNsRYNymvtFl3xd
         zxhAZHEl783Ua0Vy6QXvLeduqMggmcLM31jp9lxJdA6I7eleenwn500cPfs5E6EPPmYn
         tl10iIcGn189/6hh5/DrmDlVu/BxFXrirBxLlFw2ubAaAzQytPFnKlfK1yn+QiKwsgnl
         /GvA==
X-Forwarded-Encrypted: i=1; AL+hErEpifZfI1EiTf4DayE+AvmJ8033BJ/4z8BUqBzWaApVsincXzzRQb8BvQzuUDCKBD6+kzgTWPA2jp1L0CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95yxvSvxhF51tDhPi9m3gNhikrqbJu6CwBQ87jKNGozqsW8BEA
	om0wl7uqSXogIuFpE4Y0P2WiFLyBk2fDFinScFeqCo+4DNrMYB/Va5HG
X-Gm-Gg: AYBFou3BvH6AQ9gQuCBK0BpfAPTbgG/2NEKmeY2Dxgi7FYi/x2e8cq/kn6SXgMx3jpE
	z7fJLxY+cEK0MEzT9B7IJ3wPvFUxYcKrxc7S0Jh9RkeUozUohqsKx5isctiTJnbvh14lrTwmDmj
	uUFqVEU+OVYicmICG9mtVTGrWeYo3k27P6uEJN/AFLcNOflewfkGtJ3idgRtOI8jTF5/2fMzdTA
	zKoqJ/NJBBptdYdua9gfHxQbtEuArzuA28OLQZK5vi/jv/GUeh5NLgngPApmGChI7S57ra8g6gO
	tNCtMfV8G3dleVltKCjbWkqa+iGX4k1WqQTzLHzF6otd4nI/Xl9Yxuz8NDPPsD7uDodQDynENH3
	G/w20GCr1Sj0ghSreipp36Bifvh3I9ZkCda9RYjN7pz9t91cB+ciwa5n3S7dJTJS8W0aPR/mFJh
	lfaLdix7QvaJafnWytJTXqCh/M/VMEy3QU0ReN9yiuVn0oLlHEiuIDNg2GFE3kjkCsPFlLdL8B4
	UjbX+8n2IKxlxSLUkesnAJjIwzD1Nzv+tPrn3Zh8c1KG9lUobQaxbhrXzvqJcTNqCXdqCBOcAM/
	/LdJnk0HdA3eUQpY9b/s383JeJqaZz2ZXdG5o8MmEdSe0Wn4
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr7149015e9.20.1794690102290;
        Sat, 14 Nov 2026 13:01:42 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb666a3ca1sm68359985e9.9.2026.11.14.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:01:41 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Sat, 14 Nov 2026 21:01:29 +0000
Message-ID: <20261114210129.1925778-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
References: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com> <20261108-sxr2250p-socinfo-v1-1-06244862f5c6@gmail.com> <20261112-alluring-meerkat-of-elegance-dbec9c@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 12/11/2026 12:16, Krzysztof Kozlowski wrote:
> This goes with the SoC/board bindings often. Why keeping it separate?

Resending, I forgot to Cc the lists.

There were similar patches for other SoCs and my DT wasn't ready yet.
I'll add this patchset to DT v2.

Thanks for the review.

Best regards,
Stanislav
