Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF230C158
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366083; cv=none; b=ud/lQLy+bgz/XeGxhXRqpNynq1pbJ3H38bf53EDPCVwqQWJ0WAd1+CQOa7RE5E1oOhBqo4oaRv+hEVzKyXENcpb0dOhp1okGhE8y+7Ohxu2UnxpNE+4VPiMGyCH80RQhB8LAbMXOyWgYEmrET/CokpbSNgvN8a6pp2OVkjlLQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366083; c=relaxed/simple;
	bh=jUQ+iQ05XqeVsD/34xR1QltqxZ8HcIpmOp82C60Fgf0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=pLODWFzVb+GOdoKkcPC2titmhUZKcCAU+qA8UiBKDNBkdTTBvB+esdXwrBp/l2cmRn88HwGVzsR5Yrbioh41dNYmfjOfPVTHQFIWlbXEIfU1LGn//CVSp4X3XpvTcEkaIAbZbhgPxkFXja3QWXnIffD4m8IjgpP0vEG3wmVjQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c2474b64bbso1808317eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366081; x=1789970881;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jUQ+iQ05XqeVsD/34xR1QltqxZ8HcIpmOp82C60Fgf0=;
        b=JK/hKLZhGox3Q4IgiXG8VxK0VnlYU3yEUEo8NksSSnJ5z1Ia0fg4AY8shFrWy5ASzT
         mGuMnd5eFL6P0WlccMIwwQF/i7CgGg/bfJYCBgWFrHlWL12YD60v4gaHG11qQ4HqXM9u
         zViPA1IqplQmF7k2XYYLaUlTd1kwSoEoKfpOHj7auyATI/ssRMYShRlD674c+fNlrT17
         602Gw+P/IH/0iR82DeR9SPb6ACaFXLIUUUM941MiaiF5j0x4q1o+fDP36afBrWrNm39z
         0Y9R7Snx2azJ9vfR4D9OtkxzsN+d0AKXJFJzmt9RrQE89f531XtNTHICpiq7spxw7IQN
         MK7g==
X-Forwarded-Encrypted: i=1; AKwUvBzTcUgJI1JB+JoPJWbGMidhtDQaEB9+iuYGHK395fLGPJ03KtSki7wjVLSLZU9WXFuhKkXlYBVYSBVs1J0=@vger.kernel.org
X-Gm-Message-State: AFuF++n2rv2a7/qH+N1jS45COGJfBMnc4P/dbMO9N+EptqmWpHYL/2Lm
	7gXU6h0lkECG4uQ7Mu4vznI0BMs95HU4qtzdfsGufH1NCJEc1ZGy+N/3JTXEfmgrdLW17rcohGR
	CDA9bFErxYFaIIJ8oUmsACXa6/6h5iMm3h4TncnZI4QDJyB9a2XV7UEJmH6k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1985:b0:6b7:83d6:2931 with SMTP id
 006d021491bc7-6c54293078fmr462753eaf.52.1789366081138; Sun, 13 Sep 2026
 23:08:01 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:08:01 -0700
In-Reply-To: <6aa78f40.02c11d65.3148fc.5eddSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78f41.f81106d8.2ab401.0042.GAE@google.com>
Subject: Re: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+2d9c96466c978346b55f@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn
Cc: jchuang26@m.fudan.edu.cn, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 90f3c123247e9564f2ecf861946ec41ceaf5e198

This bug is already marked as fixed. No point in testing.

>
