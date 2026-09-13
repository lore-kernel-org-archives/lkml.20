Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED83AE1BC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789278406; cv=none; b=HRC2lKZymbm6QRyUW/ceewxa/mtATbDFON3VargTotkvO2XABfSe3xS5YCEx4z/Awfy20nRTQtoxKWyhwUKbSimEd3c5mfmXOCXsOd3+tUeYJZh9pEBs/g3LeDky0o1WDiHt6Eqh0d+/knLmYoRIOjHmdHmSO8K3po39Z+b5YFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789278406; c=relaxed/simple;
	bh=go6oz8+xCXd4w3muWW/18hv9nuLa13rdSkVXoFj2oUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B41J9aEuwMCAsxOQMLQQFbAglSJLJ7Chb5WOp8ECQdzORaX2sx0s6shG0ZHzXsfNbh2VRMvOfTboRkOX+BuHOPTZg/Dok6oecACYz/MT3Vg2Xaqx+EK6W8DkJpBwPBWU/zil2MnkxbHNz3OiROF7xOxMaD3hCH+cq+MjxyAqZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asTRFj6d; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asTRFj6d"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86309e1a213so953395b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789278401; x=1789883201; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaHndl2K0pFULmTR4xlAbGHwp91x25cpvpgq3imyoWI=;
        b=asTRFj6dUc6F8B8mUOx7OACjuszcaPYx7VvKy8TaY0H7sWrV7aoWOyMJyExukvwVDr
         NiATn3aEew5BrbbyASHdG3YjKY1SHDcKq13/gwAm90+5hMV2FrKblSwglQWm+yAsFIBv
         dbLqTdCUStpmCLiBAKO71TG6DlM+A9DoGPXpw+D+ljxDvfGVlcapV12ZmVQKyWL5lZ1Y
         izdi8/PNeT/j9799HlfwVFi3nFAegly78JnJyanLAI4VRqQROtN9IwNnWnCMKaSt16Te
         j+3KC/ef0aSCt0nBXblZv/7kMmA+jtOON+wQJqm2rriZPFD5Jx8qbBeBJgpjxt7zw+kZ
         H97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789278401; x=1789883201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VaHndl2K0pFULmTR4xlAbGHwp91x25cpvpgq3imyoWI=;
        b=jFkCdRwQwDwF2thwQivf5aRvoEXCPcqY099iTwgBOSSPz/X9aCG00QttFQPBg3vHSB
         B1RlHwREEM2l2LgUtiKAj6CVje39okvonkqt+Yj5w25hmbw8LJnr+mmbnckwU+NxK3uS
         NK0H1RbhA/fkr1PMM2N2zx6cFDQTbRvTlG3ilGOS9gmlNtih3cBvTfHKDTrkGI+aO0jR
         ioO5kFV6VVt3RrXxphRmaYuwKSoMJGnXpc3tddUtQ++zinU6MbYHdSkgp65hlDvEuohR
         ztMBe7/8paizvBtFD1voOEU1lcFzVaJaOjYHiTIuRsE4kG8gwMf1ZqHfA2YlQiHwxRY5
         9wgg==
X-Forwarded-Encrypted: i=1; AKwUvBz0xb/DoLyPlxegAHCYiR2nAYdNoXtQE2rVUqFfJyuvuMACdY/+mWho4vBrC2Pg6DenA4cWSYxsFV8g8v8=@vger.kernel.org
X-Gm-Message-State: AFuF++kXuDY1wrXc9wCSk3f5TFVSy4u/iMrxdpC3xQKQD37J8nzkQdXu
	UoZD/wUW92d/8X5BjL10fAdg/bvUh6GA35iFFrj3C8d6F5ZTZPMYP5g4
X-Gm-Gg: AYBFou2DTQM/aKZ6H0DYDSx6dV5LmdjXwb5eDaVUWgBj6nVv6ldNGYubYnDDTS9Koks
	mNFtmEHNPlgY13kNpEYU8vBE5+4EUowjJ6vOnZvCC85ftrkKeP0IDRlyDVQy2kmZaIlnikJyXDq
	ZlNZX4y6/CbfC3DS/TSnepCzucKItmiBtR1jdUvgyJFsBgNrBh368LiJcFDtZCD/BaDytO5NvGV
	TbZxbY1XG6ClCjSZMpo4FAUJUbDQyqH8OjfDiPVxv54ePCYQqTFffiYZ8zIRMHqcCHke/XtshTf
	6HkG8dVXbDSVSi/1mIs5gRk8NK4lEoS3yzsysrZ6XbmC6trVOaAuj2D2mexarogZ4k74XqeWPbm
	vKF/0w3VgxiQhqG1bnCbDqNcjckyYGWRvqBuoApU1D2dXTc8CISB7ZRkURdkOTyRXVULwafnTUf
	QRPMn6W3CnNOpa0GEmrc2pKtgSfiPKyttBKwHzRQ4oVkHeK6h2kRrYTFiKZii7pthzrAngipjrX
	n65xzTmqtYdwKNoAgHhUf/V4VHTrnnd+GnvDLzm
X-Received: by 2002:a05:6a21:3a83:b0:3cd:7ba2:e669 with SMTP id adf61e73a8af0-3daed4bba12mr23004520637.10.1789278401414;
        Sat, 12 Sep 2026 22:46:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:318c:d45a:8797:2b03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e4fb3esm17772221eec.7.2026.09.12.22.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 22:46:40 -0700 (PDT)
Date: Sat, 12 Sep 2026 22:46:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>
Cc: Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: convert sis_i2c to DT
 schema
Message-ID: <aqY4tgXZzfiHczw6@google.com>
References: <20260821131039.37525-1-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260821131039.37525-1-stefanghetu9@gmail.com>

On Fri, Aug 21, 2026 at 04:10:39PM +0300, Ștefan Ghețu wrote:
> Convert the SiS 9200 family I2C touchscreen binding from free-form
> text to DT schema format.
> 
> While at it, fix the example which referenced a non-existent
> "irq-gpios" property; the driver looks up "attn" via
> devm_gpiod_get_optional(), so the correct property is "attn-gpios".
> 
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>

Applied, thank you.

-- 
Dmitry
