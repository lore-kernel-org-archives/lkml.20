Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847367;
	b=txUPsDsGUAE6Mhomhch9/9RtTtpMrR56BsiUStssvg0l7I1tx3UqVSHMuM6tahoutYRJ
	 3mbKhLMHnYpHL3awWG5ZUrbPj+NopmI1OlFUaMLNIV8kP2ISbFGCOcoeE5Z1ftLDvUZBR
	 z8N0rnEDykWjMpgGCP5MfnL8e0+epQaatGHM2rseGMXZfx07j1kwkt11zX8DjPaDTZ777
	 YR0Bq/7mYtPGDg1npLeQ2mkWEW8t8YxnQPnmLjHAAFCjhiJGWD7YmKAs7UToY1q9UAcP9
	 P6wTD5fpgSka/+tsXqMp9uaYQPYwqC9hxoOZdBmlgE9IC14Yxc8Np6kZQ7/hkDVO6tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
	b=4SU0DYuX/71yNgnucW5ZYHc9Mvp03/82tMmuiDh+zRw9iCbyxH9YCtVHcYnacQnw+Aan
	 /0ajxCXKbitbFgBG3gZ9VYDu2HHvPH6a10CEPHqPn6Jbt8+ifv8keo+T9bhAF/bA+iqO1
	 YB8z9aIV8PKElq5rsQNSp1dX02qstDplCNNX70h8DN5Doha5C5TU6u1bMOrzmDuZS11gU
	 nCgpssTSh08YIts13EFU+3wFA6SbiysNwvU1V+QckiXYTD7wdX+CAFKlhkoX9lrZ0czgC
	 V7bzGQ5wQAAl7NiVN9PzvcNkZy4MVzu/XbTTPKJ/EU+H8aBwwlvJjne3qPtWAIak5xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5N+PC62;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C852A606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C852A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5N+PC62
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso218075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847365; x=1795452165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=p5N+PC62LG0ulJMmh8Zj20CTBBsfskyu0ICZWvennkU5j51rdfItRqDeP2wlMv+rza
         oTBg2iqEuEFbz1FvSROSL3lvUiz5o99IeeTlq2rwtYEGi1pf6edcXzmnFotC9raiybiq
         +Gko6/ey2YyWwp5p50fElSwrKS+5GHvYlR1a7aC6B0LFsV1T02BZK95BPhYLozh+R18b
         qHNLG+ppjIgq8LaCyIBpWhq2/mO+aocDwWeaehPbBBVdLV5p4KF/86rpYlz74KJWjRrC
         rKidTu2PWOhHfO7i5dptlVNNuQfbjDe1QuIfzKocJHnXsrTKV35vQlw3zfIcbqDxJffh
         0wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847365; x=1795452165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=yo8xkXISEE6DZe0mOpZEFQ0SqaujiW7UxyQG97/5eFx1DZEdFYRBNCdANzgjNksMRN
         UFWeyxxi2nNVmKk58WiCBJQBQIvbneE4aSSxLy+4m1huJveTbNIAxmCTvokyDJjwN+og
         sPMlbEmgASRUyIwZInxncWKDBj4VIt6QTcEiLzbeTNmB3JoLHOzib/2X03c7mHrmeOQm
         DCU0elF7CozCsRtjMzhjn3OwLhuwZsIM/m+2XQAwC0w9kMRe5e7dd2lMdVGRWrVIZE0B
         IF1KUDxoRxk6+2yTDPcdXdResm0pHqUdWodfiVVoXtrfIaZW98rHoKMy8w62AF9Ie4Xu
         i1fw==
X-Forwarded-Encrypted: i=1; AL+hErHOtuCJHZfEse09MutQs1VPEHECqyCKWn4XepxkFqEWdPg7+ySV3ex7CorwEtY4O09A2cdqNO/VmqkczKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8382aeHx1oNj2VGgBM2ryAnerpGzMm5KE2JhO/wSb9e2c95wsO
	+cNhqjAbYPqO7XUYpjYfgohG0qiTNdGKoNbEzAQiRTrb3qbmRPxdAPIISSD0CnI2LQ==
X-Gm-Gg: AYBFou3EQrmMNLsoXUhgmllztpg2k8Z7SSRS71puL7DXz/68RF3jLDg1r041e+RhIk6
	lHnkycdNtC7AUx58nMbZkVUsrUvpwUJ9rTMWV9Aukcn8HzpbbpiiMBFICwdcUTqVuP9WhJhuSWz
	iC68/W3bC6ZY0G/LXggI0UPHmJ3ZNa9+WD8s5lMrlWouJAqPFCtW9hjjKOe+niTXiE3S5casse2
	c+8BSgkU8a853OE4NwWCOJg8qIXyyTwqIrdai4AjTTojEwJb8P9Bc7er+tkRx6ZNTaAapq9YkYr
	mD+0c7zamX124cVTAyi/sABG86x3z2VKc5rs8QPpV+kiLaLHk7DAUjoI2gV6hOI0l8aKlloddDp
	K/TSB+DE4eb4ZpQSbiG11tE0pr0yNKzyo6STRSgOpXBBadZdPjEKCnix4/DAYeL6OKCshPJZIu5
	AWShm1/gAeKrh1K4N/j659eUNTxMJ0x4YeVosGRTYtu2qYoWlf0b37L+h6i/s9SCQFJa16yGVCl
	Jszt+/a7HfTJfwMwjWkysgOIa6x0PrbKpmeXH6lxUDKuq4SRMOXqOtswx8qkvnpBjXDfsJ+0VCp
	EkowKBou8C4l4soDsNrY/1enGaxzCXKBS/4TicVHBXnKMLfwCup0pVxgFSQ25JLRSMqoTqHntdW
	MDcEx5/K8uGg=
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr1312695e9.3.1794847364743;
        Mon, 16 Nov 2026 08:42:44 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm791855e9.7.2026.11.16.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:42:43 -0800 (PST)
Date: Mon, 16 Nov 2026 16:42:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avsygB0HdGxR6psB@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
 <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
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
In-Reply-To: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>

On Mon, Nov 16, 2026 at 04:32:40PM +0000, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> > we are only changing the software bits, so no CMO. Actually I should have read
> > the comment in stage2_map_walker_try_leaf() more carefully.
> >
> > That said, I wonder if that shouldn't be handled by the hypervisor, just like
> > hyp_poison_page() do the cache clean.
> >
> > That would be slightly slower than letting the guest (who has a mapping already)
> > do it, but pKVM is enforcing isolation between host and guest, and it feels like
> > it should do it by default no matter the memory transition.
> 
> After the discussion on the related thread [1], if we have the zeroing
> here, we need the clean here as well. So I think that this patch is
> the right fix now.
> 
> Cheers,
> /fuad
> 
> 
> [1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/
> 
> 
> >
> > --
> > Vincent

While I don't disagree with having the memset in CMOs in the guest, I still
believe the hypervisor should do it as well.

Linux is not the only virtualised guest and they all should be able to trust the
hypervisor to do the right thing for them, which it doesn't.

-- 
Vincent
