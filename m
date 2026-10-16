Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8621419A4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146880; cv=none; b=dFa0VB5pBvyvYQxk3gvPPdI1Vkc+aHCNx0lgj3epdpv6sP9KPn/+FvDF+XU47jew22ghRQqT07tvKMd5alSsfJmNbE1AfoswQ0E2SIgLxDzyeEdWWvRDxXqY9v5I3Dv0s4OaiVpO7ptCUUxEwhMBJh4lfbiC54KwWQ2y6dd3TqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146880; c=relaxed/simple;
	bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gc8dEHvabsnS3Y+5ade6pBOCaUbpdlN4u5PHtkW+OkrNFaWy9ueIjU9FrQQSg8Oa3XGm5h0QfIYP6Po2vfiI2eetXq9TIlmL5Kb7DfbpcGrhLaU5a+QcJjWv7zReetIPLJIyeQzVR+yUPhZezRyNRTyw2pgMwn1mS9huRewvme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso4006776b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146876; x=1792751676;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
        b=sLssNLqlq/Sbwg2s8J8BnxcayaGRoFPb8NJUFL3/9gcvcSwKZhc+gMChk+Ee4nRlss
         PUYvHNRGkFlgBHm8DHazs3rOVrU/5Es8PxoqTdVeV8J7g0KCcJ7yFafuUJrhIkFABUjb
         2f8lr1IYNUUg1ZkPrdV5dztOqvIib12yGDJ6eVXtlXsLSzZjGGYcdC+Z/CBsMtnINVA7
         Cc0B9qowlDQyRLJ+T6UOvlVg96d/9Ef3iqKz9czqN7nc2Zz54rx8iVgnSbaBdy8hCRIP
         bFOHRk9I9qDePs8SWEolmNrlUe4iH67xKCsbQZ4+Bj/6gNBFpg7C7Gvo9i+Bax48LjsO
         u8Sg==
X-Gm-Message-State: AFq9FYJ+8bPuZ2ox66daosZkGoqI5VH6huqcp2X6/+5DjdLfGy+kbySX
	Nxm7me3+55Otgg+Co093VclDicQ/lrXSreBwl5iWtowjJsDyqOxlIXPLQEf67yKkzIKbZAUK/9I
	RBntaT+Afri9fmBZatdqrP76ah+NrX+ApcIH4xtssWaxlGguVyKk2ofmgdnA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1810:b0:4b5:5bfd:518f with SMTP id
 5614622812f47-50c50f2ea1cmr22605404b6e.21.1792146876522; Fri, 16 Oct 2026
 03:34:36 -0700 (PDT)
Date: Fri, 16 Oct 2026 03:34:36 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad1fdbc.7952420f.283480.0234.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 for-7.4/roccat
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
