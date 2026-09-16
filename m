Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A32446C01
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549129; cv=none; b=bvWy65CJPx8U3E5HQvwS8xmlEcd6Kc4IHJCpV+/T7KhHWRbGHkpa/JqAZBA0QCnqJVeAqykIeqEd2UXVsyIgDwou1mc6cdM9amV1E362fymQj0pE0RT95VeN1Fy+atGFY5yohp4ue6e1BqXKydmVAtEToerw7HhYF9DJY92V2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549129; c=relaxed/simple;
	bh=SWwmwhF/lK4mo6tWeHvhs/9NiTbhXGi4xKIfITy1hB8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=idvNgTDVlyQeLO79J5VRx4sKa7UMmk7uEis3ByNhs8A7/eq7Aymq/I+Kfydk53CIXI5U+coc/Jx50uxTf3M3rGerw8I+zQlUskyVybZ6JfOPRB1gIy/lUBJlZwpGVJGOoVgVWaiuUn8TjQ+Mql5p7hiNDpsXGBD/2ecx0RYkR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7pF3zUC; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7pF3zUC"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so627859e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549114; x=1790153914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=27wF7sOQsQpdHjhuENpiyoOL73aDFHmGdfUlXCBklxY=;
        b=e7pF3zUCXshEKteKLt2eWVUuZJVoL4RvAiX8KoIBhctkGhbp4MYOIMKQ/Dq9JnggrT
         N+2LwljIh91qVJX/Qin/pRNuOQbE3SGt75kBnstv7Qoho6vhGYG+NmcBdBd1pVvISBjV
         i0aidjFiScpO6BmrKN+7Krbd5JVJg7uWxNqZxgR59VmPjqq56yB/BqUrQk1BPPhCU9Pe
         kXi+GN2s2TF9QUqIbKz/0l0oo8LSJiqSjHBzj6iu08++fsJ3tAkj/7R9f9z9JHxmXBbm
         7WPGb2808GBj4M+Q8iDfsvmH+e46GXdGUO4FflaK7YACQI4yqzR6LfrWroyFZOCNTU+F
         W5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549114; x=1790153914;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27wF7sOQsQpdHjhuENpiyoOL73aDFHmGdfUlXCBklxY=;
        b=Teg06hzVu0okHZGQX/2MUF9hUimjT3CIkxKZQ6sH0tdEhjT1v7oLOCewK7U5cJGLop
         v8m3UImb67CiMP+ak9s1bYHuIHyk085lnRLyooYRMm/ffE4kU+9XvYPZcOBWGXXKkpar
         o4l78SikvSZv5IfO5ndeUuQjXFJq2+7sobUfgqtWcsVlbyJcbmYiexstz+Hj700I0yCm
         IZsk4uHL11/lrA2Q2tmwOAUXpewFtgDPnGklNow2cfna6xRzNhhLj37PwbGkq4Bjz2NZ
         PATZcaEgixAM3xO7c2Cbb3nWJqoUMS/eDiQ7ICGRH+1sJVM0lBT7aBh9ehduPDUzVqNW
         tTNw==
X-Forwarded-Encrypted: i=1; AKwUvByPx4AvBMTjaFjzQy76K7EBZrx1IwCrVpDJzHijxlEps8lTwbd16CpxU5+haGu8qF0+e0Gco+O7gGXf9EE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhytz6NB0uSQpBFNrUfWLzka7iRyqjQ2AsfY+RwEztCXL2cse7
	syFaajo6qrpN859a6Sm0qfrRH6N8ZxWqs5wiwX+shEvifi/F//2w60sU
X-Gm-Gg: AYBFou0RGNnhOyhT4Y1D9YgobkkYNYXcwiQXX9kU2/sR7z/1xUoMCLXwp7NB1KQH/qv
	jnYfeN5W1sT6itQCSaDC0ptsh8hyjRytAq6t1lwgx7gjWlQXr5A+/FJkHm6L+6tWVpeQP+78DJP
	Bp1pdmCa+e8iq/v1ft6gLL5oUGrk6BxEdWRYfJtjSz40yK6L1OtUh2105PyPNOgTBC80Hh5tEHB
	tFkcoqAV4hULzaCBGsFTrahiRfcEDGrdn94e2gntHit8dJL9nSSOSPRDhO1dwPNcgX6Dka/Fwup
	tMBkXC5JAXm9b+YToQu0eyxriNEfSk3jbtROjTrF/qZLRwnQJ+7q2/drQ04LjnbrVfU1O6LR8CK
	yFMp/dV/BM2rbSJqvVeJQhAF1F1qzWccrcY3fnilYjn8k5lJ0Xc7m6wUc8j1/472ta6LLd9bvS5
	2mK1svCYcQyeP0HGMcsyRUDWKCC581hmRFUcJS4kSzaHp7pa4yEQfJnL2UtfQs8U8ND3p5gtmLQ
	OtXMSVNInv1P8uOpPeHRUp9UNQlKXkZ
