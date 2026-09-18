Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC14F55AC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737509; cv=none; b=BEANwz0tpgl4KOobZjB+gbytpXO6XioWaMgVSGinzF+NE44Kf1AgjU0L1n6Cxi759iudQwF4kkej6KhYSzFVx8ZZEE5zAMUxf1Lt6gmPkeEUkQKzf9iLcjBR0DjNRrH1mPOYJzITPenv+F6cF6uAAKd6DpDG7HlDD7qaUhBMFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737509; c=relaxed/simple;
	bh=oxBm833C8T+jxHgAdbU6D4xcv4E4TYoli1xZPpTW0yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mel5p5NnRm93J7OBVJ9mi3Jhwqqlxbxw6yQ+gSp2bDc1F5AOFtkg6wzvj7CVlR/2GD+CpZJhvlR5VcUpFxUYKeeCM7IVwQPcjnceLcj9xsWXjdN5iX0szLN5mffaVNJOs7PlNWCxeEq6Z30eTIFOkFM+9AYd5JBKZUy9Tm6ik7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTaCcuRB; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTaCcuRB"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so383362f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737505; x=1790342305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=DTaCcuRBPvPuYFBbtD+F2d6f25YKCbNgO+WTHSknWaLBGXmG2OpAVMuYbRsYynbO4p
         hU1O+Ft6/couaczpum1O1Irmi6BiCrWLwe3JmmzyTSmTnWbX3OSF5cdAhQk+Zq6w8bhV
         xU8QUQHZdn7FkIZ2bq2vht8ZC+ZWBDppbH4mZIQqgdyhfcOPRcLsCxY09HIs6SLsLX0A
         SxOyRv9mpuBNhWkhejOxIHV31BjEzumxFZWoq9FL1AYU8q3Bxk7bQFzGkzVuhnk+Mb3H
         MGnlvhPWbb7Fu1CV051czmm0c9C6u4OZdr1w/NJm3TYVpqVwjv1H4C++LhhdUon0Ra+7
         AL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737505; x=1790342305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BcITG13Gvl8i0HA4g724jWVmnWns/ceZ5ECxTEaQlok=;
        b=sszSet4LEaZBMEDlfrgzX0NOH3mu5uxdA3MGaJwa2ZERFJ0OIn6fuqtCaVhC2zboil
         uyeDYKS6wY5D5qaO3WThypI3WXJF5O6Ee5gJI3OO4bgev8ESbl0pEeuCPGva5Q1GOSo9
         bgrC4rc8ziuue+oMX/5a+mCH9S4Dm1+mHHbUs6Rc2kXHXOWg238FsmPPg8jQpp+BcrIR
         3cGqVMdAz/BU3Rvrel4sL9WflCU9eI8LRC827owfmISnLpRURw8Pz49GFwJep8ubclWe
         taRpwvldawhYuDcaCJvVYeagilVfEt9KJPBxeBDK4CqPu3Fh6WPBAtp0iuHmvOMlnqFQ
         1hPA==
X-Forwarded-Encrypted: i=1; AKwUvBw8M0OL5FWcCbdQeC/QlpivNiJsuEdj4KvMtkjs6j12ATl+6F6u8pCZonnFJ1LH5gD/wO3tqITceMqg4+w=@vger.kernel.org
X-Gm-Message-State: AFuF++lDunbARaGLQpqNeFyhPztBMKet/JH5lKNDwYVuIncRoV3yn3pW
	L2Bfv4BeP5Emin3BFbbZGeOjHQ26hutKDTfM/SWFcQkuGxH6Qcy3ChWP
X-Gm-Gg: AYBFou3ZpU+L2JU6GbGnCktzti7QAmO8A+4NdaRP4WdTyKuyTeT/0jOtQVkl86C4Zrb
	L6GrRsr1eCknA2KA8AvTASeoH7pdl6tByMyQj/K6y5VyPmhs0gzACwPEGsUV/I86jy3S6Acr8c4
	zd6nlA6TIuItC+oA4prWySoE2VNxuZ3X8AaELQ17maiCPEjWhbEgd1ZD9x5Y2EG3ICXpbYcBxjv
	NZK5LX/h7Jj1gWf1S6P3LTg1XCP6cBugq0Z8jzItrAxHWz4fInMjs40YnefUFQWMZ9fc5vrm5fY
	9e9+yVdJ9PUMTwtCDvv/wu2HI2VvjqEj0abNyL+yurfkCIiil6tx/VV6P+uieoyovmQatJjbqF3
	xb2ky4VMVy+lDjBxPQKmXNuh/gfGGhhPHG8EVSalwqz+2gitRZxydH51f8XDECXGHRbfUF6nxYn
	jceut/dCenagDe44Loyz/+3lD/VZx/nz1lRvlyhUI37dGgTF9xP22aBqnFOMbdf8rbHqiVZ4FiK
	FVBddGbPxj3qnb3fFFamVEKKQ==
X-Received: by 2002:a05:6000:490d:b0:485:8a47:5b91 with SMTP id ffacd0b85a97d-4871e36cb87mr3143383f8f.46.1789737504555;
        Fri, 18 Sep 2026 06:18:24 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b4e:8500:290c:210b:1c76:5710])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5de3sm4424549f8f.1.2026.09.18.06.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:18:23 -0700 (PDT)
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
Subject: [PATCH bpf-next v9 2/5] exec: Clear bprm->mm before dropping its reference
Date: Fri, 18 Sep 2026 16:17:54 +0300
Message-ID: <20260918131757.42802-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131757.42802-1-tasos.papagiannnis@gmail.com>
References: <20260918131757.42802-1-tasos.papagiannnis@gmail.com>
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

