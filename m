Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456682;
	b=AJZQJeRT9PxNKD6Nn0/dojrQJw63TXtEuPMja1Ugw3P+jSA+493bWx133/4pP3ZLfPy3
	 Bt0ItNIC0SzsIITZL/LsEC5m9qpV3yRm4HYOS53LpTb3FO48swGqO2K6TO/2czKkXDVDn
	 HGMn2hmNDJ25mPsGgN8kMCXmhIZ1UzVN0XAbRPXIUcp3f03NEPAkd6ouKDGD6zpyxwrab
	 A1EgkxPOzkT/4HWOIIltNZtKZSUYaDePSoUWMquWrGKDziVtczm1eWkEUCjDySPNBPFDE
	 XeBnOfBVsev+CxtiqILSMmfvxlZgPeRzGHpoQY110Y5oDcUXKRCH1cvFjDMS/fQd5Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456682;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=7C34PQ0HJhARwSUXYfmXSaUUCe+8YXTHLUmbzNmGoh4=;
	b=TgztFiZ+xws/F/k9xXrFgClW9PROmU5eIMPn9tiWeCGxoNYOI6rYKjmbhXjNBFE6OlOr
	 6JrfjKjUE4EpEkYKNjXI0aqe7XrtBoUmDonnkrm9juDy1c0dx76iQyHpDa68oZOfNjfAh
	 fGw8u9vxLF7/92+22NxCQi3zj8kW38MyaW5b1GEvNkOmVUytvO0Wmq7IEh31VhA+1TjqP
	 yXcJIz5HV9XC6bE8cFtNP+cyDXtNLvGSvL4Cgz3pYXO5RaA1AhU4Rxgnk1j+K/BjSvBbM
	 VPDc1D3S4mt7EU3z4WKfhC6jTg+GW9LzP7ykRcuyoA9KDrDH4/l2WHMa1gulVcjeiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=EPE30C0Y;
	arc=none smtp.remote-ip=202.108.3.21
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303FB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=EPE30C0Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792456680;
	bh=7C34PQ0HJhARwSUXYfmXSaUUCe+8YXTHLUmbzNmGoh4=;
	h=From:Subject:Date:Message-ID;
	b=EPE30C0YaQBSG48kfZHvf2ZQYZmhU58vUXrxIhx+BljDjwlPArRxcKQz+1SV7FDeT
	 bx1ePYwHIXqENyRNwDJar4YRQlBdb6dKcwZW1Uk317clTz+tBJd3UB8EQMn9UrXZvG
	 s9eDoCQWnHtIyilfPWoieBQ1DusX5pYGPRDI5Fiw=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.33) with ESMTP
	id 6AD6B7DD0000649A; Tue, 20 Oct 2026 08:37:51 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7228286685186
X-SMAIL-UIID: 07D6E2DA35A74F8A8ED4972E94AFB30A-20261020-083751-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+1f0fbc2561b3e5d51b91@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] possible deadlock in lock_system_sleep (2)
Date: Tue, 20 Oct 2026 08:37:48 +0800
Message-ID: <20261020003748.20847-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ad65cac.5a04d468.191e0a.001d.GAE@google.com>
References: <6ad65cac.5a04d468.191e0a.001d.GAE@google.com>
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

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 32c52ec87d62

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 5b9691f45f5f..bc2716677a6c 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -813,8 +813,8 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 #ifdef CONFIG_HIBERNATION
 	case LINUX_REBOOT_CMD_SW_SUSPEND:
-		ret = hibernate();
-		break;
+		mutex_unlock(&system_transition_mutex);
+		return hibernate();
 #endif
 
 	default:
