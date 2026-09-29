Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C537AA9A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663534; cv=none; b=nLZvnIgmQgnZM/0UgJ/5+NvWfdQg2sy8zk/RXFvHfVdty2r4jNpoL1jUvXjC6JQy5JY3DNdmRBchAMwZahu5iXhIMXWVA/N83R49OydTnjldKe6LqN7lplUM9rLAZj27pkBvYjfMPujV/61nqo/ID0+Wwi53c6Qxgl2VcEI4L8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663534; c=relaxed/simple;
	bh=bcH5AWD3DFrSfHSrHunXKck0oCD+JZnpRaXIcwOtD+Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eB2ICwqpggYY461B6hidEVku7W13pfFu8arkLPZQXTPYXS3pHrQoN2o2I2fGo+7tGTjY7/N1kJkGcP7frqtY8/z08Z71oIDcoFbzrhu8VhXTyXeSeaes/7g6NUBqIhK5eOsB3UsQlXyahbipzrwGHzNuUrlvHSPnrpMH/iv6n2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4943ed99826so2946522fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663532; x=1791268332;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bcH5AWD3DFrSfHSrHunXKck0oCD+JZnpRaXIcwOtD+Q=;
        b=ZwsnrP4aiGh0ivWUBEe9dROrVsZIUn5ulCXEt6IQl+/ABVrdg+GYS4U+OnMz7xTB/C
         8szae+nUid3qGgm1YRDPVqfXK+ttV8X4MSx7iFjHSqKdUOlfdGAKd9bkFZEz75HgJyD8
         Z+lXzsetdraNiDJZonK/I9of9uwL1ygEcnr3nnmo1B27NBiRGhTRit8ecd0Qi0/A02v2
         +H/cAIJbcL70oy/7x4xTxmjsuKoKfmMR1+SBJssOx0wFqVcKgaMwtNy4HfTLzrJNaAIW
         f7BmCyijkSCssDnhhqXqhiA+FeJ4bECbUSU1xNqiIRBx5Z9+IiCMQAmSNQEjkBp8FMcf
         YAjQ==
X-Gm-Message-State: AFuF++khqX6LYqy344pvhSUPz0W73yIa31J/7u0KK4IeAHrzyMhHLAgL
	i4BZQoSdg3pMPtdU9yQ3O3JLESTmFsXtaSZbd7mxWk+O173iiM+TxzS3AkSCzs+QyUFRmZ8JOu0
	znQrn3Lh3+QNwqXcInGA3k6Kc+SHzMYEE/4Ghvfe2hqr+bA9cMmNjw8msyN8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508f:b0:4d6:9252:4643 with SMTP id
 5614622812f47-4d72ea5fe60mr15899999b6e.55.1790663532383; Mon, 28 Sep 2026
 23:32:12 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:32:12 -0700
In-Reply-To: <6a987197.9266084e.bf0d7.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb5b6c.69bd487b.a6f8c.000f.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
