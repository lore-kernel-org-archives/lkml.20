Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748281FBEA6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733064; cv=none; b=DWzKdU4spXpHVfjztBTZWl7eRNcUuGZ6jdP0JCbTTSmB9BvuU4DCO4qNv39Jbsxa45/dGp6tdNlOeRnAO+RkFLiw/5+hgPenw2GqCDKukLX6CzlExDpW/JCxbB5mlOqiHjGPJmRs05p7E3WQnjqZJaL3Nhl/4cIKa2mZqqibqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733064; c=relaxed/simple;
	bh=KuptGMg8i+lMOdb4G4QPGs68Ey/P4pbNtBZTiMUAF/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoQHYBYU+nm5C3Imb+uMDE9znIZE/NwVloxbFg/NxXOdkQcKugRacf/YFbPdrRS2EhChsG4bs5avBE8j1Va2UJxQEPEP8w0JQOfnoDxY9ha0kk3GGCEEdqzjr+YfiY3bn80jxCgKbhwnAYQPIqk/Qr+c2SnhN4NFRaQTjYOWjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXpfzOfO; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXpfzOfO"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso4193172e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733060; x=1791337860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPiQMKdaV9lHeNVJbcTX0RY2MR9chP31sQ3+yrzJHeA=;
        b=oXpfzOfO79h2LcFrKf3co40AIO0QBqo4PA5exf4/inrGm+S2TfrX6NewQHJthHJIld
         ThpD0fhsVIEwBWHkWpqUogqrM/XTPC/7zcLmQuWwJE8xkJTaI8EqAZ2Tw7C6lzmjXyUX
         OQdLEY1vzWHmTSIN+BYqCWUnaMFGlKHIpt5vSoH5zsBEQr+W6yi09ZXwPGbpKFQ+uQyC
         XXu5uzL9lHtFrjRYdmi48f5FO9RK2gMb0kSCIFpZpc0yXNUsDy8KX0Hf6+tzCYivUnKu
         F1vN0L2sGD3x67QIvIjiLMfxwB/I06KsPWxZKukSqJ1ZI+YdtjFKwTSXPtFJRoGlctPv
         JQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733060; x=1791337860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPiQMKdaV9lHeNVJbcTX0RY2MR9chP31sQ3+yrzJHeA=;
        b=WArjnXDAHpoTZFBJf0Cb4cOuuO4d/yeO3erc5guaa2PPtCGdJ0tAWI7Wuk6wAEoJjg
         p5jmryD4MkWqZPlgRBtDhJfHO2PptjMG6OpDY8Ft2z8Q8PijrFzWICIBtaHhfJxmGmkE
         15zhe7FKkZ9i2rWD94aMteKEyG0li4RW2cKNsTQxv8J7mjFIuB2QgWBjN0gDreR58xcm
         A18TlyaDglRvWf2D0qz6GuYwXNascF/SXqDOEv79omS5ph9dCsPJDaLI27bmEYX3ML/k
         4JEnBtthSl2fOWuDukAXR1VQPc/x398j/MlYmMT45bbI1urx/0T+0i901QprT5QqYFPz
         P5Zg==
X-Forwarded-Encrypted: i=1; AKwUvBw7RdsHuuK77bpOWGh6nIxa3s1TALQA/aS7nh8iElZIAhpqydrHdCzsW6WIfCIo8DN6+Gydwmg1bDi/kTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUHmDSNs8RCi/s53W/hTZpyJ6r7hGkuqQSDrajJePn9zE8+nmn
	jlCl+lStWsRPjudULuZtPITCMgtoRPDqYDTfKAEOpSXYL7zUeopcyk8L
