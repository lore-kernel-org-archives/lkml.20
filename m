Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC83F8ECA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952617; cv=none; b=N9QC83nRmAJHiMDovox3OOGr1HpCrg7foY7BMRbk4gdXsaFc7mtVoXD3oX9OehdV/UVpE98SrLopa/xx653WmLkecxehDbIj4fznqdPPBuLUuhKvZpGNrla4CLS4RubYBx6QMljJLi5VQWP1Z2vHiw3HnkYWbi/RCVh10SpkXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952617; c=relaxed/simple;
	bh=H7Y5oWnq4NVb53d7SYqX7qhoQBIzX6DB3CcqvMEt9GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqbWvXYNDe6j6vDlnc348klGsXjXldKVpKMmt5aQztMYebgMeK6vFiQu15faTk+a+rh0PwN+AdLEduOFm1S09GX6Wt3oNmdyU5U7mHrJ+h1PJkqfa/vP3A3skF+TP0JPA87s0qwDNE/Hb2qeGBxl5vbPTEs5y6GhOKRo0HmEVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=gRglnTWw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="gRglnTWw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15e2dab83eso996373666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952613; x=1789557413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8U9A3xq0Qsb4mW1WIPrXZkTSYo7G+pCHz7yNI6aFj7U=;
        b=gRglnTWw5vv9ekNY5TDRy10Hg861FSUqA+mouhvkgoY9OciRLkMy7W7FGaOmuxobSF
         92xht3z9c9hCI6T8fCEZQWq2K+wemDY60Z8ZG0yBNMWm4VBnh7VAt5bgjXMih5zskyjb
         QqevOSZ6bB5XllSgmwwIPU/mqwugh1Sn6TJ1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952613; x=1789557413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U9A3xq0Qsb4mW1WIPrXZkTSYo7G+pCHz7yNI6aFj7U=;
        b=qDcId0QyaGi5nRd3lv1MkTW8TICHq4bIVwdCPEKj4iKH5ngEtYka/x+gs4k4L03obE
         5aYPSO9n4teQ3YydDvtWEt0gOQesaKmf4v6RxC7ZHb2X6GA2z9tYwFidaDIEGIVGhXha
         IDkSvertbKMOLPeTcICCnbl/eQxgAtSIH89oybbjWNjWVjN7FtVgm9c5Ba6Fe1pGndbo
         xjjkuuae0XhhASdlLBQp6qM8CRX94SWFwB0Onhe6Gc+VsLSePQhD8U6qFH1UeA8SPY4a
         7J6WHW0Xs/NEnMWuBhvikGok+gO9T1AHuf9R8ZG38s56ft1pGRkSQ/r7htF1/r26i/v6
         h1Eg==
X-Gm-Message-State: AFuF++kFBo/eHKDKJCQn8fhDcwpc+5GyyBUQmRhnx5p8h9bXRKH9tW20
	PBvEPH21fE4d/ePtpxoaUrJxxxsAKNZim808xfcHjH6/+wAz0RUb6Ua3+CiPyxl7nkM=
X-Gm-Gg: AYBFou3OibzKoVmDSpZC1B+3vnBEuk125ZiPdRwg2Q5hBShs96CO5CdbAwMgnHtmWVE
	ESFWgEn8+21Fk6RZ4XBdrqzRtstmP5awtmaZ153KobayuHeyiRz9oUbO1tdUVMjctAvcu7ylqka
	gHC+K+F0qNikCND0mxjIInKYQKFCT7FCNfuiJmYLFjzBbJMmjDiJ4HH0n0Rh6Pd2ZodcbWOu/Fe
	rpsQOEjH8VJ921tKyz05JEGUYhazzAUDF0mbso7xvtgQwm1kcjhoHMzyRUaQd7DJ5Tf9fGQOSs7
	qR0JoCT87uvxJNwR2EgBIRMGQdG6Egz4uz41KsBCj1y8ic8FSpj4Y3+VeTj9/D3JXjmMB0dFAe4
	VS0z8emCTJ/eewRmkIxggwchm2GBgltxbynT6HTMKAjT/zMc6AoHm7zAA4OcSVHEQM0G88HnZ3h
	6LwIkixpaZ4FXjnLkb0yBkSwJBMtWOYlUQBSUfhwxxV8P4F0hJ1XKKf4FojVbG0WJWiCWCGnr27
	BtTiL6DuULtE2R4m3Vy24C2IJsvMW8Deg==
X-Received: by 2002:a17:907:8b99:b0:c29:1801:4487 with SMTP id a640c23a62f3a-c2918017506mr401559966b.30.1788952613134;
        Wed, 09 Sep 2026 04:16:53 -0700 (PDT)
Received: from carbon.k.g (79-100-31-116.ip.btc-net.bg. [79.100.31.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293d20e257sm28545166b.57.2026.09.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:16:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:16:51 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v2 1/1] ARM: dts: draeger: Add socfpga devicetree for
 Draeger's M48 board.
Message-ID: <20260909111651.GA23020@carbon.k.g>
References: <20260908111011.960876-1-petko.manolov@konsulko.com>
 <20260908111011.960876-2-petko.manolov@konsulko.com>
 <3dbe92ee-805f-496d-9a7d-94c837e674b5@kernel.org>
 <20260909100709.GA20988@carbon.k.g>
 <fdb26816-5efd-4adc-8d90-fa29a3be1dc3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdb26816-5efd-4adc-8d90-fa29a3be1dc3@kernel.org>

On 26-09-09 12:14:34, Krzysztof Kozlowski wrote:
> 
> And git log tells...? Anyway, pre-existing code is a poor argument why code
> should be added.

OK, dropping the earlyprintk argument...


		Petko
