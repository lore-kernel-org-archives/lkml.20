Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887304;
	b=eX4UhHW53DPxvW39je3r5LfwpyV0WOQC5UhD4FGJoHJ1wIr4BeEK55+zwC1QQYUa43W/
	 QkI/lBysHOJcjvyZVAL3tVMIw6Gld5fbY+M63p8rgWkchqHOXOaH/XpKyktWvDPDAHelX
	 GNyeEqpr6Hr31fCG2pf4o3ZF9NfWzS+w12FQa+LsbDxN1yaXgC6CFagvp5t+iyDodmnau
	 jwrEVt1eQRIVOhwM+TcH4Th4STuHIB2uwTUVZOd19sbmtAr6pwLD+WJNgAxP4GfKqEBuO
	 jpzVbhBrIBv0Oh3asETKqrv7wyjC0ca33/Y+Xz0/o1Ni/gxkl1un+8OgV8I2jdZnbug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=;
	b=YvJogZyV4PndNhQKrr0cCM4DzMQmuZUm7YDLJ38mc2UMqw/li63zY1ysQrhpaxyIt/uI
	 dNQ1LpoG5rJyRj9p1ymjcnfYtz84PUY1OeRjE7S9w8IzrmWCfgBrXiAMAwSmvn3qLxdwb
	 ZrPORv72wuYLaeGOQWyK17mhKPHQ4M7Gl+ekIWOQTvAIXDlD+BrKCUYRnBQWHnMJpv++r
	 PgVopCW6v1bK40ElsaWrMVK03T3qnLrDOP0IXE4dStn9oV9O+wUO5Onfp2xFvnsBEOMTe
	 BC/53SlqQtrW522ofuAwPa7zEAjH2pIDw5u/q+WNGm90VPNKZj5P5GBzUrPpMQlbMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcEhecaL;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94543606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94543606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tcEhecaL
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b305312e4fso15412887b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887303; x=1794492103; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=;
        b=tcEhecaLlEg/+QQr4MqoUtga1AjTVJLn9+h1teRoI5QHc9USHVC5Ry/jZahgJnEfkv
         eWj1EKvJy2ut6YbCQtZNmmW2ECDWL8EKQfw+u6Q8C1DwbM5JIUF7OPN+QrhorTuUha9v
         PkbQh4+Hs24KekIxgpsLwOwAt0JyCFyuh+dlLYyFfn7kZZ1l/6DffcUxMhakQv+Yf5KT
         8eZT1gUuXs3yDEM3TV76ROwCD2/EK9SYjfWdOzwn8VBQnVO3QcyhGpVJTI8iQ2iUOJH9
         lWZsxMm4aYCSLZ8w6NRvL3w/Al27CFP7TulunZLJD1XepNGuvEkGDaAkGFP1ejBrZGne
         nJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887303; x=1794492103;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9pCQOlyy34aTJ0Xl/cposoP8D26iQ61ySMYUpGfFOkk=;
        b=GYG+IsVCg6NeTMXSkoOFNDOy09hJID5c22JWiur94P9vWtUZKjZdQetXOlKNet115e
         JFtt7IW3ujyNcmnrOKtRbJWUu6v+Cdnw6aGV1M8Aw5sX73TA21209cRrq9R0SgTvJU12
         FOEVe91+iTzs2vtikhn1gb8/mPVVph8+zgYG/ryUjy/eJvpishgktCklmRbBjEcrJuhe
         3Q3ggPC257Fup05dn2mVh50o6pLKInQ4e24fyCywH498EMTWXRnQqfTPB0wlDEMhFkES
         1gFJguxcyyARRDjNf3FezF1fihG10/IkcbJMuYEr1u7JcoSH94qlIOcmxINwwPVQEY2a
         n+Tg==
X-Forwarded-Encrypted: i=1; AKwUvBy6ExQlWfMg5qMu1+6VvlEPo3jn/hO1wn+kuh3/chhaJz2lDVerUAjmoK373b4rab28Be96c0lm2DaoAUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VN86sA4L2boZVMRoPlEjEv/zzD4fbFaA+oAfa0/NamGSFFELs
	/dn8it63OXAI2OXxJCPZ7j8xScNB01EmLfAmC6WMbn9gr0Vitmn3R+w4
