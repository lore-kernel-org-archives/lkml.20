Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6A217648
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137776; cv=none; b=srFues15LVP2jW0pY2RRSA1edfs7vmXrtS44b7Sqb7yJeKy7G8sgshSeEDfxZmyisrt+a2ZMq/r+B7pc3G+kgFPD3OAlP9+qolZBDmNXXm3Ct49xNACBeuyj+kVjNPaUro0EhOgwlWmR8ldE5KwYiLLeeHp11Pxk0Z+lTEXCtsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137776; c=relaxed/simple;
	bh=0IbYtktTturnkEVqSlPbeY9GBPBTr7a/zwfoJfBYE+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MddUMtwMhlxlosl1qBv4ltG6OPKt2NnTnBC0t0xPkKH4OM5a1EDJbrOIu2x5evsiafn+7C3OOZ+g9rs3ELQ8kmQHWbzSAEKpBixckmyXgzpkaCyjk8om1Vo4jUWAAPAl27knnFhwSjdqp9cljnVEhP85+mmMlO+crIFx8V2oSsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z8jfTWos; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z8jfTWos"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso8728645e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789137770; x=1789742570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKEH1rdH58hXYuPTfWCTfgwfx7OW8iMrRBH+iDZ91m4=;
        b=Z8jfTWosaEo2HWD2p/bKk1WPbhl/j6Pe2eLIR8l6ukhtfdaUijFMgVf2HCa7Z298SD
         CFcykKCNEosaxh8H1INhTq5m0f/XqRC5fsjT3azAOB5zvpsS8/QUec+opqz9bhiKTnqU
         d9RmGJF1NWoJcyLW+ZxqfUoyWaOTXdhY0cpc/f3YvvjKb5wGSG+fI9QgimDFakTbb0kJ
         IIbtE4rW8l5mj6FAffDrI9GM2LakqOKXPCbR52H6mKtRGrfm6xiQsjOBjF1gLaMmLQxl
         wu6l8w57NLr0I5Z07RgoKWtMTRnqmzpagspnC+ipJvRR48TYm/Jk1bElpF3Yht6+affq
         4D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137770; x=1789742570;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKEH1rdH58hXYuPTfWCTfgwfx7OW8iMrRBH+iDZ91m4=;
        b=drxIbSSz1KZx8dtLq2G7nvH32QLQ2g6FMzfizGOf/1WoKR2tHIxpajlS05+oy9lNHY
         S3+sgl+9oL6sDtcMfX05/v+5nG4es1HASZC3slBMueeFh6HDZ5rqrIs6rMkQaSij33sS
         6onQpCgHncq6TmSAiDey8XJslM30BPux/8INKSN2CuzF51desNhHntk9iXu8xpyr78nr
         IDUxXR63LQThteqo9AJE5mPH5p075JZ+1FANQ3Eg6oWUL52unCr7MX1mM7ccSEyMncO9
         /vzT9gsbO2h9vrc60/p2c/v8HfNccDoK2nm1VK/WPQQEJA+aCQ5K6dJhrTJk2UIg212Z
         CvCg==
X-Forwarded-Encrypted: i=1; AKwUvBxvP44Dg3EUTzjuW3HlJ7uTbGbAbgNTkfTCgkG/R8E16j1agcIfjcSl35XDVcOsP8QgxRdSgKI7cibiY0k=@vger.kernel.org
X-Gm-Message-State: AFuF++n9C8FkLnUUHr2KhszUg33UQY2grrSJ3HrDt0sAs1zS6ndigEHw
	OJPZzagZgWBe2tobhNU0S5mT9QW+V5rDg/6kKxu7wap8sEmGHoBjnTgMFrOGynZjkqI=
X-Gm-Gg: AYBFou1csXBiZIwUfTHPjrn1JKFhC+zXDh7AsBCoKE5LVkYfr0BTjwx6kP3FNvUDiuM
	HF+KHCeUfX0N1sj8Hf7yiaw5y970FZxA/RLCgcvMsTqmqUvXYHKIV0alndhCUnh1d30KFt5a9UM
	NiCbCdzuuy4K4rWrgeEgc6u9T6yKrnrn2zvZSrG5pbtrsTCpjzLFQbJW0uIOTND3yQlh5HkiXj5
	yMi0DAx19fuewH86VUgbF2M4WnB/HTQNwe9Q1QaRJy7Md69Nox6pcoPU2EX7ID87fk6cPEPuWaE
	Vq3eMnsZxA9o2GJ7Pt3QhSq9kv4dPIVAs1UapYB7XtHd7EuS4rVySOh7DJmDJa9+sdxCA4HQs2+
	MZh990+Br3w0jeDycWULT+1ZuEIl3YfaSdTzamfT6HyUztAp1IiPnaHvmHZK5lYhC0+3ugBLjGu
	4SvoNirOKjtc8eXWL6lXwWHhU42uPiolx7ZRyX/R3x/NQyYSV7dZkN8cqJQilgpemrtdiuJN31d
	+ztXzU=
X-Received: by 2002:a05:600c:3b1f:b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49e61983468mr57196585e9.5.1789137770026;
        Fri, 11 Sep 2026 07:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm107038405e9.4.2026.09.11.07.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:42:49 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 5/6] cpufeature: Include asm/elf.h for ELF_PLATFORM
Date: Fri, 11 Sep 2026 16:40:35 +0200
Message-ID: <20260911-module-include-elf-v2-5-954c732975fb@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
References: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

linux/cpufeature.h uses ELF_PLATFORM, which is defined in asm/elf.h. It
currently relies on that header being included indirectly through other
files, specifically, drivers/base/cpu.c gets it via linux/module.h ->
linux/elf.h.

Add the missing include in preparation for removing the linux/elf.h include
from linux/module.h.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608151415.UAbFbpvE-lkp@intel.com/
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/cpufeature.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/cpufeature.h b/include/linux/cpufeature.h
index 6aff540ee9e5..66027987e9d6 100644
--- a/include/linux/cpufeature.h
+++ b/include/linux/cpufeature.h
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
 #include <asm/cpufeature.h>
+#include <asm/elf.h>
 
 /*
  * Macros imported from <asm/cpufeature.h>:

-- 
2.55.0
