Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038E3C09E7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473737; cv=none; b=dSK8DxVBMBY7h18O7rT+ZWOhA0cW0v5k7HTSXzJxnlmEyTYcpP3vt1ZgfjmSPxWwqAKhRf+R8SJA3KICUe0XxYag8lTB9kFvf2JQ3XP03Bt0gaud8twkFXO1YQ68V/mirjQddsUnLTbVkOyxw+71uUWeJy0mkB9D1QlZxVj9jqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473737; c=relaxed/simple;
	bh=MqXGfM5EFlsSilckidTQLQidzqKnF0kYHxRmO1OWlcU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L1qYH8HixR8jz8hVXYNl20FwDx1NsGJtILfSKvyVj9E36ev9LlAPb/q0rBr6Fepe6isvXsCuFI7ydC2YKloVVo4L3bQwNHcS682qSlRhoT4TubAGgNQQFgILQsjrubWIWQPp8XGVtyMQN+GRRstRjkn9c29MoomoQ/KI0r78Uew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b36cf0d9d3so4821080eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473735; x=1790078535;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u/b/mHWL6wY9GjQVioju1YENpaoNWrzzQ37KDXMFWP8=;
        b=N7sanxmjj4W6hJra6jQLPZ31oBEh5sglFJ6G4NYHKAiYXNsltiaZm9jvSySRPSEmIk
         R6QekEgJCgbvpD/L1iPPkJt2wjADBsY0bmHZjW594S8HtLvB1Ul5SO8u1DmSHI6SBGCv
         SSvd5w9NAApdFrZfL2aMoN5ZqtYJJ84ho/bhWPbFhs6pmlMidkOTlp1EFkLmVbEL5Jey
         Gk8zs7Og7a8kIIS/3gK3t+B861y6fTT2ARjOfy0ihmTlNm366RXs/fSoNtgqbgILgjYE
         LNHDLdS7tqAI8Mhpoop1rCBs4xns6Mta7R4TwTYUKEqU98paH7LwgxFvmMtWtMVTXvMi
         oYxA==
X-Forwarded-Encrypted: i=1; AKwUvBxTsa7LPDwzKKWWo+rImq9uogwSoMbEJpTBpffGVI0BNPpzz/taz8V/USRCnW39rAc4WJTqozZl8Q4p0kY=@vger.kernel.org
X-Gm-Message-State: AFuF++kjBEHSmno35KqhU5BvhLHnadRN4CZ79M3HpdN21hLXaJ8ozeyG
	uK2Uv2w7tHW91RHKbSrksVtH+RIfoyURphn1wUCC/6fI5yDe2oJdDq1O2J50SBlIeotWr8rzUdj
	oA30AqezFsin66q/xNeBR9qw9ojbk7hpIyhN5qQjN5rd2B4B1QeVwbZrzlbA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8c6:b0:6ba:2927:3661 with SMTP id
 006d021491bc7-6c540f6301emr7069248eaf.18.1789473722845; Tue, 15 Sep 2026
 05:02:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 05:02:02 -0700
In-Reply-To: <20260915092449.915064-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa933ba.f81106d8.2ab401.0063.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in atkbd_event_work
From: syzbot <syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com
Tested-by: syzbot+f8a0f50ead274d8516d3@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=165d9901580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=f8a0f50ead274d8516d3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=154d48c9580000

Note: testing is done by a robot and is best-effort only.
