Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29A3839B4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077671; cv=none; b=dt7nRy5QtukCr2SBUTBp+ucCZjDVAE1o046JCOdwKDyFAG3N8jrCUOv298xCn7pkVxqXh0iPJPU9SC9/QnHM7n782vrHhc+3YFdEdxUbz4IcVf0Kpd/XnJ0jeOOBhQbRxDN7PO7mNUo2Xd/Y3r8Y9qjg962ZhpCFGiQgLL7Hn2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077671; c=relaxed/simple;
	bh=qGDPLRSzCRXB3K42SgeFJHX221LQxCp5VEhaudg6mc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdEayisFL/VPg8q5t/OrCY+JsDX+qmyOO+FG7HPuhaTjdw2gpWXgNXuOPdzZYdkp45cuEYn26uXEm14hltIh0Dag8DgEa4mPQgqUeBqmRMd8JYsdUDYuK87F1dbFixwgcbFDYb+q79F0Ys7rqZNRPHjpjKSokntBOzACuXgn5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aky0evdJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aky0evdJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1601871a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788077670; x=1788682470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmBdbxLkPCMqqCoIfbI1P+SGexuVne+9G0JiGE+v1Dk=;
        b=aky0evdJlS3G2g6Of/ffL1AlKTd5jO5pPQUSnU5bruju4Lsr4LcpvwV+ietRwqRj2L
         WIGuZflNU3GY+jnu+eQqcQQxY0VgYpqprK1upcw5SrGScqiyXYoPnlUdTpkNOH5B5A13
         IcYzUFQwcKpisCLXBx/J0V8QUxb0777EP71sKQ8/K5grU8oMef1zDY50tb2Y6/18xXyF
         9zvO4+BZ3fWF/d79UZ4G12wfhB8Rbjm0y6+57kaB7eiNPjTn+owlReNcd4pRilqiGZn7
         RxraJIEKcghG1HcjvbqJHtkuUpMHqXjQxblOBvt/pGTk9x75UxBDOlaPduMG5QLnFX/n
         J6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788077670; x=1788682470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmBdbxLkPCMqqCoIfbI1P+SGexuVne+9G0JiGE+v1Dk=;
        b=aIBbO85oW8QpfvZbJ4vbEkYguOOZIR82zeLserLCr7VLYYghszfAdFByvNIiuqSZFt
         lAbFbgsOMfmDmJs4bXBea+TkqC0qPtdHOrLaPBLg5eEJF2yvRDZt2rcpC/4FgFKQU9Fb
         aGwetFyED5mZchKf2zyxZba5xp1Bp1EpodZUfOZmWTiB9HCjUmxYjoprnvArGbByHPjy
         RzacUgE0zvLnPQ8tty1yfsLn5LpEPokBBvKBhNLnE7c0upLW01LukJxO6KrthhxdV0YN
         7SHKq4cioJeIudFMGVxR3xXVeWYvs1TTqUNM1XwmLN81WjitHpbxyP7M1SEMkIhsA9E9
         Y8nA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9MHNrqUyGDUu+dX9+d7CdgMy2tAHFlymszFCy+qNzoe8tPOSKLC9CdQu/guC7bUq/PxtkFv3y2GY5xaU=@vger.kernel.org
X-Gm-Message-State: AFuF++lOJN6IxZWHDAmIXKAy+WBUULFn96WPuBrhs5UZOlQV+GRJguS6
	H8rIhBFsTQ8huwGb0K3qN/Mzm2NSjPw/CoZ04NxjxJvB/i2K+d5h/PyR
X-Gm-Gg: AR+sD124Gu9SsvXqmgJW/fafbNyEYsAgJMDelRDUnie+V2KY7cODCoBVJNBkjVrLd+W
	ynTiiOBOZ+fkGYGVZKhrofEJNXYc6lDpgVFI6mbH4uRW5woCBhi2FinMHU9LM3kj8tPJA3671MN
	lYgQuyhzrdNYxxGX13Z7lxY6DN5G6uWoFk+zK+bkuiCVry9suaF0TwOOqVybPBnETfp0txpGUan
	PI36oJUNnkqdp1eD09po+oim5jN/93S+dylgL/QYwbDppyF3FIeQAjRzfvUg+r4XKoq/qCa0OBv
	RY3aAv1FLNMsTTUMle9CjhNgWB1EUQcwjiKqRUuF2+CBudcSZqtDIJPSg34LD7qIg3PnZ1fYR5K
	leHNeNSOFURFBe4ImUfCoQRA9pke1XFqSuHB98nAbvy0/cQUp9KfXZnq9B9sPvl0/WvBdgksTd5
	dGA7SLRWKLmzzdY7vrhF2LAyXemj4akL09zJQE7X7Rv1ppSI/xKDIhXXl1TNiBQ2X4
X-Received: by 2002:a05:6a21:38e:b0:3cc:917f:f302 with SMTP id adf61e73a8af0-3d26784f3b5mr32989509637.9.1788077669650;
        Sun, 30 Aug 2026 01:14:29 -0700 (PDT)
Received: from Default ([2409:40f4:101a:c47:80b4:fa67:fe3f:eecf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f656dsm2668627a12.5.2026.08.30.01.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 01:14:29 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: jeffinphilip14@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: Re: [PATCH v4] Input: atkbd - fix uaf in atkbd_set_repeat_rate
Date: Sun, 30 Aug 2026 13:44:15 +0530
Message-ID: <20260830081415.15187-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <apMJ1qoPOffbB0t-@google.com>
References: <apMJ1qoPOffbB0t-@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 09:34:48 -0700, Dmitry Torokhov wrote:
>Actually I think I was wrong and Sashiko was right. I will probably pick
>your v3 but I do not like that we do not clean up/reset LEDs properly
>on disconnect.

Would cleaning up leds cause any weird issues on reconnect? We could reset
LEDs though. Compiled only, but this?

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 41a0d55dae0e..3d0e58be5ba2 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -963,13 +963,16 @@ static void atkbd_disconnect(struct serio *serio)
 
 	atkbd_disable(atkbd);
 
-	input_unregister_device(atkbd->dev);
-
 	/*
 	 * Prevent work from being rescheduled after atkbd is marked disabled
 	 */
 	disable_delayed_work_sync(&atkbd->event_work);
 
+	if (atkbd->write)
+		atkbd_set_leds(atkbd);
+
+	input_unregister_device(atkbd->dev);
+
 	serio_close(serio);
 	serio_set_drvdata(serio, NULL);
 	kfree(atkbd);

Thanks,
Jeffin.
