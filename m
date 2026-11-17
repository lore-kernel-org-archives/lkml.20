Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921152;
	b=47lqvQU5Dp3Y/sFrvQwijIIdKv/lrM5IQ0O2wmxzBUQIUlJp7/s6WhcpbV4vVXSAk9PU
	 e53KbYwLIwtNVITmhlVLeIGlZdNwGQ9tV8ZyUSV+wCPk60iN0V06/cYM0pKubOIQzBlF0
	 Xqu/9hscTAlxfDwYT1ZgW9c8LeoOZHMp74dAv5SmtPwZBn/cn16WK+y9p1H0iT99Xr4Ew
	 zZCNY+U+W7Uk5PzqL0oMFtZ9ZPG2VCxuZPX2nggGTmFovXGriCakghAewTQn8DQ/OORqR
	 7S3oqGXobKx5OT9vCdZoVT49iSeCOQe5JBaCFQt2szpYUuUJEzv0R7Q7NWoRVbHluRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
	b=vEeLweoBkzSXxKPHhz3vvLG61aNoV043oj+1Kf5GmVfWaASC7zVdcDLlDjRJ08TLVJVB
	 kvWT6uARSmeJjEa7QrgSVg0GF5jNGkUTJNQnEVTPgPUgnz2Uzt6XqaKq3+m84LWTApK3J
	 JPVncxXJh2SvSRtPlarP4LUxQo42Hoy7n42TKbmc6bp/tbGc/PZS7qSVITshoelWGJpde
	 8jlgLm3v5uShCiAd/QUbuP3FEQHoSAiiHe33edQymGX7kz0bPGoLBsNh8uTuAfX6BVfpc
	 LWLHOE7j+Jp0y2c0ad1UwQRt4E9Gte5FE5A66B/WTy09IqNf41EOQhPcgUfUjwt5qzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTo5nKka;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E33606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTo5nKka
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a357b1c649so618358f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921150; x=1795525950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=jTo5nKkaXblBQgA/Rs8BiXfVG/18d/4UwaAwCQ1nCZblRseDAB04384QJ250tWeE9W
         miJacOwPxxIPHwBvpQdpXRxX9YX20FvKECdoSCMsNna9M+46Mn6wdPArTuab66k3FXBo
         4lLstdvfmYC2Rna8rcM+SlGl2y8S3x55vzKvyF6REoTe12OsaTulBQeZ2ui3CbEu93/N
         C5N1uuNqJ7r7UdwYTRAh8qRUJWXlhjEM+IX9gbcKaWc8l+CWiTvJXwVOQsgWkONO2Ty+
         DQfO2krZDFO5qS+OhL1npsmvdThMcKVYTq1sh2F6wnk2T6M7GYFO2bWXGFNLVV5PlTB6
         iinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921150; x=1795525950;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4E5w3vIfYrEz/focXkw7N0ugWTu4zF6SufD8ZnoE6g=;
        b=cLpix9PAZX7/jY50L+3qrvErRCt1YwbYLfI1A0h8eFtzwvcm5ojg4nDLcNWaTltB0H
         oT9Us4hx90NvIZCL3sciMsHa/ZIkKif9xyxYn4ly8Nl2Gxe6AeDR2gcIKgupXx4v29Wl
         rB/fkUPjBAXfoaldzv7GpnP2OaToMv5a1SaZE1Q10nIS1V3ZmlQpaNT4a+6KZojmGNpC
         YUIQfaoWO82zz7mfCUs7qsli8fATbEs7cV78uCFKDeYQw5P1wRvvY1A55vNW54dJepDX
         IiPOWHctEy55AvLwzCHBFhjBqa6b9ETCYyUxkHqXJFG1xmdJMkUphRLnzMeD8TclmWnE
         e/NA==
X-Forwarded-Encrypted: i=1; AL+hErHVZjh+Nmicw+/Jkp1ZO0nZ6ByvLjdvbLjDqlTnvEXozX5UdPQUV6/oRBrGi79GCjEEpEriNqiTNxcfHkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lI28yzkKkBsdXIpPEcX3D2C0f5S/gwEZ8BD6+OUgPgJPcLKWj
	91PY4xsI2ZRUJ9/qgaasT6diKfCrN/1km6/ubb0w0ejgFVTRVOzBlvLPpXkvjX/1
X-Gm-Gg: AZFdTZc8sh8+bzOcAm/ebGmzy2KCCuWLfHmuyZnVCBZTKdCxzx1kseVVnwayv5SZMGX
	6t8qqjT5qvovDZIPcoXVyiSBwWhnPinotkfruvGvDpMNh5ThOHr/QHWSMr1u0YaTbfIyO8OdovZ
	B+PEZQ8h1QjUwL9OgwA6PwHyi3H1eg2nyiBljCFO8vAO25Qbb2aww4hH+FQUbcOwhXdPcvz1ECZ
	YTVTvQkQruc/kZAk4v7KTxVjFYO+dYQRjemC78PiRKQrUE8k2LgBhL8rcdUVGSExvgBZDRNYcoG
	VFGEQe6+k8PfSN6O90LN0P8C7bjmiBK/liq19JNnP4GxJYwAdVQSjnI5zDKxtlCpku8sBGo5et4
	ncJ1lPiXRNlwiy78KrT8POgMrL74tX3XczgyER88/3nVxZ3ofIal5jESQ57KatxdlOJJ5WkAdX6
	lG8NpWJK5SHt8cJF/qFuodAUx/SiDdPgxJf/GLRSYiKFAO15ZcYfjHBTicHUJinRcsS7aB4rnRX
	qbjl03fuzDWsaGLAXDOyYQ9Pzcn95kTNifieF9qHs+XN6S46uT+l2NcFB518A/6s/WuHoe3q7qW
	X2CFMhTOXu7mumo8ZI0olX1gLkp9vY/fcJLt4/JRJTcYJEgKuIR6O1oqfuGimGp2ow==
X-Received: by 2002:a05:6000:178e:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-49c73a05d9amr29331087f8f.30.1794921149776;
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm26732407f8f.4.2026.11.17.05.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:12:29 -0800 (PST)
Date: Tue, 17 Nov 2026 13:12:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Yeting Kuo
 <yeting.kuo@sifive.com>
Subject: Re: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Message-ID: <20261117131227.3919c5bd@pumpkin>
In-Reply-To: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
References: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 23:38:36 -0800
Nylon Chen <nylon.chen@sifive.com> wrote:

> This series adds emulation support for misaligned RISC-V vector
> load/store instructions, which may currently fault/trap without being
> handled on hardware that does not provide misaligned vector memory
> access support.
> 
> Patch 1 implements the trap handler, with emulators for vector
> load/store covering unit-stride, strided, indexed (ordered and
> unordered), segment, whole-register, and fault-only-first forms, for
> both user and kernel mode traps.

I'd have thought that the cost of emulation would so high that you
really don't want to be doing it at all.
I guess you can't stop userspace (they'll just wonder why their optimised
vector functions perform so badly), but I cant see any reason for fixing
up faults in kernel space.

David

> 
> Patch 2 adds a kselftest exercising these code paths across the
> various vector instruction forms and element widths.
