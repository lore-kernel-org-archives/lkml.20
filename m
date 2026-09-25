Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862273B27D3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367290; cv=none; b=INFbkcfIwk7TUeJVCBL2s917u4IrON5ZHC8rcYCwxj0tySuLFtDX3OcNH+IUvW4bEsygb7yV8TibThahHoAF6+RER/GG0sTG6FoVBcQdi6MITKTUGm33olRIGVuXo3R+ptWiqyQS6OdU4JJTVw+gHjXPgJqzxNlzhLVka9it6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367290; c=relaxed/simple;
	bh=2L3z2iwbktjeunSMNJJ/cSbzm8JcdNu8ItVkBCkBt84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dbltM+o5nvJ3VuDBLgNx7bdZKLGE2e4lP2g8vpUcWSMro/rOCLhgzsTF3UjXFrJhXgHFBZRSjCWoUjBQ0NPB/xE1NyBpT7F35tOiJVJ7d/n7LKhr4DPPujzLhYHUwls/SSMbMbNXXXuusZbE0w4hNAwvDfrSGdtA60x9ii9h5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeX4iK0w; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeX4iK0w"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-80199394f52so679274a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367287; x=1790972087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Z39CUYk8D/UpSMUlekifRPB45Knok0o/5OmW1Dizxc=;
        b=SeX4iK0w+w3UZjAqUNVGOBKdyYp4TU6m9cP0YO//xiIbF1I93J2aTFnApOZMGE03J3
         t4XAxJ5j8hLeUHMxH9ld0vMkigjdnScfXLFkm4PrQMLvax7etFHZRSvUlZafnAVQ5ksW
         WO8vbAG/oRV6PxispuyDDGOBDfiC/7qA9llvsc85Lgdb4F9dm4/ZCDhCx5wYao/3uRNi
         2dbk9rw+lOEI6ErKHZFvZNOW3a0eAyHCs1W14JG5+HCT8cj/9k8tspbYA0ItwukSWm/E
         yY8bLO93S4QfjK/JBJw6OxLPWG1PH4XNK05HCe+hLErgzRU8i/L9/2A9mP6qUxMCB7Do
         k+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367287; x=1790972087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Z39CUYk8D/UpSMUlekifRPB45Knok0o/5OmW1Dizxc=;
        b=cTZOKBa9hGc7P4IPFE+qfCDUdQme84AkQUn3jT0mDc39SGpi9Mll1/EJzAGtUPon1f
         PjZA2BvC+uQcsuLnDuVlAF5zWjyUy1ClA9ftjY5rLf4h8h8PxH1EX9ONWITAxXuvcr4X
         N6eAu2M0fF7RpdlNzdkLRAgo9NCCImuF30L8ek8+ogZ4in4N85+VLDU2+gzeVCf2uRL6
         JCKQI1SKMfpASh390YfsE2FD2W9VmZyeD8OVkTsI2v+gPkN5D8E5pWx83orf75kLtY1I
         QSRGqbr6ItG/Y3f6hl510cK4dMQZz5RFyqqUR+Cu93Kgs12N2ay+GD9JnVglwzMfvfXz
         /qqg==
X-Forwarded-Encrypted: i=1; AKwUvBwk93Okhii+n/bYK8dRjEcUg+B//SGCbZpHx3WfHvngW1vknUarnUHZ0f5eeXWBXDop/8ObAQ/G5ym1zmE=@vger.kernel.org
X-Gm-Message-State: AFuF++kjRjA71O7FthGJjvCNNC670v1NARxy2DZwdDuWJysoZnWSp5IC
	pijyX19912iFLb3Q1Z+8MKbYeAxA73j1cUURsOoPVvVi49bD4orY8qv7
