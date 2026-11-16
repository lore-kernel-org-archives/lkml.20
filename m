Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814588;
	b=VOmLU4bkiBXfJjf/OGx10JLrPaeny53Mnizs5Ea/KIKV5eD/6C75npY30oNOdek92JdS
	 NcBVDkeH4PI/0AFobbsPJpZxwy+Zfdk20TfHYcWz4SJQt+fZbHzcTJPvQl4gvGH/QJJiW
	 JWzk9ko9D26rs3gSfZgYT/kYSYuO/rhNswHjuAgBZIr1CeaGhe9Q4o2CzSrexojnhTsHJ
	 SQshg/reKVOeYqQXe85UW/pGDdM4aj+kEMGJq+5rA+B0nJCyHkhwyGaUNHdzY4PiaZ1d+
	 /M3Kta4UtJlN0MUzrM+O8xu8Fbh6O0TlnxJlnW9rHZqpjAcH+O5FMvN1SyGZ4WktSRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
	b=VcofjVrzzBV950gdJaLLlbzLwpoKjVPCIJAqg65twgoD/Qz0AsThJnN6iWzUiVrneutw
	 qZmwZ4eCRj0IhjkORE5OiF+Pv30sXzFSER4C2PaQUgXzp7ZWSdbSvo7Xi+JqPdoWVVn3D
	 shujlkQ2UQaWaTgDPHBvIBoSZyGr7eBupQ9y87nQf4Z/22vOnxGsAKRKhrvxBXLUlQS6P
	 ipm6TF6dldc+lF0sgqzrgm8Xw8iPSD5l9YcvMYzzRophTXSpcrklbJxNLObQau8CXHGXZ
	 /p/vLuiODCvqiFuITGv1Z+rVDk1IWQb9aaUGvfmB3ApghYslvEebSQ5mBxJ2xcBzP+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnQnW5MM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932C606A8A6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C932C606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnQnW5MM
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4600373a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794814583; cv=none;
        d=google.com; s=arc-20260327;
        b=O6Wa4kTRy7FTEqiOHy4F6pe8mwikmwNbw7ZPk9i/ZCiYNoxttvYgPUcKuUD8Qr9i3i
         WnR4eIXlrZueZn1RpIGSaEfc93tYUUL7mO6jaFvwJywXoZXE1pOyntKQj3I2VhMaLEVD
         vFt4jNka2PbffAljim5N9ejcJGQ5FbscUEpFvTDj8etgySZZXXv0890JnjIpU1VLqaDr
         aXf2EpEL6X/sRh+8pOi4wv7lIfCxJz6vD0ysgXWxH1EVoNr0jjbYbhI5gwerqgr+hcb8
         D/RKky3plItwnLXCH4yKqL2FjBd96ycKMDcUkYHXnhq/5diEeNXZPQ/yQlijet3dwsMb
         c+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        fh=d5sTNjXsa9bQ5NJNu8qI4pQrGwYdAYVdac/bB21WTno=;
        b=jho+J8LzNmHucq/5KaRsiZ4n6Y5vnYDic0hZifpWIyFBDfOiOyJnA8QyltExD//Gkh
         9YfksHMLg98WrODcdVkQ4dpPYOz8Tvk9GEPjBxI5FnuLR2DTNMq6+vln7FyU213gfWeN
         R8uRy8HuL7f7ULrxZEdt6Qe2QXvKQuhdclh/hIzZqCxyS+MtAMZJchWGumEBPbKIs9DZ
         E2Ee9aJl5iW+7j+wdW8Kwrkr/WkR68gJzCXrd6BQHIbQryiCTg0jzUoYUT4Gc6oQXNoQ
         axRrQn0oZvaqu+PvEffmjdniJnaJDlD9sSd95k20PDngO3e3PrJjzKYGsfvSCdDNtLaH
         d7KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814583; x=1795419383; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=ZnQnW5MMlw8g4UDJend73b2EqQM0QB6Z8uyJYgtQ4aWw+rMVJoWthx1owv+BmRqFOb
         BaV9WEsevPIZPRXbf67ehZ2/dHGqWOZumsHCVrHC+7bSpy1pqBprWCWjAd/qANlycO9k
         mkdoQkVuTYaLPCk8+WXG7XLf0drxrF4UZLTQaG3NK1fY/WNM4/vsqkg32Ngp9X8HHziM
         6hmqdHWBTZh85dtGyW43TYABPZ+oayr3KHt4yRA/5c3HIdT1CHuTrvD6uEWQshbPdDGX
         S65NCW40Wgb6igu9RrFlVaKXoNFE+80lUaqUlStIfZQTiODQiRQkUhOPtunUJCYWnmJ/
         HZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814583; x=1795419383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=LFa2TUrPdIB9WWPfHA/FIzJlNXSGa2cJLG3nTXKmvmDDQve2QTYroC0W2g7fneifKD
         dHvQxfWP3+mZ3Id85eP7gYH0W/RPwMjIeB2BPPhSEzkAUjPpYvQOaX0FKB/NN7Kn+m2f
         4IqfEV/Fbcn9XcTB8ZM9ve2SBNRse1mbPUGPl3byZ1pAPnVghDiOjxz+L1c3j6U/T0yO
         LqBXsrUxcStMI/52eQQOXNPDjjZ8OK7Dui8Okqy+ZMaP92NXllqCIU7h7hTZMoEH4/NW
         ZmDQTM3EDwKg8rvXQ7A+AH2mDHcTd6lrgbhneOroRzj4p0Mw4nzxANoQVRhPDBkg6R7E
         RQaA==
