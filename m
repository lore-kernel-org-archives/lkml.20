Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A540FD9B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405774; cv=none; b=HKStxIkRF7yn2+8p3PS2aeuZgziqzCUsQPN6yq7jkvUvVoon65szSvPCOtjSq5gtDUc0Gxr8XzDVa7yHRbauFOuwIDC0985XL4fmnXy3IgA/VZeOOCZ9by2JGO5ykDHVoqpT/c/s6nJHFKxr2ocrTMKoz12T/fzBttg3/jjG9tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405774; c=relaxed/simple;
	bh=g8BDCI6JqyW6Uf+mMX6qW1G95mTfVsH/2MSP/rYQG/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JuVWOJTzZH3vzAYsA/aMP2XJRxP0OWI0IzxvmasJL9su533t/LrlFpfUwQ78YXmRBn3ByNSubPYUwi0yJiNT9zN6gGGnaXoCTU6x24+46vr+80AK0IeWm5cmtO8/oInEeU088q+N5US0jFSHnB73eLU17xBUDog0QIz/ZBp+DIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=iEjpYIrt; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="iEjpYIrt"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1419d3416ceso8497919c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791405772; x=1792010572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FaPMMfy3kSaEwQMGtDvVabEUdmi7uwY1ANxfR4FZtSc=;
        b=iEjpYIrtLBTu1J66uOooF9bYpjqUXW5tfI4ZFPyRWqN2O7yBYJues7WZwq/UF3h1nE
         OMSzCOC6uRRHiVhFNSJJjMwjdQZv3vo7kzxo0U+7aP4O2L86GVpPD5S6lSusyU6SBw39
         0hUVAAj7hUSpne38yHjhkcPtSKwMu9UHjOhDjUBQy3GHKuDIsn0j3fjw3kdfLGYllb4P
         UkZhjp+1mIfPYBOgz+dHjMwzNtHZn9N+7LxRm5R8O25aDiyitggFoA3u4dv9Z/jEel5j
         6Wz1yXqA8u8SeYYn57tN8OfDQmXbXDb1kdnkRJrac6ljfbEKwx+qYzfr2xQoeDQz9w+K
         CddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405772; x=1792010572;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaPMMfy3kSaEwQMGtDvVabEUdmi7uwY1ANxfR4FZtSc=;
        b=zsvIW5iKVvbCYX/M/syD8g5UkZ2HUFFzHTUx9uyKz44MYxbGHwhANWvK0oMUwK7Yo5
         JrhrsMEpE3LzPS3HnXPdr38QPraTLlmCsexCFQxJhsXkWHKnKr7Keda78yAdJqmeQubk
         o0wYFg0eJ/0tj98SOnb79GY8vKOkhP+ppKcwnIn85Nxi+1pF6BxwkwRb5UMBlxVO7TaV
         QM+04kKdgUpnK5Wjkv/eMHU1S9ZN98C6J0mTIut9VUtlVNA1hUtQtL9Cxh7EjDw3uPac
         oVFwjcCLyIHfRCpMp6zOVhz8oZtdynCiDQMp3H6yjNAZ8HkqefJohSH1rqefUMd5jDJQ
         0SCw==
X-Forwarded-Encrypted: i=1; AKwUvBxxPQy//+ZAp/sjWXV04aKalA3x5gHoJG2KfR9whFTwNtsCLzBH4gaHbe3unac8Xkgije1oc8uQDM/iZ6s=@vger.kernel.org
X-Gm-Message-State: AFuF++kCG+Lu0BuPmmKUFwx3ko+y/NXuUMkTibByicrFhsAs5TSQe8U1
	tP3djg8tOArmBs+zfErNSZIUE0kH1RNQlDDK9v7PoCpLnymEVBuuzvHnmMAN1JczlNbOROT9YVA
	AA7VYe0CsmA==
X-Gm-Gg: AYBFou3QBLorjtiWdkhgqElstNUubhl1/BphO8fECHMeVea7GtT+E+yNkxBLXe8/OgI
	lEvmJ2P0c8/RMM+MKUAch7YsThpl6WmW3S8a63EZnc31VZ+T575dkKuvifSqmQPdO1EPrshoUoL
	B5eM1OqpBGvJ5nQYSDjup20/zJoA8uDizSH99sMETKAZsBkSE2fYcwiiCyB4bCWkLRLejPkznH6
	6Hj6acVhlQTVjTtF6nepuxOhdb+3POtz1NcMwEwVYE91yKKyTFWeA2M37osFv82oDmcbzVCKdK+
	UdPjQIcs4x7IOIdOnb4ZMvNIw9IfTnZqtt4ceoqT2NtuSC0LcX3MvmnFmA5bMWAv9i6Zj7Uoi1C
	RoJi+4sSBJDztNcmM2fZYLTBjiSGExNMFq6kBiyG15zIgepZSlJ/OFhrza6y0dQ7DrJlsoB7ocS
	GvKkhL1sY3RVkHPZvW2RLaCe7OWhi5oZI4ienUNyqiel5I1G6idm2PHXiD7Ehl7ADq9QX3Ycfzg
	ouFIOirT6byv/T53APBLqX5tGtot308ZZspbtYkaDu5hSlVqx/7C4m5s4uaFj1Vp/DUhX8=
X-Received: by 2002:a05:7022:43a9:b0:14a:33d:f581 with SMTP id a92af1059eb24-16204a7fa14mr5327330c88.22.1791405771845;
        Wed, 07 Oct 2026 13:42:51 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:7854:1520:fd4f:2a94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm7586938c88.10.2026.10.07.13.42.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 13:42:51 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Helge Deller <deller@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Helge Deller <deller@gmx.de>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [PATCH 6.6.y 1/2] AppArmor: Allow apparmor to handle unaligned dfa tables
