Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56A30B521
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856548; cv=none; b=CPTnqt69IIBKTjDz580kjYngmgQho+Uig/bkh/ERf6tlMgfFW/zAYmJBQzCCF0ICD17nB8cb65UwEcfG8sisadDhAX5dwLhmY1tyctIfkrdutVN7ZQX1yv6LhR7zyCqm6QYXnKSqZ8AAUozqTvRfTvxWA5TrWK4WGNhG3TfLKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856548; c=relaxed/simple;
	bh=JjH8eBLmjco3rYzqCwCMPGFgVCakNE3ALpV89xjsfMA=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=Qnhnp93mPleWPDKoF1U4IB8+4yessA69cyAAtkuyYc4xPxZcZY0X8l7PGMvLaA7mR/22OS3FBJ1Vqvf8U5+IZU7LM3B1DcAlVfCugn9RE5rzDE1Do4DiWlx92C+kwHDQQnxESvWqVG6odaCA+ZGQQklAnQO/QCiWIrBBl18Edso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kRRgKLKl; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=W5GtNkjw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kRRgKLKl";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="W5GtNkjw"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789856539; bh=vu/c9lbdUaplWASsv9Bqcw1
	HWKPmI2P/dA5pwa5VVDA=; b=kRRgKLKlVEMzSWT2T4UKo3GhvLkn1Qy2hHLvBUJg1O2+LtjxyL
	PVBfT/MgglDv1A61XNbF0vHhrm3qUvSVaZFK8PfCuznC3Z33RCVHus039Pgs0/ySmRVNF+dKeut
	ESSbwnWG4AAX3ndRzlC0Qpl59XD+v/c0LAouLUb4eMr3+i/5GUJvoEf4KejHM4NRtZNTyJUM4tg
	7b7WLOgcH11i9jVRcmyNhqp3IClXYPwgXV72q3l55LfQ9d9Fwd/JWNZOes5oyHto3YydsUaE4rE
	BR7W9QpWrPDPtJPeOn+UXt0gJvkCeR93W5yUuHydW6ddpSlcKIZYxbQEp1gaNu2AstA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1789856539; bh=vu/c9lbdUaplWASsv9Bqcw1
	HWKPmI2P/dA5pwa5VVDA=; b=W5GtNkjwEksRj5KoZNq32Km+0wbEPiExP5XZr8hfaR70svPXsx
	I+eyZARsdddORFicz1hxqkLqEgfzsjXkwUDQ==;
Date: Sat, 19 Sep 2026 23:22:20 +0100
From: Bradley Morgan <brads@mainlining.org>
To: benquike@gmail.com
CC: kees@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net,
 wad@chromium.org, akpm@linux-foundation.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_seccomp=3A_restore_knotif-=3Estate_?=
 =?US-ASCII?Q?when_SECCOMP=5FADDFD=5FFLAG=5FSEND_is_interrupted?=
In-Reply-To: <20260919203514.2580997-1-benquike@gmail.com>
Message-ID: <83420D4E-147D-454D-A41D-DCDCFCB4B531@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 19 September 2026 21:35:14 BST, Hui Peng <benquike@gmail.com> wrote:
>In seccomp_notify_addfd(), when SECCOMP_ADDFD_FLAG_SEND is set,
>knotif->state is transitioned from SECCOMP_NOTIFY_SENT to
>SECCOMP_NOTIFY_REPLIED before dropping filter->notify_lock and waiting
>in wait_for_completion_interruptible(&kaddfd.completion).
>
>If wait_for_completion_interruptible() is interrupted by a signal before
>the target task processes the kaddfd entry, seccomp_notify_addfd()
>removes kaddfd.list from knotif->addfd via list_del(&kaddfd.list), but
>leaves knotif->state set to SECCOMP_NOTIFY_REPLIED.
>
>As a consequence:
>1. When the target task wakes in seccomp_do_user_notification(), it
>   observes knotif->state == SECCOMP_NOTIFY_REPLIED with an empty addfd
>   list and zeroed knotif->val / knotif->error / knotif->flags, causing
>   the supervised syscall to prematurely complete with return value 0
>   without installing the file descriptor.
>2. Any subsequent retry of SECCOMP_IOCTL_NOTIF_SEND or
>   SECCOMP_IOCTL_NOTIF_ADDFD by the supervisor fails with -EINPROGRESS
>   because knotif->state is no longer SECCOMP_NOTIFY_SENT.
>
>Restore knotif->state = SECCOMP_NOTIFY_SENT when removing an unhandled
>SECCOMP_ADDFD_FLAG_SEND request from knotif->addfd.
>
>Fixes: 7cf97b125455 ("seccomp: Introduce addfd ioctl to seccomp user notifier")
>Assisted-by: LLM
>Signed-off-by: Hui Peng <benquike@gmail.com>
>---
>diff --git a/kernel/seccomp.c b/kernel/seccomp.c
>--- a/kernel/seccomp.c
>+++ b/kernel/seccomp.c
>@@ -1808,10 +1808,13 @@ static long seccomp_notify_addfd(struct seccomp_filter *filter,
> 	 * We need to check again if the addfd request has been handled,
> 	 * and if not, we will remove it from the queue.
> 	 */
>-	if (list_empty(&kaddfd.list))
>+	if (list_empty(&kaddfd.list)) {
> 		ret = kaddfd.ret;
>-	else
>+	} else {
> 		list_del(&kaddfd.list);
>+		if (addfd.flags & SECCOMP_ADDFD_FLAG_SEND)
>+			knotif->state = SECCOMP_NOTIFY_SENT;
>+	}
> 
> out_unlock:
> 	mutex_unlock(&filter->notify_lock);
>
Akpm?

Also, Reviewed-by: Bradley Morgan <brads@mainlining.org>


--- Thanks!
"I'm not a very positive person" - Linus torvalds