X-Gm-Gg: AYBFou3NalInNikmYPhnZQDH8qRZKhwvhm/G4M1ijtE3gBA/myJGgdi0pU9G//VnY2S
	U8TDCXXTyixzbIBp0oAcdr7qW7WoQ4xEnTYgNeMRbAp7VzNUc1aGcnnDL2qQ7noGtnHk5RmLVt1
	UxMQs77aY+Bp9i5Zi0ieSXgfKWajn96ijcxDOeiSA/hSIpw4ZnxBfyqUkyMlukZqEsGXwulHDv3
	AdYFc86xqxDNrQfDcixxDAAtM9TqWPvbSB6Ig9HTU++fopqSiJCtcCnEkIyAm21qGONAu5GOssG
	WjfOLa1Tor6VJygGrqzbzvXzZAys92AN9qK3Hcc++rXZiuIvqF1EbXIfvu/RGuhvY34BuW7nLlj
	e/Rhqzk3tMNYPeqZnhD2P9kppWGlguJAJVHcDQEbmslXgFfl9k0r+3nETZXuuPccWkPBR6TbgQ4
	0JZv4PqRlWBTEx27/di6UVSW8SfSwrgxae9M9rSUWxU8VO5IjJfQNsT3Q1RGWqLqqXY/ZkB3Tut
	chhKrG+T7rU7l70C4OF8C6NtbjTZrftDnPLYJcSA2F0cfGPubfWwgNKfJXc6JMxwxCv03UcJwxt
	l39+NTZVSwLTWULwB0f9rDZu49jYFRWjRduNsI8PNVPzH6DHRdXpiNbl05486cNDCtb5898xkKa
	iyloiKl5v31j+PKtg/1/QF0X6TUUvzzwY1vvBnKdZxcbl+t69CBz0Unta6wvl
X-Received: by 2002:a05:690c:d85:b0:8b2:e7dc:dfe8 with SMTP id 00721157ae682-8b2e7dce2c2mr67970057b3.3.1793887302163;
        Thu, 05 Nov 2026 06:01:42 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3099ae415sm40127677b3.35.2026.11.05.06.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:01:40 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Thu, 05 Nov 2026 09:01:31 -0500
Subject: [PATCH] coresight: fix stale and misspelled kernel-doc member
 names
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-kdoc-coresight-v1-1-eb2b2ff5b677@gmail.com>
X-B4-Tracking: v=1; b=H4sIADqM7GoC/yXMTQ5AMBBA4avIrDVpG/9XEQvawZCodBCJuLti+
 S3eu4DREzJU0QUeD2JyS4CKIzBjuwwoyAaDljpTSqZits4I4zwyDeMmSlkonSS6tXkHIVo99nR
 +w7r5zXs3odneC9z3A3OnyqxyAAAA
X-Change-ID: 20261105-kdoc-coresight-90812442ad7b
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

Several kernel-doc comments in the CoreSight headers have drifted from
the structures they describe, which makes scripts/kernel-doc warn.
Update them to match the code:

- coresight-cti.h: @nt_trig_con is a typo for nr_trig_con.

