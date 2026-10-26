Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974293;
	b=XYPjof88X5H4a1L6AARliCIU7EMAelyoWwQ9uvJCVi6cyGm/RLpPfPJ8aOBMYbtqju3X
	 XyRFWhfw1FcNg7sVlSgBjRiOSDnG3oORIzup1eRCVUlKjufvICmsIjTzBW1TYEhOOqHKX
	 1NapHaUZ3wxiGHx+uzzJNhWLHoesf+HqKPcbi/oRafalXAJkbzCOIEoTNpCslNwU35GbI
	 fBROL5UDwtmZEeTEHeYgC2tDZz1A4rOvmi04Bo+LOeOfQxWO3EiY2EGIRxfyOyddZjeZz
	 f5u4eBcyllNlPuMBD/pLeN05KGhtUtqEqT2FlwE5k19xmItPSQDlwdopvaB48chAQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
	b=0KFPNutzgU2XWtvrQMucR7FaLL3HMDWvGvv8bPFXyFykisQVA9l04ge7VZU4S7FVW9YV
	 vj9IaUNWLbfR6hKKEqFZWvrfgrG3ybGcHnB6njNws99M2yMxDzIeiYgBuPXG2N5RuAsAa
	 4UUoFny3dsGVZnv3Z2UYDqfdm/ovReyc/HW0WmptlgxJp3I5Qm/ZxbNFOSdJEGVmMSqNc
	 SZVR9p/dD2C/Opt08QVJR4mdIl1wgQFPaQYBnriyYlMnuJyv/UyxgZcNVc41PRhGjfD8Z
	 i7OLTNJR5HlTJERcPBAFedTqVOCQwgBn79UETp+UTMcHH+n5coUosZupISNHxEo1x9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E7606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8246b13cbso21518675ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974288; x=1793579088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=QMARMDKnwV949KW4/7O7LSMd6V/YMqHz9ZlzpWPQ+s6TZykn3tcjCrDcHALhy1p1D9
         zqqj/8P2iA+mT9qEVy+OTO4BJMmNn57xNgP9cUxA94uldrS4V3XktyXb2Npr40PtGPuy
         km/P3oDXSbst12pKwgiayxeyY4umhESjvW8vcI/lsH8231KYo2AEuYpPYCEs9G9OqRi5
         ILdIktl2YHjxn/ILB2eQPo/HJLGk1XEysxZ7njT+GgD1zhFE4eCvQVj3jq9AYneT4VqA
         n4shNZ80DPL984vmHjsFDb6Jg3k0aVHR1+XFwi0SpyargLeisyh4sSxPIXy16x4yeHfU
         TTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974288; x=1793579088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=MybwwxErYKgTwAA02b+rVKzUWb+iomwslVTYuEI/9lFid0MUica14PNIeGAZJ7dEud
         aoneiokxHub3ZYntgdw86tPD3c7EWzbginBtQXCSzrrxqw9QeAseyo57g/3FGSwrrg9x
         0QyTXhO0ntA9+HzhvN5G1vUTPYNc553JBgJn7RPS6Oxb0XiUnBhFEr2EHRFoJQCJg0Vb
         07ZoSq6rIcvA3R8f+UQghB+ncht4Uhxu8sHNIkQr6VpBLqe1cEoq/60iVEZA0PxYj/0b
         dDeC7fUhp/MBS6z/hFXt9ufqY/a5pSS+G/9dRreOh3AFLKZ/sIzcCb1jc6LvH4zOIwTr
         M5tw==
X-Forwarded-Encrypted: i=1; AKwUvByXeRJJjexKMt7wJMEDTj9FvSMnFIB2h+F/cwAJcc9hyzCCvFboJI1k8taoE1H6mbDOCcvgjxrVkEY3veI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmWW7JJJNin7v0kF/o1HHm/Ve/OnESPiJcrsgnT/R/46sB5mT
	bgtDiNbBWY4+1r4WwFKJ2N9RkfAxMi4l/m7DOyiJ8U95nS24pGoPnWdj
X-Gm-Gg: AYBFou0+okO/FKGpjrwnU398/uCvFOswStY+HDyUhU9Ht0zbdnZ52EqfJnsWk5tb83I
	XLZb1pbPvobRiYProMj1ld5gFENLb3XMkFO9lsWTopFFZdQeuqV/ptxu+x//MQSUIeVb8qE8ZeE
	DInOa8lhpVyzj40jr6yvH5ZZDlmzHFrVzyU9Fs7tNB7R9b31SL79fu0vlgZ5ECXItuwDLPDpbrh
	bg6GzplzxaEtD5N6jlg9ex375n2bpkSRImA/LuidqEHEmVW8F52gQ5B33g4dOIw4B4R8sHJj72q
	tOnbFgSWXNGxADIy261xTKbL0Mh9D88bbiwcceeiGOXh/0upWgOZc7OZsUA4y1LmDX/12rflWhs
	T/9vNqTSw1RNqAjW4GiMu+cZDIaNgRdhdleCz3H9HHIG2i/Bov7Er5rG4Yhg7BOEaA60DKE+55f
	hP/dLg8yJ+rZ+ZHzhdP2aASSQJQfyzJPcEKL8rKjQ12buvrXwwEOEPCJAywOrmWQPJOgycRyb8G
	myP4Bw+qJ6IwftcGAxvt1SxR49tCzGG1mcMFckxeSY3TLPDGSOw9TaoR2EvDJWf3M+x+w==
X-Received: by 2002:a17:902:f705:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2ea9c6c3363mr43122285ad.36.1792974287852;
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b12104csm10407525ad.19.2026.10.25.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:24:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Message-ID: <9977952d-339c-4ca0-b11c-9df45b6c7b65@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:50PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the Maxim MAX31875 I2C temperature sensor by
> extending the lm75 driver. The MAX31875 features a 16-bit
> configuration register, configurable resolution (8, 9, 10, or
> 12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).
> 
> The MAX31875 has no alert polarity bit, and the bit the driver would
> use for 16-bit chips is part of its conversion rate field, so skip
> the polarity configuration for it. Also set the default resolution
> and conversion rate at probe so the driver state matches the chip.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks,
Guenter
