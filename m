Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E181C45561A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518952; cv=none; b=G7AEJ7LQpIEh1mbCOAVvauEPPBZr0ZDgie1gWMWkebnc82DjRwdzki5//trTRYFohT7evRBmbX+DbijJSC7f60hcSJaSA3NsEDxtvReJGlA5Rj9c/WGSQ3535s25R47DGwnRN2omIRACiiJ8a0yNVkUcYnbVjjfA+PDIG7nNjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518952; c=relaxed/simple;
	bh=SdE4jBbiwJu+r9Un4aRkVsZu5RF066wmpfkAvH/D8jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gl/jAuYZfV1rN80L4migh4bu2ncu826CGeSD/MSk4g3qhxy7FWoanLkLyGjHqvheOC0BRiz3cdlrIa8G88jNl1wu9eS9O/EMHB2I/HAIE+ZaeygDPUKidw+60DxAkkOFKsHGVv5Afj4UtH6iLTWLt+akBWUkNi1Yos+L5g3/WQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KR+Gl7vX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KR+Gl7vX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d91ded8174so7169915ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518950; x=1789123750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I08m2HnQ/PSHt9c8bjpjQoWnw8928pNE4cB9PyVP9mc=;
        b=KR+Gl7vXd9ZoAjgU/eTt0DmEWtCXeujqQSpuWHvAZF0PF7aR+NUnzBSyXI7uL2p6YK
         zshQCKDcB08aEyHinBbSmgC0oDqpp9grQsMavd2FCkmPldUjGOuRvvtAku3FXrptYTvP
         XjHsXr2KaaXN4vvUSkLiUNENQGUPjPQ2W839AcgQ571L/NFpUANMVISQ4zuQP+vTXGDC
         XoiGnyw7w94hqGw6FlQkCyFx3efahVFiQ+LujQnOI76cpIj8qAMv0Ii4TZIN1u30cOyr
         +BcT+jTnSly8d2JUJiU5Jc/s+l65PWNQI8LziQnoH2iIwWKpKIDdCCJhGbgQcNnW2BxO
         mX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518950; x=1789123750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I08m2HnQ/PSHt9c8bjpjQoWnw8928pNE4cB9PyVP9mc=;
        b=rHx8r6t/19nk2J8u0+VGKdnoKqMfv9UcerOBswDtZDWWOgXSWntv3akjMpkf7Sq+9c
         +xQr/lOJQhGP/7gKXfOYsCRQADjQ3oFZU7Y9kHV8bg9zKLC+uA/PUqLFsmWVxWS3u6cc
         9xq4nIy3+adygZz8izs3Qd3gD2HwJNr94HdiJoZAs1H02vpUIPXQ9IZt0HLK47X2WKeC
         PLnqbUofPYeOs9Uc7fZSjfIeDaefxDKFJRqBWxe/XXlkLBngc+JMcnsdp0DHKh5+5Rge
         dOT1hpH5O+Rww2FrImmfIRFVnoHOlFy2CSUS+QmnjWHslJOo8d+pqvszF+maO3x46hzH
         lYzg==
X-Gm-Message-State: AFuF++mR2rkXRwo5izKjtFoOK72r8nAV0UflCOa3tEcSW1E1e9qz1das
	62OvHecLqw+KqKGl8ERH50czWxUmRHSnw6m0WFIpOSuJ1gDOg+2KZwXHWuhFSyly7Cg=
X-Gm-Gg: AYBFou3unUo7k2E9oFwGH7e78K1j04EVEhPO29rgSFbtTMjHGHKP3QA2RPBK4sOFUex
	DjgfM7NVYYJ76wkcpIwp8UQhICi2ktYiF3pZiavcU8ztKMQmj6kZru6hSePAdAEdC2ptcJrtq3o
	6xpphppbutfqP1YXQmM6Q391siMWV5IeZoO7c+7oyeUWlWshHo/3haO9MKyjNM7K37kvJ4fkst2
	uRh+CUIQEypwN0nRhNLbK8SOf0zNL6R2Bpu+70RmO77sACcG/vHhVoPUCxuAjfySxB8gNNTxoUu
	7BaHTQ0JuzxCdOTK+slY1X3keA6M1i8TolCVelcQXjQZ0ol2OhfBjmd+zcf46qsTr5R9YIvHR4J
	+MnZ69UcSiwKnaB+sLjI9gqEDYvOgsZGeqI8zEcpA0SFZAma7Xv3XXFQ2VZ45U+CLUj6wTg5ZGP
	B4d3kLPFKopmbrejtO8ORgNuRSSbmeKa8APJgYXmjLhpxxEyeJ8YFG7bwWXIdw7KdRaVOfJtXcr
	rtyxQNPluuysRA=
X-Received: by 2002:a17:903:2c9:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2db12147668mr83223635ad.0.1788518950171;
        Fri, 04 Sep 2026 03:49:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm8583927eec.16.2026.09.04.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:49:09 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/5] char: fix typo "funcion" in comment
Date: Fri,  4 Sep 2026 16:18:47 +0530
Message-ID: <20260904104854.25272-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104854.25272-1-hemanth.selam@gmail.com>
References: <20260904104854.25272-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "funcion" to "function", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/char/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 63253d1de5d7..f9db486d7029 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -76,7 +76,7 @@ static inline bool should_stop_iteration(void)
 }
 
 /*
- * This funcion reads the *physical* memory. The f_pos points directly to the
+ * This function reads the *physical* memory. The f_pos points directly to the
  * memory location.
  */
 static ssize_t read_mem(struct file *file, char __user *buf,
-- 
2.48.1

