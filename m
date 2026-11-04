Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781497;
	b=jbwQGQTMIsHWS9nmWefgEWDK1nzIWS6Kdis+sI2YykVtetgmHVlSuEx5hTpzmYfqZ+Ui
	 Z1+1U6lY60Bvb8cRMqqYXeKH3eBxfik6bnflG6yXkAx9IWnfLqe7apK5LriRLgTq/rI4D
	 IffCdNnvPmu7G2CfzvVp1x8Mn+rY70+VXHdB6bqL7VXIdhjGd3e0TPvZURIB8dNcrccPv
	 AoCe2c2EuFp0HX4HwxuT3OP+riG7Sx3sM3tk+Rgpk4352xKzpZdQKLJ1YE845KXvquAnU
	 SnbmHKHpEIHuii1vK8tJblWqfoF9GGxLX3NxxTAwQ0sbDHaWXFhU+FEbTViPDEd6e9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781497;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
	b=sOwKX7u63BCI6A4jy2SpkElBqA+sBaM08FfDDgtUZYm6d8lL/1WLfMJds5TrkLcbKRBH
	 RZ6z8c0cm0ATh/LgioP0w3F0busR2WQTiGLAiPWtKkBREQUnVzn/DOPp+vil90N5+CCIc
	 BPNooTrQ7kYldBnY6fo2G94EtiaY9YzC0hlJy/xbxFoYf3LiPmDX19h8XXQBnKqtHngAD
	 ZLVivHc8muVPcf4XI1gLXeKfngF3L4IVbVniwEJl2ZQafRoOd5MBf/v9r8ko9eOV27I6z
	 TTnB+6TrQ4PZ6VRQBpSiAvpA1M6ZvAHSeGmIq1IDfK5kLp3V9W519I98rF64QaR0cNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8C606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc751eddf25so257815a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781497; x=1794386297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u9aM0DNq25EEfmak0NV0wfOge7EWo+oCPkidJK9hcP4=;
        b=U9S88xK8Dej8rOoi1GVL3s1T8JXaJ2jQpprxfvTtdJTQLPIDR5js7s/CL6L1DqyCWe
         2yXx/Vlzv4aI6TD4pKOqDaKCenwzBMDaWzT3KP5wBNSstkSmEfq4izWRruAykke2W/Bj
         5UsY3ykvRRw3zqpWRHoLqKo3Fsyjt/7B+01iZCwc5Lvk/20GtXKWqKRkbzFOk9zNebxB
         mMVFWNCTkVXyzpxIurq/oQ4o/fH0508y3xEuG53M38qGMM2fblOvnqEMMlhJiGBagg5z
         OMKTclnO87JNCUQbiMVS9vJii0WTNG6C6icnGPUOPnDqwKkSbjsy4G/8ew3E+ZUbl9dC
         Txzg==
X-Forwarded-Encrypted: i=1; AKwUvBzqw6N895mtT+mLJ5cA6EGK1yCqXdS4VxlANg/5FuO1zKZrWdEPSNxz1ZcHQjRpUF6QtdgI0lIoVF4ugc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DRO+ePM8DR2nN+ho2fmY/iFb9VEIQRx35LfqQvlLEgSaYYSZY
	svtv7lCStL7lNGDYCO9Pu68HtZdfacJUMk4UazUtO/CXRtyDRz19weoWl6kLscNR
X-Gm-Gg: AYBFou3UK0hVGz0F8JbQeeZ0pHnYV+WKPSSoae5ftXIi9HMy+VfBlILA9tzPzzgO/Fu
	9yUe/ONGvGst/roqxQL3+pTSyygDwfyN5Fpx9MmvNBp9eb+4fchqvsupVseuQAP0UcJJ9IC+OFk
	oGEKGYz/NxFZrdpuPoVI//ku4TPDbe3IFj2PeubqYb2gaEcDbh4PLCpV8lGjCCMn3QaomZ44wOi
	YkDW79wLMvZvXvZwZkRRWTpI5YACT2/Sc/m6ieGreHohLmLf5owu5NoCaaowQSkERfItYdXdFKq
	GubfIJTpS4CRD/XY+HY7lOljOy0WqyJMX7xWTPiDw2obflx93Rc/7bBNan89Y67r3QLrTQcXP5R
	NemBqna26eAkVQF9vi25/0Kks7+n2xi37JncHh8CU2Uc25m9JkhOko8+jQU8sboj3ycm5I2C11h
	cJGugzuPnQjVZbyetwmUZB3iTk4J4oa/NVwoZTxIOApbrPuMiK7hFfcLTK5BNe3mdNkmfqGl2nZ
	NFZefbEVaL8WRDxr73bws9lMOHaRxYsKz/QMOlUgQZUPRgzhZShWNJjoUZsc4Bylw3odfAmmHyh
	nwEkmrvlrbCOL1aZdLdqog1EWS6+2NYrTCX7gjA5NbqUlAVnDXuK8hIcLfT+3IoUxBMJ1pVpfew
	qadDUXgO7j2MAb2C+jzem7yTtgpiZ/F2zTF4yJDvh64g=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b0a38a68dfmr214918a91.59.1793781496866;
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm2764496a91.15.2026.11.04.00.38.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:38:16 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso650021eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByxcVk4vUD6TwliFyDHFbSrtP//IZIuOnWaH+eucIEuU5Vt75I65/GkeDQskMBcR0edKZDCmoZzc+FkFWI=@vger.kernel.org
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id
 5a478bee46e88-36a423c6223mr23977690eec.14.1793781495997; Wed, 04 Nov 2026
 00:38:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
In-Reply-To: <tjadgdqzbvjj7kn4ubibqonrk7nod2gxknzzvdtr5vzs5gv6n5@bvue2t5y4ks7>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:38:04 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
X-Gm-Features: AclHuK9iITvqHHty7IqgPcA0y5Bp8oR0AxaQXRkiXUsTXH1SHKpldLZV4qph5bo
Message-ID: <CAPY4CJ67=tJyiWYNf5UJWF98OUY5Ytq-kyjJKJs4FRseuy15ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Same comment as for the DT binding patch.

Will do.

> More common pattern is to retrieve the address of priv with
> gpiochip_get_data(). You already pass that address to
> devm_gpiochip_add_data().

Thanks for the review. v2 will use gpiochip_get_data(), drop both else
branches and add the blank line after the header comment.
