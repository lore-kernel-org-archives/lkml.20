Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793240568;
	b=hW/CVVA5+Tq6m1x98yrNmZa6FiKVzZqAw5MbKTR5sudYfF95ofdFz4QR5HCVQngVrg1f
	 b1Zn07DFz5XhHDiGkYADT5RgrkEgVetQqA2HfjoPT3usz7ylEEDsuGjEw3eCrsSnjFmGt
	 VJr0l8c9Qi4BF3bqm3iQQRVH3npL7MegypM2xVVKg8BzECGBxgggi5drBXmTP71Kk5L6o
	 Ah0LfnbXDVIHOq5pJ5fnS2pRaw5AzeucnFbuduhHLye72322XE6/xazDNWWjhNg98bBo8
	 MEia4uY3btDg8t/RMj6jyDkoBmPXDDzeWJNTblS7Uo8ZzRE87vYwpYkJ7yWDnt4Iiww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
	b=SoEVn6rNswhPK+oMdhzw+05P9Ipnkqa64U13Q/W5omc/GjSqkzW0STOMk5zjOAY5KSDW
	 DibDwPc/ZNOjtOGZJizQN3Zlqby0kxoxTzdzlz9LVCkdNVwTpRwb4e/bdGGQLZoTdrVT4
	 p2Hhp68G/Gg4Vr2q46R4xrAA7uTRI4FZVxPMo4eyXAtGyc6YHeHgw57Wp68TPw/h3k4FD
	 uBuvNjEBhGXpNFyDzmJvZLqSX66fOy9leoPxwsaqA6XqwpF4n7qsnuBLpGieJvo6PsL3/
	 bJE7rvfxFBmuq9GIy4AaEdOFV9w5o/qETU2Ussf4MRRs82+cpBCnbMJgi93ezVhPJ5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmyf5Jt+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E985606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E985606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qmyf5Jt+
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f13so1225371eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793240567; cv=none;
        d=google.com; s=arc-20260327;
        b=E7khZ+7WdqFrCoLkmr2nc6xS76IhaCmXOdni1YEYuKFAGhkpnizwuxoazj4llglnjk
         ZzN4BlZQQBOQh1plAd0hJR9mBMXiZio5wwP2ZBZskMfLw9diUZAhPCqSUVqRc4IyDIkd
         d2TNqvn7JR3DM7Bu4au8B+iUO0ZSWwnWbKDtoqK2fbY6rXF3YSBIZkbIcs8E8e4otdQO
         0pgftRGcdbrrjTc+qYYg5seBX3IIjd3LNFvucnLTwDx0tc04e7RVmT2tZTyQk44P0vVR
         +Za96gP0NRXdZk5OFREUR2vBs4LSJuOUlsSTJAnmg2L9uFhHZIDQqrpPShJ5naHadwAN
         P8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        fh=oZLbGk8EZxj/LzOcSiMm/gBHfyNilJPCEq0oYW2z798=;
        b=gtiZJwCB5SPlYL0ArMg0xnY9e3ANnNYuxAit4FhcIYjrXiMzI2Tf3SFAlITgwJpB+z
         Ll0R5xLRYafXrkzIRnS2Eu3rG+UtoRXQpC6ZM02IU3/AiybPP6X7RAPEwzwqrb5obHxt
         XnK2v0csz9I9KrsfrTtGRK7LDFMsJ+yj12W/pH7O3M9TfxEtSIE67KHIZ3qNxtcvuFsA
         cqjJITcMfJodWs9yIltaTZYb/2Dm/nNBJVRWUbhGqWcnFjWaZ4woK1sRFYvgpZ3AkZhZ
         nMjrN24Fa8s9VHxb9ZYgIA+Kqwo7pCZhtDNAJqLIp/rFd8a5zDMZ9ww2JWty7dnEC8ew
         st4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793240567; x=1793845367; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        b=qmyf5Jt+Ed+8erZTIMBU8TuCQh3D2NzH5HVjNrR2j/MFpaoN3IGVfoACJiUjUHMjb/
         lFR8+WFwLe0CXdQXa/o0qlcSwCYmOmul2OW7qv5Fyp0d5twPeruOqTJp87ZyLFwWu03V
         aaQxGAM2DUjtppw/xL5P7oISaWVHa+H+oVtjg1Qmu84nz8uY8gAA2Af3Ucve5FKD4PPB
         tfAKUJfn06RuAOZ3E6CWTcIq8tnssyh0C8Em7zGntuVxBb7lLV3NdSlDyI7g0edtr8ra
         AKp7JqKhozgBFOIhF2TTJXF6W59ghl5TVfxLl1XRy0Cid1wYWsLR+hX9LRp1UxkcjO1i
         ZtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240567; x=1793845367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j4WfMTamCRXHv/6Y8+jwIR5jjgxstSa69agWQosfIbg=;
        b=L6ldm5iDJd/cbBfvmXSeAjOrQNU5Bk/SxOcOBL2cCQZxXA8nEn1XXRv7xcSoF4zydk
         vYTUOr6EtrzshKMkBXJbzRneLrkza4gGJ1uL66kqZKiZdu2X7Pc2pKW99FewNabSooH7
         puaL79n1NMhD1WxUuMy2ZX0MPCRbpADfAw2GQ6OAvsa/vfcQY0JYuQOoO6B7/+vu1ktH
         s72SqwS+qc903a5zooZ0C7+w6D+dBiAr8ACd7FfrEs69LkIq9JLgOFz+BLDdQQqjHi0V
         rqK0LvnYxMDjFg4U7VfByl6GstA2kWk1VP+aUGWivPkk2toKmAFIwdkMXYBD4DESaR/g
         VDBg==
