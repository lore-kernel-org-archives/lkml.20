Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793320991;
	b=NRdNNftS8slFSIv0hwuGekxF6XltC4BCLpRn4DA9yMwSFFVPzpFliqO5dbHhuQ8dmtY0
	 Tm7kX0hQk5x3bF6VujZQ0tFvVE18RyFrhQhwmYVN8ab6jrkBLoVuD9e+6Uod7rqgLc8dA
	 fXgnJmx9zpFgZ5n+0dhhWzH3PIkISEyxaAu6CfNNL64V3uRq79Buz+0RtOm0KNfyOKy7v
	 ZtGwbNM1v0oMkIynzg4lNImky00nBAJBlB8Sp4zWAJABkIXfxVwqBuFybdn+qJnm9ueP6
	 5i1OrUz6rfJXHqXnSQkHPYSbxnxD0vK6AOM9dmA6c69yXHF9jvqAgOPdSnfT3FxTwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=A1dnHGd/ojY9RvLwvT0//fyZZl5qZJVT0RGCrdHRWvM=;
	b=oTgYxCN2Yd3S3jBS8exLYfkd1nvHzY8xRufJYb2ccPtyCaxuBGUFQzaR580iHfGpM7Xr
	 tuMa+VaKAnzJX2A59WFgEECo31nyBE9Pn4QL2uWcL7hEUXFIpJ+tCrxZIx4PgDql3g1Fn
	 djygypgHSf/TXTrTROouau9a/kJjjprzqsVxR9IXrWYnAefYl3saXL4lDSG4ejHP4qLNh
	 0yTs1207f6c8a+MaeOXzzp3zLIL4KzClcOGpL2l3hOSivhlG814D2NffiWZ6m3FkcT1uY
	 AbDV+xICiuxku94iQLbxpHael3H0+/qK5ZeClE3YIekS6Woa5Y4GG7M+a+owCMGpE9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Aedb/NaB";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FDA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aedb/NaB
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so248807c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320990; x=1793925790; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A1dnHGd/ojY9RvLwvT0//fyZZl5qZJVT0RGCrdHRWvM=;
        b=Aedb/NaBqs5TBd2NJHwP+yg1sFNUs4wHhPLWHezguaykBdn41/TV21W73NMixslw5m
         2Y3Cz47Gx8xmYjbMoMqw0MYfKhzWnTrJQiKn2T/zUhhIIcsQDfIUOtaiAA+mvI5DYJGA
         k4L1LVvbEOAWq3NxH5K2OgSYOZ6oy0MvLmNLOqYOsjfZFXEWqII8qHVQtHZGhaYtuhtz
         FU6rv3/IGHoHgP4h2Byn9Ai/oTcZXv209zimXpLsdCZ4P5eaR4w23v5pUGCzbWuQ+dRv
         7kMRorBeHbvpoGaYGvrN9SIfGkXNVXeq8KNQ+MYUfZhV5q3cPdfDv/cHZJnxtc+7PcbZ
         mSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320990; x=1793925790;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1dnHGd/ojY9RvLwvT0//fyZZl5qZJVT0RGCrdHRWvM=;
        b=ik/OwK4rQIkK1dUO1GRE7q+R2CLYyPl86eY1JkpTKdaunmXrcZLbAmwqC5Cve1fzYj
         ogouUG88YIc7kvpB9mY+JnU3/npV1PdvOyeC41ZkjfcVGWEiFWz6ziP8JO4QwZaTRROW
         zzKa9oPMIiURbt9CKmROgxirqn/cBdiwwKqrH3TizxXYReB4ErEu7X8Fh0//zJUzkuwO
         jbGPR51r3d07vXBQEraJYcOQ3agdgCNSVYSI27VXI836hl9kPAENGmsuMI4sq08Jw8h8
         LlCBHkiXC0e9bwIEKk/K/1Pj6zU0HlqFLEPZCbTjfsDRyYvZHKDDkcZF8bzUQ0oi3ncw
         ffZg==
X-Forwarded-Encrypted: i=1; AKwUvBx6aMx9HGi0ST+hWwATCFeYSXMlGM6Kq77YObPF1T97Yna7+NypxY3spKd+IRe1KHOTFXDqw/VaQXdPbJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJe6uNLyvEQy5/Q8MvXPyl5RcbowTusTkTEC2Z6e4YK5GoTV7C
	Db+Ep1SkogMSdd39P/qPsQynTo4bs7ZFMe595MpLFdwt6ULJimAKeFp3
X-Gm-Gg: AYBFou0LkaVTWaQIIWBacOraArg/MNzOQ+Dbm3LRoie08hus6bu2FlePhvmuUu3l02F
	6v+tAwgOsZfW094d7PW02vS1KDrDtUl05EKrmNCxblx9eKaNfEvSVree5EQMsy3y1go/99wyvBt
	V3hFwmyQK/+gLLXm7lXlLIdztjgJCLit0r8lsPSEEM57YPI1RNuf4NmvVdla9pCLxSZ23ltEQGu
	NvigIQPBMczdQ5Nb1IV8edoNJyRciXirZRJDRSe7K3mCFkG2oecYS3z0b8xqg6P4OCEN5niPpYL
	jt1Gd9i+sLy1mXc+xnqysCbGRittNL12kLaeck1aGwFfssqMi+wrn004WIaCVbx6xl35/gdCiWF
	Zx6wstcPQtbvmPDDI9qN4yQAFhsHerMQAAqVShHgfzhH8yj+o2EdMMh6pH6k/pMw4GB/ICq5+ib
	e4m2AqRiLAQJB8S3bDWhyx0Ehn0sgUUN05B4Lx+36RZahUQI5q3KcFycYFiMF39s0kmHNqrew9r
	rJYWkRVA+t2AGexnjiWdykB2C3xvLG+UHdcPDAIels9/1rA720jU8E+6CaVYTx6fEcKSi8j+8xb
	C0AgXJm8scn0YLWugUXaT3PiAB1HA0IvDkNrGOTLlrijFNEq
X-Received: by 2002:a05:701b:240f:b0:15e:6541:3099 with SMTP id a92af1059eb24-1ac5a0b8b3amr917862c88.7.1793320990113;
        Thu, 29 Oct 2026 17:43:10 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm2097351c88.8.2026.10.29.17.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:43:09 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jiale Yao <yaojiale02@163.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/eeh: NUL-terminate force recovery input
In-Reply-To: <20261029052948.2525048-1-yaojiale02@163.com>
Date: Fri, 30 Oct 2026 06:11:38 +0530
Message-ID: <ecd8vx31.ritesh.list@gmail.com>
References: <20261029052948.2525048-1-yaojiale02@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Jiale Yao <yaojiale02@163.com> writes:

> eeh_force_recover_write() can fill its entire stack buffer from userspace
> and then pass the unterminated data to strncmp() and sscanf(). This can
> make the string helpers read beyond the buffer.
>
> Reserve the last byte and initialize the buffer so every accepted input is
> NUL-terminated. Propagate copy errors before parsing as well.
>
> Fixes: 954bd99435b8 ("powerpc/eeh: Add eeh_force_recover to debugfs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  arch/powerpc/kernel/eeh.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Nice catch! Thanks for fixing it.

LGTM, so please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

