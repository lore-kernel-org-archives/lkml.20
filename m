Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2B38E129
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088716; cv=none; b=tytM272MVy4aZSV5s7mfY2T5jPRaeftqZhEdAExNipNqvQvr558DnclCfn7LJnI7XxVdbd/caRr+Pk0/ov77sgE1BxQ35YOP8wV4aP8jTL90516e8fe/R6GYOKRDy0l2mpn/VcGDrajGQrIOqveU8b9tQV/VdLpt+SonqoMmeNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088716; c=relaxed/simple;
	bh=5hKKUbX9dc2B6vvH1kumlLO2tz7nnPJ8LBct6qBOt4o=;
	h=Message-ID:Date:MIME-Version:From:Subject:Cc:References:To:
	 In-Reply-To:Content-Type; b=V60aMKOEYZtFP1FgNtCC8eHwUNKmQ/NZ6gMSiiS4221ckpQCoZnYcrcbIPIIbLBGnQV3oP3wU180yDzgtXLaRdI4XKRH3aE+I1NGOq4VLPgzJKKJE+z2ZvwGJnNESMEcG5JhYj0KdCXTt5Z+1OI/Yrov3hQapJcPar6JTAf3KaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZTYMU7k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZTYMU7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E711F000FF;
	Tue, 22 Sep 2026 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088714;
	bh=hR8jTw3JQLahWpRJ3PT9YyqubnBWymiLNmRHyBoIShw=;
	h=Date:From:Subject:Cc:References:To:In-Reply-To;
	b=DZTYMU7kDD4j3ztyFtwW9AFpdwYXswZsRyqy+X9Z1qAJoWBHtnH5R/S29QgQ6qjN9
	 pIgTOKm5AebzwuRE+XuGtGu23Om8+gnsE888zVz5Kr9rE8FdXsjLf8augbHrfiTZno
	 kW2JYB2vpCUahgKRD+dMogiNT2jTUMWZaL9sBd7wJHV67kJ39pvAhHYq7yCSxt59hs
	 poia9Zykm+Wn1wIudxsizUWYT6Uoa54a5BfM8BGIqMzPQSmHRN+9qhsLKnP5bBd+jf
	 RW9iteu8QeVp0XpFAPb1cjSpJSs+UjSldpHjLOzoEZ8dEO3HcBonNGtuqfuN6s5Xrp
	 QC6u7Jlefn9ug==
Message-ID: <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
Date: Tue, 22 Sep 2026 16:51:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL
 in cluster functions
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernelorg,
 linux-kernel@vger.kernel.org,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
References: <CAHzb5FFOq=2_piCiFdEun_s2h+Jr90pNLF5O_2umNLkM9-XjkA@mail.gmail.com>
Content-Language: en-US, nl
To: Rokinthan p <rokinthanp03@gmail.com>
In-Reply-To: <CAHzb5FFOq=2_piCiFdEun_s2h+Jr90pNLF5O_2umNLkM9-XjkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/09/2026 05:37, Rokinthan p wrote:
> The V4L2 control framework is designed to allow drivers to instantiate
>     controls and clusters without checking for errors after each call,
>     checking hdl->error only once at the end.
> 
>     However, if allocating the master control (controls[0]) fails, e.g. due to
>     memory allocation failure, v4l2_ctrl_cluster() triggers a WARNING:
>       ncontrols == 0 || controls[0] == NULL
>       WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
>   v4l2_ctrl_cluster
> 
>     Additionally, v4l2_ctrl_auto_cluster() attempts to dereference
>     master->minimum without checking if controls[0] is NULL, leading to a
>     NULL pointer dereference when master control creation fails.
> 
>     Update both v4l2_ctrl_cluster() and v4l2_ctrl_auto_cluster() to silently
>     return if controls[0] is NULL, preserving the design that control
>     creation errors are caught at the end when the driver checks hdl->error.
>     Also update function documentation in include/media/v4l2-ctrls.h.
> 
>     Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
>     Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
>     Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
>     Suggested-by: Hans Verkuil <hverkuil@kernel.org>
>     Signed-off-by: Rohinthan <rokinthanp03@gmail.com>

