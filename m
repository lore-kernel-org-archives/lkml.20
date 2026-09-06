Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E13E49F8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788689707; cv=none; b=kribyCq/NCliRo3CZkRLFqFHBmUWUTcqEfBQo8dRJnCByrNMn20PaLl2WgCUqj+ownkgFW3Cwd2S8bE5XuBUTxUfchliQq4TT07hPMEjnmlfmBGyah6VC23LgM+ICM9upXa+IO3Zi+BfeiF86OyBsNB6Qzrv5eC5wHWAqXCDvJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788689707; c=relaxed/simple;
	bh=6un5fDE03TrIuhun/agzTGbMd4tquZKOfV5FSYmoIyE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uKwozCg04u8mqy5u6fUWh09yRzXz2yn9CNSYs1xxa0OPSRpF19vFWeDrFzCNUssI2mvQqR66Ie389G2w4G6yKH65RKVzw/xyV0jj+3v82AurI2rxVSQVHM84rEM5L9WirHTt0G4KB0DXF8vKuqwtolNBxWcn5nl2d4mS24L/PNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d51840c4so2207422fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 03:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788689704; x=1789294504;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gdc7Q9WZP4QmsZKwgHroDzSRQpP62zmv1qDh4TH1q/U=;
        b=sNwqNOBmhGtmEk8e/i09p/34ohVL5IekGTiLvrZ0hD9H9gzq4drrmmgbZ8vJD0AwmP
         VXGGXQFdXZmYp0QCXKOUxvjemDth3nCNntEoArmAYAr+E7YUQVIMf5kHHfv1JocGuoOS
         DfkXeAFn6FDqkb4zsKWkJ52myMPc9PcKmxCWfLOf9kMbsg51oRhsHIXczzlhfLIzQ0wT
         fsMI9KOz+0k/kW98JAEHkpt8j07nWX9xMF3gr/go8XIskm/sTrHuoeGEwhjMsA2Q5aRh
         cJ0HHpCGV+UPAmbQC2HdqLP14n5WrB3+zljk5FVKHM1coFsmQkt75UNDn8nWPqCU/QsG
         K/wg==
X-Forwarded-Encrypted: i=1; AKwUvBxhbjfE3PKxuyikA23/IwDozcZ2VZf5BWS9ig4Zq7uWQ8xEf++r1GkcJZGl8dRCNKz8y9D5wg7xL7WNXqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsYuUjLNKamHZVPoY+8n2HUOArChoRNX4EXHj/a5dygLNnne+8
	b4UiKInBkL4V0rZs/c/2F3Df7ERPHKRd0eDo2gs5UrJgP4AIE6Zd10NkwkJR0N2PioATcxuyc0u
	dZlYhCvUePyYfxgzn8i2cBXlqi/A7RH/MF37a7nixzjFx2KzmlUERjzU31ww=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3405:10b0:6b7:8396:f3e0 with SMTP id
 006d021491bc7-6b78396f8e7mr5335478eaf.66.1788689704173; Sun, 06 Sep 2026
 03:15:04 -0700 (PDT)
Date: Sun, 06 Sep 2026 03:15:04 -0700
In-Reply-To: <20260906082747.24526-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9d3d28.87c06881.102b7.0004.GAE@google.com>
Subject: Re: [syzbot] [xfs?] WARNING in __xfs_healthmon_insert
From: syzbot <syzbot+ccdf3469f5f653bff7ac@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: patch failed: fs/xfs/xfs_healthmon.c:415
error: fs/xfs/xfs_healthmon.c: patch does not apply



Tested on:

commit:         af5f1280 Add linux-next specific files for 20260904
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
dashboard link: https://syzkaller.appspot.com/bug?extid=ccdf3469f5f653bff7ac
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12da0a15580000

