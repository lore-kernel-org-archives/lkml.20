Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537673C73D7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896421; cv=pass; b=Jgwc3a3IimBiMVSkNcxe4WhkOhmaBSOPCu7015/8LHxk0UolbYn4ue2qzbgLeMVKEPLmVmHDNYyjseAvLTuHN0LyaPZusP1RK5UTrL57UKE2ycxUfspDUw031zp5rS89HXUuJAHSjQkQWYGx5OW/wlOsQExugm+uG5U5nG+wysY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896421; c=relaxed/simple;
	bh=ITQFmS+Ozzm1nDF/1jQt0yIIZCz76SW4Fa3oHsE5RIk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=nBIBMyG1b9TapfOzPWg70Dtv9MiwFuajL9XOCPSfVrlZgpCcbwqdyN6aJL3UONKAVylsG3TriVlROuf5gSFNUsiljVZRwaL2/hzSYVmd80eRDurZKdr2WZp+HJ6rnZjoooDlKg1k6APRo6FaImCO4Hb0zLAzaD+OdJ5Elq7xD5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=qHpjmFQ7; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="qHpjmFQ7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf452def93so14776155ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896419; cv=none;
        d=google.com; s=arc-20260327;
        b=BUKxpQfYRKkB7yWfIBTVZ7XE8NLClh9/4ZOAwXB6t2PC3dSUq0FsbdWgmPSG43Xfv+
         bBLQqboymyCH6jAC8QbjgSseKdEbdZ2rMYaD/b+GwR2W5a2xibCI9Hl7gs59WvWF16lR
         ZT2i6kONXc+w2jfsNotYJYwWT4+JAqG1SAtubJs/0DZ/HwyLzTybQUOxL4T4juzdOdJz
         zDEmFEAZgf5quaLiynAf3GRqy+aheuUBrVfMyzUzz2qdP5Ve83+pInrO2NWAf8GLhVZi
         jRXUFVnrzChzMf7dsNUJJVOl+MHST3Onx46vGbWxZX7IqerB76kLpKyJNBD/0t39BzUe
         Hdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=8Ajix6pSP3dD5mSuyEhKRU4hsb+gmrjX44fsDah3OII=;
        fh=Wcww5KPtnwhj9jP9S6Rua074nPF4ip+zyj72Hcw3um4=;
        b=kuCssRQRqY2f1uUpgywtk6gtMhkwB6ND2mFX963wyOq5q0oUT7NBJK331qxRMtUnn5
         ec9q8Aajjb1oHja6CQwoFDVjS6KH4VHzGkOnUshmHWTAeLGNypkSDczCS9o8l/dNJ9Y8
         MHd4OlkGXv+i3WQleRZnnTjHRBJGjNzFtoeSDnDeggXkAK7+8CHP1hKLPXaotvql6zhV
         dE0+QoQ3A9Gzlus/zjY1Sv9g9Egz04Kc0TJneTqzZ1pdOk65qEG8cjqhxDOrVAvjYRyN
         0eYOB5HfrpNEwUpw4822Bu/UXqewOeouIy9ekJQ5rSnmIF8D0pULMo47v0gs6Esplljm
         +K5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896419; x=1788501219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ajix6pSP3dD5mSuyEhKRU4hsb+gmrjX44fsDah3OII=;
        b=qHpjmFQ7TDrymsSYhshbzNjcdlY2uH9HRb4fpdmMEJt05kWY/QFzLAeIygeQ2b11SG
         uwrHf8WPz2NITjFDdkjLnCJFH+eD9ZqQD4wssZgt2ESJFqKUcRgwAr9jjj6K2PejG0Mw
         qaOBTzc2Y1v0LsHhOWpWPBut061UxwhXmfQnwlwtae6k7XanhJ1wI1mDouJaJre3ZpMe
         hC+ErUP942VXXZjbA4F5IrBCD6thl7niVlTcXrFbQTE5+1gmIdQvxW6iwFyZmmB9pKep
         nkHo0u5JfBoq5bZEKF4E6P0PnZWa6lpjOPydhOscF+bqHCwpfxs4lcMXlvGQd74HpTsa
         06xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896419; x=1788501219;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Ajix6pSP3dD5mSuyEhKRU4hsb+gmrjX44fsDah3OII=;
        b=FzxuWs/i2NTLAjw0o0ExsQKLp4be5wan3BhEaDRsu24Pga4HLqeOk9h9ISeorxwy6K
         0nhJ4qUvR/d95OWi8RNHweastmEbye7+L2jFHbbYR9JKcNwqU81YCPx3tWZO2T15khWv
         Dky+WBuuWLg81+a7de/UK+CXB02IYtlPcpLMyBxZRPIHZUheMGJpqMGjttCBRBs2GuhE
         hAaHnN1vp+rBIVXDJKRBfAU64TEVkFevDvrr/zqucTw6c4mE6ZiaTNIAECFOzAT/P5V7
         W2XFALo7KdBGSq5nU4dOvjDDJgpr5jTLSXBOJxgmfOu9GpTTiQjDJB/nsGZq7NlVK+oU
         2o2A==
