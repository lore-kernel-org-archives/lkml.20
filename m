Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA234A482E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295981; cv=none; b=g3tsXachQje0rpAOwy1j/PCeD8CQJjoDYxiDaouoNOtb+CqY71149YKlMF1IIC0QmztB7yfB5BX8BaI3dfrx7sms2Isw+KeUkz92+FVlAo9MVq1CDPAul3b3WM0gR89LQ4utc0Jd/QkcOjfuik937dcPKIRd/BEKgf/Gl5h+r5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295981; c=relaxed/simple;
	bh=GPmeVGMLIoZoIlDJwvRRrzHCCviiWSVdzdWd0kwp7eo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MgUsEwz0170ac5DQaHt8BavX+/XZfZWkWj13uW24uQFW8edEYxqiQzHUcSR9oxJW4QorRt2VRrPxlTcNOu3xtILIsFX1Tb3teMHyFxu7Lxg5lOIJrsk/5VNKl039FW3PWZnttyDot3QWEYutSlSur8Lph3s3z4HqmATq9ylfu5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tu6nODk1; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tu6nODk1"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so434016a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295980; x=1788900780; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efterSwzpT8WmqwjvTJaX4ZNpH8DVSU8cX8allgguTQ=;
        b=Tu6nODk1QBxWhrKm1cNl2rhTHsDwbv1JAVnun7jGvgkKnXwo6iCZsA+CRGU+162hpx
         G48bzgokgKMMFw35fPZ2AlYEYLMuIDJIhBtyfabbrnzjXeAb0GFyL4NTrf19RWysADxH
         siRLBPpS4IajYwow+JTfRgeXmPoDnTcXGvB/DYHawzJRaqsAIloKkS8PyZ4ROEcJHsNZ
         gBArKJLo4z/MInYR/CHbYndagVacrYyj6omyFMqjsJC9b7kTTrstlAyJv5n897sjzauS
         EhfCW6GSsm+VuGePYK1fp+RovXu/7ivGW1AevykMUkRyTMT9Vwag75rIUL4eupL1YHeQ
         RqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295980; x=1788900780;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efterSwzpT8WmqwjvTJaX4ZNpH8DVSU8cX8allgguTQ=;
        b=dKq13DNum2ozU4CfkuC+U8/Cj5AwkQAb0xVnHkGQ3BX7/UKerCTiWxxC1gpo00mRpy
         JIBrOpB1GI/YJ6ok1UZGvwFaMnLIG38+KsRNkKV0gxyFMjw3aFfxEsVudF0cUoW1jJBk
         b1iTip0CLzaj479Vki8QGSyG923AvnH3POdaM3IhT/OCupeVrVve91YfwdECczyDn+E0
         WKO9vJTSL5EW7YR5kurMPTSoVsAx+sVkONlY4X3zP4D12CAe1/xefo1VzIIjsg95J1nn
         /tntaYE+gC11V1kbhvc/g7l0XE1eNqW/uLH7XtsbFPNVXXbB9iZFbZq9UEPk0eIyITyL
         kxdA==
X-Forwarded-Encrypted: i=1; AKwUvBy2pC15MlY8sArTIiFQXDy2Z3WB8gIDeXLMWtHOHqDIhotZHUgMxnPyOKnSanxrEYxYxARJSp2y53REoQo=@vger.kernel.org
X-Gm-Message-State: AFuF++lqRKNGJ6SHa94xlOwNOkLFohbOhGp6CBGPYZJSVyy40qh15GhM
	Zk7zh/sS7jq+SWQBwHuwjszvpI6YN6Zp0HZe0s3dKeRICtpOLQcmd9ZN2dgTqqfx4VxtCxV1be5
	v/E6rlSrAaIfHLQ==
X-Received: from dld23.prod.google.com ([2002:a05:7022:317:b0:13b:9d65:a542])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:394c:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39907e4ada0mr17485453a91.17.1788295978602;
 Tue, 01 Sep 2026 13:52:58 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:43 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-4-cmllamas@google.com>
Subject: [PATCH v4 3/7] binder: forbid vma splitting
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Binder does not support splitting its mappings. Allowing so, leads to
potential attacks that stem from a partial munmap(), such as closing the
tail range and replacing it with a new mapping.

Close the loophole by explicitly rejecting vma splitting.

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260901163521.1355535-1-cmllamas@google.com?part=2
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 1b492ed48ea6..185128577829 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6032,10 +6032,16 @@ VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
 }
 EXPORT_SYMBOL_IF_KUNIT(binder_vm_fault);
 
+static int binder_vma_may_split(struct vm_area_struct *vma, unsigned long addr)
+{
+	return -EINVAL;
+}
+
 static const struct vm_operations_struct binder_vm_ops = {
 	.open = binder_vma_open,
 	.close = binder_vma_close,
 	.fault = binder_vm_fault,
+	.may_split = binder_vma_may_split,
 };
 
 static int binder_mmap(struct file *filp, struct vm_area_struct *vma)
-- 
2.55.0.966.g6673acef38-goog

