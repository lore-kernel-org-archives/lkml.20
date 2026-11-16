Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847627;
	b=ovuOELH9RlOCXn17v9ipMsBv5g0wBoyJv5aRYyfVO0AAFJZcjdooob8t95Vm0SM97mAi
	 OAiUdDSy/fZWH7IngDO3SfrZfsktz/n9FTOp6hMr+bVSGW4A/RQV3p8JBqc/U9XEN+ego
	 51kS20Yc568qqsn+zSN91sjchKQTO6ZivrO06dvvhZ65MPWV8Dsxap9W89Y2FmPU+kTut
	 fTUISrODiv/c9C0qcdXAelU9bktu2/OmcCKsy7V8guKm+eqp1235549kr/a0Cj1r+7VBy
	 q+M52ZqOmmE9yL9z0lLXYmGLb3UnB4azcdv0jmPFqC2zMnf2bo4jMxEHXg884w+p+6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847627;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=;
	b=jeIGBZ9yqcx0e3uw3hkw2bV4je/rbndVmDC+a22LeMMbxQ7uwaN9KZTjVzC7mjqFkiiG
	 YmMl54f9fc0Z2sEWMWNFdbDPn0mUpSTD/mzUYUoctp5w17p3hWbvvL81vcIB/gcjj35Y8
	 4o+URsDnL9vHqlkP6jfsKAuULUO+y/UHWD3woywdCebnMufSShEd8EwP6ceXdC2geyNxr
	 IG+UuBDr+c7m8A93NCc2dQp5Wfa8am77MM0CRY9sYoYVzSM0LhrAPuVMYhOa+q3f63MGU
	 PrX7Di4MSkJKguvw/ggWxpB+7lkEA1fQdo7IHtdMBNgSVIwfWazIs3jzhFPBMf8PhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NWbACTL5;
	arc=none smtp.remote-ip=95.215.58.185
Received: from mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29544606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29544606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NWbACTL5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794847624; v=1; x=1795452424;
 b=NWbACTL5TjFUpQcCV5hNKmYqRw/SogWUQ2GAgjyCHOV+ll6+j74Nyt2GwVPLZxTIJv96X/Dn
 htA90sl98AnFMvKNM2dvz55WFxZweYpkgRb+vK7jmxpP4lgsrh7ZvKf9T59o5zxjVoJa9Vsxm95
 zNuF9czddpAQ2IxCWDdeTkO4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 33506e9f8023bed1;
	Mon, 16 Nov 2026 16:47:04 +0000
X-Mizu-Trace-ID: 33506e9f8023bed1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be58ad9600so11743e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHucPdNKNT7poxv4iHNAmEDnwAGTBAWGQla50c/Na5lLZTxMFDPUYgu4Rhie5QANr1j3rApMpinZZHLpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xu/qhG6xwOsY9wSWtgReXlDVKlCp9BgZPxDMJ8bpaEBGaX43+
	pYdhddoAGiQWLnRgS8MKDW6amxlBYWzqNKmRS7x+vMThWP65CL1vFIXcA7dj7SHLf01nxnPMffF
	QLuhqZOpH5W2rnyjrne7IK5aZXxOYP6OX5PcjVWa4
X-Received: by 2002:a05:6512:2312:b0:5bf:ec8f:c361 with SMTP id
 2adb3069b0e04-5c17e46b73fmr254876e87.14.1794847622967; Mon, 16 Nov 2026
 08:47:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com> <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com> <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
 <avsygB0HdGxR6psB@google.com>
In-Reply-To: <avsygB0HdGxR6psB@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:46:26 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
X-Gm-Features: AclHuK_WgZd3Hq9hZ3t4qbB4b45pul1ULpwp4wH19UYyqHf6wDD32zLK2i7M2yE
Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:42, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> While I don't disagree with having the memset in CMOs in the guest, I still
> believe the hypervisor should do it as well.
>
> Linux is not the only virtualised guest and they all should be able to trust the
> hypervisor to do the right thing for them, which it doesn't.

I agree, and I think that that's the consensus [1].

This fix is for the guest part.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260923130031.GE1540250@ziepe.ca/
