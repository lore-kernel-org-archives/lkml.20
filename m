Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492094;
	b=SdOgWn6tLHQSr3huDuRdCOJheXDOZgE682cbVtj4/vqmY1YmkMUlr7Wzt4wtL344/Hu9
	 mIlSr8Z2y893HiMa+syClxNNMOtpEtomxC8P9diNKb92La07aNj8HHTyX3j7VUTK+r5Xp
	 y3eykGkSOl+GeO3F+StT85aDy/ZqkQiM0vhz6Yn3/3aNQ4NZrv+Bqg3iYu9XxdrkuTmLX
	 JXxquyA3CUTCjCyqmaeHQaq0U9K83t/I5OYbl0wCs0PAvJcvDXbHqbi6YGMJdqicNZmbl
	 sm2KSwqBTWfgtNOGNjUHobORQfQl2twl+sEJb/4xdptuylWqOL/qiudzUxXOJ88ChKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+d+2w/kP1HSpx1Wuo82bePoixwqF95UhUQrN/Uv14yk=;
	b=1gAfwWL6NAa/eIZ+MpCQiXwcR0Jryqu/NRjiAPq1iEGnKG1Wl3PypkG2mjPsDUViScQl
	 8Oojf1TL1x46lCGH/QzlXfzcDu9lLCswjCjzGzCDfhgPxRvOggDPhHkmyAS9EFTo5vo0L
	 Df5TVSMFKRH41ZQgl8xytnswf+hBEy8972+R4CFxXbwHRXlfe1eQysWq++z+0tmjPxuCt
	 D/1pNbLOMYjhehigioOZFxKjBd6Wt81C2qu1BPzYoood1RP82v8BAr9/Q2+r0owYVJ/9k
	 uuM2RuNRbcNQI9t7iVprX6FAwR545Ro/KHWdZwI8CB/WUIW+H4D413ufJJUv25ft0YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fltq/LZE";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3860A6F63
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B3860A6F63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fltq/LZE
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3ada81853so4000144c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492093; x=1795096893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+d+2w/kP1HSpx1Wuo82bePoixwqF95UhUQrN/Uv14yk=;
        b=Fltq/LZEr/fWUfnOsLQk6D3tBL6ZwkW63axHxR4iInnMNMChKAn34xiYZVdxZKTlRh
         VDpd/AZSpMzwb1jhHKccGpEfSHEYqrZZahTrdQ2xfqwsoS551lXHebGu20EnskGqvvFU
         7lgRPrHpapf6MuewHtr1saEbGU48WaQ/xl8Zd6hI///4zoXaNi27V8Tkj1gCn0Nt2pyH
         iVDiH19P9naDiw9ofnR2Biro8pMSkqT4Hum/CsALabzVDRvBOAqK9PcodQyx+iGl0v6w
         lLbhTn4edlCLPyikLmFaBtVMsATzVfS9zBmBKH0IeYMhGg1qcDQt+m5RsffLX/Gc15FZ
         GRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492093; x=1795096893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+d+2w/kP1HSpx1Wuo82bePoixwqF95UhUQrN/Uv14yk=;
        b=IUhcEHXG5X+F1IJs967df4E3LgoeIRi3TbzvIkJGbnXo4IZbx31EC75xxh5XXofIIG
         YxAJS7GIbjsQoerkdFnAOXBDy53HA1ZdyZyurhx3LwORaxUeflMO484JbwUh2tFsgu8s
         52YXoSLf2W5SWHUBRbpf/G/2tGF+xt8eGxBObq5HBDEmeyNcVWneVj6bVfEZ++UIsgOP
         xMa0F9euZABEvvywid/ik9RUC/APtMLgC0nd37SPhv8AAY5wRI3E9IVoN0436cJFmp3I
         X1gXnqNI4zC4w46j700XZXs89ttWEWBDHQrnhAimsvH4/2arfWZysz/4Z72p+hJqD8CW
         /UgQ==
X-Forwarded-Encrypted: i=1; AL+hErHhBMiZKh5Ykr31asgNKRP7N7KVY4CoaKo90sdy35BKWo3PvRZP8+kmI3dVEoreW8w6FJWkAr6u64itiss=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rJWDV/NS0H/OR8YGt2ZVO2vlRQ2t12p8mbhJS4cux4HizdIa2
	hwYirEdOcE6updS2pi8Le5HEFCvxoyklYAk2gVnHo7KtRxFQ4JUVIIWd
