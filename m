Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A058470121
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133639; cv=pass; b=YIHIY8Bf/B0Hu3a6w7YlZQmjd83kp/LREWfD1c63i6Y7FGILhqjulH/z/wbYI4J0xSd0JFwA5nbaFBILrQQmO3cFM4rxhqCVP1Yk+DmAONpX8JkWoTBErghLnGsr0fFhqQPl45l4gJB3ZnKRSaYdBGnzdq16zlPZk/sOg5KjsMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133639; c=relaxed/simple;
	bh=UwTiBe/iuSgoRZSAVY601VnkiIAQtKFqJGqIBKZHgUY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/oRdnhqT1v4zmS7GOBPG1sbvVPPhVa5Ogefm3daC0fnnCJWGJzJCPbeh/8BDI8a3U1C0+7B9OJXqR8CsHJVV6i6nyM626lWADzLXGRGgvCAiIjAmrTKSgG3aNCVusN4FhvYDSxPquyYeabSegODx24iiqSoAfWSVqiZXV7s9LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRojAZh9; arc=pass smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRojAZh9"
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-790a0799373so175279137.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789133634; cv=none;
        d=google.com; s=arc-20260327;
        b=cBvEZgFVbBZakLZyiUjsq+5M0skuU+TvYRfwCpDHC971SzEywP9D7gZI+Z1WnlQViI
         cI/5anZabrz+4/GnF1O/Ao4u2TwENb2Wd6UuN+k3681DqhAlEFp9W42pRWtAZP0TgY+O
         o0dUdtiteMMoV7feyPpw5CZU5sCpn/X+ssmf6gAtHCRlIDyZzfgTLyzn/62Z0Nio1TKh
         a5GG4U6owTduHSaJBJlgyC3SbHH7i5kveDN3gxuHnNgGcGduaqgWhip/zHLpqsOxGaG7
         0XQ4xo5Jj0IXrO5AUJO12F8g0dq595dPnSYnWBqF2tks5+y3Q015H2quCDHJTMB8KsnH
         0RKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=hklxAsOSrnypaYo5IvCinnC+SVgnyF1SrIWgdQ2cyg4=;
        fh=WAMM6mMkbAMk9bu6Q6yxtfaXIT1pJQHNsl/r1bneSP8=;
        b=L/ykMtgppnSX+lcvLSn/yY7woxrviAqKdr5X8EF+TzrwqIjLJ2oKE3rqoVy68gVk0N
         cL8bqX4a7A8dZ8qSnNyXVGgOy3rVJ2kpu0J4WwH29uCpHjwRlnGSRt2klVJDHkAu/CZe
         8H2Qzkmw9JEhRa64DoHitxUgR7LqjOX8lxjqF9G+QfZwnrpzZtxkTHiKIv1Ez4u4pFBs
         bWSaPeCpzpbWUsRmVovWVf1zZe59Gy5YKWbmdQgOA51czwdV3nFJPlvv0m0urgKOZ0Fa
         D+3bLvEcJspMftaRBu6wUsmKIyMP/6FyGg2nldBoB++EKiWx0GXzAF4Hv9vIlKbWTNEh
         7KLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789133634; x=1789738434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hklxAsOSrnypaYo5IvCinnC+SVgnyF1SrIWgdQ2cyg4=;
        b=jRojAZh9rcWZMEtFcUITj7sJfwOT+u7L9ch1maFIBKourZoApAppNFPmCWumqui+sU
         bdRFi4X7PGLI/bLo26c7QzUo49lR3eW4ZbOUwhK/1ShirGur1T5pMG1p1e4GheO+LcsR
         g+Ev9nQgCYVPYYvrzF8ACB32nRblzK0apkU8LFmYtQWoswxk9cNUQFb12YbOL2VsktKW
         GtB6kLoLW6u5TjJ9ot6cqbzRSTHomeIIujTYC9uoZbppXaZZKEbHq0HoXWs3A8CQ/Ypy
         CkIIxph/f18iTLVjiB9ya1Lw34eZR1zl7WZFtc5HWIJCcV3cI1n2ml2YIoaleS+kujju
         O6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133634; x=1789738434;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hklxAsOSrnypaYo5IvCinnC+SVgnyF1SrIWgdQ2cyg4=;
        b=g/AzzQFKbdFf2fVyQBAaBqmOQzORZen6seaJxYVh6Uj8QA/Vf5NI3xgTO/Po/7YpHJ
         6K0NxeYt8xVZYf5YuI0/HygtK1n/7i1w/NwDjLqALYtcj8jBUxCj1EfqO8ZALnlkU6Xp
         E3XB1ytdvKGyCA9FZilT83Mwn31xxCIId3Obwt9Ea/Zq/Xi56Wcfue29WM3IUxJP1pKH
         74ymk2xxXgkBmfg5E9OD0COGTdm4O2iz/iXl4FSh7jcYIOdsnOcNvm/ONaMpzvFziWWH
         1Cxoj6YdN0oU1PvxBu7rNe81O7Th+WD/i1u1uO88/6uqqv1NeXMxSD4Y1S2pTmMaWh9o
         lekw==
