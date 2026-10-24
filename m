Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854748;
	b=fepaNBJd3CfVRmj0vV0lYK0NT7wEpyqMQsJqh76Jl0nqtK8WNnLZQz9BLxRdYsVnu5uf
	 t/jRvVMW2YrpIzjm4qKTGzh5SXFGf0XvCkgqL9p4lkSTsgH+5eoC1DWwvnti2WpjFIR3n
	 8XUSjJhkwqkzajFRSCauwr9NoyKfU/ChLRtxiM5x2khdo01YRJ7VikWJ79UGuUdUs9Giw
	 1HgqY3PS546npDGXzqIKJBX3ZmGncIUSmDDU3k5mj38YfIKsfS+b4j9jnuO0hpTzazQDh
	 BWrZYInoPaFArCezDUZX+Q2VjWP7l5qGVctzblZXqMfGh18lY8LGkOyxbfh80P+vJ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854748;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MyY2jy4KUwx/K3rgfa29m+xcrAnt+SzmlWOsNDROzng=;
	b=HopApF3f3DmiMdEWf9oahKWF1q/QGMfCFj7XCTMeRfPxxB2Lcrq73tF0ijizpsXZxLPt
	 pcV0XfVetBiCZdvuVCcSbTDBAvArw9j+VR1vMLWRZHQB8+zrUm+c1tH8wIZO+4As4klv8
	 TE+uuMxAYRHw6u1y4NhouK/UqpVLFD4FWoT66uLOZtK+TTliqPp6EQR5D0CYGeZb/Jr5e
	 8DA5uBD7ovq3It5CS8/ZrcvYZcYaePQqaEow32bF5wu2l6vbuz+At7MqajtO3KXqrXVE6
	 Myglibfw55O4xLB5anLcP+7uGZ5OAxo7cN17XuOYWxoVfyaH6iVu1Gyn7noeD8O1F+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF1C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BF1C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so254576f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854746; x=1793459546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MyY2jy4KUwx/K3rgfa29m+xcrAnt+SzmlWOsNDROzng=;
        b=d2UUTf7fqk3F3oEXDFdNw7bGsMs4/T4yxRFstGxLvIaphJ3fc1o67OayDTvsBOdkzB
         hBerkU9MBIuHROQsPuFYhRXQJta0tjKq4RfbQjV8pIfEtz+a1XUkqTRMW0kDIPc+714l
         isuRvb3iaJStQKsYEP+0mg827LkIPlVk9WWcxhT0Ron9v49AmUQhL9KZ+7LU7S29VP6S
         Afx+dKmpQVzIWHtb/Dvv5a603sBnMKRNW+v92o9GjlLuq4S/5k5McIlmCuNOgUV9dIwb
         VU+fH2i1d+C2HbUxZh23nREhMApxCoT4K/FC/sVj3AYSXQvBlQnEoRhVm0FH4ZBXEJ8G
         A4MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoWAe6aoGOKpeuII9cxTtrUn5lan3I/R2dRsE/GdZEMOz2A2VbfZK3TS5y5S8auVqz/QhzW9gw6FaLl24=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuw7Y7RX/4vhNlQ//nBdkfA/Z4YAAj7nmH7jDpZHoEzHGag9q6
	H3PgN6qBFgrTfAAHH7bd5GhamHqGbh0G63RmTUhoMwwjbhIOQfR5lolYplx+lqFOnwvJZg==
X-Gm-Gg: AYBFou0wLpAOMbJsQlC48K3uA4NERGovH25jQmDnPWkHHoqoBMuDaKEOBmVNBv16Zd/
	w30JAF7+7VJRzZy53MdadmftOQpS0oj9pN0svPjJ7RHDmuSfKtgzkn1e1jmKgbT2TNMG/KBPRxg
	j4iKMWL7+9XCSxFTKpva6QD4v4nmFEy+YSa492jmiWt5PxXxgZt6ijZq0qE/0azaNiiZppXJuJZ
	YewMOgZdlJntQnnppWBddKZkdPC4UlOeAhRecIie6sCIktK45QKEjSplz/48Kw9deYszwpRDmxQ
	2+8jTdXEEodFIHK/GpQr+hwOZIsxU17R9LJP+WskFC+6lfMtHbInfFi47s3A3Xq06dfvp8HcYF8
	B41eAGQrBIPab6NjWKMr0jKU8QxEBlgKrAZHQS0cxVziLiK8l+IYozaU0LtFdSRJnHkW0AFtShH
	3GlulLhZk8TxNkHV9Mnp8kNzGPuWEeqUmdBGTQrtba8nc56WZlZxaGutVZHWIonbeEbN+n+OV1w
	sbaTc0ngYBDQE7vUr1rE/xdF4yGM6Cedav+/ZHXPdA6Rpla5ZGPBoXdcWg6Py6IEFvQJ2EPj76F
	H19igzd5UjCJ9RTheKzanDqiKpYcLLxF4GTTfxs=
X-Received: by 2002:a5d:4245:0:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-48e3eb8705bmr2186375f8f.3.1792854746356;
        Sat, 24 Oct 2026 08:12:26 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm5353538f8f.48.2026.10.24.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:12:25 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	aurelien.desbrieres@gmail.com
Subject: Re: [RFC PATCH 18/18] MAINTAINERS: add beamfs
Date: Sat, 24 Oct 2026 17:12:24 +0200
Message-ID: <20261024151224.47953-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4ebbbb17-7833-4a2c-9e7e-b3c731873caf@infradead.org>
References: <4ebbbb17-7833-4a2c-9e7e-b3c731873caf@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/19/26 11:38 PM, Randy Dunlap wrote:
> Entries in the MAINTAINERS file should be in alphabetical order,
> so between these 2 entries, please:
>
> BDISP ST MEDIA DRIVER
>
> BECKHOFF CX5020 ETHERCAT MASTER DRIVER

Will do, thanks. The tool that places the block stopped at the first
title sorting after BEAMFS, and in this tree that is LPC32XX DMAMUX
SUPPORT, which sits among the ARM/ entries; it now wants two ordered
neighbours. v2 will have the entry between BDISP and BECKHOFF.

Aurelien
