Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668FA3749F0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901704; cv=none; b=ZhkiieniD1g8aMka8oedP7IPE3wPPYx8KKHUiWCR/wkbHVjL2hVDJUjOLWFySXpJqdiI72FCFcFqamaKv8A3369hZuckDPPlwPlfjokffcJF6gubdzY3VSZsp7qPnGaMMCIhBi0xvmGcbIUsP7qVtFixjEa9eYMa4HPcrlPHt04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901704; c=relaxed/simple;
	bh=QqpuvSWQeTKflvtjmqgbEphlMPqryXLrBESs3vqPxmA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Js9L02upSezYXazIkqjLCYyTviQLJR9NqXns9SbvEINxFr6B9zWCk0cnnuonTJfpvwYxCOW5RdzH5/hjJXsXdZr4EYbLrKJbFnLu2YZdRL1IHmb3Kc15C31fjnrNTBe3LcKI2AE9TPnARCR38FyAkM2rARzPr2Banyz2GtSpcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bdc0e8af81so2069848eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789901702; x=1790506502;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PXxjapTu8xXAk6TDXFAHrt1DucVBJjVDleh00MFzb1w=;
        b=ycfCx5M3dVrN+jurPVbVSdfZcLP4IckCLjMaPtG2pmeEiB2kOcZTQGztpTegkBpFtN
         fQfrOdB8Z5pu0ceuyiivcemacRm+veCiWjRtIWhWuoRd7dMAvJ3u8H78co53AyFma8K9
         RyaSuClS2KfV1bZP8mlgAFfovSgFu89QUG5/kT69nTmpno03uy9S1t5uvgHy98gMtuqi
         NQO5I9qO+WzNZ3f6h+Xi2u5FpIrlZ/yaOBbGXVpyivQFxRY6Yiz9FsVe87pWzjHVf3Z1
         NHimhPWNbVTGOmUBSeVaiXr46bBhD29TTWhBUJNzNgBI/qwzNXx2Bc/8G+/wqRRSSETX
         1tqg==
X-Forwarded-Encrypted: i=1; AKwUvBxSI8YgnPvsApguLAVFXWhTorqXgW9RUAorJrwKFk5GAf8De7Fw39sOBs7L4GnM4f/LhtzXHsFuyM4FnKk=@vger.kernel.org
X-Gm-Message-State: AFuF++neSBn5ZUgWxsj2WBXFtAW2zMfUrGdqYcd7jAKMGZ8xbikNU/yG
	LAQNT3rVJ0NneD6Q8V/cxY91A/6j/erLUc5e0enCNdDI1Gp/EFuuaGFABDCVm2GB+xyH/Dc8zvO
	lKnuyPty6T/K5zDcj2znzASuiZ70VcNGTdjklf6cND9s1hzCkTXZkTJnj5Fc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1987:b0:6c2:d765:b142 with SMTP id
 006d021491bc7-6ca9aa40104mr6247029eaf.19.1789901702308; Sun, 20 Sep 2026
 03:55:02 -0700 (PDT)
Date: Sun, 20 Sep 2026 03:55:02 -0700
In-Reply-To: <20260920103426.72689-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafbb86.a6af0033.177e91.000c.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15bf4005580000

