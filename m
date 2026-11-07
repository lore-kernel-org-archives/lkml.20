Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029378;
	b=efavguJ0oFnazy9QBst2A6xbjIgIn5WaexjWNQjmJjTxy7Tt5vTEoMUjG0dKEkNviYZQ
	 yhRgZTPSAJm4XglzJg4Esb7aiGiE3+m9U0bXVg98/Jou7sD2vB3juROPp/DqrAKKwo0sR
	 ee4zSoobfnPfWDRTZx2Hz6VSEkdywO+TMFCAecL685r8S3dPs4yoKrHXQAR9UyJttrQuo
	 dYUvrWXgOeAakkNt1NSwvX3VhYyvUne/+5u2KihB1gfedKdgw+ArQatwLTtVK+TS64Vw2
	 0cL+yw6oiyE1S+Gp5npmaN3un5hpRKdz5CWQR/o+WZ4Ok1H1LjaPQyBvXfZA0W0zFqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029378;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=iWtGlCsXyDg+0XDDQp42mfm/iFWlVjXTouLGzx7/hcs=;
	b=B+2+6i8Gw+e5WUzSDTTzi5f7bo+dEETMHbhtChckXZ9VS7dvTrXw4TWsjmIlIT8B+cZS
	 dghOXZHaRrYpb4OkbyeA35+LUwn2evehLw5tsW4eu/182icFyfvmCyA0BSEvRgNfVyNUq
	 g47f4q8+iN4JKc74W2+KukWxDRJW8QIRqu8Wjof71a7FZW+vljcnD2EnpZZMfGT+KCmc0
	 B23LfpZ6yXKe1LvBBkNFPhmtuWdAohcUb/6oOO8CsLyDHirJ4jYbUB+JxLZDElYL6SHxk
	 tthrnZ3zXrm3rbO4xKdUo8YCey+Js3Xfbz/SSYzUg2zpBZRb0zW7/QxT4l/4NEMrlTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=wd2vtWfH;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="edi85yK/";
	arc=none smtp.remote-ip=92.204.81.222
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [92.204.81.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E174606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E174606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=wd2vtWfH;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=edi85yK/
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzNx4crb; Sat, 07 Nov 2026 05:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029359;
	bh=iWtGlCsXyDg+0XDDQp42mfm/iFWlVjXTouLGzx7/hcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wd2vtWfHQCMLwknGi+pNw/KauzM9fStzordvi2WoHNGpw8AyV8xVbKZN0LP3wZ8WE
	 9/vcl8qWtSCDw1gufNAxxNMBkK3m/DNYVcdvvywP7OppJa5mNRE7B1HJfdero7pKJu
	 DS4GLDSsugZJVB99yixicaXFcpTKtMqetQya231Jt7fhFp96IRkLYLIogdgw1lhEOa
	 6DRVpV6PcJBNaZz7C+AcVuYSR1dhPHP6RYHUPg3tbWWNgGrcW5Haca9gubcSL3dpMX
	 EDv5FwT664v0PKDGjR8NsZv9yF/iNmOaIsgJRey2TU7VRrBgbOrANhNkqK02/mx+01
	 fTuJhAWW0EvAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029359;
	bh=iWtGlCsXyDg+0XDDQp42mfm/iFWlVjXTouLGzx7/hcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=edi85yK/YhCm6YosrBbqGtSPYYXstlXNaHRySYxlNVSWPg+Jinjyzrpytn/UwinBG
	 tCIIOvCo4NdCfO3OxYWepYZKM+h88LLdf5sHq9IwERE9K8Nwee7npslDS8f9Za+pfN
	 9wQZEcTAI4dxOGh6RljrBiqZVdBV7eifvUFsbP2FwU/Z0x6Er1yThpNgwlYrgH5qZ7
	 2FhDgxspidUi+1ZNuYu47ptcQss7EXoK2Vi0Ht142Tw417oBF8EZFycF4q6niXk/uk
	 BudRE/2icFA0hM4YVebFFGERHA6nD63b7qrzkIEywcAgpKE462Lx05YEz6Ac7Bg9dp
	 dMLEekFyuS3EA==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb72e
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=yKgdCBhA7QK4Y9OD5tEA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 48d75bb9d4b0034978209d62233e4f39:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 07/18] Squashfs: fix fragment bytes overflow on 32-bit architectures
Date: Sat,  7 Nov 2026 05:28:32 +0000
Message-ID: <20261107052843.725239-8-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107052843.725239-1-phillip@squashfs.org.uk>
References: <20261107052843.725239-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfDu/yLk2/aHObaQTc6RbFrmcIl61u2alngyDbXFz7JNDSVMFEmfiSmRQerJcqysekTVGNt8OAXeBpmUj8BWrdgrgrtU8Z5rTnYceZj20Y/JTFS1ABRkq
 BBdrs7Yw57o2lJWm/2n4qsmW3g+r+GC399c7SyNYTuqwfYyBxEMlzZi/e0lEyDikDSpYa6EfiHB4xhY57YQMQLToa+7LAXwN7q8cMzgxk31q4giKV2/QA6pD
 aUbG+Qf1AHjEnuLhmbMP/T+uu4r8M++rjWS0teQ5CNItW0T+aYHTRdBCF+T9cZd0

