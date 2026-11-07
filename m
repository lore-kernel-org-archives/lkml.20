Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061917;
	b=dZaGut7USNXEvQ4Py9imJzTYMGquZ4CH1kB5+tpA5uYrhXGG4AYpK21vHU60rSdcyF7f
	 T5oy9lYSyzp5r99TWy5/03FUBk4Hyk6AfjjA/N3hV1kHJTGv84hOiqrGZYnjlA1uKuXeW
	 a3Xg6PVDxpAz4UsfcDLOGwCrEsL3y2xOuJqnKbf6yiyp+tuHza3anRFV18tGFRQCbOI59
	 ZZWrRYouyafhXpux5z/l6h/5B9qyfaP0A0j4KKn94rv62W+UZNEe9P9pKtHuYQUynTlFP
	 gr4lxyGAhDvZ4BDeLUAwxdlu4s2GxohI+xpfdS4Hbn2HYjnpe7Z9Auh2Tk62n9FhMrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZoIG6xGUckziyxrgLVSirxu4lsbujH943lx05d+W1o4=;
	b=O/ZnyaVqgMqI8xd2Hu/IYUoMNKukegY7A5li0TBpCMa04KV4gX4aA9WXEle6LSm0NGL1
	 ISRYibbOy63PrzTacnSAZkDCiuW0nuiUGYh8jyxFOb6aBoxm/dV7m53an0bp7m1PAq5sC
	 y716PZxxEes5sicT5RwxjVYTh3wj8K5s8cW7U0bfIM5AwomdEYSqlQZT7bN4yODHK8pJt
	 zgpmc7MVzEIjEQKjV00apPjVKopWnLhuRlSBXU6qxWxcwLOgtm773PEYxaYYtPwduJ4Vj
	 c9UaIt6cpuLg+uP/R6EvrkZSSpOFalnMkPX04Km80JqtlUxN9D4cS3q5ai26cozzsPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n8RvLljB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AEB606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n8RvLljB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11880605e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061915; x=1794666715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZoIG6xGUckziyxrgLVSirxu4lsbujH943lx05d+W1o4=;
        b=n8RvLljBZAHkGD4IUQKY4cjEjIVp1EwUf1ZM+mX/imo7ukmZy6B0+hQzfSy6y7u9Af
         PYUoU97X5VhhqInbhvz/hKxNkam9Xp3PlMb9QatA/i2r6UOn/k5gS6oaRaltzu7xG4hX
         6MDrWSk6KwT/fcsFF9O9Gl0qSFM2xqYUj+AMbopPlaE769VUF282Lye+fPBK8Nmh8Z6o
         4FfjKRfWfBU6e+CuiZQiDxLy/EGmtqHReknBtiEaDDqsn+BU5ZxUEPPyyPc5rzWno/a+
         O1cKPJfEO1Xln62oHN3OwG+SPTEHMtytOHQeiQCBkfQTbxIkOu/VSIwT39xa+1mEl9df
         AGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061915; x=1794666715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoIG6xGUckziyxrgLVSirxu4lsbujH943lx05d+W1o4=;
        b=c4A0/HVbBGJRsgJWYqjS4bYhglyNd7tM8VZDMpaHpziwrXwLuMXG6Pyxu+NmrI068A
         NYz3Pga73JaBcmACJ1pJwojzeefZpoMauGrvtC5+nl4veE9YxnhmfMAfKgJugy8bv9j/
         7Jx1JcoKGWZUvvRANuVCB0Fo0qHHCaVDjMVSBynmV0dAQ1wIrjtcnW3vj5NE0ndmnRjM
         jXpxFfQJSWeXXBQInXKqnfNuy5s7M2gQO2xe5RiTjjVAoj0vqZY7EGgdhju5VSe2Dpas
         Zf+Q9DKTlZFHxVYhulbyeeG3tRicagF6SHldGyCn4oHFBEb6JTN6t5eP8zMtwOvGwCux
         1wCA==
X-Forwarded-Encrypted: i=1; AKwUvByrD8EyLcnNoSee9Nm51NswTrcrVwNxGR2qJOyKmZPZU4d2Jkb8DTbeBdvv3ILlP2zyJLt/igczvyt4/Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z84R5nL2abhAxGAHgQkJ/MjW6Vl4QKap+AMq8CDKFPzIsFKNSln
	xxADk5GdSM/ZCdrJbnQGTySzjDYRcyPrcf91efsN5ipLRTdrzpOvkJll
X-Gm-Gg: AYBFou1vkFLVO4utJ4HAZFg2dwEs8iB3wfA62Iqj80Gf4XHGMkM6kTa8/juWX/9JOXG
	mxnNmZcafsgDJGKiXfcGkCksBtnc6QMR77rOTTkjY6Ndn957r2HNs9Os7R1bseTZeQRd57EqaPL
	lhDxzo9CEis9h3zTLKRBgT8zdhgu8qhsR1OXV2PSX53Z52kCBQaJ/bmaCzY203wDeMPE+UmSQEu
	VKYcsBgfq4oadwRszKkn3SCHpSeLruFCCX3IsqivkjrHQppRz6T0XVRhRWwY7GgKHD5OssDr6ch
	8lPtiLABzKq8cR89LIOsh8Kih0AECRsk9UvGK+5k30EwnhIWCCx5iZjPI5+XJ8IY9UJvI+pg8oE
	uQnFqGCg1XQv6g07BpFEg4VxM4qjqPWKvedeShyoZoysMZ2qIETf5NFYF2OVCSvbiPnbBbU04eC
	MAMjRZk+LQg8oh733s8mWH+R4wmqFZXuMEsl7U8tmuhOz/MphaL5s/mH8Ul7w7KthdnUkxLL8zt
	5BcnYndRZpJcDeXD+GWejAw2HXvOM6fq65Vo6+FJSz8FSamsTKMGwMSjnGMScEaBT8MQ7TaJXT8
	4MV316mafRU2gtl+RKVsf82Wa+Y2SlhYNn2XAXwR4BGmGqW3s5qJvFSt44A5
