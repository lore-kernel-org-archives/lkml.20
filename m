Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A0137923
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887103; cv=pass; b=Kx/mkx6VvEnrNirL0m98Ezxfr+Glb4/P5Ao/wma6I/U68zc8CtgUObeUOGqU2HEZaqxBgaCtPj6ta3WkO37LGSvyiLGUzR00CE1eVMUwHeCsuI8x7Vq2L5mSvoDhoeJmQvKU8bJvIb1WQ0ji5sAhrMvdmoF3mWLhE6mm9/cBQL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887103; c=relaxed/simple;
	bh=HQ0WnQR17PYv7KRSkhcEskYCEIEvo6me8U9g6cEGAd4=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=e2yNzBT6IdGVVroWeS3G8TK+H5ME3zE/WpNiWEDNTPAUNhE2ONSJIWkEYWcZAs6XFEIEEsoRa8w+VhHnI4pzn6mjOm36PxDww/kcDOmpNDDvyfsaovEJjaN10rkdPFAdG3QYIbGPFJyllm5m7NJkvvoKBAmB2auVbKLqbOZFurY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=VFH70jzd; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="VFH70jzd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71e253c90so5253015ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887093; cv=none;
        d=google.com; s=arc-20260327;
        b=MbLCIVa1FeQd6hfsA5kIpuHZ0j4eQo8prYhTOUiueRaO2wmtyR1DSlgs9PCNqsD2IT
         AmDL7Rpe0h5PapPFPvFMsfHLgxKNeZJWpZiF+YqhUFWDvb6gvGa/cOZJ1ICdwawMBYqI
         sSOo/c5Byda7N29MxRDIardcjZwJoxK3afFNwbRDo/PDTEoKpBk6+iN588HiGYOPlKj7
         r1mmRIF3bfNg4WnBNpo/xb1EKkkpI/ZvLSzrrC6iU0gCPzgwQ3Nx55eZdtSjvQcu5DUJ
         c6blXTOhBNBDvkwO5XgFeDDbj5OyCX2mTag6IDc8XHlpVBK12OYcyehiUC/x8ur7kT40
         KlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=M+pcBwoGootdTMgC9yQZBi4o63OAS0ou1pi32Jt08/8=;
        fh=SVbe/wT3Iw+D1d3Qb2Cd6VamuAfGb/o2V13K6bBgtMk=;
        b=CAhBcJAPR6whKPZQyCat5cq80nrc/XIHT+sB6B70P5YslsrSIdPYS6CHdaIpvqjIal
         q5xY/bjZBaC5fZZ6U0fIvoDvS6Jfrv52do7javjoTKnaTNM9MUQnNMsE46MSf2nPZyls
         8dJUSfsOFJ8zBLaR3Pd47Pz3HKc2O5J3hR0jOqOvkvOl0ojJ311ZHi5jmnphXw0kih6O
         rP1srXiUwDOvROR94RADDxgJ6V8ABvPsNK456fqEgMV0tOy3ZrKeP/JLYjlTR411mGwc
         NCA7Pf4Vmhe81aE0CCKWjxHL6e4CBNgqWrag28Pah/2IAYQCBq9Y0/EgleifBqxj94rm
         Gigw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887093; x=1788491893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+pcBwoGootdTMgC9yQZBi4o63OAS0ou1pi32Jt08/8=;
        b=VFH70jzdqS8zgGI3gE+SQbNwQrRlaT6XDnWXTDnjVih2Yes3iYu0591m2QMX7ypFbx
         fkEynZIAK98WDQXwEP9eAULpnrOYuddPOuzOvUc7HbdbJXoP0mjN56Ct/Po0dVS1kCSu
         cQLf4GJ2Z1EDplwj6fU/SUN1dGTwRC9PNatRN7iyXwaEEz83o3sS0eqIyqEtB/dJRY5P
         ss9Q/c+HygNlfNb9hygwuoTCZcwqWzwWz7xEAgAf8f46Q2nHtCXsL43hEeKG49XAVxtn
         RulZNEg776bCrxlH0O+L5EB59YHxm/QIwPc8w7f5m8lu6eEgz1STCp0v+z3a6Ab62YBb
         PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887093; x=1788491893;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M+pcBwoGootdTMgC9yQZBi4o63OAS0ou1pi32Jt08/8=;
        b=L78fyi3s/0/JVcFRRnERQ1RCu+ef262/k9QPIy6nG51+wxHKh1/Ntp/9djqA6pellA
         +mptO0ajXVuLX7rDZBlRFCWNDsqmdueADXV3t2yA/tpvNkTBKZv7oO85Mq2mgyxvJoHf
         7hYOOcp5HEJnxG1897B19cnzRVozIiUHFEekRsQmtXQppCadxN4bnomiU0iPE7zoEPjG
         +09tjfo1BPCMxHdvf+SojUqQqKFMiGfGk+5B5DxxCALwA4Jkcw31DVp/WYuKx3j7rRrC
         Y7L9Qi1y2VyhdoSEBOgGBe5x0NwzlXn0wWLJEwH2IP9DoOe5SnpAkvo5+dwkxmwgr+Vt
         Wrxg==