This says Rohinthan, but your email says 'Rokinthan p', what is correct?
Also, why do you have a 'Reply-To: www.rokinthanp03@gmail.com' field? That's
not going to work.

Regards,

	Hans

>     ---
>     v2 -> v3:
>     - Fix the issue in the V4L2 core (v4l2-ctrls-core.c) instead of hackrf,
>       as suggested by Hans Verkuil.
>     - Return early if controls[0] == NULL in both v4l2_ctrl_cluster() and
>       v4l2_ctrl_auto_cluster().
>     - Update function documentation in include/media/v4l2-ctrls.h.
>     - Revert hackrf driver changes.
> 
>     v1 -> v2:
>     - Corrected commit hash in Fixes tag.
> 
>      drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++++++++++----
>      include/media/v4l2-ctrls.h                |  4 ++++
>      2 files changed, 16 insertions(+), 4 deletions(-)
> 
>     diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
>   core/v4l2-ctrls-core.c
>     --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
>     +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
>     @@ -2490,7 +2490,10 @@ void v4l2_ctrl_cluster(unsigned ncontrols, struct
>   v4l2_ctrl **controls)
>          int i;
> 
>          /* The first control is the master control and it must not be
> NULL */
>     -    if (WARN_ON(ncontrols == 0 || controls[0] == NULL))
>     +    if (WARN_ON(ncontrols == 0))
>     +        return;
>     +
>     +    if (!controls[0])
>              return;
> 
>          for (i = 0; i < ncontrols; i++) {
>     @@ -2508,12 +2511,17 @@ EXPORT_SYMBOL(v4l2_ctrl_cluster);
>      void v4l2_ctrl_auto_cluster(unsigned ncontrols, struct v4l2_ctrl
> **controls,
>                      u8 manual_val, bool set_volatile)
>      {
>     -    struct v4l2_ctrl *master = controls[0];
>     +    struct v4l2_ctrl *master;
>          u32 flag = 0;
>          int i;
> 
>     +    if (WARN_ON(ncontrols <= 1))
>     +        return;
>     +
>     +    if (!controls[0])
>     +        return;
>     +
>     +    master = controls[0];
>          v4l2_ctrl_cluster(ncontrols, controls);
>     -    WARN_ON(ncontrols <= 1);
>          WARN_ON(manual_val < master->minimum || manual_val > master->maximum);
>          WARN_ON(set_volatile && !has_op(master, g_volatile_ctrl));
>          master->is_auto = true;
>     diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
>     --- a/include/media/v4l2-ctrls.h
>     +++ b/include/media/v4l2-ctrls.h
>     @@ -834,6 +834,8 @@ struct v4l2_ctrl_config {
>       *
>       * @ncontrols:    The number of controls in this cluster.
>       * @controls:    The cluster control array of size @ncontrols.
>     + *
>     + * If controls[0] is NULL, then this function does nothing and
> just returns.
>       */
>      void v4l2_ctrl_cluster(unsigned int ncontrols, struct v4l2_ctrl
> **controls);
> 
>     @@ -868,6 +870,8 @@ void v4l2_ctrl_cluster(unsigned int ncontrols, struct
>   v4l2_ctrl **controls);
>       * In addition, this function will set the %V4L2_CTRL_FLAG_UPDATE flag
>       * on the autofoo control and %V4L2_CTRL_FLAG_INACTIVE on the foo
>   control(s)
>       * if autofoo is in auto mode.
>     + *
>     + * If controls[0] is NULL, then this function does nothing and
> just returns.
>       */
>      void v4l2_ctrl_auto_cluster(unsigned int ncontrols,
>                      struct v4l2_ctrl **controls,

