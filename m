Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07B3C6A57
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896167; cv=pass; b=OEbFdJdwjR1rkZRskHzvebfP9+iSMSrmSGQq92wqcjQt5PGopRaX3a+iXLDix8FmqeUzomjiLpa6PxMVmw07B6CnSaXEG2etDrLMiyEbR3dWaRlNbLm4VZ1rj9TI96TpoZtVZtLrU5EimS+y18LHECzc4isqay3OhlftHCv1T0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896167; c=relaxed/simple;
	bh=Eoi5MdFthb0AIk7HvbeT6Jn9RK6YqFeze4+h7jF2cMI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zzuxb4JJ3HyCpeb0ZybKJCK8BYWlvHL6tpbzW2lVm78+w2XLlACgGBDux5a4aVu0S755l/CRUo1u/Vsn0CL6POZZEAJh601E31MPm4VINb6twBQjDzu1Sy+oRKZj3qX4xEGmvF99rG2T1EtPvO1WGJzCQohY9w00kmhCR2CeV1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=IgFXPhoz; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="IgFXPhoz"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1082670a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896164; cv=none;
        d=google.com; s=arc-20260327;
        b=gW5InetkYMYI60ksAQTuf/TX5jG1am5yhRUMytr67mJv2LkmI5cn6RohzOLV43Fw70
         Hb53ADO1lVmeX57Tgne7RSlNwJUeCqJhX/aodY3AgoW1pv1cnNG7iOcyF80SSFtrLgEx
         zloCv6OtlF+F++KZ8aRUCRlSb0lx1pSAJYIHhDjkV5Nxr+TB0Jw4qhrzD8cro7/IkJsB
         66HeUnzah7jtAjOAfabPCIChGmFlMRrQp3wOq6B6+4AS0lEgH0GtKWlgZRFO7M/0etWz
         JrpBFoTMmDk378F6u8gWZfJGkgvlEHL7VG5mgyrO7ZuWwyFsw3HIGaLBlGBot5MOun/D
         qeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=KV3afzr/QbmTtlbzK7OOyqX13yOZk2OW47MyKmNjj7A=;
        fh=U5IMUXQqXMHOS1WuIRsRVTlHt8w1WeYs8WYp4S1/hsU=;
        b=Ud3leJVI5HQMtUlzzSqgAsoZzXKv0xJADPl+fC4I++C+cxNcSIJ9RLYKQsPsAnWaCO
         /nUEVj70Vetodjcw++3Ua/e5feddULzLx9ORUEZjxPw7ymgTxjShgbpyBuNxnAQN+Tm1
         VR2D0btkCSyF57652MgcTzDVcxncXhpsgWK7MadLFrf9ru+OT+39WDAM1voc1piJ6383
         0AaFcEk831kENR780iIZgg7LdbqtcSbPdf+0j+NfbunFTPWxIFYZwF8OqO3bVBIFIlm4
         MSHqtVVOERFdQcWXDaVOTZwLv6QZjkHz6g0MnSVaGQW0G8mDpgyiGwx1uA1XdDv2WaBF
         PcfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896164; x=1788500964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KV3afzr/QbmTtlbzK7OOyqX13yOZk2OW47MyKmNjj7A=;
        b=IgFXPhozFsPNfGrH9wOS1548VVjkDlZ7ysaw2A1nvFv1EW8N0i3/Ugl6huxWgdSV1z
         gYA3P7CQyNLbTLJpUTmK6x3m7bFpszSaWZpPLiXp/z0q2NDxQ5o1QXz6VUjlVDHa8oR/
         4KsdzRk+4zCDE53D7+1ILgyBCYVb8cxfyhW26nd/FHY6T6ZIQIeu0ZPYeqRfsEQS+sdz
         zbmHv5MGwJhEdfgIqgOyJZP/8dpM5o+YfZsSX4X5BHg7IvkfhzYMACnupd9QpXjxISPi
         eMsXbwMKvLUdMRjBd6TC21dM0WugAplG4QcyyaYMiNlC3OZyeGfoicfqvpf/0XKDmB/U
         7Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896164; x=1788500964;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KV3afzr/QbmTtlbzK7OOyqX13yOZk2OW47MyKmNjj7A=;
        b=h3FIPnkrOv6W0gxdjPtPdLemEksQ+Ymj42qhftwR5Di1EQ0bcnOYZQkoW5YExRNzpX
         kIIZL+yNADISo7Zvi5M4VJfkJM3hJ0Oc8si/Z0+REsAy5A1MsfrVpkVkm5X7z3Myz8Y1
         8Kxko4rIb9/rVeLyMFYoyK9e267QEIDLlHJL/lfdrTG1WJY1aEJ08X/2TV5oj89LBUHw
         pYgTZEpjwzEX1SRFJv5QC/J1j1aV5FfP1nK0VMFdpJ5Bf7RHhJw9aLa6jM0yLiXhBZTZ
         DfGeA2zdoSZyu9S/+i/1dEaiF+VuTjhWGbRcErmPIrVDUcymuQBOyvLfvS2oDvtcc81b
         hmzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNy7aytQIiQTfp4LuvpxpMN2XWHB9OZuuFWPW5xHxmbTEOVSqZzT84yF1FScA3FJN/xnbZHBjfZ4dD8f4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQuA94ehEe7EbNGrUDBDj2RUCi5soGYUKAWJlowQDoRBSghJxg
	RajSyaJU21yUN0k9PBS9XC6LxaAkKt79d8pzJFhxDlXY4kc7YbYj3YzYKMu1CvZV4ie4rw73EmT
	2nlVERQcxLRBaPa2h5Jf24mMBPWCRUBcDxXw5MAgw
