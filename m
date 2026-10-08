Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B734D0CC3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473164; cv=none; b=bX7df/C7yWrKPAXq3BVBYWHFR1DkDrWvaGzkjlp8w5bV+oCJ+/yxesK26kmRzTEF0LYkfZJ01C+WLZNq4zc8jXQ5ewDo5zUONGRSGOgSrCm+z8yjLDqvo9fwd3VpOseaQILevdAW7JnGh2/yaKr/ygS5ipR5dQAwLwuju1qi5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473164; c=relaxed/simple;
	bh=akIA9HKvdnqYj1abtddudSu/lZvV7C2DIR6qkupg0bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lj+DXvRb7zNFRTvD22SXdDFiGM07c/dcLr+sf/Porig+M6mZfnwAZGIWQroLDPj4MBkupTJz92Yl6X982PA5w1Mk9vAerJhINMZzGnZHlGg87QCnZPRdaUwSznf2GcHZHF3+mvjDzZIO5PU6AGurhtWfRny9x4FwtnXJisdjEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYO+BefJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYO+BefJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso114540a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473150; x=1792077950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ou7YAs9auQtCgureArfNimBtTqCetiWpq07A3Q9+Ygc=;
        b=oYO+BefJbmkUxkN65wLvSl6bSuLmWsDAz7rOpkm4otIRDeveK1YWm2eMme7pkaVpMq
         YD6JF+EGx3SP5ymmP6QLew3PpC4d9OT7VdWznqOm7J354lferDkzlKoNh3KIA3RJvlpW
         EC0J8IQ/36sbkx9D3wpm5MQrTnZJRs3MDDEDb4R+vogJnT2PZikcZ9kWBy5J5awUnNWP
         00MwVw2xFIwhdwORe4iMdphjoQcN44ZAHNsacfNawIdRg3ZVtL1W2mAB41XFZge8Vumw
         mHeYWvXRBDCdfdRnvNbBnRGdmV8tQ54yYwQWPnHZ6Gt25Y56S++AJTLJbekmFozJ9Ooh
         JG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473150; x=1792077950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ou7YAs9auQtCgureArfNimBtTqCetiWpq07A3Q9+Ygc=;
        b=Q6fFBnUgoma4b1uuechVvLg00xkAqJc25k/PQp3S8cPOvTijaWU2zwmONapyGAQXDA
         TPz0wut58Ed5+jaCkrDirnXcxTLlNW2M1sJcq9e4W7lKqibQlJfIFugMEt0lDoJTZHP/
         feqT4IV0Y68OJfsoI9XvoBPVO3rl8Sw5R6dbTuaS65V5QmW8CGPSUYIXJgGGeG9x7WVq
         6e0O6jc64sn7HxwHf08A2BdzPuWLnZ2Puhn/iFbj+gETd7hH7gZSuvXDIAjbRGi0JjER
         emO6az7rdEFzi/w6dpSvcjKenz1sHO2vXVO/qUq33Qsl1+CiSes5/NvJ3B/mkWrqHL2Q
         oWvA==
X-Forwarded-Encrypted: i=1; AKwUvBxuJfaHPlBSBxUD/4WwZCwhFlFTqyd/MjMPezqsJB1lDAS/7VUJeKEz8qlK3dVjWINNfbkmRJ6chcxrP4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbR18jkYPpi9cEd24p7TICuK0lSLcqIfNXV2jAD/wBJ3sr13pH
	wCJWiXnoSyi3KY2NUlcCoLJQhcf9zrhqnFJsg6urC+7FiJe+SXb8gz4G7dOHFAkj
X-Gm-Gg: AYBFou1mwe2/w2+2gSSkFKa5DfWlXrUiQvJV4ebTmAXbe5pKV0clfDt65X020bUJG8H
	Yey2j4deHdTJulJWqN9Zjkx5vLNuXNABU6b6DKemZNNL7mOtWXpRgdmCvFngGpoI5qvFijAXFaC
	/S329Te2tkje3qSbzwCuZkRNPrPifkPLvz3hULOLrEjqRtyHr3OxLpvwudanochMJ4pWs+GDYEe
	Q9+PsO+s2zBoHedLLgEbnmfMNogfgGxI9ud1FAm8y0e6X5RsL+9fGneFgrrD1/YdbbH2xd5DA5H
	YTtbR3bhEVYzXTDjID08pbyd5CceQsUOrz/2pcxDOlB8iizoWRJhxwbMTlXVf2s5Gz5Y3+b9D4V
	QepiONK+3RU7Oj3cfe8eQ4FSegsjvc+E6vYCFh9z9eMhot1ZdlQi3L6xKXmEF9I7WwclxXuhPlW
	+ifQ+w1rtxIBO8pd+vn8ZLMG/ihZYybNkMeuTc100V0jDi+RIWZJ71Hbc9u8AmvXU=
X-Received: by 2002:a17:90b:588f:b0:3a7:a463:54bb with SMTP id 98e67ed59e1d1-3aa9a386cb9mr4276553a91.5.1791473149396;
        Thu, 08 Oct 2026 08:25:49 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm5554792a91.12.2026.10.08.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:25:48 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH 0/3] ksmbd: fix three named stream bugs
Date: Fri,  9 Oct 2026 00:25:34 +0900
Message-ID: <20261008152537.4147299-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namjae,

This series fixes three independent named stream bugs:

  1. A read at or beyond the end of a non-empty stream returns
     STATUS_INVALID_PARAMETER instead of STATUS_END_OF_FILE.
  2. Opening an existing stream with different letter case keeps the
     client's spelling in the handle. Later writes and removal can
     target a different xattr from the one that was opened.
  3. A write-only FILE_OPEN_IF on an existing stream can replace its
     value with an empty xattr when the value-length lookup fails with
     -EACCES.

The series applies to ksmbd-for-next at 5d2b1ab54e9a ("ksmbd: fix
named stream write and EOF handling"). Each fix is in a separate
patch, with its own Fixes tag and stable Cc.

I built the resulting kernel with CONFIG_SMB_SERVER=y and tested it
through SMB2.1 in a QEMU guest. Reads at and past stream EOF returned
STATUS_END_OF_FILE. A stream created as Foo was read, modified and
removed through foo, with one named stream in the listing. On a 0222
file, a write-only user opening an existing stream with FILE_OPEN_IF
received STATUS_ACCESS_DENIED and the original value remained intact;
without patch 3, the same sequence emptied the stream. The same user
could still create a new stream.

Patch 2 has a minor textual conflict in linux-next with the VFS tree's
const mnt_idmap conversion. The resolution keeps both the const
qualifier and the new actual_name argument.

Concurrent creation of case-variant stream names remains a separate
issue.

DaeMyung Kang (3):
  ksmbd: return end of file for reads past a named stream's data
  ksmbd: use the existing xattr name for a named stream
  ksmbd: preserve unreadable named streams on open

 fs/smb/server/smb2pdu.c | 10 ++++++----
 fs/smb/server/vfs.c     | 17 +++++++++++++----
 fs/smb/server/vfs.h     |  2 +-
 3 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.43.0

