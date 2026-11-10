Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794323009;
	b=IA6mJcDcSz4ZI1krmuJiYIcPzQn5ejgdOTVr+iyHoBZn0M3aQwLoIJss8HvGLFx2i35u
	 bYjiEjKmrejfEi7AEVyBaB83sPq8JmU8kJ8I0c/zA5D0YUWijEnkxTQRGSo33Usen7P7r
	 D0hJkwb1WgHPGgFd29dHpwgdt7m01N8SmIBDVaznHxo+Ew6ELfN2AO4ga0A/B8sem09Ph
	 nrYNo3nkOJmdDLHX3VYEKOkCv2tf794FFKY9w5eQwQLkE9AtMRa7w3ksShjXXm+7d139u
	 a6OJh5yL4x6sjSmwAOI0CLjLgEi8p7gF56yjkE11G5Ff8xJa35oojQCiRbfOrnAtxow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YlUiTNXIMjlXgOTEsBKhouLB5i+QwsG/rXvMprRtGXk=;
	b=n8iADll2snHBzpZowppSKLLX01ld+3DiUta6ARZGt1/TQXGe9zn2Bm6NwbimK8FG9r+w
	 XmLdpLnLGb6j8AYVSiESk477soD5uUyL8l+Hd5dRd1Ixxq3yA/8IuqTR1A8lK12cg8wdC
	 mEdgrETnPdcqcsddlIh4u7UG5HoVzLTaMvUiJkVyKdHD1Kl3WEg2zsCYdM3FVVOxPIK46
	 GbUU0Aj9bRAIJTrWVfoFygwyG97Reo+6A3MW1AKeZc9uEZiSbV0ZhauXi2KbW2fGlDs/+
	 1ErmC4Z57C9v7UE9mhXflmUsXDgwx7mOPO8iYK2nDtERuFoV2tpgPZMjVW+hYgVaFFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z69LtUaA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFBC60A3833
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFBC60A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z69LtUaA
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ada7d53082so23365661fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794323007; cv=none;
        d=google.com; s=arc-20260327;
        b=p8q8CwiKfAXueCocNg696X4M0kuR2jM2bVWEPSEoRKiGmCoxxz0gDM+gJp0qsJ+EmN
         JBjf1DKBEyibno7FbeI5UFskcG8n90pF3yzDZ9R+Og9/IoU3uh+XdSFfZ45ohnjszn/h
         77AVTxCDgJJDn7ODDJD5XktFWD1ztZpDIhVfo3mhkgISVLFEeAIGnR6lnGKuydstl+1J
         8fUgNB0ui9WLns+FQW83Ywf3MvavOtBYol0Mr5Y7s9Rqg81jA20fHM4qFyrdbKYmbRp5
         A29h9PUx0yLsHrEcKV6QatRUTeDc8AV034IbrS7P+no9F/UeI/GyKDNFTTSD2zKoeDi6
         v2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YlUiTNXIMjlXgOTEsBKhouLB5i+QwsG/rXvMprRtGXk=;
        fh=iFzfW2SYBAdq+g+8c8LNYFXxHtnqS6bdWnMzvvB5upo=;
        b=Qc8G9QmLd/bh0AgEJ8Txnn7xJa/hFodaG4tHLz+gt9eAClMF0cZG3o3NhmQuytmAxl
         A46s8cqux11be0mRyeeBCIHUFrM1c07Xb7/BAJ5+D16JdjjRMw6KwtsRIPMJrjxhssWn
         QarZbp02lpUvn+rkfAAMmotAB/ovGHCr0oJY14ajWv38CApHHKKG6nIpbaVIWJkB2eLp
         g/QhylWOZIMnQG39icCfF1NJbxZ5sxgTnsbnlqsxNWYQHtPdnxc45YTFLjr/ZpB7yOxd
         ZS4Y7lPAUEQZnoFPYaxShpDCnjvojnDIrO9bPJxVpGRgqULoByIARuM4i6EVWvos2/BL
         4uEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323007; x=1794927807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YlUiTNXIMjlXgOTEsBKhouLB5i+QwsG/rXvMprRtGXk=;
        b=Z69LtUaA9Qm+rVdhWfCFDz3R4Jvj/oYM1wH4pvR8qQmIbqpdlIqN5KMOyRP+/Gsd4O
         3t4a1XJMCzrv7jmqHKRion0JdOCNnxkSyxTAAmOkGwCVkl4QWpp12Y2nPS6WrACK4VcU
         u0xc1i/MYputcHQdWyykehcf+lnh3FUrdQQTkyj3S/e1mpCjzp6c1Cq9+vaDT69k9wl3
         4pmGYg7IB1Yc/La1UJBMJwtCtCiR1aUQCAPo6cfM8g5xnJmniBK0nLtredDasbiQf7xy
         GG1TbThSakK0OYMl0R5OMB/iDErwEU4KiZkU7jsiUmECMocybm6wGdqf4DGAx+gmVyiR
         WWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323007; x=1794927807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlUiTNXIMjlXgOTEsBKhouLB5i+QwsG/rXvMprRtGXk=;
        b=MYCiIrvfrHpJ/shk2xvN7aOMLjnuNuikSjCEs5cDM9i/U4JC8KR9BPiijvl0nrtK2i
         mJG39WfPBkt144DoEsk6yyphX2KF+BDxxFXwRbyFBdNWTrN8CQouIUVwuV4xQQABBfiv
         W+NW6U2WUydkODPucRmhDFgxvr8KKTwh5JZFABd06DYM+6eVgj0QYiCyR6JKBe6d3aNM
         ZR2wz+iDGH+Upu8Dm5JzmQsPLwh9Pu1zLEOGpNGeCnZXMpeO+tb/ViqWkLrBxwbHqSm5
         glhSFYTU/gMsOqC25uNRUWmPCtz8czRL5lL4YoroXdHboQz2zIme+qeGBCrKfwwUpWr5
         Yfyg==
