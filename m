Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426243;
	b=B84HvMj/UurqUsyGRTBDqsERgeB2CRNfs0q8pfu8WXhbs0wuKg++4/mC5qy7NAHop1c+
	 d6WN7cbC7KBMAoLv09bkxhB4bZ3//Hol8nuRptKA9f0pR3isbQIb2WOHIFdipuOc3EMrA
	 +h3q+SSzTf23HApo9yxX3F3huGBiGP9SrmWuRuTB8Zuv+NobS/CoG/ozn+lZGgkQkxjTU
	 Td77n0H1bVvMxfY4VR438TXscH0NWWTGRb2REicC48vaaOke4bBGM1cxClpN083TlPg75
	 KB2N7tY3K+a2dKKY8ZO0080LsGwGRJpgQ91T9BrtbDpEv5tNaCBT/XvSDsltOYbHI3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
	b=XrbOyM6FTojUhYG7a/SX+ivnUkLVeIlTgBf2alBdUrJnTXYjnytCXvhcQmNYTmq0b2CX
	 jQpM4Pr0R7/KhTfSsmXSI3zHGBuFfBgFXT4mfQqD9LwakrdMHcEQU1Yioa+PaQVYz0GG7
	 ++A6a44xtVuLdW4WxJvbqDKyaqzF33u9yFUPqVQana9s6fUxsepp2TxUHDTKd6yoJu4eX
	 9j0+//t9239Y5xzZW2X4yfhx9yC7/x0pHr/FDlPME5WKxAtzYmXZmEOYcRszYuL5+Rylp
	 oq3XYE1mYMx3YEgRPd+RgHjo5pYNJPHwnW/VAPbA8w+W+JMSPmba5kt3RNzqO97jBKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nwce7S/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBB606AAC2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBBB606AAC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nwce7S/v
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1376949a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426242; cv=none;
        d=google.com; s=arc-20260327;
        b=faqXtJorSIfFj+G2AEDKn88v2Po1nBKMwanhqBnV1tPAEPT2N2qks3jCh9XXX2WIb3
         zeb2SI8NUJJMkfCCBZf52KWmUcCYFryNvx/ds0s74P2ICq3ErYk5AdlukrTup5dSFJId
         iWHRwi2+274cM2QFz8SUd7JYBunC24mvySE8bawh9kZc5PeLjNgKW3bdpP/0YSTVwqyS
         5wpgFctEDRvoZ1mohuv+zi00HdnAx9cqZ0jnYUsVJOXjA5S5yqcV91gh/GKDbZn9Bzq3
         +ifEt4JcZnGDFYVWuRVpWj4nPWVH706Mbi3fnsJOxGoxR3PzJ7n/gVRUiPNC0BzSVujZ
         2jRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        fh=SzUr2J10FUOrBBFD/PGNlDIf9JQFZUvASdeHVcyqOOo=;
        b=cSBe2w7GUplVd0ajJvD3btWHH2PqXTiiU/H5jAszdilp7oUF1xSet2NX1panbwcwLS
         V4a6aJ0bvpFsBKBfjkGgX3fMeVGlGcBv/8icBwmmZwmTl1pVP5HcsZ+FiIFRo00f3AM1
         as4sBmR4Tdvk9EzYOwVH8tdU54hc3R9TrTOKfRF9lCvUHiErZG74nriNkSe7KEQzfedU
         DGnbIoM5bp981cR2A/zCyv3FMqZkU707cpq8M2ttb7r+XOKa85KuRyoF14zHv9hk7/xV
         s6Uz2Xk6rv8MCDeHx10BdrerxZJFhlNS/fhpmxtquhBbzNJPPLdeGibT4FFtQ6GRutaS
         QzsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426242; x=1793031042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=nwce7S/vTMoqAwf5xtwZ968yrj96v05xwkxb+d9Y46U3mzPEw4km19kPH0dhCTAgYa
         mvEBSm7ZT1Qd73u0W/R/lgY4ohvJK2kJmlP2pDVYZ1dWnjRYo4odiEdm8yIQ9xd1zS2p
         ZQfy4TMY/8l35JpqV3IpDrguh/ZNLDbwOv+FocYxVqScWejzksmBbR6Vln2Bx9mOHGgy
         FO+h9DRY2ZZxAUcYA4MtTPYNl+LjRjZp1gcs91wHRgWSwy8y/D1nIUpP7Rnnx24UiiP2
         SXnWod24OTqySi12VIlVziSl/692SO1pN289VM9uZT95tHHcTwXQ8sv/YWgYqK/9LEKI
         RTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426242; x=1793031042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=fWUAuLLROptDana3MRQI0NpMRkohTZ6nQzCaazfSTaTDWH4e7c/HpLLcrus2q4MJUW
         Ha7Hw/A0rsXm+2Lm6REtWC228z6ucnvxHJYMtpWGIs2GUMEyHxiXjmUR5AzDY6wqyBhF
         Bc3Pj4QyF9CWcLDPakoAB+ygkiAboRZJHseZ0oDUMhxTa9Zk8lsDQcThr/xGLDEnqblf
         0+s0BSkoEyL0G6ERmXVWJwC9euvADtApyQBxZ9Z3vfx29lrlRO83fZZe87kxIrZrgZkB
         af5FY1EvswER1kkzlxg4cuCH7GLkzcqby6AzVsrZ5sHyLcFtEkUd1ghvl0kqeeQKsjwO
         Roaw==
