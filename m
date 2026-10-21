Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546919;
	b=iavGaHQVBEywRA1RI4es78BixrCTVb+xyf/2J8GPriocaaee8vjTsH+wJ24ae3lV20nO
	 hXEUAsUmgYHsheuvb9qyvZS21a7lsX+uiiRw8toColxstR8jS96N9yqCCA16PJbXIg13g
	 DJ232WtFLBmkp1xfnevYNIlfqvTsBc2RKDP6JSAQpEVJdgGaMZ3hSQUngDIFlJaZ1rGyX
	 Olcwa9LhF/xpo9u2nZjZawX3Y8zTv+QsfSn4v+XvPrk2kMm2A0/o+HuC+ti2wZbMj8PEc
	 IXrpn2JazqRFs/yTfT9vlwQNcCdmwkChcuAcYdh6dJlI7HMQBlB3x51b1pa+G0QR1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
	b=5cZXPy4AuxfSAzgKYopbJEsJy1iMcaKecSfAoZJzZTldnbmrxZj9OH/CeJdTxK/uE3hH
	 YmfQsk0KQKQClP5NwuxgfXvRA069me+4u+hUdLKNSSQkWEiS5voxImZ+ugXRPdu5k9dG6
	 6UeNSb8Ec08rj0LBoGxf7KFpbcb4RlrX+Mz7WHBxXpH3z9SOPhrT/h0BB7+VdLocDzjfZ
	 ETOm3kMeg8QOohvk8nBh0DDMmeM4cWfjH5CegIixcsSez9Y6S8A98Usa5lBHPv8WGysxt
	 euxEnlVv+7p7ObKm5UPIyV4Ke07IfOGUjg+wP3UnUlmyuyKEDlfd6ttLb6QopTsUzbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MVBfjRxU;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B865606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B865606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MVBfjRxU
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so293139c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792546918; x=1793151718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
        b=MVBfjRxUKnJTPV2PbUgCrwO6K+tafK6pr315kXrirjfWGz0HxESZGdJkFkFw2d+aCY
         gZusa9//Cq3sm0YTnSxUybcFeRik8gNb6Mz8tb4uFW0Q0h0ueYFa3ATAyFOIrBR0xzpR
         y11eC3o47YA1l5CSdaU7cdaXQputkQ/2F07/fchjp4McxwtJOYs6fQDazoDN5yXaMRzf
         b20n7g54e/oF8h+TaVJqsGRE1ENHbu3fGCNlrEVnVnD4nD9LdeEZq5O4Iz+vbt39Kcj+
         6d1C2t9Y2kE3kJWUi1OlYHZbEoqSLpt4XtzMdLPnyuhuQAScR6WvBY2FivJ3tquuqQgF
         +I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546918; x=1793151718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEk7FecfY4nY2BV2BtdF4RroL7r8NrfcNW+Labz3ttc=;
        b=gnrtORGtdgSALlAkrymcVc64D9etVFE/Ph38c++M6hCb5eUtgADhKoJNtb5dorQidj
         Czl01z6M+oHAc2oQ+bLC3szgt3vA2r4nlr2RPK6cpZp7b/hcFT++0RQHY3M7ZDonzn7U
         wBW54FU29zU0LCDFFy2Jcd0c42R+tE+7WUXHzbYdTjP1qV+TYJalXpysVIFxup7af7OG
         Q4nprZqQUkXNr5MlTMA5/p9L4P5vbZZmoV2ZsgOVGh4uzB8yBnIi0oR5P+nVxJMn3dWr
         OyEj1Ex2qzNNts9eKuBGUl81i9vBw2eqqDm5BARQoVekj3g76Ptdo/kcwHY/Shq3xM5i
         MmzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEQbm0nj7p6YlkpIGLJSP/GIgu+dnKVAoS9J9PPUnrwPCWgwFflycOxT6lME4iWvssq+5JVKTyxpOS2bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjzkRZ2gumxv7i7ZdpDTL/5ON9YPKHKbr0sXQ1BYAlcuW6o0UV
	VR+4K2UgLpWWJLw8890fivow5chGbSYaXwgP7mNS6CpAv8weJFDV8XyN
X-Gm-Gg: AYBFou0T5A24sB3xINxYCR+JMO1TGgLZ96BrzRpaCfQXOjoRB3HkkAu8OP4jzpY5/ib
	bJvJlUp1P4tblrCWDmwyeWFBrRK1boJH7t2P7n2PEtwaCrSgJsaem2pKLgPp54JQE5S61lbT/Fk
	hE/LjVKrNBwj4cAO6UXZyCKwZSGRIBOiiu2zQwQIt4onFSlODH7QzVmy2R2I6pHBUgu3leqDW5I
	N64lyfqSCe7tkSU61zwBKoY5YMzDjHAiu1+of2IGbkAvHvk8Z93EOFaqFNMgCB/a040occ08xcg
	xj0FA188sQQJvHpQBYQj0CQbmI7vJw+KuL+j9eqt/ziPFWXC1e+gTIaXGSJMxJ/xyVCl/TZsIJ9
	kGmXJ1d91bakqVBtqvSVi0AD5id2XU8KNGvL+x3L79mSy/8GQaBatS1+lE2CeohXjz3s/NUITtD
	ac5/puYH2j+jrIxd4gxmMYOKw1eyrhGhuVUPxE1EocoQLiIYflUvmdvIKerg2WrHmk+/AINWqHQ
	+BXTtqbo7h+aB9rET456wjwlYNquRLlr2PTZXRyz0SiWgzI+Q8saycBjLxeAEitXWpULUq4w+iQ
	++g4OBunm3iP/HvkeF6tdw==
X-Received: by 2002:a05:7022:eb55:10b0:187:cf46:4c51 with SMTP id a92af1059eb24-190a728a309mr818013c88.31.1792546918290;
        Tue, 20 Oct 2026 18:41:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm2072834c88.13.2026.10.20.18.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:41:57 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:41:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: geert@linux-m68k.org, schmitzmic@gmail.com, linux-m68k@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] m68k: Fix atari mouse movement
Message-ID: <atgXH5V-q8fYe0u4@google.com>
References: <20260819222838.21256-2-schmitzmic@gmail.com>
 <20261021000338.2160223-1-miro.kropacek@gmail.com>
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
In-Reply-To: <20261021000338.2160223-1-miro.kropacek@gmail.com>

Hi Miro,

On Wed, Oct 21, 2026 at 10:03:37AM +1000, Miro Kropacek wrote:
> Kernels are built with -funsigned-char since version 6.2, resulting in
> the signed 8-bit position deltas reported by the IKBD being
> misinterpreted as unsigned.
> 
> Carry the sign in the type of the mouse interrupt hook. The scancode
> buffer is shared with the keyboard and joystick paths, where unsigned is
> correct, so it stays unsigned and is cast at the single call site that
> passes it to the mouse driver.

The hook receives the byte stream, so I would rather have it accept u8*
and then do signed cast for displacement values (and only them).

Thanks.

-- 
Dmitry
