Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71438836C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531983; cv=none; b=KSGLxciy6qoJnytqIsBF0E/zXf66T9l6AKrHooiUrXer/Apwfhhb3BgyREgFt+8TR8TVyeEogZKHQCXJBexzl4bFP+7kWleJ7e6+0JSotufOhtUZIPr3w8rBQYyrwKeYW6eUJVjQ0yRAnNLkolJzzTWKcKwhZTy+cATMw649Hms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531983; c=relaxed/simple;
	bh=pIZtKQnONGqcaaDdanRmJ2gMVSRSsuL3qhcSChYmWrM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=cnwJS7XVxvQ1LjMCqWqRL95/TXAr/8RLcjNX7KokJKuLfTIiRBOa7aboqf7L7wdiZBysMPpbcdKb6g5R5fvL/K7SZKxP2zqtj3LMcrU9B/XDwFQiD5b4ZtwC346Pr3oPeY8EJImOi8AHpEErg3S0f2xJ+w6qCJMqS8XpRjQLhn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RatIO25F; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RatIO25F"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afb0d2a586so7245357a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531980; x=1792136780; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mWff0NacHFwzS+VXJNeuJgHJQjG9150/yCk8MROv9E=;
        b=RatIO25FXlcpgUTbwOkO+ihZVBb+ZuVZzL64ajLBt6whuMLQUpau2PvFQVfWQS6SL7
         05yWwyGYBAWv7HShJP9Ye640CSvwdLYZn9pVO+S2h+qqOOPECKT26n1+GyApEpz7bMxz
         Ngd5EremfVnUlNEhqU0SIIkG+InMaJ6FraHPioBBKUycaWr+gYxc/MU6y4G+hp0aVmZB
         50S9/EQNaLIUpv3Zpj7pAVHOP1NCtPBZanvv6irgz8cy+7Gs3+xpY8f2aA2hS0PF0QxF
         BiHFEXeJ5CT0NE+Qee7lGgLviIo/XgJgtqCJZT91QXUkGafToDFSejmeZgLnodaQFLDP
         /WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531980; x=1792136780;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mWff0NacHFwzS+VXJNeuJgHJQjG9150/yCk8MROv9E=;
        b=rKI6A4r95iK3pIVO4YdZif0JwS9YaUDjyixFhhvKe6dQcbU6aGwFFQ2u3eP4mKkCam
         onGWZMmGwD9UratTDK/rtt/+y7aNaxuUDrCuNKWKGJR9+r5mJSfin38ZCJxwM3cDp1I8
         pghvVGo6SKZW4O9RoyOvfBwJKBencQHiTEtZffFE6u6ZxZ+ABO/2iBYqUrZzzywMLYVs
         Rg7M3ZD5U2zDODQNIa+rNbyqln/SE4ZPrrxwIuG+bEPD4vqKHR6y+B8JQgsUbF764AfU
         rs5rWwtXUagI8TmGbwZk9ZxbSiK35nIwKFfsLquiN+cmA5l6fz1YDE8cNkk+evFgSL6V
         mYDA==
X-Forwarded-Encrypted: i=1; AKwUvByo+91SH/CQ0svp0ap1VeJO4J3jw+n7S9Sgi3LZ0Jv7rr4MJcyNG0TAlGiciHh1a8FtMn5uVv+gAowrgFI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs5vgXhjRTSQbQX2+FFoeA2hvNoG+144IMjxP5g9XJ2kTy/JN4
	DGZuOEX9y67HNnM5f5TR/iScq1ZuTO8/Cd/DpWhquiZtpRt8MWlo32B4GRc/peVr
