Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175628;
	b=a/1CH1YfC4s5XYey0JloZCx5222GdhsYR21lpZysvfKAmxRpOiaOX5qjox4IkUceQ2e1
	 Ta17h2jscB+y0k7a82S27WFDOW8wX9GLSqlVIF93vxaLnnhANTFNiRkyybAAL3ScKhxO4
	 oAxjUdmYW9k1QSAOvzpbTYQ7CWN3ulEBWlW+GhGJaifBZB3fy3CCf+NRXKzHu+DMXCHiH
	 6qCD2EZAW3tOiAz1PntMGp4Ap7LBOS0XoEvGyAhajdrrVHOtK9vXK+gANnzxP4EOmWkDP
	 g0W7OguArs4mbA988A/Uwdpac6quXTnqhLEor0IW+eOFMWX5TkBETUIZyl/a4uIJzrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
	b=Mkbzv4153G+Hl3KwkJ8SBkLD/j6kAKUju6NWyYTnR5tbDe72H6+Vcrs2gCiwMXlI5Mrq
	 GNg7x4SE2k4U1d8ueCKooJik2GEUQFstlrVmW54P2JkRibrt+HDZGzKJTk7jvrJVokn4T
	 hzszpXhJHgTTHFx7/ewHEaDo3WGcL1Qo+p0Cu9BO5tTJxu+EsPA6oFpD1Rg6ZasrdbQXU
	 YZ7z08co0UPGWhHZdhRHE2dEJFYkH6B0fs7qGzmVtPTj7KhLWEnkRORgIR/Tmj0SGRSVv
	 /xiBJK7Mb+qcdMyerQ4IVE1bCRr6TaVKzGHqX7Y0JodyjKrYwFrJmBbaVxNcO6PyAIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86967606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86967606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMkSfkrI
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91eb7d1478cso3469896d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794175627; x=1794780427; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=DMkSfkrIvh1J0HmyqnldyergtJCpVvzbM5wCx8OJ2o23lhtd7XoP/mungBoCmsSuqV
         M+rYApkY8E0axtbaa8c13yvk09njje6q4WLdVpJlBRrKUkSiA5bVzZwBO1ycKC4sqJIB
         R+Nkm8BWTmhQ1/h+bNlpkJ0sR92QwIqusM2bsN8SVZr+JR1VvGLQqBKIdo5z1FOoj/OM
         abdkoH7n1mm4fwCKsW85apwhJYw/e2R3cVgrjcPJxPubj9JnXKEZ427TWvB9z3Pc3D6z
         6V7XaK1/XyDyfSxMPSZ5S1XB3652vVtep5CjHsJygTDjnHK8tdBGZOY0VaHvLr8eor7U
         iBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175627; x=1794780427;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fskAnZVKzc8hUGA1+pTPLWvHFMaE6t+Q83bw3SAfWr4=;
        b=GM7WEI3QfQZJzLICLBDCrVE7ewOq7129Pts4yAjmiy+G5cFiqt0GrfQtVwuDIU867w
         tfxEfFd3GXeIQZBkDaSsfSt9cTT0vxV++UYvc8rL0P8YJveJgfmR6WtyG7glQJijc4EU
         zP9kJsVVkgMOL3cK9ga0PMtDHalpc7RJz6OD7dR5M1Z5KV9aFDLwvOoInOHXcagkQa32
         m7YrF79HOvgLW3Ogt7/5CHqoZlTh//ISOzUEapHeGgaoJw2Nv+P3gJO1EACBVxcVV4Qg
         xlxUNkofw06GWbxicpHbaWaAQZF1qixATmv0aXk1aZ2uu7dRtaaSeVlAO2gGQeMqSJiF
         gO9g==
X-Forwarded-Encrypted: i=1; AL+hErE9mxC12J3zIO6fsvD5RnWaETk9IQGePWymdKeHADH/QSAFw7QJKdzGC4tIJ9S0wgqGcg+zbsGeS3gXY00=@vger.kernel.org
X-Gm-Message-State: APuU4Z8woT4Ae06UzFNveiNF7k0Y4fDvdDtqBrQY4Q7HuxM57Bw6NLtB
	EhHQr74qlW3iA92ldPNmGEMp47UhnqlL2S6IkjHJKZ1iv2OKFEyQ+LVWUaVqnm0=
X-Gm-Gg: AYBFou3kj0hPUI6+KWAcrCVW+xHTfxsTw6hVHv+LoY21oQSRhJfDzGMplmF757Kjded
	kAtdArYfhsqPAqxNYT6+gSbzIgKrGKorF3kZrqPUVeVIWwHOI6K+BHo0DxOe6ha2SlnWXL1As/a
	C3jL5Qtiojl2wrIfXHmSc0w+0PGnWKLfN5fW/7rYSvCvgaI2ehMc7v8Wl+xpDUfDvFuSKaXTUF4
	lxGtDrohUpkzmtpF+V51kc996JFD/wlD+6zteSVs+tkxu8ziO/mKHk3ttn81R7PXmJq3568pZmT
	USEzLUByjprHSRlkhpRSqGXbKkUk4TI8bcjg2R0YWviWsFnTq5TLkfYSti3F5hyAjX6rKV50fv4
	crWQQEXj3D7ISlPEM98Htj6fKTj6bIh+D/jBFSEV7ruKaaS8mwmc+uC/8j24Dv6gbyD2oBLvKv0
	OcN+MYPy8dK8vkYVwAiApZFzW7KXEjprweWbt/prtntFgXSdomEUCqG/876EPRaNEMtWGnux3lJ
	ROy1NAn2XbXGqInTsk9Ja+yBwdraN6g+30LHvi6CcqK2+yoUG4Etcv+V0djAQvrSxoFgGq/TlyD
	N4fZU9P8ZbnVw2ctBKEIOUVXnLfNSFd0cfYYpcfgS+Tkaxtpxm0VO/ArQu4LOxI6Qs4qk0FCaY5
	5TOcNvcZaHiBR2YyCYmZ8pe/x0+GWdDZTDHp/aeOLQSuJCaT9Vk+dlowoo4vfOc1mBQ1e4gA=
X-Received: by 2002:a05:620a:1a03:b0:93e:3824:4123 with SMTP id af79cd13be357-947848e90admr386631985a.65.1794175627456;
        Sun, 08 Nov 2026 14:07:07 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d93650sm306944185a.23.2026.11.08.14.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:07:06 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
Date: Sun, 08 Nov 2026 22:07:05 +0000
Message-ID: <179417562518.1641291.6757389780804092916@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi David, Brendan,

Gentle ping on this v2, which has Daniel's Reviewed-by. Is it okay to
pick up for the kunit tree, or is there anything you would like changed?

Thanks,
Eugenio
