Received: from mail-lr2-f32.google.com (mail-lr2-f32.google.com [74.125.230.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE521CC71
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248058; cv=pass; b=cVZtzvRxflBoKuUWNcOJA2969jqgiPlR7QREcrksP/ZR0vNjXk4/EmTFKRtmhPYVlc2vxgH/XrHZfMEXcngj7a/uCCATO132wnbLplBoYeTwOS+6Cj4EX8hcSKkm6t1inPle3zdNKjPlemxC11SnlfHQI+hED3P9ijOENwgwhy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248058; c=relaxed/simple;
	bh=WlUUULkXecDA3FrqNMgGGTCq58pBRHG2vpFkFbVh+ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aP16qWsuPDCTKdl489rNC1GvZEylcA+89uNGNVzhliSLENEZBcg853VlZ3+sCcXcYSPeHV2m0mkN8rGnykSdNpuS75ZVV2F23k/lebhppLnmhzTs+V2L+gzLT+d39XEzmPuaB6kVTi6k5wONzNnMrjGEhgSBLi5N+Gz0QjEAmCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwETqH9c; arc=pass smtp.client-ip=74.125.230.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwETqH9c"
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a96c77840eso24797001fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791248055; cv=none;
        d=google.com; s=arc-20260327;
        b=bKQWJXvXn0zbHjMqZ2D2PenwGItczWwzSkQaHhKSn0UlmeAro3vH+Wbr1mju/JQJG+
         6BIBUrTjqKleK2W0U4S1PMIwMs7h12mXcBWygEQ9FOSCXKH/iiWlCQ9elUOE8G3QMQVu
         LYP8WUSPeGo0ly0LgRH5OfCwZKo3KRDZqiBWRm42R3pW9py+imcGNT3cZ6WEn71dE50b
         TtoovswkSxbDtTw8knlQGG/rCRWA55SCObE8rnLJOG8KtoT5ut7Z8EpWzN5V4/z1dUQ1
         jbPW9ym/lKa7KteK0RBG86II/OkIj6+Zh2Ex6tF4+MZWaKLN3Pcwg23Ma3Bgf9i2k2PZ
         D88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        fh=2w3/Hwy2W8kqkJgdpqTXN4hW1Rh+e+8N53ebbPXl5Ec=;
        b=X4pYepgW3LEXUOPKID470dDRC9kyVezTkJD/UN4TAfnSJEugKESLVFxnf66M/t72LO
         qpYZzRGrpbUA5RiY+7T4s6K9jN5t1igmwR3N/2J6Sp9sWzWLK6rzJbkMdyOOXftTnvIZ
         xnBcgz1CEmk6kralaJ5Vihv07sluNSTmiW623gEdHPy+HahEtb5JFVf8icbTDyLvLy/h
         BW13mB5pAtP4TBRk7uOrWJESNrKKQ9FWcvs0yqh1thIu4RHegIPpZpX60rvekp9L/f3a
         LMLk97CZz0Y0ZlMHilteMRPtY2L1EaGojwMMgxAf9Ea4JhDlb0mAy/noglpitWbs7Ljs
         aS4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791248055; x=1791852855; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=fwETqH9cxxal0fJoOC1pqQuaG+wbRKB5K553A9Fkx3ZoWA8SwJ1hDrPM+4fb8QJB7o
         4uNMGAZFjR+vPB6KRJAuURlA76KVw+IkwbddHQLJtv7Q6kn/0jT2oo4d2WaWUsxtfb1g
         gB1WgFAD+ARVT6SNvae4SOND8I9R4iEc5IwKtgXwPAN4nbqv7D/ojylJAKeGEY3F8XPU
         SfaOK7Vstxy6/Z3o6VvOG0ssIH5Cyyhu03PRzDYyinx/wXqWldkzoXhXpgT+7qa45epP
         No/XJS2lLa+Kh0ZQPg8Z1Q0XKZCWF+ODEQeT20C4jlRLjABHtUdtf5HHbWHTBqkQA92Y
         FjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791248055; x=1791852855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcCvTZJFLUHdSKFVu50rhTAVsHuaYlG7ZNshew9spyg=;
        b=Lkbv/1oZJ7VRJWnhRI0oZG6HJMYUfKzFgK8G9+8gQuqx9h3aq7ti9JWKTuLyXvGsZL
         qugPf9qiKKUnOMRuOCEwT/ilB6iT7bcS5gG/hcA9h7F+Smwd0c1ZOzdZ8caiou3V5JGH
         iePobZYQN/AHEdgPN0ltWt761PoVTZHYRD7+E13P+onScUg4kWyxWdBNFhqPUOo8R6TO
         YhAe6RMTm8mzPFzq4nSxjZK9M7C9f1JBrpGfAgaBC1/bwRQR5iibMM0rjyrg56by5S9v
         nvsWAlctaPFgcRUz7Bv1DyGoGwdfJKGTe259eoRmTlab/N/ISwu5XWTCUaBTpLxqVuxs
         bXIw==
X-Forwarded-Encrypted: i=1; AKwUvBz8y1GoHqS5ZlaNCBbT3czIYI2SMVR50E/Upa5q35tYuHHkiNZTEG33NYuf6RRSAXULmY2Sk/DIIBoJt1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+7RFoqweG9Vv4GDHjVmkvS1jS/JMZcsRruhMdNZJeLoJlFJIF
	d6sQBzA7Vj7qV4FWKvwTsUx9QbFTCCwGOXWPHeU52VLb8b6HRjXL5BcNXeYCZ+NKXRx6PPnM1PD
	AlXFhwOZNWVqjv3Ttfp5nU7kzQ5D8AsE=
X-Gm-Gg: AYBFou30ZcI5pXVNqbQdoNenupPlAY2UR16QeBlkhhlUs5+gK1xO2erP9qrZ1kLNwkH
	+ODhKB79ehFXsS0Ggz8qhIsRIXBv5+LQPNApF9L8X7mgkfoGl6AAEcj/kkW+Ta3BCaLz4xrBGq1
	elHc7YJQWX4qAK5k0eDGoOx+mRa7+dpc1Yg8eUBjn6tb7I/mqrr776XxbiupggApKFylNDve0PW
	0pV0fiWCp2rz0RfFSAZkN1LBjWGOyVl/4+mvEkYD93XPrhy32VJsfCo1AJPOU6DrUVm4nf6luuo
	4+dSGmH+ZWNkRAnPwEaSXL0ci2LXvNEx7yGAQcPnU/Qne1mASKxrzLMGLEPPVwbR/tRp0Obeh1l
	AbibvV6bxOcGf
X-Received: by 2002:a05:6512:8345:b0:5b8:e716:64e3 with SMTP id
 2adb3069b0e04-5bb9bb05b58mr2911017e87.31.1791248054559; Mon, 05 Oct 2026
 17:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com> <20260924011554.3494-3-sigefriedhyy@gmail.com>
 <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com> <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
In-Reply-To: <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 6 Oct 2026 09:54:04 +0900
X-Gm-Features: AclHuK8fWL_vlv3-mm3wzWj5P4aeBqPD8cwdje1eUbLrdaL3n_CnWcUcb1-y-B0
Message-ID: <CA+7S2vLwtrKyMcZ4YkKTetnn4bMrg=BP6sjYa_R8pbROhTGrRQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > + dev->rx_mode_addr_cache.owner = dev;
>
> There's no need to set this?

No, only dev->mc is looked at. It was set for all the lists of a device
after Nicolas's comment on v7:

```
  There are several lists owned by a device (dev->dev_addrs, dev->uc,
  dev->mc, dev->rx_mode_addr_cache), the name 'owner' does not reflect
  that it is set only when the list is dev->mc.
  I wonder if the name should be changed or if __hw_addr_init() should
  be updated to always set owner when the list is owned by a device.
```

v10 takes the other option: the field becomes mc_dev, set for dev->mc
only.
