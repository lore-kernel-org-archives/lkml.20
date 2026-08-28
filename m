Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9373C061F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894979; cv=pass; b=GN0Fjd5Wrmdo/JX3T6hoZqvv7mlHgObhVbxGdvADi1aMXDQmp/5b5J3D+Hd6Do07yWKdZHNEQEm96SsV7mG3IILviMmhrivj24GecwcCptTUAMOE6gZN4iniDnn6YTmGCcRDG5ssTAt795e9nmvDv0YzjdkLaAHIiuuELNHbUcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894979; c=relaxed/simple;
	bh=5gQzlDU5Yw/kup+7ZjKy32uHtpa2jry3TclqVwl88kk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=g79A/CvIKOqZQ0pp8dE3/FyYwBxEaMCpHXi/hA0frYtd0711JfDmh9Bec95ZfDyAmCQAXKpOcrOnZB9HfYokWrNwTnkLFYmw2Mpi5hiOJyYG5RfyRe3XA/wBIIj6BPHN/ZEAS04qXgq6+AVQZ//PD6PyCbDWpaoLGJi/GI/LyPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=VIChUD1E; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="VIChUD1E"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39682983a0fso619398a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894977; cv=none;
        d=google.com; s=arc-20260327;
        b=k9f3udVit0wNE3I73eB/84EfofUDoSmdLDdsmrXD4pPfzajQSseflVeFYcWWJufO8W
         Zs+oReZPA58V5wPTM/1iHbbVCWWfRfnies6/XzdJYfF2aCqNBIBOYL2gYpdEfMAykY56
         j06RSInLUyc8Bu1ltC+oS2CCUaILHfOnTjTMOz5niUsLx5pcPZjCgY/n9oJqUD3RgRH/
         5tBSuwfVMXNpcRsgNh/vcVUlCMXKC+gkpN4pp6msRi5dKwJjnBJXpFCiDaQtd4jnsYK9
         XlhxCnIU7AOlBGVcDJmEsMaAmTKWaoskLHAWuP4D8tgzyeQo4HobJBI2ByScV5mXKhOw
         BCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=wySzWZ0oRbL3oNrX9dKVffVxG9TivUEYJv7g/hqtFT8=;
        fh=ue5twuOLXPp0GwIdYmGiRCw3qr8zzYkZjif9Im0ASAs=;
        b=hMn5p+WYKzFfCwOm/SkfHOluPZvT+v3zdo65ztJenZnj89K+7SwKI32Sozjin8cR37
         YAKBbU2aPDbA2iEHLEGWw1mtUo1FXitLqaBDfREOUhYa4GOhp1VUg7aVZENJSxDWsM8B
         SLORmk4ZocVQY6zQV2gC/7HhCggKx+QIRIZDhQ605zn4gTDIQhqrWbyYXssSlrSKkn3g
         h4+JauM8whwtay2f9GmBNsnsIPJiifknKImzcCMPkY/Lf90xPrMjPEwI6Eab55bvNcdm
         2EYBa/BnmBU2y8oJkxHQDnDlDx9ZiSmIqICxTJuzTRAJ4zfXb8NG8PawyUuJ6+/uxXqP
         djMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894977; x=1788499777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wySzWZ0oRbL3oNrX9dKVffVxG9TivUEYJv7g/hqtFT8=;
        b=VIChUD1E9jt8bbVh4hBJVAMRD3Q9RPlSVo+r75ixttslM650FBc8jbPavEOl2MlJrZ
         RfmWKnWSpL2ccdTxB60b5HtBrZKteUjNH8ygmZXIsYKvjH1V1trRDk9EiWL7DYeu6EOJ
         aQ9InqqXPjgLQRZfgSOylTnobKMC8eKTCpDe1acsY+QSy3HLnNFC0viZI8W9iHsZAvUI
         cgjQNKpyl0LmZOaeXuYWt1tjM/TCUOnVQgIGE7sbfjAL8qffoD5bCMoXKpLhz9vwLIvL
         L+ZeqKjpYx9QE3EB7x+pG0oGbpn9K0KHEZVl6xPcEmsbOjVHtR1PgB5rlwMfkA1T3WcI
         3UlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894977; x=1788499777;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wySzWZ0oRbL3oNrX9dKVffVxG9TivUEYJv7g/hqtFT8=;
        b=oRZiPJsYRNCFcECckPn149+0qUSCXbi06DHKl1wp2VmUvkQ9Jm1ECDo7tM71FAFxNX
         g68sN56gwGLcgmUAeqFGo6TAPgADnFv7Tufr74nXh6e0HetvseNKN018Vk/nvBkF1Ang
         1gu9BfiKHP1YGLxVULFE3Tr3VtR356WGOy8U/24cr177yiz2rP3U8/cODqvFxwxHyxCf
         +yZKY53EyY5GdrtGMHJfKJjyLHlvWpVbLUV7DUFa/v3Zwwc5FIWA0ryhK+HJaO5kQqix
         RvxAPOAOo1Jwy/AON2uj4AlpmInY//8VIsk8ka0uwxTPRX/RiUG5yyKFoqj/2ZahUd0j
         mJuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNiPpw2zLBtcjk/k4n3XCTwvwjsRIq2Yz9v318oYqcJ1k/lBQklwjNuOs0vIBH7kD6Zw2nn/pQwZL4YNI=@vger.kernel.org
