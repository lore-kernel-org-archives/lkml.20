Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419371;
	b=Q+VBr0oDTQUJjehh86RTAYegi3gcVlLsTD9yh3cYcP2JkejUUHxFFaIVBQBqQTjw05IK
	 5q9C8216ezrX00bS30VualFgWZ7Zpn+N3BTap+ovbo50SISbJFAiwlefJBasvFhUtVDj1
	 b+nA02CFtG690y908XxvlgUQxXI05LIzA94V8QXLFrWKfu13MGXVOiJyQ0gLu/myhveXG
	 8jbBrXoQ1sGQ6ab81Bm03DkbfH2U5MgSuRkTzqHRfdiyIyOCTIbxjgh3Qj+BEGL0tyyK4
	 ScqUa8N2j7e2h+wEpZ62CkWaC4nLwl3BsN7gYd1o7P3n/NRB84Pt7CJmWL0zEtcZ6ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
	b=OWefaECE6BLVxOF1367fCm6Hp/NDvOnifNmKisZ48d9pizKKXto97aZCmLClAvHxQTRH
	 XsrXXL3pXa8xug1KsIqMo/kuRoDW6AEjn8osABV6tW6ySXPcda+Lz0ozq0lWuu0GPzqJH
	 Eds4hohj4UAQnYOLS12DbxGn4WW2el+Xr2hKHPU7hyMF8iOYyfqFxHO1PllASNoESpolQ
	 Ph2Ri0I8juO6LURKF9hHhjZCfgrh7XWgU6Gb0bgolbBalm3mR9LZsmh7QtJSB1bz58s5g
	 vJS9LSi1J+/pUhk82bZj+9RJpOkJR5J+qEh2Dhe29L5+lbI35axQGA08/ifhNJEWd3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmWdrLTA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACAE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmWdrLTA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6052478eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794419370; cv=none;
        d=google.com; s=arc-20260327;
        b=rxsKnEk7g9YuXY8v8zcHFMpYs7K5seYp1jXT7+FbnUvp9JA53RsTajmzKPp0ESI1tA
         OLLht/LXsj3PMHb99NAGHi3VQuekBB9tyApzF7yN+MJkFROgEg1IV6CgetBIyQ74SXJc
         k4MGAeTgeivREvm1BbcYU6b6vEbbuiFIOfZnrl9coA99kVaqI8dNbBCiehTX9itPT0zw
         GnQyPxhaK8Auzj73OtF8o8CUKOEUwg0bjhe/8ZkSGGcBianRIh3tqApShy+4mplc+rH5
         mCXEnf+zc9IldPpr/LOd14ydSwmTow5RyD023+epmt9whBAWnwhQQciiaKy+hPTV+VyN
         DVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        fh=iLc3eUB0fI383nnTbxqcYILMAEcaLTnTK0IAn7UhHC0=;
        b=VKU4eLQqgHASaqsBl8E0bGAJoL4BpqbFNeTCcnzJyQ9FyPqMOyOW0Cq8pyCKfHrIW7
         oOBlRpR/wx6RS54jIOQQFnmf+6gXeec6XIV7kt394I6XJpl4L9ElCQ8WFPR6tAULoKSx
         MxB+UM3U1zG5qc6+pFfG2VQBTnydvAnrTLnmPDFcLShqdUWHfnwWPa8QLk+i1kPx6Yx1
         9JEFDAFjx11oC43T9IIhspo0MVUrmC/D5mfWT0piYDMx+Ld0n7aoVO2NkGQCO6LN0RZw
         ipqAn9oUQWBA4iiZ0jlknFUsIRKQYumYcrH7pVIopz7U+HkWp2gEHFKGweH8+9U4hvzG
         B3TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419370; x=1795024170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        b=WmWdrLTAMz51OJvfqBlkxREe8w5ZZlX9pq5Mjk5ePhW52XUz38wj54Wyp/6Cr+DzGx
         JE+M3cZnUA7GzUAg9Mh11pxcBWfvK8CNRumwG+ZBobsrVgMVIhNFrioxpuuNf611MGW7
         M/9qJ5zDbvTzNUbDPk5V4iaDpMjLnici/uUiv5ZleuEg0UHmdhIDV2GKxkU8+12wPyr5
         E5xPiVS+YqxcGj9LWIPoOdIkVgnjzm4LBAupubZHdmjcSeDd6e4k4H00WJsHnKyUW8Qu
         7L6pqAG2oymoUQuCLLlGG4XYXywN7E4TsjOwfyhs0yMcG1W1y9TlGPeW6JUpjOVrSddl
         M79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419370; x=1795024170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P0LlEVmtKbYkhBHowVJUvrAVEwB7x6mCjbop+wAsjGs=;
        b=RRNTWglyIGzWJDvBeZ4zM9JUw9HiKgnDQCK486W6C9Rmnqj/R2GXVC88QYy/WkoBWh
         Hi6OF9nGVFIoachgwTMK5BzBoeRCJ3x5aXaA/T8+Ue6DtX2OzIT0d+vNVCmiN9P6L7wS
         90cCtm+ao7QocWIQMQetH3qExbi3aawauAyAeHnE3A8xseEYUawVIVd735w62uVRwFx6
         xmSkP377Sqz12ZBVXSN4pVTDqqlcNimT8pMQQityDP6K0PHBlK7iwmaVhA6y5ogE1u8m
         s/c9CO8As/rJ58pvpr86Qq8C8l3Erwd+SniqDl6XZ4izrS803ayyqJg+NpzGAZ+tEp4B
         u0gg==
