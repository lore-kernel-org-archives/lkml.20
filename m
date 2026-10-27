Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080939;
	b=oOnZdxQaPSxv+w/LbxHL0z55jCCrsf2a955PRW383WpyBy+lxZnI5p5OqUNgdDLHgA0b
	 x+9kCcjMHzCcYldVLPdBSaosKDRU3CJL8f7cOCHDDuHaLikAgPbVRLjNTJP9i1Zk0MuGc
	 CU2kndUqmUpllISQKOz7QPXhcvtO5ZcILTXP34CXiKiBh5i4Dfd+8JNG6LpqHOtcQk4zi
	 WsAJaBiszbh0IMPVDVx7AxUyOYsctBNy8pE+sovTdEAaFtflHtVITh8hfF64g5GB8AFt1
	 T1EXYNfhiIIwCA20z5TFUJTxwdNZh+2oGCs+n0Xkc4005OV80xNfTGPfZ+k0BZi+UjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
	b=Qdytql9yllDivXYWXBiBAAz+zPTMq13qqmz1IRWmJye4Mf+/vC9rr+E+roRwXn0XZXGT
	 r4Ta1VMXHz03+e4BkDD77hsftzPPjfH2E/9DhJcGIap/J5KiI8BnNwSp5Zc6n0pdy69Fo
	 mV57DPr0m3cRME5IIUl5edJIF+YR/hSACBiu9l2BUCWPAuUmlcyhaxIjFme/Onxda6MKa
	 CeTvp0444RFrjIpObdpqsmTheHiBMDZYO6B4omgfCG0bw8jt5SKtybu1oAl+VYyG2Kys7
	 tmgoSUAR3+c88RFZ2jayw16ZjCyUbXi9+t2/RdXJTUihVPn+Ug9v8pyohc7G0PSkcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8QPHrnU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACD606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27ACD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f8QPHrnU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so15944385e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080936; x=1793685736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
        b=f8QPHrnUzVxcHRBOiZeU8GkPxLp2d2ZoCipuEHRYwIz+xBSd9IMQ8jg0oS6x+ROqgr
         ccGNogDHcWKCUQ13AVYw8IKb90NpuI3lwiPwt/21wfM5VAWOR6BZnQ27Li4EgJe8gNeJ
         fJVvgO8a32ShtG4VPYv0k+JLLqyE+IGgjl8drm48gQVyHcbQiN3QBHuFQHLzK63XZXHh
         PALfkBicozvdnKMhnH2upZ9k476D2aGoMOxySx1g3C/mD6h63UUCPLFTLVxyvklkn0vw
         DAxMNZg1/7x1Jzt9geNce0VcCdNrrIZEfKv8nCWrUbcrJdmrYXbRMK7m3PfSWQioSvLe
         wJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080936; x=1793685736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmvdR59+nEKktsLxK5NEcA3MaAWcKhNimY3ZNWbqo1c=;
        b=dZA26qjTQNFs3SHlOwYLjwglsMbepE891LvA9z5Ik0s29iTRV3cnGRN6XBTLcP5/EX
         Xb85BDhqhooDBueP7BskJqigem2fc5Y8V8DySU7NDsKmGwWFgg42w5sI2hS2r4ZZLufw
         YR+LiOLvZgrf+YRSjJZMiA3vDEclevMkbefk2ZOtj4/Oh00iR0mvW5CfDO8JPIXKIBoC
         jCJBDJNN6Sc5d+++QrfpXY84TiQz+uLio1iQXybFthqdwc+x4q/UUn43czTO0rsAzmqS
         lRl5x9UUN+nTWtkTZCSOzQZFZsuTMJ2Kom2+xY105hs9wH7PJeaCospYaRzFaGHYBJXN
         bGTw==
