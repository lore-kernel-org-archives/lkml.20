Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB423FA5C4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817302; cv=none; b=SiE09/DL+SW+bvarPTZi27IglliKgNBE8dDsD33lAOlH6UpeYs5vc2SwTMmriZIjvwpF4f+iwrRv2JTWiPR8sRo0uo0l0xAfChQ/jLFG6pHAuyHPlWBwtnBxht0cSOwQv4ca1LPt9kH7V8fqdiU8FFctFOWZeWfIOzMSBGSWuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817302; c=relaxed/simple;
	bh=rXODZhJyfMHv2A6ORJelACIsYIvBkG8OdwuSj09BpPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZWkYdDWO6+Ht0M94HLIN+3P92cLHddXaBSl09v5MIW14h6lIz7w3xud3y8mNss2yuUCUMSPRSH4luBbX54skls/mzRjuea6SX2E1E9oE2kaKQQ6A0kBSCXkxXOtFhjHHEL5bUjjzJ8Ke9I0OCEocJMuuEaErps80vDuQTb+x+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiwCmuAi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiwCmuAi"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so1514971a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817300; x=1790422100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NswFMR9ZBuFemDMXyZfY7VQeG8V8V8PQw03PXAK+tCI=;
        b=iiwCmuAiBuvZjueucOFQL49GxT6XN43T7rxB6WJabLnaDpNVj3rECFyotR2KvcIG/O
         xDizvtGQ8htsz2TEQDR2QGEhMwj0YHsb/Maxp93oSeaYrKdg0yXHTlUVehBhuBNO33Um
         2l4YUvnSQqp65oZM3UCdrS8IVIvtAB18FJwaEdajNPT7poSsizxDOWBtWOeSP0Y+2Er6
         yckT/SBG98AezGT9JLN58oLhVuZ+uSLLSTAyG500Umuymx3+8pXgjQOzEr2zI84UfRfb
         P9zWWqfS0Uhzlhc6Lo2Lk5WxFesc1hl7qKdFtN7z6x5ITV2t+nQN/12CcbRU1yH0sBpq
         yxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817300; x=1790422100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NswFMR9ZBuFemDMXyZfY7VQeG8V8V8PQw03PXAK+tCI=;
        b=uB9M89hnIJhpO0Jo2NlQ1bvPlypxgz3IolxSd7XSG3Igvmv3G+k0lOYho2il2F/foY
         y8RyLcJSx5FPyaV6V8CGm4YNHFUVtSqgVU2IOi3Qfjvo6M2PmG1jeYu8hAM+WTPbgUzC
         Z8Y2laR25LfpqvQDuVO8HElKBw/+fgR34OQOgc8f1iKVrGDEf6j7eJzz2cDw7sN4aiWk
         OAsQ97NzWk6f4Gt7/IDgPmxPhWgVLK/r4vj4flBwaJtBupDX3UixFH2o/E4eQcRWmcwC
         /zmhkMqQw8NKwZ8FVL/CxMDj98KAFbH5Rx8Gm6Mbc1gHWMJkZzeZe4Nfiruko+0e3KTJ
         UJFw==
X-Forwarded-Encrypted: i=1; AKwUvBxNbRVhmdEJyQWTPDHuswGRrLgoQ6fFQ5UDmSwcitbJbW1Ib3w+Ka5EZrvphIoUGc6+nyGjCF5uR5o+3YM=@vger.kernel.org
X-Gm-Message-State: AFuF++m3ZbobOFeBll6yqIIHST8GbDAtJ7GgIOhlTfblmchyFZzKtU5N
	yNZ0CNXbCUgJhvl5N9LskHdbczoacdh46VAaqkohgI0nxnQ/gQxC9tSwgyoMkNnR