X-Gm-Gg: AYBFou12/AaL96eWo0MgErBJhpblMy35iuLEV4Mx0tNCzjPsgUgNz9HBJKs336jUDzm
	7sU1qgWHzfM536mAn7tdSaDNsfbjpKPterAybUGMMDqWxOz3Xd+DGyrSOW7Sj7EyOznhMW8yi8Z
	zQpt5y5xGbSfbs1Gx7PcQDXIZt9rISgO4nCwz4GvGw+iXQ89lrPMPfN0JKt0kJ2j9CSM72NtXXO
	BMF+MpjsFzWkQP53SuZyrXffmF0r6dgOpiTlWBWDC/0c64I9144UPxIXUp7WWqQ8i+rqYtRl/xk
	/g9BqAO+yi+TwcOPzg3wkB8NV1SAcb7Bok0YyG4r6kBA6ToAKmupqLxza1B4yre9b8KoejAKHQ8
	4IEPoutS/3ysmjW36G0smGvOgSRwFl6TGwS0hk8tRHR3UQ92jHjNiXtQWOM9gIM5moi9IC9IoOu
	ZgSmntkn/Mq4yxsc3bHMWoKzt1vHpqdlDdJojP8QwlbYLlJPgyjn7ORCA2sBB9Gw2hDBezaRASE
	UuWWzfZ7owBh0xCBwG/tkbdAw==
X-Received: by 2002:a05:6402:3547:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b17c29f7cdmr781639a12.28.1791531979884;
        Fri, 09 Oct 2026 00:46:19 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e01101sm663464a12.35.2026.10.09.00.46.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:19 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 0/7] char: xillybus: Harden driver and improve code quality
Date: Fri,  9 Oct 2026 09:45:50 +0200
Message-Id: <20261009074557.19996-1-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This patch set consists of several boundary and sanity checks, gaining
better control of execution flow and fixing minor coding issues. No
difference is expected in the driver's behavior under normal conditions,
except for one change that might improve bandwidth performance
marginally.

Why all of the sudden? These patches are the result of a comprehensive
AI-assisted code review, using Deepseek, Kimi Thinking K2.6, ChatGPT,
and Claude Sonnet 4.6 as plain prompt tools.

I've spent three weeks in what I call a "reverse rubber duck" session,
asking these LLMs to find bugs in the code and following up on different
leads, the vast majority of which turned out to be no more than quack.
Occasionally the points made by AI were valid, and in others, the mere
effort to explain why the remark is wrong to the rubber duck led to
finding real issues.

Almost none of the fixes suggested by AI were even near the actual
corrections in this patch set.

The v1 iteration of this series was rejected due to an error in the
error path. Specifically, the @rc variable was not assigned a value
before a goto statement following a failed allocation. This oversight
was caught during compilation with LLVM=1, but was missed by GCC and the
AI tools used during the review (and myself of course).

All patches are unchanged since v1, except for "Add defensive sanity
checks", which fixes the said error and also makes a couple of minor
adjustments.

The change from v2 to v3 merely consists of adding Assisted-by tags
to the patches as required.

The v4 submission is the response to some of Sashiko's remarks on the
v3 submission:

https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com

Three remarks relate to the patches in these patch set, and have been
corrected accordingly, with Assisted-by tags duly added. Sashiko also
had several other valid remarks which call for additional patches.
These will be submitted once the processing of this patch set is done.

The v5 submission fixes one issue brought up by Sashiko's remarks on v4,
adding a small fix to the "Integer arithmetic improvements" patch.

https://sashiko.dev/#/patchset/20260805093436.59740-1-eli.billauer%40gmail.com

The v6 submission is a rebase to the current kernel tree + a small fix
(using SZ_1G instead of writing the number explicitly).

Thanks & regards,
   Eli

Eli Billauer (7):
  char: xillybus: Improve control of execution flow with mutexes
  char: xillybus: Remove duplicate error path code
  char: xillybus: Avoid possible bandwidth inefficiency
  char: xillybus: Use unsigned arithmetic for jiffies differences
  char: xillybus: Integer arithmetic improvements
  char: xillybus: Add defensive sanity checks
  char: xillybus: Ignore and report unsolicited interrupts

 drivers/char/xillybus/xillybus.h       |  3 +
 drivers/char/xillybus/xillybus_class.c | 18 ++++-
 drivers/char/xillybus/xillybus_class.h |  3 +
 drivers/char/xillybus/xillybus_core.c  | 98 ++++++++++++++++++++++----
 drivers/char/xillybus/xillybus_of.c    |  3 +
 drivers/char/xillybus/xillyusb.c       | 66 ++++++++++++-----
 6 files changed, 161 insertions(+), 30 deletions(-)

-- 
2.34.1

