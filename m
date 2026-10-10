Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBFF47F3BE
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630964; cv=none; b=iuPTg0xDsrrfuADkO0kLPNHPyjcQoinLnm8GGKzWwt0QLwN6uxz2pLjusLXaRXofps9iwkOEj8XTqD0b+3wgQipBflS2Qqg5aVbJ5v2gOgC3qdzEh8jNdadA7L8FWS1gF0xJy2preW8NivDJlB7qUZ8s4XRs4VRB1XhWl/3RhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630964; c=relaxed/simple;
	bh=5CzusKcxVyXaR3QsGDMDR2qgmjRv/fJBLlwlaaARS3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXxoPejHJFmVT6pVMT3dumnNsDqHBzVT9PpWDztilPcUqPWXX/Xo0WLaQhP7b+bjoD6UAMdzFCzbCIXlFmPBxv6cN+sNOnDxUO8aLQyBXFRZxMY3+FOSDWfEfauR+ucJLnxHM4HNOckcKMPM1DwJPa9Gt1dsfUqm2r8L1AohpBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ac8a2ac52bso4266287b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791630958; x=1792235758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FLKHNVxY/mArmCUsnuC+Ob3WlxaCdcNFSgH2tcREQM=;
        b=GC4YaoL2jVUd9olI+refssRZ2NAqX9IKklO+e8rl1oOAjJDG/B2grOToIcyeLDkvo0
         eflc7anFLTt/84Ez9j9QJ6yB7JolQJD89ApwYW1PisaYAxPkCGbLqFmLgP4C72MJa+hl
         wvi2AAzX6WKJGubUtwrrbwk8LjzL+5WXjZ4qUMk9ntnsaEucEWN5ssSk435UrdbV6hLn
         44RT5Blz31SvYHqa/AK8uk32Q6VJd8PYHHsgj+35E3P6ByDhfj/u+qOsTckl6J53OL7M
         EC/bfm1c0xHMT3tAloBeLnoPJS0j/WV4fO/cKc32YNm9oX7cDmXVlXlNoshm8H0LaBzn
         2zGg==
X-Gm-Message-State: AFq9FYJ/9izKLQonD8NXz/yN1HwcRYM8f26uauh0K+MXWGCRQpqVdja2
	CWqBEzY0F6ACThtOVqn2bYGSrqwZjpukk2VkZxySyVMzWoKnAszCCN+gW+RVFdNAYSA=
X-Gm-Gg: AYBFou3U3eflfOMNKqVw83+enLd9N4sLkJMDE/m7YEywFa5YTJ5/hW2n5N9fH3q61Hd
	jy3H/9TzFlg62jhDwnDKvhwYDqCtAYBj2rue+6dU1O6uKjpldcrsRnztv4xgQhVObzfOtUZAVn9
	xCLUuGzNqQgs4i+NhAGdvlCQaQ6YuDuB8VQCrncBnYXt+kHaVf0rH5+FaTDbwNuNroVKgViCDGx
	DrQimhtfMawIPJYIxAcq5HcIizGwi7akSjNrt28Mjm7rniWnuPOpbh25T6rvb+MeHolU1iurDr7
	kswi2JKbKMuOhi5di0vxa28JFxcuh83rTiifoNw5RX/Krb4oVgxZyejyG4kkabEnVJsrIPtBmJh
	b1kB+YIEGOue+VwR3ilBa7p6lfOl5vsCysq0HW7FuxxbePu9THqBVFaubV5+9DkGj+VwGlT7O8j
	ZJRCI0KK/jq/BC94IiR+GM2M4ftorVvIIWs0MAB1Dodo9bgu5LeGi2rdt5HFfqrGIerp0iEgKMh
	kUeCPMMbyHRtq6cPQfWVUt6Hxo=
X-Received: by 2002:a05:690c:4990:b0:8b0:88c7:f184 with SMTP id 00721157ae682-8b088c7f2cemr9045237b3.4.1791630958518;
        Sat, 10 Oct 2026 04:15:58 -0700 (PDT)
Received: from white (bba-217-165-185-173.alshamil.net.ae. [217.165.185.173])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-8b07f25ae62sm17263837b3.43.2026.10.10.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:15:56 -0700 (PDT)
From: "Denis Efremov (Oracle)" <efremov@linux.com>
To: linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Denis Efremov (Oracle)" <efremov@linux.com>
Subject: [PATCH] floppy: fix the message printed by floppy_set_flags()
Date: Sat, 10 Oct 2026 15:15:25 +0400
Message-ID: <20261010111525.1337458-1-efremov@linux.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

floppy_set_flags() sets the flag in param2 when param is non-zero and
clears it otherwise, but its message picks "Setting" or "Clearing" from
param2 and prints param as the flag. So floppy=thinkpad prints "Setting
flag 0x1", and floppy=0,thinkpad prints "Setting flag 0x0" while it
clears FD_INVERTED_DCL.

Swap the two arguments, so that these print "Setting flag 0x80" and
"Clearing flag 0x80".

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
---
 drivers/block/floppy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index f04397b8e381..b6f73a11bff4 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4321,7 +4321,7 @@ static void __init floppy_set_flags(int *ints, int param, int param2)
 		else
 			default_drive_params[i].params.flags &= ~param2;
 	}
-	DPRINT("%s flag 0x%x\n", param2 ? "Setting" : "Clearing", param);
+	DPRINT("%s flag 0x%x\n", param ? "Setting" : "Clearing", param2);
 }
 
 static void __init daring(int *ints, int param, int param2)

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
-- 
2.56.0

