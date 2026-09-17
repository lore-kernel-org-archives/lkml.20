Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB023033D8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614364; cv=none; b=L/TWTS8VMGiF+88dvpTnZy05FmorPh4Q3zO6F/ZNvSw6YfSCMqEXpjyE3CKYag6VShkjBMc/MAKQESZqXo7qN7aALJBVa/kLR4haeEZ63kCi9jbz/+4fAx0B05whwmFZeWWkqylYj8/bKD7uVRKif34pcKaJArgmhkhKWftz44A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614364; c=relaxed/simple;
	bh=j+ak7urLA2r/jUGw4veQTbyiB7+L8P/IHY5BYoGkmWM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Wnwnts7Dn/fVytzTwuKnChPpqkzQu5vz1Bakj9cxIY2p/ap0Qw82zQkKpWrem9vGal65JQCTquGxLN/OVek/CI8/gIbRETYcXsFxZ5kt/eiSFnt1xvw9dxCqX4r2slzwmjdhm3FlPUM/Ot+UzcPlaH/D9E8qkzDw2WHcnbKSmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b5bfffcc2dso314591b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614362; x=1790219162;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cB2z5ea/EHEXAKLt4ubzirOXvts/1tzStZdp+rlZvnM=;
        b=ogBL21L1145Et+0ocxKAQYb5W1Lle/VLPyTNXy/MGW1f1Cgt1K30wRD6R1gipQZyiq
         kQMpNBiSiher4CmbyLYF0vr8H+PTj80K3pMTRWuFyau++yieO9uS8DmLoR8ZVo8QeDnE
         B1P0YoSwcV5MqChEwQoaVopmfJSEAZT/eEgEwfLra4Y0RsjO/Y5M7sfqWWkUiQ6V5Jjy
         Bs/l50Ou9je1PE+k0ir/whEzSbP9UHwzqPTi8krjO4lp+u0vIL1fsxXfugvsSzL0fv9c
         D47GSPOnBpWP8SpTXJ1IXfSLHcG6ewLuoVdBXCTjDdfYAKn65ktQVkzB1YYqZv41iFqD
         bMsw==
X-Gm-Message-State: AFuF++kXcUHLDxfhlnEn/mUByKO4P0uKNpP+RsgU8omptfSTlZ1jvA2N
	Y/Cn/ui9o6+xuOmcvXDGY5pKI48sHjkzebCsv/EEv0fWQw9j6z5veoMZkdumA9V9vuCnDHB2EYH
	bKx64kvCRxQHScwhOpVYCEm+KkcKqOb+i8gZgt2OXf2M91IZ8KuOZHRYoAqQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10c1:b0:4c3:cab9:2ab7 with SMTP id
 5614622812f47-4cb6ac1d35emr1596823b6e.31.1789614362699; Wed, 16 Sep 2026
 20:06:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:06:02 -0700
In-Reply-To: <CAFJkwZxNQWU=x4gLojE-jhi82Y4hFj=p2wrK6QK2EBCf69r3nQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab591a.71f81b7d.278072.000c.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 14



Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f6b925580000

