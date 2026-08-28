Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3C13C1089
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895457; cv=pass; b=ZWv5CS6Z0u6fS62xGx/rqcqGSFtH2H7w5yBV/ssZww0zPqSrj0l4SjytAX3gLkCjwnC6c9MezMXAf1kmD+kk7ZIe91SknC9PmGWYGILiaSug4jqkbeXwq4dhl1fDsDzZtv16SQrKcboYEaHYpDbEguHgaH6vbWiqSC4WIdfZ+Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895457; c=relaxed/simple;
	bh=iR2eV7An+9QCkOabByhQ/5Vb3H/WY3q1I65SThFR6TI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=BQExp16m9ZGdePWu9dbcjqVFC/8s5d2iDJ0RLbgnnR6+Gh1boDVqjKTeMjsKzEwtfaBgSNbOWZQGffSgjo4t1SflFjuB93HOfbGHiovumjWumB3k5d1KCoO7+f/q6/fOBbW6GGcxhABRalNxd3pZaq1MpyokxXLruW/YMxV5/lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=adYE7VVR; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="adYE7VVR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so6067065ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895455; cv=none;
        d=google.com; s=arc-20260327;
        b=DxPH+AxQutP2e3bU4AJvfnkJHEHzUXExA+Fn6chUu6XfJOVQklLbKnyUWhYzzMW0hd
         TQ+QYVk3tSUx2L1LDGvEZqBaqgL9NKsZSxU7Z+E3A5sOqHCC8a05iKdQStnGMYJd5Xph
         AcAcksFe3ZCx7H3t7mXve2W8IcJA2g7IuXH7PIS2vKTnXtV2gcCB0VSlOGjCcKZ3ZaBY
         D+Gtac9qe++YgvAr9iLveuYGhyxIRX/M5oH56cYaITW0a1DYfJV5HML/ifiT8sOvlZv1
         Uk0pnWEN8b+GQPGxCEoG9C4tHc5xRxC+6n4oCK0eD11PWdH2uxa0IfwPgG94+IN9D+rQ
         wHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        fh=jU+rJ7yx26rRGUTsw5V3eN6AHYHhnmRZOlBoPRE/nU0=;
        b=lbkLrWLDgG6TuO2Gliz/7/JOQ/ksZkeku+yKVx71mZDDNox0EhmZZKZ+UQjI1RKBc0
         x0jDPBjl+gk5x4nj2OWyBTQK7elNT+2YmoLMRva0VYcLP+YbQE7gJHvup1wwj5C6LQ8K
         o57oUmp2wpVajizclDUO3ky3A/thiWkLJElPhBKIqbiakp6efdTMe4KHlC4R8IUKhP6n
         zid4zprEeOEN5kXTIVHBcsGxxqMll8RSdXFvqJ8tKKIP+S6H5fzyZJnP/iHDqjG9Kzxe
         FrLhWI7p/9Wz3G8/YmgYl+S+SnENm9e3CZ6Gu/PCu2HmDQb5M2mrUIm+v8hADEAIe7WB
         A33Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895455; x=1788500255; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        b=adYE7VVRESBmHB8rtab/yAkXfiyNnhLIeOMsyZAwg9XHZGP1YVb2NQ4djemth5kwPZ
         JMR/z4P81zCeY/+ylNcJ74owp9WGKo0M/1e8NgTILIYbxLPvAraPuBdbNDED4RS7ahPo
         XEQhDUo0VdBrBDRyEXDpYJ/y1ci7d5TBfyrEmP6Ek+s4c7HJ0PPp5CJhwI5LaBG/NG78
         IxheFsql1ZVbXIYMGYJAkkyqrdqO8+wCtHHzScQDks2Lz92AMtBc0Qb5wJmawQTC5B9X
         K06IOsdhIbOLz7ueJCO8wfHp4ldIbdHH0jHrTNE3G/nYlvK7K1nyi792pQZOGXWHpQHZ
         DqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895455; x=1788500255;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uazr0O6gDLZWNMRZa/tj6YkhQjpykfNiEkV9xS0SmNQ=;
        b=AdPVnjdPF0OaKIQ5H+95p/PO5zkGUqLjFn9MY/rXXTPv4V+NSlYMWdU4lyDZGI8pa3
         s1j8du+9AmTp0fC6KCNjUcA95L3bB7KUIiwCHdMgQjuIHbiGC31KV7KpxIruwob49fw+
         lztdoX3+xsVLYlRE4lTB9eJRsZqB5OXLYWdQgrqIBeGN3NWu6ToS85lRyg65WHoq4D/K
         V4GHSYt1e+XIWJwH23xt4dYOYwWAtmp/XJ2Fycxgrq8lUFp+iRotXWPQKvPmS7V9Pa8Z
         HGk8dq96l10WhmgDtuFz5tFFr8Hr46mnk9pVoocgh4mYbaQMcVN36NnZh+hazrk5oV3H
         9iCA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+DMLtyIvzP7NQzpugsxkJHhidBeCQLrbqVCz2SV0NWiMKEFDiWzjDZEyEe74A9Mo3pdM5TsMieajBCOA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7nB2k12o+NynKvdh1AQpVLqOIalWFgESTbyOHACDTlsv38ajo
	KgTnHy6OVLNuiD05ci4jGHBW0YsjmoX/rnRvNwsa2vwMGVzAArZF0cpyEsG0yz74XRgAa/9NBWR
	gV2jlU0MKPKFgnI1gSoW79Kj3vP+QroA16i9WLoXX
