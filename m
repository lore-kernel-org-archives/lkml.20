Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B40440635
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451931; cv=none; b=lq4OGgvrrnlu89YKuz0+oyPQxx96CaOyEKYPGayNU5SxVdMnztABadI0z0ZXCcemOF3KbqXQzdkongXRRBkcTvgdQXEMcDJssZgJIVKYYaN/BeXdw3c1ZRn9/oxn6VXvjpddR1S6cdPtg/ot9CddD/qkmcNPyt57NRpBR3B2lV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451931; c=relaxed/simple;
	bh=ROuURdH7TjweY3TAsDNv65ARFF9in6kaBxGabrLWIvc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WkBceu9kRxmxy3nGSkPioaQEWYVkGttaFPdTkXYtcINMgnqxY4PhdeXd8ADuYhiUW9dWv0E86yNYJJjByRe+4JHQPDHqcVeZDbZ2kZU1GQmR4gkjRtYCtjj9j3mQkgGaxRGmnXEga9aQsx38mbi4Y4VubK+wkPxu09PGLNpPZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4566537e644so6197479fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451923; x=1790056723;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gRcrjLrFQd/AndtB/yzy106HJb1gSHuS63dk/WKovdw=;
        b=SWDdK7MZs17lJ23uOWjD8HcX85NKI4WSRCr9HT5NC4kTjJjeTZeAQ414Lwvcs9fto+
         TmHRAFgErurZeRiTzaRzek3WlUZfAokctZGh5XWSHIcyqPPjq40x9lFi4CgFMo2Pk4PU
         2/T58FP8UQU8SJBjRUkh7/Uc4WzNCSZkHoeGWv73BOw966gk4Fk0zMK9G/GMtSJfvDeH
         r25pnkPkZPBUL0ejpW+T2bq2wAiHEKtRg951FpmyxeXgGqKHo5Da2Wywo2dt6xSSp/X4
         zvjbvaZK4pgoM3VxDRs72REeeWD2Tdpn1ifbwDCNfoS4d4V3xmrbwkIYa4+TqiRRnVUK
         04Ng==
X-Gm-Message-State: AFuF++kKuW+6SdYphNhAaL+a0Ivr5tXJqW8KGmuaZVaT4oDYBUuSPLEL
	zlGZp6eTqkZTcmU5X2VRK2pfmWctl4mQo+SooX6h0kTMyw2aQqUj5ozFfY/YPxq7RGqWwayrGm6
	uqJevSsVxVQKDxU0GgR3JABqy3sj9SMBHT5KMuzroM7hVnHPOhIkfuOi2dJo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de7:b0:6b1:51fa:2150 with SMTP id
 006d021491bc7-6c540772e8amr3357465eaf.23.1789451922942; Mon, 14 Sep 2026
 22:58:42 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:58:42 -0700
In-Reply-To: <6aa52208.f81106d8.2ab401.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8de92.a211d2ce.1a5198.02a6.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in ieee80211_register_hw (8)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git 6f157f39d1812ac5efd113a29bff3799dcb3150c

Reported-by: syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 02b6d81cc..de3bfeaa3 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -7156,6 +7156,15 @@ static struct genl_family hwsim_genl_family __ro_after_init = {
 	.resv_start_op = HWSIM_CMD_REPORT_PMSR + 1, // match with __HWSIM_CMD_MAX
 	.mcgrps = hwsim_mcgrps,
 	.n_mcgrps = ARRAY_SIZE(hwsim_mcgrps),
+	/*
+	 * HWSIM_CMD_NEW_RADIO goes through ieee80211_register_hw(), which
+	 * acquires the RTNL mutex.  Without parallel_ops the generic netlink
+	 * core serializes all of these handlers with genl_mutex, so a task
+	 * would hold genl_mutex while waiting for RTNL and can deadlock with
+	 * code that holds RTNL and needs genl_mutex.  The radio list is
+	 * protected by hwsim_radio_lock, so the handlers can run in parallel.
+	 */
+	.parallel_ops = true,
 };
 
 static void remove_user_radios(u32 portid, int netgroup)