X-Gm-Gg: AYBFou21s4VUJDBdDf+wHKYCpW+whOV3y5sMqgF6VL2cxteJkqkIbSWIAV9C71KmERv
	iSxYScdlLo63D0MBxVE6IfAWXLOWs5exO02yTi0tUeHtT6ZL3W4vGVgBAGCd31o1zdOx+6S207P
	1hhOAvCvtgoWpKam+yfys5QuHvuBjYypY0Zw1lmDMv1qoXiKxy5rneBKOMW9P4h0R2exJyAXJP/
	5AQGUnCfLvzIu87okiBGWITufmGHDLgbI84Y1qO3X3A+1AfPkZgww+pOMBg2deH535Y9j60byyA
	WuLdKFEv4fb9bZDm5l8n1lk68j8QauuyXWqn6e7xDdI/OpzAbZNtntWff+khBXSilCjNSkSEt3h
	Y4HKb2hVTJdMu12VAdZFGJ6qkHXB29ziiFQAf8ftnYtydoV1F8OExafu03aYj6YA6YPg8xvsAhk
	dQxZwuMIUdRLhmyzjfsKn9SscIvJAoFwBKSllLzqUmlXeHMBPCewhGxvqWVLj08FQXKeAftfE/i
	2CVMfunrOpjmJ8NcQ8/3n7hHg6wZ0pesq7X/x1UFYvRJVhFptlbvJSafUSV93JM7op+
X-Received: by 2002:a05:6512:3daa:b0:5b6:1a7c:30 with SMTP id 2adb3069b0e04-5ba3becf14bmr453295e87.51.1790733059951;
        Tue, 29 Sep 2026 18:50:59 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b8670dasm342408e87.73.2026.09.29.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:50:59 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: qby140326@gmail.com
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	W_Armin@gmx.de,
	ilya.gladyshev@linux.dev,
	foxido@foxido.dev,
	kento@kekto.ru,
	ericted8810@gmail.com,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	martiya.ar@gmail.com,
	aleksejirlik@gmail.com
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Wed, 30 Sep 2026 04:50:58 +0300
Message-ID: <20260930015058.3076905-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-6-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Data for the per-machine table from a Xiaomi Redmi Book Pro 16 2024
(DMI: sys_vendor "XIAOMI", board_name "TM2309"; BIOS RMAMT6B0P0B0B,
bios_release and ec_firmware_release 1.11), the same model as in
Martiya's report. RMAMT6B0P0B0B (August 2025) is the latest BIOS Xiaomi
publishes for this model, so this is what an entry would be written
against. Its values match neither the Bitland defaults nor the Redmi map
proposed in v5 6/6. The full acpidump is attached to bugzilla 222062:
https://bugzilla.kernel.org/attachment.cgi?id=310971
The WMI method is \_SB.PC00.WMID.WMAA in the SSDT with OEM Table ID
XMCC1806; QFAN and NTDP are in the DSDT.

Mode values
-----------

WMAA stores the value written with WMI_FN_SYSTEM_PER_MODE in the EC
register QFAN as is (5 and 7 go to a separate register, SMMD, instead),
and NTDP in the DSDT maps QFAN to the DPTF variable \_SB.ODV1 (odvp1 in
sysfs) that thermald --adaptive uses to pick the policy from the GDDV:

  QFAN   meaning                          ODV1
  0, 1   balanced (Fn+K sets 1)           0
  2      quiet                            2
  3      performance ("Turbo")            1
  4      full speed ("Geek")              4

GET returns QFAN for 1..4 and 0 otherwise (so 0 after a SET of 0).
Fn+K on this model cycles 1 -> 3 -> 2.

I tested this with a local build that maps low-power/balanced/
performance to 2/1/3: power-profiles-daemon power-saver, balanced and
performance give odvp1 2, 0 and 1, and thermald loads the matching GDDV
targets (PL1 limits, TCC offset), both on AC and on battery.

On the DMI match: the v5 6/6 match on sys_vendor "Redmi"/"TIMI" would
not cover this machine, and performance = 0 from that map is balanced
here. The REDMI Book Pro 16 2025 in Aleksey's report also has
sys_vendor "XIAOMI" but uses different values, so an entry for this
model has to match board_name "TM2309". The Pro 14 2024 (TM2307) is
built on the same platform (Xiaomi's downloads for both, the BIOS
included, are filed under one platform name, N56N57) and may behave the
same; I cannot verify that.

