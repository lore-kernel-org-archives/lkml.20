Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0D03B9D96
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896003; cv=pass; b=f5E1Z9iRn5g0o+WrZcUicbNrbOgquwe4MY6Iurt+LaI0x/1dLFGWdrQzR2MWz43u1w9y3XASPD7sP4PrBdcfoaFjAoadRs14d1hiDBboU33CkxKy4d5QDovv0pzO2h5XxP95yN6TfYVGUZfJXMtvfYqvauEu7lcAnBYRZ36EalU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896003; c=relaxed/simple;
	bh=H3DOZuT5U71ZhBZfKYvn6XDnq1zdutTIKDZSo/ZnoCw=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=nZtb2Aj0oSMZCNb49wl0JnYlcAYcZ4sQ6hnOYJAGOmZ82vb84TK0KC9tab+mvT+prVrh6kToDjkRauwe1mDIzNxcvg0+SSw/1kfeuhUjTTO4roLF6AmhyaBuwhMDj71VyaRpTXIHtrx+zFM0cl0vKV1c3O9Mr9zG9cYvNCxxtd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=L/r949cD; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="L/r949cD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6d28aa26cso4895445ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896002; cv=none;
        d=google.com; s=arc-20260327;
        b=qv74uFqCxHzPggJgvlvLOpVC3iQq8o2ZhSgZ5Ed52JleZCLkP45Vq0tDPkqnzVb4AI
         lx8HZ/NdOvxjXt3IV1Dbd12bchPhsotneKMMWatnOS7Ypg3AqcBxAk1iEtNWPSrvYl5n
         +wabvfrJwz+6nlyB7idqeVFSzZWfJoRhZ+lVkz+bdhyv/glAQdwx6vGCZ6v1WwF3avY0
         4E7xGXfINNQSMlE1vFoZmvJVOfsw0Nuqm/Be0RAe9iPbaOHDT5TKVvk0HPUaf2gTjfjx
         uBkDgInuq/Pvz+46dN2iGhLFe9nlHI7zPUrq+yKtICiWhvuexbJtvYwhZXI5XDK0NBDm
         KSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=fPiJId3tOuYlDXjHCXBtb11mj/amv2bXs311mP0GvCI=;
        fh=ExyqVkykjWw4W5LFeid86QPvfFLzbtiWRnTdFGr4axE=;
        b=HZ96eT1Zdn6Lv02cUEZwjcZfRkl/lJGjqWEB+tjGj+cOdynsINyPxAdTN7zFIxzlJN
         Nr0jv82Whm7+mu9+D8W/+sPeTwH/8sEhD+1h3EiK9aM3Lo3wRySrfEOglT88l5caX+8z
         vIMGiQYlUGbzXMW09j7QP2tw677Nw3ZbYfeKZdoO78/EeDU4igASV5Wkm2vkDLK51/Sg
         H/YSF4hBlwL/uAYUWMcMrD7PLJpbaGWjLpkNAg01eJVG6lEKfWbUC4k4GeGWZLI7t71u
         +SbnHiJCHNqW8OYQeTncpblQIfXqSBfbw/BLHDfEWPaWOY2gs7LJnDfv3y8md5IgwVI0
         xtBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896002; x=1788500802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPiJId3tOuYlDXjHCXBtb11mj/amv2bXs311mP0GvCI=;
        b=L/r949cDpj2Fgb8YrJGP5GhTGZm+FlGc5Sa/BCzAmQ5M1+H4BGqI/DEh6Mym96tIif
         AHLfvC4mdu/Tsq9D1VyM8RIwtms0zLE0IAoc4yJVNFiGDDxrWHVU7Ayf62yl67fPtwRF
         x3wtpRo4Y9bBLmAQP/tYIh8LB19ieu/bsBT+y3fNsRy2BVPtHsjRwllFXx8+s6or+kMG
         TmuU16Gw8Q8EBhACTzFTI5GG/p64EGPmLHPaROw6rUKA2uDvDUpLUSC6iUqqkNybB0Xa
         P+pyljHPo+jkIAK+5tm9cVzaLYrlPsMhIDrZlhf8RYxJurMlBNfRzlCD0grabaT9azLB
         BlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896002; x=1788500802;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fPiJId3tOuYlDXjHCXBtb11mj/amv2bXs311mP0GvCI=;
        b=XmM7SXEtHqbiJS9fw0VoWCEPsEWqrl0A0RN5mejDyUswgSWUa/55StaVYur7NLZTNY
         sSeibNdlKqD7MA9nt1nxK8Qgm8FsbcMbQrDezEKvBYPCl+r7ugb0tJCNbH4qCUupW3gO
         X3SFtACYa9sekfrNiVh9IX3TXR1dprcAb4vBESvJ8glb0VcVFtuomCGLK3flXyls8Lf3
         8jaeBl6wSm0Un9p2f/dJ9qYjnxcxLtE3g77vun7bU9YBJLLbnlNTO83Y63L/Icw4Or61
         9JRqMHfFUKfAuRkuHnrjPYJrq1NIrM+f/5eoccfwtdvW4FHFa5ydRsiDEhyJGezpyK2+
         7Rfw==
