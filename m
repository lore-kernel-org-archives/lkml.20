Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827834;
	b=X40lR4GqFhDwqyND/huStZu+7O6jS6PEJ/JXCvnlb7xWaHr6sgUh9ekc41N6iOL4xoeg
	 yYHaSMs/SQ5comD1Pzv3reOVlK5sZ5wrezYjMnyjfRMdmjZSBf7+J+k/lqQfvgkSagvQU
	 5p74lvcc6UujJLK4b3dTb92FOFPuy0VWraFuklHgw/OCkiC2xflmzJtPV5idwd5w2Fzqi
	 P91YTNjB5rJo30q1e2BemaMlIj+2CHa9rG5aiQmY6mjpiNb3MqYJcBco1RAgv1QyXNx+8
	 QjwbnG29ncH/wJKnCigi/ocdEXjJzHfsh7TB741hyd4HsDokbwfuRZtFL+BcWBNpC/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ITw6ygw2AXNWGd7QRacWknaddhmjMVGAScdWdo2ralM=;
	b=UrOzB97RVO4aEDavx2DB9alax7g+GZVllaIWsQlTFYmBR46MMM1gm1WHIwUB2JXIyPvg
	 KU4IX4vNNHe6vVF1WPSD5Jriwbf3iE+9DQ/ng+KiaCzfrmoTNgAnVbCV6H/GziinuspB7
	 Sx4Y3Y3el3GOifQzTrggmNX6kj0EUC4wX2V3C6ZmVHfoT/l3IGzOPZpvlgY0rzxRr86CO
	 DjreTnu3rue1WDfLCLFL+LTvnY817OOeQ9XZhfepu6C/KHxjIjkHsQhbv5DPCmiBK4+rf
	 yzbnD+NL8mVe9tJXmRdkMsVEKC1lZCadbZXtdnB8HXbVW0ebrz2pKDqnxZSHRSw/YHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVdhtEjQ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9C606F1E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F9C606F1E3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rVdhtEjQ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1387490f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827833; x=1795432633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITw6ygw2AXNWGd7QRacWknaddhmjMVGAScdWdo2ralM=;
        b=rVdhtEjQT5FeVSjeb6g1KeCSlR5WAzfAQy36NgBy24G8Giox2QE9LPzzbt6UaGFg20
         dmoHkqnkTYm0HKTFVPgXMm50xQ7zxGmwscbQp9b2ezCn9mA436p3+7JIgS1yW8dgeXC9
         nfYhNw53+TIFpt6+SE4H+9FUJIhbR8zphpCjI1+mIXv8dvNLdbmO05X5YWYCAlkPK7eb
         f6iCEfx46EWybkK2aiebuDDLI6wMPFOvAPoZC07MvR6rqVRHexrTmKf50yOkAIscUDkB
         SZu3GAngH4UyKACxxK2RRwNXPcsz6NLOW7SZFKczhfldBlGdj5FDcsiVAzFHA7oS8Ygd
         nDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827833; x=1795432633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITw6ygw2AXNWGd7QRacWknaddhmjMVGAScdWdo2ralM=;
        b=zXDkLgQc1SRSDr21gmATgstJ/TFmvwn/JnBo3BNKu+3eaSOn+zQ8JCbAIge6xFAyNg
         5RjX15KLa07XlAKh2cXSqIupuYIK3S6XrxCzBxtFx1EjFMFE5ZHzs0RWohbi99MjawGf
         f/V9zLNNPYKz6SwxIv4z6oqc1PXv2iaYPP/EWG2uuJMvbNuiI3rwJIbslL5gppJpQc/3
         OA0xs1s08Egp2OqppoovvpAGhnuKuz+i4RWItqVUC+BgxhI3/LXoCoJTJ/KdIqdXPos4
         CKEJM2VbuFtCLiR1L6v+IPtB0e9zJm/s8wKP/lRcrHH4lSpKyvKb6ZBD9Spe5NIHxMDo
         Q6/g==
