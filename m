Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346286;
	b=Z57zELxO0xk2QNMXBJIAiwJdX0UeoqrORXK5T0Q/FtQ8PM2bDOAhy27WNQ04fxOSPIsy
	 I8gCca6j7TJCr2cMeaII4km3awMerayHpm+QwxQQ6sfx1hVMWldfnTp8AGZ3We8OyboLU
	 yD2pw6m0/lro9c0j7ZWN51EOblth2sNfOAJpVH1QrJ6GJpmnZXf9ejbvQonzUS3B/NTD8
	 XPSs3NbWad/qBFhtbcWu1ruw6wkjk48pT8kDGB0xb3s2Z9xmIsdC1mbnRouEStaovMp7s
	 0DILESfnEZC0J01fSMn3t8qWc6AIUod3LZMEvbaNnwTBoLfaoug/4OuUjTNJQ1MtRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
	b=hhpFShNfvJKrCy2mS4lKtX6QA67HEK1spkBeSrBvW0o9olbR9GGLz3dass3msWvIqilf
	 Q0nN+2AJjJNgiczv+wClZLIkCm1pbSm48qSYhJWI03KIATiv7GWmLnB+dQGv2xT249Ze9
	 28Iyde54ZoqcJMFh7HxlbGwsTxaoLi9HS7ilxSccQs40VYl1YceRGkg6UU2Kdrgo7RNZl
	 fwvvh2J1uXIas05kf5HZkVuzv++rCTTEs+/ZCu94PIzhXMEJH6TUyf5gqZptc9KlUvb/N
	 chdrLuAcA2d8yivfCTYVHJIDSd5aZ2IEr/aiE+bKC5XxVfBEeaIytuE3l6rYmf6yl1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hesling.com;
	spf=pass smtp.mailfrom=hesling.com;
	dkim=pass header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=jUq9BMXa;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE34B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hesling.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hesling.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hesling.com header.i=@hesling.com header.a=rsa-sha256 header.s=google header.b=jUq9BMXa
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so847981eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hesling.com; s=google; t=1793346285; x=1793951085; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
        b=jUq9BMXaPY85KAuillXqP3Ky2xsgEqkWBAK8BB0yqrWVhs1jH73EBI0oIcquyj2At3
         r64+0a6cyMyieeoQtWm0c0nNJ0hm8jHVn+8HYiE+gWO88amcIAqF3tASBN8XuVcAoFk6
         xAWbnSIQsHER9/fZDOjlHquMWEyBg9ozCe2ANvHwM+nbdqPDMtKIa4TRZV3V46GO4BKL
         sCgzjzBDTJQhFI0vuXp0yoenEB5QWU90GQWYzX08xP2vf7n0sPsiGFPMk7LktMGDvmsl
         +etG5jkBo4dYd9hT+oqfOJ89VMJMrR8HkvQXWmlrv7XDJhyy9DFXKPk/VWhb0OJJKyzc
         3Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346285; x=1793951085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZaSJ/DrR2W/omOznYqAJsfL915OOMlybi4GRGT1d6Y=;
        b=PXYdu7tGIZxZTIY6gpC3QapS8CcmMvmwJDaPMsJRlfk0OqS7Xij0u/MvlXyRDKa2BI
         yRdvNDbTXwTpOFv77tqSTVFcGgSvf7BPSUp+pM2JQg1CJP4wuYLu3P3seimkhLvcnK+4
         EdvXgsq7Kn///1+FBzcI7mY0NPDzUstaJQn8Ot+9Xf/EZ4j5cv28YZESY3AY6Wkil58+
         DDtqzbOT0JPtENpULipEwpZFKz5GP7l6Smp6j4Sd75nhZZatg5GJYOlE26mn72tSkVlz
         eNeeoE2pTLZtu5yNHlP5ErKiNuV3DRVyIqzyUFpYTP52tR8U1MhltAYsk4bH4xGbbwlf
         IP+A==
