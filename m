Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363807;
	b=s72GHHtylpynSG6/zr6oo4wmOZLyf5Nyy46EuK0LUYYX8RIyB2GFWOI97xHsyICgzFwI
	 xF/Zd5R4Cbexz2mMdMGqTRSHc+dEbiPXxa0yanQqERjx2mKs2PGxD/38upq5sO/0DKebP
	 8y0fNZp7NialqaZc0HiF9RkvM/K496El274n/tfQUU44FEo9WGJD4pjJTEGHmbHRTXECu
	 928JFiO6M2pN2+yb/jvs0kw6BrJNiOXWe4LSnXj3BfKG/TWXEcQ9C6e57GC4rWEd6ANB/
	 hoZzH8OkeSWMVel2nnpEQIreR216jjGvb7KI7DteamS47bYF4G/eOqlU4EST5+WFOuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pQElCk2k12jaC6kpnqjAIZ7YfARLoAsxq+ZYdTzaT7U=;
	b=rKyf9yvt1rQ26erDT+ZKWNg1HsVRXTOpHU0av6z6T+CC+DG2/h06ng86KmdqkRhP46sY
	 J6XYjSthf0+b0oJbnNFyX4C/pyqexkRnzMqGr9Rei/DzyvxPhXrhPopd/jUDw5p8dJIr0
	 uWVmKWYXXbrbDLNkVOvswfJCOnD6McokjgXNFsmjCbyFEmrakzh5ppR6KuAiR7TqrXR0q
	 l9Y5Q2HssabeSt2DLHIIvhzPiyLzOmBLMUmZ7UYhgpzFTomChhKOhMNUwEqFvov8S+BxY
	 NdJU7jhuBs8TCD/0DGePhE96Lm98JTh9EQu/xbuPF7e0M0STRzEj97KMDESojSsN5PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj3ZP9Cf;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827C606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7827C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fj3ZP9Cf
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so1552388eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363806; x=1793968606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQElCk2k12jaC6kpnqjAIZ7YfARLoAsxq+ZYdTzaT7U=;
        b=fj3ZP9Cf5Y+e7SRaimUSFagvNtkpeoPKFhmaUN/TOWxv6iWzE/oJaP4Li4NwNzjOSF
         YwditmzupbjQkaHhRBJK9P642j5o13rhvL2p2Xmh/RysNjrrSRaHtVDudU528cNZNRzm
         ndAZVJ9IrDhDAlLg07xslGNbl/1VLsnxzZ/jlRAKdsFsth8qhq0p8IZq+vACSXKox5oZ
         blxBPKgiWHn/p0w5vxI+udQejA6fBo6JKV7jdXSromfqxshAuHWOZB20pnGBOowFX1lT
         YFSb1tsVgw/XP/alZzIfMOkIetsIXRWL2AO6Ob3Aemg3ByvLsDjGHUKqICWJB5JF1me/
         AkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363806; x=1793968606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQElCk2k12jaC6kpnqjAIZ7YfARLoAsxq+ZYdTzaT7U=;
        b=zqwP2rGF1dtLZ6TdN5kr60Cd7s/Ddxxv7pyjGmCD0/h4W5xDbA6us4vi30Py2mdk1R
         Ljxkt7vYz4C86ajl8c/+W2aLQDCDsfwJNNtcbNeWuRYJXbcW1Y7oAmZOwGvy3hR+C39K
         ZyWdaKFuaAg6d+2O9q+jyCNJkvijjGJ1q6l/BDyJWEJ8ANmuOquyozlce4+WErfRODz5
         ndreaH/DeQHS99RL9DWvd1uZow2rdydz/H+/dB9seoI1/LNVx3cE2nMauvwk6W9ztvFy
         PTDL3EscjvR007DRBJkcnjxkElMFJq+OCmchzhyOhNgMgunuwFUnZuTe7bPCIBctERai
         0FEA==
X-Forwarded-Encrypted: i=1; AKwUvBy72BdGynE4E9sh+3DEflPyNWzgPhkwdaYDeh9uGZDI3IgCzrGTDjC8UkE3fh7df/lAQZg4SSUT0XSt8Mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcw0zV4AGOGNdI7RqaVQjYb+mMRs6IBWLeY+Bs+xnk38KewyVK
	756gEkaHEmHYoFZmMI9r1aOI1M1Guztc0SGvQSz8jOt8tnoOTthhSlOV
