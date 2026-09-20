Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86A3DC4BD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886406; cv=none; b=O5kcUusZYOEmJLODi4SxhDrKb+DPnRzC8QAb7hjHPMEiRzFBzkzAHeZ9mdZ8ZTjWnRKgLXXhnuRqEFvE/Plwo4GshtlTCjMS0GfYHlfr1M2TvTuCS8LwVk992alUEQEk+4FSc5IGpU10/j/THByyRk9Keszeqla2LymP6IsWfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886406; c=relaxed/simple;
	bh=MhgWvswTWmE/SCKN3p16198xxg95zcJlJJHGMqdWOB0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fEt3qwdye6VGTnt1doVjeNRhqqooMvimaEvHeb4EEP1hCpZIItihIwN2zPftao6dZcBtOoG+k5yu7FwV8PW6Vpwf9gZeW1Rev1AbgHgTHlWgQdvfmccunM1yRTOlfj5CC9peFQq47lkzpkl+8OWBch5pQfTXTbfBOiYFAK/t/Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4f0a1f4f2so3091789a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886403; x=1790491203;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhgWvswTWmE/SCKN3p16198xxg95zcJlJJHGMqdWOB0=;
        b=UA3og59n3ME1b2GKyuxaKSM0fVnTv5XVT9cmQnfH7hqJNP9XzxQHkfTTvHg526NxWR
         M3BkGa8Rf+R4JL8x9UPnUItul2ZhSywfqP0cQB7R3UivfCQpKc3dG829n2WTqnfD1TfV
         832adc10qp4HDNJ0AbLenIkSG/WuA+baNu8C3zuRFtxoz44mYl/eZkQDAhox11ZYa1ms
         4zYcQMP+NrX22gy3AoKGdbCaJHqW9Bl2Itq0Q/fYawjvUpF9AX7ReGg0+9dz67DBU8CN
         3kp2EcFx/EgW1wiyQFL//rNVgZCRByoAT9G++SIoBQgFJqxFHdnMlyAHgV7+Btaol6Gn
         HoJA==
X-Gm-Message-State: AFuF++m4IhFilmvRuFYHmrzbW2ruZTdHr6f1sRlm/lwx8ifRbnugB7Rb
	J2Ga9rFVw33A59GNKDBECG/t052cvw6viTZzhWnvV6A/bDS5oivTeduwFQUYgfDUYs0q23BfZJe
	oIk6FhQmKSSqkTfm1c4AdRYu+NnHdofS4XgZNdYIpInMoomgqr8fA6xEoNfk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:571a:20b0:6cd:3fbd:1d70 with SMTP id
 006d021491bc7-6cd3fbd29ebmr2378723eaf.90.1789886403522; Sat, 19 Sep 2026
 23:40:03 -0700 (PDT)
Date: Sat, 19 Sep 2026 23:40:03 -0700
In-Reply-To: <6a6d3f57.6ce73036.24301b.000f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaf7fc3.71f81b7d.15fa6d.0015.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [cifs?] WARNING in smb2_add_credits
From: syzbot <syzbot+eeb58d2197d88720a228@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [cifs?] WARNING in smb2_add_credits
Author: adarshdas950@gmail.com

#syz fix: smb: client: delete compound mids on send failure before unlock
