Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894043;
	b=e9zrGHUFvRsHtdxW9o5KPEA8bCVKx9JOkDPe+ZTYSqasndL3Oeo1XfQ4ymAXh8WujaS5
	 lGkpYcZmAHTAWxqMaI4Ffz6wrtSl11EPjUSoJ6PXXzIH9R9iFajQP7EKCqflYdKO/6mbj
	 nDtIKek2MWxZ+NbCJ2lRWijtz4QbbsT51AagETo9Xq4TgE78MVhzdTb6hY9AZHfbTneN5
	 3GEijL4lhuvLD/R7zl3mC6VHkZxo/TdXN9FSJy48Minl/wjmCyaBcY7G6IlNahibcg1ZX
	 iwMR4koxDb08DT5CvetG0ZTmhfcYsGn/Yxx6Ukhc8xFauXK80wJ2yfgu0gmY18rfZ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894043;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aZS2IuiD6Su4yjgOXkfRTpkMBHIP/jYAYxGEZqYZ9/M=;
	b=zrulJOKWDV5KxqDLuMSxENUWvJGEtX4QQ+aouxiGoB9c+L5i4SwbcLqQSqPNWN3Qrr5I
	 GxxTn6XAeWeZitrnRN+HVoHdi3gwT6Hokcqec+hQlvV1PMHv/nEj1N0fdc4rJNG8dX0en
	 XZ7QupFW9im7BYLPiw5dMGJrZ3VTTt4zV7H8rxoP/fIhOVustdKOaNMfzKT+yVwTcr2mG
	 2h6efnvxnEHMBReLwIzrEaXjJKxfU7ryR1gd18wcYn9OcMHKEI1NrG7AUgdBKqowd6Kju
	 8kiv/QPovLMq3wcF70ihndlztP+sbh/sq6zXAsTupx/U4+ZNUsOcKWOAwsn9r3rb+HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C9606A61F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 775C9606A61F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-49e379ab077so2199126fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894042; x=1794498842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aZS2IuiD6Su4yjgOXkfRTpkMBHIP/jYAYxGEZqYZ9/M=;
        b=KZlK8rLYjCt9zgbbK0n4tzmK+pxdfknxRYMJ+3BRdN2Go+xz+Ds4JQq0n5izTN5epX
         fSXAwmuRilclB38QIX012mr6D08aqOJobU6siMibX3MmJ2V2ShP+cx8qf2YfhlOAkhMr
         llbQUASvXmPiA37Kl9LEpCSV701psLVlTX6+zieNEBg3LdfLv6cWpb2xp/sYfkBa5jnL
         uh10efZLwQcNPtlSoPpVsspOMgLWfp3Wqmt5aB5sAd2lqJj/ugbATHPEs0qcZcSlBuHx
         xO3FFZpMkI9qTla3JmkR0YDkpY3KyqVp8Ujc0bYqNjTYMQ51mpVftDf4+RmPptXgr+HN
         fr0w==
X-Forwarded-Encrypted: i=1; AKwUvBxq0UKKNx/3DKXpwKekqNeJRbL8Td/XrFctnpdMgmGIa72M0ZWgxgRZpxclhjHgmTsTy2IQOPdqaFh+I1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nJKNQp72GjtFIiHqa1ECKlw8n+OCqgRYichYwnioSqTNWzw5h
	EA7VNHZXClIOPPAisuZkTlLbCX/uZXZ+BGzmrU/ybQX6MIV7cJgq24W5JBNgLAC4a7wRKkL11cf
	YcqItJ2t6r4UX7dQLNMLzeeGrzS47dDvYw8CONuv6p9Lb3jnm3k4Q4jr8m7M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a4:b0:539:701b:1bbe with SMTP id
 5614622812f47-5640de56edfmr14881078b6e.51.1793894042345; Thu, 05 Nov 2026
 07:54:02 -0800 (PST)
Date: Thu, 05 Nov 2026 07:54:02 -0800
In-Reply-To: <20261105122107.8220-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeca69a.429481cf.25ec1.003b.GAE@google.com>
Subject: Re: [syzbot] [rdma?] [f2fs?] memory leak in radix_tree_insert (3)
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/infiniband/core/uverbs_uapi.c:31:60: error: 'dummy' undeclared (first use in this function)


Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=441b6cc593d83cc4
dashboard link: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11a7ac4e580000

