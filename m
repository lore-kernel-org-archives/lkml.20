Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792446998;
	b=EcghVK8VLImv0l02jmu8G8mhbp3ob1Z0dkB8zBIBUofPrm22HPA2brGxBsmscY1Ru4Bk
	 q4qSwUTW7VJA4+/HTUd/GwPUrIFnydDGjBmjKu+2Cj9GKzIL0ZlNnb1cBZoI5yDEdHZjJ
	 9cu2BYuWImJi3c6F9uu0f1i2UpfyfKLiyVNUTW99VIGCa1obPhOwwQGOswB212kll2Fdt
	 Rrebi3UgeUAvuFfkPxvyL4I3W2ZN0dR0JcOTJJh+eUvew2rlzCj/1IYYym+aNTp67Niy9
	 FrbHa7KCnQcYb9PrYD0IBw2mg+WmzeqnTIWCatrrwA0j3kmO1czAla8nhMoo/h6ngGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
	b=Qr6f8xiJji1RKEzHAfbcBXTVeoFUVryUimkADImZhQdrlJj/ZUOJPYolW05OpVO67nBJ
	 DaBKKt9lqs3TzCHRHtEh9dmR/simbysnnZHAvbTqT0GLNzsiHY+NU3Tlnkd9cd6gTJB57
	 y8zqeTiMKkRxM1ZQsrrUOvt+uWoSMDetXT0C2kINcIjDX8JHFM+kppqnpmPqrP/uS+pXq
	 VEgpR+O0VCkDWBvhQAgo4quqSvi0KwPhFFzGWJ7pc8UXruWc9qEy9cOSZlKz4Fxi0CUXk
	 OUg11kRkDjEb9yodbXMr8SjKO8YuOWH0z8hpu1KQxvQFAfFFHnXSdfDTwJEjdKyBOjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b="ZaSnfP1/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2060D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=ZaSnfP1/
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0a3267baaso2963047b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792446997; cv=none;
        d=google.com; s=arc-20260327;
        b=kWXXXHUgMKVxfT6WsgTmjPcherc4VUuY3zFDN36BbjClhgJJNmqvcAUs5nXIYZxrBI
         O3Ik3TIzgJ1eQUb0e3xl9UTC2OYF1UjcRoCOIbYma+27RQYhdqTmy7q2aZzSMdWdRrVG
         ecId+6ecJuQ1PgurEoE5geKQW7moIIcB6CxUXXVHVgVvCeHJf54CesKXLQp//7pc2gMR
         Pb4jIwNHuo1rQe0XVJdJymmTIPUOvRtnWxYXp5yzOslz3Qt3fOmNfm0TUGAxQgGncBt6
         +zhRABBgGeGCmiGbDf4upvt7LvMBfXMb1Hny66e3cUr1uPvdKpoH6uR44YXxAeWVgIhU
         otUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        fh=lqKrqDHFBNjbB2a839AV2kTCJieLhqbm804OObTKyV0=;
        b=Fa3F+IzwzpfyW75Hljm+SRnfWCQxYb7ieBTMPA8pspHZNJh4BICGJfKLUSiTS0Spw4
         91voa4ZnWhMoFDiyNRfRKEs0jirvbT7Ru++4YZhhWNjqcfVJchlfFC7KS2xCDjeiLxRb
         lG00AzeMBMs8LzXDahIYYt3Xi2NPEV3wPQ56SJakoyNY0Hj5pvXfocTjkbLIIfPgNONl
         j5353/iBpvJeSxL+dOBDHArOe+96Dvk810vWU5W9lb/XRlM9M+DYJ3CwnE8ke55zPbrk
         7mqTtLR1XGoRDWTO8ddvkglLLmvYcs7UEejJ0JnE8WCXVlt9WgMEZySyB6yoN33AcgcO
         0Jgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792446997; x=1793051797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        b=ZaSnfP1/XHLHAiaalCKV84qqlgMmBr7/NttxXl65fwlraARdlh4VxwOhHvsR0cgLr9
         aVkmpPjL1a8kWfQLx5OOy0/2Qg8YceX5fv5k08Msc3bnOW4pkamaJi/q+MMaLAkuZK7u
         knO/ysdviB6rtDfLAmAB4pxnSwd+1sORi2oIBcHgGp0haa8E73ejKEUw6hm5Y855b2ZE
         q8RR0hZCHexD0aTxqfBy2eJ17ytII97m7zx9LrNuKUnQx+e6XrB5/xe1FavhFulTEW1g
         O9YlTFxyqLiVg+UohQH1fJJPvqUSCfKMfjpjkNP5p6wsOKRC3DRxs8AxwBksmH35FUzL
         ItaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446997; x=1793051797;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        b=X42PhWlHuWXhyY6ndUHR6jTiTmWsgsK29+oLfSbIaWu1NVhcVdFgzGQgGypVRCpq2S
         ssfNvh1ebNfBeYir+l+Okp7F1wWq/wsl+WSnMRF/YWVes16ce1YP1IPtIdBMhjAdN0h/
         74w0dk/ZdbWlGyrlWxp6RiWudUcGP/IbKJFJiVt3QXzs4BvmGfy37uewd2+VLojVo1uO
         Bk09Szn5tkZTjPzmLH8JxAoYOIrvx77hTK5vhqHb9UBaaJVc6syWktVPZiQZ+QkT0CsD
         gcERl39dMwUuXaqwdRP7DR1hthny/bHjSAbXz6vajM0uDsmEoP0s1F5ThsyUod0H5mKW
         lGzg==