X-Gm-Gg: AYBFou25rSMpDtAaR2G4fNuF7w/Zy/Acqv0lMyulONLkUq+PXlSBI5+FkL2kLiD3au/
	NGnaBT5yG8SyMr65qsNe3Ug+p069uG1c17W8yzNnJazS+7/8FeQdxQu4Z+VzzVR+LM9+3F1iljC
	HhgHtJYQXVE1vWr9sPCPViW3tEvbID7wpjGgqK+GLygG9m20RyJ5pUuIUNH59ut56xgtEe7P3gv
	D+nm06adNtKTxMSX/pnmbCd9WfP6bjCVpDshtt4TN938Bm+2H1NlOMgj+Sb/xoiekRMUIps9t/f
	N3yP7Elhy+fq3pKBO/xGTUGHrs34oV7m1iGgaUDv2Y/C7kepqMZaWn2ILeQC5dfqXW44Nd1VEYI
	g4QN7GLtfOMixzJvAlIAGK6HAVgYEmDp9nvEKT9NVZ9I6ktLzkp2h6/aL/3/p956GZhIkZKLgnt
	OZCn0AGTZG5qHVNJNdwHdMTYxcPUYgWoPHdS4uS9wDHY7CocIc4GTu67XX7V+HSVvbs3dAwkb/s
	S35zj+lYgLyvjxlCg3Z627rSYkjjzclOPnh9mvgGz7VDd5h45ipHzSto7B1OG2SehgTxN+T4Q6Z
	SYdhZvwf7Ckv622AF4rFShuJyubSWVKd9DbaDE4LPL40+Yvxh2GgbMLfkzXT9pTfmNGQp9zNoyT
	zOLzC1Rz/xYjtznjBF22I7FN4VBDu1Q==
X-Received: by 2002:a05:7022:c93:b0:176:a225:e364 with SMTP id a92af1059eb24-1b3c0342f80mr4576641c88.35.1794492092808;
        Thu, 12 Nov 2026 06:01:32 -0800 (PST)
Received: from AHUANG12-3ZHH9X.lenovo.com (static-ip-5-78-56-61.rev.dyxnet.com. [61.56.78.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm31478659eec.19.2026.11.12.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:01:32 -0800 (PST)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH mm-unstable 1/1] fs/proc/task_mmu: advance seq_file position on interrupted VMA lookup
Date: Thu, 12 Nov 2026 22:01:01 +0800
Message-Id: <20261112140101.647-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
per-vma lock") introduced the possibility of returning -EINTR
from proc_get_vma() when the VMA lookup is interrupted.

When this happens in m_next(), proc_get_vma() returns an error
pointer without updating the position index. Consequently,
seq_read_iter() reports:

  seq_file: buggy .next function m_next did not update position index

The above buggy message is reproduced by the following command:

  # stress-ng --vma 0 -t 60

Update the position index when VMA lookup fails, as required by
the seq_file interface. Also save the original position in
priv->last_pos so that subsequent iteration can restart from
the correct address without skipping or repeating a VMA.

Fixes: 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under per-vma lock")
Signed-off-by: Adrian Huang (Lenovo) <adrianhuang0701@gmail.com>
---
 fs/proc/task_mmu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 22361607020d..164b4efc5e09 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -221,6 +221,16 @@ static struct vm_area_struct *proc_get_vma(struct seq_file *m, loff_t *ppos)
 		if (PTR_ERR(vma) == -EAGAIN && fallback_to_mmap_lock(priv, *ppos))
 			goto retry;
 
+		/*
+		 * seq_file checks that the position advanced before it looks at
+		 * the returned pointer, so an error return that leaves *ppos
+		 * alone is reported as a buggy ->next. Advance it, and keep
+		 * last_pos at the pending position so m_start() would resume
+		 * the lookup from there.
+		 */
+		priv->last_pos = *ppos;
+		(*ppos)++;
+
 		return vma;
 	}
 
-- 
2.43.0