X-Forwarded-Encrypted: i=1; AHgh+RrqCznTOAK4o9of6bll75Irzlr0WCwXfDZJVZcno8mgsezaVyrLnwPW7axIgFJSm6L4pZZ+797zDL34R9s=@vger.kernel.org
X-Gm-Message-State: AFuF++lc/8PsnA5TF4xvJUIxlwBxqSkLZSFI/Metri/asrJG7WoElxa6
	vLaje5KfFyqgjSRqkAU0ULRyU2Tix5cBAJkJtxiDRuODbjzsheO1omMIM09kmJ2aOyU60rgUmNM
	WjWD4GfERLTimssB84LVezb6ENiPWhaRV0OK9hT5izmbvhrPYOeqrLQ==
X-Gm-Gg: AR+sD137MCgHswGXO+PZ8WU6tiHySJQkN5rzy1HUCEQ90dx1gpgHUibxDmB4UbKvnpx
	HL98VreOTVcTDf9GpdypT17PxIrwTMFNTsLUurL6noUuE2fY/zOitD0lxaDE35DqnqKzVmTGuNQ
	oV/9mxNSOE4IEmtoWBTPbzaQsjZ6tDWTfLY66/Sk0G5HDHlBWs4UL0cmURVn6nyTu4XWKwKYSME
	+liuLOC98aUPtj7K/0344Pg2QVbRqKLQlq9n9s9eSoQMT0pipsjGjThAP+mU8GBNprjp7C5m9od
	TBeVTn1J+TBA81HqkhflpDE138FlzGovR2DDlVyMjJeaXRmlrAKatTfuU0wIhYafVw9KGG3IHUg
	jJeTar1e2GqmdKbJLJrcoL8tdGuzsYgU/
X-Received: by 2002:a17:903:1a2b:b0:2d7:11d2:1455 with SMTP id
 d9443c01a7336-2d74ddbe12dmr74674295ad.4.1787887092175; Thu, 27 Aug 2026
 20:18:12 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:18:11 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:18:11 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:18:11 -0700
X-Gm-Features: AcwNN1VRnFOVAUc9Rv-gIKBNA-JVvlf1956tLSNytGprkbdWOWJLg0Y8x5Gg6po
Message-ID: <CA+0ovCgYP920GT68hAJK6Trjyv1kGv2dZAuem4LEunycQ=POww@mail.gmail.com>
Subject: [BUG] ecryptfs leaks an inode on lookup failure -> kernel BUG in generic_shutdown_super()
To: Tyler Hicks <code@tyhicks.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/128-ecryptfs-i_new-inode-leak-lookup-failure/

  ecryptfs_i_size_read: Error attempting to initialize the lower file
for the dentry with name [victim]; rc = [-26]
  VFS: Busy inodes after unmount of ecryptfs (ecryptfs)
  kernel BUG at fs/super.c:779!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  Call Trace:
   kill_anon_super+0x3b/0x70
   ecryptfs_kill_block_super+0x44/0xa0
   deactivate_locked_super+0xbc/0x110
   cleanup_mnt+0x437/0x4d0
   task_work_run+0x1d9/0x270
   exit_to_user_mode_loop+0x14e/0x540
   do_syscall_64+0x317/0x510
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
