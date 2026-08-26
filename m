Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A344779BB
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772608; cv=none; b=gHQNV9n60oh1NLG8hHhC/fFWrgm34ndZpI8Oeml3nylBfnFcBkb1NpWT3qAVWbnke/iu3T3EATmEeJ6mMYizGEEp+zHaRPduwoKtjLVv5QjvkU+44gDzKgxTPWaJf210MrogKP7Zp7f/YcuhrniaGtMXa5njFiQuh+WuhugndFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772608; c=relaxed/simple;
	bh=1dBSEPFbG3i1TEybvcJA+2NU0Tdz+t86sHKmRjb7naE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MNBtPeYAfy9ymY19fYkUCKyW8FiKNHCBduwqkx9s98czg7x+BR1IFvUap0oz9LIf3PkbR70ItX+XaxK/ydd7h2++O+APWixYuB+PtZ8R/OidaOXk2GK7BBJhlxfVbgVa94sNO99mxXpxQ8R4IgvveRnImh1Ex0oP6j9P1idpo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTTUbWKn; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTTUbWKn"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836ce5d6e85so21869327b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787772596; x=1788377396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dBSEPFbG3i1TEybvcJA+2NU0Tdz+t86sHKmRjb7naE=;
        b=WTTUbWKnif8MeCy7Dynx6X3LRBG0tL6yD/6rwAcy7pFVPFigrl3PLLkBAGrAu/tHm3
         hSGHZqOnzyVeaw6W/9AfnEld+BN5xTvImVor2a2/ehshmk+wrfBIz2fNKdray4wku4II
         tsCp2r9pUqZSwINpeqQGG3BPn0Za7/lYD2PXB3e/wY25E/836yG0MFaLB6/iEkV3rDS1
         Mo7IZNWlgDpOdhvXWo7GS9dfPlSOVeHxwPLpX347zMSZol1aTnDzZFx3XDxpRsezSCuN
         kdtAVB6sbV6u0386Wr9k4oF8IPb1977gEvbyvKlCbTymZvBFamelC4eLtiRA8aOiF2fT
         VcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787772596; x=1788377396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dBSEPFbG3i1TEybvcJA+2NU0Tdz+t86sHKmRjb7naE=;
        b=oo0LmudAW/BX6WcxAKUNJt+k10LIzOHq5mmz9OY/FhrWXkXPurRUIRSqKTuqoSS59g
         YKPjv7bMmAVWza9FjgRpB6Z8f4hjrdxUcKhx9kq6eg1kNXv1XgtGI5YWeMzI20zOPL0a
         tAATgA9jzN/XvstpyQKYQ3Bf2kcn8eYOKe9BSpfGHLTYAEhpcoeEDb8eg9w17mPjiRZ7
         quG/hI4P7OZLt+ndFCb3e8Aj8uCKjW52fkBLPkIzTNo5ZawY7MEVaP2xOdTxu2dz3EFU
         /qi37/KY7qdKEbw7Wn2Xxhkh538vBI3Y1PpiujTzptaFfv43/6tSmcda7WnLx+QK6whR
         VlMA==
X-Forwarded-Encrypted: i=1; AHgh+RroDbYhQWlTQ/GiMQHJ41wjWzAQQhGXBwpua4m0BDuknmu6FVa7O+ABZ1BTFM6mvJW43KGB8xrnYSx28J0=@vger.kernel.org
X-Gm-Message-State: AFuF++mwm4j9RwC4NKIZoH0D3NoKJqVNZ1IqxqLYhZqCuqBEF9lTIxYz
	WCu4nvq4N9Bp+5UDTEJYZoV+Ya+SZErK6yR95V+OhoE/QP5BxOHouYAe
X-Gm-Gg: AR+sD12XPXCbTeDtftF965LBFY30N1u1V0txwsyTD+fh3CO6NIgA7A1K6mxsPTl94sf
	pBytJ4SMzMACVPhF1IsCxygAendwreWxgcgsqIx/keyirWgVmfhJP0glj2WBLAcVSMEmHTCV1uI
	zbkfkLEFRsqVUDnXbw0BYcmdkVh5HCmGvXW6EEDmXzptrRsnpt6DcU1Qg6p0HKbQFFxlzJX72t8
	dnNIgd11qhlEJxlkXk/YkLykW+XQnddD3kQnZ2WIqdIwZJjUCWOTfDvm0iEar/0j7hzMn/WiIMz
	StWjQTVjXK5Y36sNZBPm4PhVbBtwFthZ0lwrR4fNO63Xwf++amA+tAx8IQFG/X/Y9mDNUk0IUrL
	lB6u0KMbJtfA2KgFfBTkYmHgiot/dN322PHo8NOoC2nvXkgnhle+tor1+0VEBiYuhUxszrO6zQ2
	0fE4NHLNhOvhgmzgxI2Epfey5o7q7jwB4SGkp3wGA/wy5ywuHNMg0p4krSxuMbvo8rMZs=
X-Received: by 2002:a05:690c:a5cd:b0:81e:d792:a019 with SMTP id 00721157ae682-8573b451362mr39369637b3.6.1787772596387;
        Wed, 26 Aug 2026 12:29:56 -0700 (PDT)
Received: from mac.lan ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85a7d6cbf12sm4423317b3.30.2026.08.26.12.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 12:29:55 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: steffen.klassert@secunet.com
Cc: AutonomousCodeSecurity@microsoft.com,
	blbllhy@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	kuba@kernel.org,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	tgopinath@linux.microsoft.com,
	xmei5@asu.edu
Subject: Re: [PATCH net] xfrm: hold net_device reference under RCU in bundle creation
Date: Wed, 26 Aug 2026 15:29:48 -0400
Message-ID: <20260826192949.32706-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aov1hEK0BjxGe4xg@secunet.com>
References: <aov1hEK0BjxGe4xg@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Aug 24, 2026 at 09:40:52AM +0200, Steffen Klassert wrote:
> Can't we move the rcu_read_unlock() to the end of the function and
> avoid the additional refcount?
>
> Same here.

Thanks for pointing out, will resend as v2 soon.

Cen
