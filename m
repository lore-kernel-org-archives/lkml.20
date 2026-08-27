Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B93AF677
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872237; cv=pass; b=NAN3IPpY90KxLS/41hoKIPr6CtcSZth7rkESfYzUU2dJlKakNyL1cwQspuIXuMv+on9u2ZTjjCMpOtvWG5Hd+6M5xgigSN5Y7T8u8TO304v6HjglyD3X5veNAYtInD/fI3ml39eVWNjObn6cq+9lammyEmA5Sedon4sTKd3BV4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872237; c=relaxed/simple;
	bh=50LdrEoltKdAEooP55W9pVrl0kRy8ytzQq3fAZ0chw0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=SDgSKHzUMpqhp5ODgIdcyMZ92b50w9Wcux6Dk4vsXKphanfp15G8RpEYEAGw7BLOwYVC0f2lJjDpZBum1vqxpaEWmwMz6DfTAC7l1nr6MCAjkG7jhtCQB07tW0AguRApRNM/qz9oHzo8dwXaN4xI7OBJ366vwhoyTQcH9GUNFsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=l4Dsvyn9; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="l4Dsvyn9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d71ae3455aso5572415ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787872235; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIYPNZANISlWUGP9UuBQloXxVC4F5MZmIeFj8CVkxkZewWANHNXILhJWzvO5bmdckO
         kPShajN4yZgyxu4Ru590AMfIxWGNVbZsDCpu+3G/Syc+cciNengwgwV04+dZrGe0bg0l
         VzlPo5EcaJ2DcTpY0tsAhzHhHR70n6auqSf7oV4ZO01uDXhXOMoQzmmLtGKSGoIo3bS4
         +yA3X94zz+WNA0ZquAA92+j0dpbrxVM5f2ST30K4rx0RBIm0PnId0ncQQnO+YxgTXECN
         WPIBLDSbE2lW8Qc7LuOmdK82pgn0CR4TNYhQgDqEApJeKNsAlSHZEc06uef8avfWyuK3
         Oyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=0/dlm4IdYFSYRW1eNozPbtx+WAFk89t73wh7qcadLLc=;
        fh=incF1zW9Gkjta+f/YgUjwbh1BhR5q8TDderR1OCcZM8=;
        b=r4aa1Z2Ype/X+ywdKhwUt/0Z/53B6wxSLugmQSpgEGCXcqAzUa5q9Aw9Pe+QkCpw5O
         r+sEbnpQZYZnWAMXXyBspA/iqj19PsUIeGgaVe9+I8fB7uvBh40xGTu/J+aC0nrXNokj
         6KEkuH/dK7+QwCtkZWo1KLP1CMJTg4krEi942/6cZQOiYJkYNx4MXBMrtHzyiqTqXUK2
         5/IvhYaiUFJQ2uIGdaoB+Y+Oru0GWMEluZdjA2YP4W1DBrG0YoRs6O7zfcvlY1EziQCl
         7OydGDzMm26rz6UEBZZ7n/kLBPPsCYBR/7eEgTLkxh1b9JLHvsd7Do9PpCD4658/y2+I
         Ivag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787872235; x=1788477035; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/dlm4IdYFSYRW1eNozPbtx+WAFk89t73wh7qcadLLc=;
        b=l4Dsvyn9Tc8fNV1Kbou1+W1u4WksRxczZSFT/HrUZM3dZMVe3QC+Wnw0DoPtMxUeH7
         B5mG/mnIeFkP+qQ90oFuJkxdDrFdiioOoIfiF/UyNuXWCd2ShjRlnNbqEdCfJvTVslsE
         Xf3VTIlTd5PcAO3kVUkPpSpjxkN1ahAxYk1javpgcJNeabUQJnyqTnvB7zt0ZhqnkW/B
         SCt6EsdZ+F13Oj82hl4Y/hbdP95CRwnrwjBXxy8jKwYPoffOcsoknOxbdqTPuGoaA5ll
         LRQRIo1hsuYSEvZDjF8JAzw7wUxITzGhJkmClNWdudCk6zkK2gqh2us7XjrbCETwVowD
         2PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872235; x=1788477035;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0/dlm4IdYFSYRW1eNozPbtx+WAFk89t73wh7qcadLLc=;
        b=c2zWTJObCtGoKdR01I+Iwjmc8S7Ej163K/QhuZagw5C+3iwwNdCK33ZY1zGMS858qb
         afw5wkyamKCwJiZjepW7esw6QTIkbpa2rst8bLmwV3khUAo3pUaTI9wrcRBjAnY/3VH+
         4VlBlJ8n3PktlK8zTgkE04UpRYV8VCyanR75eDCOm2P8qSE1naP7iwut4+aQFEa000EN
         NkZMAd9R+MOI+0AaGU5kh12Nu086wiLwO54nDrdZXFKVYs/lP+ivyM+bN2nxgOAZUMsO
         ArOJSJ1AtstxXp5/5sks4OuvVeUEfp6tQGYaKsncO6fkUHixzSvCZZPE14bhJva8rLrz
         CaOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr01WMhFacHs68MItJ+SoIPZcqA7ngJZszPpfwyfs0qaWlfkw05+qzT+wLHxwrcxmksclv/O8D7axx+k8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kz1fkn/lgDHHlu/rrbE6KQ4HNYK2UCSdrICSTo3YwrBB8u0BLW
	01sFtGyqhpik142RC6mnyxwzshsrV+1MaZtp7PYa7PKTqtNUnddrR83zLm6P5pgi3SMwdv7u0Dq
	V81sQihUfHCCEVCU7NWLeSXHV8wKITZUoEbAEipPZ
