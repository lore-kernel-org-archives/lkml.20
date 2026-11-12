Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524670;
	b=z5IjIJoAk0K5pIuiG1ADrPTzYo98aBvgIUBpIihigxsornAhjw+nw+06pZujxT7xlXC3
	 zbHOG1cGnFa4iuWlV4NuRInZmeeflTBS3OMWjjrEZtExzMVHcE9mmOPSVoN1LBX+aWv76
	 KSgC2zB1ovqfUcZCzt7xfUYoh8PBvPwioGAhu1hdLNO6RKtlT6gtyOy7uyeMRrCXzm2yv
	 IQMmTqiqhE1Vgjk60ZvP9un0ccVSjtDDXX1LqRROAq6jJ5/6lZewPvFhNRZHnv41WRnda
	 PTKqYbb6PLS3e393ncSVX8nnIlZ9Z1KVcwUA5/x1N/+B5DnlBvdpNDH7PWySKByfRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
	b=mlzVBsNISBB2uEJyFocS7tuVwBLibNPquEhFQKo9aMoNG68dbz+So/QL/K2Rch6WrJ07
	 OukHZG5MEKNoHC0gFiP8SNAgQcEbKuPSRf9+CYfaFs7Fpw2eI+Jg+hCtWB1pwWUNYh+j6
	 4y5aTLJTfJBC8bF9tRDdzkuX8jh+UAh8QCxgFQEF7DOKZLPBODBqxbfEIwyFmQMNaSEx+
	 c9NRH6bkW7LZ1veFG2e8H4lQj5i++J3+qBJ9rClhMonflBPhAizwl6frfj/BkDXwLfpV7
	 F3c0ndismuERJC6K7T6D6WSwTik+vLO7U4WoiveerWgV3d2Jv8hw868XE88Rd1JmlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vp7nUCNM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC88606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vp7nUCNM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2251975e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524668; x=1795129468; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
        b=vp7nUCNMGBul0zPpsRxgXwbZRNhSow70IEXukKTU19FUL661sNfY7eCgaY55+HrUtv
         0YbilQHOC3+lNNbFxRxZOlV2Yir7ZexjguuX6OfVzXCqhF5emYp1tfdHaZfwOfDYceYc
         2LRUnpYl5MbkDuTQ6YZqThItoDk3Tg0TcT5IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524668; x=1795129468;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDnpyhmjZp7ZSLr9QQCroWr4WLbm7A908FCsyv58FvQ=;
        b=MVHz3KWCyUkinkRXjVX7Lv8HXO2BhuPXNJn9kszPfgSOJCGMNzTFH7WKWPBcwzNnXW
         ZvUOm4QPIgESmg4DdrC+9Akl8bZPwadW85zdxFZFJtB9vQh83faT43LRTd9dZf0GjYtu
         r1XLZg9mBnq8w3iVecR40sp4W/SjRgwnmNgb68gJzjLJEKy3ElQxG4LJ/RlrSQp33oHv
         qoe3zp0+FTEhibUyuZ+yr/zw/hPXFbtVttY+pwtrM5y6mlmqDGagcbP2r7LNwVZ1Cgn9
         JzQHcKi0AhB84PvfgJGO4zAm/t9ICCuJAxryAErAkhhA2evlZ9K9Pba7ItfTfl3MG9My
         KtIA==
X-Forwarded-Encrypted: i=1; AL+hErFXV/fwFnunxfxrSS2Ny8r3i/MBgNKJD7p4IZHs8MzSLfxzE/DJ5hM9rI9SUMdXC0FVdUh2Qj4eHCHZr3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ChcCGSYrr03+HHHd60bK4oFEkSjcBXt6IraumWXh72n7gDp0f
	3U3uHqtwaOuH6En8ugN01w/DGFljWHDQoIrvXoNhBZL9NtFAQxsdOdhz6fspeVxP6nE=
X-Gm-Gg: AYBFou2pvQjVQ6nuLmKU9sLLCUZtCpxaRFmHY4CLye6x+e9QfG8/AKm3e5x/Qyj2tlS
	l80ninAbShEmTDyYIu/xJehoQNQRj0gyxTIoPL60aJcmuF28l2OlQ4YR0rHlFjrMjeKd1Y+3jN6
	vVTmp0i2MMoUTPD/LFHkMiv+qG0I1rKqGtEKoN1GNrvNQTp9jjXCplTLIKdL28kvEZpZPJOyXxE
	JZdmS9iIAuNkCvdUuS5UpMJNWQybwGdbV5wWSSCveer4BdYVbmCN7o5/Y44EmSPz+6ogBDb40Af
	SdzZ2gV5Xw6qEbTx97trMxjZj6Us+zUW2sPtTliBGKpkT/h0WNcwNljZrM62tj4tzAnU1XEpMQY
	UU6YdMknB6ELqeLukp7TFLaI3NtXTp4yzMwJ49bkAQ/U9+165M1VkgzTp8IlOlUlc+Vm0Mi9d4K
	bsJMhyY/kKTZHNILoBBH91aUzI5lADE949WupUoNhJrzhuHrHUUX2uvEn/iX1zWRhxCOd77mwj3
	9pOiMG3054qmBhaJ3J+OYU4kb4G1FPOEYfTeOrMlpWSIs6s9zNFWijhHbqQGm6XlGJVsjgw0NbM
	QX6+OAH+hxt2cbRJtZAEui5Ip4YkqF41zeQIw3UdjmGV/Kl48i2geEfRdYF+kDUiShzDvnVBqZz
	7L6PQth90iAS/GfDHDAAncpX6IIFKN67tqT3CB4XK9eQoJHr1CBq2P6XBRUuvqL/tufU3h69Dcs
	xb3RlJ+Tg8/Kqp7Oh6UZPv7QBvtI8+srKo3MDYh/6LDJs1iaksUn3Ue0gMhQ==
X-Received: by 2002:a05:600c:19d2:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4bb55ab27afmr11503785e9.20.1794524668116;
        Thu, 12 Nov 2026 15:04:28 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e284339sm92882835e9.5.2026.11.12.15.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:04:27 -0800 (PST)
Date: Thu, 12 Nov 2026 15:04:19 -0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Marcos Paulo de Souza <mpdesouza@suse.com>, Naveen Kumar Chaudhary <naveen.osdev@gmail.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/17] printk: Separate code for adding/updating preferred console metadata
In-Reply-To: <20261111154816.71103-5-pmladek@suse.com>
References: <20261111154816.71103-1-pmladek@suse.com> <20261111154816.71103-5-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261112150419.35ac913379dae921@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Petr,

Petr Mladek writes:
>+/**
>+ * add_or_update_preferred_console - Add or update a given entry in
>+ *	the preferred_consoles[] array.
>+ * @i: index of the entry in @preferred_consoles table which should get updated.

kernel-doc picks the block up now, thanks. `scripts/kernel-doc -none -Wall`
still says "No description found for return value of
'add_or_update_preferred_console'" though, because it wants a "Return:" line.
"@preferred_consoles" in the @i line also still reads as a parameter,
maybe preferred_consoles[] would be better?

Fine to fix when applying.

Thanks!

Chris