X-Gm-Gg: AYBFou1QHfeSDjAMWbG7mOI731ywQ2/jPqdTRU76gZzMWm6fISVxngW8wgTcIPNcU63
	/nQxlvSG2GIRVmHZWyLdABtAhNfohsWRb+HsLfetOWDBgosF/r3MCWftcxF2E9S4Z27hkXp5RLv
	U2r/V8FerBPH1+I3iHLv85YkhtvR3QwJCTtnZjlO2mhyWfo3mIUzPlwVvGj6tRPSRFLWaN6rwZU
	zYrRLbLWLPEZg8iuAgbWNGEG5uGYLsp2EfkE/0uyq9iynLipF94cvopyVreadgPQdOeGE4YXccN
	8ob9n/p3FMBlKZboHSyCJAGPyxZZwhn5iV1mmykNMHRdcTrUd5WYNs/3eT/9HNf4uSydQUFge61
	I0FT42WxjDXCuDNppvqRsrgPUJlJlwvjxfysprgL3CZCQLvEgkri773KFFg/zZ9Waef+kK75fVa
	pH7hFItDy3K93VI/ruZPHktl/nliU46yXhJnCwVLigjZHXehWMJTXpKcC18L+S/nSmNX3M7PYgu
	KO2BTuHn/W/IOrcvQuIQiOMipDDgqQoKXWzMKi66L30uLmxYO+J41fyf6dxSQcEx9OWCiI9+EUc
	aVPsvLqCeQ==
X-Received: by 2002:a17:90b:3909:b0:39e:359f:8539 with SMTP id 98e67ed59e1d1-39e54f35cf7mr14977227a91.15.1789817300035;
        Sat, 19 Sep 2026 04:28:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5647c151sm3091634a91.4.2026.09.19.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:28:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] USB: serial: garmin_gps: fix signed integer underflow and OOB read on packet length
Date: Sat, 19 Sep 2026 11:28:18 +0000
Message-ID: <20260919112819.3885778-1-benquike@gmail.com>
In-Reply-To: <20260919080849.3005763-1-benquike@gmail.com>
References: <20260919080849.3005763-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

getDataLength() returns a signed int from __le32_to_cpup((__le32
*)(garmin_data_p + 8)). When bit 31 is set (e.g. 0x80000004), len is
negative (-2147483644), bypassing the upper bound check (GSP_INITIAL_OFFSET
+ len > GSP_MAX_BUFSIZ) in gsp_send() and triggering a KASAN slab-out-of-
bounds read in garmin_write_bulk() when GARMIN_PKTHDR_LENGTH + len wraps
around to 16.

Kernel stack trace:
BUG: KASAN: slab-out-of-bounds in garmin_write_bulk+0x164/0x3b0
Read of size 16 at addr ffff88800791400c by task poc_verify/188
Call Trace:
 <TASK>
 dump_stack_lvl+0x4d/0x70
 print_report+0xc4/0x610
 kasan_report+0xb8/0xf0
 kasan_check_range+0x118/0x190
 memcpy+0x24/0x60
 garmin_write_bulk+0x164/0x3b0
 gsp_send+0x218/0x490
 garmin_write+0x142/0x2c0
 tty_write+0x294/0x540
 vfs_write+0x412/0x640
 </TASK>


Note that garmin_write_bulk() and garmin_write_bulk_callback() are
triggered from local userspace calling write(fd, ...) on /dev/ttyUSB0
(even with a normal USB device attached) by writing a 12-byte packet
with a negative 32-bit length field (e.g. 0x80ffffff) at byte offset 4.

Kernel stack trace (Linux 7.3.0-rc3):
 ==================================================================
 BUG: KASAN: slab-out-of-bounds in garmin_write_bulk+0x922/0xbf0
 Read of size 12 at addr ffff88800f8ef958 by task usb_poc_verify/162
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  kasan_check_range+0x11c/0x200
  __asan_memcpy+0x29/0x70
  garmin_write_bulk+0x922/0xbf0
  garmin_write+0x3e6/0x770
  serial_write+0x167/0x2b0
  n_tty_write+0x5f4/0x1020
  file_tty_write.isra.0+0x411/0x760
  vfs_write+0x671/0xd20
  ksys_write+0x1bb/0x210
  do_syscall_64+0xda/0x4b0
  </TASK>
 ==================================================================
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v3: Add a Fixes: tag and use the conventional subject prefix.

The length arithmetic in gsp_send() and nat_receive() is unchanged
since the initial git import - garmin_gps.c is already present in
1da177e4c3f4 with the same signed getDataLength() and the same missing
bound - so that is the tag. The later commits git blame surfaces are
not introducers: af6d780b5787 ("garmin_gps: Coding style") and
fb571101af63 ("USB: serial: fix compare_const_fl.cocci warnings") are
cosmetic, and b4072f46e57f only re-nested an existing condition.