X-Forwarded-Encrypted: i=1; AKwUvBwMm6dOvJHMJHRrW9t7Ye4ty2/+WZVB7xTmuq3Wcy1ENM7yfqMUrn1e/m8CSSKOFSYteo3exlMwisc+Wrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVUi9RhFhLLrj89m70LTZEU5QcVwyyFbx5chxUoLnwLvzMwR0r
	L782h3YdDeOIFZJmz+FsHf02a3qxISW+UYxMRy887oq8tfq+eB1VhcnYL7g5hJigdEIv7SHdjbx
	n9sG6sk+lLCEoVIiWvPK54ZJ2swTqk1I=
X-Gm-Gg: AYBFou2XmRxtq+fD/5EDA3cw1bZrxR9YnBx7VRtm92hQ+7qrVcrCmq2QNW0yo788Cxh
	mGy9hvQqKJCJxzBM2+BqqMbz2ItiUNgHlaYYpitaHLi7sBh6hPtaAxAWvWoWrfZyBUMiYIGLX/N
	HvMZdwX6HLLjBRDMBB7SKG4k6w4cT3F6XXmnud3LNOuyHDcHmaOa5sERS9f23hNapOcHPJ3RU1k
	ItGfXRv5xSp94TeiFa1cheJVtOEmJjt8gPvG+YbxBQ8ww8h0Jrg18bed5Phvj9UNpmC0Qqcx2E/
	I5VkzHCFIJijH6nRwHpc941dS0IEpNyuW48+FaOSuaTFSSdpSQJQU0auC47z/R1yQnBABRTyxB8
	Cf9dH0zd/grYxkPH1jA==
X-Received: by 2002:a17:90b:5623:b0:3ac:9a54:e3ce with SMTP id
 98e67ed59e1d1-3acef6391ecmr7235023a91.63.1792426242489; Mon, 19 Oct 2026
 09:10:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com> <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
In-Reply-To: <atX9fugGUsI0hGcA@FV6GYCPJ69>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Mon, 19 Oct 2026 09:10:31 -0700
X-Gm-Features: AclHuK-94VeGPXxFeBfuxcNfO58AYvUbUlLP8AwazUPyHejofcyDyE2ymf8gT_k
Message-ID: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	roberto.sassu@huawei.com, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:08=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> Yeah, I was thinking about this and went back and forth. In the end, the
> only reason for leaving it unbounded is to allow multiple independent
> users of the same register. For example, IMA and systemd could share a
> TDX RTMR. The systemd side would read the journal through the
> attestation device and the IMA side through securityfs, but both are
> views of the same journal. If one side truncated it, the other could no
> longer replay the RTMR. Isn't this the valid usecase? Do you see how to
> resolve this?
>

Bright minds have spent a significant amount of time working on this.

+Roberto Sassu, +Mimi Zohar
IMA logs and systemd logs are both system level concerns that are
relevant to the OS construction, not individual users,
so I would just say to reroute IMA to use ctlv using a kernel config
setting, then make systemd the new system manager of the holistic log.
The securityfs log contents can simply say, "log managed by ctlv" in
this setting, in the form of the template identifier.
For policy violations, only the 0... extend needs to go to ctlv.
IMA can still keep its violation log as a ring buffer when it's not a
1-to-1 violation to extension
https://www.youtube.com/watch?v=3DgyYUYbdiN_4
