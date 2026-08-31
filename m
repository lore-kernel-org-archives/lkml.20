Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCCE44A403
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186249; cv=none; b=CHEWgnKnvyUX3viB1g7mjQj2LI1Gu88xhiZA4BEmtSaVIdNPNtaw3g2XiOjw9UpkqLZURZXbLDufQnkgxlTENDQMl0JCc/ihTPGJPUhtWtZ97uWPpBOkFF4C9mJOhDwmp8nyb/Z6oTJa/ahF6Ahiqla03UxtkkkXrmQLsS1WmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186249; c=relaxed/simple;
	bh=9mlgq9kswA383J6vVWIkDQP86PxyZMrEWKdREvtgIGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xh7eOt0at3Tvclam5fHTShflFOGmdzXFIbHiDdgzxiZBLg/yS0C/0kTfZDngJhvj0chg48vgncd00FXX/oCKW3hUJ5tGVMQ9PqlvTW+QNENzuB83dPnyh04e9NgE2zpvKitn1HnWal9upUSE3309xi3DqUpDsI6W/xH1pnzRgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffjybD54; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffjybD54"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso3758422e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186245; x=1788791045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaVEwReoXhJ6W9rZ7l7CMc6ajDjovCb+0lJwxGj7ri8=;
        b=ffjybD54nHnXlXN1sT2mX6p4xE0jveme0aKApRR/mYmau4Tevgv3txXcW/KQzL88He
         xqvl78guR0blgcHBUWMdFf8BcELMeJ4fJbjY5ug1ljG6ps08N/fcZJBECcqqXpgSdzg2
         PVGZcdPmfBHgmLnMiyxTPWXcKWx95Xh5kmPGnuFQMPGKrx7FVdiuPo8nWVnYTXO0V/BZ
         +Ktp0gkQ/ayEAdqXb9hH4ymIb9WuG+lbGO6aiM0vkY84od6/o20LoAzKY/jiu8FLm7jA
         i0n1QYNZ1wm3m+urBXhBFGviZ0+BGgMpwSqzcap2VyD5sfVLcVrzFhZO1Z5VaH9vX+ls
         NPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186245; x=1788791045;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JaVEwReoXhJ6W9rZ7l7CMc6ajDjovCb+0lJwxGj7ri8=;
        b=oFuTsNn9EJ0AGpZelhfauccU/vq8mA+77OxGsrN+DspcMvWlip7oHddYqv27e2Gi/5
         RvackE1VP1zlI8fYbTrp43FnH+4iSmYIMkLJOmpbZIS+0e+zxWUsDCQWYUQ+17DA0WWK
         AXiEC92cnZ0zq3sLH1pJUKXk1wr9bIV683ZsEFsuZWJEaaX8RQKH1irlTdbEU4NJSENW
         71PZ0xgdW1S0qCB89NqAqbU/OQuP39T6aeEjJOkZiwXW1cmSN8PTX4HaydKUYkJJYv7c
         KpBTgtfDmpMPB3OHC+g72JEnMVg1MbxuG5PmDWHOmHBscsiQbRPd8gwC5vgS7QIwZ/lf
         YDuA==
X-Gm-Message-State: AFuF++mJzK+kb1jdQ54jLIo8fKYSnV3vSpgImLXvE73uDnzGNY0mHupm
	ChzbhBjndDZyU+/ch5xYFIEMf6SArN8TawLihJvLtsNqQndv1bbPYBGo+x4cJAtc
X-Gm-Gg: AYBFou3tAgK+2OSriogIG45fxGHkZMa47LoyiEQTul9tad5unSw9DxB49Ftso4oqqcQ
	r4++Q2sFmKXbuohL0WDw3YznBd5qJ5VIQJav6bWiLWH5wGM72/H+9rbYlRejGoD7nh3ivg0pqqz
	P6YshA63ZRMjNytal4PaYH7a6pjOUuiT9Kmp7EOsf37gUyPmXXADx3XHSpJrnYEfNDvbFMmeHt4
	ZbR4MVEr6BIsc73O1B6PfBapjgASKQkJk3zHppHxwfhXCJVHbvX7fMZx1LZiLTEpzYrVdkWa0vK
	9EpAbllUtlGDFQUAA/30By1BPQHVuEvI5uFo/mjko1PLUKwrFQ3PPFEerX10VQGNp8mhjytOMxL
	wWZ2IE0eCzZb1RJoqb02EDEEfZ+zogvHAxNBd2YwrbgfHM9hJMYozPz3m+zFdG70oIYmxprQS6A
	ro28w5UyGcOPfK4jXXkBruMtfO8CC687gZhmWCvleZJTLxpFelUszLLEAtzSWHWUdcug==
X-Received: by 2002:a05:6512:244f:b0:5b4:9d34:eb7a with SMTP id 2adb3069b0e04-5b5e68ec8ddmr7131619e87.12.1788186245049;
        Mon, 31 Aug 2026 07:24:05 -0700 (PDT)
Received: from kali ([37.114.129.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5c8fsm2292919e87.9.2026.08.31.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:24:04 -0700 (PDT)
From: Tabriz Hasanli <cybersec467@gmail.com>
To: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	w@1wt.eu,
	Tabriz Hasanli <cybersec467@gmail.com>
Subject: [PATCH 0/1] fs/ntfs3: fix OOB writes in do_action() log replay via unvalidated trailing index entry
Date: Mon, 31 Aug 2026 10:23:43 -0400
Message-ID: <20260831142344.472594-1-cybersec467@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Willy, Konstantin,

Thank you for the quick and detailed feedback.

First, apologies about the display name — it was a placeholder from
when I first created the account.  I have since updated it to my real
name: Tabriz Hasanli.

As requested, here is the fix as a proper git format-patch against
mainline (cf72cbb39).  A single patch addresses both check_if_alloc_index()
and check_if_root_index() since they share the same root cause and
the same fix pattern.

Per your note that crafted-FS issues are outside the private
disclosure threat model, I am sending this to the public lists.

Summary of the bug:

check_if_alloc_index() and check_if_root_index() do not stop at
de_is_last() and do not validate the target entry at attr_off.
This allows a crafted NTFS image's $LogFile to direct four
do_action() write operations to an attacker-controlled fake entry
in the trailing gap, producing heap OOB writes of 8 or 56 bytes
during mount.

These are variant siblings of the view.data_off fix (3e127829e57f)
and the DeleteIndexEntryAllocation fix (fc4626bb3656).

Confirmed with userspace ASan harnesses using kernel-faithful
512-byte INDEX_BUFFER geometry (fix_off=0x28, fix_num=2, full
check_index_buffer gate chain).  Harness source files are
available on request.

Thanks,
Tabriz

Tabriz Hasanli (1):
  fs/ntfs3: validate target index entry in
    check_if_alloc_index/check_if_root_index

 fs/ntfs3/fslog.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

--
2.53.0

