Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047748;
	b=pTAxzyTsGI9/ZUqFVP4reXFfwma/AVhlVyzl1NQRFrCtv3O1c03WB5V2Uyekrx/hnov4
	 8Yst64HLeVpFsRCp6PTH3WvKPtFy1aIC2wO80BVoTLQ1RubWCvs3bj+hoMPh8Dbj50Kw5
	 PrVnI6sqMhdaRP/HwYFnEm16XinlSu4scjpgRK1iCkHAFBpN5+LBhCY9JDNv6zr41QCND
	 T8fEHYZS9Zul67J4euR4FxCP71s03KBDQQxIIoTpEuh+yRoEGbf3j31eKLRweRQfxD2Fy
	 zqtw84Qb6XrHiUWuS7nJyDZ1o7m2d+pVXqFQRfwc4kHjjH9YMQEMPX1cXN9+IqFdwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
	b=bYIpV3JO9FZ1szcaxVNL/IUQrR1XbBv394WK8Db1+ZhTaxhbEnwA0jmtfRGV9Y0saKcU
	 /fxIb9sj88Bpj8J9HKLQDOAQysYvdpXD4ep9SJQ1ftuoVYM5WrTUPw63uV9Oee5JH+tBr
	 ic1gzmGGJtWybjuU8ZS9VWB2CrZPtdxHnoMSsBaIeY/mhNBoHf23DFbxUYZDQ7PCpot5z
	 kDEX3FBM4Y+qQosdO8SbULRoqeIYuuqd0Vlun6Hj2GrIywmK8tWI52Deb+K8ead+GwTUg
	 lhrg8SUEE8dzRGbC7MSR+1i9zOV4JbVnY3KE1CgY2zJ+rOkrlIJmi4v1zZq1juURzZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so1832934c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047737; x=1793652537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=BbHojwCEj3NMw4yL8Qh098Vwpg1TpYShXs8tFqPGTbveTn3VdbWpkkaj2IycjbIJ1v
         Lioq2o7voyp5xc2EAsMynXZ6s6mm82Vz98UJMUTsMfwdm6U9oVTK9SFXoHvKy4gnzdY8
         uOioZbAj6c9EvzZBh9GFTGk4CpseAysMG+l39AkqUgWbHrmAk7sGc7QJ8EMB030iBlbs
         o0gc36eqHukwSWYCQ6qLDbpIWurtGczA9n6RaDmywMIZMUbp3l+Tvr/FMQcow0kGZkzz
         QLGupQiaTfKDJvIJEu2Ffyd3zuoEcnA2Qy0+cJpBHDjQHmXHlgEqqSeet30XLCrfdbsf
         FjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047737; x=1793652537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=snEyLmKRhGBNZQqbllKnTSVqiNpFoIZsUnFHpS+kbfMN85jhFErZP79XkwrMtUsX+P
         nxFSMA8qukxOLwDHlf6BTOXKco8pbiegKmeTSAsCDqmSwJK390zrjbgTjHvKy7JAojnT
         XOto0dbg+Y/cv15VC+hG9/95eUp0QPURADvpqRHlddED7raxKJx0hPTIz3M18Q7K/IIa
         9uElF5SPUAMgiFTpEwyWOj4dWA/3K5sGLyHEb+Oy22onbG2sOKkUFwaCat3NS2FbaNcx
         LtNTelz3JzuxAP0TsmQmlr/aRDgLpDRsUFKWU4WD9EJgc6NWvcB/Nd1GD2AyiSzTF0/r
         t2ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxV4Vq66vPsQhzlfUJkLHP8H4wvffhM1efVLtZjHOovQQizY8NUdvgtLSBdp9xClTOVAKtUK92TGY9rIQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEPe3mChOOlw4k9WjyNbmRRwFlIVdNz79GOhoTbVDNyxQBJn0o
	pENGE/pFetpDbJ8AJn3V9a7mnRN8uL8K+jjUBpt/3dM+xo+v+xTGtR/K
X-Gm-Gg: AYBFou0m9zTpaZf7rGdshH7Qcpgfe0h+sTFN1NqYtyIwoFlhje0QYwVin9QKMRgLyBt
	8FEUG0W0IWMCAKVkDYVJ2BhObjNUM7H+FKEldapJe4UU4ej9/38C5g4TzlmKI3SGG82r8WYNFTU
	u9sN/FyoWoLXNvpdprqgMqPo7Iv4MAuQkilxlqS51dAr4zXt2eo4VubGmdv16cMP360FKoyoRmI
	PV0u3TEEUZ9fxVMsNCN/5nRIgOJj+X5qbdjGKstU+KhYXnof4xrdmnTYuJsogbi0zYsUcWiZ2zk
	0E2sU5HlKcL2naMKd2RpulgiQy/sz40j/Gwe6g/vzLndTacJ+j1JT4f6eqBG2b0pLj+D0t7tuN9
	21DanGNNWJrXLa9tYJjQFsZxbOGI6dLWTT3fMkASdeHTtJ9df4guze4J1X8pdICkr+ziN/bK3FY
	UFAUBfoBssMtmm+TQxZV7bg4Iow/zIMfD8cpkG9GTXMvRF8g/XeZKVAgtoNXIdEKedl5AQIl2+3
	AF4fjxdlpikNUyw0nLruioJzzG6jdtm+ekHLCGHUvjJityqdMyoyxxZt1xReaQDZPADGA==
X-Received: by 2002:a05:7022:b90a:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1993499de9fmr11845388c88.7.1793047736520;
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27592312c88.7.2026.10.26.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming
 status reports
Message-ID: <6ad47f82-3074-4fd1-bc9f-e3db57171e6e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-4-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-4-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:14PM +0300, Vas Zayarskiy wrote:
> The raw-event callback runs before HID core pads a short report. Check
> that the report is an input report and that its length matches the HID
> report descriptor before decoding sensor fields. Otherwise a truncated
> report can be read past its received data, and a feature report with the
> same ID can be mistaken for sensor data.
> 
> Apply these checks to every device using the shared raw-event path and
> check the report ID byte before updating the cache. Legacy devices keep
> using their separate feature-report read path.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
