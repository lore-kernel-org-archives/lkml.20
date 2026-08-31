Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAEC3DB620
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164783; cv=pass; b=EOKhcnbN4wBJC+DVSQS4ogVt8G6WnRaw2bmimi24dMM2yVorWIebK/byuNl2bzQVBRzGXskqz374bnIHz9fiblU5+P2KdmhiCwVotCQ5cdPlRGtGq4t0gT1wzgaKQSTmy74xcggcW6wvxacdSRGQKt+P+o4Ytdl0mTq/fEB/KCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164783; c=relaxed/simple;
	bh=i7Pvgb3oiy1hq0LGOiit/djv7hiLdC62LcWzykGTNDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzHgKB+SEziHXZjUGI/cjRI2PgXL3EH69wrCrQ1rNyHW7axJBALLX4iuHhZc9aXRjZmS+Q42rdItRbsEdT9zIc9UN4BG/XOwOBOOFWf+VfNs53ZoDGsERh+T/9BiHFPB7kNCaPORbe5JkmI/bA1dWQTQbsisjT7GLxH5h+luaLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Arv2w2P3; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Arv2w2P3"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52faa58bff5so324661cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788164780; cv=none;
        d=google.com; s=arc-20260327;
        b=D8s5rHPCMZAOQGvoS3g0MLKhFlEs7TlyUz7K5bZmX2F+9miHm2p3mwbSfdmxexL4f0
         pmR5IpykMEfR7yFac6h14TLXU4/Pgn3n2u2SDVooxIxtbUsA+/PYIyuLK9WcsisT6Xe9
         sCXzn9Cqz5iK2kP3l5RvNZJyb8IiQ0hyVhCG+zCw/GYyVEy20OuT7DCQBuLlSmH770Ob
         devVp2A7J5A36fL6EnLrD/yP5YmeS12WfUSSIH6KVNPDi3te8OM6SoSQj2/z6G59NtxA
         8wwA1WMt0fnNq4ts+daTNWQ/TKPHWSZpayR/7ljpNpBTa6PWoMd6fQ0gAxAyEJ51LT1O
         ypPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i7Pvgb3oiy1hq0LGOiit/djv7hiLdC62LcWzykGTNDg=;
        fh=HtQ/BET0Hwgpd4yPNV225SmPUDJlA2Gbt4jVBNA4SUU=;
        b=ieIsRcn9QkHjnwgJXUxNCF/qLpXyjYpQBfPH2rxQFqj6z9L/l7rsJGNw1OOZOj8jKK
         kzDUjki4UQxtEgxcKChlwdclTb4GqOmrE7XYhymEa2pxUEuo3tjj7QzuLMgnc42zghkE
         9unIZwbWliGIA2g1byEMijQD9Byostl9tJyxlVK3+mZJzEKa9niE4x8v64FGKtARmOKa
         tTP5oTYwMAbSX5bm3lKgGOkxd9vDGI5U0MQAFOIf4/KznHlmTypOsB3FniVoM9grkvKV
         dVGe34hpMCC6XUV4JFNQJnc/F0HU8lSp5PY9osq8Kan9107xiKiXv4XLgrPkfd1tAhvq
         Ndyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788164780; x=1788769580; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7Pvgb3oiy1hq0LGOiit/djv7hiLdC62LcWzykGTNDg=;
        b=Arv2w2P3TIZLnRD6C476tlrQY5qFr4a7yCxon8MfJGbh95sgrsIdZ0z/gbktbfV/Gl
         YnWBtIzpiGvGFFn0t3goA3aPn0JAXVWJdHN5rApV934smTQnSO0UqbgGy4fWiHqLHdLj
         EhNclZ+wGZIowEBKlkPoK23OR3tQUCKaPsa4Va0eYFOXdfseCFzn7m0C5kwR+XaNioRY
         PuP3tictKr8g73Li+Lgo/sVDrBqEeWceQ1qnv5iOPC092xvSNaRNglda0setAOj9ttI0
         nlUZKrNTtEknL+24kAWnyTmzII/8alk2dxO5wR12IV47qnvXX5/e5hlMHJKWGiRfoPPq
         QGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164780; x=1788769580;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i7Pvgb3oiy1hq0LGOiit/djv7hiLdC62LcWzykGTNDg=;
        b=Ujgh2pLrr72RsjJq+gF4o1rkzvBooJAIYcBsrI3w8YAo+AIIBSuGkBphk+jDdojKEQ
         oWTGURKPrla6M3v7iQ6+6BH5CAIBJ1xS/8M/xrnhgZDIPg4HAKDxfHlGcb3tGP8OOSKS
         6DtooA6vUg1rndA2e3RUUVzTjby+Ep9YkoZ4j8HSShzzDXXW5e9fhA17tkE50wEDW9HC
         1yfWYGXQKdb9/L3Gp5xyrEId1+FDh/PnQjoXpQrs4DIOWsDJIeX11xllkjlYuk0Cfey+
         FzyepUCWOmyo5KbqVai+RmzjEzKY0ppS6Kho7r8eKb99BtqeiAfrB0oQYOKSNoH2R2CP
         6SKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8AWk89jZBHs3n24LUUXTO3rGciPYMDgVdtD3b2lk/dI0BamkY8mpZ0Mwo4/OaBJf/UhmtUzpYHD3bHJ8=@vger.kernel.org
