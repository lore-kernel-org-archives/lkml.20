Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1053049C4CA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050253; cv=none; b=pjioBfbplzrSqdupzbbwTENaRGh3Gr2VuWmLgciOtVNmmulSd+m6QjmOJiNqXrxZa8VRIQ3p8gH6JWrEuK95+oIDwaCW8E48/A6D1Jkule3vts5wLLWJWmvqSJB2Kvfbc1Dez+LM7xzJ5XkFiryqe/2rSgHFt410Eu+gQBBEUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050253; c=relaxed/simple;
	bh=5/hM9KccREcqxOCDDx/hlOgmeViHCwOy5cBYiVcsPmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrkcXrsy5drIWdWm6qbt1FRStTIRlVzDs7l7GubBsyOchge+WmqvQX9WHy1+D1cp2Kr2rEXzgb1IkCoHbf+uNYHXtSGqUPl3UYuRqzXhdMkOCQqyuQXK1pBmOsV5zvWj1EaVxjliMzk1Aa6AM1X061HfiOF6KeVpOem8B0VUE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfjqc+dU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfjqc+dU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e87c66e556so21344725ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050249; x=1792655049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7xI8VJhb2pJN/Q4Bvj8qR4K039vHFMTqoT09DNVRZM=;
        b=Nfjqc+dULBQu587+w3fwnpQPPHVdqn/0Lz4MlMTgRUbpcNqmeUv5o0tijNS1TzE0B/
         94OCwVVSB/S4fU2ruOjU8GR+66Dvol1KfkqLVpPa8SYOBBb2xiwm5neXrBMzB2HDkGoN
         DtmoRFvt7jTtwdvwiuZyJVMvMRI/pKxB0+TQIJAxN3/1jSkIbShrmd/p6rx4X1I347oo
         /nzB/v2NkVBhaVBXQnuZBN3It3HSM9dplhTDh2CStL4xDV05dOQwcRsM8ib9TzVRW18t
         gp9NQK3NPBkicmNVVTSzPl3Jalg5TOFZfiUjZYBsqFZXwerXSglSveyU4ipN7bg6sUA0
         aGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050249; x=1792655049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7xI8VJhb2pJN/Q4Bvj8qR4K039vHFMTqoT09DNVRZM=;
        b=lAXF4G1QI9vTYooKrcwJNn1q8QxWjufWaK3wqnjJgGF2hxoEQf73ximm479FwhfX9i
         V623p7T7G6GMHK3ldCJiSO4SvIyWCfmT7qao+cboo5T5lbqhzXtAmA4YZSiDmqVux1ug
         KfQzFjFwFwTNZwvlhhX+JPT0YIMIK/PZlXo2pafaxLzDGrre8UnPuReNmM8rPXsUBz3k
         KfpqhYvy7UkYwcYTund4xF3YNfzBv9U2T3/8783qBdIBycqjlWN+qgzfU1m52CULE1JR
         XG7OHH0cXNZl5+n3XMnz0QZDDBnTiM2ZnMkZyo859yjlk6puXgBbo3nkSh++DPFzDK9g
         RJBA==
X-Forwarded-Encrypted: i=1; AKwUvBxB0iUApNEHNxbIUqbfk1/D/aVsZoYaww+xl08msFp8tiRu9Ot2chT33ahnmUcP8AJiDE1vyrgStbRHwrQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWFd0MU4ynG6h9mHY46EgzGXzWQSadVfkfMZTJI/LUru/qd74D
	4X2a44/LOxfieZASoowp0LEqnNBXq9d8qPl1e/h5pIEN178u8+H05EQS
X-Gm-Gg: AYBFou040nvYpjYunNclkVdaDrzvs/2om7xINadxRym8UgHb8SlYfNn46McwbW/Q4+O
	0ubd/5izGveSjE6u3Ueyo50u26f2bPBpsDpDQXvpFBbkQLGcaII+Y6WzuypFvrTKcgCGT9RV+2+
	+bifDGyiSNsFP5GbsnjjA0vZRN2tMLfKIMQ7CtIE5OuNlqLTHDlgy0OnfI4qs9N5SjZ/vDlrL03
	efPdZ00qcmq1rhujpXZbTMEZHJNVavLfrwoOpNnXnC30jLl69QMRO4zN3C4LveUMNna4jpiy94M
	6lwprau+ahBqXY3fztjT0p+GelI+wmSEaL90LfrsYt0N+J14mgHiIx1LSHjKOjiQXkqk9OvXjGS
	G+/QAhCLIUE2Vu3uzUhos676ahst7ytJLvBs5veEis1Cw/KbseCsaOy2BJM3sHQuuc6iBkfJBWU
	48HJNineesB3yXRLaMKIC2B/Vu4QrgE28TKJbeYnUvzfDubT3HHi0Pbd7/0+mguHF7AwJp5T7Uh
	2VKByBa9MI4n7Ryf0f0kYc=
X-Received: by 2002:a17:90b:4c4d:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ac928a6be0mr1338382a91.33.1792050249095;
        Thu, 15 Oct 2026 00:44:09 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:07 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 0/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Thu, 15 Oct 2026 13:13:37 +0530
Message-ID: <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames, causing checksum
mismatches and -EIO.

Patch 1 extracts the response parsing into a dell_uart_bl_receive_data()
helper so it can be called again after resyncing.

Patch 2 adds the stray byte recovery: on checksum mismatch, drop the
byte at the first payload position, shift data down, and call the helper
again to re-fetch the checksum byte from the wire.

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with pass counter, call it again after resync (Ilpo)
  - Split into two patches: refactor + feature (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 63 ++++++++++++++-----
 1 file changed, 48 insertions(+), 15 deletions(-)

-- 
2.43.0