X-Gm-Gg: AR+sD11eT3Ho0Sd1sQ7K0B5I048J/EgdPz78cRwm/T1dF2mOfiVEcuWa/oGvJofJrmY
	VqcFuH+QSLjfl8zQNcfiFTkpZe5Rw/2SGjjLF0LR9EyoEywtLCilUHZN4KcRMZqCc42Q2wIrbW7
	vrnp2EcoSbayccygyJoN+eUaQnkuJfgB+zxKvg0uLtjYic8RpW8ZO1OIlomu+KiTkrWi3VIvgpG
	apY/GTgaAwjptDlTIUuJa2tyaxcIBWdD/ELMvK+EKAuQJi9hEcSJHRREzbF7dmhHH6KKLqP/r42
	2CgMdiyFKTIk0J3twlkDJ0g26w+x8cfUFJOcqpBaCrgfVA0iHEjPWF5KrT9/OSnmweVHM4d9Ft8
	hnHj73gR40Noa0WTkgBLcmtRysK7Ud0j9
X-Received: by 2002:a17:903:15cf:b0:2cf:ccc2:6088 with SMTP id
 d9443c01a7336-2d74dc21be0mr48881315ad.4.1787872234415; Thu, 27 Aug 2026
 16:10:34 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 16:10:33 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 16:10:33 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 16:10:33 -0700
X-Gm-Features: AcwNN1UYjxJ0J4Uy-WWlv_wrxl6FqqhqS4G-Vh8IC2iQfDd3nuMiaGbL8y28Sa0
Message-ID: <CA+0ovCjVF58WLeen2ctdzHyWUASAAW3Y=Yjihyq0pFApYawtDg@mail.gmail.com>
Subject: [BUG] sunrpc: rpc_pipe_msg left queued on a stack frame (nfsd cld upcall)
To: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>
Cc: falemi@asu.edu, linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Olga Kornievskaia <okorniev@redhat.com>, NeilBrown <neil@brown.name>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Chuck Lever, Jeff Layton,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/118-nfsd-cld-stack-rpc_pipe_msg-left-queued/

  ==================================================================
  BUG: KASAN: vmalloc-out-of-bounds in
__list_add_valid_or_report+0x6a/0x130 lib/list_debug.c:32
  Read of size 8 at addr ffffc90007027950 by task syz.0.96/13066
  CPU: 0 UID: 0 PID: 13066 Comm: syz.0.96 Not tainted 7.1.0-rc5 #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Call Trace:
  <TASK>
  dump_stack_lvl+0x94/0xd0 lib/dump_stack.c:120
  print_address_description+0x55/0x1e0 mm/kasan/report.c:378

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
