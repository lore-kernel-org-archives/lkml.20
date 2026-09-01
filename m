Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F5280318
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231864; cv=none; b=TwM0sYr5ZqLHumA7RtNN047XrrGKkXTboUKLln42iSGk1vcrtOP2xUrUja8tk3j8/Utrl2L7KbFFwdDC+E4YxttCQUq5ZdoBTORrsT8mp7fJtpsmhJqvDbi3cveplgmXsFGrwny0d4zof8sI8+iGSganQYESqCp+5P+HDg1oESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231864; c=relaxed/simple;
	bh=8Gpm8z+8NhGYa7LC6lMhnMuNA8pFZHPvWUgJKBCZ/uQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=Zn4sZpbR3WwxEbvMXFTUlC/zxFXl0XObjc0EgwY7pfOd6aThmhf41sjqKixxbYr24S2H/vPpy7IbxoPteOvxzJYIW/reI5Ec8OIgKrBETN2PHOP32wOOM3Yhl/xZYw3968ggEIwlETAyE6+xAQZP1+fOWviJ8Ttoe/JC/0u5nXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILgsEgrM; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILgsEgrM"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so5785533a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788231862; x=1788836662; darn=vger.kernel.org;
        h=content-type:cc:from:subject:message-id:mime-version:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EA63V7b38uhqbNEZXXddjk8npZBIzm9EJsPF2DR/LRY=;
        b=ILgsEgrMt6dV8IXTB9n3x97G0T0QQcDcX0Vhm/7DkVqBMG7MJrAizY/f15A9DKShc6
         el50yyyo+fjzzbXSM7790dbXfMFKvjmrHk1jH0zeYUo9lhrkrFFGg8qzsen+bU0+H9hk
         paVvc24hc3SawAfX46dz3t4AQKms/N10w7UclIhfjil3ao1CgKj+SsbZgpRpvc6ZirJ9
         zz4HB/ttcB2EWMgCjrfs/+WLmJDN8Wjer9CKVnwUG/sMnCRxfsWW9g0slVZJ6ijJKfkv
         60PIC+sYk+aj3D4Rg2Ylgw8Q+VyLOoDdVjRKCxpPraNZ1QsewlUxA/q26wt9fx6FORg3
         rlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231862; x=1788836662;
        h=content-type:cc:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA63V7b38uhqbNEZXXddjk8npZBIzm9EJsPF2DR/LRY=;
        b=bX5bJUOk4PYd9jwmtuZYYLWoow5+nbtX2AM2YH9TNEUW8ooiaFPKoyicXu450kLsLp
         iPNpkrQwXDVQvoVS6NMyU1B1A6VR6Jbs21EkTwutwZ1udgNeuoRjX0eVmSwarYQ20a+v
         tz6unr5E77vrUkOcm7uaG3VGVDZGMf/4uz5nDyLuEH1RU5y9sKFrpoiwORcwT9SkvJ5C
         DKQ3KtKgm4T5rQFyt/iR4MjWO0Lq3hEab+BitRKOEjQz7XaWOGYurmzxyP28r9iDtvOw
         zVUzprO0Q7tN8bPoRK9Cxm2pL9UJmwtWxDlCUALGcuOtaqr99jPAp5VIPl5CvT6FDNm5
         TM0g==
X-Forwarded-Encrypted: i=1; AKwUvByGgpWdMpadwYyhECjd8dtmjAhCz27taGsE84TnkFmlIunkA1RCmY8tvQ1mYK/LJRMGpuMZUFFVwD6j/kI=@vger.kernel.org
X-Gm-Message-State: AFuF++llVcsRAXI1Mkp8jS7piUIbLJ+PDNJJaKC6eAsaecwwe397VM2M
	vBkaTFNlZ81hchHs5CAk2HMXDBg+nn76p94azPV/3MvzyTjQRlivwmc07gCfUVp8tWqS0R78Ycx
	QCDsLfE9G2dTwQA==
X-Received: from dykp12.prod.google.com ([2002:a05:7300:c8c:b0:314:9c4b:f8eb])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2249:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-398cb561618mr17391422a91.11.1788231861729;
 Mon, 31 Aug 2026 20:04:21 -0700 (PDT)
Date: Tue,  1 Sep 2026 03:04:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260901030419.470246-1-cmllamas@google.com>
Subject: [PATCH v2 0/5] binder: fix issues with mremap()
From: Carlos Llamas <cmllamas@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"

This is a follow up series fixing some pre-existing issues found by
sashiko during a review of an unrelated patchset here:
https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com

The goal is to safely reject mremap() requests on binder's vma to
prevent pages from temporary leaking and accidental IPC tear-down.

--
v2:
 - Set VM_DONTEXPAND in [1/5] and [2/5] per Sashiko's feedback.
 - Check vma->vm_start to prevent incorrect ->close() in [3/5] per
   Sashiko's feedback.

v1:
https://lore.kernel.org/all/20260831224145.169403-1-cmllamas@google.com/

Carlos Llamas (5):
  binder: set VM_DONTEXPAND
  rust_binder: set VM_DONTEXPAND
  binder: check vma->vm_start in binder_vma_close()
  binder: reject mremap()
  rust_binder: reject mremap()

 drivers/android/binder.c             | 12 +++++++++++-
 drivers/android/binder/page_range.rs | 15 ++++++++++++---
 drivers/android/binder/process.rs    |  1 +
 3 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog

