Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618387;
	b=2MbPPPBhtiY8hJeGzcq5Do8T9f3IKytiV6aXuo92qi3itgnCSqyBv7WAMNLg7BfRMVaA
	 UUEKeed35AuVhwa6bywi73/Wu98g2xvMB+uHt3PqOD6lSyIDqX9+IelPtleHvxq7bHaZz
	 QyrcJajfIaQSlrCS33zJfoRodu74XaUFqUsF4UeJyzEFez2RM3fYk1t8ZBykr9XZxtArm
	 Iht8V/wt4MECbbgqRHpsi4Kd+u94frTe8PWb1PQokfycupNoEwRk8k4IQCW2R5kf2fQOr
	 P/hj4JDa2YjSETs5JXIVl4+GxHsfuO1MuzglTOSe6t/jksQBTES9hr22/pa6e/24+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
	b=5g9iRI8XOwqLWxdNVrW/C0Lf4NTUw50QgeiFL99I6YYYhj6+z9OUl/PHyxCnsTNoi9HC
	 RiyE0oPWycxLbrxY/boyChPVptZQOtp6ai+igKXsG1YA7OsCqA2C2IgtEhfRqdotBoA6d
	 9rZkML6xYn9WhlzJfEeRXt42Am630HGVCMIs/IUmsS02UeeSkZoEqMUM+mqh0kqSEnNmI
	 s9JayGy5WwK3LzqmH0Cr287HZpYCw6bXXGvv0Oo8+p9B65v7Dcdx4ViJtKTz7kU4ySXuQ
	 n/OpTWv0XYk2bASuyo0MnkPpbCLuD4pzRiSX+/aBsuE1nUuttOCBHukS1LGipzHxTKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsntEoPx;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68734606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68734606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SsntEoPx
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so333261c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618386; x=1793223186; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
        b=SsntEoPxNYjf59X7OOg/LdIMa8dn6XV3gAPoqbAmwMfpoB75Xd/teNGbBc7/pZzBeq
         Un+x6HCULBezBckOVhQ7iqYX86Q0Csw2zo0KnodTe93mReqvdNe4iWwzlVt2SXZuHDl0
         e8wtjwjh+lzY98rroows9JxtQ1Pc1hh+myBfYo+iUxFTyGKzPSqiTtlwSmDBV2cQAUNo
         5WDgIrs58BennY9eVCaVYc6jMujI5u7pUKdTSIoSwinvN/VxnT6NgWoV/Te/DUxMDEot
         QnXVQVe/MOn9UJDgmNSDaJBAtEPZUK5xfk3ig10ZSme41lcOb5Nyng1gx0pG0G/AEBGs
         p48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618386; x=1793223186;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCwQNMxH+F/zPUwqh6Mzh/IhhNr8THI51anSCThLEEg=;
        b=uyFMNehZed+DWe96NHxls1IEmqqagPPb8SA0CAzBt2DsA2P/2Fi0I8+HS5Uvz8pUBL
         ORf7c4hW/MHuyCmbdPW2w8wLPDqPH7JHjlD/yqgmTx3l3Gl8GAVjIAeNUgEVW1T1afgv
         mVMYBDVh2PvElKfT0Tj2xLIv4/cYlU1sU3rqcfpSlsZJG0YLjnv7xUV5t5qJfG5USwc2
         TFB7Pn+DDfGCy5R4V+XajJkhGpWPdVW4Cn/ir/Jodny0py//lc8Gkk90MPvH6Yl9slGY
         yZoPx1Gr3IgoE/+xvN7rnCwVUge21v0FRhnC0t7XNIgMg4sGkJFRnipf/Un4ahMOHq4G
         nmkg==
X-Forwarded-Encrypted: i=1; AKwUvByS/XA4asV9Ms4eMbITF24L17KCmHdcR3hJTHsHuzM19eJKpyb61zruqItQn8FBhtnRbo8/ds/qjLgT32Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuze8YMIDOGXuGsxVV+kK+etDFZfHAzIgnMuv3K4AAZvgusDAr
	9gpRWA8wKjZQ+XNul03SKmQX58J0+/v4DyL6XO/dj2DTPHQSYwct7HSr
X-Gm-Gg: AYBFou2lAC09r/Sn6158B2mMJG77CEYe1G95rW2h5ZgeA519C/oYekscFptxZ3M53A7
	dNjBJ7a31qNPceWrh9+X5wBrvg+gVYM0mwGZx5GA1r4u8u69cx5e/cz4POPZ36OeeFsc8dZZiM7
	2/OztVkWin2QtN8/Ao99OGlphligYvEmO3JLrQZUJHGZctrt3Qs+nmHlo824lLYxd/x/ZEWKyBl
	R6FjtEmnAjn9enFvTfichZHZ46ad9IjXzXtuMMtGz2zvMkr1iVLZFYPMzE9e/pzjVtd0t4zOhDL
	vFCzPlBN7duI6I+H29jppFtPWqgcK+jTdrH8eV4V3ygY4IJAewfo4bi7JcgY6usbrrxqeuqhdjM
	cpAtmn+4yWKTjwxCi8cOrmLu3luNhRs9mEJdsrAfWr5TO6syBNWujmd3h423+6X4xCIb1uwI8Oc
	ubG51z+ioJ0dRf7MZMoH3iqMmLu9F4922JvkVIPinIEZ6yGPJf8ibaQUgar0PwfasEFT5IL39L+
	+4sWmBmaQcQEeHjm9Z4Xlyd+5vDv/uyTbjj8FN1Kuy6oi5I7YrlAuCCPs3fYhdkKtH1pt+frbcf
	1cUPhFEl1cjiow==
X-Received: by 2002:a05:7022:1709:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-190a051ddf3mr3686389c88.3.1792618386343;
        Wed, 21 Oct 2026 14:33:06 -0700 (PDT)
Received: from localhost (host-190-210-193-254.iplanisp.com.ar. [190.210.193.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm9368959c88.11.2026.10.21.14.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:33:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 18:33:01 -0300
Message-Id: <DMAU6JSPOTMP.2LNR04HDVF43T@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 00/10] iio: adc: Add TI ADS126X ADC family support
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261018023129.3abeb679@jic23-hlaptop>
 <20261021195611.14cd0a2a@jic23-hlaptop>
In-Reply-To: <20261021195611.14cd0a2a@jic23-hlaptop>

On Wed Oct 21, 2026 at 3:56 PM -03, Jonathan Cameron wrote:
> On Sun, 18 Oct 2026 02:31:29 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
>> On Sat, 10 Oct 2026 03:52:39 -0300
>> Kurt Borja <kuurtb@gmail.com> wrote:
>>=20
>> > Hi all,
>> >=20
>> > I apologize for the long delays between versions. This month has been
>> > very busy at university plus some personal stuff. I expect to have mor=
e
>> > time now, so development should be faster. Thanks for your patience!
>> >=20
>> > Signed-off-by: Kurt Borja <kuurtb@gmail.com> =20
>>=20
>> I took another look through and it looks good.  However, give
>> the sheer scale of the driver I'll leave it a little longer before
>> applying in case anyone else plans to give it another look.
>> As normal, if anyone has it on their list but is snowed under
>> just reply to the thread and I'll let it sit longer.
>>=20
> Long enough I think.  Though given I'll be rebasing on rc1 any feedback
> people want to give is fine after this.

Thanks a lot, Jonathan, David and everyone that contributed :) I'll
submit the follow up series starting next month.

>
> Applied to the testing branch of iio.git.
>
> Thanks,
>
> Jonathan

--=20
Thanks,
 ~ Kurt