Greg asked on an earlier posting whether this is an untrusted-device
issue or something a local user can trigger. To be explicit: hunks 1
and 2 are reached from userspace. gsp_send() consumes the buffer that
write() fills via garmin_write(), so a local user with access to
/dev/ttyUSBn can drive the length arithmetic directly without any
malicious hardware. Hunk 3 is the device-input side and is plain
hardening in the sense of
Documentation/process/threat-model.rst - we trust the device, and I am
not claiming otherwise.

On scope, since it is fair to ask why hunk 3 is here at all: the
urb->transfer_buffer_length >= 5 guard in
garmin_write_bulk_callback() covers a read added later, by
468d13623b6c ("USB: serial: garmin_gps: fixes package loss if used
from gpsbabel"). I kept it in the same patch because the short buffer
it reads past is produced by the same unvalidated length arithmetic,
but I am happy to split it out if you would rather have it separate.

The datalen < 0 test does still do something despite the accessors
becoming __u32: gsp_send() assigns into an int datalen. If you would
rather I made datalen a u32 and kept only the upper bound, say so and
I will respin.

v2: Send to linux-usb@vger.kernel.org via git send-email with Assisted-by: LLM tag and clarify local userspace write() trigger.
 drivers/usb/serial/garmin_gps.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 8020149f5..ea10af159 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -208,12 +208,12 @@ static inline int getLayerId(const __u8 *usbPacket)
 	return __le32_to_cpup((__le32 *)(usbPacket));
 }
 
-static inline int getPacketId(const __u8 *usbPacket)
+static inline __u32 getPacketId(const __u8 *usbPacket)
 {
 	return __le32_to_cpup((__le32 *)(usbPacket+4));
 }
 
-static inline int getDataLength(const __u8 *usbPacket)
+static inline __u32 getDataLength(const __u8 *usbPacket)
 {
 	return __le32_to_cpup((__le32 *)(usbPacket+8));
 }
@@ -607,6 +607,10 @@ static int gsp_send(struct garmin_data *garmin_data_p,
 	if (k >= GARMIN_PKTHDR_LENGTH) {
 		pktid  = getPacketId(garmin_data_p->outbuffer);
 		datalen = getDataLength(garmin_data_p->outbuffer);
+		if (datalen < 0 || datalen > GPS_OUT_BUFSIZ - GARMIN_PKTHDR_LENGTH) {
+			garmin_data_p->outsize = 0;
+			return -3;
+		}
 		i = GARMIN_PKTHDR_LENGTH + datalen;
 		if (k < i)
 			return 0;
@@ -769,8 +773,13 @@ static int nat_receive(struct garmin_data *garmin_data_p,
 
 		/* do we have a complete packet ? */
 		if (garmin_data_p->insize >= GARMIN_PKTHDR_LENGTH) {
-			len = GARMIN_PKTHDR_LENGTH+
-			   getDataLength(garmin_data_p->inbuffer);
+			__u32 dlen = getDataLength(garmin_data_p->inbuffer);
+
+			if (dlen > GPS_IN_BUFSIZ - GARMIN_PKTHDR_LENGTH) {
+				garmin_data_p->insize = 0;
+				break;
+			}
+			len = GARMIN_PKTHDR_LENGTH + dlen;
 			if (garmin_data_p->insize >= len) {
 				garmin_write_bulk(garmin_data_p->port,
 						   garmin_data_p->inbuffer,
@@ -951,7 +960,8 @@ static void garmin_write_bulk_callback(struct urb *urb)
 		struct garmin_data *garmin_data_p =
 					usb_get_serial_port_data(port);
 
-		if (getLayerId(urb->transfer_buffer) == GARMIN_LAYERID_APPL) {
+		if (urb->transfer_buffer_length >= 5 &&
+		    getLayerId(urb->transfer_buffer) == GARMIN_LAYERID_APPL) {
 
 			if (garmin_data_p->mode == MODE_GARMIN_SERIAL) {
 				gsp_send_ack(garmin_data_p,
-- 
2.55.0.1082.g2b9226bbc0-goog

