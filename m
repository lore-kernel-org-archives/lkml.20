Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459650;
	b=ypQUgiLdelkpJxwHDmk++5Pl69BdlCPgLYZulS/B7J5P9pSJS5VhtUn9HWzVaSILMctw
	 BwGkYu7JSs6bNMqHJckChTq1G76USDXxLx+MI5ktl02ItiJqBBf36Kz3ilWkTC3zbbA8H
	 MBxTvap5sK1PiSD7wShsRXz2N6k/xAtkmbM/Y+89Gpj43MnQQ53cg6Uc9tOD3HRRKJiKM
	 qO1Vfqp2ux61NBNv6Le/FmSG7BzJhAxBU8N1AwBiJwofunYyJ9AYXaMuPsIxFJ/0IEkqw
	 NYwK3fakfy3IDaZ5Rz9Qf/4m3uuqi2sQ+romjlnWlqXPmLlB+DQlGjswPcQoyNKA4aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Hutm+uNJMffbjHn9uMi1YOHvbILCMJXO/l5lic+hljg=;
	b=o2qRYufEH8mfK8k5qTx1iGd6qL7BBMAYMVg4aHmEyKiS67GMzcsmnY0Zh/+O8mwZUnY6
	 sJ1ECuoDBVtM0slSN/d7Fd62AVs5kQaAyJRAZyYqrAT/xRf6j1xqzrkrQQZsGadFT8GQ2
	 9Lih7MWjp+XUJkPsSKHnc9DcLeHFwRK1AUZf8uKqm0z6TvrAr3AwnSAetY44+JcxjC1Ds
	 VFBVP7YBIMDYWOAt9pZDFLj8+b0kSfQhpPJJcOhY8JHCVhdyW2soZjO0K5T7rBQJB5pBK
	 J6nvMe56Rybw4Arin+X36AyrZYiGnfx9DRTm3ji7crusy/Y8F9tjRnDwOLAZvBQ+umg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XZfcHtyg;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1F0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1F0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XZfcHtyg
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15354aa70e8so3019322c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459649; x=1793064449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hutm+uNJMffbjHn9uMi1YOHvbILCMJXO/l5lic+hljg=;
        b=XZfcHtygFTwbNHQkMUuE1HfYBbAz4Ub9c+d6Eu0BAfutbD50i4iu6SfxQ8beSp/Idq
         DZojc+oXZ7oPlhdxNnY9EdR5OaWTIX/hQfE2VsfA6ng2ZGCbuGmSHp0Dymw0y/47tfdT
         TV/0ar1GwDTsH6Ky6eLZe+2tJ9XlaWFlQ1z0Rwo9Obdpz0bY9epiG1nGaeT+xtXzo+9W
         TU69GK3f2lwzrSpdVLpkc433U8Z7kUqbin1TiaAKNaltRQbwzr4yfiPVvYeplsG9bK4P
         JVk3kQsSoykvxAiUVZcxbrTO2/vjR8ekAwX3v0N6ELiBAo2baJvnEDVfmJVyqY9rvHUS
         weHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459649; x=1793064449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hutm+uNJMffbjHn9uMi1YOHvbILCMJXO/l5lic+hljg=;
        b=rSjsowsEFHrIJngooE9WflDRXjCiaQAsUeWFfryGiv3LKef6JMGajXfyQotOeBJGsW
         4LWGOlqZDV+haetP572POY2goYVPhxm1gnAZwi/mT49dXaQ95IO6mIJZG32JZX420KAU
         GzOfmVb4lxD0wd5HyZXxb71aF0onlScY7/w0Jwyt34vbC4yvAuakQ58GpC6ehJXu3bV4
         RXYdE99DzlqExMLKHvZ7qR2W6yGQ2RWRRIdB8yCPxTlOuRw79CSy1TbwOR/zxIz0MDP2
         t2cHSFD2U5SsM0nrgwhQ8l17LTvUbBffWOvqiYYe5Pjb7dUQ8dmkbBKyV+CojD8PU9BG
         CjcA==
X-Forwarded-Encrypted: i=1; AKwUvBx+MoTv4BaLO51LAH706E0J2/0I+u6IdeapqaK2N1as7Y3+daoIOp7L0ZWPKb7uv9alhQ/YtJ8CaN13rFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZFxgUJyl1HCE+V87j8657F3kupPchChYURLlH2CIn/VQg3dl9
	uHVuiLvJBGOfKm+jvYnTmw5d5xoPbv0G0r/LB5KmzURJgHavqEgQo7maO596oA==
X-Gm-Gg: AYBFou2TvQB8G76VwQOFTS89vHFQNQJR7tvngFfN+8nELN5kKqXApu+HtHnO5miQJO+
	Zd+RmkvCY9c1IRe9VTyS118sTDglqTB1WZN1Rq6p7vPYy0rrcJF4Xg9TX0JQn6NEOkuDLm45+QK
	9oUNsswPHkDrZBz/2rmCYSxK2SV/IyeC74cE3Ws92W9cvCu5NT5sG7Pd1VkNx+oKGGNKKSJlLOs
	fQosD/8SlbXr9YBUEsTjRWpTObcfvfgWE+m6zTjAw8DSzgtUsNzfIeRR0c10gDUZ4NpegDid8tn
	0j9nn3iGi5eUEVhX060E+U75mGU2CXCIxpXOO88CuikG3UUtAcAYFDoFvWv6tc2jVi1iTL0lCAk
	480OuQG2dHQiWkMNm0EVVmPLQHnC1wvXz3gwKpC5+MA65EngwBjJnwYKr3vLrRHafntCbGPxno7
	zEsw6zwQBRm80JM6vGYDSlrnqb/2WzJsBXzvCC01miiGdYD7JnC3fwQAYSwThShmDxZ7b16ntZA
	DwJ9TVihShE
X-Received: by 2002:a05:701b:450a:10b0:166:862b:9bcc with SMTP id a92af1059eb24-18512f1b124mr13440753c88.18.1792459648645;
        Mon, 19 Oct 2026 18:27:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm44095884c88.16.2026.10.19.18.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:27:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:27:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qiwen Gong <qiwen.neosys@isrc.iscas.ac.cn>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, Zwane Mwaikambo <zwanem@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: sc1200wdt: add missing MODULE_DEVICE_TABLE()
Message-ID: <dc4a5cf4-c6b0-416f-9fb3-a89de0c5a0de@roeck-us.net>
References: <20261015062556.3362356-1-qiwen.neosys@isrc.iscas.ac.cn>
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
In-Reply-To: <20261015062556.3362356-1-qiwen.neosys@isrc.iscas.ac.cn>

On Thu, Oct 15, 2026 at 06:25:56AM +0000, Qiwen Gong wrote:
> Add MODULE_DEVICE_TABLE(pnp, scl200wdt_pnp_devices) beside the
> existing table.  
> 
> Built with CONFIG_COMPILE_TEST=y and CONFIG_PNP=y.  modinfo of
> sc1200wdt.ko shows pnp:dNSC0800* and acpi*:NSC0800:* only after this
> change. 
> 
> Found by comparing the id_table with module-alias publication.
> 
> Signed-off-by: Qiwen Gong <qiwen.neosys@isrc.iscas.ac.cn>

Applied.

Thanks,
Guenter
