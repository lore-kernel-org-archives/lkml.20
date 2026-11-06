Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941173;
	b=jkYOdPKWnlD+2QxFZHeEn4aglirn2p0VtWjzKrbb4pBMKcDDi0ndbtSfpCi7CXfmEbYI
	 8j0v2BAwNYWRclPX+t/5JF5ze7Wz+3xFN372YiW7P7USvOvDK0Exo7pknXBG6eSIWoJoW
	 k1XuS+zrZoiLRmXH3YsoQ3uW2szlDXGnOXI9yGrJS1H0DSgOY6Jo2JDhqpkjaTkj46mKR
	 I7NXXK4AmKr3yqZRCZVrGLpLi+1M3xxos3BYQpSoa+wMWGgN122nD1+QONQL4NAT+cCVJ
	 dXOYK7ffm44F/OhzSY5A+UpNo5NV4eS9d0/IjLyakLQ/EMcKVtUiottnPqcXBMfrrDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
	b=efmrcb/fTc/l+0vFI5Ur5+ngdBsrOPO1NtaR4rA2eL3sFA3d2waZD+yOwBNYGB3cvJAu
	 mlr3eZuUwMiltJA2wrHJRnb8YWsIqDlGe5y8kN/sudjCu2JpdLps1dVqIevKRGgVCbdWN
	 voBFvulRwORMfrOQglWiL2iYBA4AP6/GaDaLWP9pgU5YUNQciJf/nR3JpqqtI5pRDaaSE
	 DN6gcCQSwiS8aT2Ko6ah5s2fnXxlrNBj/L80Tv9a48yqNlM9AyUWi6R1pjHnYPIMMg7uq
	 Ka3b5ERulNKJyU2Vk2vtH0bpA3jDEQ8diqw7etapmkMBzm2Pgc5WOpwu9xWv6m0d3/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESnQB5SX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05A606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D05A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESnQB5SX
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso310691a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941172; cv=none;
        d=google.com; s=arc-20260327;
        b=G8vn7IRshvT13nOahpGgEJmAkcGhO6Hu3VFXTt/5k+gDW19mS8riu2qyHpe+tnyysj
         hakQf3dTZYYwNxC8E/Mk9kyo9NvGBz77sM5nLThkd00iaKhK7Xg3YwbdVM3gHQl1L3K9
         zPHp811VdkCMkramqsq1XI13AGjYMKe5q8EqIZpdEnY46HD789yuBqWsgV74GaXnk//x
         f3uyIa+QvyLQcY0ftRZpsNNrDUoxDQM1I2Cuih4KzTe/J6SZSKjUJFZqlpnkgDLzDpcr
         UZxyUrVErbpBLMm4yV5Gx2BddAOu4vJtE2tbqnabc/IbZadVj5snLY0RrMx864hugkxE
         VYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        fh=xpOqXtUtWTs8BzzuVsRDC7Vkm/uZyy1c+UKAK0d9UYU=;
        b=RLH5fCwLgXAyU03NCJOB1Q6uFKO0FDq9mBFYu1+b0nQSi+YA5j0AItO0fd0MblTDih
         W2C9IqYRpHllJStWuofrfDRH4zG2zydtawO1INKquuMN4g+6rA3PJ6ngzuquX6cVQTlP
         3bbqxG/p5x8T2MOdORtLFlpXhfWeQERah04MAFnSYzrhDiCynWkKrsmer1MM69azBulY
         kl3pzIhMUzvvvEjMZV8HO4d+GbLlhE279jzJGpGqtnio6o2VxjvM61p0WiHvWxWGWhk3
         NiA7mgltKauCs/MhCES08Kvx2X+NvHyiqdCpt48tt1U0cRsdvOIYtnb4PEViGjE5lgPV
         D7iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941172; x=1794545972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=ESnQB5SXngposlYGfWXteZKpzmQdpN2v3wkEdKkj7ePkswkwBH40yzRKijfjaHGfoG
         BZH5RS1JoUo3wQfDbxoqJoS1J3KrBLHk9+EpgI2sqWqWG51cvTdMckyoXb+hiKxwbQqd
         sEvUF0l9ZI/QIsqyznngu0pWX5hHCaed3T1HKNaAJMipa5uyh7IAB8y36+82bMN0DL81
         0syn1FJTN+2Xre42vGhxcIIgN4c0YSBWkxCGXWlhy84NsOma8DOz9uYsLkvoGhXJPiCt
         QHFcJ8lcLaz8VXa1fWMALzF5myV3GwSD3km8ydMpSl3FQcLUjMa0gk4g7BgWhBvUf+sI
         /f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941172; x=1794545972;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=YXQQuAlgDWlOCqJEsRog4I69iMA6DCYhM4yHcJjbYlzC/xVSwa4+vZ5TdXv+mYEZI+
         g6pP5c6XsL+oxrF0nAWFdIRlMzKGPG+Gtg1YrLevIOcuT/9sxYmEFO9xsQbhyLr60wDi
         9zddq+ENl9xYzcY/z7M9PWyzxTh3IvemQwcOKSjmvtn80EUELJWI+ABck4ijHflzNPyZ
         eMhp5htwSylW/TjoIA8uSQ0qPRjl3iAn8EreL9vHW01KOJSkDKTxTxufoQDMtOe3pMon
         RO/9BsegLRg+UZFi+REmYOqLEaU9OgWd3wwAWjEKxNRRihncAfQtpuWi3DBQYjX9irnW
         sJUg==