X-Forwarded-Encrypted: i=1; AHgh+RpgnctZSGk1M05lf5NXoggYmJ7zRDuv9ti6vnMIyOTjPoYOFtFZqod7zzD4a+M6w7/aPVpP9kyryyxcdrU=@vger.kernel.org
X-Gm-Message-State: AFuF++mbsf2D/qG2VrQCRgpuuIgTAdNQLJR79nzW5RZxWv0dbKcIGVkQ
	RQzi83tX4be8K3MmsFF8WTd4fk08ASA7HdzWSaXpVvrvUuEW5DY5HKs6fd+sGFDDbE8zAH6LG2m
	wOvIOJpjN4zhs4oDnxw+yL8HYJ0KJ/rfPQ9o0hvwg
X-Gm-Gg: AR+sD10YkfzHY6JTTJNOSd9oC2J/23sNbkLyoZgmLm75zAZ29Gave53/IDbW0sTckt6
	lddR1M8Qy9hUNen1DB9jz9ant69FHHeuRfzdsGbgiKJJgXBfFgRzIuext/m3TQCgvcLnUgwyBU7
	OrRKuPmLxdy1MKLJZuXr0yZE13bW2re70WkCXXncm/J7HqSJBLsFXpPW54Ia7CmKJwLXulL1jFM
	moVYAQOEF7vhK/EwY5S6u6kxX3yp/vThginUq8SmgGZ3cxbXmWAULSlZHvI7HghDVGdqIiHD/Is
	dSLvYESygSzG+IafMJOHl6Zu12JVMrcBfvSP1US9oPFVXIhfQsDQq++gIXY1rF4LaVohx75lban
	KSvAMIYuZqNJlFYSorUVnLoqQbY36HttD
X-Received: by 2002:a17:902:f693:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2d74cdb922amr46484225ad.10.1787896417858; Thu, 27 Aug 2026
 22:53:37 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:53:36 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:53:36 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:53:36 +0000
X-Gm-Features: AcwNN1XuBPWoPSWLXoMRUh4L35STvJf21tDRay3RqU4hvbKFfNsN2N54C3_w-do
Message-ID: <CA+0ovCh9MQE6BZD-8vqWMcrVS8Bj-tYY47HqeASvE7_b9QP-ZQ@mail.gmail.com>
Subject: [BUG] WARNING: refcount bug in gsm_mux_net_start_xmit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: falemi@asu.edu, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/199-warning-refcount-bug-in-gsm-mux-net-start-xmit/

  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x9f/0x110
lib/refcount.c:25, CPU#0: kworker/u8:1/14
  Workqueue: ipv6_addrconf addrconf_dad_work
  Call Trace:
   refcount_warn_saturate+0x9f/0x110 lib/refcount.c:25
   __refcount_inc include/linux/refcount.h:366 [inline]
   refcount_inc include/linux/refcount.h:383 [inline]
   kref_get include/linux/kref.h:45 [inline]
   muxnet_get drivers/tty/n_gsm.c:3938 [inline]
   gsm_mux_net_start_xmit+0x3af/0x440 drivers/tty/n_gsm.c:3951
   __netdev_start_xmit include/linux/netdevice.h:5368 [inline]
   dev_hard_start_xmit+0x23b/0x620 net/core/dev.c:3904
   __dev_queue_xmit+0x160b/0x3250 net/core/dev.c:4831
   ip6_finish_output2+0xfd4/0x19b0 net/ipv6/ip6_output.c:136
   mld_sendpack+0x820/0xe00 net/ipv6/mcast.c:1855
   ipv6_mc_dad_complete+0x85/0x470 net/ipv6/mcast.c:2279

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
