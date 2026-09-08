Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4483306B1B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875639; cv=none; b=sISZpqjmoBUxgJtl8lUQ8ngrO2QmJVLnPbE48W+CJgvMBhQBJMxFj3TAoEAuCOV/RakEZutj9Gx5ArxQae7jtzZOJ8ByPZxIofCMvHAAcCWCTTyuU19VS88pbV88UjKmlWeRDMt/n2f2sfdLqTD4caAeoy0dxOd+onURpegtjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875639; c=relaxed/simple;
	bh=oxBm833C8T+jxHgAdbU6D4xcv4E4TYoli1xZPpTW0yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eUn0OabgpJZ6OnQ5apNnkLtv1Cfb2DAdchHupE26KRdCTAJ74/rGA9xsMi5CzEIxG2wT+pPuIK0lny+G1iZlPgOQ8xh/oXhJDdB6gKWdhbkajHjjGtLT8fdjMHoYHTPb/grSkyJuhOwLHQH57V/ufvuwpxSqXgydxwH255chVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAHKORM0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAHKORM0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so44989095e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788875620; x=1789480420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=UAHKORM0kC+yDLTSBDKwbIQHuzwkDqVjvc42Yc6/BTSTCwsUv67i+8lEy5PTHIWD/E
         /df1MkiUKxs+pUqsEp3+N0RWfnDljX1cL5QxRJjY4QUP75BGcx52Y0QeOvaLR1bPGIA3
         1tJkOHtIc/mZrIvrTL0idEV5z0njd4/bRq0duTX9hWBOTSTGmDoSFTzRdfWdnNbDY6oW
         qW/+d4Nvt/LI9Y+9LuS7czfbGRWvRLp9dxkq6h9+Zr3rmSvUqD5lDni3v+RDcVmzGXzg
         0zs3USCCPY5HZJF6ciPBUX+sybLXimNq7cCLS6IHliS5xy7+RQZcMcUdkU6GpHwQrA1z
         GpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875620; x=1789480420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=fqVr2OtEgEnlokca2IbNu454Ecs7R0hkSC4NY8585dm3UMmuCycu4qF/8rf7NGeaZ6
         irdsgD9ueYYgPzBZUA+xv2XWP/r4LmAb3ZJQzOZ88UiromkewHvOo2krUPcP2taId423
         7k5VesslRUImvu4nOSVsiv/U0I0bNd+HDazAoGsYqDqDFE5ki3OFtk0qNEvNmHK4Yba4
         47KLqu3UaJC6Nhrxlq/N55NWeWkaKQy63G1Zbp22nWbO7Rp2zcSGvucxph9xPHT4vJo0
         W9ymY9mqSo/+JOXeSDr/jgIb9AUBJSWqwR41kKcjtj/rQNtW1I157gV/M2IqE6RD1gTD
         zSZg==
X-Forwarded-Encrypted: i=1; AKwUvByGG0ZJKjbIrL+KOPXuuzHnXTMCMwJqVjpuaOwMpA0gsJvSCENb7/pa/Z30brYItkJZb/7dWJ0y0BW7ZPA=@vger.kernel.org
X-Gm-Message-State: AFuF++nagAosir9K0UHCAhUeMiALVcDA7QGlzQ2SjuvmNtyndxR/3gA9
	pDD+W0t6wkBdvRfK/z7xdXC1EyMRjAwZ4ParMo+K1yuPWLWgmpA2xJzN
X-Gm-Gg: AYBFou2XUTu05+u6NAlZbV0DEm0diS1Ybo119AOecrukBKNNCPs8wsxctm0m37wQ8KF
	feKFEKOMb7klwwHupqgGv4tyXdgMu0Drte7xqinDm9nduxDgzmK98zWozHk8Vb2An8+55bBsWZw
	iy5RA+zscZ7k8h59odU90Myy/mUNjpRyHFsqv+JLZBcOBX5spxAd9A7dpTcMitt4xqX2Ahqf7UG
	g2XmtqjWSWN5QRBTBEQRhie2iroIebX7yqD73IQAG8zlCtXCQQyJ/Oc/g+aLNPQxq6I4l8QehLv
	tfq2g8fQkI76S+JFNqqEwXRyXkpicGtPRFw2OgIuk9bwKVy+7SIFRsM+jP4SIg4MhA/R2T3YSIM
	n2sc0mVCc1z6tb+Io91xECmNu0PtlKh7AERXJ1Rjw94stnm4rFcewhR+0xQL0f/58aooN6pX8Qa
	AhAQx53lbhf9EtFa769QgXZQ5DQyKkQyFb0CiYEpuoVpEgEghwkCECVbLGql6cgbrWxJsPOYY7p
	zAoTBff9rh4
X-Received: by 2002:a05:600c:4e51:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49cff8db5demr513325935e9.11.1788875620062;
        Tue, 08 Sep 2026 06:53:40 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm377235005e9.3.2026.09.08.06.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:39 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	andrii@kernel.org,
	ast@kernel.org,
	brauner@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	kpsingh@kernel.org,
	ljs@kernel.org,
	matt@bobrowski.net,
	memxor@gmail.com,
	song@kernel.org,
	sun.jian.kdev@gmail.com,
	utilityemal77@gmail.com,
	viro@zeniv.linux.org.uk,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next v6 2/5] exec: Clear bprm->mm before dropping its reference
Date: Tue,  8 Sep 2026 16:52:59 +0300
Message-ID: <20260908135302.74963-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908135302.74963-1-tasos.papagiannnis@gmail.com>
References: <20260908135302.74963-1-tasos.papagiannnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once mmput() drops the final reference to bprm->mm, the pointer must no
longer remain accessible through struct linux_binprm.

The successful exec path and the bprm initialization error path already
clear bprm->mm when ownership is transferred or released. Do the same in
free_bprm() before calling mmput().

This is required for BPF kfuncs where bprm->mm is either NULL or points
to a live mm_struct to ensure safe access.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
Reviewed-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 fs/exec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 745f6eb5279e..4ddd403fd91c 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1456,9 +1456,12 @@ void bprm_drop_loader(struct linux_binprm *bprm)
 
 static void free_bprm(struct linux_binprm *bprm)
 {
-	if (bprm->mm) {
+	struct mm_struct *mm = bprm->mm;
+
+	if (mm) {
 		acct_arg_size(bprm, 0);
-		mmput(bprm->mm);
+		bprm->mm = NULL;
+		mmput(mm);
 	}
 	if (bprm->user_ns)
 		put_user_ns(bprm->user_ns);
-- 
2.55.0

