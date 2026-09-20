Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73B31D72E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896184; cv=none; b=pWG/n7dEX2TZ/JuaJUVkYBXX/HGrVjYCTNU2XgX8hHurK5uASya9S2yYaancoZa8r5szqdMGGPtMHVgILNgXjZmZqsKJRrWorRyDWbqqDPx7K2zS/LN+CsLr2Bd4UwWuesZ1gxET2G17gZ1BuwXNbYKABjj3bwWwADWSuYdV0Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896184; c=relaxed/simple;
	bh=D6mWyh7B3cjeULg8d8guttwVPJ0e8z2b6SVD5xs7DSk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MUVdKPKbjAha44t8UwAK7AOw+n7BtOQgJjZqwgGLpSAG7tsTmhzNnQwS7tcV1MvAMhHcE86UZpDakgvVjuNIMogfuCjVGiqbXZD/dVnzqEs8pYxzKJz/phCR+Q2yM34KtSnB53Zy+gkNexb0FB8vhIQJpkMQhVa+DEPKzu8r8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso3115200b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896182; x=1790500982;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UqzNpwp63sBcI02Cr3WPuRzFWQ3xYtLvoG88wO/gAiY=;
        b=aKY5PjybX2OdQv3LTDB/F5edAaSSG7k1Z17+jGHRJrtbi3B/L8SeEu/+ll/54m43gi
         STsX3jKekHUMuv5WhaC/X2I7DjIh/UEQYsV2BdAOT7Mir0Ql65xcSklGrJRR1oOH8p3K
         9Ey0yjn4jw6+Fs/3tA9VOj9aCGSJyvz8N90LNy5MRx8/rWGoBqmpwq3MTXgjcRl9TtyV
         U6cBU+tl0py4kXCcat7lXCpQ3ofbtuvdYvv1IgMSzTpxF7AskFks9YkLFZQmBfDyfAFw
         qVjnSSd2gKT0VahhlB6ygXwUi9U2lLOaxXqt0qCrpOTIncAWTJqzMICqJjw+DAQDv2Pc
         cWCA==
X-Forwarded-Encrypted: i=1; AKwUvBz/XgPY+y6jqr9tpYpMS90cykeIC75zgvhSRsDkAu6xNseohmo9NFBQkTLoAdbVRHWBQ+tscCcaelvcclI=@vger.kernel.org
X-Gm-Message-State: AFuF++kgueawTHi7OH+gS9gZIyQmC2B9UJiER/E246fpRXU722diN0Pn
	Oc7MxT4Pgs6IncBbB7qmP7TmNCyn+/8jzXELca0CKbZMpmAt+nf5hw7Ph0aEdNAeN+AfaAQMCOe
	HIgQK3i8qIKhTaoY5ily4b7VPDfilkRrej1DNQ01DF0iCXXVwNWSlOdKXpdw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:188e:b0:6b1:8780:70fe with SMTP id
 006d021491bc7-6ca99e23aa1mr6640866eaf.2.1789896182296; Sun, 20 Sep 2026
 02:23:02 -0700 (PDT)
Date: Sun, 20 Sep 2026 02:23:02 -0700
In-Reply-To: <edc7bd47-15f6-4c16-8dc0-0753712d53ed@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafa5f6.e548f532.1ca396.0009.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 14



Tested on:

commit:         518e5b79 Merge tag 'for-7.3-rc3-tag' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=3db654d91b471c4d7a7d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164adff9580000

