Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0748282F1E
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791733241; cv=pass; b=DIzPxxA2RJYT3KTHvbfTt/o7p0/TTKfIil0OS/Kh40t5YjX2HG59p4a04dlR0vGCyQ1Ojsg2/iCI652ktWKKW3DRc7cp8/vnz2sR+xeODuGXDcI7+6rTmrm2gORUo4shMScraP0U6+QTpxuwshmUiavLE5t7R8N65KhRPtkkiWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791733241; c=relaxed/simple;
	bh=Ezuo7eM4E6Ezq35kJfRYN6/gEW+WhWnzkY1e/gLtXdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwP0pYbfKe4QlKNzx1y/YVD11GOw8RhjnDFtYYilYiNwR7aZza7Gl4E9vIwRmPwACdaXv54t1r+mvLSGJfvoMfL1PmsR26TgcuJmWYQoAkS9d+UXK8xFWlqegzBozzdSmLcH16gpPpSpsYMm3nI239PKIySZWxQCo9Rst1n1xME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vsumr+bL; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vsumr+bL"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ae9bc9a2fcso25309607b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791733240; cv=none;
        d=google.com; s=arc-20260327;
        b=chDPZ9eoEWhVyflx50O72tsyUwWpngteROYhxJQjvYplqjwpB7cfL6pRmNT7o7oHRi
         z6VjpSs4d1478Q9BBqGaMpKqXWYamB9ZjbNNuYpgqLoFDhKPDBHyggCd7ZkK0WuHMmFZ
         GxZyb6Msavr7JEbksSv6cjPs3BXgFbZWOuOL8J/dqiay82PNqSiETEXR1IRI2CUxCwXx
         W7wUit7Bs8gU2teUJqzYhACUEkd2VGoHc3Je295myBnF+zU0NQYEmOoxyclqm4slkrM7
         izjEPr8xu38soA6oqeHzm6lXVNRvMMYT3odYaRK1IoVcDDjoGh1+ZWm1vAFWcnT+oiJE
         BY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ezuo7eM4E6Ezq35kJfRYN6/gEW+WhWnzkY1e/gLtXdw=;
        fh=m0ciIiwvoXAY43IzipjA5u2ezt6WRuiTo/ut+QH0lTk=;
        b=mnZWHue88K3bCqFATyMzRdBv4ekcdZhaRh5JvDD/cGIjV1iRku/JN3FZXI3u9rduiM
         oR15/fim60acKeYKFsqAwN6nTvcJ8Bq0fllD/9qhfCcSueTNnlo+cBOvDaCI//lQpvBo
         ml5v8Zadj3kxAVk5qEVEG91RdNuKCTIgD8RPuRiu8Z3JnefakTHXBlqEAYZmVLXAIUxq
         ZP9Lbzx/vxVgjGu2vMuLlCxdLXeLWHB3V9/EjIFh6gf6nPzYB1ZkkLZIztucaJP3Mpyb
         CPORYtWFkQguhIE1kP0QS8sL7v/XWTQpC5WrJTDMV0GaaXbzglUittSM3Sv4s/tE5W3Q
         rzQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791733240; x=1792338040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ezuo7eM4E6Ezq35kJfRYN6/gEW+WhWnzkY1e/gLtXdw=;
        b=Vsumr+bLpsmhTLK+0uPqxrD0NTA5NHzwbBOea/rT6cYZYwdxBrGL8pSc/e/uhddgOZ
         zEDlVFDgGJvxfQCk5ztQB+CuSeVPRzDlvOYfVva0cBsC5Ll6n+NRPxWV6xpkChkjaCuW
         4aTIQ7ByfSKH85rUB6lUPkp+TxWmnbyRCk/iHbiIOR8PZU9EHCNHr2yN9Ypt75/t3EdA
         IKFGs6oWJQWokS4Avj6a/0ljfZRpd6Ask3js0CfUJqza4X8BdkQwfIjTyGCm6Nnt9rv0
         O5nO7rNDoBq5aXR/6owfKtUY2niMn1FcTw6Xa3F4lgHePPsrAs4yAROrdP20K4XY4h1b
         ZvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791733240; x=1792338040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ezuo7eM4E6Ezq35kJfRYN6/gEW+WhWnzkY1e/gLtXdw=;
        b=yYMKTmoEGkfzbhtplfmvddFDZowa6ndyHUh3l2WAb7aLLCDn9+0NG3CWVvtIxqCdOv
         tDs+K6yhOJ+Y+Hh+gERP6/rFtwuNEHZUM202dzibdsx+1Gc/kHnWlz2pVUtalJHD5H97
         yHuwyHe0sONUStKhd6RAWOY4mgR9Mz9IqFW8INHSO9eq/+ts1fghlqLnXRmGXYOQYsxR
         hkI1VE/ZCs/OHvPxGNAw/TznOX5DlvNuqZMS9inimy40QkqomMW4C4hTXnbyh+0Cdn8v
         rJxEgcgrrm7l/wX3n+CEzXiShslaidZm9MhTRcp+h2nRmL5iuFUqEkwnuhNybr7xL0Ev
         lhQg==
