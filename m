Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D114B049A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622345; cv=none; b=dcK+pbc14O/yvqY+yIXH0jm9oskEvz9TPtaDfkm7wI8sSshEzzxfTsrybdcuZCksmkrDDfXBww4FgpduQvxGp5g8AhaDmUV4mfwl2MLb9EKE35VpZQ1I48J5iEefvaXortVPbfVVMeHQ9vA7rK3N2QIQRXuQeZmkpAPZHytQd6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622345; c=relaxed/simple;
	bh=6YThDBqiSnOzgDQZx7p+y+CYG1xm83DfFpPbOppHr8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPHcNtSoV5XAwXgWd2aoBVgftdSF3cZCLfk6QLcYQw2tllt31j52g9OJbtrVEvovdV6fFNQEO/8dqC3thTp1keFozqmNNI+MPEvKBIFp8PqLVBZO1RIXMJa74FVcLNIQphF9wIXo4dE5b0bSEorOaky4v9bt1CCmgsyyBTaWuqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoZSAxqS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoZSAxqS"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceab75934dso19155155ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622343; x=1789227143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvfomyvOKTuvngpY/hxeNfz5FMbtqTR3RJdLKytrsyE=;
        b=GoZSAxqSQPQpefwieTcLOgofmSKQYj+VX7NnwCA9G4LbfOQeqKzX+6N+ZZTblXou/4
         ogcgGr1g0GeWaSkfL9NouUd8H2g6BkLTpfPwp1mo1S25poQ9ar/L48pEQzPJs5UZtXOk
         hUzgCh1fxZ1/PvRV/zHm0DB3aJd0jBKdt8FfrZWuHHyD6nXldOYuhyZlhMiG2Omg4X8C
         bbIxK63Auvlu00hhy8JksLTE+jMChEuWWBUB2h0TFFojDBSIu7mFKrnI3bc2nKjujt6r
         +9MkAjigtj+RNGg3VtdIHH9QPo8kD/LS1yuL/TG4dzdEkBugjKGWWczic5Dk2TCKaxYT
         bXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622343; x=1789227143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvfomyvOKTuvngpY/hxeNfz5FMbtqTR3RJdLKytrsyE=;
        b=JYldl/4WRv5N8/Wpqd3WmcdW4WxrKcJr2iWGpUKg3pqA296PRyG7eK9ydO3OE2kzsx
         D+jR9vF5RamOpQZzeOd8Ttv4o+v4Xl55uq39o0C1JItn+VXeBrPve5qqU6bboqqIyFd4
         r/yWPJvuFKxbtprbO7BUQkMtcCg7WMl27pdHORPZKnPaWJV3MoLq3yeMXwuPXwfRE4ye
         RRCWw20cZbEdmRNmya5b7FxwLpIeJKRcncRtM1NMAqO1wdlZuOG2KlpG1tX+Tf9ksjV0
         oNAlGIeHZyyfuiclmOY2Rov1yDX1aNoSE0VgWczJqbOUTQU5Ps1WqLZ4JRgnQLk3rGDj
         Bbrw==
X-Gm-Message-State: AFuF++kt53BSIvZeSEC83w6QGf3b0baOaG5FO1BMKJCrdrK666HvKVgt
	7eyRtZ/0KYPza0DNns1r0JXZ8P8UMO7R2hJt8HtPwGA5o5Xad+sOfYApOaNnvA==
X-Gm-Gg: AYBFou0VAczwTmuBkynEmeRkabs2o1TR1jrYTgUsP+7cgyBVT5Y4GsrkRTiMzbDJTOS
	ckk8dSgWtnJPxJ0Nu3LjNSZpU7G/VKebwfHuQuy+nIhoqaUCqket55PH2bQJ+F00ocr00qOFUUt
	qtX/uyal4yqjGpl7IfoQ/4Dh1RxN0M3wNvnNZzv/RmcAHN83rHwhytUOwclrP7WbueNvgj+Qx1w
	r1SDHxSCMpYPp4KXEzVmhweBL7Z1eu00wrTfZ9NP2F/pl2OjYuiI6+X33+sNbXoNSXGltyIlB/I
	4ElWXUcL8ErBI60i5D5sCjsydVL1qxPjSKZXLgHLPhZp1HtjzDCHkJbvXKwjftUOh7LscGLP19a
	ZSOk67fsT1V+A6hQku7s+dUlC3uAkND54z84QU8T8nFln23g5uR8Xq3s+EU0acASdGwduDEdZ0x
	NlQJ6exeNNzXudq5ZrLlRu5/Dr2Zf3As3FQVKMl0jXDWIrc0QlJUmoMby9nKDevbG/Py0JcRjbX
	6hIwM705MtTAcDMaS3hgN5l1vSLSvOfU2oH2UKPdMtqqCioAxRl6h7+lqe69hh0meWQFOfbU39s
	zg==
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr21121113a91.20.1788622342693;
        Sat, 05 Sep 2026 08:32:22 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm16658688a91.1.2026.09.05.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:22 -0700 (PDT)
From: rivaldihormat-debug <rivaldihormat@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: linux-kernel@vger.kernel.org,
	rivaldihormat-debug <rivaldihormat@gmail.com>
Subject: [PATCH] i40e: fix integer overflow in i40e_dbg_command_write()
Date: Sat,  5 Sep 2026 15:31:55 +0000
Message-ID: <20260905153155.2252-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: rivaldihormat-debug <rivaldihormat@gmail.com>
---
 drivers/net/ethernet/intel/i40e/i40e_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
index 0b52509cb14c..ca77636bf3de 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
@@ -722,6 +722,8 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
 	int cnt;
 
 	/* don't allow partial writes */
+	if (count == 0 || count > PAGE_SIZE)
+		return -EINVAL;
 	if (*ppos != 0)
 		return 0;
 
-- 
2.53.0