X-Gm-Message-State: AFuF++lBD/2gLGRobl63ehswoYE8IqjSmp2FrNFYRL+/n58H7Y/9IuP9
	9Du8DQVFEeTqys/X8koxT867qS8+sGY5L8HH4uA4KGOSje9zwxP4OOQjYRKW86Qcyoa8yhAX1WH
	CMYXPwuM/S21WCmg5NGlH9hFPUP7voyZoTYjDvNQI
X-Gm-Gg: AR+sD12sqTr0MNxOFYgVniswuS87Bcltf4lfVR1HKGl0A7pGJynV/AQw2n5eTeLNbUt
	JPdnMrk3vnZSZnsuUbXUIilvmOQlE6PbAEM3Efp2ZYgxmgAl8oHI2o6Mr0c8MhgMOgB2ct7IA6i
	55LnmD1FfjM0YXqw3u/riwNVNVj62HG0yS3YZ6WwZHY6IceHwwTKzewVH6w2WNsZ5jSZag6KFh/
	NaKqJDyXMUSaH6BU/1H7dkvRENAmqS4GPx7q65v/NKbPxblZir9PIal1xQsi2yLqF1pQUq137hR
	L8O/hLNy6Ugo+zY0T4eKkVqkL2ThtFGhvaK7fWcqNlu8Jax4UrzFgQvnT3BOySozhl9VU1Am3Eh
	bBQzNHDQs460kACNiKZHdJ4cGuALge/R/tyWiwWGmok4=
X-Received: by 2002:a17:90b:5443:b0:395:4de0:b78f with SMTP id
 98e67ed59e1d1-396d0d4cf4emr9102094a91.1.1787894976530; Thu, 27 Aug 2026
 22:29:36 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:29:36 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:29:36 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:29:36 -0700
X-Gm-Features: AcwNN1VO63bjkd2n_6mccACQVNrK0RX-U_09RMsQQJ0CGRGMOkLHVtgRLdncZrw
Message-ID: <CA+0ovChAkaCGmDrkaAzfrmpccDXVampiV9OmjLKwDgkYXThvGg@mail.gmail.com>
Subject: [BUG] _phy_state_machine / phy_stop -- a USB PHY that reports an MDIO
 error to phylib panics a panic_on_warn kernel
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/146-phylib-phy_error-warn_on-mdio-error/

  smsc95xx 6-1:1.0 eth0: Error reading MII_ACCESS
  smsc95xx 6-1:1.0 eth0: smsc95xx_mdio_read: MII is busy
  _phy_start_aneg+0x0/0x480: returned: -32
  WARNING: drivers/net/phy/phy.c:1352 at phy_error_precise
drivers/net/phy/phy.c:1352 [inline], CPU#0: kworker/0:3/5063
  WARNING: drivers/net/phy/phy.c:1352 at
_phy_state_machine+0x667/0xf20 drivers/net/phy/phy.c:1613, CPU#0:
kworker/0:3/5063
  Modules linked in:
  CPU: 0 UID: 0 PID: 5063 Comm: kworker/0:3 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: events_power_efficient phy_state_machine
  RIP: 0010:phy_error_precise drivers/net/phy/phy.c:1352 [inline]
  RIP: 0010:_phy_state_machine+0x66d/0xf20 drivers/net/phy/phy.c:1613
  Call Trace:
   <TASK>
   phy_state_machine+0x2b/0x70 drivers/net/phy/phy.c:1652
   process_one_work kernel/workqueue.c:3314 [inline]
   process_scheduled_works+0x881/0x1170 kernel/workqueue.c:3397
   worker_thread+0x988/0xde0 kernel/workqueue.c:3478
   kthread+0x333/0x420 kernel/kthread.c:436
   ret_from_fork+0x351/0x940 arch/x86/kernel/process.c:158
   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
   </TASK>

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
