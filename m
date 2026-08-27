Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631D1378D6B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804255; cv=none; b=jwMUaVBvdFzAJVqkDrIvjM+FU0hNPRgahSyP6tVxlArlkoMYKNFu+0LCO/wT2pn1c3wFJKSyzXsOYFiaOaIZDcyoBcfpiDky8jI6mjhvql1czt9LlzwnCYRaqQlmPIOb7K7EPQv0FZLFUV22oNmkqfcK7Dsr5euFkiMqkD+5mBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804255; c=relaxed/simple;
	bh=smjs8DCyHfbFtnAez6SHJxIJ7dx3xNvndyjA/twe110=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=utRftXwK9CgdzimOIMc/uRot+iRZLU5LitbMsFhwTccp6h8NQ6+DxdT32mR4Ai85qMtb38vuBIWJYJmUe1SKTgxqwwZoMDRUPHcg40h8r3GqSbOuxgWszTZYm9C7rnxp5Htu/Q3vwjc7hZfSyBRgocoG/SHGCe3+Xp9CgBR0uYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FnijOR15; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FnijOR15"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso621967a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787804254; x=1788409054; darn=vger.kernel.org;
        h=content-type:cc:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMzSnQkFDbxeGZvlQrOG0uCcN7FgBdb2z4Q3uWVyr9M=;
        b=FnijOR15de8xnGMMz9pC33NWmORboHDsD/CYSQ5U/4pjJZMYBt58ATZYnCXudnDxHr
         2DI9mHwZw06VR219RFnIKiG4MJO6NL7aJR5BbZR/c3iWTvte1bZyVxQsnBqE0YHEhyPW
         ri/w6+TNzar+d6PV4Dx36p8Y8KnmErpKhOWQflfoIDYyUvuaQPnzRw6bQT+PsDVwYdfr
         akfuagbc+BwCFdJh5FGpganFQrUfujOaP4vwuywyXLjtamuO/fIGYfuZ4burXLA+ZOUE
         2pbY9dzdrr4s1dYbYKrYqDN75FgTSxRdj30LLeB/5wLkpVJJt/f6WHr2XJP1LQVpOYQ4
         a+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804254; x=1788409054;
        h=content-type:cc:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMzSnQkFDbxeGZvlQrOG0uCcN7FgBdb2z4Q3uWVyr9M=;
        b=G7Nfhe9WsQT6hlP3eC+hjhqcUNs5GRerX8jzbAgrWHKX53I13yyU56DLIiRypfeEUo
         oDccvZUNourksA9do5S5a9YgBREiG+DUhAV80ZZfoMGrtH2680sCaIB0V6QLolzsDOr7
         KNR6zJtDxNIZ267D5pQTsFKYro42DOss0RjyNp8Wvwo5w7f3M7R+GM9ZA2H8WrmXsdkY
         yyzeQF9f+EUZ0XSTREyMnC8VSOAM85Suh89xYPp6eyNHaZlwrPQ3F8r90yuonI3pKjpz
         bOrldhG2zdOXbLQ2tbg8AE9e603bfscXRKL/MnRPqIhj/HZ206pwIopuoBkdudfzrcRN
         jVbw==
X-Forwarded-Encrypted: i=1; AHgh+RqdoH8IxN8IpcGhDuGKEgLrySDpqfrJt7rr5xbkk9ncA0RAOESiLyQPdnMA6tks8J1LMKLeymZtDjyHIN8=@vger.kernel.org
X-Gm-Message-State: AFuF++klojTPbyDOy4Ms1vlCYAPCdfm4Ur4VCrcGw2xhnH0pacnulJ39
	4aAJDUcKnzltcwZGqSuhUyTtlbJglUgnX08WplZ2QhHqmTmuMZDZpGTcgplv4GyRapbaovhA5mY
	F
X-Received: from plpn6.prod.google.com ([2002:a17:902:9686:b0:2d0:d8a:3ad7])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c48:b0:2d7:f0:896b
 with SMTP id d9443c01a7336-2d707b9cc1emr247925545ad.13.1787804253664; Wed, 26
 Aug 2026 21:17:33 -0700 (PDT)
Date: Thu, 27 Aug 2026 04:17:29 +0000
In-Reply-To: <20260810204118.1981755-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810204118.1981755-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827041732.188707-1-morbo@google.com>
Subject: [PATCH v3 1/2] vfs: Annotate struct fdtable's fd field with __counted_by_ptr
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
v3 - Add version to the PATCH subject line
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

