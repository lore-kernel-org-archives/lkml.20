Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573425;
	b=cjaouIHLYgJH7+jLigVx+F+zvQG5qwWcUq4COyXZDLtP7EAt4HQ8OmxE05LKdaRs+12U
	 pnn6Lposw0kMbKw/H52IuaP0j2U0U0LL8JzQZDM0Au9zAZS1GyiIJMVtiwsMwUzwRueKd
	 l+3UgGnsOQ1Gb4Rew6BlMA0J/NVxk4uZvDj49o6OkaL7pSKzP9bxE/Nz2nr1PhTiwu+36
	 2D9rlNJQl5n6MvaBN+NrC2SuRanqidNCV7FO2qfF/ftPIg1U5u+17mBkBEUp0Tk8rG1XO
	 WDg+9WpjHh97fQK1TMnBWJJkAbfayQrO4R6e0pmoruCwVhNrTUZV/uTvXs+IKVNnCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
	b=Cqt0P5om6v/Xa+BlBFMAgWnjoFPXe/VQYRktScNocvVYFEWTb4r7mRF7+guPNkOJDavV
	 neO4vh1an+ZoHYfFOsDXYDlU4wzs59xOCLY+zT4PhkHQEyc8xrPLTTqOkzswLjDKnrb7b
	 8FRWwhR+iWjtWC7lBw2De61kHy8hy6YUzGNiNU5dVN8bgNpT3R+Bv3oUGPDQUdT/s/Z8L
	 02ZoVdhqgIE781XVpNIzFlYuMrQXaGGNzs16lA7cJqeYX0rOXYrglg77JLlvX2o/Q2Tlv
	 ETGiNxIcCWjnzkTSJmImHegzQXVOsC3UG17zjMbGBzTuIF7QfLxBkOI35TZmv3i+uzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n2XPHptJ;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908F606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D908F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=n2XPHptJ
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so3542015e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573423; x=1795178223; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=n2XPHptJWAiGnWBjuWK6g5NkFljgiKFcabC8Vn0J/U7Rs5oCxIs8ae//bm8icbKFtW
         GhaGag1Xoi7ZyXwdHESo4gzqQGVIFHJ4SWyDVffZrMrzihrR6J8Y41NroO1pUm4S3UEM
         GevRMV87lpSFNCzDE68IInZGbL5X+gYDk7IApotAPKeUo9xOfBbHGBSC5mcggp0KJBcK
         Nc+e1mR1SmgmgC0Frha4Bk72pKDTzd14yUseYASwtvG8qZfbG+gNn4GmoQhA8ODET64L
         X6SskqZIriPJvj35d5mhI8G8hobVKdLKjnxeG6bMHAYcCPTjUD9dRkaaJK3nWVTXV/IA
         bDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573423; x=1795178223;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=ciVozNymThibjT2VpJTJ/du2r6PCbUhsSk8IgTzDWeprPfXKAZlRJG7iGg+EjHolne
         48To+4d4H71tUDwm0zLar1JQvPM52ihjjmFzgGVvl8l3w/6e5gMT+TFiw5K0G0Uj79j/
         tYT7fcCm11d5YZTl2/dAXzgmgK4g6XRdJ1855LAEExoR2wkkvo/lkvRyoITk9IjsKlzT
         1v3/zmESugf01YKG27nSauSmGKeYkRaALc6yr+DGm0ZuVKOWdViQXhAKauQCQlU5jKZ0
         EtF2oayabrONXPYmWt1KVpmDx7eAondmXvCJ2SwXK2VMJywTvf937m2fnnVqE6dSFSFC
         MIDA==
X-Forwarded-Encrypted: i=1; AL+hErHOxig/dPmKnXgwQCMYVkc2ZHhAy9ZzlIBiXTcTHGRDesVf6SrfQds0F1lSsRw0apXrwxW82/QUmn/KkLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9/h9d+DkS1bLyO43zqof+dNIsfmyrsXr3TCkdvR9LUT4CWI4u
	JVF5JsukIATlt2s+pJO59iVAGPe4oKnKr8tziYdmUpPHxrpyJymgBih30YPrXB7L8kSE
X-Gm-Gg: AYBFou3szxK2/c2T+hCzjyC+nDf/P1EdhU0JDLBLlraxkdW3rt1j4UxXmm2gpAscayH
	4aBQaHOs56EdePwk4kiIRn6HFbGe1d/7w9ugl4qeraQQC8hi6Ue62+cef0cbSZcwEgeAHyWuIpE
	nrFxFRTPJq46T5ZWUFG7BumhJX+iMdr2xE2ktxR7A527xiN7cuL6UijIfmygxK2bVPoG1TEaZy8
	E7i8wXKrWxe+X6PQhTs7ryY6c4vHcdalJYMRs0Dz8g4KS9LmYQBBeyXzO0Rg0uILjlk/DhuCzmA
	ElPUl23MWt/zggtMS2h/UdSbVCTj6LVkQsXE3I1mNgelwooKhgr4Sy1Zc4bB9fiVSkTgkrYVUDa
	LWfG+ZnPfYS+wVrlK8EOTMMvBg5MMvkofl2ELME6aZjNuAYWSiLSxdTky1x65V60/WSF4j7ASLj
	mc6ADT1tQMeI9oEKw0ohgMvanZr0J8p7L2NWBWli3PqadXqi8DRP/XYiv6aExBPwsa5QqwfdDjC
	FQ04IZpWv32G3IgMCggpnoMUlaGfLVSx6EE+G2ryOYI1euSQ2Wq+LM5Ngb0ut1MsbciAHtXJVt8
	A+A8cnhr9m4pPGdZkqxhJVZjiYN4GmDcQ9Iz0FSf/GXe8I6tagxr875r2V3YUFKmcdhwPvTliCz
	+H67h7dtL
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr49782945e9.34.1794573423157;
        Fri, 13 Nov 2026 04:37:03 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm57437255e9.13.2026.11.13.04.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:37:02 -0800 (PST)
Message-ID: <f12140be54ffc4d1e8e4026f80c41c75cf5727e0.camel@amutable.com>
Subject: Re: [PATCH RFC 39/41] usb: gadget: f_mass_storage: refuse files on
 pseudo filesystems
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 13:36:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> fsg_lun_open() takes any regular file as the backing file of a LUN.
> The
> file-storage kthread then reads and writes it with kernel_read() and
> kernel_write() on behalf of the USB host. With a procfs or sysfs file
> behind a LUN the host gets to read and write kernel interfaces with
> kernel credentials. Refuse files on pseudo filesystems just like loop
> does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/usb/gadget/function/storage_common.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/storage_common.c
> b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..83683ade20c2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -211,6 +211,11 @@ int fsg_lun_open(struct fsg_lun *curlun, const
> char *filename)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(filp)) {
> +		LINFO(curlun, "file on a pseudo filesystem: %s\n",
> filename);
> +		goto out;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If we can't read the file, it's no good.
> =C2=A0	 * If we can't write the file, use it read-only.
