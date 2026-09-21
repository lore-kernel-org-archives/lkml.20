Received: from mail-lr2-f7.google.com (mail-lr2-f7.google.com [74.125.230.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69708367B8F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971312; cv=none; b=KpmNW4zOg9eY+PIAEeCXckUoW/AWLnZYpxd2WK1ShJ9XTPpR4nb8fxE/8ueeq8MLvQFNOpClEkJ8a3mZdNlJgX3QL9zSXRzcTAtoQvJWfMxGkcO3rW5jbv5kBKCQEdWJ8J353HW1TQABNTzo9t6sx06lAWlrjeCNrfDbQsYJNeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971312; c=relaxed/simple;
	bh=sV5QPs7DGYBPvqnJ7zT3vnO9o4CqLIZs3EEy4fJGu5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWPM3I1qEzVteVAidvl4SOYXMupi3lnQFGZad04ufCKHzImXK07oxyCzit8FaNZdfgUrUprCikLFEQSP+7+wQ2cWg/iIVnbwemACbsEjxhVJdadk/k5pXurFUrm0NmreV2FSx8wB3MUq5ldZkgcxy7IhYaGRuc8MwDX9Yf3Bm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki+hoG2d; arc=none smtp.client-ip=74.125.230.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki+hoG2d"
Received: by mail-lr2-f7.google.com with SMTP id 38308e7fff4ca-3a5abfab93bso19785801fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789971308; x=1790576108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fuvF+SRLtU99nQlp2cXtrtRQVtC6maysR3JY+sX0IuU=;
        b=Ki+hoG2dgElKjTuWJovhLh6if2bZBfaMh7tSjk00I1lpc9ai4LKH56g/YNScyxflVT
         /fcvX1aXW9sKQhUDb+BYpDzMpRhg5fr59P8HKz9Cczs3uDqPgm3M7O1cchyT8v/lxzab
         YdMIfAY64edIxeio+lEylxd+W+wINk7h5ARsLrZJOV6eK26mCuvWYtNdzbmTPTP1bOEG
         HX3V6w1W1O5CcnjYBhg4lYEyoHpZ6oEjxY9GDr/kT7P7sF8VLk5IjYTLATon+n1gxsF8
         /XocNsvFdnOtcbCnvXCd5YGy8AE26Sz1EYKE2ocd4tKNK3+H9cWxuKKSlF1iHBFmGV9k
         spLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971308; x=1790576108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuvF+SRLtU99nQlp2cXtrtRQVtC6maysR3JY+sX0IuU=;
        b=tfR5fCYwlhfSQHKXTVoJBO3Wymy0KnGDxmw5Ib0ZcjB3QHFOPdc++eH3MybNeU07dP
         ItzrPKftlEJ7YSWntQDqh+/2Lk0d7a+DSkSbu0WXqTD37CFlqQjXPSCBMCb9bsgndfbi
         xvWwqFzyYKg6K68ZL8/4BiJ3w3w4of18YJbKnQaYY08bs1nfK8HsUbbxm/EFIDgBIgzx
         jjocNk8rt0XVtTt6tmMDEZww5DaslWb3vFRVEwqPxNkOt91/H9/bP2xHsPBq6rLPimy0
         /VyUK52H5JV+r1XqkLECq1eDrFD/4sTtYxBAyz5GXmg37qpkUmqjMDCrKIdh4aAu3DFd
         8dJA==
X-Forwarded-Encrypted: i=1; AKwUvBxAjSqprsvewImNzORmYHn01on4idDRdYrMpPBVGC+J7c0+XqWZ5jUEZP1jiLt3gttrygGG+RTqrMG7b/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mwAi/YQ7tX4SoKTVk2dRvl/98j4i7QgnRbr6q0v++7W9HuxMKx
	0mzXmRw5sTPXo2z0oKeQyMZML2PEka5uaSvtnLY6k2Gfwi2mPDRdnwmz
X-Gm-Gg: AYBFou1xchDfRwCHuvOB9JvIQcb+XkzdtawozN2LaNHScqUVNQmdruCO0v+CHA28yfg
	Jv6pBpOGL2uqVN7/vGwW060sxFdv179+ctJcbvJl+lDaJDtyXTjsPkzCVUhx3UlNckih++2si6V
	r4qX86dkfeY7WARIo0bWFlLa+zpKC7Pp5F6xdLzo8cEwICKGIjRBm+srBP3Spymeoxy4Hu5Hpp5
	/5s6DjYs5MIsbMVNCqgeYT+4gJMi+Hias24adEnj1/g363UjfZRI9y93KEprLsUi1/g9zlARRTF
	KgPMWvsb2E3DB8n656dALFSt+mR3xuVJeB+TaO8QWBC2KbLtcQ9hhk5a59lV2TkNFXssxsRA5zs
	ihw6jt8OJSqwdpCmvrk/zU2+OC2aQpXd8GoJaJIfvUSSVwZezC+fa39w/YChaYY9mbSoVfkZ4U4
	JPH0xf3QE7PFFAMb/N/S6Y1qn7ysmLZ/fLzMYmkaaARp8HCQ5TUfBoQNMqFmGOFpz0pgkn6fblq
	SGq7IgAieg+hgx/
X-Received: by 2002:a05:6512:1090:b0:5b6:183c:5c9f with SMTP id 2adb3069b0e04-5b8c195a1c4mr3040448e87.61.1789971307991;
        Sun, 20 Sep 2026 23:15:07 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1398sm1691835e87.7.2026.09.20.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:15:07 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	HyeongJun An <sammiee5311@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10] ALSA: seq: Clear variable event pointer on read
Date: Mon, 21 Sep 2026 09:14:53 +0300
Message-ID: <20260921061454.6421-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

commit 705dd6dcbc0ea87351c660c1a6443f85f1001c76 upstream.

snd_seq_read() copies a queued variable-length event header to userspace
before expanding the payload. Queued variable-length events use
SNDRV_SEQ_EXT_CHAINED internally, and data.ext.ptr points at the first
extension cell.

The read side strips SNDRV_SEQ_EXT_* bits from data.ext.len before the
copy, but it leaves data.ext.ptr untouched. A userspace sequencer client
can therefore write a direct variable event to itself and read back the
extension-cell kernel address from the returned header.

Clear the temporary header pointer before copy_to_user(). The original
queued event remains unchanged and is still passed to
snd_seq_expand_var_event(), so payload expansion keeps using the
internal chain.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Link: https://patch.msgid.link/20260607004129.61345-1-kylebot@openai.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2026-74339

 sound/core/seq/seq_clientmgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 0363670a56e7..27c8af14a39e 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -441,6 +441,7 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 			struct snd_seq_event tmpev;
 			tmpev = cell->event;
 			tmpev.data.ext.len &= ~SNDRV_SEQ_EXT_MASK;
+			tmpev.data.ext.ptr = NULL;
 			if (copy_to_user(buf, &tmpev, sizeof(struct snd_seq_event))) {
 				err = -EFAULT;
 				break;
-- 
2.53.0

