Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812944;
	b=bq345lsPwE7G5RNbl5mHN/hluBvZ1vdQzZ2xskQgjDNQrPa3Xu8ixG7LxNnRRIyMwI7B
	 5siWj+k8ftar2F+VR6nTJkf3rPRZM+0CjbFmJEsMZZSM3cqmK/8izV9SvqTz12qglJn0j
	 luJD+ekwGumP+MiT9NabxPA9apxPYgrt5FhFXKRUmkbhuogq9kjQU/XscuMmiVniN7noT
	 Jm/IwqRn44cOva/cngKpug8n432X7EQav5jQ9l81Yg+McyH75uVSaIz2C9Ws2/f0UA+Y5
	 Ia6KSv+ZgLSIHaVHUHPPa5QcRqJG5SuvDDhefGcjWnNXal1LFsX4wczIqP+u9suD8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=trCudkRlowf15KXENTfDgxDj2b+EYhikc7lQRV8B0y8=;
	b=28y6opuW96V8RdveHrvZdZBWGfTFF8v9Wj9qYMtyVP008w52Wxg4yc0oZHErrlcQx0H2
	 IoPoA+putkTTRyTA1n1Cc34teLa9rG2LjGM52nEYQex8FZt2cSMlqA4t5CPQaAFZndCLU
	 cYN2eRPibjf3DJgFk/aQ6UpglO+7/MHkH7OnJ3USOJ1JXqNirJ9rznim+zZH+gh1wUUa3
	 /6QOP/hFW232JPUjOxYH0zTI4yyhQDT5LwsVr3MErRfZQ1owpj8e81V0F3y+mSn3jXfAw
	 Jjxa3RFGwddUgAOsOn0JnSiVk4Mlmfuu+Jk14sAQb762DcvZc8WE6Fpr6WUKZoOhk5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PC6+0cdo;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41723606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41723606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=PC6+0cdo
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5364648ae07so8592451cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793812943; x=1794417743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=trCudkRlowf15KXENTfDgxDj2b+EYhikc7lQRV8B0y8=;
        b=PC6+0cdomG5vROb/kLHJXErM98cBbYg2LDk3QMVqs3tgW+MeYmcAt8D8Lw80tojkt/
         1OXfgL7nlz8UbSznmRrrZCoXiUBswTXbHzZic8VJi5U4V3RBSCsL7vubZNlaxEI2u3D3
         2SbqarhrEhewIDDsNBmEXANEakDeX+DziPUOIuF3Ilwg2ZuDU4IEkXpdCAW9S6N6Nvkr
         Z2hKAy9HzQ0GRHj3ilAQ726MEqZ1+23842XHDu8ChfFw3rtImkuZZoFJkolBWw/D5Sjz
         GZYbhJRfYLuvm/HXLEdM9ZzrKoU3Mj96r3cDMTmZUbPsCimWJQFl+LdmtZH4OC25LSgG
         pbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812943; x=1794417743;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trCudkRlowf15KXENTfDgxDj2b+EYhikc7lQRV8B0y8=;
        b=jDhz/4E3STFyQpir6ehOqDYy7A3fxB3g38kBEtPRpL614rM5Yh73BgpRG2lN1Ah8Cy
         OKhCRwJAWZYcWq7CL3RLsRDKFAa+RtJx+3YCsNqhTCFjFTtJwwddywLP9SRIKj08KZzC
         o3iS+rGVOXIsMEF0dAjxqUjJYSPFg2OsjgGV4yseBCgvA1eyvtO027KwJ721PKD1Teg+
         U8S1GaBmGsF4LLMRfQAr1AtZVdQcKtJmxyBYW19V+Ii5QKaFrWAwly2ZVGK8wRIuVwH2
         bg2wbU9IfI/JfBX0igGMwjO1PdVvVluxDv7kxum5MDYpoLeHpnUTRjuc31AYr5GS4GSr
         97+w==
X-Forwarded-Encrypted: i=1; AKwUvBxOz5He52706nkszMJ+ci67k/Ge0uDUlPxf42aiSVcRdoMGulWTopCFgRCoC2U6q5f3Y//8E781G716Iiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83zpy4h2RMu++0iPmMJlv1e7t5viKdG4TrtUMSyEMmyUpY8who
	Q85uwOgJ/sWQbdqTKfoBw87hS73DxJhRY4KsUqf9msREZVCi3XlTOIM32WFDvjtXdcwIlcCZ7sJ
	CV/nkylW2og==
