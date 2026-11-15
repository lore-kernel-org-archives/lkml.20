Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756382;
	b=1c6oiHVW++Yzlj5qQ6RYI5auORqF0cxuSqlDmxf+T8gkuakVL21rxTScXNhjCxkqDEmZ
	 MvE366zsRbb4Q6JeGZ1xtmRbQNoveS1tqdV3XjKuDUd27O4kYvdhu3XFtLABCfP3cS5FH
	 0a7cFDoq173rDEQcxBjAF5I384PFo2IesK55aPqyv+Qzr4njmUcgyuuijjwzgmOmQQHyA
	 49+Xb1IvIX6u3KwDO+6130mtK4Vbrkg4IcOl5uLCuUR6QajyZNjXXpMQ4qQa/+nj1SsWD
	 Hx2L0ao0+CL6B2PKzW/ylVpfNiutQjKIabpLCX1WgEr0e/ZnQvx/eN4zuSsd6xYMdaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
	b=ZmY+Rld3vS/nkkJS5v496JJYtP8uir6g54pJqCjJBbN4JcG5g8uMqq2qTTZ5Eey1IqCi
	 l43pUGrG4ZmRmJVQtc6kC+kwaexBIWel9FT7VSa3UHUydmRws0P11MDu8YXnIVtOq2dtk
	 DSiXSuZmlshYtgca15zC2lSjq3gHMFJrhjFFb/mks5eCUrnPoFZ3Ru4/t1lpvbMjTVtQ2
	 sLJo+K0wNA+pHlu9mMl25S0Mur8ITdoBUSXT9iYA8pjPmkLaBTk06TILt09KQH+yG16QX
	 gXT+5o7tWWzncnE+NDOqEBzA5vNkwnNDx6uGeqTRgIMYxVa+JdQR8X2TuLsr/X7+naA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="A5l5/rzc";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71739606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71739606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5l5/rzc
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so3878365eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794756381; x=1795361181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
        b=A5l5/rzcYj2Ou5Njd5vTMjnr4GQZJm94H+CRn/EhR1+yTyEQEmhePxkj/wzhco2kaj
         67tsAJf9sdvWhRhMmXzrf0HQ/Vz/FNJpdmMM1IL/+9hJSYMjTEwojuwP5VbLoGCIFeKm
         Ad97b/w4VnQLNlNCz0t38o5p/4th8s4oursZuk11hPIY8s9hY7v/IiIlR4FBgIdszc7y
         DQb9gP3eWPB6wh/irgiw0jCgYAaeTQFe7igAnhVVAuDh7xkO60EvRqktN4Qfm/1hL0Lh
         mPaRf/qvWxv+nLZF+54Ot+xkQOutXYwGgHG/x2XnMPhqudKFnihdwX/KID1ueUbWjNsQ
         zT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794756381; x=1795361181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDW7tcDT0CM8/ssvcSccTXT/PC8BfbsqfznWdH/SvDs=;
        b=mnJJCk5VvYofIxjLoVzOicPVq615/KS6OiTTW2tkye5ID0Hbp36CRb8dPZTqWAzLpv
         mrNkeJOy5Tkjvo+O5DU9RGsK/Wfmr++hjN1g5Vc0TCYr1dxOArY+CzDwVCQx0kqpBG3p
         MApre3hT/XtoNHY2DgCnazGXBL8aMpkmuHf9Pt67+o5ndsvmW95ZlWuLQhaZ8Gdxs3te
         mBM1aUd0nTp71NfKbik82GiBsSeKNRKx8lXgwYaQVquVuhltTHHmRxHvS6lwyBUsaYaK
         optV7G8Mnvm7O0f++te7e/fhr0hQmE3sUv70GT5Rp/mV+8LnYcqh4w3bZi6WiyJncGeU
         3vZw==
X-Forwarded-Encrypted: i=1; AL+hErGhArI5sayaeIEV2Vl9rRguqe2QxTjjlksEJLIoPKxbczjX32xBuNpYsIwrHRfLwUh/grLh0WxdPvb4dQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qiuEnsqPkrT1/1LAjJa5kKiy13gwmpUb7fZRluW6VKMcGZhud
	FwwBzieof1RPfwv9AK2ArvdAjvQhuxiID9CaSHErHVfutlHW9cjIBkYCrJTkIPuR9I8=
X-Gm-Gg: AYBFou3R9zg32Sjq0714JXBam1na85m/4IZ6VepEXwxiURl7XmQjgeMr893pL9wAQJz
	wMqpc1GcvQo4LI1DculOpGpR6en40X6MpeX9HVDUs6weYcnMPdSxPMY/FkQvjkswJCo103xMS2K
	/nxkdDbsa5bzJdlyrVDuEH9PFcpxPuabW3B638DoGQ5grWL9YsTbfL9keJpPe+FONZTwOV6TKzu
	Ki4wT5l6nwYsGTpHvGYA4/sVAw44FMOdr2iaUvOSUScAgySBFjUKEO51u6cmGa7WOJ5nGV8xbsx
	659p38L03+HgHGU2BZxDGtEZ8Jt9eOYWc7FVVXP5ON3JpRP4CHFyYmcoyHduB2xFxEGy6PX6YWC
	K3ooY6NmN2ZLxAtADx6jCoFvf4xAlXfAu9praiCz1ZhtiNt33WDnWIZ7s9cSfSiyhiuEi3FOzhJ
	744eadDfPl02Gb9vyzw/QS2FXlf3G9Q74RuA+ho7yH5SA2RFdCykOWVdAQJ4chbudHuxJF/Z84O
	haiZbG95eLMB0e3vIKzjrTXJw9uoX/c5KWj63Q9WtfAlbTMZajyTT7+4JBbU/Zz4OqtcP042ENI
	UtG/ycCafQovEcTIMdVOJ01m4gQ1tmxVkUP9vahUutO3tA/7amnbl9C6bY2/BKFNE4LwfrQRXXJ
	MmeM45YGtKl1Y0w==