X-Forwarded-Encrypted: i=1; AL+hErEIqdNHcDVkhIE+0P2m3giewOnoVd5tIjy0NxP7vNsDIn0bGB1/b286O5AFSIHbJfvdJQQa7Avyl8xZqdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NxiZ9O0BSye/dKq0Q3iwypumqNdb+hSuknchLFw53ZyVAwxby
	LsZN1kp7zfVGrbGhLbY136sjXi5xhZSEVIKv20UweovvNMVpX+ZmtPzAeUQhn+N00S3XqGi6GfM
	DKRuaBOdOFvKFL4zfuMoadzCRuYC8flc=
X-Gm-Gg: AYBFou2NZ8nYlPfKVMkntzmbDAy4Phz5yjbmgNpoj06Hz+l47m33KPzqUzJH/J9iAOn
	o4boDDg3BraleYpTRz6IqzTMNoTfO25o+Z7yTv+ZYk3Sly9GnatMZo67XlBl3OKCqL2+lamPUFh
	qxiXt1dUfdYEAqwDkS+YUQbcfsAyIeGGjCwTls5oowJc9bpL++pxqVfr2vdbyl0SH7GSWfvwvyn
	JbMK/Hv2HXenSb3gsXvB8GPlY6WDmn5YiJAJvQcBc8lF5aEGZT168znaAEyp78oGpe3jge8Wrqg
	qAQwHv8r0g3r4zh/95k1hM570ulFQEYW98u5ojQNfCf48pIRWErxz9YxldLOlA2d6lclUznqSmv
	Rl3LCk5x31uMA1ujhU2ebwYdVsfjrS7q/aqdl83HdZRb5ZJWqS05WX2i5VnYpkUp/b++KO5nkBW
	2Z/JAu4VXl6Xti3/1PDf7R6ufKwA==
X-Received: by 2002:a05:693c:65cf:b0:375:fb27:2c59 with SMTP id
 5a478bee46e88-376861744d2mr3628461eec.20.1794419369880; Wed, 11 Nov 2026
 09:49:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-smsc75xx-rx-fcs-v2-1-216a5f26842a@gmail.com> <e4a20579-2576-4c2e-9120-b675a175a1da@lunn.ch>
In-Reply-To: <e4a20579-2576-4c2e-9120-b675a175a1da@lunn.ch>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Wed, 11 Nov 2026 14:49:17 -0300
X-Gm-Features: AclHuK9J4PRZYynpn60Trwp0oScnHBsKAesx94T00Mrc6mS2wm4jqy4_tDb4sVM
Message-ID: <CAOCBhwE84F8ZTAVXwxKEpZz06q3KvD12FkeXp6Nn+MXoUYOWfg@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: smsc75xx: reject frames without a full
 header and FCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: steve.glendinning@shawell.net, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What is the value of FLAG_RX_ASSEMBLE in flags?

It is not set, smsc75xx_info has

        .flags = FLAG_ETHER | FLAG_SEND_ZLP | FLAG_LINK_INTR,

so usbnet counts rx_errors when smsc75xx_rx_fixup() returns 0.

> Should rx_length_errors also be incremented?

Yes, I will add that to the new check in v3.

Thanks for the review,
Joas