X-Gm-Gg: AYBFou0QS5uT4RM2tXQmfBSIt0YMyULlgOTjq7+e18VlbDmsc8FghMbMW2XZpmW1uLD
	4tIYZwsQO1Y0neVMdm0n3PRYcF0INv2p9jU6kl18c69u06jNqT8+gJw1OwZIQkn3NHQxLP0g97S
	03oeky72otW6HXY9p4Bq/pHxUyHt0yPZMxYkwO2uO/ktYIYP/V3W4fxu+YIquAk4bkThYi/urh0
	CfME0+WZ1L1pWcCoU05ivYSqXeSIrdCXHYNugfcZSsp5wSN7Fbd355ykO/LYCvLhgVdwR+pnQem
	ktnwX6OSMvRFtvt6TYGZsApFXJMcSuAsGH0PZtAjzJpyjsgdeRvSQwyNP4XhHorqW/P1vsoU6vB
	YO/MExrg90y5jKW+swL0EhqnNseGOS5OG9LJtvh60IzwPVZsRVQrC14ug49vnfCdKzQogVW05l2
	DXfwXG9z62wqJl6Q0QDq5099/+MUh7OI5tODz1gy0iZNYHqtUGywfCSKafiaNg8yI8k8424WI0P
	Zlj2Swbe/JWk1KRUAt5IPCW1d0NWI2JmJGXybLaOnuQW2DaF6mY0C8J24bwXDCKAwTpwUUg3y8Z
	B8+iDty1tEoi6TtEpykKTs/TfQ4Aql3ycF6K4LqrZ7v0Zw==
X-Received: by 2002:a05:622a:480b:b0:536:7dd:16b3 with SMTP id d75a77b69052e-542b86e118fmr251024031cf.75.1793812942892;
        Wed, 04 Nov 2026 09:22:22 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100af507sm29121651cf.6.2026.11.04.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:22:22 -0800 (PST)
Date: Wed, 04 Nov 2026 17:22:21 +0000
Message-ID: <b9d94891c6bbb0a18176424eadf6ff88.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>,
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chengguang Xu <charliecgxu@tencent.com>
Subject: Re: [PATCH v2 00/10] ovl: only sync what was written through the
 overlay
In-Reply-To: <CAOQ4uxhWy2aQV6g7VJcV+NDLPTSoGyR4Rag8uvAwN=LWnApaJA@mail.gmail.com>
References: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
 <CAOQ4uxhWy2aQV6g7VJcV+NDLPTSoGyR4Rag8uvAwN=LWnApaJA@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit

On Mon, Nov 2, 2026 at 11:14 AM Amir Goldstein <amir73il@gmail.com> wrote:
> I think this is over engineering.
>
> What is our goal here?
>
> Make overlayfs behave better for the (many) containers use case.
>
> Who in their right mind uses a host filesystem which is not one of the
> big three?

I mean I'm good to say if you use something other than the big three
you're on your own. I built it out this way because I assumed my
attitude of "I only care about 3 file systems" wasn't acceptable, I'm so
happy to find I was wrong.

> Please consider the attached patch.

I put it at the front of the series and dropped the fake inodes and the
hooks in the ovl_do_*() helpers.  It's 8 patches now, yours and v2's 1-6
and 10, and we only track dirty inodes with fsync=relaxed.  I'll send
that as v3 once my tests finish.

> The heuristics do not always get it right, for example, ext4 without
> journal does
> support RENAME_WHITEOUT, but it not safe for fsync=relaxed mode, but
> this is an imaginary scenario that nobody uses and there is config/module/mount
> options to force the legacy fsync=on mode in that case.

This one actually works, as long as we keep doing the last step of
sync_filesystem() as well.  Without a journal ext4 puts all of its
metadata straight into the buffers of the block device, and
->write_inode() does nothing.  So ->sync_fs() isn't enough, but
->sync_fs() + sync_blockdev() is, which is what the last patch does.  I
ran my crash tests on it, whiteouts, index entries and the work
directory all make it to disk.  I added "and write its block device" to
your sentence in overlayfs.rst. Thanks,

Josef
