Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079D62EEE61
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182894; cv=none; b=hvBTSOUStbs4yqGaJ0eyTurOgyyE+4UkhK/t4jsmbQk8G4AbTCqp1O/DKvEhcPFNInRn7cffqDnzP2vyzI0xE9TNYzzkyQlTBfdbAcu76UXVIJNVJpvjmdA7ENVWuAXB+DKLU/NG75wh6XeGb4/Kko/TvxIcAPxJJ+fk2zEXQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182894; c=relaxed/simple;
	bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Fn411DFYqBneqgBVqNYR0JJahDXTJZCLDn58DKNPqK1Qh4SOdqRjyD91xawCiiboitNEsOdCzM78aPymGYtKhGf06qS0oeHBE9QKnTH6oOXaZE3thuDFpcLrS6FzWl1uL/YoGOxXT+yi7ZJmijGZ0CpRhL0rJAZXdEvR51LTm5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab8b4887d4so370934b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182892; x=1792787692;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
        b=Zd7F87237fsPJ4Sc1pmbEx5qDt+Uh8bwOLwznU0yOtS84uWt6PvBoi/OJQkMfS7Dy/
         cXerOEaOjVLfy+n7Xq8kbmAN5lsg2I4uJVLWSimuNf0Hrnb7s4h/hBLf6PAvMipw5JrV
         U1FCq7YLolTk1p9LbPE2KOlMPWbh7XnCMWmKvJ9ISVGSx35I+OHC0rG8gMIe1ZSyjOVa
         9rddOIf6nb8PAa6YDmYYxc1PHdeAGingtJtvcx63p84ud8QmgYZlEQ10AoIGwyB3FPBd
         xoQthEwVNKzU+bYT5Pq9IaecXTNEg+LOKtLWZemRthz+ciFgPaZSznW8eW26iwAdMpwP
         FqxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz61PESNQQBgL21b/l78NZFzfPY2pwJYHnmYAiQxvYamwIE83RTyx1YAzkFb3YmW2o5fp74gbvQkoM0dsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY1H1wVIUqKg/aywWvt6dUltYsykvVY6DjRnQbFoefkcVvK9/g
	9Af2X6ryozGvO4hWhkNFSnqvl1ptHm4XX9/VA5qtZ5YCVGeoQ4pjbXnQIwQ4Kb35RYf9V6DtuW0
	WX7SEw9ANhNkfXJiE+8pA6TRF7Hz6NFcVOQNFkPjh8/DWEu+VQGNBtBmJdAQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3514:b0:4f5:7723:4c9c with SMTP id
 5614622812f47-53ccf2f64c8mr836049b6e.30.1792182891971; Fri, 16 Oct 2026
 13:34:51 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:34:51 -0700
In-Reply-To: <d467bd49820fc5622ee573599fa9f353@inf.ufrgs.br>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad28a6b.7952420f.283480.0350.GAE@google.com>
Subject: Re: [syzbot] test patch for general protection fault in input_ff_flush
From: syzbot <syzbot+788733b16e87faa63deb@syzkaller.appspotmail.com>
To: matheus.aalmeida@inf.ufrgs.br
Cc: matheus.aalmeida@inf.ufrgs.br, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

