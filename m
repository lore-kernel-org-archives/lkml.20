Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384004;
	b=l5Jd5kWO48ssBczzjI2r4sDq3kzDia9nRvmi9KQHoVzNhRJCJ6zzHl2C3V5T3PZ22ckF
	 flQqVAsTh/v9wwOjAPx2ompIH8q/NTX5fLDw8ClUIcxkr5t0RGFsLK/EAjo31+pGrX0Lh
	 EirhDahHYYdPfgBizwCz9laG+2wdi1gEfKbj8LIbVU3MmnXGBRoVA2uEXCDN+X/OdxhRT
	 DkytB9qEDwHFg6B7GkYruscPLYe5SGCX2gDsZvzVYjo+9maidf/RgqVWL+OoajVTz/vzK
	 Wv7Teeh3VJY9R+i/dUzu0DI06dnkT6BFNvyDIVMruWbZUxIfFHSKJmEWd0v13g1LNwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fMT+So78QSqhuFKeOQlwYV6UaMLr+CNOGb0u2W5xmj4=;
	b=CSZjbyeGaPL5YLvzEcQtWZS3o45Dq508RD7KaRTjJtmm7jV7cjENdNqNBb4qcJmPhXDb
	 sVAVdJBbNZo5kwrL/gxdhe2e0DsZqDZwT4hlJdFjfwEcTClJCG464vD9DBaBbWF6nD5lW
	 XZUq9WzhnRukmsnYefQKneUfcyCRYrOvVBtWiuABIAAc5WDkIyHyjlLrJCafYev4evNZP
	 /FDvaZtHPTUHLHTNs3wDKenHFHbdrsmXDoB/5b/icnc3LzlcMZTVcUBopir9kNtI+tpvy
	 OAxe4PYepWNqcBTxs018y6Ede+U9MzILUxs11I0uAxqFhTW0m39lk8TqTFCCbTFsGhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaE3o8Rj;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 151BC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OaE3o8Rj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so856624f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793384002; x=1793988802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMT+So78QSqhuFKeOQlwYV6UaMLr+CNOGb0u2W5xmj4=;
        b=OaE3o8RjEVR2zR75eyJC/w/NzOyHFo4/aqxLVy1sTOOTix0v/XRAORx0DvEXQvizgM
         GxTHgDQzNXs28wuRg2tAdlgO4YFbkHs6wSwH1KlAI1xNAwZo7o36zCP4KnM/j5WijmTP
         6Z15Z66ioDDzwi2MWRBKgTvweh+T2EYu4iDu55xkzRjld6HL856ZF+LbbQ9JjGnc7D0K
         JZTexRxXbc+zHP469suaQUi5EcUd9aKst1j3ayVsyPLEsWdcsXAA52P3SDchoTerpujp
         tppw+c0l0zQtKg9qiNVqXGoa3LIBe7VYE1HtlFeUKh5x4PNnZtS9WWdSHSvahFqtzjhJ
         zRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384002; x=1793988802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMT+So78QSqhuFKeOQlwYV6UaMLr+CNOGb0u2W5xmj4=;
        b=lWdt0E7yyeJy0WJdfmTj60YT+LOFh2/uKAd7kLpuoRm8FuyVl7XhZ55++Ca8udnmLP
         9r7OaI0aD/o2dgHyn1tn9AL1Ur/POpgr26P3XXCZk95A7ReBG5KtvnCpiPvWSte3AzWa
         jvmskrwbM/k36AAMSRfQ+hTATsl8EqtbYbjV/xVYSijd5AKmdzdZrwLqLLt2UPq7Q8VZ
         dzN3Rb8//bseMxpZtXGyvdmZG4FJ/kLtoFf+pHcibfbjAE3e/J53wZD3eV0xNyJO1FEi
         oFhW+WURF/d990r99kt2D5MDaOf30reo6mD8ih+Qtexc97kATHkn3yu3yVMSOf56B+YV
         9mvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiN8i/vhjt+4hb2mha2dJCZYwC3UwTurqC84FST189fhH6x6yWBxRslaiMui3RJ+NIAhHT4HNSPoyvlD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYd8u4iRDvlavm70bHf4EJc2VB4tJtEIUBX45EJTxLNhbVQwb1
	zv0HvR4JkaR5cAt1x7L2Le3Ekv6uxv1HDT/gH4XZB+BvHgxoVIMVHFRM
