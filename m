Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E538B35F164
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791434253; cv=none; b=OD2HSNaEsrkHd78okCKlnx6x8VfavyRWNZFn4NkNDPjEWuM6yC/lsQwVsBznqEq4CoP0d0L6YXc6zAM/Wk3j4DJ4l7mPHP3WLMyet85EaajyTmPzdBrTxMXnf/1JzWadpe8JjzfxxzrR484M5Uc4Vh5I/PgHz2WNSCsjVhj+RoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791434253; c=relaxed/simple;
	bh=zswWcY3O4XMtqWpBvYq+kaP2EnDqfQnml08FwKVJWKY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bF6tNRQMja/T99wJJP2WMtH/gUso9+XJzDk1EBiyvLruVe6XizLbwt2tjJWx5paZauki8nHBSVaPk7oAPf/CJzeG8yLl06MzRkeVXBiMgTRo49plMsQLXss3cNIVWzmNT0/mdAOa9sn6ovCNUZsyRk+gTm0Ykt9NxIVoznmIYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IK2Makre; arc=none smtp.client-ip=95.215.58.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IK2Makre"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zswWcY3O4XMtqWpBvYq+kaP2EnDqfQnml08FwKVJWKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791434248; v=1; x=1792039048;
 b=IK2MakreW3a+/44Ja84BKGYNecPlfmngMHleccmld9moWj9B+QeWhtMsUEve7AliUl6rbTwa
 HsaDnqc8jgTfqixbqjhjDmtGhp+Bm0GUdNDtxDbhDwwYoPkZlXO5LUp0t/Dv0JgtV7mMRJlWY3D
 soRCqV4eyDqPa3c16qnCgqNA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d4fbcb3a582d4224;
	Thu, 08 Oct 2026 04:37:28 +0000
X-Mizu-Trace-ID: d4fbcb3a582d4224
X-Migadu-Flow: FLOW_OUT
Message-ID: <0cca2cd5-b45d-4658-a690-40e54720b952@linux.dev>
Date: Thu, 8 Oct 2026 12:37:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, Tao Cui <cuitao@kylinos.cn>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
 David Vernet <void@manifault.com>, linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev
Subject: Re: [PATCH v2] sched_ext: Reset cpuperf_target when a sub loses
 SCX_CAP_PERF or dies
To: Tejun Heo <tj@kernel.org>
References: <20261006142834.2815197-1-cui.tao@linux.dev>
 <4bc0c5e88d602dcbc886b1214c676c8d@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <4bc0c5e88d602dcbc886b1214c676c8d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tejun,

在 2026/10/7 03:31, Tejun Heo 写道:
> Hello, Tao.
> 
> On Tue, Oct 06, 2026 at 10:28:34PM +0800, Tao Cui wrote:
>> Fix it by restoring the neutral base that the root scheduler establishes
>> at enable time, at every point where a writer loses the ability to
>> write:
> 
> I don't think the kernel should be picking a value here. The cpuperf target
> is last-writer-wins state with no owner tracking, and the only value the
> kernel ever imposes is the initialization at enable. If a parent grants
> SCX_CAP_PERF to a child, it should expect the child to have changed the
> targets, and restoring them after a revoke or in ops.sub_detach() is the
> parent's responsibility. The root holds every cap and a sub-sched parent
> holds PERF wherever it could grant it, so the rewrite always has the cap.
> 
> There is a gap on the kernel side which makes that unreliable right now.
> ops.sub_detach() runs before the child's ops.exit() and before the child
> loses kfunc access, so a child timer or its ops.exit() can still write
> after the parent has cleaned up. I'll post a patch which drops the dying
> child's caps before ops.sub_detach() so that the child is inert by the time
> the parent is notified.
> 

Fair points. I conflated "the kernel can see a writer go away" with
"the kernel should fix the value". Treating the cpuperf target as
last-writer-wins with enable-time initialization as the only value the
kernel imposes is a cleaner contract, and whoever granted the cap is
the right owner for restoring targets after a revoke. I'm dropping my
patch.

Thanks.
--
Tao

> Thanks.
> 
> --
> tejun

