Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908867;
	b=LTZfP6Lmwbzigc5tJWLH2nYBmjCD0da6bw9Em95eUHnrEg/JioBhMdrhcDntt6hmwM1r
	 7uF4oARIiEk2MY0UTAcM21ohUD8FaVZkk48yqAv6JtxLOud2sNevyA5eIrUagtdRFWYKB
	 grNigcoOuoRZO9CiPUfjh/86aSVaaTvmg7ixQMfAFHqjdreE51d+SbGxroYOUj3QXKURh
	 Db14/R9pm+IgNRTsZjxlwWNy29nAoTVsX/V8AOwD/5nqHgBygVQ/JG/2nLTVuM6lqIZ4V
	 W/G6RFeVEkIbYmkVys+9HRBZVut29ifwUYFqDR4xHGoIJj56OlqoYSflnNGMUOZ6M9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RaHMnEwLyGtFm3duWMYl9s2TO4AG17GQCBnv9kTRqT8=;
	b=5YCJblD2vHUJ00DGpQKF2a9U/N7LJ+wEN5pOnPW8n6V0bVZ5fUuUhSXGFqjhPKWmKmSf
	 F/+nna3yJV0ljU23znpDXLNBjqtcz31yNbjrEzjSK2vNgdmzNwB+h2sf49erO1EBrJlAa
	 k92IND37FlPdWeaiO0VfIXcA9+2vWYnV+4YzHd3gn7kSbxL/yIutcGPDmkFbr2Y9ZZ4C4
	 Rm5SM8YopOskiCMqU3LEm0vVpQuqQQCIzAi2CihnDyKwMiogThHUuurzoDcwts5SeSQ3e
	 vrMP3WjZUCewC2bJ895gy93s6Rkyd4cQjcYONe/R2vr5C4g/OGwWcxFufAlez7ArUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pk0ck0Wl;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351BE606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pk0ck0Wl
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40319bdso1884399eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908865; x=1795513665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaHMnEwLyGtFm3duWMYl9s2TO4AG17GQCBnv9kTRqT8=;
        b=pk0ck0WlBblluLIuxABA4I5X1xp+ISFNRpptKwSMRbz7Jia2pAhFrQfdxYrtHug79M
         lQuF1Js2VMcuLyn4X7D2fjZOMvXhw+zyOJIfZvn5X4YZY87aZfjMM2RlNjXK1rMd0wX4
         itRVLtu3xco6gwwJqKxGUflSPQA2gihwgFeO9y4Ugb7eQMeYujTem5sgyIEWBCmGuaRg
         XnwMR/5U5RvTXDEz4/Wrsnc09H/gyJorl22Cjnod77PtQ+TmAqx+swWRV9SE36/z4azg
         GmeeIWxRlLUyLa4/9D/rl7Zg6eQX5g7iq3CP8MrmhVn/LQRI2nurRWTT/1ELZpkzZLcV
         xBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908865; x=1795513665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaHMnEwLyGtFm3duWMYl9s2TO4AG17GQCBnv9kTRqT8=;
        b=q+9YwpLyi15rqxRc/q/o230rbn/Ksiaf5a/N3yceDoEEbPkFUo/39Wwu92lr8aZB2a
         8nJtOHPawjDVIImI8S4ynOKGWLRpqBu9h48aPpP03l35cDKPKPVnPcttYuFeapGfYoLF
         ECcia/YM1Z1WAJA3PqYEC34zMlU/4CH9FzCjyYlQ1SQ20ixafoCjAWfXmDV/PeOfjyA+
         Bl40cqX/bJoBmsQjz79qTit03dplqfbfpDAqKGDBhRz63hyoeG6/Pp/TNkzUb9GSp+fA
         1Z1lumYnhbW9UHYjNj+abng5vzhyKpj75ir3zaQg2+VZRDFVZodAWbizbMrcAjRiOXYk
         mJ/w==
