Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7D635294E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804168; cv=none; b=ISUCv5+NCPFSWO6Iv055Xg1u51EUUWgKVVrX3mtGi0zi8Dy7uxEAVinZojvzBPZvSg9SQVzicTYb1jSpCGf9s5ILewtEj2cx5TQIY1wlXwvRnTdsCfvFZdVb5SVVFQbKSxADg6qfZ2xgJc+/JDNoZoMVtDFwDCVUDHGAOaxwNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804168; c=relaxed/simple;
	bh=n+SjTCjuYTXl5KayVO6WXewqVZcudCQw53KO0rshhwo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=enWRdaSi3QtLS9QMWlFXPCXtkcTeB2deMVDtyaET7R6A3xmzoJ09HkElmThI11VRmWEIlx0OQ+rISTDZ9gWAimVpQDj+i47TUBycwyFnlUFihP5rvC3v3kClUqo9JynmgHD9Z1QiJ8GgDrN1XJZIY9T5TRIESOoJ9zy4r8P8F44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U08KaW0w; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U08KaW0w"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so2251867a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787804165; x=1788408965; darn=vger.kernel.org;
        h=content-type:cc:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tC+1FnIjErVH9SYEpec69S04EuD4PIv2jo4qBhMrSCE=;
        b=U08KaW0wwvnTvFuZBryYuf/W1bOYZ57SKAe8ry/bh/G+00lvhaDPLgst970UQ/iOrD
         Q0M3LFBVp1L0fPwPyWkTaWRLxdvK4dEvgRt5RgeZIesQVnfxLShUQCFxghrX49nVCPhg
         +IyNQlUYfkHJqdP3BrmgkkuKExUt0t4woFLtZGSz03daXughR62eHJardSqq9Ue6D3QQ
         ra0fbKnYxAuuxDKPuRYCstIeEWncLweAOUn/M3KKCMDKF0FHgkyguATjm+FpEPGuIkQ0
         5B8DMJqzqFAff5hnq3NwIVqj2wgEz3XHS/JY8Zw/8R4qEcY+bamCnaf9e85DpMwRyHff
         zlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804165; x=1788408965;
        h=content-type:cc:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tC+1FnIjErVH9SYEpec69S04EuD4PIv2jo4qBhMrSCE=;
        b=sVQPFb5joOZ/PSIBdO2ZUfS+sFbPB69CFSXg9tY2uqmt2IktfizHVX5+JFhey8S3la
         QdvzNHw4Imm1TanQL4FlMPvKl40tsD2qqc+5rIaO+I/aHuU8AgEJweApacfWoiDo9LOp
         db3wLoqaL2tn9M0kXXWquicUO3KP1+MrR6x59b2EToDrhQjJ2Zwi7BXGHYCSQgteFPJ2
         cTUEqYx3WwMvgE14XawOpHNR0En4lkQqj5F4RDpZmb6Wx87A9Dmp4Qbr0uPdJFVle9VZ
         p6ZmINJdnXbnI5Rqmz1j25lHb8geVA694QuM9Fkb2D6unmQ9AsfQvxhAkmVbGoOQ3FBi
         DpvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoTorHUeeYbXKEhfkGWT/Lc2jq1al/QUQ7yo61Ot/vOcx8IeawBD+sctxRY3EhkR9iqRPIEXo5xXYRdp0=@vger.kernel.org
X-Gm-Message-State: AFuF++lzn0hyk4xvN49fVvSV7MwQeb5vFZRML7YUEr6X81HhfIkbv6aX
	nl8jIib2XjHhJcmxZFbxWamj8oB+nlyw/b6EmErsAL1GyQ/G26tUEkCqNG2OGXBFslStFHp9C2Z
	a
X-Received: from pfblb17.prod.google.com ([2002:a05:6a00:4f11:b0:84a:1bf6:cb4a])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8005:b0:848:76c4:fba9
 with SMTP id d2e1a72fcca58-8537279f105mr23418409b3a.7.1787804165145; Wed, 26
 Aug 2026 21:16:05 -0700 (PDT)
Date: Thu, 27 Aug 2026 04:15:55 +0000
In-Reply-To: <20260810204118.1981755-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810204118.1981755-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827041601.187608-1-morbo@google.com>
Subject: [PATCH 1/2] vfs: Annotate struct fdtable's fd field with __counted_by_ptr
From: Bill Wendling <morbo@google.com>
Cc: Bill Wendling <morbo@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 'struct fdtable' holds the file descriptor table information,
including the current file descriptor array 'fd' and its size 'max_fds'.
To harden the kernel against out-of-bounds accesses, we can annotate the
'fd' pointer field with the '__counted_by_ptr' attribute, referencing
'max_fds'.

The compiler uses the '__counted_by_ptr' attribute to track the
size of the memory allocated for the pointer field, enabling
runtime bounds checks under KASAN and fortified functions. There are
three places where a 'struct fdtable' is initialized, and in all of
them, 'max_fds' is set before the 'fd' pointer is accessed or assigned
in all allocation and initialization places.

No accesses to 'fd' occur before 'max_fds' is set, preventing any
potential runtime false-positives or panics due to uninitialized count
fields.

Assisted-by: Gemini:3.1-pro-preview
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: codemender-patching+linux@google.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
---
 include/linux/fdtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fdtable.h b/include/linux/fdtable.h
index c45306a9f007..3a5c88291125 100644
--- a/include/linux/fdtable.h
+++ b/include/linux/fdtable.h
@@ -25,7 +25,7 @@
 
 struct fdtable {
 	unsigned int max_fds;
-	struct file __rcu **fd;      /* current fd array */
+	struct file __rcu **fd __counted_by_ptr(max_fds);      /* current fd array */
 	unsigned long *close_on_exec;
 	unsigned long *open_fds;
 	unsigned long *full_fds_bits;
-- 
2.55.0.897.gb25b4bd76c-goog

