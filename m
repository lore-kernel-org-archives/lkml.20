Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792869420;
	b=aVDJ+XeRuzmF6TEgh0SHJPrOPE+VkBglpvEZmtxDw2klrs7+2rcY5uCOIr2YUe9sGcOa
	 xutwnklN2beVaTf8bZboffY5yUQXsom4TstMHotg5/IT9dpCHIh2ETrbHlm2y01YitmLR
	 +tJi7jHzfT3jF7tTcgjlcqAi22zZnENpSWlOgcOQQ75qpLFAhgmbrUzwHzoQ9pF96Q19r
	 MnjlXvqVMqmxzMLh+b+008VOlIyNwv3MB7hPHeFk1YkWBI6Brr7gZxKaCKwE78dp44XiB
	 gERrNg8JRv0Or8lTqxbwAIOY/glDcEawa7Q5bo0zYVLrz17Mxgit6pjQyFFRWlEtj0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792869420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=lKFFsDPJi43yOKcVhD1KfWpsA5pIZBGsoSSoZl1wDJc=;
	b=uHsEsc163+socorxyytYA51lvwVauNCc7/n+NHqpLFKa8LGN7b7MRYMo4mdOyrYxgYzB
	 cPfDZIdyvUI4tB0G2R3UhDYG3nF06iWC5z41efAXpu9Erpc7kipxuLUtMLvup7d0GiF/o
	 1+FgbcHcA2AIE81JtjX2Z5KGMjbshjHdgazZAxOZnei6J7YCvydqI1DmNo6B2TsVMXQGX
	 UE02RVdVrj4kMVgv0EOD01kXto0mFD7rjxYHaMcThddxl3ujrP0d9EL6BcJQAcakFg+5y
	 xT8BDyJ6kpHfGlnAdN6Ip0xgUVJyoeqE8BcT+OoBoraa3ZihCNirKOH27w9sXdv+5RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QgKIUsU7;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D5606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA6D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QgKIUsU7
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987b4a710so14882055ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792869419; x=1793474219; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKFFsDPJi43yOKcVhD1KfWpsA5pIZBGsoSSoZl1wDJc=;
        b=QgKIUsU7aew1BGoiglSAO76u8KjLpLQHZwFy2GP5rPKDP0kC7FOX0/AN4a9beYGPTe
         IP3f2YK3E0xtDj0TnQXttu9rcpeXHwLv3mfPOaIVoX85qKETm+v26xBQkT9xBN35fFNW
         H3YdXsbK923tp1dJbv3EvDxBPliC9xn/8ujRqBl+fpOMZW6ZMPG7K8tZOoeWrCWvtITf
         z3WNrEWLr7UUgQYrI14C23gJGgQk3WYNVGnWOXtj9EUwKzF7V3FLS7dYmXj2OzP6MlKM
         Jj/2h0aF+GGYLrK97gMQRPuL4Vx173iOOShowkYbu0MPsacc/kkPs4kwVgl0595jc3dZ
         12mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792869419; x=1793474219;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKFFsDPJi43yOKcVhD1KfWpsA5pIZBGsoSSoZl1wDJc=;
        b=DV7eXj7wTQfGZGG0ZICMFxv8ycvaUyEsQ5uumO+HM8r3vE2UB8PmC77rO23jwX7IPy
         sST8iGSxRVxT6h2AZ2b6mnxW1g1plYH4PeXd0ZhyEk2YbndzZDhc1mRuUaLA/Z8bCRlH
         P6tdIFh6oqG4EfrJ+c+DSy9eQl8wXwF2v9zx8kMUDWYVJNOUGXx/C3FqYNm5SMK+kD8p
         rHQocB6R9OBfT/NW0MnOQkgnjQBJWHj9bCbNd/AJgTXqH1RH43a4GZaTd2fyCrBeIA0x
         p0ei4wK5HIE1p/ecYSnThxwHpG3D6zQSHBVUjfy+il6k0l/pfznG54HCCiFI5RgyoYZM
         TJzw==
X-Forwarded-Encrypted: i=1; AKwUvBxuL8WSAlo4o2m4SMoef0rk50Z22AJO2hFeujYlKFgprtC27XYt1hMEgJ7ho0SL4hnojaheDXkSZWr6IVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzsBS8xt9dYH87cQLuZQPc+t5+tO7cKFN6SitgC+mJS/3TQWBk
	0pakoF4eqB3NnNKBCnI3BZH9WawknkuEiy2/bMZ3UEfHzmL1d4gXsgsU
X-Gm-Gg: AYBFou0ckJ6qjhesRrkj+ijEMTHaMHXRHgkGSWiAXdmbDDP+nph0gKo1t4Jz7MqZMDi
	Q7yiA05Y/IShvJ1uHqni4j1KDuQYJCwXqAvYbiWJHe8Tt7ycW1LDgZUM9p44liVZPcZ+Qt8Dsjb
	0SMt/MP/ftGZ95DSRSVAzALsUjPPynIoTcFLIapuKTAZSTrdI5aBzosZ8Y7WcACKrAd9G82Uvza
	2Lrjq6wBiuBcc0OZLDvE5QJ8L9nvBcSLeRhpNFQfEHZs3dJN9jTOg6WiYHLOHzPI1leISInVV8V
	H0Ne0+bubgBA79IPdP/UKT/VR7RpJQc1sX+nMHyE8Uyh0WI9rPAdo/Xcq2Y5uN1bm5Rgyqz3ncj
	QPt+xpoijvoVuXQaTC69t9fq9vB6D+zHwE7KHLtcgchKqNxVnjsHPMjQb2nwXMHp7wwBYWjn236
	eSlnPLpLbMJDfYfchNgmg2q2g3wo5dr3t5rzUyb/+ur0saK3jRIR0e+TI2jVa9Zsel9EchwB2tl
	JL9XRwk64olNON8OYoHwb0khyv3E0p7rorro08JciSKk9wke//F265FohyeG3qpaW2Db7epgWB5
	6GnZwuRhLLeQ7r+6KoxI5aESnX5XgqxZx9l+hn/4LymKmqJkLbiGo5FVrO7+
X-Received: by 2002:a17:90b:3f43:b0:3a0:2900:f55e with SMTP id 98e67ed59e1d1-3adeb5e5ba1mr1705897a91.29.1792869419155;
        Sat, 24 Oct 2026 12:16:59 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0dda7sm2125056a91.4.2026.10.24.12.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 12:16:58 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Oct 2026 19:16:57 +0000
Message-Id: <DMDB605R77PX.PQ7NOLJHOC33@gmail.com>
To: "Eduard Zateev" <hackerowskiy@gmail.com>, <bpf@vger.kernel.org>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] libbpf: fix helper macro C++ compatibility
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261024035902.44566-1-hackerowskiy@gmail.com>
References: <20261024035902.44566-1-hackerowskiy@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Oct 23, 2026 at 08:59 PM Eduard Zateev <hackerowskiy@gmail.com> wrote:
> The human submitter must review the changes and test results before
> submission.

ouch. did you read what AI generated for you?

The reason for rejection is the same as before.
You're stratching the surface without thinking.
Pls stop sending such patches.

pw-bot: cr
