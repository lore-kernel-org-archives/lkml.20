Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687394;
	b=usJ3e6KCuQqx/ef2NDxpLONeWxdX6zPOowZ+fuxVYS4cwD25KhwVYp+gjkJnHRXn4flF
	 96m0qkuXe+wYuY36nmT1ypWH1M/1R+GHjaIN/GUlKWcb1P4wF6MNVQ8edJK2V4E119aAX
	 lZzz+qjmwK6VO8IlmR6mNM50Inl3Cf75SG3lOTB9aE1ftDYM8JWGDj/DtmK/bR+60DmFr
	 C8ZkV3q2llp+SCO8MXoF0Q2JPQqbNLIAqmmMIoJTNoMuJTgPvgO8TC2Gea9bzaUdrqPtt
	 tDpPjGOL0Z944IkGMgPaIO5HHvzRzPL0It26hnocn0D1Ko3gaBYetUQVttwAbrHB0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
	b=ySGLjTx5CRiCNKkhsvRLv/gulPV/P3S+7UJ9TNffcx4HvowK5rW4HHwtXvgPV2X13Ans
	 hRaVdDiQE2FaFBC2sKW1NaLUjqNb0yft30mkmVkYl/R96YDiZme5o2k41ssqMXfV4ccHc
	 zMUPZFbz38t21rNugdC6LCWFKlxCzw7KAxTxO0w254BwSl8H6SXHi/+TcsHoHPwpRgrhp
	 xz8M76ywQfsg7/wS9ruXhm+9bV2Rr3mLDuXMHw845MQkIrBmOqd2e8Kpoc3k7S6jsqH//
	 OPdVzBC5x0vrBOGFI64Dl0KvzzDY4HLVctRv/WhrHcKafNYd8WnmpkiLJQKxu4BK1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEHsoiJW;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0D606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA0D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEHsoiJW
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so4142511c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687393; x=1794292193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
        b=MEHsoiJWEDS4Dzk7Wc4SeXmO11lW2V5Oqxt9ezfJSA4skiQn0KSvw9CV2yszdHV+kK
         CEiOJUO9cEQLam35aocWAO2w6vSg5l0yqzTQkmDgV2FwGm5y2K1fqEzQRionHPy/O3C5
         IiVMpPMg5T6T3SWpBIptICorHqZUyVxUBF1H8fzgb78dcsqoJCBvjhau6OmR5TGD++WB
         tOme0+MhKqr32PV4HqHjGjCD8taM2M6nid3NJ3fz4lwKCV6xFvvhIXP6TqFB53orTJH+
         iEHLzLEbbbVYTsPCNnGO3WYEF5WoGmJ4ZUPXmM7DfBQeHxwInwkOnCcjB37AmRNNP7yB
         Elew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687393; x=1794292193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
        b=v2j4M8bx5Gdoa9KjQz3VfY0qhiqANEw1Hw21p/ViLpIIf19P9mqhodhV3DBovYcpau
         KceNqei68OLT6bdJtYRkhbwp3P7j/5WGDh4rhoKnk+JqKECLrP3GrWmWbhVtPNi/ql7m
         sv+fMyzStUCDckHsygVzabD73c0fiqhOZS7Amk87eqT03cx9i3am4rwbC8XM7ufmnlJw
         zmvbpSXqLH/cRbqu5oUiYClprDiRvQ2ZC8OvISKc0cR+dkp8AaxQ1GDAGm1F4VQAQHgP
         q/r0DyDvA4wcvZkRaouJQVtZefXhjnXeUCLj5Th171RTgL8BhcGgJNH+fPv4+SmYEYuZ
         1L9A==
X-Forwarded-Encrypted: i=1; AKwUvBwh7NTuKWem73aSyw2EDE/a7FKO+FoM41hDhYOmuzpjDHRcYble34MOt6M3Fr8PQsq663CVAMFf35n5tKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WiTpDDHvirxHZNLSTWb4HerX80fp0Z1zBWaCUuW+wKXTgPrFC
	pVl2uGMZzczsdcinmWWUT0HqWwzEkWxnKyb5j9PVDu8kBY+N1mjzer9I
