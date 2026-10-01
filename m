Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D53A6B6F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790899107; cv=pass; b=YsHEYDVOeOM83gSFz4odissXQm3J5hlE/odKcrdky/d103lMbGnojrs6ktl1Vpm+OH81EeK6FshX/0nsQFU+wX+Q9htnygPAfZ9mAPccWEhICJcmfW1TWyEDJbzwKUa/8xsv+nbVftjCo1KwdkWDJQ//JwVpXqWBqYeMfEnRUFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790899107; c=relaxed/simple;
	bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/+vWb8t7f66xgUsHid5T0iyc1HJkE7TdPzv/YHhc/HgKW9Z2cWp47bKidSVsSPalmE5ZagdK2J8bGlQYOoHvthY8JeUEaBenJ26CyohDBTDcJmtpPgAluUnaGQJHKkIB4P2ezZayJ7TpoW3sKJndTAv4UjdhYsDY0RhBkV+dRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdUMZqDM; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdUMZqDM"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14e1fe551c3so1153123c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790899105; cv=none;
        d=google.com; s=arc-20260327;
        b=LllXSfNXPjcQLzWUCrCjSOVNlNja+zNIN3Z1deNYvgi4tasIc/7dmvB7eQB+t6/Kjy
         3hqtt1WC5iWS6FxLAmy2Tw1dskZQLNidFv87FhgWHTXfWPiZ1LnR+KxT97W/P8tMHZDa
         VwxlVZO1dANhQ8nHGIeDlz0QisiE6WzXhHOdbOO2PzKLBAGu33y369ExrLEeicwl+mYk
         MYiklQ6TucT6SBKOsg/A7+Xi3v1w8tAyGtZ78SQ0h9khMFPM2wJXqYbG7TtidLsJAkUl
         silu2Zh3bp8m7AnGW8fTzb4Ozy4pFzAUoI2hvDvBYm3qqyHHScP+hokapF7+gWFIkCQp
         BxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        fh=uKYcqxqOpHP6Ltku0cgy9HCQqKL3QIr1jbQxFI3K11o=;
        b=LSpkI4PcuDG5Qur7stxzZwloRM93PGbUALzBM6OXlfRIa85U4j4Y4bvZG6v2M3Q+9I
         NhD+S/Joyg+VX7HdYRXQy584PQk5HctLTCziNA+nya+/J6DWITAb4Z6x3DmAtkaiRMDe
         89VW3PWJULYV/E51xVkUGAaznlCnoVhpFBYxpFap4fqXbufvjfUc4Y1XIDDze5apFqQB
         R4Ja6n5p+K83hWrHiOn/LJLH7xHNn39K8PzR5xeTjuRRreEKBqAay34gUs+Ul7CcX2Oj
         q9ICeVPf1feOjeDOhTt76x1T9X4Y26bhken87HC+27QrNJUBwtVQ1pMpuxYRXiPN64I9
         nOtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790899105; x=1791503905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        b=cdUMZqDMwQu5oJ3RKznrcUG0HfrWQ77MDKzSIVN7yLrP34fGPPx4horPviI51zytzB
         66lHD4WLa4ozUFAae5NYIRGuYHnU65TiIF4EF/zUCR6oWSSekNHADJe9mmSQjJot5VLI
         guWGrHYBt4WkVBwJa8bby9y/SS9Ie22FOps7y/5i21g5FCv1KDMxrPJVK9ltgjTUuCJm
         4rlj16mZaMvL85NC9I0c1JpqQ+cJy6z/vcE7OU8jArNXM18uVEaRZ2S/BtCj6Sg5d9kk
         PNjQq2os2caVnEWh16vrHjaE6BqUgDhHIN208I99IEIn55s3TJyYxcFw1OYcaQTKpi3/
         3mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790899105; x=1791503905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU5qx0SsPYU3uJ8KwmQ0/fUfZYMcTpVxfADD1eUqY6g=;
        b=KrQCqmC+8ZWoPGOCq1xSml+LE8yMU8kDPMD10VulON9N0Ne9eVm5a7xLj+JZQVmhN+
         97KwZi4OFg/txb9haVxYE3uQ+FXD70+uCJeWX/SOJ5aHuAfduBJYjYlweef6YL26LOzw
         piQ+Tol7mG4IntpwCyLWqJHYuqL1fxQe9Q2WjKFfWBRgAj0dPaeAr1gYx0jVjTS/kEPp
         BAzwFO4pfy5ez7u7Z0Kxc9H78pqj2s5TGzNSi8PwudZoZwljsD80zyCjXMKyB/vMLmFM
         bvaMWvwuiNoIKRLZGNpnvJjNcW59US9+f8OP/FghQDqEIuL7mmQqAZMH+KGdrEB4Qslh
         zQJw==