X-Gm-Gg: AR+sD13q+cJAoQ79hhbbhec3Q7ZK01TUxSyWbHLIXs1fepKFgAZqQRtlzr1Oxsnj8wq
	LceWp06snGjEcUcyXLkxTA9Jajb0zWmZ+VmlbBKImr2bmIYhKnV4e6Slfdu9fBJ3pxjtBgAydsg
	ZldDnvj4rNGi/jtSjwET+2ASbtikwGWVUH8iEN5avN/z+i7khPvZBchG6tHsKbRPs8gVhs+uAoY
	9P7Z4f8G0GpnSH1hSjNWTwaUm68fRmYW/CN52SrbFj2BAWXWclvjiLyCXRgWmzjQtDg9JDwBGEf
	bPE5BRi7MeJxcwPJHYc9A/HRIev1Alo4Mi3NRaTj3VXAHS9I+nrW48bN7xofbQpVEWM9EOPitKj
	sSF6ds47BpnFB/OedDC84HLe0Qi2RQivK
X-Received: by 2002:a17:90b:51d2:b0:38f:26c7:165e with SMTP id
 98e67ed59e1d1-396d0f8ffdamr9716291a91.9.1787896163427; Thu, 27 Aug 2026
 22:49:23 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:49:23 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:49:23 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:49:23 +0000
X-Gm-Features: AcwNN1XlRWwcq9BL4xcZxbU22Pno4RhYXnzldSBCPYWtS4n7zBV77JMOVugeCmE
Message-ID: <CA+0ovCij3QDLRzt8CwpjBy-BbJ5Zf5SV9w9QZXz8uD3Agws31g@mail.gmail.com>
Subject: [BUG] WARNING in i2c_mux_add_adapter
To: Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>
Cc: falemi@asu.edu, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/185-warning-in-i2c-mux-add-adapter/

  can't create symlink to channel 0
  WARNING: drivers/i2c/i2c-mux.c:403 at
i2c_mux_add_adapter+0xcd8/0xeb0 drivers/i2c/i2c-mux.c:401, CPU#0:
syz.1.250/13052
  RIP: 0010:i2c_mux_add_adapter+0xcdc/0xeb0 drivers/i2c/i2c-mux.c:401
  Call Trace:
   i2c_mux_add_adapter+0xcdc/0xeb0 drivers/i2c/i2c-mux.c:401
   cx231xx_dev_init+0x2fb/0x1260 drivers/media/usb/cx231xx/cx231xx-core.c:1334
   cx231xx_init_dev drivers/media/usb/cx231xx/cx231xx-cards.c:1450 [inline]
   cx231xx_usb_probe+0xc48/0x2140 drivers/media/usb/cx231xx/cx231xx-cards.c:1819
   usb_probe_interface+0x657/0xc70 drivers/usb/core/driver.c:396
   really_probe+0x267/0xaf0 drivers/base/dd.c:709
   device_driver_attach+0xdc/0x1d0 drivers/base/dd.c:1206
   bind_store+0x1d0/0x220 drivers/base/bus.c:267
   kernfs_fop_write_iter+0x2fa/0x480 fs/kernfs/file.c:352

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