X-Received: by 2002:a05:6512:3a87:b0:5b7:a150:8795 with SMTP id 2adb3069b0e04-5b8b663ddc9mr521527e87.36.1789549113541;
        Wed, 16 Sep 2026 01:58:33 -0700 (PDT)
Received: from [10.128.170.180] ([77.234.210.12])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57e229csm661272e87.66.2026.09.16.01.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:58:32 -0700 (PDT)
Message-ID: <66b5fc3d-620d-4582-9b30-50c85984f612@gmail.com>
Date: Wed, 16 Sep 2026 11:58:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tytso@mit.edu
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
From: Vyacheslav Kovalevsky <slava.kovalevskiy.2014@gmail.com>
Subject: [BUG] ext4: generic/764 failed when using fast_commit option (error
 loading journal)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello, when testing ext4 with fast_commit enabled (Ubuntu 24.04, Linux 
6.8) I encountered this test failure:

```log
generic/764        [failed, exit status 1]- output mismatch (see 
/root/xfstests-dev/results//generic/764.out.bad)
     --- tests/generic/764.out   2026-09-16 08:04:58.023597440 +0000
     +++ /root/xfstests-dev/results//generic/764.out.bad 2026-09-16 
08:36:05.821198201 +0000
     @@ -1,2 +1,5 @@
      QA output created by 764
     -Silence is golden
     +mount: /mnt/scratch: mount(2) system call failed: Structure needs 
cleaning.
     +       dmesg(1) may have more information after failed mount 
system call.
     +mount -o acl,user_xattr /dev/mapper/flakey-test.764 /mnt/scratch 
failed
     +(see /root/xfstests-dev/results//generic/764.full for details)
     ...
     (Run 'diff -u /root/xfstests-dev/tests/generic/764.out 
/root/xfstests-dev/results//generic/764.out.bad'  to see the entire diff)
check: possible mount failures (see 
/root/xfstests-dev/results//generic/764.mountfail)
```

764.out.bad:

```log
root@ubuntu:~/xfstests-dev# cat ./results/generic/764.out.bad
QA output created by 764
mount: /mnt/scratch: mount(2) system call failed: Structure needs cleaning.
        dmesg(1) may have more information after failed mount system call.
mount -o acl,user_xattr /dev/mapper/flakey-test.764 /mnt/scratch failed
(see /root/xfstests-dev/results//generic/764.full for details)
```

764.mountfail:

```log
[ 1224.887075] run fstests generic/764 at 2026-09-16 08:36:05
[ 1225.042597] EXT4-fs (dm-0): mounted filesystem 
7cfe268c-25e3-4c01-90c7-c933198fe125 r/w with ordered data mode. Quota 
mode: none.
[ 1225.062913] EXT4-fs (dm-0): unmounting filesystem 
7cfe268c-25e3-4c01-90c7-c933198fe125.
[ 1225.078714] JBD2: journal recovery failed
[ 1225.078717] EXT4-fs (dm-0): error loading journal
```

Config info:

```log
FSTYP         -- ext4
PLATFORM      -- Linux/x86_64 ubuntu 6.8.0-139-generic #139-Ubuntu SMP 
PREEMPT_DYNAMIC Sat Aug  1 03:52:05 UTC 2026
MKFS_OPTIONS  -- -F -O fast_commit /dev/loop1
MOUNT_OPTIONS -- -o acl,user_xattr /dev/loop1 /mnt/scratch
```

OS information:

```json
{
         "Hostname" : "ubuntu",
         "StaticHostname" : "ubuntu",
         "PrettyHostname" : null,
         "DefaultHostname" : "localhost",
         "HostnameSource" : "static",
         "IconName" : "computer-vm",
         "Chassis" : "vm",
         "Deployment" : null,
         "Location" : null,
         "KernelName" : "Linux",
         "KernelRelease" : "6.8.0-139-generic",
         "KernelVersion" : "#139-Ubuntu SMP PREEMPT_DYNAMIC Sat Aug  1 
03:52:05 UTC 2026",
         "OperatingSystemPrettyName" : "Ubuntu 24.04.5 LTS",
         "OperatingSystemCPEName" : null,
         "OperatingSystemHomeURL" : "https://www.ubuntu.com/",
         "HardwareVendor" : "QEMU",
         "HardwareModel" : "Standard PC _Q35 + ICH9, 2009_",
         "HardwareSerial" : null,
         "FirmwareVersion" : "Arch Linux 1.17.0-2-2",
         "FirmwareVendor" : "SeaBIOS",
         "FirmwareDate" : 1396310400000000,
         "MachineID" : "91b0356bbe954341a29ab510f38d09be",
         "BootID" : "c5a11924033a42469f837e676984f813",
         "ProductUUID" : null
}
```

Also tested on Linux 7.2 (upstream) & 6.17.0-29-generic (Ubuntu 25.10).

I reported this issue previously here (did not know about the existing 
test failing):
<https://lore.kernel.org/linux-ext4/CAAJYhwzHRMipEy=mrH_FwELcSCCk9zK7ifzy0cuuWMzX3wmVtg@mail.gmail.com/>.

