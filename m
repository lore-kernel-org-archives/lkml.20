Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB14A482F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295983; cv=none; b=q1o1HGJ8dUIc4yuqlEAlQoG1TmCpTTSMk6gvNJeiflPN1/19pGVKFPnOQMOP/0wzpkXdkUtPn1snpnkgMSR5P5JKWJcLcI5qSwAIboYmHpTQ7Liwqn5nmBXtWX2D3/GE/qlWPxdoXATovx6X/xgeLDA/iwXa0Nei7P1YR9cX4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295983; c=relaxed/simple;
	bh=C+SBGaTzz9NM7jGZ23XHiP5B/G0nfL/GkCZ+fXA5IEU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eiVp0EJUOkuy3iP2FrrZQ8VXqFzGC76a1vC2ZjOQ6L7mztbuYBUix/PLrBz/Vjs/swmmcsfHEIKbH9uzQWLZArOoHW515HSEVbbtwdZ17pTe2OnRdpK70UKzSStGxZfUYhMmeFxPwhBVpFl/4eIpcrwYtF7PfK3lRC5QjBmsBDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O61lGwuv; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O61lGwuv"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7293f13c6so2849415ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788295981; x=1788900781; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93eGEgj74rp1RcZzJal7clwlrfi0gvUnBoc2ODTBoCo=;
        b=O61lGwuvZJQwiyoxcV8GC9M8bbmCLk8G3bstG9hgL9JPQ1yW4Si7Do36sk88ipP/4p
         gdtgBRbobD/aukaXtypoqk0dYBerFqW0wB58hQEHQ4ONQtWZbMSoApLHn8UDU0O4vHWu
         bRaop54VJa+NZSrFPuOHE+h5xjDgbJ4WrsqCcXsXD1475V1eBoE/w2kt1TtLauGS+uaG
         3UaME2voCa9H69z+p0dJ6EzsCFBE5yEezyzPaHaOSsukhaLJIfWwm3OvUgXJzuklbmaJ
         qai7WMdC/dIgHbFC1LpxjCSptoVzpYKxoABhrlHvtFW4sSboyiFi2JDOZn569oq5oQEP
         CNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295981; x=1788900781;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93eGEgj74rp1RcZzJal7clwlrfi0gvUnBoc2ODTBoCo=;
        b=JXGFBa+q0OnujvRAvcqlBTSEg5pAKgBflV+BYYNyQlcy0PnzKRHH388lF0eIaJXIel
         ROPqo5zbsI2RdP+m6ZCPt9cRSlXn70zKaT4dUciVVeTiqbDNBjmPRSzyu0a4+w4iODrq
         ZWyu2VpMomNbM1C65Cg2O1aITf9Ax2JyYAafZPPdrGDni8jhzga+WpWemnAcgOcKoBGx
         C7p6Lx2wjzo3Wj89Oj96No/QoatSc857Pr5BF0BQdUDb7CxMrJtaoZiOycKqnkYR0AuP
         6wvXlfCzjr6GcUpouQP3/3WsO3avFM2H068A2bgNd6JDcaDZttmYMoDXdYinlT+4E0cK
         /vrg==
X-Forwarded-Encrypted: i=1; AKwUvBwe1SEjQcCfR1+MexfrYtgv3E9GvEUYIy+VioRHnIngNECQP9L3GwGzrPr/ZbXD5gZC3IPx55j9zu1wKMs=@vger.kernel.org
X-Gm-Message-State: AFuF++kyNyWUM/May04ZJICLe5TnxBUuwClpWJhSn9yOndLxk1Xt0pwe
	vOvsQ6qiz1/XOuLoC9jga24GnIDgDvvwbT/Q3j6NP2DZf1U9P7V0f8gGUM7qmz3AuwEEeaHzNID
	fBNybWwRIA6IKxQ==
X-Received: from dybts15.prod.google.com ([2002:a05:7300:f58f:b0:32e:3955:bc8d])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef0f:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2d94a8e0d02mr151856255ad.10.1788295981024;
 Tue, 01 Sep 2026 13:53:01 -0700 (PDT)
Date: Tue,  1 Sep 2026 20:52:45 +0000
In-Reply-To: <20260901205250.1638304-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901205250.1638304-1-cmllamas@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901205250.1638304-6-cmllamas@google.com>
Subject: [PATCH v4 5/7] binder: check vma->vm_start in binder_vma_close()
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Certain operations like a failed mremap() might trigger vm_ops->close()
on temporary mappings. To avoid tearing-down the main binder mapping on
these, let's verify that the VMA matches the expected starting address.

Cc: stable@vger.kernel.org
Fixes: 457b9a6f09f0 ("Staging: android: add binder driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260831224145.169403-1-cmllamas@google.com?part=1
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/android/binder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 185128577829..3d359490436e 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6018,6 +6018,9 @@ static void binder_vma_close(struct vm_area_struct *vma)
 {
 	struct binder_proc *proc = vma->vm_private_data;
 
+	if (vma->vm_start != proc->alloc.vm_start)
+		return;
+
 	binder_debug(BINDER_DEBUG_OPEN_CLOSE,
 		     "%d close vm area %lx-%lx (%ld K) vma %lx pagep %lx\n",
 		     proc->pid, vma->vm_start, vma->vm_end,
-- 
2.55.0.966.g6673acef38-goog

