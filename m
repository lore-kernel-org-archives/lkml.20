Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D044963B3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185489; cv=none; b=nsHcvqz+FOHQ9Nz8LDUgHaN60U7wV4s1NtY9S3iXdkuZ8hK05B+sokowQyVmqM/R8lDsvYIwgnukNQx37i5D7eX9PYMfmxvvBN9A7PXW9eVryZ/43/mfVzGID0d5YEbZjMJJoH4Ixu8dUrqGmMwXnzQ0jAsCl64Q/N+7XgiYZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185489; c=relaxed/simple;
	bh=fknTa8a8xDipkCYrePSsQTLagTPC4FM5VAA/rgPzynU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=CR1dwyfdUV+VhaMqcE4e/qmTY7q8i+CGJTsesghfSCeYvJwzSS7x06oV65TDpzTsOl4qTBOrhrlvlwFV3YkocFkcRxu8a3fn5w6iUG2pGG/GDl1lkXiniKivpwJclYp9F7EmX1HzDcexH1RhSmgCZjDxehNxgHsvJgOfEOoBo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso4231173b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185486; x=1788790286;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6QhX9JfzOe0jyuZyP+4YKY9K8LKwJP5t7uxyVlFjHVM=;
        b=osXp4zMQSEorCZfuvNOYISX85gOsgXWBhCgqXhNL/ooKpYRujt08Wsb15Jyq8xGFgX
         rdTb+OhjwPw2lgfEsjKo3/HbrSs4ULC27r8kp10PDKdZsVlv6jOsJALCMmrUjXr2NDdX
         udYWLgfJd5ziS8Fc720M7or4WnAROjRdDJZ2i6m/fcm4VI90H7oSlnby3eoPo32by//V
         n1y8hlF/1wIJBnt2QNy4ltOsDpYgq7EAC8Rks5cNvg9YCXXdDdnYpBLwogLpoZag3Me6
         tyK+7qJLlM3CrsTtgXXqnsTItULqgjFywSYLmGHPf54DUmuIIL0Ig0WIOqe5E9AOXZ9Q
         fxEQ==
X-Gm-Message-State: AFuF++k2syKdx6ZZC/PRizMgG1uCAJjMA1J9aE8PK9WxxFyMiOzEEt90
	6ctBm43qVbq79ktEE2wby5yhG8HQp9IVEjaFzYgXcOHwoSpckhPDrKHuDYAYo8uJPiiwiqnLlwk
	3KozK3CM0xjkyblO1Xuy4SkMwAzn5ACr8sFvHbJjw7CklYlvg0mKLFRirJq4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2388:b0:496:10e6:f76e with SMTP id
 5614622812f47-4b397f6845fmr26531713b6e.4.1788185486737; Mon, 31 Aug 2026
 07:11:26 -0700 (PDT)
Date: Mon, 31 Aug 2026 07:11:26 -0700
In-Reply-To: <000000000000c98e7d06153a5177@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a958b8e.4d659fcc.734b4.0052.GAE@google.com>
Subject: Forwarded: 
From: syzbot <syzbot+76f802bc1dee8ba28a6e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: nogikh@google.com

#syz invalid
