Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723097;
	b=t3seae4djNz37rh9nDY/075vQT+lFilf/NA0M+JmV1yr5IsF60GFMDpMADYkLIZh11qm
	 2UItMjMnNizcxCgPptCzpi8gDtvdewdtKX7AfbV4AAnV6GSiJjgJCcPIW2FW4EFQlhC3E
	 VEnrdngZfQsSQQD9WjJ0/uvFGcUeGOdJrqLgXa+yJrNIQyiRBqPf/cbqMOe3Xf8jjRRgD
	 llulN6y2s3eYQIF0bED1Nq4nbnF2DyZm0l5l8Bk7pT52zBINcR8igE3WichF8TqCCnG/Q
	 ChwVeCKZXMzNiTjyvAsxebR3pOgMR6pZpaG9K5Td/CBpzdUfqH1QRnQpgSXdY1cplDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
	b=IwKXt5SSAQIIDlJko4Yin/g3xTJztqttcLhynULqAL5igfaN+/iTmWhebDsv8Io8cK7w
	 ZHxLWkC5rJROxrc4nRAlIXKDOi7h7dJahJJ+cJ2YzE73FYlkUSgtw6LiiVU7wgbz5oUhk
	 kc2it0n91AKhiM3EBqWRhBYC1KWATPPPJAjuFDjenSIBIwPB+17F2tC+Si2UqfLoR5IY1
	 gJ5tdV/oc7RtzWRNsUzl5QF1QS/nH43iTgzUnIiZ8DgxuUApftFwEnqvBB8ZMlVRcM1TF
	 CfgtyEcjOgjUsJS/kbarjnWENX2CAsyYeCm63ZymLjS77XgijDgfNyP5KR02RBABijA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zx2c4.com;
	spf=pass smtp.mailfrom=zx2c4.com;
	dkim=pass header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=Gl9krjaE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9DD606EE80
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9DD606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zx2c4.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=Gl9krjaE
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c43373ae89aso654966066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723089; cv=none;
        d=google.com; s=arc-20260327;
        b=fYWG/ssumvdJr2PvB7vI9xEmvDYb+psBbCbmjKzRC63ZHR87zNxnbOaoncJxcaLlSk
         PJq8ll1j+TC+ZagXPeCkMC5c0/jWuSx7rX2jkqzP/Oc1UxIe/fre9CKpkPj5n90xx47e
         rQinB81J8mE6fT6nXy5OdcoOY03ADAC9GddaP7+TvJXmaxiQcU7+iXahE9FwvKX9tafq
         EhZyKJuJT38L5lL1fDR9FTmnqBp3fNEgrcev2OY8rw+iralNN7z6USnkHXGtgKqfXOQP
         lSDnlMrgh2phSjYaPaoSuY1JtZsPjwC1YBuXioKAQwJom/ji9ugfhzS3FNR6/8H39N0Q
         fULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        fh=lZ7p+b1RBhntdugyDwoZuNceQQF5tfMLeJ9dtCBSMMI=;
        b=Q1Hj8i7vT67ynXHzu5y3KyGspPbZ0OrRfIv9Ml9FcLzKC2OTQ3RK8clAnLA6J9FQkj
         WMBu5xEl/WKu3qZ6Mj1hAzN3vAPf/k3O5VRUHfF8tcDDXr+iYCuwTfqLSqKmlP0BhMJ6
         zWUxEqkNDRF8R8rdUac9WYGWRwk8EYpmUdHaUAKR+TN4A1ExvhNuIhmMLMwBUB+nyerd
         jWgJYjsfvKKbQPXqFHDn9D1zzUhJpVCMqkcrgyaKjyN54QWUAbYYqjTHvS3BBMe3kzXb
         j5IWyTKlFptmp2fRNHfPAvqp3k6r3bnUs+ncpoe6Cf55wg+ftqi+lTJTpprXZ/ZuNyj3
         zdPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zx2c4.com; s=20261015.g; t=1793723089; x=1794327889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        b=Gl9krjaEAxbZtsfWA1ym49rlFpCMF1xIZlkNUHa/bDARlRxl3pUFAysmpgzum7cJ2i
         cO6gelLizZVxstcXM2S+3ehwMr+rd3/sBQd51sl9lTTGpOwWraIDrIcyjjJfY1EmnNnp
         Zn3ptT/w873lIGC1NCiNgW0wGNGLmGn2alAxojLtcJaq68ELIfivjfN/XSTdmhkKgk+g
         2JbBzm9veE1Nm2vyLwWiv8qfZnGp/i/Qq+jNq9Tk6+cZEkAzuXanm+t46b9iMgBxCfw6
         ATdYpkn7pnj5lQrkKgJB3ABhX18IfBXbj2/jfh3YFxtfF31SW2vjN6bPSNIgnOp31bsY
         KXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723089; x=1794327889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p1EhQWCpiUV9JPGwY0AZ8TPRcbxE7lJ0JFq7I1C16cs=;
        b=YS1ltMbh0RB5S5Sh8TPa2vU91jWOLmT8MrNW7d3B7hH/2FQpMqB8vX1cEMppO10pPp
         m836vwRIUEUj1Aqeao5akQwY1wg4pTZuko49m1zg7nelx7Aj+G2SOzvGVTEzo+oW6SF/
         F8S2sjovE8k59iWfBSV6+LMtA/bucs7gAVPe5ytWVluYbc/MNs0H8yTlRCV8P9SlxnhI
         LV5q3WeVxzsJhG+Tpb0A2HjF3DylSlKGhyQPxDXPFzYYyYqQU/MolWdQka5swcZaS0o/
         5W2vTDzy8NkwI9aDybQ5KY76sjGcLeCZwHY5ne3DY7jyGdoHi586+7yQJoatuZPtH+gl
         wynA==
