Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F144BD34D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824304; cv=none; b=D46DyjzWpcQi7uICMJDwFjLcN8DmOfOiEkUvMWPe0ZvtfsukXRTbDqKw7KqzIMKKfPtd6yReASdO9S/sJ9witZ9++jGkp0ctLA6qpX+EFjiv8IRAPo/K0FLVaZE7lLxqcFpiqjkbfgHdezJiSVINu8PW/CbIzA4+Ii80v+tZwW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824304; c=relaxed/simple;
	bh=FF6ZhpSbpqYYcWrrOSIl5oUUCQbPoAZyp8Zl1DPN+jg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=N5wM1MQn56Zj9oZMQ3Pd5QmgGlBVPqvRk47MybVFzXGF2scTTm9LIZNCm68btMiHScTxDJdgF3HlGuqKDkAC1Vhot2lYb5zLqgbzrAVCjS29zJwpM3T7qPCp+wfiFxtwNxsE+B7sXtKaSSwLADBu8swh1wpUJmezUBl21Y1RS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e937c5bd4fso2176224b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824298; x=1792429098;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FF6ZhpSbpqYYcWrrOSIl5oUUCQbPoAZyp8Zl1DPN+jg=;
        b=KjTJm3LLOpKltdh+cNGt41vJIhlmfKkwKaTJQ6p/jH/U0b7BTKsAJv9PGkrdqz1pvi
         8VllOS3slAsNdXE8KfldQ7l7qQ30fGrV6hmxapTsnxhg4n5itUuCdqsEkfgM8/Nerbye
         XFFyEGRhvcmHZ/YLLOhwCeJpeCQELbjfc67j7A7rkgER0UNFFcO92Gs03bmc/Y30q8+C
         EMFNuY7YHXKmrPMY5F5SA/i2xH7M9rZht/60heMqsTbFvKN1vzbxqLSkkyNmlSlyOy2i
         SUd1vu/Nzfpb8XyYoGZaSLjvBFQ9ijNILd7S5FodMTI7HTPoaukVcW0UpihhwlT/30Qo
         Sl/A==
X-Forwarded-Encrypted: i=1; AKwUvBzNhCvdGQbuJfeoACc5L6x60NPKjNb5ZnOaAa9SnEKMa1T5lGR+Mdzcorp/ujdBkFS5YtiD8bA/GqNW3Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxe5toiyA7WXRiZOzHP6WBdV2TXy2OoKNMP8S/hF0dvQWE8Fyg
	ttAOD//Ua9eHQcOQKbEDF24AznMiryyYrLYCrFZxYE72Cmav7zSQBJKEUZXBKprpQfT/bPCMwP9
	9q5n7hdIVkW0D6cacVX/RyBwoTj/VKIVGCYxmI5X2ljNjhyCnGqxk6eXzhWA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f8d:b0:4f5:98d:d1ae with SMTP id
 5614622812f47-50c56915333mr8781127b6e.55.1791824297923; Mon, 12 Oct 2026
 09:58:17 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:58:17 -0700
In-Reply-To: <CAEfrx+Dh3KTQOhuFOJbErSx8Ct8JGExWeEOsJ0EDLUz0mPxb+g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd11a9.a150a118.27e199.0052.GAE@google.com>
Subject: Re: #syz test
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: spannme41@gmail.com
Cc: spannme41@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: https://github.com/torvalds/linux.git master

Command #1:
"" does not look like a valid git branch or commit.

