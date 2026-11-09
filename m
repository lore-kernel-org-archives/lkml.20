Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239417;
	b=GZuO9YZC871+fnEj020OJbN1OyGYsSYIza53SfB8IfSNtVTksVPDxekwdOubIz9Up0pO
	 uDfk0pjbnlBmCBIgKLlMVViPsdRcweyfsg9eoOvhHVyQERlkYBMUlciAIs+X2xZa6cKuf
	 D9Sk8KYHBQqIKeNlsJF8DVzVHNCL4byKlgHi5KykdNCNiM7pD/5tAwaKXZ6aH1bMKbu7E
	 o9KfzP5zKK90tIcmm72+gqMTuMpT8XX1+02iD/NBp8Ro4hZS5y+VlyAeKPdCvJk6YudAX
	 TiF7H3r1Ldh+8GVGkbZfprAwhMPflCYIPCtFC1iRjhAkBBfbDPm4VjEuiIMLeOkBLCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239417;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LQGO9vFLEAdP3AUmlh/19/aI1sYZIjGs9h7QlSX1ek8=;
	b=sOP1+SVU9OcXGK/CjCvFLvnR/oTw5TctPSe3HswTcjh8/u/6WZMGDqzR0dGXWhkHswQi
	 6WWtn01pCDEKG021T7PdnI+RQ+mV+4BWVhyFTa2CQj46PNb0G9yURHjWeZpPbqrka12Zo
	 2BgGBcMRYRQzuUZHLWLdC/ag4AE4fj3fIQ0GoKXjexANDGQPK2Rp8ALyppCoOAs8WJkPD
	 qaZCpuBrAclnXMy1VYWnuxDzK1qi6JRMKCSDST/R+Taz3hyPff4GMMz3Sj3AfrRqQVCq0
	 8chFGkb9a0W7chv++CR5NvxvUBlsxrPGQ426EGkJaXngP3+oKUDWL3HdTTPw2JH/tag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Y7neRKVu;
	arc=none smtp.remote-ip=162.62.57.87
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FDD606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FDD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Y7neRKVu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794239404; bh=LQGO9vFLEAdP3AUmlh/19/aI1sYZIjGs9h7QlSX1ek8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Y7neRKVul6ECm8ba7qW9dFWXF5nz+n28qVMzy2oFTkewVUJTrMQh0zsHcVMXJPsGj
	 BtVi4i+wVh5tvtMt0Rk7bMw5IH9fh2I+fGOfI4IvsnKNPu59A2mTx5NL3ztBryHctF
	 ffARKc3W/ZDshmsWLTm4POGwm0M6Sd27rBWvwCUU=
Received: from [127.0.1.1] ([223.88.55.127])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id C82BC2E7; Mon, 09 Nov 2026 23:50:02 +0800
X-QQ-mid: xmsmtpt1794239402t4rzum2zj
Message-ID: <tencent_FEC82334BDE27688994F74B9BB4BCBB2140A@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7+BwpEGlTITjYED/dMO+du/JEOvMweydDS/+o7C1A6TJwXgBZkP
	 WZoQXYihMW8gzsUJrmYEmxxg/PTXmkGIE+g32IJoxnfTD374JDRU+C6GpYZvoCDhT55cg7np+ARS
	 J70Y7J12lbDOEa7r2YZGbeuf+tG35VJkrXlZxqXuLqBK76wnlMzG7FMGRaRxRCjP4nSuNxoNMFXT
	 WzHJ346RxwYiD4MS5hNmk8BVjJFw0yz5cuVYzqfHS97PpwHb5UfcR6uBTsoiUZsmCoWWmGo6z1Bh
	 X2cXPljgm+dzwxO8fbNgEKmipn99xCzlv7mXRA9BsTC2dDqIKmiU0xb0hIswHmfb26uXdh1v1sbc
	 F9aUpOFgmR96ij6WgJFkR1wngHr0uHlZvCqBxpNBSceLPX7Tu/KtmieSenUY2fqeBkrJ/sBbbhTF
	 nFNsWmhOT7sJS8J1BpT4bDEIk/1uNfuGKCtSkS4ruRXryg8FxEQ7cuXTXjtoixyIDOk2LBuQEWNo
	 ptXbim08oFJUIBmbC4TZ3oLY5bwyC5vh56fIlShQAW8byA0BRCZWMJO2xLT8tyFEdsbjQAZogBGr
	 3JBlSGvz5XjZvGb9tMauqID2K9B4pduQlTl3uCZUL+PKzRzh4ZYYth0y4jqqDG7RfacXwVJkr9Qq
	 paBeOuXpiqdl5JGfZy8+xLb1tm9k2AMrjZuYSadxWSDvtAnK8+USQm6/1LinNX6Kv6GLWo/OGs7I
	 Xpx5a7FRPwXQ6oWaMrAxQVpUOsQkTt7EB442wSilr9Z65zhgz22kfR5RKeq6is4FuiB1QvJEtFb8
	 nAN7+iyiILtkMgclLVP5YX14QRbU0n/T3aDSyplZzkcOpxjEY6HA8iiQZzdOlsm9DtJFUt3T0iSj
	 PcDbDZBIeckV3T5WPVBY2N3z/7gWA9VqjcewZKSDGOucoixjZI1/XwBh9eSLhZyiq2le4TyyeKqg
	 p33aeC6EB3b0rovzuEZYDYVtS4GarublQsaGjh7jxaiW8iP7jszxzFDPIi25itiiOkyFBL7rEyJU
	 LIDRXvdjPt0aLo7qDpM6/27xXIWvl7FCfIGY2EYAjBvOXlPqREn4sKaXCYUymtwRYpqSRPU6JoRC
	 wczuUq
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: Aleksandr Khromov <haa@amicon.ru>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] jfs: fix double free of the log superblock buffer in lmLogInit()
In-Reply-To: <20260817071347.1160598-1-haa@amicon.ru>
References: <20260817071347.1160598-1-haa@amicon.ru>
Date: Mon, 09 Nov 2026 23:50:02 +0800
X-OQ-MSGID: <179423940257.1336427.12304260030044137322@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Aleksandr,

I ran into the same double free while triaging a syzbot report, and I can
confirm both the analysis and the fix.

The report is this one:

  https://syzkaller.appspot.com/bug?extid=d16facb00df3f446511c
  KASAN: slab-use-after-free Read in lmLogInit

It is the same bug: the second lbmFree(bpsuper) makes log->lbuf_free
circular, and lbmLogShutdown() then walks that list and reads l_freelist
from an lbuf it has already kfree()d.

On a v7.3 based tree with KASAN, using the syzbot C reproducer (crafted
JFS image mounted through a loop device), the unpatched kernel gives:

  BUG: KASAN: slab-use-after-free in lmLogInit+0x146b/0x17e0
  Read of size 8 at addr ffff88802e805c18 by task exploit/10730
  ...
  lmLogInit
  lmLogOpen
  jfs_mount_rw
  jfs_reconfigure
  mount

With your patch applied on top of 4ce61d7abd85, the same reproducer
reaches the error path (lmLogInit: exit(-5), i.e. -EIO from the log
superblock write) and there is no KASAN report at all; the machine then
powers off normally.

Tested-by: Shuai Liu <847807867@qq.com>

One minor nit on the changelog: it says lbmLogShutdown() "never
terminates". In my run the first visible symptom is the KASAN
use-after-free read inside that loop; the endless loop is the same
circular list, just without KASAN's quarantine. Not worth a respin on its
own, I think.

Dave, this has been on the list since August without a reply - could you
take a look?

Thanks,
Shuai