X-Forwarded-Encrypted: i=1; AKwUvBxhh+q4aAkp3aelMv0T6OsBYJseZeNHT9AkygwGgqWyzBmLmAcgi9iTrxBBrU2dVWWGHIF05ZLEwC4av/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYITNdQVu8t85/a3U3NAKqZLFoKnVFWI5ojFI5N+vbSvhMqbNplb
	frK1ExtWl5Qk3e0WI4R/5IXShL7aCS5RXZl5zSUtE330q+k3yKuf78BsGZ78P2D+eWGROttuh0H
	URsOuVr0AFr65qZOW75tubyiMO6jXfOg=
X-Gm-Gg: AYBFou1DC88oSAdFrBlqPJanFU60qFBGlV+19imfrrPMvV3KQK3snj1PVufTiHH5qZ/
	NHCrNh/2MaVBvBHmzACrF41Mjco/5g6YmWMudSJSP7HChFw4rgjk3XKEy/K5gw+sSd77Bahffzr
	FHJHWqqGUR409DJPb+432QY8DisAHbPxyMcuf2sF8nrwTnpFNrE3JzJBQkCLSE05wXJr6HnvZsY
	ILyR/r+Ly47hsOXYKJ0aiSjWHPKj1U69r2mXUWdn/hp2isfgxqM2C/vOCVvXEMZDtJtEBL83W0y
	QohV985QxY1IqkPkaXi74zHf43OOXkY4VZOnn3QmSvVhWx9t0ciGubhPfes=
X-Received: by 2002:a05:690c:e3c8:b0:8b0:a4f7:7353 with SMTP id
 00721157ae682-8b0a4f775ffmr564347b3.13.1791733239782; Sun, 11 Oct 2026
 08:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0086-v2-646731c4254a02823b4d@gmail.com>
 <asnqJTe50D-EuhTb@p15>
In-Reply-To: <asnqJTe50D-EuhTb@p15>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sun, 11 Oct 2026 23:40:29 +0800
X-Gm-Features: AclHuK8wl5bUDwHdsoPgyvGfRUE2IX5tcHCh4GdE2cF8ynKNq26ERA1R8Cvo4fU
Message-ID: <CAFRLqsVqawLcZK60Wt2GKszXCeeJj6WNEO09zwybxO+mkOUBaw@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: Publish the filecheck owner before adding sysfs attributes
To: Heming Zhao <heming.zhao@suse.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	akpm@linux-foundation.org, ghe@suse.com, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heming,

Heming Zhao <heming.zhao@suse.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=85=AD 15:38=E5=86=99=E9=81=93=EF=BC=9A
>
> setting to NULL is unnecessary, it becomes a harmless dangling pointer he=
re.
> Other code looks good to me.
>
> Thanks,
> Heming

Thanks for reviewing this.

I checked the failure path again with the help of LLM, and I think clearing
fs_fcheck is still needed on this baseline. If kobject_init_and_add()
fails, the
function puts the kobject and frees fcheck. Its caller in
ocfs2_fill_super() then
jumps to out_dismount, which calls ocfs2_dismount_volume() and, in turn,
ocfs2_filecheck_remove_sysfs().

That last function returns early only when fs_fcheck is NULL. Leaving
the dangling pointer would make it operate on the already-put kobject
and access the freed fcheck in ocfs2_filecheck_sysfs_free().

I may still be missing something, but based on this path it seems the NULL
assignment is still needed. Would you agree, or did I overlook a case where
it is safe to leave it?

Thanks again for taking a look.

Best regards,
Cen Zhang
