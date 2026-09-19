Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4FB3BBFB2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808286; cv=none; b=ObP9tuA5wRXseqFaJf7zzqehYGZsY3o0fSp7T9qwUe1xc4di3DIMRm/XDkvUNJa+aXJKv9BPp8OLVtolEGJL9gMdFwSzsPzVwvuYugn4YbI80KOoDITtntVwJ3uT1Gl6uvKyPi/8f/sGnhZ3b2kLiiu2bGuDywv6zjKhAqHZa5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808286; c=relaxed/simple;
	bh=k0Dojk6UU3bd6LMI0IoPWXSjmkhu1Y9J9pwN9sLNN6s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EKOMUwBWXusqzBvOx3a9rnwG8Hvw1SDDdR+rQPo127//5ivPe065BY7i4YpLVpcyfeZrv4YV/iuPKPiBULrQMycRMPsO3nvTP8hUx3nSL0P8KKHQ465GNmkD1u0u2QFQb/c0hRsdt/G2hRMwZ4g+hdDHHHWgfSrP6cJyyd9LDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e99ff505c2so2355567a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808282; x=1790413082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cp/HrC1HMyfoMX8rTkGJx5DcWc2DWSfv4KPqR5iSohc=;
        b=BN04v3UffekWlor/4IJqVplLBo6s9C6ai71C/xaW55bxU7w7uMzLEc5gv09BhOrl5e
         MS/3eNDtWoENJ60FBTDz6dxxX1PLlInxASEcfJYzxabb9SJMBgxVNFq4jmbLiMPzXvii
         KFQxWNAvyF/FM8x5egTvDgXoEYF0/Vs1HRs8Y7dDeFPOCR8DLPehjFfSiX9IvnHsh/xg
         oAFiuXVi4J3hMrzQ84JhfV1PxUTabx/0+ZnnuratSX747EJ/kQTaxr/Fm2yd+BlF56tM
         OTLIeWy6hl8sUUNTUvSvvmeyfL8IQ2kH12P9Q0Afeqq2xdlmDfbJjS8UzWYasNQ34n7s
         H4lA==
X-Forwarded-Encrypted: i=1; AKwUvBzNEIg6O5Z02seyiEIQyyHuaP6V+RznDv8Ck80HeNORM5VvHK7saZn0cXngPb7VNWQR/27oIGxGV0hVBkg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjECT3R3gcSh8ZQ3aqIGxmsdz5JS0QqEh1GV4ZkCGhL1IQ4/Ro
	VZN1HC40koR7p7c3NyphCFBRUEQOXnqExzH4ClZ22MUzDgPH3Xmfm/4NIX7gnPk6ZCVVkz30zyl
	k6eHEJa3j6GoeEZiWghBJt61cD+vVv1bmHT7KA47uTiNJ7Q9xEuZKpbrdqEs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81d3:b0:6c9:83aa:6fb8 with SMTP id
 006d021491bc7-6ca9d0482c5mr4394844eaf.61.1789808282013; Sat, 19 Sep 2026
 01:58:02 -0700 (PDT)
Date: Sat, 19 Sep 2026 01:58:01 -0700
In-Reply-To: <20260919081525.140399-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae4e99.3179f8cd.1e36b2.0000.GAE@google.com>
Subject: Re: [syzbot] [cifs?] WARNING in smb2_add_credits
From: syzbot <syzbot+eeb58d2197d88720a228@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+eeb58d2197d88720a228@syzkaller.appspotmail.com
Tested-by: syzbot+eeb58d2197d88720a228@syzkaller.appspotmail.com

Tested on:

commit:         40288c92 Merge tag 'drm-fixes-2026-09-19' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122beff9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a0dbce5542f11c66
dashboard link: https://syzkaller.appspot.com/bug?extid=eeb58d2197d88720a228
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=140a2525580000

Note: testing is done by a robot and is best-effort only.
