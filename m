Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11D49B468
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810545; cv=none; b=F3tOlp7BIyDxznFkUh543/30zYGzE9R9aedHsiCMH1mJrLlzQnLMgubPW+NU84t8Yp/uKUrZQf3wh/gpk32Nt8ZwaY89Gk0drEY31KS9w+xzWZhtVy3YWlt//44cZo8/cxkRRxCvy4Mj1pCQCK0t6ODQI8xZWmOcHRrx5MDIs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810545; c=relaxed/simple;
	bh=lZcWilWtA44cLtecyk/wlisG62mSVpnvQOIy3pmSRro=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TQby5G6TiwY4oi9rLf/BBnhQTIUGAii82oxiR5NBOsezzUXGn4pCaPDKIJsiKGEFwaOUgzuCrVFAEmtfjmTRzA/HhK70ccvIYpHUOlYvDdcAzLSqcUp93i/hNAKMMUb1Yn9t5ncw/frfgjB92DnFY+ekovllA8h0SVdiXIVNbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-5179f3beaedso603996b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810542; x=1792415342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/l55NMXI9H2QGy/HWQ2jNyV45xL8CExDSqCncduIbAM=;
        b=mU09XVghOGd+tMFLj3MonmkRHzPdi1iP0UNSuDsObTswUy7Bxffc2p0Y9HCrRPWHxi
         1AVuW3gQumvUrzb1R67bLtxS4mqGS0rADHjDc/JAeNk3kc05I4Jk6D+JDQWT7QFV53ih
         pPVus93bQ8qGCpL3OdNdB2Qe6oPE3YVPeV1Rn0ei6F0WTCIsQ/1zsDTQs6YSY1p0xMe6
         CsjZK2bnLnzenLZ19paGmr705XBQ29WdCYsFqadZPiHvx/mcTZQcMz1Vn8rApM+Iep6n
         iJilgSSIdHf8PGhfznONL5P/k7wlUpYpEjShDPD58f8hqT4FDzVdR4SOezZEwqd8scz0
         UXAA==
X-Gm-Message-State: AFq9FYL+mYCvQlrbPf75iTzr074FRx9u5FTDigj0fLXyNLd8icWQSOwC
	XCMJ2J7EPPVNQ6G12tpCRGearublkfFAtXhzAoucSDl54Qm/VZyCV1CotWZ8Bx90UG7EZLW74Qn
	v8H54VCQyUze2gBbX+yFzraQll86aO5DwIrVUAKXhwbZuDlBvZB3fv5+Cp8ngrw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4c:b0:4ef:2584:78a3 with SMTP id
 5614622812f47-50c5473a052mr9352431b6e.52.1791810542691; Mon, 12 Oct 2026
 06:09:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:09:02 -0700
In-Reply-To: <CAEfrx+B9Exu6gEuWHBAuG+c-dzzFE+oGZiUi7T61vf4y2sC0qg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accdbee.a150a118.27e199.004a.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: rcu detected stall in rfkill_fop_release
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: patch failed: scripts/get_maintainer.pl:15
error: scripts/get_maintainer.pl: patch does not apply



Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=859f36d9ccbeaa3e
dashboard link: https://syzkaller.appspot.com/bug?extid=baad8fdbfa4129f93db6
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1256f9d1580000