X-Received: by 2002:a05:600c:1912:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4b6dfe8e4d7mr101867365e9.26.1794061914851;
        Sat, 07 Nov 2026 06:31:54 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([87.74.75.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm175375145e9.3.2026.11.07.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:31:54 -0800 (PST)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH] reboot: fail run_cmd() before init so hw protection can force the action
Date: Sat,  7 Nov 2026 14:31:29 +0000
Message-ID: <20261107143129.875202-1-zakbrightonknight@gmail.com>
X-Mailer: git-send-email 2.56.0
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

__hw_protection_trigger() asks userspace to power off through
orderly_poweroff(). It only forces the power-off when running
poweroff_cmd fails. run_cmd() waits for the exec only (UMH_WAIT_EXEC)
so a successful exec counts as a started shutdown.

Before init has started that exec can succeed and do nothing. Usermode
helpers are enabled at rootfs_initcall and wait for the initramfs to
be unpacked. So a built-in driver that triggers during device
initcalls runs the initramfs copy of /sbin/poweroff. On a
dracut/systemd initramfs that is systemctl. It finds /proc not mounted
and decides it is in a chroot. It logs "Running in chroot, ignoring
request." and exits 0. Nobody sees the message because a usermode
helper starts with no stdout or stderr. The default
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0 arms no backup timer. The
one-shot latch in __hw_protection_trigger() then makes the kernel
ignore every later request. The machine runs without its critical
temperature protection until the next boot.

I hit this on a ThinkPad T520 running Fedora's 7.2.15 kernel, booted
while still hot from a long memtest run. The ACPI zone read 101 C
against a 100 C _CRT 0.29 s into boot. The kernel logged "HARDWARE
PROTECTION shutdown (Temperature too high)" and the machine kept
running for 90 minutes.

It reproduces in QEMU with Fedora's 7.2.13 kernel and with current
tip. The test uses an SSDT thermal zone whose _TMP is above its _CRT
and an initramfs with Fedora's systemctl as /sbin/poweroff.
hw_protection=reboot fails the same way. Setting
sysctl.kernel.poweroff_cmd on the command line does not help either
because do_sysctl_args() runs after the initcalls.

Make run_cmd() fail with -EBUSY until system_state reaches
SYSTEM_RUNNING. Both callers then take the fallback they already have.
__orderly_poweroff(true) syncs and powers off. __orderly_reboot()
syncs and restarts.

Firmware that reports a bogus critical temperature only during early
boot used to get away with it. Such a machine will now power off at
boot, as it already does when the same reading comes after init has
started.

A short window remains between SYSTEM_RUNNING and init being ready to
handle the request. A non-zero CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS
still covers that.

An AI coding assistant (Claude by Anthropic) helped find the cause,
build the reproducer and draft this patch.

Fixes: 10a0a8d4e3f6 ("Add common orderly_poweroff()")
Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
---
I haven't tested this on the T520 itself, only in QEMU (x86_64
defconfig with ACPI_THERMAL=y). Without the patch the guest keeps
running after the trip. With it the guest powers off within a
millisecond and logs "Failed to start orderly shutdown: forcing the
issue". With hw_protection=reboot it restarts instead. A trip after
init still runs /sbin/poweroff as before.

The reproducer is an SSDT thermal zone whose _TMP is above its _CRT,
passed to QEMU with -acpitable, and an initramfs with Fedora's
systemctl as /sbin/poweroff. I can send it if that helps.

Commit ef1d87e06ab4 ("thermal: core: Add a back up thermal shutdown
mechanism") noted in 2017 that /sbin/poweroff can return success during
boot without doing anything. It added
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS, which defaults to 0. This
patch covers the early boot case whatever that option is set to.

 kernel/reboot.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 9a84401adde5..14c2bbbc5a3e 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -858,6 +858,18 @@ static int run_cmd(const char *cmd)
 		NULL
 	};
 	int ret;
+
+	/*
+	 * Until init has started, no userspace can carry out an orderly
+	 * poweroff or reboot. Running the command can still succeed: an
+	 * initramfs usually has /sbin/poweroff, and it does nothing when
+	 * there is no init to talk to. As we only wait for the exec, that
+	 * would look like success and the caller would never force the
+	 * action. Fail instead.
+	 */
+	if (system_state < SYSTEM_RUNNING)
+		return -EBUSY;
+
 	argv = argv_split(GFP_KERNEL, cmd, NULL);
 	if (argv) {
 		ret = call_usermodehelper(argv[0], argv, envp, UMH_WAIT_EXEC);

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.56.0