X-Forwarded-Encrypted: i=1; AKwUvBxvp5azCYrniXesDnHB6eOvOyp7JZlN4NjhqhHXe3i4xIk2Np2a6wFFZKOGt5uJd57LYdDunP617xSMt/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ71pKFzTuYQXgr0Quf18TkALp5WHR2nY9z8PsIp30L2BfIVsP
	Qlt+nB9y7OwbiSz+1YK+n43Enkto+xc7UV0wah0XKrFS1d/Ar+UVfF/3yBw3VdNNu+KUHs0+r+E
	TzsFtRjoB/195m+z+u1XKbvUj1bwFccw=
X-Gm-Gg: AYBFou10pKCuUxBOsiw3VpdZw8EpRcxF++gPuXe6dD4Kt7GPo/kgWDTVHC25xiFQWQn
	g5lVi6AjV/hmgFvGpg7pYhBIzo7oXxa3eh8sohYFY66BkNdDZ8R0QYchhV6hs3bO5tBOfPywWhY
	qRgDy7efx+c57wO1J0zmlbP9/riIJY77FTC0hnozFOmzlL6xkODBYfJshVxmdXY37sWo5FjTCzW
	TzMo0hwhDbPM17sKLAssfLjEv/J7LxVnLhsLingPwJZ6YUvpvWgZ6zP9kcvCCG81FduMYoIlA7R
	UXxBLOZ/qHob/VzSrJByFnLQfZYXZY7PnCu827tgPok5HQy3wH30B2EhwpLjYYZ4cG3mtUZrtIf
	RVF5cuMQpoOxUwBJvgh9rmQiurQv79DQhNCimQnRuIu0wh5J4VMjwGGWIoAMTAprhnozCRA==
X-Received: by 2002:a05:6122:6217:b0:5c8:46e3:ec57 with SMTP id
 71dfb90a1353d-5c846e3ed98mr5362437e0c.1.1789133634096; Fri, 11 Sep 2026
 06:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: www.rokinthanp03@gmail.com
From: Rokinthan p <rokinthanp03@gmail.com>
Date: Fri, 11 Sep 2026 19:03:36 +0530
X-Gm-Features: AcwNN1XreTuNNlaTl7Xsv-JngnKbjrxCtad2zoVhkHSVgoZxLP0b7ACitDmAM_c
Message-ID: <CAHzb5FHiZD_XjDduot=Bzv_vK57k49v=SJnC1_p1mxUXKPPBwA@mail.gmail.com>
Subject: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL in
 cluster functions
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