- coresight-etm.h: @use_cpu14 is a typo for use_cp14, and @base was
  replaced by @csa in commit a1b0e77ce517 ("coresight: etm3x: Convert
  raw base pointer to struct coresight access").

- coresight-etm4x.h: @bb_ctrl is not described, and @ss_status was
  moved out of struct etmv4_config into struct etmv4_drvdata (where it
  is already documented) in commit b5022acaee3b ("coresight: etm4x:
  exclude ss_status from drvdata->config"). For struct etmv4_drvdata,
  the comment names the wrong structure (etm4_drvdata), and @mode was
  moved to struct coresight_device in commit 9cae77cf23e3 ("coresight:
  Move mode to struct coresight_device").

- coresight-priv.h: the comment names struct cs_buffer instead of
  struct cs_buffers.

This reduces the kernel-doc warnings in these four headers from 13 to 3.

The struct etm4_save_state comment is intentionally left alone:
correcting its name makes kernel-doc parse it and report its ~37
undocumented register fields, which is better handled separately.

The warnings were found by running scripts/kernel-doc over the tree.
An AI coding assistant (Claude Opus 5.5) was used to locate the
warnings and draft this change; it was verified with scripts/kernel-doc
and checkpatch. No functional change.

Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Comment-only change. Not build-tested on arm64 (no arm64 toolchain
available); every changed line is inside a kernel-doc comment.
---
 drivers/hwtracing/coresight/coresight-cti.h   | 2 +-
 drivers/hwtracing/coresight/coresight-etm.h   | 4 ++--
 drivers/hwtracing/coresight/coresight-etm4x.h | 6 +++---
 drivers/hwtracing/coresight/coresight-priv.h  | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..a11a8a4f022f 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -97,7 +97,7 @@ struct cti_trig_con {
 /**
  * struct cti_device - description of CTI device properties.
  *
- * @nt_trig_con: Number of external devices connected to this device.
+ * @nr_trig_con: Number of external devices connected to this device.
  * @ctm_id: which CTM this device is connected to (by default it is
  *          assumed there is a single CTM per SoC, ID 0).
  * @trig_cons: list of connections to this device.
diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index cf65d89a8e98..9cd1b9aef5bb 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -231,14 +231,14 @@ struct etm_config {
 
 /**
  * struct etm_drvdata - specifics associated to an ETM component
- * @base:	memory mapped base address for this component.
+ * @csa:	CoreSight access descriptor for this component's registers.
  * @atclk:	optional clock for the core parts of the ETM.
  * @csdev:	component vitals needed by the framework.
  * @spinlock:	only one at a time pls.
  * @cpu:	the cpu this component is affined to.
  * @arch:	ETM/PTM version number.
  * @caps:	ETM capabilities.
- * @use_cpu14:	true if management registers need to be accessed via CP14.
+ * @use_cp14:	true if management registers need to be accessed via CP14.
  * @sticky_enable: true if ETM base configuration has been done.
  * @boot_enable:true if we should start tracing at boot time.
  * @os_unlock:	true if access to management registers is allowed.
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 5417280cdb27..0787825227fd 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -923,6 +923,8 @@ struct etmv4_caps {
  * @syncfreq:	Controls how often trace synchronization requests occur.
  *		the TRCCCCTLR register.
  * @ccctlr:	Sets the threshold value for cycle counting.
+ * @bb_ctrl:	Controls which regions in the memory map are enabled to
+ *		use branch broadcasting.
  * @vinst_ctrl:	Controls instruction trace filtering.
  * @viiectlr:	Set or read, the address range comparators.
  * @vissctlr:	Set, or read, the single address comparators that control the
@@ -941,7 +943,6 @@ struct etmv4_caps {
  * @res_ctrl:	Controls the selection of the resources in the trace unit.
  * @ss_idx:	Single-shot index selector.
  * @ss_ctrl:	Controls the corresponding single-shot comparator resource.
- * @ss_status:	The status of the corresponding single-shot comparator.
  * @ss_pe_cmp:	Selects the PE comparator inputs for Single-shot control.
  * @addr_idx:	Address comparator index selector.
  * @addr_val:	Value for address comparator.
@@ -1051,13 +1052,12 @@ struct etmv4_save_state {
 };
 
 /**
- * struct etm4_drvdata - specifics associated to an ETM component
+ * struct etmv4_drvdata - specifics associated to an ETM component
  * @pclk:       APB clock if present, otherwise NULL
  * @atclk:      Optional clock for the core parts of the ETMv4.
  * @base:       Memory mapped base address for this component.
  * @csdev:      Component vitals needed by the framework.
  * @spinlock:   Only one at a time pls.
- * @mode:	This tracer's mode, i.e sysFS, Perf or disabled.
  * @cpu:        The cpu this component is affined to.
  * @arch:       ETM architecture version.
  * @caps:	ETM capabilities.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..d55929aedb32 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -91,7 +91,7 @@ enum etm_addr_type {
 };
 
 /**
- * struct cs_buffer - keep track of a recording session' specifics
+ * struct cs_buffers - keep track of a recording session' specifics
  * @cur:	index of the current buffer
  * @nr_pages:	max number of pages granted to us
  * @pid:	PID this cs_buffer belongs to

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kdoc-coresight-90812442ad7b

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

