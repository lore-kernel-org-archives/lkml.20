Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314366;
	b=hnaYm4jXKTYQKcXu/jCCWrVj4LEp8V3yTuWX5dBkSWmoVDAAmYHbflagbr5Y0kFoVvuo
	 RXa5a6ghejqbEObsRXw6brp1Vv7ZEKIbsZBYdAdqiUlp4+jgEhcHX8rCzsA7MivhcjeKQ
	 bu6UzLNbtnTzwvvQL62q4Dd8GlCDXOkxd+OGopcO5o0S50UCNBHGaVyAJVsl+H0re4Ia5
	 Ahm1U1pmQY18neKey4e36wlLCmHZuoWdgg7Rl4jSBiHf3Q1I6Tlz7b3ZUmys8APX7ZHaz
	 5ML9IOboq3H19vyVo+zCVw/h2NwMY5JEiiQHFS95WGoEBdsc750DZNgAHBRiAGsc5og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314366;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
	b=QJ2NnjyckNIS40/S+ykhX2kHcV2yCUq5L0hoJG7Ss9fgmD2IoZXIgK8bu7Q2RzWCEDc7
	 Zv+zrIroZQ9g85elnwMPP3aTDVMcVcKgo4J79EVQVlf3NjWiDwcjpF/1TxInczJQoMqzq
	 r/6PMQ7/ZuhYWQapIZT/OTtD3WR1P/ZaPd6qhl30yrXmr4F9Js0zwEgnNnyL/2X4QN3uy
	 2WY2ecsF9aPJ/25y/MS2eI+z0rd9T6lkXSCXpa2UCNVgY3H9X3HdP2MbL5Fa3LXgN3F9j
	 j+UHLww5dw0cUHtZkkxj1bU7aQjS30gNMnnBroQ0YocASuIZtJOIsYQl23CUY7snZqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cL359F03;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AuX5FvWj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5760A3826
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A5760A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cL359F03;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AuX5FvWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794314364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
	b=cL359F03eNTqNFOVRuhDGFzbdZpEw7Q2bl2VY8e/7Gpd1cRzmZ2txxwaRgVxKWa7Qe7vPE
	e2ez82P1BSir9oMjMKX7QJhRQ3xI/3A9fp/WDvmWyE3rM3WVf5kQ8PCM/TKcBUmrABPP5H
	Sww4o+6MHNeqHM2v7JCY/MFCjZLSfEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-RAOPVPZFNgKaR98V1R6lLA-1; Tue, 10 Nov 2026 07:39:23 -0500
X-MC-Unique: RAOPVPZFNgKaR98V1R6lLA-1
X-Mimecast-MFC-AGG-ID: RAOPVPZFNgKaR98V1R6lLA_1794314362
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso15565505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794314362; x=1794919162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
        b=AuX5FvWjl+Me2dms8Ev/mdJ8tZDZAWDAV3jQ4GVnMddEGpvyNd+RFh9Xn0zO1objDs
         DurEA6siye4zmPHKbmiBlmglmVQwMUJxdPOn3BaIwCAGfYbr7J/C7C9k2yULMzOkcGbF
         890ImdV8BtAOiUZg4A1GP+se4Y+CXhg2uYeHpqttxhicPe8mudvma9AXrkcesp/J770e
         LcR7eDA7OPq/HGKt9iCXB5Kq7DLz7acfpoHDsQCuJXFq9zzZWcQS4cqegp+CermqH83v
         IlS4wmntcWrvna8oH9ef+mDOBbPh/LqUhwiIxC33gWW1qBvKNUTD+sDVlj3JnrnI4wJm
         YEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314362; x=1794919162;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwtPeU2sWzznNclKxCvFDxDPXTNBdV+ezO5+7hunkSs=;
        b=kwqCmmB3awTrrwCLDDpWOSznB42nhczfbInQJ0Wfk4sy2dHrvZNZLVC1eUGKXCjp2a
         WbbNIh38FzmotfoPe1ExTv/yeboSsIQoyEYZNTxZbP/HMwKYOGagJ08Hut3/wIUUJGyU
         jhVdwLVG1WhQnW/d0q5V/+XSZS3bft0QeES7ih5DDo7zow3yvo9/AjA9mjqjINt30vTF
         4Rc7h9GDqeZnPSShQiOW0MTHazJ52sisgQYal8DPYv3ML6laGrELd4vsfSW2p+yD/JKx
         aXNtjOeMaZTNP9SnlvpMqWQKbNxiP6DsIdHOHXHCtmtzEMXHmBIN9/LMZK3JYldMcpz1
         QzVw==
