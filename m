Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5B3C5525
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131100; cv=none; b=Ss4NbkEoBWYdg7yvFGwCjx9YDWN9P3Ss7AQI/ZrbaWzWvwD30lCL2ZsFz21GTIapkhRL1E6FRCxFK0mbbRmhlCs7ZQI066uurDSPpqzvhgBz7iABIu5q325zPB22edM9UkPI00r8b7SDmxKEknGtJfwfqrhwvhVrkxXWUaz4F7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131100; c=relaxed/simple;
	bh=aEgjYHXCubX1djFZnaJrqGx6S2rePES3zkm0ysI6loQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyA9XUXmtVJq4B6l3aSxMtWSHl2hSfpEAwg+TMZCSobse/iQCf3fd7d5jW/8secRl0tpwqXxbSYdGM4YMM/cpypQBfWJyaUWPb9QaVeG4s12evR5zu3+u4VPkkOs5XGZB+vBEmGC85/gm6gNQ6VWsVlVcW1x+QcnjRne4UriZdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRXmc7Ne; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRXmc7Ne"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35128e255a4so15766eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131096; x=1791735896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2eOg21KLKrIZ1ic9K99oaOBWngENzssVlnME5t6zBI=;
        b=oRXmc7NeW3Ja/e4SDQniTooWkt+XNEf3VVnAseXeikN41YfGa8pPdPIqye9xIhPTA9
         k+obLooAMMVar31+Kbcrc9YCEAympW63nHip7gUdy9rtkmJAYDt06ArsYlt82njv1k8W
         CAkU32sM/Z8b1aa0sZ0lEHFGbqsMcEvKOyGyHfBq8N9uFwwQxbcL+sgl7ZD1qRyUfuuc
         RyTMNs+J+gw5qLMfmYwZR4/zxPT7X3qwkQAF6SchBRipe6FUbuGWoC/Pha/EKONupv8C
         ZiTFLDGBCI0x+GAKPeAS8fP78io+xYjUGhlKxvKqgyHH2Bgy9hkTfeRnMMNLDIIC9LeQ
         cfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131096; x=1791735896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2eOg21KLKrIZ1ic9K99oaOBWngENzssVlnME5t6zBI=;
        b=Rbo3oy/V9DlPYz7HAoUO2J5zXeQXVBrZ9AZW0NoyioEmEsT4VvBPpLMeTloIiJL4mN
         CJnIx4wkxKct7mrQBu8WqyxnWTHIamW1M7Aie4t2czhxhslNvY9U8nyUK9d5VE2R+sRN
         AyYU1BlCn9Vysw0nFqTQbuxmG3Gg5WpPWC6u6vA4ApjhRYPFY3664hX/9+jIFLwcPlwm
         EunTcr4P7f4+Jagtnm1q3HIMR7B/zvNLtsnlzojO+zyVu9yaKckpC2m2Ea2VPqdFjSgP
         kVHeQI7/QEO82w4g6hAaylOrJEwE2PmPYCRn8aMfC9efSOmNBsg9VvahvKW24A8ym0g7
         YGIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz92lZSUmjQpzlWBTufoE5r4vBr4n4ltwFexqMuNAhJS2pxtYeAjwpFnx2fOwQZTRqyPzwHOIHxE3V+KoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mSHE1aeestsKtbZtYiJVi0OMU1ebJ3HRzKZ0t9oKLG/eBuebpW
	CX7g0RHdhLSjVzLsGB72qPMUHvlJCLf9z015cxKsxUPzRvirfD1I0UOM
X-Gm-Gg: AYBFou1hhHrOj7COzTic7ybj5HP2144Adbr76FfCmIZE/Jg8QPjeQlg2xS2NJzpK+8o
	5hrbE521GQoC7/ABnHVLIje6y3accTvE6PCl+d37SKCAgty+JHkd1jZWb/N44igyNR5qZsbknkc
	VJ6CZeBvSeSrHRPNn4TWvhEiU+XmiQy6J+vHG3Ytws3ltLRHAuenS8eCpRFCkHO8zP3dqOqlgy6
	VmcgR0ROZY3Pnj46yyZcvm/8GV5DeHt9btM+6Q0GePje9YmJFPXd4ptplWMhJIjvvfGxhwbT7SY
	eRJ3d6KQw3gXU8Ylk2hVardpwHd/A6Tj488wzQKQCygWko1ZyXbv7YUI6PwWmF9wmP6qQu3HyL6
	blBV+ZbzOsCnjZFzWu7tbWDMoiVMAtz7K9oKymepdWvRvtsFSM+mUndzwvUlkV5mK/Ubpfyx8CJ
	Lx+1P3NQqEMeZw1TeP9K8E7g/+fbJN5DJtIBtnM4mfSof6ZhXGwtUgI1sLcbxItwUyRhUHrodDL
	5G85NnCFtxVMRoCmhkn3JuQiCWvTkFgoY3mhhIqqscfjpXEqs6eBBh7RevaKceE0PECGvRJAic9
	PhZI
X-Received: by 2002:a05:7022:e1a:b0:149:c766:2965 with SMTP id a92af1059eb24-14f5af2713amr19799965c88.2.1791131095772;
        Sun, 04 Oct 2026 09:24:55 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fce90b1esm20522904c88.13.2026.10.04.09.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:24:55 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_sock: Serialize dead-device detachment
Date: Mon,  5 Oct 2026 00:24:42 +0800
Message-ID: <20261004162442.3968446-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rebinding an HCI socket after its controller is unregistered can race
monitor control replay and crash the kernel. hci_sock_bind() clears
hci_pi(sk)->hdev and drops the device reference under only the socket
lock, whereas send_monitor_control_replay() holds hci_sk_list.lock for
reading.

Replay can observe a non-NULL hdev, then bind can clear it and drop the
last reference before create_monitor_ctrl_open() reads hdev->id. This
can cause a NULL pointer dereference if the pointer is reloaded, or a
use-after-free if the old pointer is retained.

The kernel reported:

  KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
  RIP: 0010:create_monitor_ctrl_open+0x579/0x800
  Call Trace:
   hci_sock_bind+0xd96/0x1190
   __sys_bind+0x166/0x200
   __x64_sys_bind+0x6d/0xb0
   do_syscall_64+0xdd/0x4a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

The same missing serialization lets hci_send_to_sock() select a socket
for the old device and queue its frame after bind has detached the socket
or installed a new binding.

Take hci_sk_list.lock for writing when clearing the device pointer and
resetting the socket state. This waits for existing replay and delivery
readers to finish before detachment and prevents later readers from
using the old binding. Keep hci_dev_put() outside the critical section
because the final device release can sleep.

Fixes: e04480920d1e ("Bluetooth: defer cleanup of resources in hci_unregister_dev()")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 net/bluetooth/hci_sock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index 6d56c77741e1..81068b585764 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -1223,8 +1223,10 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr_unsized *addr,
 	 */
 	hdev = hci_pi(sk)->hdev;
 	if (hdev && hci_dev_test_flag(hdev, HCI_UNREGISTER)) {
+		write_lock(&hci_sk_list.lock);
 		hci_pi(sk)->hdev = NULL;
 		sk->sk_state = BT_OPEN;
+		write_unlock(&hci_sk_list.lock);
 		hci_dev_put(hdev);
 	}
 	hdev = NULL;
-- 
2.43.0

