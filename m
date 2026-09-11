Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112F23E7635
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150444; cv=none; b=Zql8qXcFOtNTNDXINGDscuy2UZUUJX0OscsXNLj9qf8YIhi5P+kGSxUwJyv+R7m0jEWR2YbdkNxa8r03sHv8prIzrf7TsygRD/UaZE0qpYchX7tp55uE8ToKmj/puDIrNrmnJWpK+XQMErtr6P5ACrbNfgnw+4G1vIsZIq7CEwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150444; c=relaxed/simple;
	bh=Yfg2juP1184JKO29G87l8Y7ne38kjTz0flE1V8LpoGg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ukZOC/t6rJDcVlXXHjgLx8wiCs+9OFPKqobmyxOK18CQ8GRPxkSnVUiG9+QitMT1HCOU1CEMLyo5ijEUkJMtg5exyCugEbSrCc9ofRLnw0T+kMzuHddHZLrWSo8ssLs4yUExcdf/VUQqyl707YPa3u1+Nah/WEgms3p6mVr0oik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4dd46ddeso973987b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150442; x=1789755242;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JSjM91GH08wn6prgIRPH6mHdt8AOOF1Y9SfqXTBzxyA=;
        b=kcHFDxWIFx6wYCh74vTnHefaZFlWFjHqjIjSZeb3otzWCc74s3iPsBQp4EDs0NG6C0
         KcPifi86zDoXQJCCOdJGLAZpZWEP4P6xD1x3iMjvAeX/etduSLUbKBWLfHN/wQx04DZ1
         jMhXl6Acn0Sm7ebmFQony2v/RNLhW9O0hFVR8kTFJjca8Ej/j10WoDahQZQhQ570Mwho
         jf6O9vbzu/GJsE4g4oqXlHPbV0Wbz+sRleEzwoLtQKwMDFgpnRRWZNaiC1ksdNvwpIzd
         ZCsinYzxd7YHY1jK0BQYxRIxibEOA+eXBmPZKZX2ve+qZber/+46zgO3QzLO64ewkpBn
         kcjA==
X-Forwarded-Encrypted: i=1; AKwUvByjxkwgyNJC8d8+3kjlTvmwi/ff9/HsJbTwciLQPUd9GXTB4jefbR+90bPj+bX2feSaCkWxv8pRKBloa2g=@vger.kernel.org
X-Gm-Message-State: AFuF++lAxerD6eOhdWbpzdMBLYzbN6CHdvjsB+QKwlXtIuqOIPO1wlws
	4ohPEqVJuSo2E4XjT4PhHqsw2BaYcDWejTn6a6yXcaEfrtxGm/EpTDtTR7yCs7xoBBkUIvbwxnj
	/Rld2YrzbqaBCEmWf96+TNZwt/I24xZnCwYMpPElo7ESKaXnh8OXPbuHWbuc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1620:b0:6b1:464d:4d1d with SMTP id
 006d021491bc7-6c0b9274492mr3995719eaf.11.1789150441967; Fri, 11 Sep 2026
 11:14:01 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:14:01 -0700
In-Reply-To: <fcabab93-13bf-47da-91ac-5e7fcaec6362@acm.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa444e9.f2639fcc.29487d.0033.GAE@google.com>
Subject: Re: [syzbot] [scsi?] INFO: task hung in scsi_scan_host_selected
From: syzbot <syzbot+1f678bd2872aefb11d8a@syzkaller.appspotmail.com>
To: bvanassche@acm.org, james.bottomley@hansenpartnership.com, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, mkp@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1f678bd2872aefb11d8a@syzkaller.appspotmail.com
Tested-by: syzbot+1f678bd2872aefb11d8a@syzkaller.appspotmail.com

Tested on:

commit:         74786683 scsi: core: Make SCSI host scan interruptible
git tree:       https://github.com/bvanassche/linux/ scsi-scan-syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=1242a1f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=1f678bd2872aefb11d8a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
