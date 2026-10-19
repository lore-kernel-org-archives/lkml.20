Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E84AA024
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403034; cv=none; b=FmjtqiMq6aIIBJxxQYVCsv4wj54cH5Uds13XeEWHdmzIbhgbRloj3RWBCBwhv3TSl89VMzKxHOi1D6l5GvVj+A99Fl6463NfcrpF7y/nBJJZS7F2NLRIoCXhnPAMelvHime9rRjfMIiBxv0gZriH+zBxq+YnJjFAhCRvVirpnhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403034; c=relaxed/simple;
	bh=DRNQRv1aQeJ1OZRIfE/SZBxPfNo7xycwpHCTcuWpjfw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ki62xcMoEaQPhuQzbpf4SznrrP6DjKHtl/O6nenkWpdpL9ISHsb9aqQBzaT7d716YU8Agr2oR4zh1oevKyh1rdbKYGkQS8OueZ6HYUzk5o3xV6Jcs2v7M1lHMZkpnSvwEr8FgSemVk0E7MSGtoWAGCClbC/rhcG/GT52xLsJjaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-846cc4c0e44so1630062a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403032; x=1793007832;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRNQRv1aQeJ1OZRIfE/SZBxPfNo7xycwpHCTcuWpjfw=;
        b=TeudLMOCUqRa/jvGOiio1YzN5yLyU7SpskxdAuzO0uKfjEpbfS0eFuWw4PhUVQpxYe
         ToJjAuRN70Tw1AdTfzWXtswMTna1WtZmYo9644vt/6uumuytGylQjD87/vSFM4E6/NAu
         Go6NB9FPDuQr5HfB9FR4h9O65rtNS+ypYZze6qUedvl5YAkWYrVXBTcuvDIKxsx2OKvz
         S3Nc4lWeObVAM0cCBffPYv28AapGZRGmqBTx6UZjVt5Zm+ETv9ivXTO0yPnRa9e3diqc
         15zXTHAhy14rkbul/ZqYae3b3897NrlgSyzj0mlgk+z3cjMixJmkL9tBpXouW2GRwGm8
         4i0w==
X-Gm-Message-State: AFq9FYJ50kRefad04B/YJT7QAQyXp2EFbGqHKrkn9CoKkAeaQF2P7Ivh
	scCiYCGeDVsCOJ0nMTef9Bj6L6unatDf9+b09ai2M726IeGtiaDh8KzujZvCIjMeWFKHK9WADNJ
	FkvJ5yrVopAKk1ww3nQzM5n8Q37PHmeGs6neqICPBH4b3/QyT8kVctiQGyhs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1354:b0:6be:137b:3f96 with SMTP id
 006d021491bc7-701124af0ecmr6563667eaf.20.1792403032276; Mon, 19 Oct 2026
 02:43:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 02:43:52 -0700
In-Reply-To: <6ad59a56.6814cce4.34c49f.0150.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5e658.7f4e89eb.3d59aa.00c0.GAE@google.com>
Subject: Forwarded: fs/d_path: Prevent NULL pointer dereference in get_fs_root_rcu()
From: syzbot <syzbot+975ace299d6ba2eb1cea@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: fs/d_path: Prevent NULL pointer dereference in get_fs_root_rcu()
Author: neganhat@gmail.com

#syz test: upstream 7a19f0cc94ad