X-Received: by 2002:a05:7301:1705:b0:36e:c9e5:33aa with SMTP id 5a478bee46e88-37965f9ea5bmr7519027eec.13.1794756381407;
        Sun, 15 Nov 2026 07:26:21 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27367007eec.28.2026.11.15.07.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 07:26:20 -0800 (PST)
Message-ID: <0af690bf-71ab-4c77-9738-7d94b2d26426@kernel.dk>
Date: Sun, 15 Nov 2026 08:26:20 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] WARNING in io_wq_put_and_exit (2)
To: Ming Lei <tom.leiming@gmail.com>,
 syzbot <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <6a1694a9.17ccd394.1fa6b8.0001.GAE@google.com>
 <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CACVXFVOMfnBahRrUEMU=3O6onJWAQiEfPdEzFhUrFQ48MRspxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 8:22 AM, Ming Lei wrote:
> On Wed, May 27, 2026 at 1:53?AM syzbot
> <syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    6a97c4d5262d Merge tag 'for-linus' of git://git.kernel.org..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=17a41ea6580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e327ee9a867dd6b9
>> dashboard link: https://syzkaller.appspot.com/bug?extid=b0d54b9e81de55179e47
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/5cc8b6debcbd/disk-6a97c4d5.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/649698f0231f/vmlinux-6a97c4d5.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/b297958f355b/bzImage-6a97c4d5.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+b0d54b9e81de55179e47@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> time_after(jiffies, warn_timeout)
>> WARNING: io_uring/io-wq.c:1370 at io_wq_exit_workers io_uring/io-wq.c:1370 [inline], CPU#1: syz.1.3756/22484
>> WARNING: io_uring/io-wq.c:1370 at io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399, CPU#1: syz.1.3756/22484
>> Modules linked in:
>> CPU: 1 UID: 0 PID: 22484 Comm: syz.1.3756 Tainted: G             L      syzkaller #0 PREEMPT(full)
>> Tainted: [L]=SOFTLOCKUP
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
>> RIP: 0010:io_wq_exit_workers io_uring/io-wq.c:1370 [inline]
>> RIP: 0010:io_wq_put_and_exit+0x36c/0x9d0 io_uring/io-wq.c:1399
>> Code: 00 00 0f 85 7d 05 00 00 48 8b 15 9f 3c 4c 09 4d 89 e7 31 ff 49 29 d7 4c 89 fe e8 cf f6 13 fd 4d 85 ff 79 aa e8 e5 fb 13 fd 90 <0f> 0b 90 eb 9f e8 da fb 13 fd 4c 8d 63 08 48 b8 00 00 00 00 00 fc
>> RSP: 0018:ffffc900077af8c0 EFLAGS: 00010293
>> RAX: 0000000000000000 RBX: ffff888033fdb000 RCX: ffffffff84f4b5f1
>> RDX: ffff888030d4ca00 RSI: ffffffff84f4b5fb RDI: ffff888030d4ca00
>> RBP: fffffbfff1c81e50 R08: 0000000000000007 R09: 0000000000000000
>> R10: ffffffffffffe7c3 R11: 0000000000000000 R12: 0000000100027def
>> R13: 0000000000001b58 R14: ffff888033fdb018 R15: ffffffffffffe7c3
>> FS:  00007ff97ac796c0(0000) GS:ffff88812446a000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f4b79c90b9b CR3: 0000000037235000 CR4: 00000000003526f0
>> Call Trace:
>>  <TASK>
>>  io_uring_clean_tctx+0x114/0x180 io_uring/tctx.c:248
>>  io_uring_cancel_generic+0x7b9/0x810 io_uring/cancel.c:657
>>  io_uring_files_cancel include/linux/io_uring.h:20 [inline]
>>  do_exit+0x344/0x2af0 kernel/exit.c:916
>>  do_group_exit+0xd5/0x2a0 kernel/exit.c:1119
>>  get_signal+0x20ff/0x2210 kernel/signal.c:3037
>>  arch_do_signal_or_restart+0x91/0x7e0 arch/x86/kernel/signal.c:337
>>  __exit_to_user_mode_loop kernel/entry/common.c:64 [inline]
>>  exit_to_user_mode_loop+0x8b/0x4f0 kernel/entry/common.c:98
>>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
>>  syscall_exit_to_user_mode include/linux/entry-common.h:318 [inline]
>>  do_syscall_64+0x706/0x860 arch/x86/entry/syscall_64.c:100
>>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>> RIP: 0033:0x7ff979d9ce59
>> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007ff97ac79028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
>> RAX: 0000000000018ff8 RBX: 00007ff97a015fa0 RCX: 00007ff979d9ce59
>> RDX: 0000000000018ff8 RSI: 0000200000009b80 RDI: 0000000000000003
>> RBP: 00007ff979e32d6f R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00007ff97a016038 R14: 00007ff97a015fa0 R15: 00007ffc1552e588
>>  </TASK>
> 
> It should be fixed by the following patch:
> 
> https://lore.kernel.org/linux-block/20260930042335.16199-1-zcgao@amazon.com/

Not the posted reproducer, that has nothing to do with ublk. But yes you
could certainly make one with ublk as well. In practice any of these
"exit is slow, use WARN_ON_ONCE()" will always be triggerable, as the
fuse case in the reproducer. That doesn't mean that the above isn't a
bug and should not be fixed in ublk, just that it is an instance of
something that can trigger the slow exit WARN_ON_ONCE().

-- 
Jens Axboe
