Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73A3793B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810954; cv=none; b=rczRF/6451n2rz3I0QL4y8RiOomUMQvlLjXkHFOEjTymniAatAPJhfBbvvydTlVzfjcabpUc+HUC5MhUiLrR3O3k5DMorlzzDy+5SGEVqixe0CL7sASOwq6O20j8luFrz8sjkChKsIAsAyDPvwxg1wkJ0KhgUN+el5dAEHAdMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810954; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WPqMLOkkNwN30pbVX1TZV7PIUf5Udn3YKtijzWRsBMFEhcOzsAIWIVynJbWW4iT0YEVGXw1ZvbJ3dPQ34fmdmm5VHhAAhrFfybHJo81UBrJNFnLfewEZXXdIgQBUtvT6w24S0qo9lAEGGPEc8UIf9OA/x/ou1yhiXxCHYS2CY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso1673616b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810952; x=1792415752;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=ef2PDJ8EOChRhQWVIDsS1PGEFGSxYorECF/CV5W7JXgkQ2ATGwxhvZ9xWXgG4FJQqb
         JOuYV5wcqa4sjkSY+f0T7bHKs0Jacuqy177uotqV2d8tR5F6geec1PTj8KEm71rSkwUx
         OSWNjUU13N0SBaA3QB6+YfPApPgkmG/8UYQa78bWKOHkEqD7IWwFeIkw5GXstKitkfCX
         fyLipRdxgCwxhJFm134fuJZ6j/qXcSWx1g5SKzahulBjpHL2Lvrdt0Sc/UsFQXwe/MWl
         v8dHDUr3g87HnNOSmAD46CzFcWhmB3+fwJli/o5CvmMERBkMPqqFmgW7rfYWzp0rm5ZP
         Xlow==
X-Gm-Message-State: AFq9FYIyug0xjQJiBJFApAAep+BOgOxsz+f4fzwT0a/jtIfebQjgeH6x
	p86KYucjQqk7gU6lie/hnNBqIGFCE6o2uzlDqJAYWHLP7pEopeDtbI9F0PViLokjZFltBzRrIa1
	keNbNht9amZMGFuwoWEqGAgZS5h1geuGSJiTfBP/PFPQEOWJQMxjFoPsX03A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c213:b0:4d6:9232:b3be with SMTP id
 5614622812f47-50c5870f350mr7372428b6e.53.1791810952122; Mon, 12 Oct 2026
 06:15:52 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:15:52 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accdd88.a150a118.27e199.004b.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test