X-Gm-Gg: AYBFou15guPGrCd1LHb/WwYU2N1bHfny74WtIs8h5cRYetE94xMMowTSBiGD9w/uiuW
	w1PhLaBcEd2pGTICRPAakDM43Hp2eoOFTESuRzp0fGyBBEUvkyDtnCK/ZLytzsCZDs8wRsApms6
	JpaN1C0H7XNGAzNZXAOQDe59gDYB4S+rahCoJLbA+FuxRR8GO288gYh7KBMmYqZFic4/UPvS1Uc
	HnkT0xy5/wiDhAulb9FQKExuOe3GAVXras72sH9EWISVvub8g/NXexsrGoVFTRqzA6T2wRlwCn0
	zZHM5I2xb6cp6X0CUYoKgCLN2h0F9b0eUL0CLFL039lcKQS8D2IcM+r4zgzgSvIrpQWzzPMN7YZ
	rL8YYJrZDczuv8s6+CvvCj2D92/VkZZgVuLRDu/P60WCnVbDy9KHZcXf4dPZWN7lzhn55oS++VB
	9/llBVU2d0hZc3D9oJesw0p97xG/CSb/Ie2i7BEo0cqBEenhnAiCidfiThsKLb/8xVd8Jy/2QcX
	2aSPUqNI2qfOHv1ZIvy+ULf37GlAR2qDDjlkgCn
X-Received: by 2002:a05:6820:4b01:b0:6bd:e592:2c66 with SMTP id 006d021491bc7-6d440df0d83mr6934697eaf.46.1790367286940;
        Fri, 25 Sep 2026 13:14:46 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49335c784a1sm2741335fac.10.2026.09.25.13.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:14:42 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Shuah Khan <shuah@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests/filesystems: own the idmapped_tmpfile directory by a mapped id
Date: Fri, 25 Sep 2026 15:14:41 -0500
Message-ID: <20260925201441.105313-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The idmapped_tmpfile fixture creates the test directory as root and makes
it world-writable, but the test mount only maps on-disk ids
[10000, 20000), so the directory's owner has no mapping in it.
inode_permission() refuses MAY_WRITE on such an inode with -EACCES
(HAS_UNMAPPED_ID()), whatever its mode. So:

- mapped_caller_creates_and_links has failed since it was added:

    idmapped_tmpfile.c:145:mapped_caller_creates_and_links:Expected fd (-1) >= 0 (0)

- unmapped_caller_is_refused doesn't test what it describes. Without the
  fsuidgid_has_mapping() check in vfs_tmpfile(), the unmapped caller is
  still refused, with -EACCES from inode_permission(), instead of getting
  a tmpfile owned by (uid_t)-1. The test only fails on the errno.

Give the directory a mapped owner, so that both callers pass the
permission check and only the idmapping decides.

Fixes: d943e68edc5c ("selftests/filesystems: test O_TMPFILE creation on idmapped mounts")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested in QEMU x86_64 (KASAN/lockdep debug config) on next-20260925,
    whose copy of the test is identical to mainline (v7.3-rc4-446):
    
    - as is: unmapped_caller_is_refused passes,
      mapped_caller_creates_and_links fails (openat() -> EACCES)
    - with this patch: both pass
    - with 539dce114465 ("fs: refuse O_TMPFILE creation with an unmapped
      fsuid or fsgid") reverted: the original test fails only on the errno
      (EACCES instead of EOVERFLOW), the patched one fails because the
      unmapped caller gets a tmpfile

 tools/testing/selftests/filesystems/idmapped_tmpfile.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/filesystems/idmapped_tmpfile.c b/tools/testing/selftests/filesystems/idmapped_tmpfile.c
index bc411ab8281e..5968ac1cd04e 100644
--- a/tools/testing/selftests/filesystems/idmapped_tmpfile.c
+++ b/tools/testing/selftests/filesystems/idmapped_tmpfile.c
@@ -91,6 +91,11 @@ FIXTURE_SETUP(idmapped_tmpfile)
 	ASSERT_EQ(mkdir(self->dir, 0777), 0);
 	/* World-writable so an unmapped caller still passes permission(). */
 	ASSERT_EQ(chmod(self->dir, 0777), 0);
+	/*
+	 * Owned by a mapped id, as inode_permission() refuses writes to an
+	 * inode whose owner has no mapping in the mount.
+	 */
+	ASSERT_EQ(chown(self->dir, MAP_HOST, MAP_HOST), 0);
 }
 
 FIXTURE_TEARDOWN(idmapped_tmpfile)

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.55.0

