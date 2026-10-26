Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033131;
	b=jHcXyJogkMgM0/kaU2CilUr5uJUJwsmDKz6KJ1gST7kwATT/KtMRgMKbI0n69enDXA6D
	 WdbCtK78TLlmDifInKS31wpc2Au9YStfE7Ra0vl/JR2PIvafccPC78vH3qT1tleFsQMMQ
	 Ic9J0Q/yR+h7gl26Qw6WP/94zO4kN4Wpm/ZCqXFMp8FVHfvvN+eq2dGaqfeQTaih+ydxw
	 sNtwDPSVwHHIY5vQrfpE1vT6e1Xfvz9eFMQ6mBNlzxuojUpDw8hrbzU9fG+DBW8LnFgpc
	 +3Khj77E3Wtc0Orc2VBMiLd/0wuUL6aSlKw5lTaflFRut4se4Rxp1qqMwzXRJm0lOeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
	b=ksUsKcMC7NsqL7PnVyhOwdbIs1cokjZpRoBRzkRe+OHW5PPuPmaVy9JS4GuKoCLuMWZZ
	 5uIbQDPPvZyrUhdGHSmxRS/KEL97DOx2w83QsvUzeJ+narxcz7ZEs5rTfNvxwGqczqzk3
	 xTbsF0Ff/mIKo4Vr0+EPx71efkAWA3RN/HnY2znYdFI4wOl3fuit3fkVcu/EGf3b/fGg4
	 w5HNQic4BLVVby1SOfcCR/w5nCijFBzIk/9iXXqJsef2+hwd+snvO45y6/sPQGn/iqQ5J
	 od7zOt5oB3Q4vviiGlkRDXJ+VbcaBBuiKlY8EqGf9flltstvOgiaPCiBpVgu+78H+mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a1FNF3ek;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2E606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC2E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a1FNF3ek
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso4973324a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793033129; x=1793637929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
        b=a1FNF3ekg6HdqRi0KYX2mUwmdgwGj1M9QwJhgyu0MG2Kkw9rLj4PiQ7qnWNDrmlux0
         OvJT/1AT0+UWiiX6iZ0WW36Xo+/+WVKDGAEgqai8Foq1/1Ib9CMZRi5cMlhqWxLUfETG
         V30Sm6X2gavfVMXyog5Fos9URtttVeLf+ADPQFtjJP2CWBd0guEq9pZmPXNpbAv3w99i
         iXLRKFQ4pijRdu4JOd0sohte3vf2GgpSbQ3036xtodHzqfYBK0z3i1rmYdqeEoJ/PU1j
         Bu3R5nUfDu9a+biUwpsGqCxQBRrYTT3iVaGrS/5UClcjmtfwV0UEuvDqZfwYOVD5oBXI
         JVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033129; x=1793637929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSfwRAOyFGTwTZB2XgAXVYKS7LWy0ZRk9pXzKQmllSI=;
        b=iIANm7IBDYSVvj4c5fu7NuAhXVzmwN8WaH7VLj1gWBXJiFnBD8TwPmq/HB5pHfyiIT
         fItzXAWCkET8uBnIbsMecY0Nst7WGCaXB2mysbVTvnXiQKOQG9PzrG32w01QCz/NHaWM
         zKmxif7WmCPeTWNHcP3H4NAoz+wjTa4HIIao+6/fMn/CP5Bh97xrmsiE4J+OdNg85kCO
         FHXqrFuj7G/Et9cTv/gJbJ2bo+4EAOxkFlTjCO78yVUti8cjCX9AY9WuAioFodIbEKvp
         kyWS9nQwgIl77HWSSHtpad+12ey73BA2CXlX6ohkuweGjkoTTh5P877nP20voSqMIchz
         6bxA==
X-Forwarded-Encrypted: i=1; AKwUvBynUQNylLNETjwRNigCy7eEFDn31615vbqRxaQbXMG7IaW1Z88aWnoFZBbJ0NB+7Kay69Ptc2Qbg9nBh1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcTcL8DDFKMifQJJBtns5G3rQDYeg4dO06Dhps/GFVl+7Bw0jJ
	vK2OsV8BRbkX8ACzXPJHYYB3OEE4s0rQapn864QuaIF4dKTKc4OAcJtK
X-Gm-Gg: AYBFou0tU4AHzPyF61Aj6m4jgP+2VC/cJlCwJN+6bqHmIQgs1YcuGsGDyojQ1TNNBgN
	ebnaU0gwr51j+Kc8k3BdNazcI1Tej78w/tq5Wy+FtQ3CV1mbl8x6s0kTdrakXQxi7+0ymlhsgIU
	J4F3bMeu93ZKk3NyjVXBbp5FX2fF6xtvyueLynhIVeYTD7sIZoswXtP1+Rl7+m+xTaFIMxADOil
	6+Ji/5sa4hX/HYqCcI5gywH/+YQbnHndYnk8/E+qzHIrJymlyLSRy+BZbsfpWAPj+bCcopwAd/f
	RFrLgKjPvRRnfsNRDQCPawNildsD9zEQc0zWbd0BYXwueIQ1QCb3KS5O04/EtINzaYmhuQw3Ka8
	CXiunUMpqRS5/Hi9swMINL/CgK04kkWUaLD59WeMRY0Ph0KGkGRDTVYbO0Va4pYn9qzsRxnnh05
	IKVHObidaafFFkMnvCjuiuXdV+OKqjRAHI3klzVDalp6o7ib8GRTH85oGPt/PzSsKUrR0sxqJb8
	O+ydJ1my4qyLDaFxXlcGB1SBHezOB/wbODEwv7DQ06pbb1ZXi5U0UDVdoloY/2F9F3q/Q==
X-Received: by 2002:a05:6402:51d2:b0:6b1:da03:d010 with SMTP id 4fb4d7f45d1cf-6b442fff12emr8703602a12.23.1793033128875;
        Mon, 26 Oct 2026 09:45:28 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595d7c8sm3876411a12.8.2026.10.26.09.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:45:27 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Yu Zhang <yuz08559@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>,
	Neill Kapron <nkapron@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ecm: serialize notification state with a spinlock
Date: Mon, 26 Oct 2026 13:44:51 -0300
Message-ID: <20261026164451.548670-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026060031.60582-1-yuz08559@gmail.com>
References: <20261026060031.60582-1-yuz08559@gmail.com>
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

The locking itself looks right -- matches what f_ncm already does,
and dropping the lock around usb_ep_queue() avoids the re-entrant
completion deadlock.

Note this conflicts with [1] which removes the ecm_notify() call
from ecm_set_alt(). If [1] lands first, drop the lock/unlock pair
around that call from this patch.

[1] https://lore.kernel.org/linux-usb/20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com/

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