Capability checks
-----------------

a) Performance on AC and on battery. WMI_FN_SYSTEM_AC_TYPE is not
   implemented on this BIOS, so with Armin's "Treat
   WMI_FN_SYSTEM_AC_TYPE as optional" the capability check passes on
   AC. The write itself is still reported as failed here, though:
   WMAA's SET branches set only the return code and leave the function
   id at 0 (only the GET branches fill it in), so "Detect failed
   function calls" (23cc56f6dea6 in for-next) returns -ENOMSG for every
   SET on this BIOS, although the firmware applies it -- the same as
   Chris reported for the Book Pro 14. I checked it with the for-next
   version of the driver built for 7.2.7: every write of low-power,
   balanced and performance failed with -ENOMSG while QFAN changed to
   2, 0 and 3; with Chris's "Only check the function id of GET
   responses" on top, all of them succeed.
   On battery, power_supply_is_system_supplied() still refuses
   performance, although the firmware supports Turbo on DC: Fn+K
   reaches it on battery, the GDDV has a DC Turbo target, and writing 3
   on battery works (odvp1 1, thermald applies the DC Turbo limits).

b) Full speed. The firmware does not validate the mode at all. Writing
   4 was accepted and applied (odvp1 4, thermald loads the Geek targets;
   on AC the PL1 ramped towards the 90 W Geek maximum) both on battery
   and on a 100 W USB-C PD charger, while Fn+K never offers full speed
   in either case. It is not a charger thing either: with the stock
   140 W USB-C charger (the EC register ADPW then reads 140, and GET of
   command 0x10, subcommand 3, would report the adapter as not below
   140 W) Fn+K still cycles only 1 -> 3 -> 2. So on this model full
   speed is never offered by the vendor's own key, and whether it is
   exposed has to be decided by the driver; the firmware will not stop
   it.

Commands that are not implemented, and one that is dangerous
------------------------------------------------------------

On this BIOS WMAA implements only command 0x08 (GET and SET), 0x0a
subcommand 5, and 0x10 (GET subcommands 1-3, SET subcommand 2 only).
Other command IDs answer 0xE000, among them everything else the driver
uses: 0x09 (gpu_mode), 0x0d (fan speeds), 0x12 (keyboard brightness),
0x13 (AC type), 0x14 (fan_boost) and 0x16 (CPU temperature).
Unhandled subcommands of 0x0a and 0x10 mostly return status 0, and a
GET of 0x0a answers 0x8000 whatever the subcommand. The hwmon device,
the kbd_backlight LED, gpu_mode and fan_boost therefore have nothing
behind them on this machine; probing support at probe time would avoid
exposing them.

kb_mode is worse than unsupported. kb_mode_store() sends command 0x10
(WMI_FN_RGB_KB_MODE) with the mode in the first payload byte. On this
firmware command 0x10 is the battery interface, and subcommand 2 is the
charge protection (bit 0 of the EC register LONL, 80 % limit; reportedly
what Xiaomi's Windows tools toggle): WMAA sets the bit only for the
value 1 and clears it for anything else. "echo fixed > kb_mode" is
therefore 0x10/2 with value 0. I verified on this machine that it
silently turns off charge protection -- LONL goes from 0x31 to 0x00, the
charge limit in the EC goes from 80 back to 100 and the battery, which
had been held at 80 %, starts charging again -- while the firmware
reports success (0x8000). That was on 7.2.7, whose driver does not check
the reply; with 23cc56f6dea6 the write returns -ENOMSG instead, but
protection is off all the same. I think kb_mode must not be exposed on
these machines.

Once the generic profile table has settled I can send a patch with the
entry for this model and the kb_mode fix on top of it, and I am happy to
test patches in the meantime.

Thanks,
Anton Karasev
