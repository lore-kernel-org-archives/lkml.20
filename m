Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609BA22FE0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896467; cv=pass; b=S5+gFrSG3wCPd+vDahqpgn8HZ81qLyrDu52OClQoGpvh2domXm1hNBM9iK4s3RvE42B98V7ojzl18XMQTZ/8tT0WBv/1K55vQAZEAQEtLV4DdwFMlAI7Qkna6/LQn1htiem9aQBk3lfgWNuit527yMo1foECQcRVhQt9EjmSNRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896467; c=relaxed/simple;
	bh=/0Cdw4au/NWAOW1gKcqBCl9EGWFO+qvu4+6nyz58oT4=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=UDl3e3YvkyjaetkWX/WU8fMreliQnc+fAcIDNxj2Yz/WxDikdSeAyuGaQcHSM+6w6uh9TvatyfnNxKFiyLhlodGojq30O6qPkGoPRn0x7GulByqegaWC1fEEJ6BiYlUK5Ey/u2LnMxLl25y/B20IiDB4835CNW9K64lhv0Ayrn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=BTauciyj; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="BTauciyj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso4727445ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896465; cv=none;
        d=google.com; s=arc-20260327;
        b=M6XHL4WNlruJ+g+vu8bLXhKe0a99JU5WCSeHeEheD4I98EPGWFcaQwVWWBijOJ7GYZ
         p2TEEYHlnZbF3JwFqjdS1Q4gFJBiA5J1vnYsmWQrhcS7qi7HJyJzobh0eCrj9ARx+uqB
         nH5HpPIdCtKZ2REVIcTH+yjmYQELPzC4zvyf/GIQb78H75ZjNEuJQhvsJIiR/T75fyZR
         bMwyeUZosniHSjxjp/OcqDOYQLQMbXNyCizRL1+rngdQww3lKFsaJ9dmhQ11p1q9REHb
         g0hCOAdI8VkbKcS/jW/dnlCjynWwBo3l9ofTJqxhE6k7BaQWUEGGongfqZyBFy+H+xIb
         dl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=UZoqGay6KxEWFh3xndMaQNDY5TP9TwG9uYWqZuch+Fw=;
        fh=x8V8syBAdSYqERWkxdqKbFhPHykMcvincWiKq/kV238=;
        b=J9eCWw4fbBKcVE5v0wId2TKM8PtwbIWhmE6KZkMHHmkkHLAaUWgzFrBhlq3UrE6hNw
         3FCoQX2lz72rD4J5kxxkA4e8QdpbjDVjfJBxrFWgZX94isLHvZCLluxbAr+XbloTrkom
         iXR7bdHheDSNM5Tsuxgel1nkEhJcq+RZ79g1q2/e1x6z75bxm0QPIDx2rOXXQiXdewj8
         aPqzncB7tqaqNlJfpt3F8HquZKoAYRkOz4AGx7w7+TswJtOcHTdy4xq0qxP+dDM6kryV
         fH/zCSTxPuPVb3q2jC/nlgBfBUi9MsBkY+ulT5aH97LB9Mic0TFSLb9hd7YhIsbcmEtJ
         muow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896465; x=1788501265; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZoqGay6KxEWFh3xndMaQNDY5TP9TwG9uYWqZuch+Fw=;
        b=BTauciyjJrJ/o/uyPradylDDgOcI2GMjrNIwj5HMMvyVuNnes2yM6Pnm4HF3sygsxP
         UhIYAec8mlm5AQT+K+TEk9uygYsqKkICobH4DmDNpdRk0WMPXk9OpXO9Q+Rj9FJk6lF+
         862SL3CI4JowCCDcsMYBXyAeBr38tEM0WQJP7BP/d+Hvq8Z3y+VeNx3lZg9pRCYTk+PH
         75DK87x2IiA1afTV1vrqFrfBLElbq5tg+Vb5tyMuVhMx8GjZ2hR8x3E+2XWIfWYLY5gJ
         3YXpTYDq/wUdMv0C+k40U2mlrdK3dkFynrlFIlOHjycxWqjBeJl+Riw+IPiLunBqvXX4
         kMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896465; x=1788501265;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UZoqGay6KxEWFh3xndMaQNDY5TP9TwG9uYWqZuch+Fw=;
        b=WWAUEi6mr9dOwf6E5HDlfRVLWYWoACMbeAbNmcU9cnVX3qOl2n+tCeIMcJBo7iiiIG
         tjkHLb2xpTqYL1I2vXrIVO7023PJGxadQqdWtYo7qfubBNEmS7I5eVgRG1+IcxunZ/UF
         EOGH2tB/4jZ551gAeGHfPxsHvDWoVB8BixTDl3Dxd9j5MJV4nkl+iQz/Yh+4D2bfVSo4
         5Go0c8uJIaJhJ7p0upmP5O5V6bCRsOJhyGo01kWV4cs0Ibw8TW5KpgQj7uoAPqzqLJXx
         mAhrrJpYNAapIDCPT8iVk2dxZxru2xGuZ7FlP4MHuTyQ1zkhL6RzIDDng0LM+ylzcWm0
         PaHQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFybSIF2o6BFoY8/talatSbr78dT4kNIW4tgwCR2N1BIfGonPUdEcqCWlqWXxRgfWAWeNbmnmGM+gKez0=@vger.kernel.org