X-Forwarded-Encrypted: i=1; AKwUvBz3Zz74eYYoKYV4f0zxncn5jqtnkgT5ToCZ4GBnb8d3UlF8WAUnwsvPg0GHtTn6ScvZWYzVryYW1oF50II=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRCHgT5/8st6X2ZPe2naqD7UjUiejlaDjXQFzu5w2wP0TwksdT
	6wF20Jt6hUWM10VGxdE0HnpPIEGXbxRhNXKasmD9pnmmsmLct0EfsaOsFALgzeYGjMQ=
X-Gm-Gg: AYBFou11kOtbrmd3P4YcAMP9EOOhQijZFF448v6KwO5YTJSamw+gObELEN+hvN6K0h1
	/JsQzJvzIEZnPVgWAw7GtJAqsWMuS/7EfDG0C8/TvUSgSDMD9RUM84wP3lUWBVlHJ7CE+peA210
	XyRLznnv9ZM6U+WsQb5y27YsPX27xYYW0362DHLVXSfzGwYPZlU7xn2GN9l71s6cuP4qQN9dd9o
	Zwn8awG8mURvXR1wUzFkOnHonKUonHGI0rZepY2a8Em8k0zW0vkht8WgiIaxb2ZfSqUrOhoGZTh
	vdjbu/IhDgGgL618yNuCiF8PL9xyAAgIPxVweEX5AW06Cy+s4aGq2r3m3LQnJ0qP9tZlr7NKPGy
	GTyCaTymvSg+xIYTQxcqqcQwFdIM67nNuNGw8JNHBH9oPT+B+Xyex14nNmRRiTZTnJ9SCWiQONi
	AY8HMQvj/WkMYJ8mGVBZWLKXyncbxl3zUBJu0IckrSCQQOiZM1iYRXAyRksEsL4cMglW+tiYIMB
	GgWbQ4B8pRPAG/cz0G7o1icLkJjV4n50+0X5iy5/3qwc+WDrOIsm9/V6e5VwdOABPewmSrfjW6V
	9NkccrrK6Vw6vmNy9xxKGPVGzug6I85HcQXSChTzMHKd9SeZq02P2Xota18E60wGMDRKhxU9/lp
	7XCPcfa/O+TpGzhVDHA==
X-Received: by 2002:a05:7022:2522:b0:185:b157:f271 with SMTP id a92af1059eb24-1ac5d2c58cfmr2971559c88.23.1793346284608;
        Fri, 30 Oct 2026 00:44:44 -0700 (PDT)
Received: from ?IPv6:2001:5a8:693:ec00:90a8:f6fd:3390:41e0? ([2001:5a8:693:ec00:90a8:f6fd:3390:41e0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7473973c88.10.2026.10.30.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:44:44 -0700 (PDT)
Message-ID: <9970fa09ce5e1b468e473bc1e4bbe7d7802808e8.camel@hesling.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
From: "craig@hesling.com" <craig@hesling.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, leStoppe <lestoppe@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 30 Oct 2026 00:44:43 -0700
In-Reply-To: <20261030012805.4087311-1-huangwei@kylinos.cn>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
	 <fa1ec0429fe8c1287c126b50989f1cffe2567a86.camel@hesling.com>
	 <20261030012805.4087311-1-huangwei@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Huang Wei,

Thank you for the explanation. That is completely fair.

For my HDS272S hardware rev, the oldest fw I could get my hands on is
V5.6.2. I confirmed that V5.6.2 and the latest fw v5.7.1 both share
identical USB descriptors, including the interface subclass and
protocol.

idVendor           0x5345
idProduct          0x1234
bInterfaceClass    5
bInterfaceSubClass 0
bInterfaceProtocol 0

Updated:
https://usb-ids.gowdy.us/read/UD/5345/1234

I don't think this is a blocker, but I am also surveying other
projects/devices possibly using owon serial, which include an SDS1102,
HDS25S, Hanmatek HO52S, HDS242, and HDS2202S.
https://github.com/lucky62/OWON_SDS1102_Linux_Capture/issues/1
https://github.com/mjkloeckner/TB066/issues/1
https://github.com/JohnDWilbourn/owon-hds200/issues/1
https://github.com/einsz/whoop_thrust_stand/issues/1
https://github.com/mkreutner/hds-mirror/issues/1
https://github.com/scottsun2020/owon-electronic-load-tests/issues/1

Thanks again,

Craig