X-Forwarded-Encrypted: i=1; AKwUvBzV/fPi3dOIOaYXTckh1SYjBvvOJF0/A37VfUfIOXToRinx8rYChZB0TRHmryHqlSA/6800CHYJTSZCHxE=@vger.kernel.org
X-Gm-Message-State: AFuF++mXKUT70eJtglq3X2vnXtQavcrMUw30AwwRcW1pMsNrVXG+3DWO
	9Ba0YGYKgRI6IuJVp8V+yjrsbwguMVNyZX+l8RmTgoKchyMX1tOH6jlJvIQc2Ebft5gvKKjMFq2
	5g8MWzTOg2D7wMV/jf4z/DhXoYQSvoaw=
X-Gm-Gg: AYBFou2JGnjRRs2RAUnmwet3r/84OPwT5F9qza72EY1+HdiMeyitdWjJxKHLA/WfwQw
	lziQQC/VbXnTBBkpWNlLO4Ff/dzYuQBaohayMM1nMCsqpvpt8zCRfKLtUIYs6itlD0/RyPht2/e
	P/nwTk7MB43H71lDFaQxEzLD7S8S4Fe2+pR6q/GZKfRxkRNQJF1dTeOnWrV/AcMwu6cE+aN/jLv
	RQB/KqTG0tJabSODRhHfLEwIZ5AVTWwkUa2nW3K3r74ieB0vyuCx0D0eI02pvo/DAW6Lrer0BDH
	kMN38/uaNjdhE6AgSzXXOd7ZWLJKqzF320ydekvjdhJBwRsac0zwKDqged+dkHo/xgEzEj2y/J7
	5A6Grd2S3Hb8K0CFYFjk+PR+d2A==
X-Received: by 2002:a05:7022:150a:b0:143:5722:55be with SMTP id
 a92af1059eb24-14f5c2ef10emr1139903c88.30.1790899104864; Thu, 01 Oct 2026
 16:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-tb-dprx-fix-v1-1-da92659e491a@gmail.com> <20261001034839.GA176164@black.igk.intel.com>
In-Reply-To: <20261001034839.GA176164@black.igk.intel.com>
From: David Medina <b2amedina@gmail.com>
Date: Thu, 1 Oct 2026 19:57:56 -0400
X-Gm-Features: AclHuK98N9acfHTGaWAbQzc_UJu8LzhR1AJw-KZvb2e5NZcBn3V2zswzwxEWLcw
Message-ID: <CAGTy6n-voghUysgDmvU5bU+zuBPyr_svGXU9m-zm+vKXHYf55A@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Fix domain reference leak on DPRX work cancel
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

Had issues with your mail servers kicking back my message - so
resending just in case.

------

Thanks =E2=80=94 I tested your fixes branch and can confirm it already
resolves the shutdown/reboot hang.

Please disregard my patch.

Thanks,
David


On Wed, Sep 30, 2026 at 11:48=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, Sep 30, 2026 at 10:16:35PM -0400, David Medina via B4 Relay wrote=
:
> > From: David Medina <b2amedina@gmail.com>
> >
> > tb_dp_dprx_start() takes an additional reference to the domain with
> > tb_domain_get() and passes it as callback_data to tb_tunnel_alloc_dp().
> > That reference is only released by the callback, tb_dp_tunnel_active(),
> > which tb_dp_dprx_work() invokes once the DPRX capabilities read complet=
es
> > or times out.
> >
> > If the tunnel is deactivated before the DPRX work runs to completion,
> > tb_dp_dprx_stop() cancels the still pending work. The callback is then
> > never called and the domain reference held in callback_data leaks. The
> > domain's reference count never reaches zero, so tb_domain_release() nev=
er
> > runs and a subsequent shutdown/reboot hangs waiting for the domain to b=
e
> > released.
> >
> > Release the callback_data domain reference in tb_dp_dprx_stop() when th=
e
> > DPRX work is canceled, mirroring the release done by the callback.
> >
> > Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation=
 asynchronously")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Medina <b2amedina@gmail.com>
>
> This should be fixed already by the patches in my fixes branch, can you
> try?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/l=
og/?h=3Dfixes



--=20
David Medina
14901 SW 87th Ave
Palmetto Bay, FL 33176
786-280-0880