X-Gm-Gg: AR+sD13f1WJ5psEVDI5YITpPrnIYyvevcvTOB9Oz47TPcRAwfX9EegHpAx1QruOuY5f
	suylgSdzNv3tby0W96tO/vDeJCB+EJkDqFGsANcnKls1Bt/+gzg18KrN3xrhCypY0brzwME7PP5
	RuhsDrbQhQiM3FD0QNb9P7IBWuz8mlPpDWTvSPUEIcnRzlIYRDVM6S6bPJmrVaoG8bWmYbjDqwH
	vpRIi8PRkyWHPpgKo0rNUcEixvD1e1yLhRcmz7c6AoL6NxOAJO99URmrLp2hkQ8N/ZHGg2D9/lw
	77Uc3ub7CRcuYSaMxnzPOf+IxutmFKqpi0Y0OijSgN90YVLB3gAYZePfUCr94ZOm+fJREf6fk5w
	tpag1y6HjgZDnnvX1w6vyHNiDlU9d1g9vF5D4d6qESkE=
X-Received: by 2002:a17:902:ccd0:b0:2bd:2c3a:2a36 with SMTP id
 d9443c01a7336-2d725acf14bmr162990945ad.0.1787895454308; Thu, 27 Aug 2026
 22:37:34 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:33 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:33 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:37:33 -0700
X-Gm-Features: AcwNN1Ur-VZBys6jqZPJvpYfVeYnoLAAwZu7Edvu0_9GADMTO4Gd8qQ90541flU
Message-ID: <CA+0ovChZw1S2gbV34WOFquXtW=e=-XUjpcfpTD-1KZ=gDpD2ow@mail.gmail.com>
Subject: [BUG] dev_WARN_ONCE "BOGUS control dir" -- drivers/usb/core/urb.c:413 (dtcs033)
To: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/156-gspca-dtcs033-control-urb-wrong-pipe-dir/

  usb 3-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
  WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1074/0x18c0,
CPU#1: repro/9497
  Call Trace:
   usb_start_wait_urb+0x13f/0x5b0
   usb_control_msg+0x234/0x3e0
   reg_reqs+0x216/0x590
   gspca_init_transfer+0x2470/0x3060
   gspca_start_streaming+0x6f/0x250
   vb2_start_streaming+0x128/0x460
   vb2_core_streamon+0x2e0/0x4f0
   __video_do_ioctl+0xadb/0xca0
   video_usercopy+0x876/0x1450
   v4l2_ioctl+0x18d/0x1e0
   __se_sys_ioctl+0xfc/0x170
   do_syscall_64+0x155/0x510

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
