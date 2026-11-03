Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716210;
	b=JpeVeig4jmVp1UCXNtf1Nj6S2OsPG9wa6GqdK/G3AHVcdFygJJPBDzM6whN2WQECwmcf
	 +pdZOBLs5CIWIV/avzGfYWYyfq+UAbtEr1lAe0u2uSKSsJr2retefDKhx0i6ZT5oH3lL/
	 5h5mbNfjntfyVddQ49zBj2Ajw3s6J1dOJHnfx4viiR4iecOScOn20c3xtyDx1MYZy7x/M
	 WdjVZt4WfNYuoZF0dKho5O20nQRV0RNKs+WNtomyWpTGwNUdi6sOh08U+BmMtv/gFp3Yr
	 EZDk0P8uyUmFQRrfkV5I4oKPqYN8a2IHcBU9yjN2pHkXeC+fuxCuMW0joCmVYbUdbrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=S4N3HahgFh8uNZM4yzvkVFDOTn406BEclz2Tzu3vcjg=;
	b=Y/G3zOrg89rAZswBulHzkDD78757gABODgdAKrjkMuQye6xGM9TaETlS755NSmCmVK8A
	 jeQ2Fxxx0stRSOWfLMQf6rcCtIBd9Cc8uiR/FTDvRrhh3mmLimLvusSBklfdumi8fnTKa
	 dkJjqj6fQ7DKCNDjNaDNVYxd2005L8Hv1FdxnGT/YrEOctSY2SUhW3p/6ra6ztx3Wwi5v
	 Hi5N4TlP410ik/LYAn/FeCpD6F9gsu8nFqlNGbIMpZxIUTbEHniYnvm5QVh9P2CMA+Byn
	 lDUwzobx+fuHqT/vBJZWW/KOS+2dv1CLWxbPe+PuemSejnPkhF9DPWePOKgY8bOK7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lL9eOiVW;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E2606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lL9eOiVW
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c719669a8so44925586d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793716209; x=1794321009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4N3HahgFh8uNZM4yzvkVFDOTn406BEclz2Tzu3vcjg=;
        b=lL9eOiVWM8NSqwjwqgl3pa8SBGTJmq2udFyCUbB8ZP8LdjN008u64cdl09/tqzLYYh
         gqBXRk+xG32xFMjlRVOf+kFr5tuNpJ2KipIDBLNUauoBg/59Uod6syqZqVzX/k3shZXG
         Aef+vP2KysAtmjJE0j69IFGrTymLta2z03JCNnWYUPVlumzHyIhreFJdoyUH4rYhMHb8
         CMjbsVXmq4pO+eqWw5u7idJVFKg0o+0yHFKJ2Fs2V8XaQSqFBvf4CS9g0xPq1fUl2XCB
         xtBVfPyd1YKPOOxi4PvaqEDyusJkd2Km5bDAKZUwNIer0Ooup3EiSY9NaQrrgldC/Ef7
         koNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716209; x=1794321009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S4N3HahgFh8uNZM4yzvkVFDOTn406BEclz2Tzu3vcjg=;
        b=wgp/0rKiE5cX3h7YZjV2e1mwHjLKcO/gWVtLwR1Q1t+4B/F2IGfVJKB1ZlQsGfcCg9
         xn/f4PBnqQLn81WfQHSU1CIB4eVh2501V9Pvmdcvx0Yr6Tzn0KxCuzB9r261T00OmXHE
         oGNs9mS3IpKW9TDHkG4I4J4SUV9CD4zrc7zjZ4oYdkpveiGgQqDX++OSBhO7SXcBO/fU
         RqiOWZwnwH6KkAsNOHOI+CeZSq5Egoy1JrLz/6xDXp+kUWqBKp4xWi0w7yFV5huzSd9w
         rH9nLvuJTbrMmVOf6rY5FIpFzCDw08Iv8mZubbqJyUoIrTTPN4X1C3UnOtbtrMOwoC4O
         abVw==
X-Forwarded-Encrypted: i=1; AKwUvBxcPhpmYokYzGAJ2pb/ugGL10U9qgViJMljCwWfSebdb1dZJxHjmV7RVwtsbh7vwyier3qmjnmm+Yz/0IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0bO4UqIxtgh2RI1lnK8STp8IKmTcfCN7EU5KhFvX/TwJzIolA
	NKvcLUxW/HxNzyZd7AAmDmY9ZBQi/s0QwEFupNV3kdsBAcWF7a8dd5YKlkieFGBTc+Q=
