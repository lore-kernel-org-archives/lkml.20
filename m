Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7C4457D8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385014; cv=none; b=RfkL7mISvO8r/qZ9IGkbbHJYWhFz/mak7pAHV2nsfI9PaMjNbf1y9Hz9uQ1QXJYx0524FhcS8MTA7SzZ3IVax2bRs+gjLA3lcpgwA7TN8Vuj9uFODovjqKlYYxykubMNwk18Z/Y+kW8mm+QMUl/LRmyyi53UeBjoOZL1ay2vT4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385014; c=relaxed/simple;
	bh=ZLUCe89ZegXYDSxUymVD6QYZXTJ6NvPNWLI1s5WrL1E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LClBl0AjnrDtHTDvS8sqlfXgvDqSX4bSMT9iV2GhMQhMfstDlVmNQAPxnLChXHFitG+a/LRek/MB5VGRMJSCcEozcRVg80nwKAyDxtlaxT53RQVvaX7IBlZOvikJLJPNThlnPkCY6XZ6pDsoBfttPCkY9ZzFgNLR/ePh3CDmmk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-80665223e05so1698158a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385011; x=1789989811;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fTdRNfnItyr8QYnb+P+MDz3eiQ8DJfmBEugDWBd1pYQ=;
        b=juuu3e9UeWPhwXxuWyUn1PvPf6f00TTi/qiLy2/XsgaSIIYgw8y355PcNVdIfa5DlP
         8SXo/dk0pOGiWcroXhsGFcAxDwgHgphMp7/PJaZToBdFMt7aCZXyMafEjcPXDrXBBjeA
         XL1TQIEfV2rMcLi85Zh2e9RaBYv1WKh3IiNrb/U9fVQTBIOFtrLs+uLC0ptTeYesxP9Y
         tArf8aJ2w+FEaEmlMFYZ2tJDf4S2kXH1asIA8pbr7WngMXZo7b6k4qzSgjt64/MyuQy6
         raYhVb7kPYYPjIWn3oDs4XodTqmZ+gwcBEN/VYsuR6TGHPot38iyhPyZfvszU+XLncED
         E7Jw==
X-Gm-Message-State: AFuF++nUvA6ImlKHfz/FgWjpN83syTPNNoILxiYbN5ld+YYWvtaBkw+N
	Px2Sl8X1kdPWhefU5OD2b6SaON01GXQqbFzt+I2bOujVU5tuVk9HOMppOTT2S1Q42q70/DhxH6A
	6+j/VUFz+tasOOAl+3y8735HtXbJqfTLivq3dj/UrBB/O24EJ09t8cPirCpc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee0c:0:b0:6b1:9b72:213c with SMTP id
 006d021491bc7-6c3cc7045f9mr2073416eaf.3.1789385011180; Mon, 14 Sep 2026
 04:23:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:23:31 -0700
In-Reply-To: <6aa52208.f81106d8.2ab401.002a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7d933.3aa11909.1a03b8.0082.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in ieee80211_register_hw (8)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 6f157f39d1812ac5efd113a29bff3799dcb3150c

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
