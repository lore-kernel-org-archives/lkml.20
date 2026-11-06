Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998269;
	b=rXGmGz3VmqtM4XZM5gAYTCTUT4J8u6mgR9OkvE6CocdieeECwcuqyHiCQmlODT83yli4
	 8G7dHvNJfWFt5ekCMYD9S81s0RwBwKrJwUsK4YH8NKern+ji7FrM3myUnymhk1YjzqazH
	 XafeaSn64KosecloOozHRlLYwpd2vZ44ni+OFSS69Mj3HWTIWvwHUjY6s7eVQWkDGGo7p
	 5h0meRet28dGI0cIq1Ole2FyoCcUImNLUNvc5mzLL9fVppf4QLJWAJAwPDvo0dSZFSYV/
	 KhRCoxs80OwbiiL2x5yZp3F038cFfurXyabdnDiyMmJL5DZhC+SXRDB/F4yNSMMqH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
	b=aC1a8XITOusCsy2Qwy0Cn39PajLmYlMT4boe7SnGsuU7hcb4gHm/9ELAd3ibfXDsSqBx
	 FNyJFesISTXcv3S1eGLnhTi2wuiLHXVEhGhRuJ+W41ggYTA6q5mt0yY50onkaAHRAa6kU
	 srJLxILdJmLs336P43yAS+McZJ14ttsEsuNwOkVOCT+xehBwII3GkjRhvzOsR7N0pxD5W
	 Jx/a+X1VB5gp/XZ/BK+wcvWC2AVxZAk8E/plvyGuYi/2Zgu/xATPv+C000cQ7fqqI1D3Y
	 hMKgqHZ1Y+NdFdeMioPMk1WuYxpexJ5itvLPdVoCixBec6DbpJmqIzdKNywV++FM+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3mt7+eX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C739A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C739A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3mt7+eX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1931ff67a29so3213673c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998268; x=1794603068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
        b=j3mt7+eXVOm5o0TUcFU4Eyv53kXqVSqWOigIeqe21b3GkB279H12apMkhMlSByi5A1
         S3f0ybtHKD3fDa7iBtPqNf18bLNJG2ovr6ZK//1GTyYqATFg9463difP/s3PFcHhVXXF
         KM3nTKZdOtdgQDmW5nv6wKewVVsozx9SrX5yzy4WQLoT0R4fhUh93F+TaHgAN3uTNnLJ
         hv3MiIVhVrlpa5fzOFGF3Og0RaPEuLEd/hEFQ4be226v9fbokeIsG1ehDeU2HAqTKrcs
         ktDCSjkWCnURZfvJUNuVTWavjdEOBpxFAmSD9emh69CldBjNy9hPx3Nx3CaZGk9NyrHU
         I1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998268; x=1794603068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYHr7n+/wWgPNZQyDSrxLVljYRX5eMWCFsLRVNc3/qI=;
        b=dkQChn/MI0V75kKo/M/DBNoIhchoV/lJyj6yRM/AbslyfLDSwFQH/OM5GgD7DmwlJb
         3//sMOsSi0gUdYElaPiphvuRnRLIJT/wNgS1m3QkPguJQPblbZyXPcyvpES4YrzHU/2B
         uRSkZ/DqkAlamq8I80PHlaKZFF6PC4MOlNgtd3Ba3inlnUOXR4paEuLBaDdBnGlZwO5r
         GTk0Zcw0ak8Jv46J0B+BV56npQ7k/DvZsfvIfzr4IS6ArzY4aK3Ac8Nn+6d2M/GEcIVN
         VdSIKQMDh9Ux2fGG2CSmaD0n7srEpxDXr/GSyN0XmZYotBJ0N+CJzATu5eZZf12RaknQ
         zGVg==
X-Forwarded-Encrypted: i=1; AKwUvBwBl2V6JnSOEBEV0yv50IaDM2DUxe0I7YQOe2Jr3QVLXqJXposRHwoiEx90TTL6XJt0n91+02MDoq5yViw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rr3GLUklrobccSlO9mpYQoGY6CBb/U/41Qn5vfCavjr2ra5HZ
	OKv+424ST3Dp4Zv3Kvpj0J1KfN57Zghaj+FfkNWK6c+28Y0RDq1EEL+M
