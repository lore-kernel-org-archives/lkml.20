Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543738;
	b=fJkwG5g6YJiX+pJ86+qD3PPzcyLoP0k44m04GLyCmgNH1nKf4S7tcqreuO7greRHLhRR
	 EPb2gy0aneQ1XEA0SzrzGt8PNxEHOz58hxRmqZKqoZVRmSone2XC7aLGaL5zxdEkzQGBf
	 dHaWTxGIZLBzBeaZy+KVKRUFngwlayxg15lpOefbNnhiufqYsImKt11/MFmhEbmRr9UeP
	 xlltT+VtHyPlIlsoookjfsIMEmMqM+5JvygYslO29Nx3zhIGERhYS+0DzHcRsY7Qv+rJi
	 mPLVouL0AhBBwQ2of2dQ0ssGHOJtGBNwksMPnY7/g3bVmtFVdKuhAvj/lsLMuJtY6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zpeqGzgkBsHUF5zjr/0o42AjYScikuGzKIUBtwN8qSA=;
	b=uW9JLsGGuOr504sA49JuRCJneBSAw7aKnIRC28bBDMJcJuJ8D1FkJ80QQyLhZF0ZNJdP
	 SVrDq06KIysxH3bdTTzVqYP0pWEEav3IBtSov8PX+tUXQcxdcUmh6hcbE3PZQB7Vj957p
	 6XhOGKBWKtknnEUOBiUypL9UJiXgqpN3Wa3YuQj/6fBVQBypBTx5i8uBdLGQyVcY+CRmY
	 FHu2jM4KgXOIGbEDH5lkR/GEHG7YPbhJVd7nkaiTpCnkOFc+2HLTLRvy7+9U8xgc5H3EX
	 D9ePVlZ152DAi+MImNi3MPmIUJCZM8WvA2GNI9x75D1f9Xf2rgf/UM+AbiWSHGpwhqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9nlG7GI;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53449606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53449606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T9nlG7GI
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e4c00d71aso85162585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543737; x=1795148537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zpeqGzgkBsHUF5zjr/0o42AjYScikuGzKIUBtwN8qSA=;
        b=T9nlG7GIUb5RoyvvlJpX9tW/JjbWjc80qOYRsirNuNvga+cfTfj2DB0/T3odVWckua
         5beGgZqbFsj36scUnef21+K+lhQMNymd1a22h2R2/XwGMRfACBfdWLPDEcfnUeLtEo8+
         IQye1PTY2Vi0SRjBdV5169aX1HgPXZLh+GBd12atNqoY8+5QhXztxOSVBwkAqksE/mKD
         Dz8u037lMkSryvPCLFB/iyOuX93i9ChPUI5hFSUoCFR7RaN89Sy0fP02PGYGLRyqKt9s
         T2gxI+NDMNb9kn0NCAbzpU4gus0Zq7BqUqEH4cr7B1+W5pF2j+3kKjzNyrR4ZZ4+SwUm
         sXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543737; x=1795148537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zpeqGzgkBsHUF5zjr/0o42AjYScikuGzKIUBtwN8qSA=;
        b=q2WxOGW9ZGoggi8qam228DpfdH9mhHi2Scw+T2PcN9Yv8I/G6+CpuA/ZsVex1jvuAl
         Y8++dVVs68I/o5t+eIkkWbvevCXp4km1sxm4MGHe19Tkq+NqJY5rN04AcNPUoehNEnAs
         w1vDFoZN6uzs2WLvSUSp34E+9S292ZaHCxjQaqO+3Ut/WkES4Sp/q+/u+P2AI2cTz4Yp
         5hrojWXgX0EZY47Ai7LPuDhmEk784uEC15c+BtPGizsKG6XzRhYf/kfVu8ZvX4Y4+PYl
         Wt2snqF4mqICRO7PCizXb3gHWxqMmpQz/LZFWdFXs+Sw2x+BMGcfPxRpb+hIEa8+dCRI
         LUFg==
X-Forwarded-Encrypted: i=1; AL+hErE3itRUmDbowqwBhiQ+HD77FpvnL3JcncSHVL/M0MpofyrrL6YGthDZ3Y57tOMQ/tX0mKDIYIR1KJDhJr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fBuYiGJj2f2Hix0Y9Xz9VAEKzuUfzHGV4H+YFcTrbMhdFQ7Eh
	S7PTYUJWZqTEAdlBFKNJAa9mH63lvKIuFq1GhWpHHGoBGq0ZZLvkqAkI
