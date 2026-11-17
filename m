Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933583;
	b=hvTucXpBO/oHl6ZZu22t2QkiJohQuTjbHQj4Y7Zi1RIs6d6uqimK9XCuTPQKlA4FiVfD
	 5dZGOH6Dj7BlbAA7VsqG1Zrofv2/ICuEVtGOVEOq/7Xy9Hh52TpEXzVbjRJnvJnbaQOlb
	 9dRiMY93d6WR2dCXDmSv+S8OC6kYCGCVSYrUZVfjxuXItkSMDufrE8wHEkzzkPanT1ikx
	 OTm8cg+xF181+BBEIlFSYPeL2YGIy9n2cmrTacFISRjoSMTV28bJwP7ipMm6ty+Wi4EYI
	 zBl+g5w3MXGCcFfhY7vPRrV7TOpTdbMVn5ed2Vz3tY4FvbcBiYmVAUEFIIJPP4K6Y3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
	b=BFAsoNOIvbONmIS8AG5S8kLhBa6t2M2GySLtWwDoE/zS2CMhAdd1ZQYisUSnoY+C5bu9
	 NJQBTTxuitt6fUyONrAaw/rRBWbSRSmm17eR6bB5iOGWJx2IGlLvpXYGw2itpCyRXaRkY
	 UCkM+GmsbuPCJohXxYXJ/hlZo6HkKOHvi/S90rGSZk65Fpefzp32jHVDm7MIy+vzVF1J3
	 tQKJIAX62V5XZad/OOxiCCLNBQ4Kw+r8sLgKjmy4OfSEZzZcBOfljGKsTyVHCoKt5TaKh
	 Ya9GNbId7S5WRflrLpuBz/qp9mLUGD80yinbWMMWJTp027MFJnRp/P7YZBFiRdztqXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJhgbQOc;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D87606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8D87606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJhgbQOc
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492f0a1b685so3331187f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933581; x=1795538381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
        b=tJhgbQOcgcJYobi/hzdSu+8Tt2qQ/2dZNmpPk4e+ZxI2eSqPJl8HZJp5LUzmlv3xZp
         XIO81DoGsShLYYtFTH8aCx+OkEoU2mrdab+0hsyWgOqDSDyVjyR3136BgT9DqiKdloTW
         sn7yJWqorQHQGl7zYdpYaSmMWxhjU4GjiSbB1Nx3169z69VHnec5I4nZAK3eyB0fr3P+
         HqKVmEEs1hYmQ2JMg8EyU6rDtG411OwBCPVZiJjEa6TTzt702ckdWyfWIEBzcfQ8su3f
         wcjVe1kS+wq7QXhWd4pu91uZEALN/Ae0dQNV+/HLRbh0fPZfjXJtT6ReBtJo1KAvufa5
         DhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933581; x=1795538381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ulm0G03sCySHIhrtUq93+/xbXgYkzf0aPutKqa+d+g=;
        b=jYBc2v8aIkYLtCEECR0YT10NiSLofUP7vdDnrnCcd4Q0o8x0MVcHDZHZrarncYN1Mj
         9tWsmNWAy5UL/ZaOwZBaLRtkRyy8tHw+U747/QW+weQULSBbxvih8/q7aKkkz0TVnIlD
         FYvwefvacPX2cINQrzcrzmLcGVFAy6XFfVmvIbXkI3jtUVNqR+1v4KXF7D4uQ3jJ4A+o
         eaWO23QsYMQzoVcrCCpxEQEbmaPs8BJTsJ4rQuqChWjaaTPo8HYS3XeJZVgrs7zrzayP
         zr2fn0OU6KnmFYbRCYcidPbLZ2Mda1uSZ7t6498Wdtx1PXwCKC5XNb0+yRwbEc7z4E+v
         eFww==
X-Forwarded-Encrypted: i=1; AL+hErHQDAj7NWQGE3glqxYfeYzMCQZgElLx5dOBXIcnkWgREkzmvUq0I1eqL7xcl5Xav6la1I8xP2zNAM2uwfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NYIU13loQDbXfnH0H43ZyLpKLO0jpUc1dYyI/FYLd+DIcRaod
	PnOa9MMmqJCaBDPz/jE05YaCG79QooluHWidMieAZMe0kX2BnoJxP24f/oLOfn8S
