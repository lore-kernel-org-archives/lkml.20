Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395D149DF1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746334; cv=none; b=G/h8jss9061IuHwq544s43Zn8ODMMorh32P7k8YeZP64JVY1ckO/XLNd+Ulrr+OBOZx65MpYq1myKwsYkKR2da2wk7TYTFRQpnHCeiSUra5sk40u+ZMksbZwAwnknH7QA8e5JmO5C1IyabIQWVmKO5zvHdhnTAuYyUnVE1PP62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746334; c=relaxed/simple;
	bh=Gu1QppwXLc6NruHRhVSU4Z/3BvG650dgmP5HmljMlNk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=flq7qXUJu1aWLh1uEUSRP1qdbL2dlM4b+SMMahXIYGptuDN3WzCslHh9KK9Qai0OGttI34Qlb+Q+YOcsW9WC52H4c/akSgMT2qWntwpQahvbLiZ5dh3wQQJ2qEX0B6/PV3s7IB4zKTA5Z0p74rVjoWv6PjbWR09roShrZVfQDhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12ae7394cso3867556eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746332; x=1789351132;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gu1QppwXLc6NruHRhVSU4Z/3BvG650dgmP5HmljMlNk=;
        b=T3QZl87f/H2t+vJpD16m5ByR6A5HTcCirY4IdDTcp3486dgSoVIw+3KkESt7UNwIno
         18pxl/JsUQN4I+D+gCA2lVEZzIo9uEepeHSOgRrJq0gAV0OdkDygE0Vr2ytlaKo+T4Cf
         HV3lM498FtHuC1+iAKI03QqL2o637LUYnIccTXYHyjlR8DxX/hASN93A/PtEh1JLB+C2
         sJ0kMBodRl4BtSzwhUJpKKuaiUinaVh0XsRXzDSdnYXWQpBi5TYvSnB6aA7e0RMIwGG/
         fO3+4WhQIKk9WWc/Kgq9ijgP1HNRZkv9JTYlp/GhyJznN01Qyu4GaFoVHjpEwZqYai83
         pRkQ==
X-Gm-Message-State: AFuF++mtiQb1QxwGiCpc5z7m/XAgzI2eQsuPGBFDg68ZVBmFL34Jp+ja
	PlMpVAvg/IfTz54BAazEn+ROrqU4NiqkOchRQxEgRgrgdOAfUlBi9kDAsOoPFTpvoyEhNojtW0/
	p7zgdMf0IKC661LqUiBizdprVsVgfef/1lIDvzqIYmWCnTGyXM0lkNgr8qgo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198b:b0:6b6:c3d2:702e with SMTP id
 006d021491bc7-6b6f9fc97bcmr12672960eaf.9.1788746331984; Sun, 06 Sep 2026
 18:58:51 -0700 (PDT)
Date: Sun, 06 Sep 2026 18:58:51 -0700
In-Reply-To: <6a82eac5.dbb3a75c.20434b.0055.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e1a5b.87c06881.102b7.0009.GAE@google.com>
Subject: Forwarded: [syzbot test] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [syzbot test] WARNING in usb_composite_setup_continue
Author: tkdkei@outlook.jp

Hello,

Please test whether this issue still reproduces on the current USB testing branch.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Thanks,
Keisuke Tsukuda
