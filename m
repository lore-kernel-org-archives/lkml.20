Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7F22E7387
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816175; cv=none; b=PUpB9FYhMujOAE1IkkaclE1pp5tMq9SklF9f4gsiekJT8MuWCP1uJM58kyI562vYgt507GZHoPs5NVAMD5EmtRB1aUuvsJFsBYxhus0Au+iDk/8Zgxf2aZz5kqVDMZabUGo8qOl5qWh6sFAAByTeAkVqeKcL1KtGUsxYe6zaYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816175; c=relaxed/simple;
	bh=U56QULVWqsKJW2EZBRefVWv3E+jcCLq19wO8Z6fvjlQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:In-Reply-To:
	 From:Content-Type; b=JlHScoU68+z730BGDdNPqEyn3Z6Fanj2gT4gQzrZc3ZNauESgsC2UiPAs8bWs9sdFTC7enNrCE9KoOV4gpQxByqNsjkwYD3U4h6fFZwKkiCGfnat6gmb1dlbs5vZQTwckPKnIi9GGE8sSrKL2Cd/C+wG8ANDKpT2EDOkgbkqeSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZSbQexn; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZSbQexn"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so439437f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790816171; x=1791420971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:in-reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SWQolDlxs/mWv18+ONCdedDA47CMCmGgXEL49Xti+c=;
        b=fZSbQexntwSIvdZveOa5hCZGYf48vj+grPJZo8VS6AIGoz4dEO4VMRd7rBZd5CPnnt
         IKBbrfAED0rtML0rO/KAADj59OyQTtU5XRirizaHaO3KFdWEbuI/EZjFDFr9suoy2/hc
         q8Q+HhKsvu+0B7NOKW7QT/Rmb5SLeIjkjRsZVQhMz8PWWSt7qHkgdfyrOdcsL6XknWx3
         jBcFa08nG58XXjSAK7P4ICNqMxcfBsm0lnNBlcELS9D5/PljYgfm9g+KGhFOhcXoaPG6
         83xvOhZFQM08CcQuIIBg8tqJdduqktkC4HGdEvTmZjipbyCTG72jWvtHOOopirMMDtVA
         1dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816171; x=1791420971;
        h=content-transfer-encoding:content-type:from:in-reply-to
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SWQolDlxs/mWv18+ONCdedDA47CMCmGgXEL49Xti+c=;
        b=anelqq79hqvOLDEOeYY81nNTqLh9+o0IPG1jEiDw8QEy0V8zeU51ADw8BGCPRqro+Z
         0ijhEhzOEX9Fvr3NqbpGGaFNC4+E4J/xMwAJksYML45DzyBeDLpu3qBQBt+XrzK15Io0
         pvBOIKT1tTv1W3mq9fcGZBzpMMTs2LWWDUI7N0lVBKQk3OMYzwd57x9AKIJcKJ1uuLxo
         6NwhhLxz1HlfHhVzRj4e3wZOMNfDKzfJO7vx+8XNXIvqD1b+i86IXPbPdfnLTRUzN3oC
         m4pnvGfN0MXiYVOTmyaRIc1sc03dOgwNKjYYeTBJPBTTnnKHFhXBb7QDlP6qy5dFwNa2
         kj+A==
X-Forwarded-Encrypted: i=1; AKwUvBx+4gi+NtnZ/k/rpIIuFm9MynB5hqbnFePTo2PjOwMbrq8eG2rX1blkIqpueVJlcTHW1f9nzA9/MsJSojM=@vger.kernel.org
X-Gm-Message-State: AFuF++nKqPliTN9cLEf6YvGdkc6Fe/ZnMS5lxZI4OHNfVqHOOXn3xlGQ
	5phqjVwZtS9J7p0CvJhDVT3rXDNdFfHtg9b/9E8GBGtzj9bq4iHEMtp2
X-Gm-Gg: AYBFou3sNnPEzFH8udZNZUEseIEZuzMoXnACvHvXaxelQWLs1IgLcuCFskDgCkBjw3H
	A4QOUi9BlEDw6Ntby8MKQ/SVPgJQ4pHXgLLhJAdy9cei8WCDlM3lRXCxJhyHt1FpR29jbvm8cIb
	u86RMz1c70SrVI7d9mTXHeMFNh0203BT66KLy7DxVVwfmi95Dv1+VSXSJS9C5ds9cQEt1x+alVy
	V6shBeAjG21tcWA6x5sl4LhAjlCv0SzhXr4E642UEuObgt0cmtqa0s0sOqqCKZx7ksV1CmHm8rs
	vfU6aXrOKdvBeIUDZNBiLn7pLCeOjGAQ9qMyTH7DKzQiACeFDnpCr3ZSOegVKq43dVVpBo0fZMH
	8bKkDha7JRrmu8AAo4AWEJbg40IbQ2YHaGn5ZSjCelHOUMFX8p56SVChVI6hJRcBSsO0mQ3vlT3
	Bi3UqY97Cbwj5XhBkvoPX6covGzarTnub+JciU9LtDXosMKbgG5ZT33tfI0gbS1R1Dl3yfW5GM5
	gOwPcyZR31lNNjEXRKwkHE3fhFW3Fia/pIW