In helper function squashfs_fragment_bytes() the u32 fragments
variable is multiplied by sizeof(struct squashfs_fragment_enty).

On a 32-bit architecture the type of sizeof() is a 32-bit unsigned
integer, which means the computation will overflow for fragments
values above 268435455.

The knock-on effect is the size of the in memory fragment index
table will be incorrectly computed, and a much smaller than expected
index table will be allocated and read into memory.

Later when a fragment index beyond this is looked up in this table,
this will produce an out of bounds access.

The fix is to explicitly widen the fragments variable to a long long
in the squashfs_fragment_bytes() helper function.

Reproducer
=========

The following script when run on a 32-bit x86 kernel (which lacks
KASAN support) will produce an I/O error.  On a 32-bit ARM kernel
with KASAN enabled, the out of bounds access will also produce a
KASAN report.

[  193.817260] ==================================================================
[  193.818057] BUG: KASAN: slab-out-of-bounds in squashfs_frag_lookup+0x23c/0x264
[  193.820408] Read of size 8 at addr cc126708 by task stat/357
[  193.820720]
[  193.821675] CPU: 3 UID: 0 PID: 357 Comm: stat Not tainted 7.2.0-13187-g66498c75b4f8 #113 VOLUNTARY

=================================================================
#!/bin/bash

ARGS="-no-duplicates -no-sparse -no-hardlinks -quiet -no-progress"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

# Create a Squashfs filesystem with 1026 files and 513 fragments.
# This will create a two entry Squashfs fragment index table.
#
DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

# Create a Squashfs pseudo file which is fed to Mksquashfs
echo Create a Squashfs pseudo file which is fed to Mksquashfs

dd if=/dev/urandom of=urandom bs=1024 count=50 status=none
for i in $(seq 1 1026); do
	echo "$i l urandom" >> pseudo
done

# Create the Squashfs filesystem
echo Create the Squashfs filesystem

if ! mksquashfs - img.sqsh -pf pseudo -p "/ d 0777 0 0" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

# The fragments field (fragment count) in the superblock is at offset
# 16 bytes.
#
# Over-write the fragments count with 268,435,457 little-endian.  On a
# 32-bit architecture, this when multiplied by 16 will overflow, giving
# the value 16.
#
# Ultimately this will cause the kernel code to create and read a single
# entry index table (where in fact the table has two entries).
#
# Then stating file 999 which has a fragment id in the second index,
# will cause an out of bounds access.

# Write 268,435,457 in little-endian format to file
/usr/bin/echo -en "\x01\x00\x00\x10" > file

# Over-write the fragments count in the superblock
echo Over-write the fragments count in the superblock

dd bs=1 seek=16 if=file of=img.sqsh count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

# Stat file 999
echo Stat file 999

stat /mnt/999

popd 2>&1 > /dev/null

rm -rf $DIR
=================================================================

Fixes: ffae2cd73a9e ("Squashfs: header files")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/squashfs_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 4088e598400f..524d4a77686d 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -55,7 +55,7 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
 /* fragment and fragment table defines */
 static inline s64 squashfs_fragment_bytes(u32 fragments)
 {
-	return fragments * sizeof(struct squashfs_fragment_entry);
+	return (s64) fragments * sizeof(struct squashfs_fragment_entry);
 }
 
 static inline s32 squashfs_fragment_index(u32 fragments)
-- 
2.47.3