X-Forwarded-Encrypted: i=1; AKwUvBwz+2wVXEbgkBO+V3P/ezdMXzfAQ0N65Rs3FA7axzujMOfpyP3spuQYN6zFCq9GLadTp1HC+PjUEf6RH6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WGKAfZEPJ18cmZxXFI99f60EOtvNMmrBgnMd6h172876KvOOq
	jS+LU05UdHDAMkKzhzXDRuT89z0JORAm7vQdBpzsN1bywEniDE78ZYezdbI3UUAstWdd5jY8lRL
	gL8rYHl+wAqkXNSOnOemJHJdsTj3i1JqAOV7UHUlTMg0=
X-Gm-Gg: AYBFou1CTd2IZal+Kj/RdhcpZBvIevWb9EXn896FjAeN4BVG7kaHip+bCGYECzFtOSB
	cUdJgQuZPnEGPUjWAo3HE6LoRJ22ef20HzEjfaKXdRyMNTd19DqzRYa7rxGl3sZOcDDMYKyCSbm
	aQ03hedYJWeFMVVM9mEaFSQmBiKArZNijrZG1paksZ1JG+DbNu67e9OPnCt7M+pd3q2NbXptJwq
	eqYbQ1S/bim9fNE5yhZkKP/vj2CEq1W6oyrc/wzMGcHSbbBvYISx5wR5fCV7BZFQwbC4vNNBx+g
	EewkDk08Q8KmY/td+CKBpwW1721IpqtJsA8P4uAzZsIXhByT7TLcZb55RR4YVKEZeecD7unFGsX
	JZIbcvVslghTuuHOzIitxpgwM3POr54cVj9eZVR5zn6aYfw12gjMdnj69e+ORlKffjlP5VTveK+
	LuKaVwUt+tBhR9d8Vy12zvZ9sLIhzNFWSNTq8NKj92LGDV4T40jQ==
X-Received: by 2002:a17:907:96a1:b0:c45:d8aa:6ae5 with SMTP id
 a640c23a62f3a-c4ca7b605e4mr1160958566b.42.1793723086660; Tue, 03 Nov 2026
 08:24:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155514.535166-1-sashal@kernel.org>
In-Reply-To: <20261103155514.535166-1-sashal@kernel.org>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 3 Nov 2026 17:24:35 +0100
X-Gm-Features: AclHuK-FjvZIQdV05OnNbeVErl0LLmlJRmNpUdovsHS4cJNG8lnWpwMwupa5IHM
Message-ID: <CAHmME9raSm-JGsyYeqFGuq0aUtberNTN3GqkVGNtS0_H902zJQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: vDSO: print tv_sec as long long in vdso_test_getrandom
To: Sasha Levin <sashal@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I can take this through my random tree, unless the vDSO people want it.
