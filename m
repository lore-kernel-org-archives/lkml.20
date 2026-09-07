Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83111D7E5C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764278; cv=none; b=NXYz05OHKrqwjvzo+djKEVq2kLXDTQjlPJ9T9pfaasxG7k45olB8Eq3BkbGztfqPc3E9uYuuEtaWJrBqOCNiBAES+mX0MjjyovG5E6AyYfkHHaV2n41KBqqlgUc5rpts6kkI6CpLLeME/+n0OYKj9IPM4AseV7+t8sU0hmMZd38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764278; c=relaxed/simple;
	bh=jA+SkYgTIEdOGVBu8gHBSUuHTdh9gRkC25wu/moW/WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBRPcVlV9KFfIEeG4FX8otlKZdgfNEpnitmduLxJgtYI9G+7ad3LTVL6XonQ0YqXuj26ly+Bw3hkUiqlRiErGOKex7CjLa4/NXTbEQDnImPGJtlie5FKuImefxju3OqzJnY645eflpJ0yHU+8irdkD2MW9hEIrZZuz6qTWZJupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO1T4QXg; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO1T4QXg"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2104518a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764276; x=1789369076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+l3QX1SCTMIlfF+PwlTB+2IPaBP0W9NXFgZJUL7rs4=;
        b=iO1T4QXgmr4BEDyoRXD2M8bhEXQIm+tGGVdPPFeAs0FTN0La8ZASGrFwQb90mMf2WX
         4DMdpAIV2hOEJM85QJW2iGIOujtevhNR/NWl4RLPM8RCy2GfWsuCOpkpvbwFdBafZZxj
         Y5EwADjaGiEZBSyelcUYv7xzn7AbqIQuo9494SGS3o9qsH9PpwaacMtqq3bTmgmmmT4Y
         bWQ7Ww3MEne08xLhi0Zm6jlR9sf5ivTg11JuTnqo1aau5on9/zctX/87NbYLCfF400Vw
         1UnVd1U9eGAojrqshlELVa9UrpfqIDQUhGdWvACHwW2gxgqyyZOr2Pr1HuXzSYlnpbrt
         ADGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764276; x=1789369076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+l3QX1SCTMIlfF+PwlTB+2IPaBP0W9NXFgZJUL7rs4=;
        b=OQkZQEEHjh7d4GMw2PnwGEUChf7bn+C8NFiCxp9Aj99lJO8ROZdR0VhWpVqA91qIdB
         JMhNRMxIH4IM1Revgj2Nv9hj0VAGEIqfic9yByuXq4fLAPG/F15UiFL5+Wsh6WyV+5oT
         mEOEgzqjJEEjKWqG7Nu7OfFMpjhjiSj049kN0oFMcBU9lnPxnJWIWTegu+VbMxOapsAb
         22XwWEGq9MbJ14iozOIHr/trYDMKg3P6FSemaROfMYRLsIG6sisKZQxNwHqvr+QOuQVL
         oUjIL9WvqIAUW0+BhF7ND+fYVYJxednOMCr7mDZoqTBeW01QkOvPwbyQskbBEXYvVon+
         ANOQ==
X-Gm-Message-State: AFuF++mYwb95D8pmJA+JW0VDPSv5iTXoyqYU0RiBqCDiBkbgKTaGjOM+
	ojZ0G0QEUmP8L1jmtoJbyiWlOLOFDiBKJkIcW/V/vkcc3cHgpc+dSaIg
X-Gm-Gg: AYBFou19nKJc72bgRRwHZes/RmLgSWRIJFV5Ue6strNkewSDuDaAjD4TIyZTelT7jYS
	ILuspyrygROQLE9TQYPrQfToCdtnRJKOfH+v7xVt0KKo68TQcSQxEu+swNPSglLjJxakPBgmK3J
	Qwmd5coCgo2dmZ6ipGIzhERSrvCDkH/6Nt1E2CRrMWJzMXefwN8ABJPwCmNt3qVRHTxcopDz+MJ
	jU012RsNptspziHbyYY6Riyds7Os7vJKcFfdBLlQeFKOdERUNZewf5vLjYGjPoKk+mdTBAiCkz4
	g8u8zZPY3TMTWzbIJVGKqMMLl9+1NqH1OzgnzPUGo0qoVaa0uhlvYinUnhUUz8Y9J6Z9G4mJrQy
	iqcQFGLh+JBdFQNaOglN6UEnLc3wPUC0NJINrhsBUF7ROSXnuevOyUWS5aO0ENg1IE8fVRcnWwp
	BWHijUwEwEZgB/eY6vOgwVn0iQMbAiZuRYuA8BLAPWWv2o6MsNH0D/3vGjz7WtqH84DRrdtq8HG
	BsRk7aMn3HR6pE=
X-Received: by 2002:a05:6a21:3a4a:b0:3d3:ad3c:49a7 with SMTP id adf61e73a8af0-3da3a1ae36fmr37755508637.21.1788764276182;
        Sun, 06 Sep 2026 23:57:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm28567247eec.1.2026.09.06.23.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:57:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] vdso: fix repeated word 'to' in comment
Date: Mon,  7 Sep 2026 12:27:51 +0530
Message-ID: <20260907065751.22783-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'to', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/vdso/getrandom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/vdso/getrandom.h b/include/vdso/getrandom.h
index 6ca4d6de9e46..1d9dbd4d76c1 100644
--- a/include/vdso/getrandom.h
+++ b/include/vdso/getrandom.h
@@ -64,7 +64,7 @@ extern void __arch_chacha20_blocks_nostack(u8 *dst_bytes, const u32 *key, u32 *c
  * @opaque_state:	Passed to __cvdso_getrandom().
  * @opaque_len:		Passed to __cvdso_getrandom();
  *
- * This function is implemented by making a single call to to __cvdso_getrandom(), whose
+ * This function is implemented by making a single call to __cvdso_getrandom(), whose
  * documentation may be consulted for more information.
  *
  * Returns:	The return value of __cvdso_getrandom().
