Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806833F8CA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805332; cv=none; b=IWHqFlrwepRIzLITwaZ9m9L6rk/+FC6Kl5vnMkUpf80En5HisLX3jKQttJ8OadWk8Hpn8f/4pbA0L07ztJ2u1cDqL2XHl/LWVWCyu5xfYqz8czafU31vlOg+N44HdPzlBvqiT3yAtJLlgoQARnbSPT35ajXEvEKiE4lhNbVOFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805332; c=relaxed/simple;
	bh=P5q84maMhhS72A+V8J8qdH4IkwfTRnPbblV5YcqpoTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEyDP0PrlqRcJD/q36aPBAyTXZu5hZr3QmzciHx0swG+O2IJ1lt+slljRSZimnCbzZ84fNeie44emTUEw2fRyfHOL5c0jjWTRbZZGOQwf1Xz1yv6B2zEburmg+o3Dd9lJ6Pn4CqVBb9FPnfwPhYiIv6m5e0CA80cv/jYBqDWjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwKfuPx+; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwKfuPx+"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso794011b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789805330; x=1790410130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHNH7g42yLoSXOJ1h0G1wxmaKln1gDZJRy2SUTb5nfw=;
        b=WwKfuPx+CQNPc/ywyDYTYDDr28GWZIF1ZtnjJRv6fRxXS1Qv+kUhRQO6PzHpAMNsvW
         YdGa2au47TWlgIGnzheWO4nUmfYjeSsqp838QfyJEQwmmA1CXSCXmuUUgL9Ewi/4jQ5t
         c40REs1PWTVRjvHw+UAoFoI5gO2v6lNtltbCCkUEu04q4SHC0rMciglpCZj3AGpQYmGx
         8dRIw/0qdfvCDJ2asn7vXlFszB7V562AUVeTdMyB4pSCCLZimUywxae80QpipTGBJaBE
         wcNelEVanQd033itvabgItgXsJ46LppjXi2dwdjafpkiexBh/p5T6qAidEH+saKROTJp
         qY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805330; x=1790410130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHNH7g42yLoSXOJ1h0G1wxmaKln1gDZJRy2SUTb5nfw=;
        b=t2eyTx8tjRDkwo3deePBkcnPcSJAp19mLnLEYneGrbu1IjhZ//Esmeyk2qonb+Uuz7
         oFI65iR2z6yfqAN/34qKFP79/okhWcf5bsgKWGyZlSZXBK99IzoUIBoIDr1TfR8UsQv9
         8YdEHrnig2xh1D34vFYyQye3NoxpTH8YRiQXm+Es+vNOfIIAfJJM5gA1njvVWdq8o1mA
         E60z3AZm1lJ6buORg6nPHD3P8HLTYc9OMyp8Cmidp7m7n4JoPEpor22rp4OX/fnCHpcE
         gduyFppB2wo5PPMHqrJSFqGJuJSD55vTboKB7+E6cXH5Ep0Dbev6qpTc5wd486qEgWrQ
         1FIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFoLsE68S694tPALkK7fwHQ/PPj4I+1Nivizzw+1ExJVyguBNHpypvLjJgq1ct3hmd5FcBrftpuaIj8sI=@vger.kernel.org
X-Gm-Message-State: AFuF++mEdrIiuQEhfPjzE4dLNXTj5ltw7kbyEL7VSNmH6/GUsZRzgkDN
	pW9FR8JHPfxJjIRJPMGdIWSJWEge8EDp6WPyA6iXHhTSJD4sgGn1VyJj
X-Gm-Gg: AYBFou2YEpezN0YVwwkz5u7I4xizXFqudeqzUSNpeq/sdKTZSWYSR8OVOj1WXLl/ttO
	lj/Ee3XNfCkr0S1uUrE4u4f6TKmL0CfHXeki1Ph/gQJvIN7U6r6YHAdiUxuMWM/PCwRn1ay8jmg
	HHv0DDiKqBPINBfpK1lKESiyqfq/4Hwph1Tg1yxCqbJJNn3vWr9aJJFw1IU6D4/bWA+cCx8ceBC
	2/mZH7qiql5tr5p+t/pKYwZAn6YEdwsgOUGZJhEGkK3a27ytO6K5x6kTjRZbEA+mQpQY5Ks2xRb
	V0AZ+f9ZzKVzVEjMG26CprqKZAREMmPfYNkoI0TMoJvWGYPegUlAeeXDBjU92ItNieXx8FVCvkY
	2JrnVKFud8Muix2RxGe+tpqsEQ0woBOyttY+0J7oEHihG1+vCusQdEU1Ra3xt17IQRFEqyYZBpp
	fw7BPR7al6sDHsfKXJuSTdNCtlZqbZgbW1iNmfTxVh7rAMcGbfc+ysDkiBozj4cjagUV723oBKN
	NIQ8Ji7CXytIXLsaALrZNmKHPiJzazQnKJ4AYW0P3PlMiflOnwNNqQsK4Ew6oatHN9dcsIie2J1
	osNhrqyfNg==
X-Received: by 2002:a05:6a00:4654:b0:878:3507:8d63 with SMTP id d2e1a72fcca58-87835078ed5mr787527b3a.42.1789805330066;
        Sat, 19 Sep 2026 01:08:50 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec901sm767203b3a.4.2026.09.19.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:08:49 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v2] [USB][serial/garmin_gps] Fix signed integer underflow and OOB read on packet length
Date: Sat, 19 Sep 2026 08:08:49 +0000
Message-ID: <20260919080849.3005763-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <2026091908-imprint-rejoicing-6933@gregkh>
References: <2026091908-imprint-rejoicing-6933@gregkh>
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
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
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

