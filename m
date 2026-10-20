Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511541;
	b=cO3c7YKCBPyepE/GpeJk7M2Q4ul0hHK7+OvapVwCenGTf0v7D3ID+TKsc2nV+0hUQvQD
	 KJzXox9VldAu3h3zp7LooNXXYLYoRubNPDzLMKq/gjWDQi2avs5u1U4zKdYAlEWYZLmfX
	 DRNL2H7R2Y2fOmfdLnCHo/ih1TNDG85iSBf3gKV4j4+PuwXpqAurd9fxlTtCFKNglaIbB
	 6ziu3NFsbn16fc9ui/z2TFLiCOBeEuCsDTCcA73uMAXH1sJqWnr4I6qlcBGR1KoaL32Zb
	 OVPWVsfr03FrVMbzDuXdNk+qKLSaqi6a0cH97Lbab9ID0HcINkJ4HbU1fTr1/1NYSig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
	b=tQoNmq/kcsqc730vw+QNqlZtu0y1ng5atBIcousfzpKgoMGEeK5jzt7ak2VLZvA8sz57
	 gnc8uv3LGKWIQ6OIUh4zAWuDwatCGKNaPiMp8bN8ee8BfI3rf4dkaR1GZyJBldphFaZCo
	 UZnY0BwD0CsDmCBIeKP4UxMDhh7YkFV+P/5XbFxFqqc6Ga8NyqBqTn5oxpVvbUunr7y4V
	 2yj6WXo8QIO1EEk2+khUeQ88SckDzQOVnf+zfAObeGtCDIRm/iG1eWucSw6bv1mIgSJw7
	 lephE2UZ9Wp7kb56GMEOLiPudu9+qS+ln8eoPyDBXJf4vgnmS4rwAqUIqudFsJHF2/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=StASTQzJ;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338E60A2633
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5338E60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=StASTQzJ
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85237ffb172so129455b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511541; x=1793116341; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
        b=StASTQzJyZyqKvna+MguyiqN5KFN/a0/4ciSaYm06uXS6Hhmbirt3OdDP9tTlKGo2P
         IrgWPKe5sPL4i7ns2XEYQGPVS7DWRcuDKEEq5DJXvEsazdcvssEJy1mT2xzDeh+H5ygw
         zwV78dfUU2s/1Fahz0p7w/CJr8InHVnxf3S2zYVtlvpI2wt0lpMvqUk25ETNAhWTCDmf
         q05ukX7sldIno4UvYQ0ftxfGjzwZz7TY04S4t/t11gwq60LwhQaDIlcLCPakDnpw5bG2
         92rVNWcoeUV0gUMkQpy9OLlVynMxd7Co0hJBal/cyxorxAFbyGEdBJZ0KVWqlWVJEOG8
         2/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511541; x=1793116341;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
        b=JMFuI5W0/jnXai4VgasVIhF2s9Iw9pJARaXwqikeSIW4c4GcEoqvsZyIiDkb+8qH7W
         NfsK5yVsFzHKTIE7RWo+E9zCknAW2iyFW4fEXnfAsUyldCxH+KG1wee85VBOEyiRmJgC
         96hTspGBNdB4EO8UoC/jvB9D2FEBWI+t951i3Evlo3hRm5Mt9Cz4exbarrLE5psaoSvH
         aeHzSbou8IUum9sEQ2PKh9TzovLSgGCiBKq+hrqgMJvGZT0ORAWMi/SLch3BTdvOo/e1
         ftaNXlGKi7BGvOeh72RBcCINHwPkD3JU5uL66b4/3Yk9CwonYxZTz5zAahDNULvecDCq
         /FXQ==
X-Forwarded-Encrypted: i=1; AKwUvByj8fDi5qHOxmwYHJ90086Giy/lWwt6fbAOfm0eyEh+m1FE7/r7exPGptZ5ZwXF3URdrSqjuYuTHm9f0zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+ILHKa1SWXkl26SikTRqOG0H2/gu1pOqoDV63V17i/faRzmIQ
	Afm6K9P5+AYTiyteOszp/hGydTzv7IyGOXB8huPH2csBICpynaUl/oEz
X-Gm-Gg: AYBFou3t+KZtbEDb8lltWEYCekjcKS0SUaBDfgztYt80/HWCDfBJzQSnjsbsjbQycQC
	vrkY6m+LDkooRfYkfNmTtx51TwdxZOS/qKrtt9jP8kTPn9VFRYPIPRjcUel7zmenSz02oGTnyEX
	GxYntzGet2ugePzsphHR8NCaxlbL89ijS3YIByI0tWQA7PKDd6TBty5FWan0qW4nGRQP/2rzDU6
	e1BHWalqXN2eZjFrARZRl8pECZvJbT0Hgixjx6poGGpHoUy6RUGK3S0L+0G46M2SiXCKzYrWVgg
	lOD79Ql0BarNYRzLfphNnPZAYi/9+zrsal1B5FB/4bmD2m+XH33TXga4hzu1mCwtMYpF4pvwIG9
	69owUqdgdFxuguC4SKlqU9pvPNIOQQ80KVnh3bjmuTJEfouZVZ8EX/EEsuj4Ab6gRJe4I2XqZzY
	8oV2iVaDYltMGNsqtebTd1rGdIG0yK7do47+iXi/fTCXOvYR77+avLujsXD2PI6Cel6feMMfsLt
	j+k1fYnRhM/q8onTiOv6SHz9A==
X-Received: by 2002:a05:6a00:468a:b0:8a0:8832:7b51 with SMTP id d2e1a72fcca58-8a08832cfb8mr93447b3a.0.1792511540588;
        Tue, 20 Oct 2026 08:52:20 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a06b4d1a7csm2106541b3a.45.2026.10.20.08.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:19 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
Date: Tue, 20 Oct 2026 23:52:13 +0800
Message-ID: <179251153301.11928.2472677014573396901@gmail.com>
In-Reply-To: <e952e037-5be8-49c0-b0fe-bcf1bda77bdc@linux.intel.com>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com> <e952e037-5be8-49c0-b0fe-bcf1bda77bdc@linux.intel.com>
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

Hi Niklas,

Thanks for the pointer - yes, this is the same issue, so I'll drop my
patch. Thanks for catching it.

Best regards,
Anfernee
