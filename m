Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5473839B9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330908; cv=none; b=OUxs1JaqPqW8CqDSkc9vN0VRm1W8yzdmqsKQvj+KxRLFAqNVlc9Q/VOp8skbWtZS6IgESMgBL7A+VzJp/DkobNNgOLt1FS/LghIMlhdtM/w0LWwVKEJFU/FqjJgb2DATPclOhmBzj92V8hRfXNupiNXCYblbDIQCeHHtE2wbr2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330908; c=relaxed/simple;
	bh=Qss2ojHxn+0sL9+n2p/yEGf54S/LdwCMSlTlBjccvuU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=GGOjYtX8wmPtPC8aLCW6XUa9pma2kT60N+yteMiuciP2UN5YFjAQPEP5IpIItvkelhDV/4Xb5+8uUtplqnB9Rj2uT09wofomqftzSzHMzK70WSb5cCfTRpWx02s9ZJw9tSB54KhLWP4BZfYnJXICmc1QtyxhXAZ/uNBbmzD18kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXg9SfHQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXg9SfHQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a02718da81so10679195e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330905; x=1791935705; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hc8zFHX/H3Z04+Mk8kD0wTP8j4BgYHlZDrRkuIKnqUk=;
        b=lXg9SfHQOrC6Zca/MJm8uFsa7DeGYXFthbqS3oCWF/HdMwMg56LJY2EVHdGnUWnFUh
         fsnuZlY6ZlVijLz5tcmplkUKuXhT11Sbex7znONWdj21PIfMaS3fJSJhez+I2CyTQ0tH
         fKRk8yLWGeHjRED1XmEK0fXAsGYqkwQunU5OBJY3TxDT4PaHDKKSsB0DQWn5cLMJ6wDy
         xh70uPBoXmbq7mtMY5o460cDW7w3sURA+fmXex2KQnyoyoD59fdHpQPCAgpVOakalOYr
         PZUB1zMbZleinKNGpMNMRxWSKlPPUhoAxAG5TcrujfvCjgpX4ki+4a7JVF/BEMljHz7E
         C0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330905; x=1791935705;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hc8zFHX/H3Z04+Mk8kD0wTP8j4BgYHlZDrRkuIKnqUk=;
        b=CBgw9KbUQqt1NGaUu9Sx/+YFL2Ie+lk7hLj/kiEEeE6MlC9bQZh8gxNq4ERQZSPLoj
         bwrcxHWz1ir5uhXcJ54oyHx/S7vCWyI1NB7jcLyVY2vCL3+f6RmIkv2Bb/NeFn2z51cT
         4Yz2qAOyZQb5ZgukzDZQ/mk3z/wGl8NdJkUUmWx+Gc77tZ/vOtiHPlh7kFfmJ2xto0UN
         3mgaf/VXb8OfdC9veQk8NkPwDL1RSxuutUeEej9BMUV6xiJ7XpY4cEL7UKWE0wJzbuEl
         GwBUcAkF7q1e02oZNPEKG7NB3YR4P4wBVKzUvZcdPFcIggpGlXdpoUuBJDxKrGS1P5vT
         UXjQ==
X-Forwarded-Encrypted: i=1; AKwUvByrn33Kp9wcpCo+15botz01QzLi8Rwb9AsH2oZMUSxUt7QEM3oMtPQKUQraKOtfuUaMe5PbwIYAz/sgcVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nJF8XDbJPU7xWorN1Je+4Xw3dwMWrr9Dy7M+IYPCTIKFODRfxT
	Vvnhz6dKTXzD4iQE692g5i8CDriIerndf2lodEPj7tFOkeaLzY34G9o3
X-Gm-Gg: AYBFou3j+gdNNX0q8YQulxJhMT43yWYc6Ndjom0wwbDpQZ6LOha/5BqMWZTzufyrkd/
	B/M8POQHNG0gzSNzr03OoJlHg8FyOBn+g2Bne1r4rkhpM3mELn7A4zP5JmPVGVIC28dqKADcxNN
	Py3qJL5n6wTugDj0NtEnEHhrhoXEFqU766gUW7YJpxEy7bbYV0k3i01kfY3sAO5pax3wA0Vsg1v
	sR56x4pduH8sAl0CFXqhu7O2MyKs1maO2VKDSr395ZmQlBCesr8P3xS/Pd2XwP7b1R0aG0CQXnn
	+2pfpJFwuMP5rqAwgbUuveWansbZ+B0Ypa5kG3V1LjrRxuM6i6PVgEdRhtzp/bMHCTiCWb0jPS/
	TpHnuZqsz2wEX8K+HYGcFZzsyBlv2XkuzyVUktaMrHAm5YxcOoAbnIrJOuByTt4v4jgLCInc71o
	9iDo3BJ+FihzDEuY2qxqtOY8kINKrYUgUFv0sRY8opOOiONKxljRv5j+kazvd1jV2i4YMPoihmK
	udhK4qn5eQCtZU5LaPcN1c5rUFZFW124B44vwWefUOo7g==
X-Received: by 2002:a05:600c:5254:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a180310d31mr5486895e9.16.1791330904950;
        Tue, 06 Oct 2026 16:55:04 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm102154535e9.0.2026.10.06.16.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:54:53 -0700
Message-Id: <179133089395.137225.16486951642128892687.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791330897; l=1649;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=Qss2ojHxn+0sL9+n2p/yEGf54S/LdwCMSlTlBjccvuU=;
 b=QnjYYd2HuP0BTDKdLSAOgOIcmv68bMm581AJecHDSqgnAtDJ2LizBYt2VMgfGDpp2rmBvD/Bl
 SWhayfIbCaFAiaKfdHXaanweBUt900Ie+QcwWtcQEp7YNowbXP96WLd
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

> User-mode use of XTheadVector requires non-Off sstatus.VS, which we set
> only when has_xtheadvector() (CONFIG_RISCV_ISA_XTHEADVECTOR and
> XTheadVector on all harts).  XTheadVector also bundles operations with
> floating state, which additionally requires non-Off sstatus.FS and hence
> has_fpu().  hwprobe reports XTheadVector from the per-hart vendor ISA
> bitmaps alone, so it can advertise an extension that is always disabled
> in user-mode.
> 
> Report correct environment to user-mode.
> 
> Fixes: a5ea53da65c5 ("riscv: hwprobe: Add thead vendor extension probing")
> Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
>
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> index 2eba34011786..f07aa1c8acac 100644
> --- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
> +#include <asm/switch_to.h>
> +#include <asm/vector.h>
>  #include <asm/vendor_extensions/thead.h>
>  #include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <asm/vendor_extensions/vendor_hwprobe.h>
> @@ -14,6 +16,7 @@ void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpu
>  {
>  	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
>  				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
> -		VENDOR_EXT_KEY(XTHEADVECTOR);
> +		if (has_xtheadvector() && has_fpu())

xtheadvector is also gated on FPU=y so this is a reduntant addition. Is
it worthwhile to make this change?

-- 
- Charlie