X-Gm-Gg: AZFdTZelJfBlfIg0mxyCF2b4MvY50fY3uMaQOu5QsGsNgF9vykP6YuEno6DlFgRfMxl
	c5l8s/da/urPGB7KEvLjuHbKeH3JRZ+zir533VDxFu+m7S/f6g4qRlgdtsUcswyKcNbhq0aDtXB
	keIjxQjw4y51Cnz19nUCPjau+gWcE+FFzRjD2kdQTHaRcEJzFMuq1A+y7ZIuwR/79qu/4ebVEFa
	aBOvuHWd9PtgzdODe8J1Cq37dg/wgiCIi7hI69k3uRQpsTO6TteDcpjTRmhZ4OeCwI9VaDNLc9q
	XfprHKMB6aXSYCMmr1DBkDDu+qB1/Czm52p74c15O4Prcwj30jPByxtcXq+b6QuvGWT4ADgp/Zx
	kQeDtS0ZMK0Z7uAW43VUbRXSSK0BH5Yv2r8YX8bPrEa0ky2VQK5P+Koad5rlGjvwgOLZOHsmZ7W
	/xfIg07G1kB5PNHm/wlh1Qyp08esqNcMVVwn2oK5hVPXeiXE6K/GT7j2zV9BKaOuOIjSBu9fSPg
	9A6L5g8+xzZeGKmx5e5sYyN+dOdmNEWuuuHFUT1JclcQDg/WKKPYuer9TOib5wOUWhOjBZQqXhd
	vRccQKHEhA9k8xvXH+2tnQG9GzLzgmjWH16pe59PTgqmG/mvgriv/FfcZOE1nciSuuBar5fHoGo
	ZVy6Uzj/46xAdB40E9zgHUPIyofdvzLu6+JextHm26d/byI6l
X-Received: by 2002:a05:6000:29d3:b0:48e:6a23:4a09 with SMTP id ffacd0b85a97d-49c731641bamr21234472f8f.54.1794933580972;
        Tue, 17 Nov 2026 08:39:40 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f78214dsm29292716f8f.25.2026.11.17.08.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:40 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] MIPS: OCTEON: program L2C_CTL on CNF71XX too
Date: Tue, 17 Nov 2026 16:39:39 +0000
Message-ID: <20261117163939.3727065-1-orgads@gmail.com>
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

Since commit bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG,
on OCTEON II"), cvmx_helper_initialize_packet_io_global() writes L2C_CTL
instead of L2C_CFG, because L2C_CFG does not exist on OCTEON II and
writing it hangs a CN6335. The test is OCTEON_CN6XXX, which leaves the
CNF71XX - also an OCTEON II, as OCTEON_IS_OCTEON2() and the rest of this
file treat it - writing the register that commit says is not there.

Use OCTEON_IS_OCTEON2(). OCTEON III (CN7XXX) still takes the L2C_CFG
path, as before: I have no such part and do not know which register it
wants.

Fixes: bd978130307c ("MIPS: OCTEON: program L2C_CTL, not L2C_CFG, on OCTEON II")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: bd978130307c is in v7.4-rc1 now; this still applies there
and to mips-next. No change but the Assisted-by tag, now dropped (an
LLM helped write this patch).
v1: https://lore.kernel.org/all/20261019034918.3805764-1-orgads@gmail.com/

Found by the Sashiko review bot on the original series. By inspection
only: I have no CNF71XX board to test on.

diff --git a/arch/mips/cavium-octeon/executive/cvmx-helper.c b/arch/mips/cavium-octeon/executive/cvmx-helper.c
index 107b1be..c02448b 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-helper.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-helper.c
@@ -1028,7 +1028,7 @@ int cvmx_helper_initialize_packet_io_global(void)
 	 * to the cores. This avoids conditions where IO blocks might
 	 * be starved under very high L2 loads.
 	 */
-	if (OCTEON_IS_MODEL(OCTEON_CN6XXX)) {
+	if (OCTEON_IS_OCTEON2()) {
 		union cvmx_l2c_ctl l2c_ctl;
 
 		l2c_ctl.u64 = cvmx_read_csr(CVMX_L2C_CTL);