X-Forwarded-Encrypted: i=1; AKwUvBzApIahmmqbmSeG0fAa01bb9uKEAJjlg6oRPsXHY837d/KeInpPFrrw+DL7PQZMz7f5krW4v7zfW2OEoV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hzNwXLW7sz+smqVDFBqvab2DyWdvB7mfxyeSnGckKi+wN6G6y
	QsSWsU/83u6anU8287h5M/wIziKncHtKDH3wywe3p9aYWsvDbu23z0ZrDsVyVmYfmZ8yxOyPNag
	rfCiozifRAnMYkGliiF7PU+vy+FfIJv0=
X-Gm-Gg: AYBFou2eVRAVingeww2CBIoc3rQbGuLr6yut25cPDg3Uhautx9RR0CFgiY59bCcTy+t
	EVMAcK68PHv47kQpMApCSTmwrgTjYiRVyUTeYbNvgxvqNaxDuWJmZG5mkq8uPq0lmKh7kBpOcUo
	6a7GJFCZ/IYPNhkN37nVFHgrIEA33+bdy1HJ2lw4Z8/C58rnXIq19XS2IYIIz3PS/65ZKYLL2YT
	z3imFCxZLXkillMBYepd+O+Om1rZjlUblJ/frUbPLFJZDcBEt76hQcHaaZRPjsEXzWChhlXAdin
	+HLBPnZPOjsVRkDu7lzqQzEnvzJzyKA/kCyAP8W0UttsdsMAFw8xy1JieL2XYxbrYq3bm0Scm6d
	CtCiP769oBxxKMJj5tGu8uPgNeCKVYivVPzEEcg==
X-Received: by 2002:a17:907:d03:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c4d34a64653mr110110366b.9.1793941171526; Thu, 05 Nov 2026
 20:59:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Shantanu Sarkar <shantanu.connect58@gmail.com>
Date: Fri, 6 Nov 2026 10:29:14 +0530
X-Gm-Features: AclHuK_6yVfvd4MvFxvFI_KwNC62wXAmnA8mSmYy2zvtvvaMyEA2xYUb-GFYXG0
Message-ID: <CAK8Z4SCRhWcbL5i6NgwiLWDCX48YbMfcJ_+nFrGxKMZiN1vG3w@mail.gmail.com>
Subject: [REGRESSION] media: em28xx: list_del corruption on dual-TS disconnect
To: "Jiangong.Han" <jiangong.han@windriver.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect"), merged for v7.3 and backported to
stable, makes em28xx_close_extension() unconditionally do

if (dev->dev_next)
list_del(&dev->dev_next->devlist);

On a dual-TS board whose secondary device is not audio-only (the
normal DVB case), dev_next->devlist was never added to em28xx_devlist.
em28xx_duplicate_dev() kmemdup()s the zero-allocated primary in
em28xx_usb_probe() before request_modules() links the primary, so
dev_next->devlist is {NULL, NULL}, and the list_del() on disconnect
crashes. On current mainline (7.4.0-rc1, 05441d697f7f), with
CONFIG_DEBUG_LIST=y:

  em28xx 5-1:0.244: Closing input extension
  list_del corruption, ffff88810de88250->next is NULL
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:53!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 1 UID: 0 PID: 32 Comm: kworker/1:1 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   em28xx_close_extension+0x15a/0x390
   em28xx_usb_disconnect+0x16b/0x2f0
   usb_unbind_interface+0x295/0x9c0
   device_release_driver_internal+0x48d/0x7d0
   bus_remove_device+0x444/0x560
   device_del+0x523/0x8f0
   usb_disable_device+0x3d4/0x8d0
   usb_disconnect+0x346/0x9a0
   hub_event+0x1bd6/0x4d10

Reproducer: syzbot's C reproducer for the bug the commit fixes
(https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c), with
one byte changed so the emulated 2040:026d device (WinTV-dualHD
01595) exposes a DVB isoc endpoint 0x84 instead of the audio endpoint
0x83, i.e. in the memcpy of the extra endpoint descriptor:

-"\x83\x99\x35\x19\x1f"
+"\x84\x99\x35\x19\x1f"

Results in QEMU (x86_64, syzbot's upstream config, 5 min per boot):
  - tree at 826915b6b65e^ (before the commit):  no crash (3 of 3 boots)
  - same tree with 826915b6b65e applied:         crash above (3 of 3)
  - mainline 05441d697f7f (7.4.0-rc1):           crash above (2 of 2)
The unmodified syzbot reproducer (audio-only secondary) is fixed by
the commit, as intended. I have not tested real hardware or the stable
backports (6.12.y, 6.18.y, 7.2.y, 7.3.y carry the same change).

How this was found: we were testing AI coding agents on old syzbot
bugs, and an AI-assisted review of the candidate patches flagged this
path; I then confirmed it with the reproducer above. No AI-written
patch is included.

#regzbot introduced: 826915b6b65e

Thanks,
Shantanu