X-Gm-Gg: AYBFou1kqBu7EOMB0UN+mO+spNRnGrOaah9/Xp32Nsp56GAjaHExD9VblZtyNzk48Rm
	cxc+f93Q2e1uwFWrKTLk/NVm/kHvYmacKEGKFS5nk0GFRirwxXmosoFzAznqnfxdPKAv8X0rolb
	wh+VBzCJojbIYXfvHKnK/hTf/GbpqkHwut1FUxUfCX6PUlnGyf+3fsm5jun4uJ80Cn5TCJX2Avt
	JI+nqDOmmi86NW3B8wpJWA0OgYY1IIy4Z8TckD46S5106KzV4X6Bn1aJdjjNOm5o5Q9rhYWvINp
	MvNK9m20WxZ7q0rGL3a9WZVY+6bHMstbYGguM+GbgPyW476aJAzXeCSoU8WfSKX2vYMuZ2WSuKb
	idepFhMT3ejJl3j0cWM1tcyZRtXhKjejKpjjGZfZ2f4lqRHRSUxy8AMjiMStOflF3KzizdGdEHQ
	U/yunwrEY3qkg0BFiCrk16eJMMBcOiHN/CwlKS7OgoGp+3LsU/P89lr4bFGzevZ8yWMfqGxcv7h
	9LTmBuzL4QD5qqgCQiqZ9T9DqmxfgzYC/hHTV5dvo3FwOk7QpQV234lbO2o9OGGkvr6gXSdt5m3
	MSDEehYlM4QN5cXNZAOKvjWAO5KjoP4AiTCZs28FpZs6PgqCl7mteEUCq4LllCSRYno=
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr4018459eec.27.1793363806237;
        Fri, 30 Oct 2026 05:36:46 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm6382373eec.4.2026.10.30.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:36:45 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dmitry.torokhov@gmail.com,
	mathieu.poirier@linaro.org,
	linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH v5] tty: sysrq: clear the old reset sequence when reset_seq changes
Date: Fri, 30 Oct 2026 20:36:40 +0800
Message-ID: <20261030123640.263164-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Changing reset_seq at runtime does not work on a keyboard that already
used the old value, because each keyboard adds the new keys to its own
copy instead of replacing it:

  echo 56,29,111 > /sys/module/sysrq/parameters/reset_seq # Alt+Ctrl+Del
  (press any key)
  echo 59,60 > /sys/module/sysrq/parameters/reset_seq     # F1+F2

F1+F2 then does nothing; only all five keys together reset.

Clear the old keys when the copy is rebuilt.  If sysrq_downtime_ms is
set, also stop a reset the old keys already started, since releasing
them no longer cancels it.

A key pressed while reset_seq is being written can see a partial
sequence.  With this change that can happen on any keyboard, not only
on ones that never used a sequence, but the window is a few
microseconds and not worth closing.

Fixes: 154b7a489a5b ("Input: sysrq - allow specifying alternate reset sequence")
Cc: stable@vger.kernel.org
Assisted-by: Kiro:claude-opus-5.5
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v5: Dropped v4 1/2 and rewrote the changelog.  Tested in QEMU with a
uinput keyboard: the new sequence resets, while the old one and a reset
armed before the rewrite do not.

v4: https://lore.kernel.org/all/20261030045854.153556-1-zhanxusheng1024@gmail.com/

 drivers/tty/sysrq.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b496..a90e97a6d7aa 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -689,6 +689,11 @@ static void sysrq_parse_reset_sequence(struct sysrq_state *state)
 	int i;
 	unsigned short key;
 
+	/* A reset armed by the old sequence must not outlive it */
+	timer_delete(&state->keyreset_timer);
+
+	bitmap_zero(state->reset_keybit, KEY_CNT);
+	state->reset_seq_len = 0;
 	state->reset_seq_cnt = 0;
 
 	for (i = 0; i < sysrq_reset_seq_len; i++) {

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

