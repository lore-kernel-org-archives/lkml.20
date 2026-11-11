Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387330;
	b=Ip96zaIv8N7helcMybj3svsABc+ipNZTSiDGgNyqg5FoMW9NseQQJmFbErY8x7ULT+VZ
	 j/WYEI6OfphQP3iHN4AdwmJ18w2KIKjqn9YRZDyL8rMsdZgjowWfk9MrcZohufBX01uSe
	 EOhzyZ6rWDxwdKp0mMVa5LPke4+WHaFKCeDWNqaiVUGl0v0siYfl1ETt7qYGKqT/tc3A/
	 xLKbcEm9ZhCHOW4uDX+NlwX8Fo0lW8L9sZKT7lJ7oCF6UzuyafaGhYFmlfx45xTkVRWPf
	 lAb4T4MtJgJ1NLEVHI3nvg1bv6XHGHS3uUQUwHTPM20VQ54n1m9b1Jb4XvBEsyEhUUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kDDtfgXUqq2vWe9vI2nmZQX9n8pFv6185nZlpnia/WY=;
	b=uRPh8xpq4db3nZ4Z0KPhrypm0yvN0lzIcL/EWrg+M91XQRsbtP9rnXuR/9Ow0m+AOAd/
	 RpIutIjpa5bH+M6kBBPFwYuceO+E3iHa/zxh3ntwzk7amWL+F0GCpW2rLN2ozFi+lfc5X
	 P85/N1ol/BKAP2QWjYBhL0vfjwjiEXZPruLcnp5FGGDWQtKBnFVnDaCuoK9n6yj/uRkHv
	 YIdrs5pUkFA/CIC0AWy0s1U17tvM7pLvjjSly3I6zxHvyWoii+hvUCEB5MPWFKahTFbGI
	 5dOvf6tQAHUOrSa99ii6g79wYEEM+tAufLMh1obFRk04vDSMcD1hpL5vJDzpLRb5FQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F34C606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F34C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1692006a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387330; x=1794992130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDDtfgXUqq2vWe9vI2nmZQX9n8pFv6185nZlpnia/WY=;
        b=UwA1nNpql82D+C/5YDq3wNiBossqLTUJlgSlcgeV/ACcVAqnVhsk/AmO/F20dhSUPj
         8zPCZftL1sF3SdxEtIWm72fMsTE9K6W3jghmAEeK7cKaJtA6Mwb2MqexgBLsJEyCnQC/
         8bIKYMcEh0iVxxnvRrUrCb/qN6KSESAZRKKB01pHwWCLxWvwB7v53Tjk7ddpqQ5BHQDp
         6m3Iv3p9n/gwsd64s7sEDciphtUxKUn7QahVP7zTWa0Hll9vV3xVtU7uNXjxPGPgzrHr
         4b5iEdBNIdlrQO25KYp1968wyvanEnUoC0LOV0WplD99QV8jcqC/nq2VmBDXX22HzROK
         0Ajw==
X-Forwarded-Encrypted: i=1; AL+hErGL5uIlgyxn66yAnYSt82oHhglqj5/ki4XWztvIDjRHXCqkC1I8anyP/UJWcerGU5GphX6tN1iPNXqHUb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gHpNgi5mzoowSCD+UhIXmvi97hiAGvJvfCWohEkRwvaAy0CRP
	Y9FTnr+Ltl4OJP4zcku6ORRqN3hwpYuwPEGQf9RmLSCgzqoB51oFs7VmHTXD8lzd
X-Gm-Gg: AYBFou2q5Lg2V/on79BOQMDfIrbRPxiid6e8AR490y4dulOTQYG/lm4yIWfNFaYbUhz
	PbqrJlRilKxHA9vUU1Ioss47d+JA5HHNt7F1y/MejZ3BenauNtwRc/f5r5mRe1an3qpAKp8Hchg
	ekU1nsRLvzI+Q0bO6AA/Zt99mbXOuodxTlc1snM1pVdU5Kl0QNgsw+QRdxiRKRb8sRyhA0q7pa6
	NyKUHDONWd8VPJq6kU5x5LA5AdIVNO7PvUhhNyy2XrC+tkugVNptRt+/aXsArKkFZfOda0VEyQG
	9tI38faOe9GJgQw3qVn2pnuUBKEdRmH5aRbSl0es+em/xztxh3r9TRuvd7w6uK3VDHV3JRNdov2
	0hJqQiijF6IILVlaUNAfSpgmDYyRkNyfmEEBMVK96lD6f91mPZ8P7NxZMTiNbHeHVr7UNIGm2a4
	YsJaALQsyrC1ObWricXCxFxzwv0uRuPj93HeXgRZrxQoRniun2oq1jiKuUNwOHhWLi7LokMurSy
	zIA/HYugzVFDz8IOM1fn0nWYb8j7Dp+5z6JFjdOkz5VXQHkGJE8tW3CGQS3nihmOx0NmOedvn47
	qV6eih1lqWD9yeiF5Hw59ZyB4uR6QohStOvPVOHGTCSS/Y2S460tPBExA89O+YhpTN6IuRXpMMO
	IH55Hac1kIVFfVCBzBw5g5a9v1p+EP6DdzHuvwmkLA+72
X-Received: by 2002:a17:90b:384a:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b182efeeb7mr1286415a91.18.1794387329661;
        Wed, 11 Nov 2026 00:55:29 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b186234c12sm1667988a91.10.2026.11.11.00.55.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:55:29 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e795af1d4so2478288eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:55:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFO3/mwcfw8J9CpDKo1WiRRwGxCbM55cky7rI/2FD/f95EbbB27KvkFgq7CdaKyqh7NXGc1OR/EiCaS4sI=@vger.kernel.org
X-Received: by 2002:a05:7300:bc86:b0:36c:a3ae:936e with SMTP id
 5a478bee46e88-37669a36d11mr3294547eec.5.1794387328621; Wed, 11 Nov 2026
 00:55:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-sysfb-dirtyfb-v1-1-8571d455ccbe@telaak.dev> <215852e9-aafb-4ad2-93e8-afbadfd91fed@suse.de>
In-Reply-To: <215852e9-aafb-4ad2-93e8-afbadfd91fed@suse.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 11 Nov 2026 03:55:16 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6rHjNGZ=5uuV_H=RyY9pceotPTzrnzMJ8hLCuwuz8PvA@mail.gmail.com>
X-Gm-Features: AclHuK-EsqBIwO9CGtat8AS-89hdImnJzEfTUQNfPyVgSSK9yYlt9MhNn6BdGfE
Message-ID: <CAPY4CJ6rHjNGZ=5uuV_H=RyY9pceotPTzrnzMJ8hLCuwuz8PvA@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/sysfb: Copy damage outside the DIRTYFB ioctl
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for the quick review, and for explaining why the blocking
commit is required. That makes sense, so I=E2=80=99ll drop this patch and l=
ook
at handling it on the X side if it becomes a real problem.

Best regards,
Joseph
