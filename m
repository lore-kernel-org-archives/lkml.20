Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360042;
	b=VkniVUGDJhTvq+YGgzvvrZcodRtna5rHAb5BJmftJLdtRjvPZl3U0lS0ilcdXvYZV39F
	 5QKWjM3VkqBJSNpPWuKkI454SxwLFmPfxzB7+sfZ2IiPrsQFKjWTowKLyX9VLX6fV/QL+
	 G+XyxOTyAERbv9eaWSd3MyOMNLkJ2g3r9oy9D+0FgByRApHcHOzsnH5zWQ4Ogr1wKaGQT
	 3azUK7Gd6fZyTmf6T1Rq8RrKwJSdG7v66IDFEe95XlYooXprdokshIo/XIl4Y9aTvBxWA
	 lMCLOgH9Zsn60g+1iq6aveHy22+1CxAua/K3fHEh4zKDsqmS/AyY8ql2yAHkzQzdXsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cI5Hjpdp7zO9I2V61FPJbbgLxeyy0DYFAxQRxLR6EAc=;
	b=VFHFBx9FERyR9JIpIYNBo3tZh97x5pLe4YEIAHRfDQmvuT2X5KTF7jEA7PXgr9rWlxWA
	 dsXCFXrmparbLUYCGdd5UpkdR8/wYc9HFjQyHDk4PdgF3AYPQdVGnxaFttZhJGQna83CH
	 anL/LVEmWI6My/57jQDC5R4Um2tRGTsaEPK1ulQOD8V5QZSAFTT6Nq9+gmx3o3FVcFvgp
	 WvhYIFB2wM+NWl5ZOz4l/WQ0dBAVi8N3ozLzrAcF9gyiFiH/jFUeIW/an1kBCBMNi4/zR
	 KKsHWY0PdEJRZe/e1XNB0abiOeV+M/z4b7Klw4KofMNlsePEJ9FCwSpVdtO4wcI2wiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJbow+Ry;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE332606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE332606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJbow+Ry
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso1458928c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360041; x=1793964841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI5Hjpdp7zO9I2V61FPJbbgLxeyy0DYFAxQRxLR6EAc=;
        b=qJbow+RyFWF5QFZ1uK9QqF+vowuLwxygWZLw3anLNkpKt2i+llLDUTDFmgfzAzjRDW
         oyoO4VUhqgpzvKvOjHKs+v0GdLN2btyCgZ3VD+WGsHR2hYOqCkx85LT38YXk/IqcJNiC
         h234mBMjvur1K224jgfEktoInVsrpWOUt4hyGawetllJ/V8UOmCz7Zbvn3P8c1/uezFi
         FxbQZNbgWqxGWcS8MfP6+lGInMZVeDUSpYHXoakWwI2Xw0JJ6Q8TR1wo+c6TG7Zkw5yE
         dI2qrjaklS8FQIjpCEZTp6sr0+yqS1dWRZD32ne98Gi6+XLuQYF1tvdu3epsW3V+mlGu
         EquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360041; x=1793964841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI5Hjpdp7zO9I2V61FPJbbgLxeyy0DYFAxQRxLR6EAc=;
        b=xfgMMpSZEjJmGt2q0bzSdCwFRskBlU3JjC2C0jMyZVH64QM9qeyMFSI3IL6adAgYcZ
         FwlwFzyn9v2WVlCjzHsAGZG+n7sz82AvlxG7LNofZqaZYxkQKlqsisf6awwBL5xTLiJx
         ilRU5NJmLRM/nMqGU9WXIZ87bP8IEVMVw5/TgoaMllTeuLp0MnNCNrCZeq3jjWz2HBMv
         fJr31nmJJdZGMTruywUxAieoxiGv9ZNw0e6u+L7eOYPpZpAHjyX3d66Aq4etBhxCkhSs
         a9VeQQnjJ7hXl4mQCrGxuwvJ0pry9jn2GbOj5D8A7JhCbCaA3rP59hJlC1xaM7kbYVGF
         o/Tw==
X-Forwarded-Encrypted: i=1; AKwUvByjzyKKSYd1n4IiOtt51gi+nWV9lPZCQ2NkEjSK9RenXn6jT3QLF9mxxftsSRnOfPgZ2GJiprTg0L980RY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK921XjGUmHTTg5VHbm2Qt/EjgUG7hNN6HZI7NFoZyxpd3nxAJu
	Xm0ob4l2mi1ohXcHoQrpxY82u2s05jrDwc2B2Xd+29L6w+4rV0TdEObx
X-Gm-Gg: AYBFou1LekXFVd1kWmAG31KPawYzBeTYQcYMturygRtesFoAwxdMtw3Ogcs/k9SY5Y9
	tCKQs0CN4NWe/1YP4FhJ0b77fHbWtlX+v6u28XLw+UFNg4luQiKBPH94f89zwB7IVu+oP0jyJAh
	H5DxYLkMp15b2TKfsE//k8UEztP3UeaT6RTTnv5N//aXjpfwegyVJ06Fl+45dkYQXv9uq/XLVm9
	Mm08KtUTJI7VE0QjISErxRcSsAwLJDk3AYUM6YoBzDQA2lwdMHYEncMkgqKdzAaZ9J6NbCkwPzO
	nq07PV677s9ric8SQb/8Rg5G6bn9D0EJb24f78KrVoBDMF6/nRA//ZVwcqzhnOFtHxFWQi1i2O6
	+C7LN6kgJyX5hdNdUpb4FOassefz319AjaCTVzg31OoOh6BoC56GbMZjZtT6In8428wkQ79WwJO
	6xKYOOL1Gy0ypKD6Z5yYsldeAKNw39v/eZCHU0MNVTvvTdwiIYgTyJaNz+dJRv26mmGmUNX0Jvb
	LYvhpKniCCq1sLqjYsZImrWQIt5JT19q1tfNnM1GlDz1kaDtREgBNwfz0JSMtQMYGyQISHoeCZD
	FQfoliwXTvnF2Yqrs4obbgWeUrXU3AnJZ4hrtRlNHDAUrw==
X-Received: by 2002:a05:701b:424b:20b0:199:7dff:f9cc with SMTP id a92af1059eb24-1ac5ceefcafmr2906676c88.42.1793360040974;
        Fri, 30 Oct 2026 04:34:00 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm7809929c88.11.2026.10.30.04.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:34:00 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org,
	dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v4 1/2] tty: sysrq: don't expose a partially written reset_seq
Date: Fri, 30 Oct 2026 19:33:56 +0800
Message-ID: <20261030113356.248358-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026103043-tributary-partake-aefd@gregkh>
References: <2026103043-tributary-partake-aefd@gregkh>
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

Hi Greg,

On Fri, Oct 30, 2026 at 09:33:41AM +0100, Greg KH wrote:
> So this feature has never worked?  Or it is just "one change only"?  So
> your change is an addition to the feature, not a bugfix?

It is a fix.  154b7a489a5b ("Input: sysrq - allow specifying alternate
reset sequence") added reset_seq as a writable parameter, together with
a version counter so that each keyboard rereads the sequence after a
write.  The reread just never clears the old keys, so on a keyboard
that already used the old value, a new one has never worked.  Hardly
anyone changes it at runtime, which is likely why nobody noticed.

> So this isn't a "real" issue?  If you are modifying the key sequence,
> how can you press the key at the same time?  Doing "major" rework for
> that might just not be worth it.

Agreed, please drop 1/2.  With only 2/2, that race can hit any
keyboard, not only ones that never used a sequence.  Do you want 2/2
resent on its own?

Thanks,
Zhan Xusheng