X-Forwarded-Encrypted: i=1; AL+hErGuba9CIjgwM4nTV6dADIq6ww5rNZ8xaJp9lGe9MEWkIyFDIVfWDqBO1V6VmXLkSqlNam8gAjzw8DCkXy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fR0SkHbOInrFeeky27j+6iH4cJOnD5lMZVN5Ck38W94oywlJG
	QXZJrYf7OT8uC6gjO7qAa56/gKCR8bXkQwIVDimnYMxD0YrGahb8ju+sQ8j0UkWjiOOJGnx3HoB
	/cdxjVzhabSjCGrsDxUooBYYEk/AeBx2yiiLNmiOwGxwpkorz3EpJePg6+zVhPRQQNg==
X-Gm-Gg: AYBFou334QeZJKAQp3SfK172XaWld753VLAloM8VI6bJ/CZavwQh+rf0WS6VBrNyrha
	23reNOn2gnk3ZLxA8Uj5SU7rPaqbPBcw+f5HN5j6Y9KqF1Oi/L13ytBdUiE5sekFHAoq5NV76T6
	LG7HhVG+UsWhMUkckZwAfQ7bXtr8katVihR6ey0ScUj69hclb7NqpsjX8EPQp8FlS1iObEdDv7b
	NuBXYF0aWI7ELHvGHgYRb7L37xWsJmuSrjVCXQKl+D1Ztsr/KqB4XsTrnqJT2fXu52beuQKk1lx
	kxmSILqWvAsC/RaNnLnnqYo9ALsydagrcgGKP7nppzQnnoayiPPy3Lvz/Vy+o3XB1buPYnQ1igD
	RQDTkOA4w/Y55/SBfSoEDIq8sDt4CWp7yOWxQdvPuOAI4q6ooo7aIP6l2qDOEoHf9rHrbIlrQVX
	0F/LhJ+HqHhkcQGBagkgeOV0Nl2Halz1SjTieqpKA=
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45491445e9.35.1794314362110;
        Tue, 10 Nov 2026 04:39:22 -0800 (PST)
X-Received: by 2002:a05:600c:818d:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ba023584f5mr45490665e9.35.1794314361627;
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm71937455e9.6.2026.11.10.04.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Devarsh Thakkar <devarsht@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devarsht@ti.com, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 00/14] Add DRM driver for Solomon SSD16xx e-paper
 display controllers
In-Reply-To: <20261019213726.4145532-1-devarsht@ti.com>
References: <20261019213726.4145532-1-devarsht@ti.com>
Date: Tue, 10 Nov 2026 13:39:19 +0100
Message-ID: <xlv1o6bweu88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Devarsh Thakkar <devarsht@ti.com> writes:

Hello Devarsh,

> This series adds a DRM driver for the Solomon Systech SSD16xx family of
> e-paper display controllers (SSD1673, SSD1680, SSD1681, SSD1683), starting
> with support for the Gooddisplay GDEY042T81, a 4.2" 400=C3=97300 black-an=
d-white
> e-paper panel driven by the SSD1683 controller.
>
> The driver is designed and architected keeping the bi-stable nature
> and low-power requirements of epaper display based systems in mind
> along with having adequate flexibility to support varying use-case
> requirements for the e-paper display use-cases.
>

[...]

>   drm/solomon: ssd16xx: Expose refresh mode as plane property
>   drm/solomon: ssd16xx: Expose color mode as plane property
>   drm/solomon: ssd16xx: Expose session management as plane properties

There is a fundmental issue with these 3 patches. They are adding custom
device-specific plane properties, but the KMS/DRM subsystem requires all
KMS properties to be generic and standardized:

https://docs.kernel.org/gpu/drm-kms.html#requirements

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

