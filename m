Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993794;
	b=VFxRcFRyE9zfLX5yZJIxSYKtugaEZXRM2WyszLjuDbFqMIstsqIDwZuA1bV8gML/ohCR
	 t8rkhoKaDaOdz913Dlf+mulc6rPUeLAGzPL894dEgzAqoqbkgk82tzWRNIEWnnXD332aW
	 ZNe5FvCtriW68r/09bbjfZeU7+od3RJg+HDRdhZ9WCw55z09tqsgUo8ICoLA7LLVoGkTV
	 OSvZDQgueFh5MIJmeRthins7mt7z/oqRc+qX6rVsVhV6IkJ0b5dv2pK2qV7wm8c/4xIru
	 XmF4apYF9dcqd+6+TIHQWKHv5B+qJYvCKWNEAVm/fgIxdVwKWud56nVcnOKkfqjsavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
	b=K442TTAMJvWJjsxonUCCR5QwE9NhQKYos1dow1vTtZA+EE+pJE4hbAIcsSksTfkg9A1V
	 sK/tkEQNUmBiCblQFkAaI6Rgp/0arZn1cwVQJaKwEjPX2AsMZW6jhwf7Ul3lLuQd/JieM
	 GYG12puvlASym2Jja+eoyoNXLin820V0mzo3RIsxoEcuZZxvYYBbymT1PD35o7ylp50Om
	 6+YtlBIxhnuumREABY/kE1lUOqqqZ9Kfssyaw/8CRg75Zx5Ah+j5JX9Y4LhguxWrly8w6
	 0pDJ2wlfUBs2OVX63CG3plZ8abgn5DuAwCZekTv3pY23vBsZpzuLQnStLMqUFVXAXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1BuyCE1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A86606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o1BuyCE1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13173115e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993793; x=1793598593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
        b=o1BuyCE1XG24Dlq/X2dz2XudBhRvGxFhosS0el58MNhKLyx6B64bPE9p0g7MNbQT+i
         CMb8WVNcL8W5bOEn9weiPhHJhUmcdzH6LnQu9mwnph26b2L508uS940orkPSE5aIjsSR
         B16nZU17WOyz7JKRimEjGWRu2UfCXLQuFRALXZArE170WKAo4VcS8eFyoz+erOwIqGoR
         7L2BaEOk651Xw0FXPFp0Ikw7P7MscSY7B2ZRShgf3fgU6udDD4VfOGLsUPoCU0AlaX3w
         b+U+LMJmz+1BK4sysaho1rWNlmLOTITIBorsmg86Xit26w2qFBe91oqJfW7o0u0+y6H0
         bRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993793; x=1793598593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkdqs/NrPzD13Pv6TZco/9L29+yn5yrwdhhFtX4Hbpc=;
        b=zUw04aDLNloD8MFKeWKdME6MJ2SX8NlrgirEXQNI1rOHg03pcyKgWO43jiq7JcOIZ8
         PhLzCCvMJcKomEmhwOCcXdZT3ew03IUP0k/cYaJW5DB0Xp5ejlDL8oNqcnDcWZerrdXP
         IFvUNThnnewdWdonMyxhv4emwBAYIjVRSBN5y2yjyrBDhl/8fyfoyjup1URJzcoYjGVY
         yFJyIYH3ZeEPvEKphkfUUZVhS9/DmrYP1JpoBOwbaDfGzqTLtsYSRJEtXXU5OZ93/2Tm
         DEBdZzNyu98aqEBcfQVS3jJxWlrXuzz+Db3kYl+2nIzvh/XujbUnvjxM4H+aPLK7ni8/
         bWQw==
X-Forwarded-Encrypted: i=1; AKwUvBzBmHtw46cG3eF/AqBhzbpRomsUFX5DEwEv9Pa8ZUMiYVoo95+Ku1gAf1bZk5asgrPGotUNWCPJQOpAbx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNhJrGhFpkhBIgaXO3PtxJUmyDDliSGG+iphGCM9m++5zO/mJj
	NGjQurdAaXJiYfmiNggL9tx40AhwtifK+/A+9TVyozCB/978gpX9SMIQ
X-Gm-Gg: AYBFou2/42VVygSgf3ZcY6CaGeboopfIZyTvpqt8DrllRtA+f4pYmGNVODrrSBS9fWs
	O3GLuwIjctjJJl5X2SDkMnUf70YuQyEAQ+KIyqEUq5zuUrDKrJyvU/9U3NpXFd6GybjF9lcpdZN
	dMQxmjv0giDRhjHgAbzDhiySV2jUyYweHmgbaYA//98Ds96XJUWMQLBvPy/GdiXHj/meXOc058P
	Rifz+0Qvy8DHX0W373xZ1dnBM8Gcb6K5npyGX7AqbK7kvWkwTkuokgDJ6RiiRKFWuwGGTOP8enW
	sPWe6yNtg66T5YUj5EZvnj24hBVxSQNJHNYCFMl6fh/uRHctjic1vOnZLu+pm03vGc4K5RuQOEY
	vX8Y1qeZJnZRUKvLiQ8Ak7eBcxMNK3giQ85xwPBXft1PGGuUartjPSrOis3FliWJX9xEcUtD4yo
	K5ushOiI3SSAitH1+g8n4IhvyTTVuxOA75s9xPEwSVUq/BSDM8PFt6M2BGVG6veIbefTNpcWD14
	vPRrhba/auAtrZytDo8BJL6FcHCYD08IQju9MbcTMkFMzPFxim0
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr88675875e9.23.1792993792435;
        Sun, 25 Oct 2026 22:49:52 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm134644205e9.3.2026.10.25.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:49:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 08:49:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Anghel Mihai-Alexandru <mih@ianghel.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager_module: add missing
 newline to sysfs_emit()
Message-ID: <at7p_FWu_3leali5@stanley.mountain>
References: <20261025205427.259512-1-mih@ianghel.com>
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
In-Reply-To: <20261025205427.259512-1-mih@ianghel.com>

On Sun, Oct 25, 2026 at 10:54:27PM +0200, Anghel Mihai-Alexandru wrote:
> Documentation/filesystems/sysfs.rst recommends that single-value sysfs
> attributes end with a newline, consistent with other Greybus sysfs
> show() callbacks (see e.g. loopback.c). The name/vid/pid/intf_id/
> ip_devices/op_devices attributes were missing it.
> 
> No functional change.

It absolutely is a functional change and that's why we have rejected
it a dozen times already.  :P

regards,
dan carpenter

