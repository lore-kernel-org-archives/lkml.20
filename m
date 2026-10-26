Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025327;
	b=PIzyoI1lWxpBi8/DsOxuF9UZPumU3cJresecV/7ls88XvAy2YE5jqGKrBaCBXLIXfUuu
	 qdfJCbn/aJt+d4eXVifdNyrbquFiezy+VPmOXJwfKSZHQpIlOAV34k1lXXpXpE5fXDlhJ
	 EyoCvXZ30Piqrk7DotSPTl/4jchPn6nzeEjP4fFZFlpuXrkD86gB2TiWt2ZnONuyHh+xd
	 wa5b1CaTfHPHys6LmBLN6nj4YpAdRCfb+Gp4szC8a7grrAL4Z6sIZg6qTq2lgja7mPm6X
	 Ti2iR5M9TEYJoKNIv8xrbfEt4CqohbXG3Dl1OJRR4R0IMKGE4tXKo351IKXXqbxdnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
	b=gnKkENVuricqYR8eWY/rcazojJp5R8KqkM4wjXJeAhRhdcJUI+fSR1IiDPn27K0Dmjnc
	 vGEW7knV6QQBj83ORQG6DD1J//nzUTkarCjFludfXmmRiqI9w8j5HnuwYxvxZCWRLInGE
	 E5I4fvp1ebeJyrO884FFsJZTeD8ZXBUu3GVusqPOQasKkNi1MSUnu8FsAPxQKT93vvAr7
	 twbikSGV0oDDX1LyEDaxM3d/6Z10bS8JumZcchxGpArzyKMWW71+X5jQBw+0Y7UcqWZAx
	 CpZeGPovTz2Bo63vmtxtq14NQjxWarnHMXogxatfREJTYBc3vU+lMxuZ4pk3ajVDpAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xr29qaEW;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B00606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B00606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xr29qaEW
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e985106c0cso26170055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025327; x=1793630127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=Xr29qaEW9taLTBbnUhkAw6vv5m5lSMnIu5ELG5jiyxneo3tXFas5X7jNdaXsrNbMe0
         gSoyn8jzPH5unOZQLYVGoiHpgON9Cs/NgrQfPsoR+o20os9K3nskmJMeazUgamyQIeYx
         oA0ty4rUOZp2+HRBcM1UcbX71kfgg6L0JxQHe7QUesS+R0eCRMcFo6VqNEwI2eSwqJNe
         QEBdyRQgIBZbSO7JpMhW5I0tWjFv3qSRKYbsNkVf2ernB3DtRlKhDU+hZg1eObSo4tcA
         j3CCnWesfhY8TxIrlCFaY6eJhMzrzvlc49SOhxZ41yZqPQSAH9RP+Tryr0eb7eG3VQis
         e7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025327; x=1793630127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=N+QtuelgqR7ruF7Rip288CkI0xVoA8Vl8sjXo1Gxr7Cd5MG8uH2qXIRSsSjmqJUEkZ
         5DW7hLvkBZrmajn+AnkxiG7kRy06D/YKDNl16MrGb8+tEYZTnBWJGqC0c8u/MP/5QzNy
         Shj4/60wxDkcW+DlwJJzfcsmYg7YblWjsMz6aq4lb5mD6h1FFny2/uNcbCjKUml81mNL
         emRj+TKK3LBBxeP0XmTe1tC6/T/AlwdBiv58a9jm4r8QcXsvOSe9mIo3d7WezhFzL8Rb
         5l8TQon6dxB3YZ1QLH5r/ChHBHcmY8t71YUWFq5WOTP15enJJ+jNpgmuRbcdceXy45Qt
         EMaw==
X-Forwarded-Encrypted: i=1; AKwUvBzc+MF1ZH9oiQMtogzEQicv3zifi/tyCUOXxQR5TOr0nV0WUhU7p+PcApNre0cn8WzOsbbd+sOe4XSjYHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ69gt+48VkX7oetXNcBDemWVgJheVO1MtUkOwAPWVMB3oaddiA
	eECVoktCFtULk28qwOVIefPg/1r63Pgo5SIRNm1XIVbvBuCRlN8fLnBA
X-Gm-Gg: AYBFou3sbwwTEWpllv5z4KTl6b06NTA4fbuvnuGynny7zgK8g5JxMUgd1urJQv0aV+E
	JKJSHQntb8mqTwO3hFaes01k2lqhtr1dlOm/RuNrOelJ9qhqpjRGZWWZIwQgd7tpzQPlLpjXC93
	/LGzdeUQgFKyw+/+NXsPP5GiE+xpdYKA8ebac8S9q55pNxI3LgBusKlBH29YOLrNvzm2Tb3P1vC
	L9Pot16tl/jU3pdSUeWgR7W13LQ40SEab9T1BuIV7rQ3iilTx9VykyGttk0kfhZS2lUROrwsEoz
	0zD/3ESeX6IwpQEHgoabLKwfTr5K9Lw8DfK2RxkzkdPFsudwWQG3CYDrf4JX2sF01Prge8Plf4Q
	PLH7OHzyZuRlleSaWY+zpt5smvk529n5O+uIGbjfdC8VCKL0Of8RHklc9GWuimVHUjg6XQdLl0b
	ZAQRn5Y9FK3ThuaGCGliiPvbDuN5EqaTKBMmeGRcncrfdN9vjf4rG9y/NEyYtnKFPBrMg1Hu+Ho
	OKXXr11ivKCqhBBNoxzUL+ScGYFXXdrOUJU3+mdxRGuEpM1kw1CKhZLNLYIer9xXIGpRmo=
X-Received: by 2002:a17:90b:280c:b0:3ad:818f:3daf with SMTP id 98e67ed59e1d1-3adeac05c76mr5804256a91.14.1793025326567;
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm9259927a91.2.2026.10.26.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
References: <20261026003918.155321-1-pmazzini@gmail.com>
 <20261026003918.155321-6-pmazzini@gmail.com>
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
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>

On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> The separate hwmon cell enables VCOM at probe. Report the temperature
> from here, as the TPS65185 and FP9931 drivers do, and under the chip
> name as they do: read it while the rails are on and return -ENODATA
> otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> hwmon driver.

This is going the wrong way. The correct solution would be to convert
the hwmon driver to an auxiliary driver. I am not going to approve
this patch. I am not giving an official NACK (yet).

"Other drivers do the same wrong thing" is not an argument.

Guenter