X-Forwarded-Encrypted: i=1; AHgh+RpvkbaRGOWWTYAUBRKj/Mq8f43yJPEwhGNV+c4bYd2bCCbRgKeHK5fcTkcBTN4POvBechx0o/KhIUq5yU8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZFA4mezLbB8s+lEJ0dR4SBwcqWMxB8zLcOryLN1gVHExLNA4a
	cTPT5d2T4wrTtsYOtHbYuhKkp8YsBbVXX1sV2RS2VVk4YL57qNLSFeLzmZsE5u1Q2FZx7uC8Yu9
	SUCXwlOf+LpGe5Fn2TSPs3W8mlMxzfBtlovKH+mGI
X-Gm-Gg: AR+sD10RAuPVyqgC4DSrLg7E1ksnLAdL2CPIC8uQGYEXGid5PKOggFzrihNnJN/clQS
	U4v1JzO9luT3l939sdiqVdt3mr3kT1tPS61T+BsyB77KPZ+XkU87RXu5GtVMnuDKcfIQa/eKgj/
	y1UCqvGJTjZNyKRD+9cNOqp7vzNYfM9eZFt8Aw7FnmsgThIq59TEupaidL7iTjTYVqtN2A+X+qt
	R6585c7NeHJeNQKggaJtGMY+jEPL+YGFSFhZFWUnlGGXP/0uggoL8cUKVyNsorKWvjXlcFL0q7O
	chhbHpyK+EfYvdwtZ/+givRBvgGXqLBzMF5EiB40RJO1RM//B91Uqdu6vjeAtSZ1s0Q3bhkn9E9
	R/ieLxxSo4R1gfmg7YdgZm03YzLSi4bqnpZ2r2gqkgBY=
X-Received: by 2002:a17:902:d551:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2d74dc2ff16mr88551055ad.5.1787896000885; Thu, 27 Aug 2026
 22:46:40 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:46:40 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 05:46:40 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 05:46:40 +0000
X-Gm-Features: AcwNN1WFGptDLW8DFsqByQqJY8BAvYffBJ535kZN3uhDUmZH5Ko6eMgDUF934bQ
Message-ID: <CA+0ovChn8nTkgAs3sw+_YDhKWszxMj-tssbPdwGjPMMC7zEpyw@mail.gmail.com>
Subject: [BUG] general protection fault in security_path_post_mknod
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: falemi@asu.edu, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/178-general-protection-fault-in-security-path-post-mknod/

  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:security_path_post_mknod+0x49/0x1e0 security/security.c:1430
  Call Trace:
   security_path_post_mknod+0x49/0x1e0 security/security.c:1430
   filename_mknodat+0x40e/0x660 fs/namei.c:5172
   __do_sys_mknod fs/namei.c:5207 [inline]
   __se_sys_mknod+0x3a/0x150 fs/namei.c:5204
   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
   do_syscall_64+0x146/0x480 arch/x86/entry/syscall_64.c:94
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
