Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CB43D47DA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164330; cv=none; b=vD7tJYUJnDf0dmmoytsAnMbny3U9tCxVlOmM4quF9psRJyzRvMStDQ/+TPmwavRVzMiRYnRldg6EbWlmzcPtxNA7MvzB9BIotjmLjLUSkNNezcEip9g41BG1e4JPAxrHFqxNFDyvzIoTSkGNyfToBvuseDDKBZvkgtF994Fir9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164330; c=relaxed/simple;
	bh=M57nYAvtHZuzk/k0zSVexxNRkLn35oYM5StlLNA0GAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9M3fMvmt/EJj4kjLz9cYJDPHw4HBFlQ7lNYO7CIhr8DBKEXMNQnh47Ah2T7HGqORFSDDYY1nCIjY85z79kA/Tn4NLVCRuZHzgluYwveTWTmAuxRbwubChidH3pOSGHXJWL995GiYj3pvm038ufsFGi/SSiKrnYv6HXFpK76ygU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y89Rnl/C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y89Rnl/C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482f9309813so2075578f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788164327; x=1788769127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eOQHA6+swCgEPwguYdSiKthdZXu2/f6D/U75aSk8Sw=;
        b=Y89Rnl/CoQK0JxlxeQLT8yCj21xWZECkSETZx3mN8s8wyHsXw0AodwqZc4XYnFN8sK
         aLvrOP7sySdtbj75h0263CRlT+49RaB6gqN6LLDppMNOoiCLByaXkbIuyEQvzJt4Fxg4
         PdikUZnBnUabW9c9J9SVvnWWy+hcKiJAhg1VqNG89g5Cu/UCVwcWthNnxk6V9SsKIYUG
         W3y5Rj5aqhahJOJ7JFr+4vKQaj/Ncl1Kyw4C5YqLDUppCq7TApqOL7VK05giu1KxMUJd
         tplYN45TJUZ35RHFISs++V3GJPxujAeDc8YsGsZHc7hplr2Uq0ZeOO57je/BYexfnpWd
         JTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164327; x=1788769127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5eOQHA6+swCgEPwguYdSiKthdZXu2/f6D/U75aSk8Sw=;
        b=paeeOj5Ot2xSdcfAcCGocplntb88lklMa+8IfHMFwVc0DXCJwTUG1EJCCwHZIwnJX/
         ClCEOt6xuQ8SLzRvY489VPCxgBFhwZBYvYfZEWbkCNhXK44CZMu+FDukdqRUL6t0ePlo
         gaVgXKR4iKKyOGLJ/gJlaX1I/ulO/fDq818VN19tkZEku4FkH9dLPF43/S1RiHl3mxr+
         DBanimDbOYkY0gWDNVeW+mdegrb1HrIGq5v8rTPuo0Vn3rFjqOYs3iesjS9KFSYS9Jar
         3OQfMxg1/VyabQA6b5QnwkzRR/liz1g6HmpbAVAr2TgNl2m+ZdYf2+8vxo+lTswdbrHj
         FZwg==
X-Gm-Message-State: AFuF++nqsEf3vhSHMFg++8K2NqsweGzIOnWKRhMnd+/p/UJPtZmJYru7
	XyOM+Fza45ZwpUpWdOXQLeo6p1uO5zY4FyRZcxVvXa2IGD5MjRlRhutVmcKhmydL3XMixpQ7cxU
	RtFJpxSw=
X-Gm-Gg: AR+sD13LEV0Km8J4s0I3qcfOrEhTMLcorP0VyouZdonV86hbAXkAX96KBz5GZzQkiI0
	yJObHb1GOccTHjFJEPkt41n4YKd5y+9SI0j6W1elUHJQDCXcpeMvfBD2Cv98dAUZUMuD4V0cyYc
	WqYS4R78OZ5bYLPDQSHRSsIDqFaGDO6EAotQAmoKsZDWhcHP3YtpyYKyOJCDDmJ+I+I/vRrELGs
	jXWpMFL1miuTTbq4BNdD0BmnVDu/OxYKk1H6EiVPgy8A2k48xxVpLZQldY6gZLmpKOUJl6Tfvgn
	CsEbjj0GeFp/6q0lHtic7EvHcVZFWDdeiiio8Eon1ESX/YVFeVgnePqXRpckBl/aIyU+OKLw8Ab
	2I809EOcR0Y1h0r5MaaaHVCNH618u8yQPvkJgUTyJ8RdNZxSSlmHUCU4MIRVsUcm6T7oSnfqkR0
	y8vF3TW3SM1ZF8W4uUc1oVtZ1GKJKgHlTA/DmYbGOQonCceqS70tsjeSJ6LRn/xY6CNQv4HD8ze
	YnNNOFDh3U=
X-Received: by 2002:a05:600c:4704:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-49b91c2d8femr360266815e9.5.1788164326979;
        Mon, 31 Aug 2026 01:18:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm273218065e9.7.2026.08.31.01.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:46 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 1/2] doc: Change dynticks-testing repository name
Date: Mon, 31 Aug 2026 10:18:08 +0200
Message-ID: <20260831081823.67972-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831081823.67972-1-marco.crivellari@suse.com>
References: <20260831081823.67972-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise, so fix the URL.

Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/admin-guide/cpu-isolation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
index 8c65d03fd28c..6d8f91d2d761 100644
--- a/Documentation/admin-guide/cpu-isolation.rst
+++ b/Documentation/admin-guide/cpu-isolation.rst
@@ -354,4 +354,4 @@ Some tools may also be useful for higher level analysis:
   runs a kernel tracer that analyzes and output a summary of the noises.
 
 - dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
-  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
-- 
2.55.0