X-Forwarded-Encrypted: i=1; AKwUvBxHTGEcFu+hLiUrFgpi9CR0WEit8v6Bp/83yBPMzE0e3RznGjRp4+bQ1Djr/WbNG924ShAA49MDTw4ld4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6iCPEY27xFuXiSFY6KUBbufVlG5BKylBEBEBYdRhl5o7gYm4u
	LPvmkC3MWXQIblDa7pl0XE3sjoQosfomEyGU6/QBehC1PBhJZe6jzRTVbtPgf6tkjSL4b3Lg6/B
	iIqPb1bva0EYCQHmsF9zwrVDuACkiYwvSx4U0
X-Gm-Gg: AYBFou3QKsCkqQwhP1jHHeOWwJEfVwFzBiHqb4vygkFBF3MyKIFpuD7sO54CTNNwxsv
	wdDfibH9T0NtT4FB9dXFlXMTf2bggO6aD/wMVUh3hReaF7x5SBZuDRsDa9vUgDHWI40sNXUTv2q
	qwnUceT7Sl/0lq6bCz6jfaEEoLV3eOAQqvUCKaImrFLssvAUA/aGMUNHvwcne9cOHj8/PlgVTFs
	nF89KbcpT5th8o1nb8a9rVO4yocINM5RVRTq3i8bwfbl0bPp8KsDMGsLzmRRKRdtmGCB5CO2PZj
	82yWsY9dsf2MnWIBnKAspHPVEjR2s5YsVCZG3E/8XlmLBJDKgUmTJ9KdFAQZsXWTa2pmiUPYqh5
	TLLWcMOfBM+MBEgREWNRHErr2H80/cgFuwCWA/i88iEjImuEUb3ZqJYETeQeer71vJ/Cz9ScK8R
	8nYZgJI9i8DJBNq7vopwMzaJ4UVEQ=
X-Received: by 2002:a05:6820:c2d3:20b0:703:fee:9506 with SMTP id
 006d021491bc7-713f217c0c9mr1834612eaf.82.1793240566951; Wed, 28 Oct 2026
 19:22:46 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-tf-luna-v1-0-53a88f93db24@gmail.com> <20261020-tf-luna-v1-2-53a88f93db24@gmail.com>
 <20261020-formidable-aardvark-of-biology-cffcc9@quoll>
In-Reply-To: <20261020-formidable-aardvark-of-biology-cffcc9@quoll>
From: Vidhu Sarwal <vidhu.linux@gmail.com>
Date: Thu, 29 Oct 2026 07:52:35 +0530
X-Gm-Features: AclHuK-_y3DzB2l4MCckdRo6yujg-QNDJMup39akDFJc-hodLNFx5tyWp7l8yc4
Message-ID: <CAFqz8LLzi=mY01Lyjzmt71yzae=8C3-O9zMG0739jH2Dac1=2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: iio: proximity: Add Benewake TF-Luna
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 10:38:00AM +0200, Krzysztof Kozlowski wrote:
> Binding should in general cover both interfaces. You will not get
> different compatible for UART. Incompatible changes won't be accepted,
> either.

Hi Krzysztof,

Thanks, In v2 I'll extend the binding to describe the UART interface
as well. The driver stays I2C-only for now.

Thanks,
Vidhu