X-Forwarded-Encrypted: i=1; AL+hErEOBNRaAKnN4Pk0Y/Jw5cf6LDq+EwwbPdiOLkLfRO2C6EZnMWz7yduxM3V3tiAkoCf4OuGAM2WfwSVMjQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BJyszGsyyrf4XC1KTuFWDyL45GFYKBae9hR5okpC/W21MtuLG
	Itq530IDeuqi1HRyhaNu42MQNNajyODSnHAXr6LcNL1YjstL0gRlUKef
X-Gm-Gg: AZFdTZf6SIMJZN9H1UO2eGwgIK4wR9IPXrr+89wkl6bbUJpMavIXVZQ1niSzOds+JtA
	dNUNdc4HZCnuqeRMmT4Wp6zX2TL3jxjWeNumitjRggZHMXDRLCBn2BTm697RXOPTUvn2u7NDYXy
	ObeoJX8j28vbesEv+DjdG2hJQaKf/ZGAN7ebK7iVHcmsUaGMDuwXtJSBX1OEcmTvvSDia6RhQCh
	4mLMH5znBxmKohpKHcOYO9FRgZfBQCHd+H+6CAaFBjfYdQ+3n/2Mv83Fpxzr4vgn6+vgl9XT7cE
	EWzDAajE4uxbEvdqdfUPesTZWg9O2t2rxJwGSiCAR3AaDFaAcy30K1PYQaxkkvsl8BVMyywdvs3
	A13FQ0ETTwntUITmuGw77i1O5S43BawTr+o3hsIQobZBLucqG8+I3pMD5NU+XPrZj0HefI0+zmL
	dsx9qEOCum0rsAwhS5S0OUPjIj8LHJTC35xQG2Fe66uImKqK5ekxbxCRrWbBk+lAmyrAANsHN9J
	sEKCRlC0dgRFPFpUO9eFiKY/rTdSZFUt7YuexuvZ24yvvzYVc3vqS1Fk/bccZJx7oSkNMRQwcOW
	WsLxMjZXiRjtnxlmvJQWM0/CjDVUDQnCAHQ9VXo23iw7/w6WSZOpcNhe7qW8A91UXGVsodRFkhM
	NnVJQzK2JjzGc
X-Received: by 2002:a5d:6f07:0:b0:490:f98f:addc with SMTP id ffacd0b85a97d-49c71d48742mr21084457f8f.27.1794827832625;
        Mon, 16 Nov 2026 03:17:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm39476298f8f.7.2026.11.16.03.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:17:12 -0800 (PST)
Date: Mon, 16 Nov 2026 11:17:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Pavel Popov <pavel.e.popov@intel.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann
 <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>, Lukas Wunner
 <lukas@wunner.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Jim Chow
 <jim.chow@broadcom.com>, Radu Rugina <radu.rugina@broadcom.com>, Alexey
 Makhalov <alexey.makhalov@broadcom.com>, Wei Liu <wei.liu@kernel.org>,
 Michael Kelley <mhklinux@outlook.com>, Nathan Ciobanu
 <nathan.d.ciobanu@linux.intel.com>, bcm-kernel-feedback-list@broadcom.com,
 virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] PCI/P2PDMA: Allow P2PDMA on Intel Xeon server
 CPUs
Message-ID: <20261116111711.7b473feb@pumpkin>
In-Reply-To: <avqhIQ2krd1qgp6K@infradead.org>
References: <20261111234439.4098-1-pavel.e.popov@intel.com>
	<20261111234439.4098-4-pavel.e.popov@intel.com>
	<avqhIQ2krd1qgp6K@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 Nov 2026 22:22:25 -0800
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Nov 11, 2026 at 04:44:39PM -0700, Pavel Popov wrote:
> >  #ifdef CONFIG_X86
> > +/* Intel Xeon CPUs whose host bridges support p2pdma */
> > +static const struct x86_cpu_id p2pdma_intel_cpu_ids[] = {  
> 
> Why is this in drivers/pci/ instead of behind a clean abstraction in
> arch code?
> 
> (and the fact that the CPU vendors still haven't managed to provide
> a firmware interface to expose the P2P capabilities is just insane)
> 

Isn't it a motherboard issue?
Since it depends on all the PCIe bridges on the motherboard.

IIRC P2P can also deadlock under load.
So it needs to be use with extreme care.

David
