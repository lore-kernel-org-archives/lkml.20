Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647157;
	b=o4kGppig1F52fBA822uQ0obtDhgrFHi+E/pAfRFOCwmzyW3KBrwQkJFxyVFiP85aQd4G
	 8vOsYTyRvVzo2dUOnlEtpjE0+yhMl81BqunnZuCWby+WAjTIwzyGQROuZU2D2DHoACJZf
	 2LqSdiuC73721vyMzvOdd0dkygMXkFpHQDQeLyn4Ltcxgda8iWv/eFP9dxxPGJounN9aa
	 NiHr0PpzWwfMCAn5nYZ79UnW4hKhkC0p1aBIFQkBGgcgCIHmaNHF4cs8fGEji0RLXLGfl
	 haO+QAUP2B+XD/ViAnyOu2DJlOIXi0vx8Lq8YtXh3/PC5apEe9PkNb/pRZy37VCctyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
	b=Hf6u87whWcUEyN2EzLXtza4ejdAReRsceI/8idxIKwljLbcqX3SP9SPeAokzc4Yb2K0E
	 kSOC+VKKV8BCp5vYNUymVfxQlTr5q7IhkqGPx4wuSyl87eInvKx0aKdHDJtMUUOj2MxI8
	 O/sGNu6urihESuMrFPcuklrqVMG0JAW+qFCc1QUNCPdJFOh1S1F1H3F9sQT1X/xwXylmH
	 b5KgQ0jmZe6zbnk02IjCRl98lw71SmxMwuuErr268BM66+vrM6nWqiNOqWrs6Q+uzBTPv
	 hbe+PGKs/9tjMDbMykYgFDYJh2udJXYrCxXOV5rZ9VeuFG0muMKSlhHHYfHmDIiC5yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NB74w9rB;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AC606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=NB74w9rB
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2075553f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793647155; x=1794251955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=NB74w9rBrA1Fnaludy1HBowebMeI8FhFmSUNE2JVYGwPjKwXx9TI5xm7WO8KeiOryK
         d702aUwvSY25jzV7QZR4CZoAIzB40eqzwRv478T/lL2sBsDIggpSeSv/QJaU/p0b2Yy+
         tFtTg/CrEe4Qq2P//4lkseZFThzb0EIKz3XbFlWf+AmjBz/htDERW9z6CuHXf9CKGXNh
         e1ltXfcu+/VpD9gV5+5ChwmiHXV0V+iZBHEp/Zpra6wqD8n80ubPh8SWwCTeTBujV8ra
         SZ/lvge5hburvPtLszH8TycgZ9FtOIcKo92fmxORITiMn6Hyrla0+tia6Wa57rORP+Ny
         JvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793647155; x=1794251955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OC/gY15cLyDwevMNUFIaNM4tFLtXDK4Xhw0hL/Ej86M=;
        b=wMvf5WR6tFvT20hGXT+VUCR0Qqerid2wxKIifT9fT88ZWY11pbqQl07nlvmH/az9M0
         smPejz2Y34SlYytp1MKhJcLha5BiEqOfQr8YDcGFgxjH+0CMi/N5hF3Q2yYRaNFBChho
         4yeg1Xb5NV0luY/IpcNqn0aZqxsYYm1KLBKKhK1qwmtSmEapVGj8fJR4gmy4t16l+0oJ
         eYeng3B8pXOca2dMcBsl31tXQIkZ7HGhBDQqOcy1TJsbloeUBCyiLRIEyHQ7nOKswaog
         rVo2g0WbqH8pSvWrI4YOJeDcyzlJEVG8CR4AfRvM/lC8WfG+2bbt7eSquxTkWk/pf5+u
         weCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAmKNAxhGar3CrmGENIEFlwDxqFrHMMMEYgkB+poPAJOBmcYiVLFgmOMo7651iKzC9+dW0t/kmqoEGTSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKowPhlGQ6tvLtMEPxg6641J4FVOdGHx4AW/5JqtvWRl4Wi+t1z
	NP9PZSjlpWwbPK3KUPPMf+on4T46UNBvXt77TZrLtpQS1gxiuEu4MEepkDcFzRM+NZ4=
X-Gm-Gg: AYBFou22MMVjzjgJE+PRhgasCOZwUwJ25UdtQao4oizxQQGQT9DMPSYzdJJZnXRweiI
	z1nGlNxNf09GSBNq4DYxmuWgq3oigUCcB5G2eesA5Wf2yCRaQG7JgXpR2PNKlC9fXslDFhh8RvL
	gU+TfHXXWo/7pvhvNSXB9HSW1/AgnSKk2Gt022a1aqU6Coyp5UmG/Qv7jCxw/msvWTG/eo53JQr
	ziIzdZqzXD174Vcm1ISQ4VjZsPBRP4fmtHvQQoRiVufrSowfoDohUAZbqpgUGYgj+04xdCNWxl6
	121qd0dgckcTBFF2tp6HxLBQ+KftVhKI3CVFrW59oTTRAPeSiVykJQ8F3gdBspUhcjELzJfb5Ne
	ZYqS3zVxlHmh7QHcGpsGPZ4CxwRKKGV2E+iwgvGiuMM8Vkni/nz/ae25UiSVl7szxWfXLEHcRs+
	7pOtVnc2eNNyGbuSyGdOZouj9u3KjyFljV8pTZnBfBc19SbTQpdrxF8915T0jZZ+AYeceRCA+2Z
	0HgYNb+CPTxMD4VbCf/o5CYzrdj4x58d/FPBv/kSTrGZkt5fAk4rj/vufvJyB6lkDCK3ww3aSbO
	K/BUtblFcNuzVrmfVkOLvmobdhdpdFeq+GbL5eoRxSmaQW7wr7eRJan8wFvZ
X-Received: by 2002:a05:600c:6989:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4ac150b38d0mr251477715e9.2.1793647154958;
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm6083675e9.12.2026.11.02.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:19:14 -0800 (PST)
Date: Mon, 2 Nov 2026 20:19:11 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 08/20] ctlv: Prepare message output handling
Message-ID: <aujiKOR-JR9kTMia@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-9-jiri@resnulli.us>
 <179302367451.58760.3909701518454079333.b4-review@b4>
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
In-Reply-To: <179302367451.58760.3909701518454079333.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> [ ... 498 lines skipped ... ]
>> +/**
>> + * ctlv_op_query_done - Complete the last query fragment.
>> + * @ctx: query operation context
>> + * @generation: current data generation
>> + *
>> + * Return: 0, or a negative error.
>> + */
>> +int ctlv_op_query_done(struct ctlv_op_ctx *ctx, u64 generation);
>
>Typical kernel style has kdocs in the C files along side the function
>body not the header file

Okay.