Date: Wed,  7 Oct 2026 16:42:22 -0400
Message-ID: <20261007204226.47033-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007204226.47033-1-artem@trailofbits.com>
References: <20261007204226.47033-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@kernel.org>

[ Upstream commit 64802f731214a51dfe3c6c27636b3ddafd003eb0 ]

The dfa tables can originate from kernel or userspace and 8-byte alignment
isn't always guaranteed and as such may trigger unaligned memory accesses
on various architectures. Resulting in the following

[   73.901376] WARNING: CPU: 0 PID: 341 at security/apparmor/match.c:316 aa_dfa_unpack+0x6cc/0x720
[   74.015867] Modules linked in: binfmt_misc evdev flash sg drm drm_panel_orientation_quirks backlight i2c_core configfs nfnetlink autofs4 ext4 crc16 mbcache jbd2 hid_generic usbhid sr_mod hid cdrom
sd_mod ata_generic ohci_pci ehci_pci ehci_hcd ohci_hcd pata_ali libata sym53c8xx scsi_transport_spi tg3 scsi_mod usbcore libphy scsi_common mdio_bus usb_common
[   74.428977] CPU: 0 UID: 0 PID: 341 Comm: apparmor_parser Not tainted 6.18.0-rc6+ #9 NONE
[   74.536543] Call Trace:
[   74.568561] [<0000000000434c24>] dump_stack+0x8/0x18
[   74.633757] [<0000000000476438>] __warn+0xd8/0x100
[   74.696664] [<00000000004296d4>] warn_slowpath_fmt+0x34/0x74
[   74.771006] [<00000000008db28c>] aa_dfa_unpack+0x6cc/0x720
[   74.843062] [<00000000008e643c>] unpack_pdb+0xbc/0x7e0
[   74.910545] [<00000000008e7740>] unpack_profile+0xbe0/0x1300
[   74.984888] [<00000000008e82e0>] aa_unpack+0xe0/0x6a0
[   75.051226] [<00000000008e3ec4>] aa_replace_profiles+0x64/0x1160
[   75.130144] [<00000000008d4d90>] policy_update+0xf0/0x280
[   75.201057] [<00000000008d4fc8>] profile_replace+0xa8/0x100
[   75.274258] [<0000000000766bd0>] vfs_write+0x90/0x420
[   75.340594] [<00000000007670cc>] ksys_write+0x4c/0xe0
[   75.406932] [<0000000000767174>] sys_write+0x14/0x40
[   75.472126] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
[   75.548802] ---[ end trace 0000000000000000 ]---
[   75.609503] dfa blob stream 0xfff0000008926b96 not aligned.
[   75.682695] Kernel unaligned access at TPC[8db2a8] aa_dfa_unpack+0x6e8/0x720

Work around it by using the get_unaligned_xx() helpers.

[ Backport to 6.6.y: Use asm/unaligned.h because the target predates
  linux/unaligned.h, keeping this first patch independently buildable. ]

Fixes: e6e8bf418850d ("apparmor: fix restricted endian type warnings for dfa unpack")
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Closes: https://github.com/sparclinux/issues/issues/30
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-46254. Both DFA unpackers cast blob offsets
to aligned big-endian pointers even though policy blobs need not be
aligned.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 security/apparmor/match.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 29e728f6fbcf..19b44e705b26 100644
--- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -15,6 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/err.h>
 #include <linux/kref.h>
+#include <asm/unaligned.h>
 
 #include "include/lib.h"
 #include "include/match.h"
@@ -42,11 +43,11 @@ static struct table_header *unpack_table(char *blob, size_t bsize)
 	/* loaded td_id's start at 1, subtract 1 now to avoid doing
 	 * it every time we use td_id as an index
 	 */
-	th.td_id = be16_to_cpu(*(__be16 *) (blob)) - 1;
+	th.td_id = get_unaligned_be16(blob) - 1;
 	if (th.td_id > YYTD_ID_MAX)
 		goto out;
-	th.td_flags = be16_to_cpu(*(__be16 *) (blob + 2));
-	th.td_lolen = be32_to_cpu(*(__be32 *) (blob + 8));
+	th.td_flags = get_unaligned_be16(blob + 2);
+	th.td_lolen = get_unaligned_be32(blob + 8);
 	blob += sizeof(struct table_header);
 
 	if (!(th.td_flags == YYTD_DATA16 || th.td_flags == YYTD_DATA32 ||
@@ -293,14 +294,14 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
 	if (size < sizeof(struct table_set_header))
 		goto fail;
 
-	if (ntohl(*(__be32 *) data) != YYTH_MAGIC)
+	if (get_unaligned_be32(data) != YYTH_MAGIC)
 		goto fail;
 
-	hsize = ntohl(*(__be32 *) (data + 4));
+	hsize = get_unaligned_be32(data + 4);
 	if (size < hsize)
 		goto fail;
 
-	dfa->flags = ntohs(*(__be16 *) (data + 12));
+	dfa->flags = get_unaligned_be16(data + 12);
 	if (dfa->flags & ~(YYTH_FLAGS))
 		goto fail;
 
@@ -309,7 +310,7 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
 	 * if (dfa->flags & YYTH_FLAGS_OOB_TRANS) {
 	 *	if (hsize < 16 + 4)
 	 *		goto fail;
-	 *	dfa->max_oob = ntol(*(__be32 *) (data + 16));
+	 *	dfa->max_oob = get_unaligned_be32(data + 16);
 	 *	if (dfa->max <= MAX_OOB_SUPPORTED) {
 	 *		pr_err("AppArmor DFA OOB greater than supported\n");
 	 *		goto fail;
-- 
2.39.5

