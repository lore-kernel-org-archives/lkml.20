Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E654A4989
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295984; cv=none; b=b9d3/ok0jcpqewiuiQbnPSJJUr86jz8tBW4PKFuzQvXBLGRQhQmr/9woS00r+PbmmRpVYS/O0lKiENJmEWfLOXc9ZQDwzcXoIAiF7XV7tfO8K0utweWJUXJ2X2MBIdaB5iP27TBPdt9u+lfoQywn5d2wZPCugzzUxp9YngbUqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295984; c=relaxed/simple;
	bh=/gMq7w6xSnPLzuoQSCSqsUxsfxg4kXXouj2VF8DdqoQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=skY+TQ88bpiBYUkG2MYfBoq3mWeUSTbYIS4XwLu3OMs7Z/xoxLoo9GO+DBigf1iPAEKhrAdqbI/IjQwfTXuYNXLu5LSgQuDHv/JJVF6NTR724Lm3bGYjwCZAvY4HaeLj+onC9R9eyKUdhbjrxQPpYklLDvbxtK+ncuzhV6WH7VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f8931WG3; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f8931WG3"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso2971135ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295982; x=1788900782; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11XYeOadEK/aHTk3U1zKkiikckIvd/a0F9zap2SHnBg=;
        b=f8931WG3klFJfJqJonM45DVGjKgCo1+14iY8P4AU3WAZ5oi0FYAj28QlcFG8DdOEbL
         HKtqp/9fY92mdpcmsDyr33+FhjyHrZq+95mesrXaYx7Y9wDcszQ+9c0fu9F10UZhf+e2
         rnelhqtQnxqTw/ZghSM+1di8Ob7xh2nYJ3YH9RkpeEl3P4YfApnDyVZxGZpx/G8+INC4
         kvTy9NL1p9prRMoGRj6cQw3FZvdjzk7pQ6DoE9rmwThNEB0jFmpLLRWElzPiRVtHm1F/
         RIeOPPX2rWhKKUmc1KL9yG20ZIMx578ShIPiQBvFnE0JIcn9QhMEp4awqpUv4vzjW1qo
         lt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295982; x=1788900782;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11XYeOadEK/aHTk3U1zKkiikckIvd/a0F9zap2SHnBg=;
        b=L+Aa9e/RdrxfMLEYgk5Hl22pXZWlBz+hDYcHtG3eSXxZhUNzLj13uhR7N0RoWb2K3A
         rdUyKpWOpTEx8YrUF2Qz+63DHiaG5g66wx7cvxkV6ds4FFZPGUT5LvInLwAo3lbSD8jx
         wP3/mIc1YG93dnSEDdoCyMI4esKz4aV/CutZXaKfXYf5sXthyoxJ965C7JmcPu8Yf/re
         ZL0TaKo5vfdZmO3kbcwLKlPobDQf6TOouBiKL4prgOLKZUK3vPbSjL0WFWc/qx+Hml+M
         uvsx/0PnI4RRvDUU0zkI7FQMByvvScmOz0Oe/qs3bQ2GtRyxKT0hoNNcb5UrMuG9RdKl
         T/yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLzGvBlHTp+d54FFHPTigJntm4Lvv0H9hmu1mf+21nsa3ABaNiuD5qjw8nZ5FB/sQ3BtzqHItVY47OISM=@vger.kernel.org
X-Gm-Message-State: AFuF++mCTM5kXt0eUWGZpbBJ2ZXNfm2mAY/1DNs4YDD+Hh4F5Jy9lFQS
	sCLIIB88NFmneKMT3Q8y1jZbrdjMJjVptC2yb0o2QickCtDyl1rPIUDjP6pqGHbQinc2IymQAcv
	7sgdadbVzxqi+UA==
X-Received: from dycrm6.prod.google.com ([2002:a05:693c:2a06:b0:328:58f9:d18])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e74f:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2dae5e17d6emr11628295ad.8.1788295982264;
 Tue, 01 Sep 2026 13:53:02 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:46 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-7-cmllamas@google.com>
Subject: [PATCH v4 6/7] binder: reject mremap()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support mremap() as it caches the mapping address in
alloc->vm_start. Moving the mapping breaks the IPC communication for the
process and can temporarily leak pages during a shrinker reclaim.

Fix this by explicitly rejecting the .mremap() operation.

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260813193433.3318288-1-surenb@google.com?part=2
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 3d359490436e..290ccfde624d 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6040,11 +6040,17 @@ static int binder_vma_may_split(struct vm_area_struct *vma, unsigned long addr)
 	return -EINVAL;
 }
 
+static int binder_mremap(struct vm_area_struct *vma)
+{
+	return -EINVAL;
+}
+
 static const struct vm_operations_struct binder_vm_ops = {
 	.open = binder_vma_open,
 	.close = binder_vma_close,
 	.fault = binder_vm_fault,
 	.may_split = binder_vma_may_split,
+	.mremap = binder_mremap,
 };
 
 static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
-- 
2.55.0.966.g6673acef38-goog

