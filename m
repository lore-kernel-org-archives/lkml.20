Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082640;
	b=zPDd5iKKZT58KPyz3zrAyb8Hiriua7dIhnySNTGu/G1CMf8i5tneLaooo3TAW+uY+uJy
	 0EDkb1dSkpiu1Bf2cDeXqTXdz4HYMivi6QFCcxyY9/XRpLFjrF/A6qeb+I5clrNmr+t7A
	 X2CUovuNCCwHswOjJlGmhX1qy6BzJLSeNtnKLSWXpvB5+Rhzzv3feVW4c4q3oXdTKx5TZ
	 U5Laxf25PC1aXlwQJzkTWJUohdRJ2QakncSu65t+vws7J8XFRz+ta41NnkSbsn3GR1y3d
	 MuOzJEEEJw8bqvzulj8Ld1I/Xl6VE24Z8sjmURnaYYXFxwSdDSFmsFZm4G6yf5Uhl3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082640;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=+WVZITERpseEXuowlMAn428SGHSH6F/I+jxSn1rzuHw=;
	b=VUnVmM6yxpp7Esq6VckMHJ+X+Jgu4TLuhYhlapZPqv3vIXNMv3aeU3GxEUEGURb1EQc7
	 GcTXKM5fdUx0HHUa2IOHLZL7m0HbsNrxU7GLQzLOfWlzMmV0MgymTqTa59iOBQFCP7Kig
	 BKV7zye06IYo++ZU5CEg19rpXK9LYLA7DOmpmJa37GLgoD1cDjEgGYmDcwIO0AaI2kyMS
	 i4GoaUlfwnsJkJhJdhNNkpnD0bW6C89T1JskUVuMQCXXwsJQPT76AaHR9Rnc9T1ZQbKjC
	 RKHpj55j7IBrGyR0GRL/WerzsOaVLcBmkiHG6YwK8xYrWn6nBOL6whxtakX5F/eesmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4519ef1babeso3851958fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082639; x=1793687439;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+WVZITERpseEXuowlMAn428SGHSH6F/I+jxSn1rzuHw=;
        b=y28N2fTJ6u5bnBgfhzS1x51SQlbX24vyNl3kyPRIdGLizCD9ZrAFUXxLuIMRw5YjXx
         XrPOJo4VWZ9u0uH0HIDV1tYKH7gvnpheaRtMuVzIhvF7MkoO+c//yeCGW2D74uQ86GNV
         RTGLb6WDqGUilySQL2AKhyWstcZWUbTIl61oNmTb2HQQIAS17FwOODQl8ybSaBGEw6G5
         qa3qvCnG522F1xDJJvixTHZiDBAdAYgtcgkRohD7BiAM+Fi2PGKyx7OxvvMO5SlySGtq
         aknm3s3eeN+w3Qkl4mWvuIkLPKvz9eKVuenmQDzoQb1wBA6ggBK8NSSOOuL3n++ree2z
         JvNw==
X-Gm-Message-State: AFq9FYJcC5Wjx6G/lHLMqUDxugmOWe1RI1AF7nzm9pbd1oQD29YbDFV5
	rnuxWdHo4HIxTBTBDwZndWZiVoDXpUbG5xaJLNdYAtBUI11Lwe1xyOYnjXCbRqBkk+QUpsrNG3N
	ekl99pVGLlYuMbU+fGo/qfscJjjisctymrULLLk7QYK5eF66dnGVOSNQ+VQ8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6870:af91:b0:48f:e0f6:c464 with SMTP id
 586e51a60fabf-4a83f561c89mr4784161fac.50.1793082638798; Mon, 26 Oct 2026
 23:30:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 23:30:38 -0700
In-Reply-To: <6ad845ce.46bc089a.3217e3.003a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0450e.6200f071.51519.0f39.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 d135ab453a7400a34930bdda1ef4bdc8acfac80e
From: syzbot <syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d135ab453a7400a34930bdda1ef4bdc8acfac80e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d135ab453a7400a34930bdda1ef4bdc8acfac80e
