Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4F44C513
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921687; cv=none; b=LLQ8iGJt+SKi872eO5PidRmgboxMLhVTHzqLdJ5xIAfyHYvX4N2U2IaOiYBjcy1OQ8LRsr/umE+WhyAjmc35CkT8GN8qytIGPhE5KuMnenmGD1hNoJLsx4Szq59f0t4oBfQCqt+wtK13dOCJ7OiF5A1f/sIg03bAuiz8oVn/Kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921687; c=relaxed/simple;
	bh=wc+vvhQ+dNmyiyK6AVxTIJHxL2dc2ZcZe9QfHmSZUIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRABGJtS3XvIvymD/WiohOplsuLdqFTMZwV7qH//wvjgPEValnx7l80VdtWRIL9aeBLdgZY89S5epJqyn+GkYLYbmgLAoxv8l8IvdcVDhlmepzcW9FsySTlMDKinHhwRmQrsUFiqRVmVUkjFab3X43OJD5LfM3oepuGmlgS6COE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMI88nze; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMI88nze"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1253519a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787921685; x=1788526485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/VYSNIA4jxHryEAnHq111uwk8QXMnh2ArI3dQwMk8M=;
        b=LMI88nze3W6yNjIZFdB9lRCJb93m0gwTAgk/fWO3AyBmjJcLeNMjGGN5SgE11pu9Bc
         AN/sJdLPpTvPaZaZRhI0RuYF/vId6HlqwtA1PbYLF1TQHf8/v7/Q02zxiQx3wxLRxXA/
         uPrbFp3LC9cDKVyoVp7L45feor/16yIg/g21P18LYdSq+4TidhnVCARVYRQxoBszGqCW
         CQpBxkhJ4g2p9A2pbImBZ1CbkCN1dK70Ck/cCjrI/+VCPqwZzGTipYxLdCLk12mvuiDR
         6pziSXmdD8aE5hLGyhUnHjjfUKwALGf0hRqBsdCxVb8q8eQPTK7BtH+nZ7bJYMUbwVO5
         CSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921685; x=1788526485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/VYSNIA4jxHryEAnHq111uwk8QXMnh2ArI3dQwMk8M=;
        b=iSpx6MizZcHBBmIDvy1O8VF7G94oivgdSIvDJDVuF5bC6KiYsgrNNPnLRAia8JsRNv
         MsGmUY3I0mLCkn0naJ4uIk+MkvNoZoebD9KMX6702EH/Z4y87AOL/TxwktcbUbYkcIkR
         Ajllw+TsJvwEibEnxoFvdlUdhwC/R6JfHVIsd/33v8SCj8a3TGaFebfNB5HrtZjGaWF1
         UEQxdM8a1NJoA3jvwqYsC1nDwS8FpwI6Z1vi6AzhBohjUhat8AJ3RLsXuUHTfsW9bsJg
         Hx9sCT3VBCHPzkOXBiHDLtx1RKhIkR4O98G/Q0UZQ90ieadSDmh7jvoXveAV+ZeR/PHR
         iAnA==
X-Forwarded-Encrypted: i=1; AHgh+RqAS6fsMS3KULMSkQJmvrD7dSmQNLa7EESXi3Lr6krd11N9P9bO0QDOSc01YqP4XjNacr/8GLkbzYntXfw=@vger.kernel.org
X-Gm-Message-State: AFuF++lS5d+INURBgeWHGB8eVMM1vV1PUV/m0Rg7PWIAJ+08CZEEx1Av
	fCWJ9joOXcVrqz+kCUrts6Ka8m/37QPyL0vYgmly6SP/cya0rG9rLoF9
X-Gm-Gg: AR+sD12BiiDQ+zVA0c8tOaNM9hpwWIiCOR22fGS/Pdv9ftyWWOm+1dxHJ+DyYti4CRB
	JI+e7HNFtmn8MpuIOkCXBFpqzuT97mz5rNLN1N1isrOrJtNFcB5QFX6JdsUwR+6PWmAZaRBlmIj
	ahGpkZziRNr/iJSxR57HVzubrWYO8UrhgScc7m5La8vUqbRtr1D5TNWXvxNWMa14SyLWgjXItrh
	+LoLWrvQeVmWRCt0kF6bLIL6rweJCvNushJJRlKhuM7neYHJfGSQW0iF/gEiFy4/5xSdWZqzRku
	UUkba0BRDPzH4MEm4ZYnXmqHIgafu4z3AQpahcA4g/G5C3lykLR4J9S3BYk9vVRnNpFL5447qQx
	hXqzYM0xUovJP+djMVyY6ykfoMvSP1wbeFpY6RavzBE1cpF8ak4uZhe7mw9hfNrnYxcZpAoi9VR
	29Q0gmWcbNMHapkAwcAYgUlWGJPOUPohLGSdOXzXo9cmRK5Sv3Q24lAr+5GSYoffwT
X-Received: by 2002:a17:90b:440c:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-396d0eab08bmr13666774a91.6.1787921685323;
        Fri, 28 Aug 2026 05:54:45 -0700 (PDT)
Received: from Default ([2409:40f4:101e:9d7e:7e26:7b81:64f6:f32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm5897027c88.9.2026.08.28.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:54:44 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [input?] KASAN: slab-use-after-free Read in atkbd_set_repeat_rate
Date: Fri, 28 Aug 2026 18:24:30 +0530
Message-ID: <20260828125430.11470-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a90d9ef.4d659fcc.734b4.0019.GAE@google.com>
References: <6a90d9ef.4d659fcc.734b4.0019.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5736f4bc5a50..056aa98f13e2 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -706,6 +706,7 @@ static inline void atkbd_enable(struct atkbd *atkbd)
 
 static inline void atkbd_disable(struct atkbd *atkbd)
 {
+	guard(mutex)(atkbd->mutex);
 	guard(serio_pause_rx)(atkbd->ps2dev.serio);
 
 	atkbd->enabled = false;
