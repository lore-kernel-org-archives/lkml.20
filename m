Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841846;
	b=H8BydAj+1hmzrv8BTjda7W4hh3XCAn1mNRnI15nit+ajUnrfWSZ6xR5Klun3yEFbIkVm
	 kRq3xEuyl+DdtoA1XLWM9uY2xb3Ejx20gpowCW38QeZ4KRWP1IqjjhQXvwRtPLGH5NwO/
	 /AOfwhY1NwchtNTPb9NiHe8BaAmoLM2t+9UY0q47U8nDAbgMfPHqvfaejpWlGTJbfxAQx
	 /RURy2ABioPNagz9pYuV1dTyt4NSfkjvu0l7fOHRrs3aWfRCl6jy50ABdFh2ddLR5AHWE
	 Q2/QLVbLWaOXn/F76BgtcAsIOsnj3pRKSyogBwT2slqCGTw9QZpozd+r3y/SjdQAQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
	b=Gh9iZjKD3ayc1n2A1n4iP80kUaqTUbFb+OEF7Up8XeQcOafzdrdhhKNF0wrpYBIoiiGD
	 HLHtsUZPgcrnjXJ2MRMT2C/fCdYUwpZy1hsWv+T3z2K1x/MowAJxq5kSt0Mlayq6Ykk75
	 3uSrYmbo6WmI1QaBMlQz8F/T08OmyND0ZQQsZBB1FJHSnvIUy2vTLCsU+mDnoW/0Wp2Ai
	 kSM9xJvFybLqoy0OZ6aGU26LAOX3/MuOwv2QCD8va8H/57xj7zEfIsyxx9xmVO665kWNc
	 DT5koKuSX0woNx/m29pdH+yHrflzLYSKOhZAxnrr0vpxvAqlIHhYSKp9hRQCC3TjLAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWdQTxQC;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86F606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C86F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWdQTxQC
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1438d9363fbso188393c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841845; x=1794446645; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
        b=OWdQTxQCUqwXbHb+36RknxcB+WBnZo2rFG+nQhEbg3L/hCjWQRHDqAWmPNN729AtWh
         //c5jnyeomgWgBDauMCM8M5i3Q9WJg2yapIu9TopSRBBmeeBp9rI2LJtMNCdFqab/CCz
         WiNudzxddVydooYpHoVbCqt5n+V53UGjW1G/AEPPG/E26fHtUJ+Kx3Gfa0yKfF+E7vnE
         9AEj1mkQ/+IvWonyi8dG6UjVBj9pFUsG2ZsIMQaApmLox8giOEJbiJOikmHzRvIJlmZZ
         5JtGTSR27JjCBKNi4/Yt6X5m2DZz1D6d1Ek/ZPLDoAl1S7BdL6DmjUuW1fN8N7aV31I3
         WPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841845; x=1794446645;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
        b=QrxZrqPG4KfKrUbWuW2ZUpp+T0mXYeTaXA70UdvbZYBIF1WHS+fi/3exnULoq8Zlve
         J8EiV59LaEd5iw+f5hZEesB8iEgVWFxxrlg4Ge7BiEdLwGo5Gfbwaf//zSbJ+fe57JeX
         AC/ZMiOSW2MhovwRx9shhkH8m/DEWxdWwpm/e8vfy5IUGqjUdCcI1mEAsFaE54oDLrnq
         hV+DfnBIfP2+ghQvD688ZRnfht6HdsnYfA/QYpqAZ+XenvaKZEVLnMMLa5hu+L2YoRgI
         MDA40ME9OUwn42ah/L0Skg/8EWgkaU1QbF+aXjS3goNAp1zsE/mXRQryi1GkDcXsdHjr
         GT+g==
X-Forwarded-Encrypted: i=1; AKwUvBxZaoa2LJTU0nZKCCd7xr5A1+5bemzyJEFqwlOW4rzRpXYO3khzYuZ2auBbLwhNbHKaPGjJnRYRk9mUQSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NT0g8VGrSnMc0exDoR/D2ehq3IWW0mdxj/0ZFY3VNE/piF8QV
	10wAsJbuPV/kwM73tGCU6fByjm52srgeangwZXde2TSZKEQagbFehhAS1TOIFA==
X-Gm-Gg: AYBFou1Uj0SlGedPi4JVHiepEDR2MhJQ7RW5bUsgQh9ptNlEiFK247VOfKq04wPFd8w
	G+CwbBqzpP+EM7UYU73/w8nuYWcbs7Qil7TSlx0vd46Jfn4PqQ62xwTcLlEe6h8jcIqKVZi10IO
	DjPNiGzbhvfKwNGatpnmGDtTuxQ0V3UTBbGnJPfIVOXKn/rThIVb+eNXuCVit9NOnrdfnrl5QML
	UDUTE0OM+04p3zHbm88SPw9jTTHL5agczlkBW8Ubea3KVamivwzA6b/IVQKAL9LhUTPbzuf0C8E
	O0udbYoPxKUBFDgU90lC7961YElb1zezqk8AgDzUOtB3eq/ylirNv9NAZquyxF5BAMjT8fd7CmD
	jRbOebbIYCatLufM67CtV7dxi9ZfiQKo0xD16RWbTk5LreK1V6HrpYjLzu01FyI8MS2NiOcdW5z
	vVt1bUo/7r3G3Y0iujfVXv+Kxd9q7LSlg+SQLVox0PH4EcRsGH4c/im87TL5g+/wseyyfldiJft
	e5yfbw5zDDGtVqNQHzkhCSp5mrRFQEZr69guU01xu/3Obd1tCox0u3rx8Q7D/lxxErB9EcFqdAY
	FjTLuG1yqdQ9ChWqByp61xKLMe4Ism1ly0UA+rIGjbm53MMkQpqSc1Km5OLRvO93Ft86eg==
X-Received: by 2002:a05:7022:ea8c:b0:1b2:3e1d:17ee with SMTP id a92af1059eb24-1b24f4ab3f4mr1563076c88.9.1793841844622;
        Wed, 04 Nov 2026 17:24:04 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm14331402c88.15.2026.11.04.17.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:24:03 -0800 (PST)
Date: Wed, 04 Nov 2026 17:24:03 -0800
Message-ID: <41de3d396f470cdbb944ef521dfdeb4d@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Stop allocating ECC settings separately
In-Reply-To: <ardZinoPZXbXZvhe@google.com>
References: <ardZinoPZXbXZvhe@google.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Borislav, Tony,

On Fri, Sep 25, 2026 at 10:35:19PM -0700, Dmitry Torokhov wrote:
> There is no reason to allocate and manage ECC settings separately when
> struct ecc_settings can be embedded directly into the driver-private
> struct amd64_pvt.
>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Just a gentle ping on this patch. Could it be picked up?

Thanks.

-- 
Dmitry