X-Gm-Gg: AYBFou0gVf37XwvZk1C0N1XF2xthSlj7RVBzXtxIL12CzgW+EaXYyKfmrJwgN6Z5Ogi
	iq4PvCoRHlgVlepWqehx365oHFR4ysV4I2NqTG9QlSTWAwbl4ifMDBzRaOvjmBKI6pZ+6+R0Pw0
	E++PcSG5D3Kgslwx5fG443eMdi1FyNgV9KOfXYrEo/Ywwi9hFs4kMboboXT21xGn6La1CpEtWib
	i4dVGh6mN2LfsP9k3fkGOVMvrTksNLW9lh79IgLseWN2z9Tg3+LUZqXBIkTUF9v/SWpOTiulsc1
	gT0FabUXdLGNVIB3b+HqPyHKuUSlu1Ijlz08aqqUD4JRAHlyNkcYBu75I6G0reN4n/OkXcz5FA4
	+BMDQP7NvJfbcdDASrOOBM5axjij9BnuSe9QetUvbDjMXxB/Ez2ofVCX6BNnKS8lST4sfRgoBav
	w43706OJA2reRqv1A545CYmPO+2JW0ih0BleHoPQ1kkuKC0YIjW9Towa/il4DiDXzTu6By5iG0b
	BSlKN4h++fO9qbqplmlzjmj9QEPHAQu4ArKDDS49VK5dTScV2C7AGRTVGz0K5kmmbvdeV7rs0xc
	YbR1qCnuNYMLnE5iWF/RYOtu/Cgx6pne3Br693MDUGowuKFIqgp9zQVzquNxNueZ450ZU8mFL9u
	CnJM8OKlV
X-Received: by 2002:a05:7023:d01:b0:1ae:7fc5:662d with SMTP id a92af1059eb24-1b25d37e5d9mr4772806c88.42.1793998267505;
        Fri, 06 Nov 2026 12:51:07 -0800 (PST)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm8445952c88.17.2026.11.06.12.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:51:06 -0800 (PST)
From: Yifei Gao <gyf161023@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH 1/2] ALSA: hdsp: Serialize control_register updates in MIDI input paths
Date: Fri,  6 Nov 2026 20:50:46 +0000
Message-ID: <20261106205050.8048-2-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106205050.8048-1-gyf161023@gmail.com>
References: <20261106205050.8048-1-gyf161023@gmail.com>
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

hdsp->control_register is a software copy of a hardware register. It is
updated read-modify-write under hdsp->lock, except in two MIDI paths:
snd_hdsp_midi_input_read() holds only the per-port hmidi->lock, and
snd_hdsp_interrupt() holds no lock at all. Lock holders disable
interrupts only on the local CPU, so updates can be lost across CPUs.
A lost MIDI interrupt enable bit stops MIDI input on that port. Other
lost updates revert control or PCM settings.

Take hdsp->lock in both places. In snd_hdsp_midi_input_read(), drop
hmidi->lock before taking it, as commit c0da00145f9a ("ALSA: hdspm -
Fix locking in snd_hdspm_midi_input_read") did for hdspm.

Found by static analysis. Compile-tested only; no hardware available.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 7dce548b9f36..4e9f3a95fe0d 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -1347,6 +1347,10 @@ static int snd_hdsp_midi_input_read (struct hdsp_midi *hmidi)
 			}
 		}
 		hmidi->pending = 0;
+	}
+
+	/* control_register is shared by all users, serialize on hdsp->lock */
+	scoped_guard(spinlock_irqsave, &hmidi->hdsp->lock) {
 		if (hmidi->id)
 			hmidi->hdsp->control_register |= HDSP_Midi1InterruptEnable;
 		else
@@ -3869,8 +3873,10 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 	if (midi0 && midi0status) {
 		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
-			hdsp->control_register &= ~HDSP_Midi0InterruptEnable;
-			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			scoped_guard(spinlock, &hdsp->lock) {
+				hdsp->control_register &= ~HDSP_Midi0InterruptEnable;
+				hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			}
 			hdsp->midi[0].pending = 1;
 			schedule = 1;
 		} else {
@@ -3880,8 +3886,10 @@ static irqreturn_t snd_hdsp_interrupt(int irq, void *dev_id)
 	if (hdsp->io_type != Multiface && hdsp->io_type != RPM && hdsp->io_type != H9632 && midi1 && midi1status) {
 		if (hdsp->use_midi_work) {
 			/* we disable interrupts for this input until processing is done */
-			hdsp->control_register &= ~HDSP_Midi1InterruptEnable;
-			hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			scoped_guard(spinlock, &hdsp->lock) {
+				hdsp->control_register &= ~HDSP_Midi1InterruptEnable;
+				hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register);
+			}
 			hdsp->midi[1].pending = 1;
 			schedule = 1;
 		} else {
-- 
2.34.1

