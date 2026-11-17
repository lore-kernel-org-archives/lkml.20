Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794936917;
	b=UBK4WSzbM9S/KCD6+Ouq9mFlgrHaAgTa0K/zBYs1Y0KCBtR4vwQk4NBZAQcj5dXz0tot
	 XId3sUDyZx2RVNi8UKEQ8gm+FtxLiQLLKtW88c/dKBq+z/tsTkuzJ9ZvQGFWejoeDR5O3
	 62qy63heMRKAMyIiWV5P6YxQXM0uFmuMuogDmoy7DJoSmisUDDzrX/ujuA3m7nKEhFp72
	 p1oejAEsc69+N8gb24Mugw93UKghl1LCU7SAOeq4ZhozxYDfeEVUtXbrsxqHg/O0o5dB+
	 HK/NumIBVDev3+qwk6e+vWJN/C5HYCeWorfEi11Eoc6Vod4gCEJo5d09omNtQodgcQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
	b=LRu5O8CORnOtElt5Mdba9lQ21bcboFSE6US2qkelHBxj4PMVUr7D5KOnjUPfW0pvixMm
	 mwyuDynGtaOY9K4q5IiaduMcLkbs4I/quwiznuzVb8fezw+Cb0IMhXbiEamgLMx2LUfSa
	 rY/h+QvOaGA+DtUXZv86pLLi9T2OY9/bA94eAqM0X7I4VV8JU63jc2KFBeQR7FHF00vWD
	 TcDUVcrRTbI6S5ttUsVcn2kJjXiE9IfxDDTcaXD6QGo8JcdabL4CgdMlFOVZYpnJXbPzK
	 FsLBJ7JA5TyyxZJq34UGMx/03QQ+E4e0ygB9HYVvSEcXgBGsALphrSOfCL9TyStIPjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPiE5lyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8C1606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8C1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPiE5lyO
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb33b5c067so4227195ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936917; cv=none;
        d=google.com; s=arc-20260327;
        b=lXVLX09UcrwL2jo082UI9k8fEOq9eGgdp8UGzDBbGkwhPfl0Oadoh5LxIcwYX0vtcP
         qRkzhWzOQtF7v2TlLd0rWPKcOMMaddr/NghJ0y+LWzHzplH+y6Qk7+VGejWc7pJ+PZhY
         4GwYcno4GhNYhEai+SyuB3DR72sqlxkd4yuSmW31kgSKugCYZBU/1hEQHwZHphBYS5Av
         +ehaUCej2dKgd7pro+XoeSTbosXXn7UuRFQSYJu+lmaNXo5nCcNnhi0vOdfo2lZ1DIT/
         +uTJfQzTlx1mxc2c5WY5FvMe5PuqGJodDQAeM16qk9+pcAOx3BrNay3c+wE5Gi8KfnAl
         TGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        fh=gtIIq8eKw39BP5FHeMGK7+XDr4cdtBhLHNlmhiQ+Lgc=;
        b=S96AcSDasIV5zP2/d0yG/4NIhWbYRb0s5H3aOHhdEqBF71MJMcGpF7xn+2YQ3hZRq7
         BFsV4HDXHBJOyxJ8mq9EfS/Gaw9rAmgpZ9v7xPBlW0F3C8jrgRsuhBmvEkJI5iL89dXm
         CgUzWDZpVRRGtjFtgMxVtpZ9bc8zXdM1TrGU/k71OZzvnoFjWvwGN3Z99j2nWSDM5u5V
         ypnrsm8F7DIx41r7I/21327K9gPxywK5bFqomQq7j4LlX2UDJoVf0GZ4uoU19UEQ1h+B
         52z+S11qBlgoO4Zu6owHeewAmhEl0tPiIIj2OxfAuuSU4bWWFYauXOh0hGwmVie2pTH5
         8kbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936917; x=1795541717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=YPiE5lyO+qDn7QvlOgjPIJqviO6zK9UEeMs074eOxfruV0I9O7vf/ajZk7U7508YXN
         OfChmUxxF51tf/PwQbFetcAv0Xr14ORMQFEwzlFU87wl66TfB9uo1zd1MSt0F1Wt49xs
         nkgCqN7PdNwCOJv0j1zetrtDFKLhZO2nzwxVC+M7ZQ6TWvRqJqAPtgGEK3Gt3GpA1Sc2
         oBnXRXeEy+RuUJmt60z/EPZfT8jj4nR7TxTVGUesPbJKkNB8zOZK9qg3rnYHAh5l1rMf
         wb8zBzrske8iwbuOFhcUyimAE7SYNsKZd8CQLXrqVIyLIJA6TKtYLF4uFrhW9Ax5X5qv
         gurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936917; x=1795541717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iEPT4fOLUy2C57JftfFB6MsPWk0QDV4EEMGYI+go7Q=;
        b=yUE0LMeMKx1/kzVbsv14lPc45O5Od3UPlMGy2RU2QAm49VmI9iBLANs31quNsBc5qN
         G/JsK8FwoPrhfyqQQivzYqTjSGXdoDK8/1Y9BD0tQJtdPPud7QNkK3nA5EKKyg7pZmgq
         xw8/pnUvAKL/Mx1Mnh3IHPhe9D2nV/MHuLxINeMtHB15/mqzXXURatHahGuZnQjlJLXt
         k5+MaRq1WHQOvELQaGLlc9HOM1FW4mt3WNDK+BcyzqEZznOMWp3Cs7ayKcSRWCy3y6Mq
         HbyVVKfBxLjrWzLwCw1gJ3NEMC/qVMbbzFhGpo4cln2OjDtLxua+NJhKjvisaElxCnon
         2nXA==