X-Forwarded-Encrypted: i=1; AL+hErGKtBXWrbAwmpjdEZAH0gBgcxQJ+NrtyOz6dprY8Xji1U/GOpqmnAgh3CfAcARgBVEBxEfvWwUIrfI8qSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WfFUWgnOC9xEYE/ttrepwNc9YzxBWxCbpYiwoO5xKdw9Mx7OK
	hjnhj3mNBL5VY/KrOTgxfloRAojc4j1fRtcpiT+YwrWjFgynf44wbT11CUfpquNdsch3J58oJOb
	RIkq+5FjxGG6yz8O9fTalN8RI2E6OlZo=
X-Gm-Gg: AYBFou0avWvD6u1kFSoRT1SBTgDTSeOEC7pVIXdGWOVVHzaonib4qpcwFCKNsMcTfE/
	yvu1sxs1YrLed0L2JdCftHw41h8yivqbMaemMKa6I4lfidGqjPYR3krxXLHm7/EyrkZm7Ui/7/J
	QKWCv72tyB5xIhN2pqcl6EQYwR19y1tmLL16HNKrHpboWJZ1g31cxSoRRsAR10HsnuRNbDi7YbU
	0wl+xu4yJo/Pc9ju2M+MoncDxLYZgnwrEpOWxb4iY0+j8hp730tuyEn4ecouPJsxj6wT6yJykxz
	Wkrc1glkEhVUNm/RlYjG2/H/kjABU2X9/dqRBXmUQM57js4T+6jTfGYTahFru3QGQzgalaAVcFD
	/6Q80ye5vxg5ZQJUFTfWcdQwcLjTpz41DrMJ0UGa/dqB9H++PgpipAhbUCOHUMuGRgS8ZVxJULe
	0jdLcay9iy6WZzyabM3FCzvNjnqkQp/8rliZkAKc7lVjPS34hY9fIH
X-Received: by 2002:a05:651c:2109:b0:3ac:43b3:d926 with SMTP id
 38308e7fff4ca-3ae096294d7mr5021961fa.8.1794323007374; Tue, 10 Nov 2026
 07:03:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com> <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
In-Reply-To: <20261109-zsmalloc_stat-v2-3-caee41684aba@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 10 Nov 2026 08:03:14 -0700
X-Gm-Features: AclHuK8U6EjSJrA4lsG52yvDTvd52iwZkoWxsdfsxr-TxwaKQPnCzHoNe4WNlDk
Message-ID: <CAKEwX=NEw=T6xWuu3Pv+v3Yh1BvfkGKRj-Xd3xxn1Ci_fkA9AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: zsmalloc: describe statistics with CONFIG_DEBUG_FS
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:59=E2=80=AFAM Xueyuan Chen <xueyuan.chen21@gmail.c=
om> wrote:
>
> Zsmalloc statistics are now available when debugfs is enabled. Replace
> references to CONFIG_ZSMALLOC_STAT with CONFIG_DEBUG_FS in the English
> and Chinese documentation.
>
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

For the English documentation:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

(but I'm mildly certain the Chinese one is also correct :))