X-Gm-Gg: AYBFou2TEZm6S4Odk5HAiOZg4vnEx2cFNuhyqOPxdsph34mJYntydI9yOhsD2CtCEHe
	fnCWIywvynxci+kOTItWbbZQ09P/uczRg3/S6GkDa4hgXVjfiqqHuO3oAMoignRdGmgDCew4l0N
	Lt/rhdoNo2WTRH7cFr8dNIuEtPqjH4isutHOkAqQIQ4ujDaqNPwpaXvJzcdP7NNBfPNWjwYv4VQ
	phHENXj/ocgyoWw4zJ+KvyTLCkWW/E0nHc/uvpZE+d7BXBJvGv89CMz0Octgc0HT1YxaswCDAlw
	9wamQ1BElDttTSzjMzuakMwXXIZ6TMupoXun7MW/MyDaAF+WYd8i7wlOgmlnoWwanGo0/uDVdyK
	0ehaBGsqQbNHKwGUmVr7u5R3T/3o9xf/iem8ooIAOhpsxmsVBSGhGhvgmRAhy/xb7n5848bmZPb
	XTt7O6plCorz0mzjfogTQnozvQpWh+0ijXlHU/DIKy4xt9oGa333PnjNzstEPLnFgg/6FVcGlml
	4V1tK5AMYxqlJmPmRfvvOBKP/C+eu6Bj17GcRVOUDv4b1n/Bm3WqyxL7PnBzVqGqK1htK2/he2f
	o59OXxsKOSfhJSLuEg+BpxTUgvKdpyF4V0cO9VuzU8sOWgZEefaLACz3AEaokEhdNVej7/Iq+yl
	gHxmF4mlUxJlJ6/uUCC2gOb2DAIdjdgO1xVzPSKZrvmcsk/eg6hOE3oGRHgHC
X-Received: by 2002:a05:6000:1449:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-48e6e2ef786mr7095121f8f.23.1793384002277;
        Fri, 30 Oct 2026 11:13:22 -0700 (PDT)
Received: from SD.cable.virginm.net (cpc117822-heme13-2-0-cust760.9-1.cable.virginm.net. [81.111.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm4198221f8f.41.2026.10.30.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:13:21 -0700 (PDT)
From: Prathamesh Deshpande <prathameshdeshpande7@gmail.com>
To: dtatulea@nvidia.com
Cc: andrew+netdev@lunn.ch,
	cjubran@nvidia.com,
	cratiu@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	erezsh@mellanox.com,
	kuba@kernel.org,
	leon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	mbloch@nvidia.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	prathameshdeshpande7@gmail.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	valex@mellanox.com
Subject: Re: [PATCH net] net/mlx5: IPOIB, Fix QPN lookup race
Date: Fri, 30 Oct 2026 18:12:52 +0000
Message-ID: <20261030181309.9266-1-prathameshdeshpande7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ade46454-e575-43e4-85aa-eeb5ad79408a@nvidia.com>
References: <ade46454-e575-43e4-85aa-eeb5ad79408a@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 12:18:59 +0100, Dragos Tatulea wrote:
> I don't think that all these cases can happen. But I can see how a
> CQE completion on the parent can read a pointer from the hash
> bucket that just got deleted.
>
> Please improve the commit message.

Thanks for reviewing. I will narrow the commit message to the parent CQE
lookup racing with hash-entry removal.

> Holding the spinlock in the datapath is not a good idea. AFAIU
> using hlist RCU variants will be enough.

I will switch to RCU hlist operations with deferred freeing and send v2
after validation.