X-Received: by 2002:a05:600d:82f0:b0:4a0:1e64:4238 with SMTP id 5b1f17b1804b1-4a01e644325mr29628645e9.24.1790816171286;
        Wed, 30 Sep 2026 17:56:11 -0700 (PDT)
Received: from [192.168.1.6] ([90.243.208.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm36071075e9.12.2026.09.30.17.56.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 17:56:10 -0700 (PDT)
Message-ID: <3d2d6a70-8a00-4ef4-89ac-8000d9f9bf85@gmail.com>
Date: Thu, 1 Oct 2026 01:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: suravee.suthikulpanit@amd.com
Cc: frank.gorishek@amd.com, iommu@lists.linux.dev, jon.grimm@amd.com,
 joro@8bytes.org, linux-kernel@vger.kernel.org, santosh.shukla@amd.com,
 thomas.lendacky@amd.com, vasant.hegde@amd.com, alex@shazbot.org
References: <20260424092213.16976-1-suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2 0/4] iommu/amd: IVMD handling cleanup and ivmd= boot
 override
Content-Language: en-US
In-Reply-To: <20260424092213.16976-1-suravee.suthikulpanit@amd.com>
From: Adam Pelka <adampelka26@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Suravee,

This series removes the IOMMU_RESV_DIRECT regions that block VFIO
passthrough on my Gigabyte B850 AORUS ELITE WIFI7 (BIOS F11, 05/21/2026;
same problem on F7), Ryzen 9 9950X3D, RTX 5080.

The IVRS table on this board has three IVMD type 0x22 entries, all with
flags 0x08 (exclusion range only, no unity/IR/IW bits), each covering
devid 0000:00:00.0 - 0000:0f:1f.7:

   IVMD 0x22 flags 0x08  0x8aa34000 len 0x1000
   IVMD 0x22 flags 0x08  0x8aa33000 len 0x1000
   IVMD 0x22 flags 0x08  0x95967000 len 0x1000

Without the series (stock 7.2.6), init_unity_map_range() converts these
to r/w unity maps, so every IOMMU group on buses 0-15 (27 groups) gets
them as IOMMU_RESV_DIRECT. The GPU's group (01:00.0 + 01:00.1) shows:

   0x000000008aa33000 0x000000008aa34fff direct
   0x0000000095967000 0x0000000095967fff direct
   0x00000000fee00000 0x00000000feefffff msi
   0x000000fd00000000 0x000000ffffffffff reserved

and VFIO assignment of the GPU failed (tested on F7) with "Firmware has
requested this device have a 1:1 IOMMU mapping, rejecting configuring
the device without a 1:1 mapping. Contact your platform vendor."

With v2 1-4 applied on top of 7.2.8 (they apply cleanly), the same
group shows:

   0x000000008aa33000 0x000000008aa34fff reserved
   0x0000000095967000 0x0000000095967fff reserved
   0x00000000fee00000 0x00000000feefffff msi
   0x000000fd00000000 0x000000ffffffffff reserved

No group on the system reports a direct region any more. The host runs
with the default DMA-FQ domain on every group except the iGPU
(identity), and there are no AMD-Vi IO_PAGE_FAULT or FW_BUG messages in
the log. The ivmd= parameter was not exercised. I have not yet assigned
the GPU to a VM, so the VFIO ownership claim itself is untested on the
patched kernel; the check above is of reserved regions only.

This matches the IVMD pattern in the amd_iommu=relax_unity report from
March [1] (Gigabyte AM5, type 0x22 over devid 0x0000-0x0fff). That
report didn't include the IVMD flags (Vasant asked for them); on this
board they are exclusion-only (0x08). If those boards are the same,
this series should fix them too without relax_unity. I can send the
raw IVRS dump if useful.

[1] 
https://lore.kernel.org/all/20260328213228.12084-1-chris.longros@gmail.com/

I'm happy to retest v3 when it's out.

Tested-by: Adam Pelka <adampelka26@gmail.com>

Thanks,
Adam
