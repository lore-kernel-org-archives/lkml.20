Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE81F63D9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839255; cv=none; b=QMI/Gm3hUIDMabilaH4buObjn1lgA+7b6Xtm4QqSXz7QV+PqnMy9O83nDsHmWaztr0T3NsgfIXLWlf6z5Oovi61TJ9TbFTZRRQucwS9UrauLpgCtr/mP66tgtjX1FwUTzlTqX5jRW/69l8OW8yVydHTP5yTyGEoYyTb73+VEqhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839255; c=relaxed/simple;
	bh=4fVONmqIve9tfihfLbhyhkFg+5frEM1AkFNTLAwgFwQ=;
	h=Message-ID:From:To:Subject:Date:Content-Type; b=Bk6nKqAFYy9/PTHgggvbJs6ZINMQFXA5tzZ+KwHVF4dMns0vQtcHfn1ZqV+aoEAf6Tgh9o5Tnvfic9hENZU3Z2kTQp2kgvhiGCZqW9oviOu1rsNmJvSXThl48St79TAKEpFU5beBTENB0Fwj4nNhoOitkO831OcbNcbGnYMHORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIw0Uogw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIw0Uogw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so5436165e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787839252; x=1788444052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:date:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fVONmqIve9tfihfLbhyhkFg+5frEM1AkFNTLAwgFwQ=;
        b=kIw0UogwuQq5EYTToGvBB5N6eTkWsMT1UIShCgd+3uNNeMZxpou9x/1TCO9Bt+hLq6
         LaOsoG96iN33dAS6dKL69v3SkQ3wKNchuZME5t+d1MMTpwO7gliD7n9CsFcciifOo3ug
         gb2cDx06X2AbPOtDtCrPXcw1c6KLctQhFzQnyhLI8oggUCXRfjLRmP4ed/joZcbdYLpK
         bmrI363wOPwbn1hTKZxDnnoCkX1h8kCV+7dcwBnadVaxfbbnK2Q2UArmawzHSF7Wjmcq
         nW4AAuAL/e7Av4m8hsyuVLyXEQFLwgQAZxvSUM+DyEQ9R1TCMC91C6ZyOTxBYZFIvnqN
         /TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787839252; x=1788444052;
        h=content-transfer-encoding:content-type:date:subject:to:from
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fVONmqIve9tfihfLbhyhkFg+5frEM1AkFNTLAwgFwQ=;
        b=LH3xTjhfTHiGvO2oK7eNiAh+m2VNmi4OVmGBmFaux5RhOyJX1shDPBFFtJj5FMV6f2
         hNaIP1S+Ct80EMvDdGZ35+zl2az3I2WZ1XC/Zzx0lF6vzP9K+zHOO+UjMEFHFfvf0PKj
         gjY/5tV4hIgmiOiOvgVxuHYrMlYayyY1VSuRyK9+XqUOP28aDfqAdEcI2OEK+v1F8u+a
         3gQRH35cjfIeF6BmliZqtnSl4gyaGrFUTz3LiK2hcecHY8Cr7CYR5ujK6C7fiJYaghBp
         10zDUuKuKrsbX5frn+6n1Ae/gAuhHY1Xs3oLrfMJmF1PNZyPcbM5/Pio14Gyjv4LRId1
         SoPQ==
X-Gm-Message-State: AFuF++nWffNSbazQEdM9Bj3AgVxuGrP2H1yyDa40ajZao1EAhYkyFmur
	foDc6UytKPNQonMmv2jC18G+yhf5AsUAmSa4X/CJw0mqHxZSQYG3SqGpI4TyNaudq2k=
X-Gm-Gg: AR+sD10Gl08+voOdfcl9U0Gm117lMeQGUGtgeai/2tKp1Z7jetesDb+zmTyJRCLsLv3
	k9QRMZMZl9KWf2LyGUq3ZvwGnbdT8sYM+mhlLn5IPm6vBwzYxikzaU/vMqKXjbB4pmeKGK5YjMy
	F9wYoIOWFTrLUuV6N5FPofVHshVjQ5QaZChLNNFJeOXJ/RKjLQanvMPdb4EbnYPopuQ/4jOYyr+
	POmo3DwVVV5iUxtLBpJRDwwmuTwZwHDLA9S2mb9habQYcgnAqOmL+0wiaRYKrhw+OPo3dfzG0/o
	vLKfsrgHZ21LRsZN8WvywpgNlciJ9ZhmESbMXXXbnsCTK+oRawBRG5nptcN3pEg4OXff1WScXeU
	kTelTRSwkc8sjvYh0CYzEC8wdOTebyyDvSll+WcD6D8Ys2HKrSE070ZTQdJ0DncI7vT2zkrlwOq
	P2/SJLXP/2UM0JRIQu6f+ouBaTZhDn04T0CmxqfvBKBEITzRXgSFXIDT4MO6XsA2IEYKDiWy/bB
	OPJ945f4TVxNY8=
X-Received: by 2002:a05:600c:c3cf:10b0:499:d880:ae40 with SMTP id 5b1f17b1804b1-499dc724098mr141180885e9.10.1787839252222;
        Thu, 27 Aug 2026 07:00:52 -0700 (PDT)
Received: from mensaje_lkml.eml ([171.22.87.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4af00fd2sm50497715e9.12.2026.08.27.07.00.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:00:51 -0700 (PDT)
Message-ID: <6a904313.1f1211b9.143e45.f01b@mx.google.com>
From: "Adrián García Casado" <adriangarciacasado42@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [Test Report] Linux 7.2.0-rc7 stress-test (120s) and hardware validation on Intel Tiger Lake
Date: Thu, 27 Aug 2026 16:00:00 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello Linux Kernel Developers,

I would like to report a successful build, hardware validation, and stress-test of the mainline Linux 7.2.0-rc7 kernel on Debian 12 (Bookworm).

---
### 🛠️ Hardware & Environment:
* Architecture: x86_64 (Intel 11th Gen Tiger Lake - ASUS Vivobook)
* Active Kernel: 7.2.0-rc7 (built from source via 'make bindeb-pkg')
* Compiler: GCC 12.2.0 (Debian 12)
* Boot Parameters: clearcpuid=smap,smep ibt=off randomize_kstack_offset=0

---
### 🧪 Stress Testing (stress-ng):
* Duration: 120 seconds
* Load: Full CPU (8 threads), VM memory stress (75% RAM allocation), I/O, and fork stressors.
* Result: Completed in 120.02s with 0 errors, clean thermal management, and no MCE / kernel panic traces in dmesg.

---
### 📶 Hardware & Subsystem Validation:
* Wi-Fi 6: Intel AX201 successfully loaded modern microcode (iwlwifi-QuZ-a0-jf-b0-77.ucode) with full 5 GHz network throughput.
* Graphics / Audio / NVMe: Intel Iris Xe and Sound Open Firmware initialized cleanly.

Thank you to Linus and all maintainers for this great release!

Best regards,
Adrián García Casado