X-Gm-Message-State: AFuF++l5VjsZD8bnh1ZtIw6A4molL+taRCXIOOayeqOCiA+cTbeIBWC1
	PD8DYChDQUntIXjvuXQfig5hyYDwHyZkS+mmHNpfCeAsWRLsKpn4plW0DIDlC00yafMcMCgRUIh
	IZsU22VH35xp4mO83SRkjor4uFvgQQ5jALQayZO0v
X-Gm-Gg: AR+sD112IH0genUw/E2jnxZdFIVEn8Bk/4uYF6JG5KsHdZZCZ72b5aPiGuoO4Hdx+7p
	uqHg4OczpVBjdXfiWmiS2GmCxFy4MsKOQRXyuTTB3V2F5KAMEU+XMm2w8QQ3HR7gn+RPbxUYjTX
	/7cjoQ3s48KRWlugpQnehBDyOQh48T9rVDfVoO0OgYDgb78PkEu+lNgf7DqGpjf6C9qPfI6fcgS
	UFnoMJrtyHVuu2y9d3aC3NmlR2USDeHUaaZwLjUvBUtb9JR0eI179d3dfqg1e1VyE3LRnh4xjc8
	eAXHLJ7fCLWv8Dp9iPnXD2VSZBLrgRC16+aJjCN8iZJ2vl9c0Ct6xEWCnPNKIiHhgDC+yTuemej
	KMw==
X-Received: by 2002:a05:622a:64c:b0:519:b655:235 with SMTP id
 d75a77b69052e-52ff711704cmr26458811cf.3.1788164779732; Mon, 31 Aug 2026
 01:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827070345.2853821-1-jorge.ramirez@oss.qualcomm.com> <20260827070345.2853821-3-jorge.ramirez@oss.qualcomm.com>
In-Reply-To: <20260827070345.2853821-3-jorge.ramirez@oss.qualcomm.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Mon, 31 Aug 2026 16:25:42 +0800
X-Gm-Features: AcwNN1Wql6TjF2E32SMAe0niU5XIn-Fsgvx0mgJJYkagFD8DWijLMQS03XBChpU
Message-ID: <CAE14pdczcD5zsOm57pBaDqb04btPY8abOncDgFwF0_E4LP9sKA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ufs: rpmb: use a fixed-length RPMB dev_id
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, beanhuo@iokpp.de, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	beanhuo@micron.com, can.guo@oss.qualcomm.com, sumit.garg@oss.qualcomm.com, 
	jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 09:03:36 +0200, Jorge Ramirez-Ortiz wrote:
> The RPMB authentication key is derived from the dev_id handed to the
> RPMB subsystem. OP-TEE implements the eMMC RPMB flow, where the dev_id
> is the eMMC CID: a fixed 16-byte value the key derivation depends on.
>
> The UFS RPMB id is "<device_id>-R<region>", which is variable length
> and longer than 16 bytes. Handing it to the RPMB subsystem as-is would
> tie the derived key to a length OP-TEE does not expect and diverge from
> the fixed-CID eMMC ABI, forcing OP-TEE to be taught about
> variable-length UFS ids.
>
> A fixed 16-byte dev_id is needed so the derived key stays stable and
> unique per region while matching the eMMC CID layout OP-TEE relies on,
> keeping the key-derivation ABI identical with no OP-TEE change. The
> reduction to a fixed 16 bytes must also be reproducible by the
> bootloaders (such as U-Boot) that derive the same dev_id.
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
