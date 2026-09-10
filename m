Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A1F484254
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043042; cv=none; b=a5T1ebZf7U99jNLwHrzFqGtheXoV4vkaZNyNKrI8QbhHkBmxyr+T5z4F5wE1iTqURJO+7VO3uBEiahk6S0TZd3yfemmuZI/dFT2m7e3okRBAKjpMh+VbYFCy1d6taIVZHL6wvIblbZn6Ki1WkfaMoIzs8CAIfPphAw2D+L32yIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043042; c=relaxed/simple;
	bh=NNo83Ggf6DxezfmU0KBxwNGVKFTlk2a3mMPdpdPvzuQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QDOkFsUw8/F9zYku5c1byHQ4dNkL2qylPdnVfCSzcZyaRj+SZdX2u+uK9qoFHgshBQXCl59a1jJHoHxYiK1/DWkfn2lR7dGWMIcOuunmXejz4D6fmlI382sddNYifXPZOgwWEi/Gnz8eqatCYyLbBMz2818kfyIydtLIKCO7ONw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4959c49e054so4935576b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043040; x=1789647840;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNo83Ggf6DxezfmU0KBxwNGVKFTlk2a3mMPdpdPvzuQ=;
        b=mZZksMeNx3MIOR7R1PGie64cEDEwBnasmqCnvESK1zoT7fNzrXaQ4w8oS+KCNz33IN
         bg2jyZ+d4KhenN7UTlIZpXNNnOXVTRZ7lGyuas7nPWMEG8wV5OPnaVlpGdmEUmoNIbrS
         nJUze1SihEHRDo9r4VXoVE2F4AXc8XnHoiOwnTxL5m5PJWR7g9rwa6kNzFFbwOQKCJmh
         pQCsOjII+6fcKJlb2evulEWfNuimLmy6leHTJuAAwq4hTmuftqQYMINIM044IWbGiMb/
         6c/6FsiwXFfn7EI+QnFJXjwtfPANd+RqO5nBVIDiNVuW/Cy2tnRTiWulH5ItjfbTXz+o
         y9dg==
X-Gm-Message-State: AFuF++lwRki+B7qP8X+Qm68FM1T0nnhgQd/mcivFGi5AM/Jqrhb66m3G
	g5PF55bSurQpgu2P5w3y3s41j5K2uffvH8MJwMQOv/jWdOiPQDD0VKEblL7G/zwLTQuo9HmelbA
	H+B7jImX4ATOdpqJOSnbnUHCQH6wuee0V7JmRqX6/pxz2l7BDZtGdBtzzbSk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f48:b0:4c1:2512:ee84 with SMTP id
 5614622812f47-4c1251405d1mr5525757b6e.23.1789043040142; Thu, 10 Sep 2026
 05:24:00 -0700 (PDT)
Date: Thu, 10 Sep 2026 05:24:00 -0700
In-Reply-To: <6a6a9894.7eebbf3c.214d51.000c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa2a160.f2639fcc.29487d.0017.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: alsowereme@outlook.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a7c1290eef60711c10289c056ad32ed1f2b47b12