X-Gm-Message-State: AFuF++kCcS1hHphYOxD+4p+VBQkYK+gULt6Gu9+L+MeKlrDZpbR0AfoY
	eKlJeScUQmudPFKPKth5eWfSicruN+piY+3fM+WaK9V4RkAZ1/4sw0KlYa/1nbRL0vHddUUKbZt
	LS/7H3T+S9x2EYOwxVyXkUPi9fqCe8MQtFx9ZnL+j
X-Gm-Gg: AR+sD130kH52r7ylG5QeOdo05klxCvX6M/zwxrly94O/SEt7KUxKPidR9e+NKWqmt/Y
	hCipWF8vqKBx64m15QESZeXF1BVhaJt1hhB6qt8arx2GaupG61FZI0jIecpKSW0njngDyB7UVvD
	EhAh5Hd7vyO4RKeQ3P2caOqLfao5hwNZUGc7v8kGR/Lav6ipiZdT49wtLXhLEK7tjm3STOVG90G
	Fr2cvUQe7nsjFRYAK+a6oJuDQDpwmPxJJY9o6QAvEXKsnUk8BGqKdB9RJSZ4k16SR/fEqryurXW
	7xX2TERMSNDOQP6XpNwmBDk/A4zG8Qcbre2ZZrN6nwpsITVm1WwlmuL2paxYHOIrPyF3HEN1fbM
	NdUTAFJtJv19KeaGYsv5pu0bxMUJUBWfV
X-Received: by 2002:a17:903:3884:b0:2d6:3c22:993a with SMTP id
 d9443c01a7336-2d74dbe96fdmr93208675ad.3.1787896463846; Thu, 27 Aug 2026
 22:54:23 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:54:23 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:54:23 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:54:23 +0000
X-Gm-Features: AcwNN1WqSzPeWvvBW_uhjPicafIKj_L5muzKaoHy2ATtmGpknySjkignXwdG-og
Message-ID: <CA+0ovCgjFA-dX-jdTT22W0SM6UFiDb4L8GFn=Sq7Z=cAE_Xsog@mail.gmail.com>
Subject: [BUG] WARNING: ODEBUG bug in chan_close_cb
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/200-warning-odebug-bug-in-chan-close-cb/

  ODEBUG: init active (active state 0) object: ffff888114db0d58 object
type: work_struct hint: delete_netdev+0x0/0x40
net/bluetooth/6lowpan.c:252
  WARNING: lib/debugobjects.c:632 at __debug_object_init+0x2a8/0x4a0
lib/debugobjects.c:790, CPU#1: kworker/u11:2/9426
  Workqueue: hci1 hci_rx_work
  Call Trace:
   chan_close_cb+0x3c9/0x6a0 net/bluetooth/6lowpan.c:819
   l2cap_disconnect_req+0x305/0x510 net/bluetooth/l2cap_core.c:4515
   l2cap_le_sig_cmd net/bluetooth/l2cap_core.c:5556 [inline]
   l2cap_le_sig_channel net/bluetooth/l2cap_core.c:5598 [inline]
   l2cap_recv_frame+0x8ab5/0x10400 net/bluetooth/l2cap_core.c:6964
   l2cap_recv_acldata+0x682/0x1330 net/bluetooth/l2cap_core.c:7688
   hci_acldata_packet net/bluetooth/hci_core.c:3855 [inline]
   hci_rx_work+0x4f9/0x1040 net/bluetooth/hci_core.c:4082

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