X-Forwarded-Encrypted: i=1; AL+hErGUgaJBvNRL7r/m9XOhZOH8v3GdksGwRmO6PLR6LiqSF+oS9xaPhth5HGVtSGt0FSA6sfdcIXoW33aE0ZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MojXl+arKoeK6FjvNBdtR4ngIRfZhK6DuqVrNZCFwExxjVo1p
	gDiHCFNu1Adcdr8nouinH6HCS+E9XzI0ukgYFm/0Ub3Uj7cNcdFtJ1nD+wbueC9LF72vuIcL0Ma
	3LSa3DZ1A67VQBIFimSuyC0jN84Eqasc=
X-Gm-Gg: AZFdTZf6zx7vulEiwB3MJic2+TekwuIq/Ous0pVGLz1Ddx3qdX3RfIacDbEYAjdBjmW
	3bTUZYPby/h+bOqo1zMz2QXT8O4bSA9SNusu1rdsvTnb1vkTY4ogWBaSsOoJXdnZptiD7VzxC06
	nBIkG7unXQfUkWGkYHziz5mOt3zmmuQ5ON+OTiuTI55r3ZxIZUGx9IJdfCr75JvQ/aXyoTz8w95
	pDpZ9Vshllk9GkBTSluSns79NPNkIU6dFLbybgiBolAu0FJn1V22u6ilrAAe7OrBwGzKmCZtvE7
	ufhDU0c41MDjeAI/WqNJ1rrUhPb4cgU0GbDCCXCRILXYjmrEveU2oQUnI6sZ+Oc7s3QhAQfTTWW
	2q9wpPZZ+7eRrF5AbooEIo9rJitvH2UbPIY7XUw==
X-Received: by 2002:a17:903:41ca:b0:2df:8ab7:fe3a with SMTP id
 d9443c01a7336-2eff751fc0cmr213765ad.4.1794936916611; Tue, 17 Nov 2026
 09:35:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
 <20261116084211.3066460-2-cristian.marussi@arm.com> <20261116-astonishing-urchin-from-jupiter-838cfc@sudeepholla>
 <avw5o7sTyriZ2ZiX@pluto> <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
In-Reply-To: <20261117-prodigious-limpet-of-fame-3d72e6@sudeepholla>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Wed, 18 Nov 2026 01:35:04 +0800
X-Gm-Features: AclHuK-3dP_RVRp9S7UU3KZcH-t0O4kwljf1AMinJpV8gpEOTdKcRjWE-9zLE7Q
Message-ID: <CAE=Q7=4+HMtqbiK9v3jw4t31TQOYUfRXKRurZ7KcMi7GTi1v2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot
 notifier and forceful work
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	philip.radford@arm.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I think the current v2 may have reintroduced the second deadlock
described in my original commit message.

scmi_forceful_work_func() still calls unregister_reboot_notifier()
while holding sc->state_mtx. Could you also check the potential lock
inversion between state_mtx and reboot_notifier_list.rwsem?

The reboot path holds the rwsem read lock while executing the notifier
callback, which then waits for state_mtx. Meanwhile, the worker holds
state_mtx while trying to unregister the notifier, which requires the
rwsem write lock.

Thanks,
Chengyu