X-Forwarded-Encrypted: i=1; AKwUvBw1wsaTjtIv1EoKHHAhzHcLQYoLATzRIx5RtL7Hz+xA41tHpQeZuhSW2uzIYSvqoP+B/wEdxCxQjkLKTAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgcTWQpbR5AwWbdNt/z14X3AmLgiJLA0fPAvqe9hk1U90CUARm
	8G7vTgyIme62waysWyffTxKsc7Rx81BVPD19G1u4lWkXaSGY8vvVLgnMgeLoYQ==
X-Gm-Gg: AYBFou2bd6mIsrezvPrfYBLhA8Api+6Ohd707k6d+QD9WKstSbIXK/1v72Qy1bE/3yx
	B6NicEbGkdNNSpQI6Q+moT4n0KojH4+vMDDEJj+2/CFe/L0LFvJNPKa8XYXSFJCpcP/A/79GYij
	Us6cOuXJHhy6XmwFalEG6MQKA7COVl8c38mRLWC1un1sUYoIQ+1I+N+6hDiY9vKalBrJS8PzVJV
	PMV0MPwNMK+ryD7ALxT7MuNzed2lO4eoF6uaK31ndRPj+GrZH5hZ+FyHztUzTIUrzT0kKG51OX2
	XbfhoYG6K4eYKYNqd/2e1XHEDe/3ku1TfgDlycEq4Wq1QXh+jUQE/8KEOwlscgumegkM03kU6kL
	GVI0Fm5/9VfX86jjWdLvINCHeAS7++FAvfZWZUM89LQOznrw+Wa8C6t34jEHZdOhUr9B4NvHdtb
	DAEtl2Fp2RRV62eQfhueGDrChn28wNSGR/zvXpnlwDxVe/0QutZ9tPGx7o0cB0pJqR8UYv9kONC
	JdC1qO/j3jFvfr+wuC5c7yBs2oEm9LmetktoPxNMP6CGbDDTIYwYKjcDaq3xuWKWoScp/Y26yQ9
	QtnZt0sJk0zbrCB1JHP5z9bG/vCNNBvmv98cbDN2jsG7S6s/3xCmIndpI4469BYLUPzbvSneRNk
	=
X-Received: by 2002:a05:600c:6219:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4a35ac80a9emr155815235e9.6.1793080936226;
        Mon, 26 Oct 2026 23:02:16 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e99fsm251833655e9.4.2026.10.26.23.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:15 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ardb@kernel.org
Subject: [PATCH] MIPS: OCTEON: compute the FDT CRC in device_tree_init()
Date: Tue, 27 Oct 2026 06:02:14 +0000
Message-ID: <20261027060214.2687878-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

device_tree_init() assigns initial_boot_params directly and never calls
early_init_dt_verify(), so of_fdt_crc32 stays 0 and every boot logs

  OF: fdt: not creating '/sys/firmware/fdt': CRC check failed

whether the blob was passed by the bootloader, appended or built in.
Call early_init_dt_verify() once the prune and the MAC address fill-in
are done with the blob, so the CRC matches what of_fdt_raw_init() reads
back. x86 had the same omission, fixed by commit 628df9dc5ad8
("x86/devicetree: Initialize device tree before using it").

Fixes: 08d53aa58cb1 ("of/fdt: export fdt blob as /sys/firmware/fdt")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on a CN6335 board (internal device tree, Cavium U-Boot 1.1.1),
in a 7.3-based tree: the warning is gone and /sys/firmware/fdt holds the
11551-byte blob. mips-next with cavium_octeon_defconfig prints the
warning on the same board without this patch.

 arch/mips/cavium-octeon/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 7497be7b9431..fa8273799b94 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -1213,6 +1213,8 @@ void __init device_tree_init(void)
 	}
 	if (fill_mac)
 		octeon_fill_mac_addresses();
+	/* After the edits above, so the CRC covers the final blob */
+	early_init_dt_verify(initial_boot_params, __pa(initial_boot_params));
 	unflatten_and_copy_device_tree();
 	init_octeon_system_type();
 }
-- 
2.53.0

