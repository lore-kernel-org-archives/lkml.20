Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827757;
	b=oBWCEyf9SzEPqTZn73RP9UPy9frfC2eOMtxnOdAaVZwIgO3uONQDvCLlE3mydhvICuH2
	 vCxn+ZbAmwSH8FR3kboFfF+HbLSoPttNweIFJqQYWWvs5117yoKOZw6l0M6n3fR4rg+1t
	 AZmTekie4+pIvC3RJH1mHN5c846z6Lcu9DUgR5oPjPspDHBcuDYKXwZMSQ2I/YixDSLTf
	 WhNS/cyqA1ZKlnELckUP+aCi1VxvImhRXPrwgNgC5Owni9mcCMhAcMQ6neMsRgGtVlnk9
	 LeqmwUcvfjzVk0suXZKre+4VUp4Cc2zeDP7bHGk0AViKJeCdif5N70qkVjYA8kCvxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827757;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=pMF2p6YcO2QVMQMOY4bKoxrfiTZxHw+eFJxoGmwi4ZQ=;
	b=wOJX5ayJBYrWh0wk+hbVKOhQuYe9SHjbrFwaTOFHnq8mMRU0MNVsT854s7qsjynKVNxl
	 NxQS43OCGj8t+tpxk8S6KqZRaLzDZwURbwVP/zKer/82xJ2lsvA+CrJ6GE2oyy8Ao+7rh
	 rXWR3T8yl7s+3ChDMcH1vxQ+RNS5zs/toZuph5fo5f6aU/hqMiJYRQzH06LBRbRzXj0CW
	 3pMHEFst3MI2pgB6gK303eqj5TVUTY9LHbnWuTyaaWKhBHJn/BAaiUrlUHPWziq9tqZpe
	 RktZPRns3893uM29EXelTyocIWNh3jOUvZI8F4TOg08kF5SY1UN1DXhl3Hr9+GHiRrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="jC5SUq/5";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N3hx1Pt1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7B7606A8AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7B7606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jC5SUq/5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=N3hx1Pt1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794827756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pMF2p6YcO2QVMQMOY4bKoxrfiTZxHw+eFJxoGmwi4ZQ=;
	b=jC5SUq/5vuITv/HRjyu1h/sxmjzoM6c2YNxeFbS45cXk1gUqFfKZh0lb4C0+Rhe2ihi+E4
	1fh8bg/8lk+vTqnBfLYW0WMXYedWWGYdHiJDfB0KqAL0xlY1b0KKEOFo5mV0AZgjLeKUqF
	HwluBuO8cA5FCO4cQ7FNmXVGftC8FTc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-IbgXt_yFPVC89mXRLEn5Vg-1; Mon, 16 Nov 2026 06:15:55 -0500
X-MC-Unique: IbgXt_yFPVC89mXRLEn5Vg-1
X-Mimecast-MFC-AGG-ID: IbgXt_yFPVC89mXRLEn5Vg_1794827754
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so25860825e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794827754; x=1795432554; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMF2p6YcO2QVMQMOY4bKoxrfiTZxHw+eFJxoGmwi4ZQ=;
        b=N3hx1Pt1jv9mX2bZ2jHtSWbPafhktII65uYXOMT6jdQIVQlhmlRhN8pqFCK0ME1rOk
         aut+QIr6rzPOMZ8CAXwReqY3ccZ61IsgeTnfIJFcPBBhiyOYjtV6DfeEWMScFSIY1hfQ
         GCd1HhRC2ylJVryiG1oe4WqI8dle3QmUg3lKtTpqGXlKGIIEdxIFhKRXyzUgKxqRpPPs
         XNjb17jSImKs9//le26w5/mrxuGiNsDqv1duBXBDqui7eisMUqWPSr7VCF395nT0OvjO
         UVYKGySQAFJPh5y6lsME20sVVhWxhyUdFyaKeCg+COUU+ju86ndcAARrM/AoRg4s6etd
         NMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827754; x=1795432554;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMF2p6YcO2QVMQMOY4bKoxrfiTZxHw+eFJxoGmwi4ZQ=;
        b=p+NCYtq8+SaEhLuAvlhizPi8fIj0fOh3lp5ewRf8MV2Xms7BSJr+QTT5R6hqsHRyIA
         MjxQPNQzfYjMB66jPRX4e1/4obhvGNdf7d7SRjSZvpXaTdqUmQ/WkTUpN2IY0CFr0Wsc
         HUl/5hf9F6UDs0BdDwII8cRwG4sybq+fdqo8nkqsyd1Nb4ccn7ELDyCFRn4/VIN4B8DG
         8BWF9wx4+b7jdi0pRoLBEKlDF+sq/nFwAI3Kk3YaRpX6lp+DY3SySLGnyEBKebFbWX6a
         wbtrBGJcEpq3MvBD2qZQE22RFHBE9/boZy5yqzPbdgkc1vu+1XKb7FbuDlnHp7KLPJRd
         dFAQ==
