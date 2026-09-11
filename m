Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AF23750BD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139116; cv=none; b=UT/HcyFgPZ3hBmgamJW9hivKy6f/ieuyza7+Rq3b1OGraUmXSsCQ9oyp0lLN4Jh17bfRo7KRoXuyPwRACddWi+zB7ewRG9jE5oAygkuMm74NMxXGFjmhRYjvsJutr8s4cZ2EJvJbcsl3ynDZ/lu2zG9zONL3Wr0zO74/obayz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139116; c=relaxed/simple;
	bh=SulItpOpA28ukZfWYCS1+ezWXd+i3c1ust4snZvaoAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4G1rkOk7E02F9HLJX+bT29P5EtqDB1HskaYZW7EgQFCyj48/VZq8tuse5u5lcgGeKJZeLDJJla/bDIf1u6mDIipL3mr7Q2cYmDrII2DhMiJjUYqK81wZUU3ntmi2SrwoVusEIALkw6aMEDGNbLgZ9/HUFIZNpzMfd1qgJ3txbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dpY9Vw/W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dpY9Vw/W"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso12095485e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789139112; x=1789743912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7/A+IkvGH5yYLsl3B/FA+2ENzgeK330huKjO7uo/XWA=;
        b=dpY9Vw/WbRSQ4vAmcbMbVsDNf97x3fiJTZq1V3vuarPpkrVkQMkq7Qw9A3NT1MpM+z
         L3pCZuHMbsVeZ07kHa79dndIHXwQOCQHY9dcRkLL7qpE1CdxelO59oqkVSOBO5Qd5eNk
         wxQy4TkrGLSeXDH8DQQ/XCg7NpAnbvI1BRBPTHihUJqcg8DnhFFThHW3iT/mcEpbP3DS
         IKx8LonNMoHEscVCzKZsJDlxQZ6poGnEY9yZY1WhsCLpJUNdV7vT30jmqvxP9HVX78cf
         ZLbcHsOOADCJZ+kzBfHM+AGn/66uFYWxppyh3qA1RSoPnSs7px5U0GxR+sv5+QCbGRzL
         aA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139112; x=1789743912;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/A+IkvGH5yYLsl3B/FA+2ENzgeK330huKjO7uo/XWA=;
        b=BS8DK3BibGDkGCH5xPJC8FI463GzavcXuU3pP1zu8Dk8UnuaSJ/SSppNOyBpWlVqQW
         G4BANUgrCg0u7TaaS4TA6LihpJDAYVaAQa6XO2O3PaaoHR+pPoKqJ06rXZG5fIdHoGpu
         f/uAEYB81FW92nWrteoWn8hblEpNcRe6oX9HidE9iUQst//Lhx020AMbVFBwoj06rH+3
         nrvYc0YmuSSZTs8yCFqN369NB5D6X1EzxXlvF2kmqclkW9OTIipi63H1AWLjY5xH38N/
         +nTI8vnhMuhKOJfCAQ49PYz8dOnMDfVcbXdHf8RfEkTLl3aRF7pnuvhnFxComObbNhMh
         sFRA==
X-Forwarded-Encrypted: i=1; AKwUvBweAwDBUkmHaE78jXU+raXjCL1fwUcUQ8FixKVLnGSzf0GkLO1acHwQJhJsMnfkp+uJVQNk8kRcdvjkoy4=@vger.kernel.org
X-Gm-Message-State: AFuF++lgXyI8Byq8vtiOwwWg4lsLTCOqxBOKfobgrBuhoeeRDqkLpMBd
	6wzTIl92Zm0hdSXxZ9IlF+Q22PgDClfvt10gb9FsvIkXbdfrQVpaiHnt3BW78j3Jgts=
X-Gm-Gg: AYBFou1IKVc1DffW2iUsTUO19DXT3LYVeVfDGoO6tdhhWKEdbhBgfRT8m0sT73wCF7A
	oPYqf9oQXilnS0D8UrnchxBvxgeFdKGVsOEOlwXoSiinluq/8tN/1oIIN9sOsYwDN6ycuBnY6r/
	kLkTL2wi2bYFnrwVeHzF8LoGOYknH2Rftbd0jDZ1myvBlGBtTs0HkgIS6a9iBH2Js09ekWP5pRg
	zixiCEyoQu/voCvQN7gMGoNjHbaqO7CiitTKVT3YOUF1UqvZ9jc8QqY+J2HxNWRCVNCSGnIghR8
	tStnsnPL4r/fizpWQolUl+4rrKJ4owLr6pEn3hFPJ4OzCDtuzZlb9QyjCS03Dn2JBwBpHz/HsL9
	rQ+CFHbEGGG2GTF+lL6niXAw5c1UbWkYrENyJDzZjJfQw0Fphhexj308sqz2eeCwiiN+EBFQVgk
	H/ryiigzVWrBmNBueYLL3zUbHBN7TeYvWlBehewrC0XAlQ6v/Z+5dSE1TxOLUQXxE=
X-Received: by 2002:a05:600d:8498:20b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49e619c6eecmr39713085e9.27.1789139111976;
        Fri, 11 Sep 2026 08:05:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6853579f8f.27.2026.09.11.08.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:05:11 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Francois Dugast <francois.dugast@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-block@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-api@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] syscalls: Include error-injection.h for ALLOW_ERROR_INJECTION()
Date: Fri, 11 Sep 2026 17:04:03 +0200
Message-ID: <20260911-module-include-error_injection-v1-3-5da895d8c84d@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
References: <20260911-module-include-error_injection-v1-0-5da895d8c84d@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

include/linux/compat.h and include/linux/syscalls.h use
ALLOW_ERROR_INJECTION(), which is defined in asm-generic/error-injection.h.
They currently rely on that header being included indirectly through other
files, typically via linux/module.h -> linux/error-injection.h.

Add the missing include in preparation for removing the
linux/error-injection.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/compat.h   | 1 +
 include/linux/syscalls.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index 8da0a15c95f4..ad37ca617e65 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -18,6 +18,7 @@
 #include <linux/aio_abi.h>	/* for aio_context_t */
 #include <linux/uaccess.h>
 #include <linux/unistd.h>
+#include <linux/error-injection.h>
 
 #include <asm/compat.h>
 #include <asm/siginfo.h>
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 8413b624ad47..552d9710a0d5 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -92,6 +92,7 @@ struct file_attr;
 #include <linux/quota.h>
 #include <linux/key.h>
 #include <linux/personality.h>
+#include <linux/error-injection.h>
 #include <trace/syscall.h>
 
 #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER

-- 
2.55.0
