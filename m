Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048E5908A8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888566; cv=none; b=WzULfMOY0VxgOqh4CjWTSQJLkYPCuMMV68P2fkX5OcsKS+sgegGleY5O2KtE/t4WC8Fqo57HngzF1UEMfZGcQ0n26AIIKoH4qlkmAnOyX8e8xrNvJhmRDctOgRwej2QAXHx1uVgHvh6n3o+UfruoH+33aNgGFufV9AY2drstPtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888566; c=relaxed/simple;
	bh=JYu15vafmWmjI+7dNh+GSSeuDFbzWiITg9hbB6lj4cs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HTtf2lFA8aYJk0sYFZ6GsJvQSh+ezLB8zDLVqMY2TQf3oAEIVJrgwLWYIok6DgF59MPedLYPx/ABEzsa1BGwRFnNTTOpzfERxp7EDxeoCG8z1KwztRAD0CsVwZ1+stWQYfvaphBSixPK7z7OFtzQOzHJsi4IVIduJsamOnq4EQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28db3a47aso5499838b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888563; x=1789493363;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JYu15vafmWmjI+7dNh+GSSeuDFbzWiITg9hbB6lj4cs=;
        b=r/dGJcM3U0EATEc0vqxig/mjuy9sl2bWrd1QukUGOJ7k490xnuSXcNb6Is00lXw0Ol
         YR26JIVaV1cKdLWQu+WcYt+9OfWWFEsPg0rfCpIRI+R8CPqfNzSLHQCs7ZpavjCfNGCM
         1n3keIEXhBF1tc8RtVUbPQ/ctBqZcGTQM8hVBdCOg9iAP+hDspR9fN5hxhIvMZbuT3VB
         NL+b7CmcBYvDADGkn9F321juKwXvchsKz+rfMFSG3mNM03cw8oqIkuhxzK6uwXWR5ICk
         5FxaoxSSwix6c+t4zmSnItxJ48er/r0Hqr2gkNpPIorhgwWpxnWdzyFLuLB9IsbKJ2dN
         IZgw==
X-Gm-Message-State: AFuF++n9Ha9vW66F6HoJLYSzL/OLi6YKnUNXeTtC4toaao+ZlDnbtFlM
	2626G2N+rgJJ3gMZzh1d5dSXmnOh9hF3XRGtvH1KFsKHkhhRehoHIzDP2loynpC7SPElXPhmLrb
	oh20JVvrmfi2B+VZ0cAi2GkbU5v/0N2Kb5Qyi8NdDMKBxKiClwsxVIgyoSU4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f007:b0:6b6:5bf3:e201 with SMTP id
 006d021491bc7-6bdcd6242f3mr788633eaf.30.1788888563720; Tue, 08 Sep 2026
 10:29:23 -0700 (PDT)
Date: Tue, 08 Sep 2026 10:29:23 -0700
In-Reply-To: <6a8725d5.4d75e56a.c9a88.0043.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa045f3.6e6c5f9e.28f11f.0017.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 5acbae5f7eb3d5275120abfe698c394b7325dcec
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5acbae5f7eb3d5275120abfe698c394b7325dcec
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5acbae5f7eb3d5275120abfe698c394b7325dcec
