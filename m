Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F7478E58
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521591; cv=none; b=TTJ9dY1dBtZN+1nw5Kl9lEdjm7+20nFfs7I3PZWpuP9+JPXqfF7Y0QT9R/u9KDSV7otgvfM0Yx2gGGF6QCUdwpBjnESmJCnA2TtMWMvv706LzOrDPGgQD3+4SwX4h5K0AayUPPO2s3WwSViu7GhPAuUD4vPA4SOoqP1KAnOSerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521591; c=relaxed/simple;
	bh=7PDPqTJeVpY7sV80mv2Dt/DZ2OUC0Kw0gnHDFrloR9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf29sP05HpXB+rnODCtj2m7FNFFIxnQszX+xvc1qBVzbFw28n7ZpbUz9gHigyTH/qDXnPWPgOolqBpbgZj+MLuzrQN+hSI+bhvOMTGjlM/giEzeDAG7lo7gAwIjklBkV/UiiOhQ4Yo8h12qpSKvhYQj0/kpeykuBF1OdVkBIdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANhjfi3J; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANhjfi3J"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1b233ca98so664534eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521588; x=1789126388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikztmPTNBMqsUkOsnaMhukEmaEOjEaj+FkA+gBzLwdE=;
        b=ANhjfi3J22Gtg/85NohE0UvzxNCUKWOFYwEj0iwXGGOIiWOF+Q1RzGf9akG/hFOZwH
         3COCHHfp+OrRZBDnO49oYOX99sPZOPNMhuNktxYZ/v70z5GHZtIyzUXzd8Jka4t7G4LX
         gApFAef/QiMEmd4+1Q4hHrMWzDpiNlFG2y6+ctMKVcZ20HqhGPTHAGmx+MxWu442MyaK
         CspUfoRTu48O3I1ihIWEZ4F6d+pKbEKpZya0PnYjmfuIYhoTm334Q8r4Ny9ucKuj+6YU
         nWcV1sIWicX8pJrUUmZ0DnN7OyQNbAgIriGiRGo8b5ytjvHVAAPGuwVm070zkK0N3Lpj
         DdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521588; x=1789126388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikztmPTNBMqsUkOsnaMhukEmaEOjEaj+FkA+gBzLwdE=;
        b=VVxh0et+uFBNKZ7BKNVx+ecpyZqiwSWZwCywem5pNr6JwxLM0hbr0xLggB3cogcKi8
         V0TUQK4IOl1l46dm/9czxUTTlRigp0TUnlz4fwOk1cHP670D+xpQNrP0QzKcYBbU/6dq
         77h/ujaQ1ge9qyDItjRbMkkdIkbph8HO1YeFFPG5ZwWSsmL/qVjybciNfgGc5wghStnT
         zi6iUpZG91I8vwTtYY2m4otvg7p9m2WfkkTcfqA8B5dwgl5gpHqmt+/dgifeCRCQsThF
         74fbBn5pw31yawKZF8WIHt1eOs2iT131PxRAzFi3tQ3zqQ3Apsw0SvCqdCuA0lymdg6i
         WHOg==
X-Gm-Message-State: AFuF++l3HQ0lNcP77FMpId3QgAjtkrHstc8YOGHrsn4ZDaey/trAR9m+
	Va8AYWsFzeW0/0mV/Z7MdDZ64Ju+x2W5iXSlxJGXdGAVsMS/Rt4PCI0MzcTR2+T8SRQ=
X-Gm-Gg: AYBFou14Iaes+PBQJfOPdE7BbcLCdfzLjhv1yx4i0ErgD5VM1aZbB22tanliTDmQuHr
	cc0ill/MicVixgGo+IAS2jVfoKBaTTQcvJtyiXwvDl11wMIK/fy7cZ9ILyLeAMQAxhj/6Q97/wf
	P06aYOyUHM/KxsOWqMDDsBek6AsXdmsZYruQUCpTuuSJbf2unNOX9rT+sPIP2DZXhV73rDPPZEC
	ViHDypgijLsUwinqt6Dwa2Pr/xNwQkv6uGjhghZmDaCucWjt2vQjWxcEXYVXtHqpmvan0K8q5ky
	KPnfvjKzq++dFTbXa8mTY0hCLv6T+jtzVXqVbHM9D26NymL7uoPUMP47dWOU3mXEUc41XiAlHwU
	WHiXAKiwrp1zcwPxL1lkAPVwtW3u1TJLUx1m10XYiPqfvbwatrMk52ooWOv5EYKW/DjPIOjBbd6
	dIRNvKqIkKn/I8CjA5ZIfJMWtm83bNDq8hwA7XdUYq8Hmn7VD6c6cJmsayp9kQQqSX4bELwISxW
	Pns3OzwhDY7umc=
X-Received: by 2002:a05:6820:8118:b0:6b7:8415:d78c with SMTP id 006d021491bc7-6b78415d913mr1302066eaf.55.1788521588529;
        Fri, 04 Sep 2026 04:33:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6469759eec.8.2026.09.04.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] tools/lib: fix typos in comments
Date: Fri,  4 Sep 2026 17:02:56 +0530
Message-ID: <20260904113257.13594-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113257.13594-1-hemanth.selam@gmail.com>
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/lib/python/kdoc/c_lex.py        | 2 +-
 tools/lib/python/kdoc/xforms_lists.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index cb95f5172448..efbc23c01abd 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -68,7 +68,7 @@ class CToken():
 
     MISMATCH = 255  #: an error indicator: should never happen in practice.
 
-    # Dict to convert from an enum interger into a string.
+    # Dict to convert from an enum integer into a string.
     _name_by_val = {v: k for k, v in dict(vars()).items() if isinstance(v, int)}
 
     # Dict to convert from string to an enum-like integer value.
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..423e2bab7667 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -53,7 +53,7 @@ class CTransforms:
         (CMatch("__attribute__"), ""),
 
         #
-        # Macro __struct_group() creates an union with an anonymous
+        # Macro __struct_group() creates a union with an anonymous
         # and a non-anonymous struct, depending on the parameters. We only
         # need one of those at kernel-doc, as we won't be documenting the same
         # members twice.
-- 
2.48.1