X-Forwarded-Encrypted: i=1; AL+hErE6ZMqCaHJC7rwV4HRLtOX9GeGR7OKIcAKjgHrljU5rohJri8mJQEATQJ8Mp8ni5is4kPVk1s7CghffZwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//HF6JlhB5rA3kQJKQVnwKC02HGxlf1fva1yMETf7tm0zY8q3j
	zoQUeJ6Eegdz0Guxv63GgykABvI9sVbrGtx8cWJGQwY4ZIdr7a7ZnPMx
X-Gm-Gg: AYBFou3TIn9BHiUXmLXwj+O6Wdjv3W2M1tAlHCV+WDqYDLDNiSlgYBCu7Q/dqcyCn6J
	Imwk68eAywYMnemE+021p44krgxU4frd+8/NoWE495FqnrfGO3DJKA6FcpJMptsUWR4zOXQy0dO
	urjDYhPJv2P3JT1QMN9/cgp426reJQ31FKnL3NksjIX+47Xufdh4BlZRYP+TpY2rgxYT1EPZe9t
	zvl2oUfPTySt5O84fW1AtKP/YwkbrJCq3A3imvDYSaDnPGzyvumI0IbeTkAx5w1ut0GUNL9CJ5S
	W5GPOjvJiYs1JgfuHD7TOLSOAxczlqwh5EjQ1uGRuo4dylbuTHVPLu5ASMg/LbZLI0MbLMosL4w
	Un+q+777BBPEfgPt0Su420wYThU461jRxtDWYx4ei3xGQlIX+CBMkVOGcPvmcVgLN6od3MHr9HA
	2jbIL4BoKUWzHjab6zAVxniq8P2X8d9PCJM6pYXJe3CpuILvBBeG/TrQ5HYSoLrgmTK4driJ0nq
	6PEaWKm/qWH6Yg5Ql+qD+XfuPUp7Pux5qcJ1u8glbXLBeX6ZebN2ZD7Kp8izfJJrCA07NvZnpqL
	XQp2g0wfmvSCz6zn7GQ5TuAxdmTjw0Add10+OYoEpfyQbQcElGMiF7+I4yMjh5LGbTONvXm2A2g
	nuoWuOsFPJqOrhzocCeFU/7clSru90Ui+6+l6K6pw6mwODqj3VkPwFAp9sa4Fq5zFkkn4EvmVVN
	kAy7DQby4X6nqOK0XRslP5zfokzoKyY/fTh6EhJwG9Gw==
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr10019522eec.9.1794908865256;
        Tue, 17 Nov 2026 01:47:45 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm42259413eec.14.2026.11.17.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:47:44 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity drivers
Date: Tue, 17 Nov 2026 15:17:35 +0530
Message-ID: <20261117094737.15253-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Semtech SX9310, SX9324, SX9360 and SX9500 proximity sensor drivers
and the shared sx_common code have no MAINTAINERS entry, so
get_maintainer.pl only lists the IIO maintainers and reviewers for them.

Add an entry with me as reviewer. There is no M: line, so maintenance
falls back to the IIO subsystem entry, as Jonathan suggested.

Link: https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
As discussed on the SX9310/SX9360 gain series:
https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/
Gwendal, if you'd like to be listed too, I'm happy to add you in a v2.

 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..fdc5004df348 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,20 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS
+R:	Arnav Kapoor <kapoorarnav43@gmail.com>
+L:	linux-iio@vger.kernel.org
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
+F:	drivers/iio/proximity/sx9310.c
+F:	drivers/iio/proximity/sx9324.c
+F:	drivers/iio/proximity/sx9360.c
+F:	drivers/iio/proximity/sx9500.c
+F:	drivers/iio/proximity/sx_common.c
+F:	drivers/iio/proximity/sx_common.h
+
 SENSABLE PHANTOM
 M:	Jiri Slaby <jirislaby@kernel.org>
 S:	Maintained

base-commit: 20ce8ef9c9e04cd6c5ae0422e251a9b5936c6b7c
-- 
2.53.0