X-Forwarded-Encrypted: i=1; AKwUvBwfvPqNfMheh5BgJUsFsxDTHLJbqoEtoZwDWWTNXEYFS6hiLtJSZyElYbNepYJl2nMJq6AFM4Aeq4WVKOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6KVrx4gP+zStRCTm7Y+QHVF8lOQARw5A+hyjTafR2QV9G7b7z
	nK9vm2ahK9Jbuc4Ey3WuLTT1gRh0ErlpepPkR9KhW0i9N+eGh915qFWcFvWJTdToiBt0p46amjJ
	VP5WF17wnQKOab29CZaBZaCdyor/iViwKaA7Bmb7tdrQ=
X-Gm-Gg: AYBFou2YYHuHi591E164iJ4LN5cpwW8rtu/2JxZ8bBDztVJswMmsbKNxLPpGSirW4yY
	D0YtjccdB20wFwmHK6mv4KtQ2kwLoTBW18/PDt8l07XVZL0Rn9t5T9JWFvGNn3rdd4Czdj4lN39
	cEGaujE8JBEFjwS7JYInIAumf6txVpTd3HJ6XacCbZ3PksRBtWPMOfYV+FGX0dGVBR60NfqUGhW
	w835goFQK2TzAA7QuYH9vJJ/YT8nk4q4OThykaI4Xjxv7LG6LIodTgFB9qO9y0MxHzFHXKTlhFE
	J7mxMYXOS1jRdOQboRx/oGtUKK1fdBHhHUlhVnXbdDX4IIYuoNmtpyTN
X-Received: by 2002:a05:690c:78a:b0:8b0:d4bb:d82e with SMTP id
 00721157ae682-8b0f201cea5mr54319837b3.1.1792446997027; Mon, 19 Oct 2026
 14:56:37 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:35 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:35 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 16:56:35 -0500
X-Gm-Features: AclHuK8eyO7HlcwKc2GYb3AqN5ZWr3BuIJrKjRd-TDIzTJsdA70_Da8TUaFuekI
Message-ID: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Subject: [PATCH 0/2] media: ipu6: make 1-lane sensors on MCD PHY port B stream
 (ThinkPad X1 Carbon Gen 11 IR camera)
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The IR camera of the Lenovo ThinkPad X1 Carbon Gen 11 (OmniVision OV9234,
ACPI OVTI9234, one CSI-2 lane on driver port 0) has never produced a frame
on Linux: the sensor streams, the ISYS firmware acknowledges open and start,
the PHY reports ready, the CSI-2 error status stays clear, and every
capture times out.

I traced the sensor's I2C traffic on Windows and Linux (the initialisation
writes are identical), then compared the MCD PHY register tables in
ipu6-isys-mcd-phy.c with the tables embedded in the Windows IPU6 driver.
The Windows driver has no 1-lane table for PHY port B; it programs a
1-lane sensor there with the 2-lane port B set. Doing the same in Linux
makes the sensor stream Y10 644x364 at 30 fps, alongside the 2-lane OV2740
on the other port. The current 1-lane port B table also contains one value
(0x5d060100 in register 0xaa8) that appears in no Windows table; it may be
a transcription error, but I have only tested replacing the whole table.

Patch 1 makes that change and removes the now-unused table. Patch 2 adds
the OV9234 to ipu-bridge. The sensor driver itself is not part of this
series: its mode tables were recovered from the vendor driver, so it is
published out of tree for now at
https://github.com/carboniste-it/ipu6-ir-face for anyone who wants to
write a proper upstream driver. Patch 2 can wait for that if preferred.

Tested on Ubuntu 24.04 HWE kernels 6.14 and 7.0.

Dan Person (2):
  media: ipu6: isys: use the port B 2-lane PHY settings for 1-lane
    sensors
  media: ipu-bridge: Add OmniVision OV9234

 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 31 ++++---------------
 2 files changed, 8 insertions(+), 25 deletions(-)

-- 
2.53.0
