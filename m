Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.171.160.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612009;
	b=P0yYsMIhgcYEY2yyLE1GTOvboRWp5qMMRi+UkIFSsjNI3ArYKgIIoz9nUs+ZPW16d7yU
	 167JeuvkBovu5Q6+xq6Nj1MoGD/8SSgWRKYvm1Y1Z0NSX7mTmbevB6r4cxc3hPzpZqnS2
	 QHezHdAiDtuAWB4783ycLUgELbzCSHnQrp/qIxOFq2p1HhxS7s5nIVXVsiM7PBkV3XstA
	 BwserOihcIK4gbvJOnH7bnUufU1xnC9a4fimX6PPzpthOCOo8cOBRZq+XxQh2pjM9BZ9F
	 q4YGqcdmwxmkoBTZPzgkXorMJMpHs6IMX07l4Qf6cpTOrw6jWlGB7fHE8imNu55LQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612009;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 User-Agent:MIME-Version:Content-Type;
	bh=owyv/H1DI3N6KFq3EKzhJsm1qLvqydqS0YqaeaaOkcU=;
	b=p+M5c9PA7fHZRY67+UvwywjD+gywPrqJMPm0wBj8QFiH+PtW3kp5IjQ8M8zcy7zupRac
	 iBOzLlrHBb2RzszVxJuQ46LYkjL1/hSrGBTWdIu5jTYt0N7zRHuP7W09IQWe2EGJx6Ghv
	 KCgCauaH1PvqsdRRayQseh+cDvdo5Lq7slnfHjnCCVZ2D33hwLCC/7ZEbC114QLSkfqLs
	 Tf0CnEHC0G9ohFJ/FKPn2vajcUbTMbDXhWoYuuym4pIQq5f051YQfdPLLcrmPc5LUTemf
	 XYGz0WlV2zYMtD8HnqCcjRSkY4FDi48tRDfkG3oPNrYXCRyk7gEj4HnY+ZQtkCmtC3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.parknet.co.jp;
	spf=pass smtp.mailfrom=parknet.co.jp;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b="c2C/d9aI";
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=eLkyAHN4;
	arc=none smtp.remote-ip=210.171.160.6
Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA55606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA55606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=parknet.co.jp header.i=@parknet.co.jp header.a=rsa-sha256 header.s=20250114 header.b=c2C/d9aI;
	dkim=pass header.d=parknet.co.jp header.i=@parknet.co.jp header.a=ed25519-sha256 header.s=20250114-ed25519 header.b=eLkyAHN4
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id A5CBD209679B;
	Mon,  2 Nov 2026 18:33:18 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1793611998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owyv/H1DI3N6KFq3EKzhJsm1qLvqydqS0YqaeaaOkcU=;
	b=c2C/d9aIk5gWZ/mXWlv+gPUlt3Lit3nO8unR2yojOfY1seaE3SNbODNI7sbArv3qsEqVYV
	zUV4ZrvrKBxcb0oQLjtbiCuQP2I3VE2vZSN4Izzf47n/wz6VAE2OyJGBUJWRVsgopLsCFi
	dpEk/q0ZBZ1ZJJzfqvlI+aWeOVkCPNaM84xdQGpnzPUrKT/2bwWn/X94avLnxMnqhzEN6U
	UxQ1zWV/3HpivdivR1xAavotn6S9mbil7r0H9i2JxVGAzlD9kMRLuQH040R83dkLsDIwhj
	H/U4Uzkl+5T04eQ06JVUlrs5vDGXr8r9lSz3VDg00AIWRKHD2bJXAfyO+ioZfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1793611998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owyv/H1DI3N6KFq3EKzhJsm1qLvqydqS0YqaeaaOkcU=;
	b=eLkyAHN42IpiTZUXcwkjy4EORFDx+a34XjJZn1sh9Z505wZf7EndGrDatko4bNW3g4umGb
	WMk7WCcX9bAaIrBQ==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 2D150E004E4;
	Mon, 02 Nov 2026 18:33:18 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 2548A2200129; Mon, 02 Nov 2026 18:33:18 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: linux-kernel@vger.kernel.org,
  syzbot+018e6f695ad9bccb182a@syzkaller.appspotmail.com,
  syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fat: serialize primary and mirror updates
In-Reply-To: <20261102080322.1466478-1-matthias.goergens@gmail.com>
References: <20261031033232.2490931-1-matthias.goergens@gmail.com>
	<87tsm25wm4.fsf@mail.parknet.co.jp>
	<20261102080322.1466478-1-matthias.goergens@gmail.com>
Date: Mon, 02 Nov 2026 18:33:18 +0900
Message-ID: <87jymv60ip.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Matthias Goergens <matthias.goergens@gmail.com> writes:

> OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:
>
>> What is the real issue?
>
> Only the data race syzbot reports, "KCSAN: data-race in fat16_ent_put /
> fat_mirror_bhs": fat_mirror_bhs() copies a FAT block to the backup FAT
> while another task updates an entry in that block.  I have not found any
> effect on disk.  fat_mirror_bhs() holds the backup buffer's lock across
> the copy, and every writer mirrors the block again after its own update,
> so a copy that caught an entry mid-update is replaced by that writer's
> copy.  The commit message should have said so, and the patch also lacked
> my Signed-off-by: it went out before it was ready, sorry.
>
> That leaves two ways to deal with the report.  Would you prefer marking
> the copy as an intended race, data_race() around the memcpy() with a
> comment on why it is harmless?  Or the locking in this patch, which
> holds fat_lock across fat_sync_bhs() for synchronous inodes and so
> makes other allocations wait for that I/O?

I think former. And Actually I explained a few times for similar issues
in past, I didn't add the comment though.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