X-Gm-Gg: AYBFou0GjKbvbnb27eunDqbWUmFaVRgugIGQARmmIC3TKVANccvwdJpSmkDYfllmLQS
	5oX34N8MI/59u6IsY5V5yGok0so/vzYFaSW0jEkSErgluTEkLzEbO9EL1l8eIaVVfKhoSnChMlU
	IjJcmjTzww8bpAx7kz0Ng0CpOwKd8HpZn8S1jXoou+GBmr/nn/dYvoc5CSfFe3g9pDPyS+9lksw
	4pH1T2NqBukCry+dMc7t5+9+YvRJT4H9nl9IPPSA4YlEgOZWhjNdBTH/TO5rbSHayghPul+Wrl7
	iMyvhPJUuijxfzgh1VDUXTmrOsLZdIkL5LMK3ZiYp0rS1dj5ME9EuL843dDsuxZD7VPnrrbQCt7
	s8wiMAW+K9UGROnO9Ke12Ju7Bq+TrLADHz7RgUMdVzswzr2qL83rvUyaOPsLwRGnIrSJ0DgEVvW
	JH+rH9C5HyPX7RTvu/WtiJ4cGKEk7pr4TQbWB086wQGXymva+TeJI2hivKuJHhZumAnS8sO4dPN
	jaMZwMiOVWSKNqh7fAzxQnbKmZHtzg3J/aklXDqawl9AxPV0CdBIsE9R4EDIad4I5wfYK8Bv1wT
	mcQbD4adnqVL2QsYGV9un7naDNU7cRbBPvsilkEETpzM6v0IdMpF7fq49PyhQ5ezYY9u40RG8sW
	0ayoYwJrJcw==
X-Received: by 2002:a05:6214:2461:b0:91c:77b0:1f4c with SMTP id 6a1803df08f44-91ca4ad418bmr221541976d6.17.1793716208467;
        Tue, 03 Nov 2026 06:30:08 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f26f1esm119002876d6.13.2026.11.03.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:30:05 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOFWW-0000000D4vp-116r;
	Tue, 03 Nov 2026 10:30:04 -0400
Date: Tue, 3 Nov 2026 10:30:04 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <doug.ledford@hpe.com>,
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	Iraimani P <iraimani.pavadai@hpe.com>,
	Mamila Santosh <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH for-next 00/11] RDMA/cxi: add the
 HPE Cassini verbs driver
Message-ID: <20261103143004.GJ3889730@ziepe.ca>
References: <20261030-cxi-for-next-v1-0-bc6e49e07037@hpe.com>
 <20261103142826.GJ264423@unreal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261103142826.GJ264423@unreal>

On Tue, Nov 03, 2026 at 04:28:26PM +0200, Leon Romanovsky wrote:
> On Fri, Oct 30, 2026 at 09:35:28PM -0700, Doug Ledford wrote:
> > This series adds cxiverbs, an RDMA driver for the HPE Slingshot Cassini
> > NIC. It exposes the NIC through the verbs API using the UET reliable
> > unconnected (RU) queue pair type from the UET RDMA core series.
> > 
> > cxiverbs does not drive the hardware itself. It is an auxiliary bus
> > client of the cxi-ss1 Cassini core driver and does everything through
> > that driver's exported CXI interface.
> 
> <...>
> 
> > Before posting, the series was reviewed with the Sashiko AI code
> > review tool and checkpatch. All valid findings are fixed, except the
> > open items listed above.
> 
> <...>
> 
> > ---
> > base-commit: 306a2f8432f516069b2e673de7a07043132c034f
> 
> Sashiko failed to apply this series as this base-commit doesn't exist.
> ➜  kernel git:(wip/leon-for-rc) git show 306a2f8432f516069b2e673de7a07043132c034f
> fatal: bad object 306a2f8432f516069b2e673de7a07043132c034f
> 
> https://sashiko.dev/#/patchset/20261030-cxi-for-next-v1-0-bc6e49e07037@hpe.com
> 
> Please make sure that upstream sashiko runs on it too.

I don't think he can, it relies on the core code series. I Don't know
how to instruct sashiko how to find another series to stich it
together

Jason
