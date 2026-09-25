Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61F4A5C55
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353684; cv=none; b=Ov6BEXW8fttZg8UeHeGj8bSk4YPkpmm/juddYQiF3ftzfIymPWui9OvPQt7C925cFVvijV+BzI1pTnDCN3VuhLd/vqwCJi06eJKoaZ2pIACQxQQExdYuvjQCYBFuWAfKjtXzbCojw/+jG4s+JTKcVRclaWnxjEkrusT7U12/V+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353684; c=relaxed/simple;
	bh=Zx04GRhESpJuwUwQXfmh4GagFMWyql4BZ0xKHRNyTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke8EZPHtz5rPfiOjrYyEPloJMsA65uNbRYIIJJhipppVuSSo5pdb98oKVBe2TGy2nEuchSZIxQ22cZY0y4ZoVQM8BkJzdRtANQRJeMpd8UJYHblnTKr75/NmWgDjk4vFhNdsEiquXlhSBsP+hMBhg+GMdP1b1sohEhxceXa4L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLgFEotP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLgFEotP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so536824a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353682; x=1790958482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=bLgFEotPQaJQDLcG26mkDYsRyezk4a7D18Be51OK2rd8p6pgtyzAO6g5OcOBHmZ4LA
         B91ZF41fjK+Pb0bNegb4F2d8trww0Sh0Ji2z4e9nNnBlyM2ffuoXpQ7b0EEaTngjyl6+
         paNx20v27X6qtkeg7yJ7/sqMjIu6tCMa/ZjP07FE4MJpmTfHPZ0ylWQk1MoOA/i6CYGy
         DoFDc2da6eykpCPMzQLM9rOBsy4bME7Bt29bchbCNcDdy+0E5bUma2HqHXbquKWaJhSi
         GzA4Z8fU5hNMtsiFDBmUnB4XCGPhDvLcFCqpOINWH4z78naRWINxnHMFFNYt+6y6LayD
         2vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353682; x=1790958482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=aOjO1ArBOkay1jGgrqSmo/dxr1iu1610EXinwemuzHV/WopI1BX7hAGCRTV/T0vCgT
         Gs9OhPpP/txw3GeoNOGqUv8PklsqavOb1u+wlBuBRNIt7JYDvW7fy1KBW5kliv6f3xD+
         qh7kboTaH6P3gw3FFE586128w+UKJD9fuSDElNIoIEEiCf95TDUciHAtui/sDshfMao0
         c81j04z0H+dX77dSCovPgqHGwvUIXNVKvno/IG2qXBXd58z5T5ks+cH+0NmwkxaqBV4N
         XhS7nREXRxrxd7N92FDaRlWgSqTIKpDv/5WrGznkYCUztdX7NPLdsWkoZpgQICWNq36X
         GDOQ==
X-Forwarded-Encrypted: i=1; AKwUvByDvA4+cW4gPOBubbnpL5A2ZntYAraEfMu7uf3spCZddW5fjtWgBdp6sZJbYs6VPViXl8yMM3qIUgdFwt0=@vger.kernel.org
X-Gm-Message-State: AFuF++lDirMMLWH3Yksa6X8+QvUFZshjDjsQsNUN668zouIVVh+FdSh5
	kg+cpxUzyuXjQ73tDpzU2qEJout3M2GSRkfUeqcNlL8x7c2xPm3NRTbC
X-Gm-Gg: AYBFou2mX/vFu0vk/GAuQFR8J0V0g/wamTU3U8DwdBu1o4C+wGdvRqswIf/7PBiQdNL
	JjKGtT8pOSjiA9Ug3O6eNZ/DLAcWDjHbNqU4fTxkW1P9V/sfrKihKLOHSqr2ObCfv9uXCL+RFZW
	MJ0leu3eufAQnxExpR2KQb9IIIU8w5hEAKZw2YNQODZ8T9d424EhmK4M1PylOLf/KlrQyrreEL4
	TyX98VH0CSVB/h5+IL4O1v6fmfnSVsLs0rXpo4uSLBC6VB8MMCC5UTQIp6wHd3o20jTCvumZzk0
	uAoacRUMU9wiyD666Y2w4neudNey14TGx9b/HqmPZBD/4Rj4UtdcgKvl2m5h+UtQCNOgLb99zFa
	9f0ie2N+jPGg64cU23FrjhPZu/Q9T/px40blOY2S4c4Byu3AfVMw/dumDR3BQk1DdTdMhLx+pWY
	nqwI7mZ15ubhHuzcjbrOogh2hjDX3HwNhtd69+AQyoXMXw8I08RHfWBIZOPioeuHjck56LltUyH
	045960d+NC0
X-Received: by 2002:a17:90a:1c89:b0:3a0:9dbd:431a with SMTP id 98e67ed59e1d1-3a09dbd4752mr3475490a91.10.1790353681688;
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm12819580a91.4.2026.09.25.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <fd18f46f-deec-42ee-9574-91c71cc4caa1@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:35PM +0800, Colin Huang wrote:
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
> 
> They are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
