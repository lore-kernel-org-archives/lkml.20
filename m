Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23044F85BC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894465; cv=none; b=V1RdRqRudz19PIC+YR6mhEiuCamlmB32XEzHX49aW1xchK2MhY6+uJjEcYmL5rlgHx4BVch4PqPn6CF+UgPhXb3gJDvaUEcRmslLLDGwef2iQZYt9LHYdD7c/2MoyfSOGuU04jPYsJg52Xtv4JXfXQWYAZsnrhnUTF9nfBxGr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894465; c=relaxed/simple;
	bh=zQ5+4ylMkV7zI54Lss3PN1OlS39taIPE6dxZocdAmZs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJz4mvrje2JRXY/FsRIDcgWuvOWrBlqHE/A1UGeQnOwOJR2Mjo8fhErazrBmug1CjFzxcelylEbQyTFk7J/sUK49+MCxUXOzOOkbA+RJUPNVgl3ZR/FcWOrBz3qdPL94NLw+lzhqNq5vJCRmq45e4PufP4/37NP7eEtwqIhlXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcp7xIp1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcp7xIp1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e62319cfaso285710566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791894462; x=1792499262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMfuPHIBKRtt7D2U1S+lSZH4kD0V5/KNbgrrq+UgAl0=;
        b=gcp7xIp1tI1sMQewdEAeo2hHL7l+MJMRTws0nzpYHelV4ZN3hAphmjDWeRPmtIKKlv
         n7s3Hl8TDkVQcCiK5bVaIJUHbAFNioG0jrIlc5IYzhoVHu3qYZqmVzV7Qq1RQpRam9BA
         mg1zTvmr/xcOASUWx2xhz682VNdBidEa+HMVGnjIKOL+Zy0TxWibH4L//oZNynQ7GUER
         oRS57xADN7aN6iar/HND2oR7h7DH4iF2w7sqtkveV0IOPfdmcVOtrDm+GSqHCmM3LmkB
         kyunxhsT6bQEXP8zd3TpjC+2FEHXb8MGgAlRYPeV0Kf53d/ZXamtQQJq0XWnGm1xqqlX
         oqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894462; x=1792499262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMfuPHIBKRtt7D2U1S+lSZH4kD0V5/KNbgrrq+UgAl0=;
        b=pmBfwTyGNukBmuW3XPoIjx0x2yWVqREj3ahltgwURIAtxaq4zbH6ntlZ/EuyS0N2DH
         4pNTO6/hj18VWGR6zkgh4GUswwA11lMt/1L9QKvPazfzywjepwo16op1BfCf/fYEAtMx
         kjfHxueGmeOBR+l4Ipo4/2nVDTaJQNIoZ3CE1Siw4XrJikuGsy+W2cT4UVCu6U/Q7s/r
         0q+kdIKIG9HN0/4pvJE7l9Nvtv/+6DkLMq0OXo5Pn00H0auWE58rHAT34oWJbelGl4if
         w2bmF/FohKmHLrxg3+3pqZDicJmbgbwCjJeGvgaYLLFqgsu0SCXx6bNReJMZVuA5+G9E
         DVMw==
X-Forwarded-Encrypted: i=1; AKwUvBzY6jGX+Zul8f7XoulEKe4AV++pG5HYs/7PmxMnOF4GQkX2X0LmaoL5mIE6gWz7vCl8gg4tKwoRAPBf1co=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbO6fuandESMufdf0OGaZl8AM2PotYYOIfzFziVToLf1KenBa5
	bINLm0NjT3M1iTaCDEjKd8yUNSfLuNwx/VuGQsksTuADbAZWTsCzfJ2o
X-Gm-Gg: AYBFou15n5YPoLftPfPssvcoYzko68YWSF5/iqd5bo03N5Z4Hw/FiCMsDPN6luaw1Cv
	zFk2P1xAWbjU4StG72B6tlMl8QSaT9ByjHKDEjGlNimY0ETsdiZloYJeWWZ2Lfy52vv6ySOi2xO
	pXkKp3bps/O3g7e+9xDgb13ojIKqWVBrsiJFcarmLpzTdoqrYLTjGa+VRV/HyhBMYw6cwFX9iko
	cLh0InVuWHfhv3Ik/IbmOIUhHmGyCEBZIYORz9WYAQDQLBYugTDkwepkAAK3usutdDuLLT3eUl/
	IvWm7CDNhl+MWBktQPbHlDttx2rPWEJrYaW8ObyTS9iPcR1hB8dLpuizKrg5iRwGEIFWgcdTB3D
	GzBK4rNdKRh8ENSVvKnuMr/vAOkvLAsAKBLogn4ubMaZseUazhL7yPy0DV7JTZ4mbqFcK0h1jbG
	NIYbI7KHaU1OC35GL668J0Z2ljw0Q6axSAq9GI5L3AgU/8TmbRS1ZIutTjLpv5HSkBktT7qFPHZ
	al379nC/g==
X-Received: by 2002:a17:907:3d89:b0:c2a:fd39:f23b with SMTP id a640c23a62f3a-c31aa00e119mr1216678266b.24.1791894461702;
        Tue, 13 Oct 2026 05:27:41 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31d8510ce1sm518041066b.19.2026.10.13.05.27.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 13 Oct 2026 05:27:41 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:27:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: Ulf Hansson <ulfh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu
 <ricky_wu@realtek.com>, Lee Jones <lee@kernel.org>, Roger Tseng
 <rogerable@realtek.com>, Dan Carpenter <error27@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] misc: rtsx_usb: avoid USB I/O in runtime
 autosuspend
Message-ID: <20261013142737.7b10a5b0.michal.pecio@gmail.com>
In-Reply-To: <CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
References: <cover.1783352430.git.sean@starlabs.systems>
	<7acac70a471452a6ccf23b7ccc557f3c3861e0ad.1783352430.git.sean@starlabs.systems>
	<20261005103011.03175826.michal.pecio@gmail.com>
	<CABtds-3t+ECCPeFShq__iNa9niRAge=WOED4cHtNZAFVw6kPzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 22:34:14 +0100, Sean Rhodes wrote:
> > How is the driver supposed to detect card insertion after the last
> > poll but before the reader goes to suspend and can issue remote
> > wakeup?
> 
> The reader uses remote wake; what hardware are you testing on?

I have a card reader with RTS5178 and a simple SD slot, no tray.

Remote wake doesn't work when the reader is not suspended, so before
suspending we used to check one last time that no new card has been
inserted. This made sense.

Any delay between the last time the reader is polled (by anyone, for
any reason) and actually placed in suspend is a time when a new card
can be inserted and completely undetected, forever.

Regards,
Michal
