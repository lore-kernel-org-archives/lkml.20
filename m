Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3B545DB8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061835; cv=none; b=eTfL88mwoLk0C1VHN8sX2RfKIlAC5E5mVqj/hEwjClRqSTv9WH02zjyeoDVnPZx2tKczXzJctfdhAqSf7TOWyc17Ey3EGUwrqjR5KoD9Yc9ihepGCoVU6GYDKsvJQqlXviC8I5eZxPvvGJIEzyFD3krLav1XffMw9JvccTvl81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061835; c=relaxed/simple;
	bh=XKT7/uV0796SBITZ9Wb5fG9LHerOuiSLsoHjmDG2J5M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X88JBV5wvzLk5OnElnbcNiqmvdI8tj/Lwn06Bt95Oh3EOF6Jod58KSQ8dwb+6I6Vwfogp6hE4TvEM3RN28jW3scR6tMpDZKa4oclcWVaVhj96HdR4hQMXmWLP0R91rcxduUzjVcyVySiojTKS3/dy2EI0CCrAsr6Nhl2peh/o4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XB8LJ+Og; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XB8LJ+Og"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so121369735ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789061824; x=1789666624; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucrMBG1dtLZNncX3iBo9nVwxchXvhveT00DBodHEBe0=;
        b=XB8LJ+Ogh+Gtgib0kuaFlJ7KMrS5ZdE6txsUM2BZY588IHbS9tib/dbTI0rT+EBM+S
         BmCD8MiB7aXo0zA9Auhq+BM+Sc/XdUDPzjFJP2D76qgUls5c1geawzp4c8aIqYLAcAV/
         WrzkseLm4r+xwxXG3fZ+lZ9EYGxppNpQ4FPv2PnrfcmSVch1iU9Q1UZfGaEXie3laai9
         uGH+z6qNafL7qYx6LZWQz2RZhf8lU4pcoz7aAU03vXPjVUgsXHVL/887j3N5ZNS8cgdJ
         Ld2T4us412mfyhS/BLoU7vGjlLtX0ZhnU431BUyqeY2fgEUMWms17A0ISmm0XglzG7BD
         qeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789061824; x=1789666624;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucrMBG1dtLZNncX3iBo9nVwxchXvhveT00DBodHEBe0=;
        b=ee+BPrAflfRe+8XPoPUzqU1bNOxfAa0+D0PJwatjo6S2SuAzIIRZTNNMVoQ5LFmBUS
         enQ5GIBXvNEIOn4VZV03kYNER4t1Oly0CMLrM3jTWjG0jMOy1IbUXDiXcxg5U3o0nmH2
         aSa6tWkw4f2tUYbEfwwENvvG1A+KZUvi1LO2Wrg2Zv/uFM92UHx3Eb5BDGEHvQ6F0YI9
         RrgpLXj+QSPj6EUZEfS4laiNK3YiqGZ4IOojIeH1mKk/ZVx5z2OevnfvQj4ccyHufNny
         q9ReaNofa4aqSNYX4L4sTDoYjCoWRH5z8+wsjj6Sm0ed6OhDqCnjnclPRgNlsg4CyiFL
         Ging==
X-Forwarded-Encrypted: i=1; AKwUvBwcGgtn5orus5dhdovUmYISzD9R2fN+L3GgNnSp7Yk8aXY78DPjrwNH0cyuo22hSbHO6kyT0+tabydYuBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l/VHVQbAKuFxjMej9PpoNkqAzGdwH4NPjDKjG3jSBOLYUKYzP4
	pJWXfrcOv4D7uB/MeYf0+6DMQ4DoFcv8UO94O31Xmp6IvILYeqp5Pwb4SpC+YJcxtBvEGLeGgM+
	qWp/QS0SyqEO9dQ==
X-Received: from plmk20.prod.google.com ([2002:a17:903:1814:b0:2d9:227b:5717])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1508:b0:2dc:fdde:30c5 with SMTP id d9443c01a7336-2dd2a35779dmr7586505ad.17.1789061823421;
 Thu, 10 Sep 2026 10:37:03 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:36:59 +0000
In-Reply-To: <20260910173659.1945246-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910173659.1945246-1-skhawaja@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260910173659.1945246-2-skhawaja@google.com>
Subject: [PATCH v2 1/1] liveupdate: luo_file: Add documentation for dependencies
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Add documentation for dependencies between FDs preserved by file
handlers. This supplements the previously added
liveupdate_get_token_outgoing() and liveupdate_get_file_incoming()
internal APIs to allow file handlers to resolve dependencies.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 kernel/liveupdate/luo_file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index dbae0715220b..a39992da504f 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -91,6 +91,21 @@
  *    again later. If the issue cannot be resolved, these resources will be held
  *    by LUO until the next live update cycle, at which point they will be
  *    discarded.
+ *
+ * Dependencies:
+ *
+ * Preserved files may have dependencies on other files that also need to be
+ * preserved during a live update. A file handler can resolve these dependencies
+ * by querying the token of the dependency. That token can then be serialized
+ * and used to fetch the dependency during the .retrieve() callback in the next
+ * kernel.
+ *
+ * Some of these dependencies can be resolved late during file handler's
+ * .freeze() callback, but some of these might need resolution during file
+ * handler's .preserve() callback based on constraints such as immutability and
+ * performance. This introduces an order of preservation. Note that the order of
+ * preservation of dependencies can be safely relaxed later, but it cannot be
+ * enforced later.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.55.0.1032.g73a4cd73de-goog