X-Gm-Gg: AYBFou2TTiOW2T7IRZBGrzCZmuFKiqhDoJFJOtaKZTlCMZCOsh65jiYU3T25RcWk83M
	SbD1GADs3UYkp2C07eGcuoGtUcLKyAAlGHdkskuCg9sz2YdVYLJpsHsS31xgnipXTR9xTW8B2aA
	md+KLB/Aypwwr4o+B5ikKG8Qof6+pf4hk/Uw/0x7YHC6yxy9lFLjrHg895Km/wQuqafeiSYls7G
	MbrvjGf2bnGLGHAU1mbGYsR/6oDB3XzREFGZJzfLBset/ZW7nQYYZOq4Zfk7V0kmYTQM3WfD4AO
	GndWGPYdd4uA306Q9vKBJbaj5r2/szmDS8hfvDzPXvYu+NTF5ZD3+9SHnZ3dRsY3xYoOREvH+ag
	lcP0HPF4bKXkc3algXsf7h3E3b8Oe3iuzyhxloiOYN7BbaayekrFDp4qwhDDxHPgDq0AI2RxcSA
	xAAaJBiqDF81b1coe14jjBLeCrn3Z/fpKG8fQsxZb1/B8ptnBICJ+Qhj3lYmltw3wNyw6FDaapa
	dAWxiNt2WV5zAzoS4RV2ZkdpDcCUeA5uOlD5xKtVMr08Id322JbpScZO5dv4Nhrst8NWaM+OIXp
	usoX9BI+fm4cnatp5Vv1vBG0YvIsml8p5sVst4vjDIadjKpVNYDMylki1AZV8kjw99dv8fRH95s
	=
X-Received: by 2002:a05:620a:6192:b0:939:b099:d52f with SMTP id af79cd13be357-9494ba7dfd0mr224512985a.20.1794543737300;
        Thu, 12 Nov 2026 20:22:17 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8a8757sm96426485a.31.2026.11.12.20.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:22:16 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] powercap: Hold control_type->lock when removing a zone ID
Date: Thu, 12 Nov 2026 23:22:14 -0500
Message-ID: <20261113042214.2155381-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

powercap_register_zone() allocates the zone ID from the parent IDR
under control_type->lock, but powercap_release() removes it without
that lock. powercap_unregister_zone() calls device_unregister() after
dropping the lock, so removing one zone can change the IDR at the same
time as registering another zone of the same control type. The IDR can
then hand out an ID that is still in use, so device_register() fails
with -EEXIST, or keep an ID that was removed. intel_rapl_tpmi can do
this, as all packages share one control type and each package device
is bound and unbound on its own.

Take control_type->lock in powercap_release(). The device_register()
error path of powercap_register_zone() drops the last reference with
the lock held, so drop the lock before put_device() there.

Fixes: 75d2364ea0ca ("PowerCap: Add class driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

This is on top of commit 3d1c2693d809 ("powercap: Do not release the
zone when device_register() fails") in linux-pm.

Reproduced in QEMU (x86_64, KASAN, lockdep) with a test module that
runs four kthreads for 20 seconds. Each kthread registers and
unregisters a top-level zone of one control type in a loop. Without
this patch, powercap_register_zone() failed with -EEXIST 7 to 12 times
per run in three runs, the highest zone ID was 4 to 8 although at most
four zones existed at a time, and up to four IDs were left in the IDR
at the end. With it, there was no failure, the highest ID was 3 and the
IDR was empty at the end, in all three runs. The module also makes one
device_register() fail on purpose, and with this patch that error path
ran without a lockdep report.
Not tested on Intel RAPL hardware.

 drivers/powercap/powercap_sys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/powercap/powercap_sys.c b/drivers/powercap/powercap_sys.c
index eacbc3c96db1..e9aa1feb5e3c 100644
--- a/drivers/powercap/powercap_sys.c
+++ b/drivers/powercap/powercap_sys.c
@@ -388,11 +388,15 @@ static void powercap_release(struct device *dev)
 
 	if (dev->parent) {
 		struct powercap_zone *power_zone = to_powercap_zone(dev);
+		struct powercap_control_type *control_type =
+						power_zone->control_type_inst;
 
 		/* Store flag as the release() may free memory */
 		allocated = power_zone->allocated;
 		/* Remove id from parent idr struct */
+		mutex_lock(&control_type->lock);
 		idr_remove(power_zone->parent_idr, power_zone->id);
+		mutex_unlock(&control_type->lock);
 		/* Destroy idrs allocated for this zone */
 		idr_destroy(&power_zone->idr);
 		kfree(power_zone->name);
@@ -561,8 +565,8 @@ struct powercap_zone *powercap_register_zone(
 		 * ->release(), which may free the zone.
 		 */
 		power_zone->ops = NULL;
-		put_device(&power_zone->dev);
 		mutex_unlock(&control_type->lock);
+		put_device(&power_zone->dev);
 
 		return ERR_PTR(result);
 	}

base-commit: 3d1c2693d8091a6529cf7ed8079c4968527d58b4
-- 
2.43.0