X-Gm-Gg: AYBFou08qqlNVeTHGDOoYlLDNOricIzh1aOGFFmx8cKtKsHECBAJk4eWzfbHCQk8QT3
	5yVnW1TjgiWkMHgwryIchxmpcLNChqMWZPsGUYWpo1fzsqodeqBtyJDkVZAIbWwl3aPpqmu1nPM
	pyz5ILP1rojDLyh6Fp3MT1mrKMyAJZKAjnsgtKAJFN42gSMQ/Bnpl4v6cOWha+hq5qmFZQpbstf
	UKUgaCThx3siuZpzriGlQxz/mDni+RepRDzulZuMzXawxFNuYAdeSWKaQ3IRB98VmKA/PDRHEB8
	cknc4HpX4+Cd8MYwJROfkb8wM0Hc9FpHsJWZTBs1njzDSvwZtcOsqyySHv5xvq8dflJtVV4/4Ek
	GqLbpOqJgkBH99ZvRgiCuBIcwBok2jhLr85PjL2AE1mX7F9Yei02F1ZnlUFdeBsubRiPPeM3OHf
	ta/1hqFhE0p4ORUM4UjbyeDqTGiToPhctkwEkJ7f+Gl8AaAqKU1RhNuK41Ex470u+hVcqv36xel
	w3JAI8vbHzKujoiixOdmXPZ1F43laxTRxzNkrlvJXvnWPk30HsFhdPzG9TcGLzcIOYQQRJGqExL
	mROlGUtd9Qtsed6nJ5ityS47jYn7VLPuO0kLIsg=
X-Received: by 2002:a05:7022:b0c6:b0:143:72b1:9004 with SMTP id a92af1059eb24-1ac5ecb37e9mr17812583c88.45.1793687392515;
        Mon, 02 Nov 2026 22:29:52 -0800 (PST)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm39366350c88.15.2026.11.02.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:29:52 -0800 (PST)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Priyanka Mani <priyankamani2100@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: fix dwFrameInterval array leak on frame removal
Date: Tue,  3 Nov 2026 06:29:25 +0000
Message-ID: <7f7db2bcb2c5d248cf72a270bd18afc71cf01559.1793687064.git.priyankamani2100@gmail.com>
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

uvcg_frame_dw_frame_interval_store() allocates the frame interval array
and stores it in uvcg_frame::dw_frame_interval. The array is only freed
when it is replaced by a later write to the dwFrameInterval attribute.

Frame items use the generic uvcg_config_item_release(), which frees the
frame itself but not the interval array, so the array is leaked every
time a frame directory is removed after dwFrameInterval was written.
This happens on every normal teardown of a configfs UVC gadget, and
kmemleak reports it as:

  unreferenced object 0xffff8881027f5040 (size 8):
    comm "uvc-frame-inter", pid 281, jiffies 4294827366
    hex dump (first 8 bytes):
      15 16 05 00 00 00 00 00                          ........
    backtrace (crc 60980708):
      __kmalloc_noprof+0x4ca/0x7a0
      uvcg_frame_dw_frame_interval_store+0x299/0x440 [usb_f_uvc]
      configfs_write_iter+0x2ac/0x490
      vfs_write+0x60f/0x1100
      ksys_write+0xf9/0x1d0
      do_syscall_64+0xfa/0x5e0

Give frames their own release callback that frees the interval array
together with the frame.

The leak was found with kmemleak while exercising configfs gadget
functions in a VM.

Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")
Cc: stable@vger.kernel.org
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..48105b36dbfa 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2142,14 +2142,26 @@ static struct configfs_attribute *uvcg_frame_attrs2[] = {
 	NULL,
 };
 
+static void uvcg_frame_release(struct config_item *item)
+{
+	struct uvcg_frame *frm = to_uvcg_frame(item);
+
+	kfree(frm->dw_frame_interval);
+	kfree(frm);
+}
+
+static const struct configfs_item_operations uvcg_frame_item_ops = {
+	.release	= uvcg_frame_release,
+};
+
 static const struct config_item_type uvcg_frame_type1 = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_frame_item_ops,
 	.ct_attrs	= uvcg_frame_attrs1,
 	.ct_owner	= THIS_MODULE,
 };
 
 static const struct config_item_type uvcg_frame_type2 = {
-	.ct_item_ops    = &uvcg_config_item_ops,
+	.ct_item_ops    = &uvcg_frame_item_ops,
 	.ct_attrs       = uvcg_frame_attrs2,
 	.ct_owner       = THIS_MODULE,
 };
-- 
2.43.0