The V4L2 control framework is designed to allow drivers to instantiate
    controls and clusters without checking for errors after each call,
    checking hdl->error only once at the end.

    However, if allocating the master control (controls[0]) fails, e.g. due to
    memory allocation failure, v4l2_ctrl_cluster() triggers a WARNING:
      ncontrols == 0 || controls[0] == NULL
      WARNING: drivers/media/v4l2-core/v4l2-ctrls-core.c:2525 at
  v4l2_ctrl_cluster

    Additionally, v4l2_ctrl_auto_cluster() attempts to dereference
    master->minimum without checking if controls[0] is NULL, leading to a
    NULL pointer dereference when master control creation fails.

    Update both v4l2_ctrl_cluster() and v4l2_ctrl_auto_cluster() to silently
    return if controls[0] is NULL, preserving the design that control
    creation errors are caught at the end when the driver checks hdl->error.
    Also update function documentation in include/media/v4l2-ctrls.h.

    Fixes: 71c689dc2e73 ("media: v4l2-ctrls: split up into four source files")
    Reported-by: syzbot+cf896de36144391bcde1@syzkaller.appspotmail.com
    Closes: https://syzkaller.appspot.com/bug?extid=cf896de36144391bcde1
    Suggested-by: Hans Verkuil <hverkuil@kernel.org>
    Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
    ---
    v2 -> v3:
    - Fix the issue in the V4L2 core (v4l2-ctrls-core.c) instead of hackrf,
      as suggested by Hans Verkuil.
    - Return early if controls[0] == NULL in both v4l2_ctrl_cluster() and
      v4l2_ctrl_auto_cluster().
    - Update function documentation in include/media/v4l2-ctrls.h.
    - Revert hackrf driver changes.

    v1 -> v2:
    - Corrected commit hash in Fixes tag.

     drivers/media/v4l2-core/v4l2-ctrls-core.c | 16 ++++++++++++----
     include/media/v4l2-ctrls.h                |  4 ++++
     2 files changed, 16 insertions(+), 4 deletions(-)

    diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-
  core/v4l2-ctrls-core.c
    --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
    +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
    @@ -2490,7 +2490,10 @@ void v4l2_ctrl_cluster(unsigned ncontrols, struct
  v4l2_ctrl **controls)
         int i;

         /* The first control is the master control and it must not be
NULL */
    -    if (WARN_ON(ncontrols == 0 || controls[0] == NULL))
    +    if (WARN_ON(ncontrols == 0))
    +        return;
    +
    +    if (!controls[0])
             return;

         for (i = 0; i < ncontrols; i++) {
    @@ -2508,12 +2511,17 @@ EXPORT_SYMBOL(v4l2_ctrl_cluster);
     void v4l2_ctrl_auto_cluster(unsigned ncontrols, struct v4l2_ctrl
**controls,
                     u8 manual_val, bool set_volatile)
     {
    -    struct v4l2_ctrl *master = controls[0];
    +    struct v4l2_ctrl *master;
         u32 flag = 0;
         int i;

    +    if (WARN_ON(ncontrols <= 1))
    +        return;
    +
    +    if (!controls[0])
    +        return;
    +
    +    master = controls[0];
         v4l2_ctrl_cluster(ncontrols, controls);
    -    WARN_ON(ncontrols <= 1);
         WARN_ON(manual_val < master->minimum || manual_val > master->maximum);
         WARN_ON(set_volatile && !has_op(master, g_volatile_ctrl));
         master->is_auto = true;
    diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
    --- a/include/media/v4l2-ctrls.h
    +++ b/include/media/v4l2-ctrls.h
    @@ -834,6 +834,8 @@ struct v4l2_ctrl_config {
      *
      * @ncontrols:    The number of controls in this cluster.
      * @controls:    The cluster control array of size @ncontrols.
    + *
    + * If controls[0] is NULL, then this function does nothing and
just returns.
      */
     void v4l2_ctrl_cluster(unsigned int ncontrols, struct v4l2_ctrl
**controls);

    @@ -868,6 +870,8 @@ void v4l2_ctrl_cluster(unsigned int ncontrols, struct
  v4l2_ctrl **controls);
      * In addition, this function will set the %V4L2_CTRL_FLAG_UPDATE flag
      * on the autofoo control and %V4L2_CTRL_FLAG_INACTIVE on the foo
  control(s)
      * if autofoo is in auto mode.
    + *
    + * If controls[0] is NULL, then this function does nothing and
just returns.
      */
     void v4l2_ctrl_auto_cluster(unsigned int ncontrols,
                     struct v4l2_ctrl **controls,
