Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A732367B8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149564; cv=none; b=nPtAHQRf7Qt5j3uWucxk19sqVSg7QPD7GStLmUXOSscxAmEFwFKoe7OYGCA3aQBdGYH0euDYaodJcg9Px5QjZApHo81a5q40zF86dZXfes5+I3TKCOfTO6dpmVtDtPmX20/Lg93qUS+TeYdIhi8euvqwjKFLk6KrPdpfIUEZhGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149564; c=relaxed/simple;
	bh=7kcP9cLCcy4OUEUkmZAtefVAsO/bxsy2QWquHTa4u/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dy+Apqza8xr1k0pnLcbVwoyok3JmReoRoKEXEYd5n3HMIE7lxDkRBvqEnP5zxF6UK4Q83XxzN5xHpd5us2V18wnjAjKuR84p9+iXjYQtEs3ap6sUdUg+YIZYNGZqArFNc/CkCNHHEewSKHizuoWdrbXBHPMILh+3yYZ5Bl9HWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbDsjxjE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbDsjxjE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so57255345e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149561; x=1792754361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7OLFMGhXtb0ShwzI3FF1wI02MWCwrPh2eC1gyrGUFtw=;
        b=SbDsjxjEcn5GIGtCXf7UlinPIncRzcVv5O0dzZxyZVoZ+KYVypt6UJAO2UWvAN9bc8
         WGhErLNHxFsGH3+zLSt6kbxxAIBrMYshv4taKOzPjXm6E7KPRmrg2Gd5h0ZPk6yGmm7u
         UCymjj2LjZal4ePWQVDw9islXVFNJYy1tCE8Hdu87D+KxV+rWb+d6/2RvpZwN/MyMC8Z
         MOcH61w1QE15yo6gLG0dg4OA64tBXysJUi/wVuYGO4v9vx92RXiqypZK6QfX7/4SF2A3
         67C0zIXxYebK8AKGRgRiC/tnFHIsYKo6Z/K0yPTP8fK1mSnXrI33M9gIzFp+tw8PMh6K
         DfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149561; x=1792754361;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OLFMGhXtb0ShwzI3FF1wI02MWCwrPh2eC1gyrGUFtw=;
        b=mlNx5hqnr9vlW6WuoOxYuPyjx9y1WkaHXxMCXOXa7cOWGaAgStntP0z3yFrmwrgcU9
         3ACuRnMgtmtU3i4HontJX+tWEuA8n0bbCkNJeGNp/pml/NYrgAl9HrzWWB4P5PAE8f0q
         Scms+xYLRefZaQIjnI9sx9jONBlCntqVCRXmfWEOgwRCHd1h1+tIuDhhIwpa0LB92Yih
         f556BnqRIJQp3C2jwBXci8mLG77KwdOgg1e1njq4SA4/zFmTqIcEfZT+SWT0KOCDcGeV
         /957/gciFODu8Xr8QLkXI7/9EJFhG7NpEGrpLnsyFn0itXvKRCV6YzRIgqiIJKFnp3kD
         sEPA==
X-Forwarded-Encrypted: i=1; AKwUvBydKGot23MgsCjYnl1vBIHYdstS8r6FRXSDX3f1UjZlpyOuCRauDFickUxb9kXOQjrUxjSdI91BC2+bYfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHD8xMdYJ9L5+0fqTjn6ZKiJcesQKHyBs9uCwD7NxJFkHpn9et
	Iy5HWIB2OsEZKTnpMNUDlQK6lbXlr9Fbsljw6r/BANylI1YkMxIlHIm2
X-Gm-Gg: AYBFou3BSbTiX1GsNThzv/8KJMxzYlaRzlk2DjreN8uQctDFZ4A6x3FO1PpvXoFagOE
	d68g5PA65gE/qrzMWDskZp0/h2e3GxhnZZ97vm49+HXUyd2IFvy7YWC2QOs8aYiO4I7QJvLq0lc
	gl+gj+rmM39/aSqlMeNHRtEBdwGquqgSAZvV+OlRNHrx1Si39avUOIweI9OD0+CXDfm4iixyKxg
	T1KQACwfQxRgKqjIFjh5gofCzozZB7XWeCmYDZU/+Bw39kHflzhbSIyazhqq26CBExa6+8+O4q+
	r9tHOpM5zcK5tGRfyQGibaNe+P3mCdHJ4kIAbO+xaYLrIySYTMeFVVtHtjQ1nHQwoFV9jYQsYvI
	G+gFO+4ht5bDJs92VYduY4qUAnvZYMybNU1EcwL8VRK4+6IVoMIL9b6qoSz7xi6wL+WmCF3B81t
	2jEkB942+QvCfHoH4HLyFVZfWVm2UtT2dmIR5Rn+NDZhKSR4E0ygZEWsp9JjMt8yioG6qQOVDh4
	QqvoHk0bn0=
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr425675325e9.4.1792149560981;
        Fri, 16 Oct 2026 04:19:20 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4398611f8f.2.2026.10.16.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:19:20 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] kbuild: depmod: fallback to /boot/System.map-KERNELRELEASE
Date: Fri, 16 Oct 2026 13:19:15 +0200
Message-Id: <20261016111915.227860-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Verified on Debian 12 (x86_64) with Linux 7.3.0-rc7 packaged via
'make bindeb-pkg' while installing out-of-tree VirtualBox modules
(vboxdrv, vboxnetflt, vboxnetadp).

Before this patch:
  INSTALL /lib/modules/7.3.0-rc7/misc/vboxdrv.ko
  DEPMOD  /lib/modules/7.3.0-rc7
  Warning: modules_install: missing 'System.map' file. Skipping depmod.

With this patch applied to scripts/depmod.sh:
  INSTALL /lib/modules/7.3.0-rc7/misc/vboxdrv.ko
  DEPMOD  /lib/modules/7.3.0-rc7
  (completes with 0 warnings)

And modules.dep is properly populated:
  $ grep vbox /lib/modules/7.3.0-rc7/modules.dep
  misc/vboxnetflt.ko: misc/vboxdrv.ko
  misc/vboxnetadp.ko: misc/vboxdrv.ko
  misc/vboxdrv.ko:

Tested-by: Adrián García Casado <adriangarciacasado42@gmail.com>
