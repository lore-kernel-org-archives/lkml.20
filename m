Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA537BE80
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331545; cv=none; b=UP9zqTOpifAB6DGKYkkr6fqfbH9J7I5jixoe479DNauy3iR6myeuajsI/sYZo42Ui4aYb2vNjskXeEJDiDMnrNBLZIq33I4NUYCB+cDTL4DTJa1Ua0TKKAVHbaz/AvdiG/2n45KlFAk0oMrJWaLzDj4fWhj0/1k6jKhxo5J7SjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331545; c=relaxed/simple;
	bh=WYh/0eZ2LY1uEi1DfAiXRl4XWyBwrmV/GsNZ3OxaaJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWAUH/fATc5WROqGprUT1CKJ+qKhxIR8+YxIGAyeB5fPLqjX+AvLTRehN/r/bBjEnog9tYV/lVFEJGJbEY3e5Pq3aF2WAuawCcDumtXq2dNGSAz7uWUQo+TV9FDOWv8cpDq+BPbp4qmc+1bDaWL3+zu9FdH3DSijG6I1W3CONFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSbCKsww; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSbCKsww"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a5aad413so613292a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788331543; x=1788936343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhH8Mo5IKwB8nmCAJcEjBx6yBcTLSZlIEQfHIlsogi4=;
        b=sSbCKsww6aEOJGgKRsPEuoZMgHFSXKlwq/UEtYOktBS8vrgIu+YK0wvOm7amCLO5ZK
         U0Q0LePFMXTiWe5alQgo0Y+xgbenjT365g4E5g3zdos5tuBF16QfasWmSs8twtycFoJU
         +wVsOiQkymIROy9VxrhStXUS92zbfX/6N8jdhtAFja593bhf5SvYJkF6teeFTSMjTOIM
         YDC2HwFTdVNaom8QVw7jB0Pw5P/jnIpGAy+i/Xmc/WYB27j6XRH8xXfgk2G5NCZBk1EK
         1juA6qfV/3okFtqWeb48qu4BsAdVPQNFasCk2fsq3MlllR1/7kaqwJA+0jlUC5zfUgoA
         g+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331543; x=1788936343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhH8Mo5IKwB8nmCAJcEjBx6yBcTLSZlIEQfHIlsogi4=;
        b=N8nQv+QY9yzmkK2DxkyiKkXnNyFhArRU+wrIFmBYRW+/mgMUNWiPP7CLdEdMp+w8M+
         NlaTg0fj9NlCQgbJmFlGwKpLwDIb9iL5VfALne7iBnQ+fXI/h3B0gD/oXeUJVDII2DrS
         NSQgoi8lyLh17sVlw+7j/9VBaNCQgrAKUVuFkJgX4ECa60SqgqHo6n0+mSQOA2OtA9ZH
         WI3Evb/5W7LUvwBoyDtmajdx9LGoVK+iWKnQA9okwU4i7Ud4I4H2OskD+5oiJEKY6kds
         oKJFZLAOHSJNH+s3BgZDu2do9HSAOv6SMgXcZZaTE0YcYIcrDlEuEMJcUYntMYDCb0QO
         pFLA==
X-Forwarded-Encrypted: i=1; AKwUvBybVKoddA+X6iGtgz1jZCQIN2V7A4cvXwmg8V8oTQZ9vcrUesq69eFhR8uDW/kn40TVCZD2vjoy+LAzwAA=@vger.kernel.org
X-Gm-Message-State: AFuF++mVyloi304/ahxZhVZ5RSpcTj40TpkPHMnuYmWj0S0UbPjWbMzW
	O4LkNPQtXAIIZ2Uv0iMoUqWJ3VvSnFdhj0+PRoyKNyIupeohuIBPkCsq
X-Gm-Gg: AYBFou0XtPPa2VPc77VUeOSAOZ1npxVu2ZcLy+qSA3S/KKPwkPmWsSPsujgrAEgvs4H
	IdLKgPgT4WBEzkG2CXgb+0InXYghFPDsDLNLJ8BQOlBJCcGDfTLx/oGMljfzBh3TF8hBGOrbtMf
	vAHN+uZzXsw/PE5AKhoavcl53B24x6q4UaTQcCbe9vQWRlGeTy0yfUEVyCnpF7pGZVKC+zTXDoB
	07qyRy6+uiiSbvWhCzrRwKbSkmwrGBqMGCfhEpL48AsONC1LcuvhAy3m3vtwTZCunQQPm/ia0Kp
	j5IOopnjIBaEPdJ/3FtUk1BmrFYU7hDwRG6jfJP/bHSYTvL1x5CEtrZ9z3GJEVqiylvgerFcOTp
	jx0VNyNxEDQeYs1eMktktpCud3a2roayVkcHNzIoYhv9OarYEJphLA1pJkCUELVjyi/wyCdAzyW
	NCV3hK82Y+xyfxTmAZfUCYd+1Z7H5OwqDp63rD1IYd9omcweXwKhGbJxv0rApGKnZI3AdlMJTQ5
	KbQ5PPPxxU4aR4N
X-Received: by 2002:a17:90b:3902:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39aee13c238mr3645191a91.22.1788331542955;
        Tue, 01 Sep 2026 23:45:42 -0700 (PDT)
Received: from PC-2B0BA31200898.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm11051480a91.1.2026.09.01.23.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:45:41 -0700 (PDT)
From: Meijing Zhao <zhaomeijing100@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Meijing Zhao <zhaomeijing@lixiang.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Wandun Chen <chenwandun@lixiang.com>,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] mm: trace: decode arm64 and sparc64 VM_ARCH_1 flags
Date: Wed,  2 Sep 2026 14:45:08 +0800
Message-Id: <bcf0fea58240c4b6daa253739683ed7709e42fbb.1788330432.git.zhaomeijing@lixiang.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788330432.git.zhaomeijing@lixiang.com>
References: <cover.1788330432.git.zhaomeijing@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

The VM_ARCH_1 bit has architecture-specific meanings.  show_vma_flags(),
which is used by VMA tracepoints and %pGv, already reports the powerpc,
parisc and no-MMU meanings, but falls back to the generic "arch_1" name
on arm64 and sparc64.

Report VM_ARM64_BTI as "bti" and VM_SPARC_ADI as "adi" so trace output
and %pGv dumps expose the actual architecture-specific state.

Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 include/trace/events/mmflags.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/trace/events/mmflags.h b/include/trace/events/mmflags.h
index 935893e5ea53..02caeaf359ab 100644
--- a/include/trace/events/mmflags.h
+++ b/include/trace/events/mmflags.h
@@ -168,6 +168,10 @@ IF_HAVE_PG_ARCH_3(arch_3)
 #define __VM_ARCH_SPECIFIC_1 {VM_SAO,     "sao"           }
 #elif defined(CONFIG_PARISC)
 #define __VM_ARCH_SPECIFIC_1 {VM_GROWSUP,	"growsup"	}
+#elif defined(CONFIG_SPARC64)
+#define __VM_ARCH_SPECIFIC_1 {VM_SPARC_ADI, "adi"		}
+#elif defined(CONFIG_ARM64)
+#define __VM_ARCH_SPECIFIC_1 {VM_ARM64_BTI, "bti"		}
 #elif !defined(CONFIG_MMU)
 #define __VM_ARCH_SPECIFIC_1 {VM_MAPPED_COPY,"mappedcopy"	}
 #else
-- 
2.25.1