X-Forwarded-Encrypted: i=1; AL+hErEnZavCD5LxEtCdJQclobvPgEcSk9kgyJyMtlyJJ5dgXLNCdGKyZl0+y7TO426fsFj3u7P9mQsZdsuuvzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rfKfIJZmoZIRrP4D/l+WQbVpCA7Xy9E1lfEoE7mcozyW6orLn
	61v9viblD6j+ptWWoLQE+6+GvLL7MXXqGH089S/7yrLwA4vmkDr0z14wGOytRHGH6CzzPc9YA0v
	+AuVMCTOgjNgN3zPrEeNHLHyvSgUQECM=
X-Gm-Gg: AYBFou2tfEx/7dq9zthu79/BKUOIO0DqhInDF1Id5Qq7fLC1TeESvbpNey8umxs16T+
	fn12+mL5xnJjPVwToMsBT8LL4lI6VnAjZ5GDylAx8KFQmoAs/2zb4igBvWznQds6X+Of+3ckRqa
	bbkXfLZppixZ0sLL/iCA5KIl9bKfDgpYGQE6PaEAQQtfotgVh/HZGp0WJKFZFnS7Xp0Lozmf+pV
	5IoDyfJc2OBsZvVJ/aMqvsITSQMV3tFWMZgq0cnpXr0i3U5PjsNgzSIMTOoXvXa5dEi6PPU45aM
	oPNz9JYFhHOW490B8AvDlxzd0pgn4eMwXLFNW9f6B1NlCO76pfby083l8B9u9tN3t+KXhXZME0n
	OlGtSuk6EL6NtLz8S5/+vK7y7XtHfEQxZguHWVhVnKbGs7Uh3wIYDy7lq
X-Received: by 2002:a05:6402:5d4:b0:6b5:5fc8:9ca2 with SMTP id
 4fb4d7f45d1cf-6b7c0c7dc86mr6801231a12.34.1794814582850; Sun, 15 Nov 2026
 23:36:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avpN-gFOvTBAMY6G@venus>
In-Reply-To: <avpN-gFOvTBAMY6G@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 16 Nov 2026 13:06:08 +0530
X-Gm-Features: AclHuK_zi0cJ5esU4k_l4Yl1mv76j_qYKuptpaeB4AEIgcR7sleibDfPZTNW_HY
Message-ID: <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > to access the PMIC. However, these handlers run in an atomic notifier
> > context (specifically within an rcu_read_lock() critical section), while
> > the I2C-backed regmap uses a sleepable mutex.
> >
> > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > context switch in the RCU read-side critical section during shutdown on the
> > Banana Pi BPI-F3:
> >
> > [  563.803475] WARNING: suspicious RCU usage
> > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > ...
> > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> >
> > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > in an atomic context. Preserve unrelated register bits through
> > read-modify-write operations and check for atomic I2C support before
> > registering the handlers.
> >
> > Obtain the I2C client from the parent device and verify that the adapter
> > supports atomic transfers before registering the handlers.
> >
> > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> >
> > Assisted-by: LLM
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
>
> regmap runs i2c_transfer itself and thus also uses the atomic I2C
> transfers. The problem here is regmap itself. But instead of moving
> away from regmap, the atomic use case should be supported properly
> in regmap.
>

On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
through the SBI System Reset (SRST) extension. Linux delegates these
operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
for reboot, depending on the supported reset type.

Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
on this platform, as it duplicates functionality already provided by firmware.

While supporting atomic operations in regmap may be useful more generally,
it is not necessary to address this platform's shutdown and reboot requirements.

I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
poweroff/reboot driver.

OpenSBI commit which handles this extension

d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")

Similarly, on the StarFive VisionFive 2, poweroff is handled by
OpenSBI through the
AXP15060 PMIC, so there is no need to register an additional poweroff
handler using
devm_register_power_off_handler().

OpenSBI commit which handles this extension

568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
visionfive2 board")

-----8<----------8<----------8<------
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e06..069259f7d7c15 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
                return ret;
        }

-       if (axp20x->variant != AXP288_ID)
-               devm_register_power_off_handler(axp20x->dev,
axp20x_power_off, axp20x);
+       /*
+        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
+        * Avoid accessing the I2C PMIC from the atomic poweroff path.
+        */
+       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
+                               of_machine_is_compatible("starfive,jh7110")))
+               devm_register_power_off_handler(axp20x->dev,
+                               axp20x_power_off, axp20x);

        dev_info(axp20x->dev, "AXP20X driver loaded\n");

Please let me know if this works on your board?
>
> -- Sebastian

Thanks
-Anand