X-Forwarded-Encrypted: i=1; AL+hErGePMulfpc/msvMeruA0k4hXJcx+uRAsLuAtYt3CZ7+Ae8L/OXUKHJof5a7CDUiwyOAvOYeZ5RwxDCRqTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rp77kLDZ/QKKgXH+V+X0FBpV8tlhyxVG4g4GyYYHD12ojqm1B
	5W2g9y09Xtp0pW1kE5hu2m5YIL+BIe/ddeejAMkxYRLT+FIlHU+qPH+kH9+J5kEVNK80mVY+fBb
	hvnE4VeeMr07PJ+BRfiHypHf4IvLB0kYUjm4RTRAZdh10e5ygO0YxvoxFhJfgLTXPZg==
X-Gm-Gg: AYBFou0EEdJ6GDWSOj/OuFh4nOL2fCqqRJQNZyS+DtWqdBs3P/3CkT81K4KOpLz3KQW
	7jey0uVdnaNlR4OU11yUMnIUdS4oQN+2f3uPRLh/gIDU+An4/GnxDE+0Uq907Lkv60oCzdbABx6
	7I9LMzhHoKduWRL4uwNdejwIiJYtzgxyJ5zZl198FQ43Cp9RAbvVlh3RQtkS3sgwvR+UXDzrYem
	snx3dtUpXXUTZm1OxUkJtDZJvTUzQeovYhjTRgMB2IUFq4QfNFT3mKYuKCcvoQPE2g0MTTSe+G1
	PhkAYWuFBe1ibbfXyEysJE1CST5Uq49rUzUwk/mucpPLVdvyUau11ENLJgfo+l1y2BmIL78KXR5
	+bnfN1BVBMC25K0qLeezhkcelt0N/yeIYdCKvdzc5LLg7PHJYovSEJuYEeM2y4dFx+XNROFuENq
	K61AFzVpUMBBk+05w+pfgTlQZOsoPzfZ39QpDQ9Lg=
X-Received: by 2002:a05:600c:4f86:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb5fd19428mr163024035e9.15.1794827753812;
        Mon, 16 Nov 2026 03:15:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f86:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb5fd19428mr163023445e9.15.1794827753292;
        Mon, 16 Nov 2026 03:15:53 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb666a3ca1sm202154675e9.9.2026.11.16.03.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:15:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thorsten Blum <blum@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, Vincent Mailhol
 <mailhol@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Thorsten
 Blum <blum@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] efistub/x86: Use struct_size() in preserve_pci_rom_image()
In-Reply-To: <20261108152835.20294-2-blum@kernel.org>
References: <20261108152835.20294-2-blum@kernel.org>
Date: Mon, 16 Nov 2026 12:15:51 +0100
Message-ID: <xlv1a4n9rpqw.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <blum@kernel.org> writes:

Hello Thorsten,

> Use struct_size(), which provides additional compile-time checks for
> structures with flexible array members (e.g., __must_be_array()), to
> determine the ROM allocation size.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

