Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947C939F160
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477934; cv=none; b=iaNfVk7yQCspQ/rHa5zVZOzBKXFzFybKFCZZOJbFV5lrJt1jjN2ftW7uPZ1ibL7h1WNehmGHuHAkueDVkjdkuW31/jNmSfCqgIwjA03/KaaVPpv/7StuUbKEx76B0wG8UQxJKgJrRrw1z+vgA95Ea1WWsaS0olFG5osbR7d5fag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477934; c=relaxed/simple;
	bh=OslvAEuCF6cBCtTZDYW4H4/nIuq7etdvDTspNStbkGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PLuX61c12XJ4cmqOg23Lx8926gfYvVNMAKmby+vW7mHek7lDjxvz0G4xB9O8UxCgpwovKClzDNQhLIJA70A9dv+NwNCLmtH/l4GIUl8Qi4giBQ6VMStYrz42oJkWkIk+xDte6oAHJfA3kPtupazXE/48BmLW+jjgYenIecCMf/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l76V+QGp; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l76V+QGp"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b19e291cc6so2721579eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477932; x=1792082732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKBPPF1RRr88KNBz9nrVdefWmPTx4J32YFZ8CbEMgRs=;
        b=l76V+QGppBtZXxP9ocoa/t4oSSFyRdkJ8chvA7e5+dKLf8OVaxE6x6z3AiFV8FhP0+
         bwFP8tyx0gybmA50MY5o9HItOk/3WUvPnF95Fi2KDhhTobqfWi1aDMZLXRExtHggFZWr
         gL7Fef8qbQN8UxoGB5HPa2ZCp3CtA+ovs0ywgiaXyAj4J4/G3dkRe0eLgzz24cmGC0jk
         27FbxNMeOgZ+LplhQAITc6sHBRcz2ZQf823J8nF8oy/FN+Uo/KGWxuUfvlf5dXKyhThG
         xKzhqSYfGEOnPfOmIxUyButqkGp1+IFXFXdhmZNP3+JGOKUUE01lwz5fXYvL0+7rhVnH
         3/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477932; x=1792082732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKBPPF1RRr88KNBz9nrVdefWmPTx4J32YFZ8CbEMgRs=;
        b=ZEM/cUOOzkcah5JqLkotk7DrQVKzynWs0idFZhO6v971iMkoGxvP3BUKJ0lv3pYmws
         gELJtHkJdQ/kHCHv9a06z6LbaUjmfwMczkJ0DYwgGPlq8ENLo2ucsLpY2QEH8l+hjTs+
         dj9tQbvnUIwsYqlM9Jjie1cKaqGi6DV/f/QZILcdoXDU0zA/C40ipO1NEwvwS4usfl6o
         qRSK+tQAD/VYIsV4V8aLWhDq2M+AfWuxIQr//zOruY8tSYORjZQ/zO+Vz115fNooNy9v
         GWqPEAeT+t0iCRTn8avdmoBlbkVuwZ+L6WyOOMuLLTUu+1pwZgIZZnhGxHkaN13fggdv
         0uLg==
X-Forwarded-Encrypted: i=1; AKwUvByshtdn0Hsj6LPEczKySAFVOkRG0sRDu9HE76Ei7pSt67N0TKlBLhPeTHvYfozAmS4XQy5Y13TTaoQ96f8=@vger.kernel.org
X-Gm-Message-State: AFuF++mF6C69sylckD17mCx9CFlqklYtPl87vp36XU52CwulFh6Cqsjd
	rdoNmfgRk4o11WVIcoVIKg7BkOjp//DLXRPZ4V6I+240IeTRPnzQMxG0
X-Gm-Gg: AYBFou25uEtMTqzM+t/3588/6QsrjBcFtdnpMkKKMs36ZG+3WvuFulqokT+8b62B6f+
	2U7+wxBrr455/dcTRTNsGxG8wCOwEi39PxEzwwPUIRzOeIflYYGA8YwMkDY0nvV6JrI0GCGBOdv
	f5d6g8SYCJ+SDnHuEHKOBaiAMbMtmI62jZ02BahDxp7kuHJTjVLs7mXadyb+S75/H+6HvSu4E/h
	NnIMdZziMfkmbL6o/wwIfEIxSKkdGHAWCoIRffilSP9j4NxZRtISzGoWPR+mYfO/wPemQDS6U8v
	4rXvGui8uGAKDP2KnboMQL9G/kkZ+xiv1VbW1+ayhEUxcdM0Hqc0ivyNXkqGZwD061Qtuick0ou
	UJO1tL5O8QH9skRDjcSnmof27rY+suwU6djRi8M0Rwwybw/yqSU5TYgjRXtwWLl8+UftL+IiH+K
	7jZ+3/75Za//c2PmNsXekqJ446m7VNTTzpGUTHkjQ3IBWmHInnKgrjKBd78WizGTzSVGq0lpYJP
	Xx7bWjfHSjckQ==
X-Received: by 2002:a05:6820:61b:b0:6d7:cd0c:752a with SMTP id 006d021491bc7-6e7a899f44amr5561416eaf.54.1791477932256;
        Thu, 08 Oct 2026 09:45:32 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82fc9fcb01bsm82763a34.23.2026.10.08.09.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:31 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix dangling check_top after an unexpected recursive dependency
Date: Thu,  8 Oct 2026 11:45:28 -0500
Message-Id: <20261008164528.3685545-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the last symbol of a recursive dependency is a choice value,
sym_check_print_recursive() pushes the on-stack cv_stack onto the
dependency stack. If the choice is then not found on the stack, the
function prints "unexpected recursive dependency error" and returns
without removing cv_stack again. check_top is left pointing into the
stack frame of the returned function, and the next dep_stack_remove()
dereferences it:

  AddressSanitizer: stack-use-after-return ... in dep_stack_remove

This can be triggered by an (invalid) Kconfig file in which a symbol is
a choice value of two choices and the second choice depends on it:

  choice
  	prompt "c1"
  config A
  	bool "a"
  endchoice

  choice
  	prompt "c2"
  	depends on A
  config A
  	bool "a"
  endchoice

Jump to the existing cleanup at the end of the function instead of
returning directly.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202509.3461632-1-lzsx618@gmail.com

 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dcb4b45e67..2e87af0985 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1181,7 +1181,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 			break;
 	if (!stack) {
 		fprintf(stderr, "unexpected recursive dependency error\n");
-		return;
+		goto out;
 	}
 
 	for (; stack; stack = stack->next) {
@@ -1226,6 +1226,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		"subsection \"Kconfig recursive dependency limitations\"\n"
 		"\n");
 
+out:
 	if (check_top == &cv_stack)
 		dep_stack_remove();
 }
-- 
2.34.1

