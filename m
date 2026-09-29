Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF038D40C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666763; cv=pass; b=IP3VvQAZQREy772uCobREIivDTA9/u/NdDMFpgkWqXTVitpChc0z/LbQLutqBYQK8CxBbj1WzN17SaPk5ggd+xFcLeqXHRL6rnc3ve2oVOFwPi6H8ddAHRFwODgvYfTH70MkilZvQIrv1BsJFxaxHNfAb0RMl7TXzkykqpaxtmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666763; c=relaxed/simple;
	bh=QP7qZgESzSMLgR7Y2qh+WpPtujTLFVV94zFRn/3wLJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKh+esStBZziooXY8mOX2lNxTa4hICGTVWtoeWuaaO/2ngUgxinzFbNsvqiSXoGwB3ueBXz3PrynYjmGLYNKtdQXulg2o/pbkwQYCKux1QclbvilbG4FaA14i5FNr8JhIJbJG+3j2tzdOL8XnZtusSt3nyARYW7mqGtb+3Q1vBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brmjbkJJ; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brmjbkJJ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b36a8d5b5so1338640a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666761; cv=none;
        d=google.com; s=arc-20260327;
        b=l+icy+YJFC1T5giQFtEBGmLMct7y0/ZgS7GhRneGiuK/ENZ3OaMv+QJuNR3+cbKeaV
         88cBWmAQ4UGjsYfxkin9eLIooAVzGA9ZHRpbhs3QwTMepPmbbcO83DRNrCVvfm7kgQAi
         eYNzPwdG2VrfCpFSD2BgfIm75zn0U1t8VbJTbCerktR0VZP3UprjHGRF56Yj2XOht7MJ
         J2ynaDfj5+qVv79qqaEw0zuZkxGEN1GEkwW8AWm0rK2wQQEPvuM4CxG1ZOz21rK/1p+k
         Ovr4rNaWuSgy9GdstLfbPNkgG3urVtlWHg90RDGwL6eu1lgBUGTfzZSDueNOfX+8s0rR
         tm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MBklxLmUWGp5YMrkYX4HVlElUeVxv+Xuq5ehv5XgjC0=;
        fh=nM8e9vDGoP4NL9qQIrz6/yl46BzwBMn5Sm9rjjf32CQ=;
        b=o/OB5PqBfPMgwi3PAVDlf38DXnovdfMCN3Lg3YqJJr8woW6lHnUPQ8ahkNM88Tc138
         aP8IAKPjIW4seR3/pvZ17Mtvv/L4BDK8Kicc6TQzpDiS+pkWL8uG3ZA7a+v+9M+OYpH6
         fRP8TxNgYzq0lIkgG8WCQ9dNlIxLvkTLhyu+D0oLK9ikO0x22QTsXPhxJE+Iq8C2Fu4L
         hFpghZ07kqKiL+ICqOYmtVB3tdk3WFl4H6TVrpC68iRbm4ccYx/vKaF99jV/IYaYAN6O
         PqkiBToErNYZY3fTW07nwYL8xrHNoYWQ6c82/ueu3AWxQshXI/dQJP79OHuOZJ9A+F1A
         oqog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666761; x=1791271561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MBklxLmUWGp5YMrkYX4HVlElUeVxv+Xuq5ehv5XgjC0=;
        b=brmjbkJJ+NE/GonX6oNk69B4auQ4xZFqSdw1kuEABzG6Ni2QHGqsmFqelhnBv5iTcf
         6KJ/DRkW+m3Ke822uP7HdZKmEEdCe0qcn5E8O3/AMIhRM4qQV9MYkD4zooQUKGNOw1Ax
         d7t/mLMYmReXO3X4H9VePGR0Wi1cP+c4KlFyvwhlY3/msfPOT9jB1bX/+NDIjBWRdRPl
         RDpZxc//WnyHRlek7aPraK2W5w4ix6shSp2DKKruYTPi84v6SNfys5nvKsQrVC8AYWc8
         Roso+kK5uZLlJ1Af4rkSVKtEwuHEKgj8v7hFRFjDP5uFgEPB81Nz2FChuv8uegUvx/kx
         sOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666761; x=1791271561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBklxLmUWGp5YMrkYX4HVlElUeVxv+Xuq5ehv5XgjC0=;
        b=hO8NYWumRB8OLT7hGvTH+oL/1L3BB1mrZcKST3hwMw8RmXNXsi8uT6snh4DNxmkQDR
         f1X/DlzWypFPCcgkimuHZpXKKjTyqTCo0O3OlimQQ2bnJGmF2uiR16Me4HQQwmDX94au
         F297GGdnCHFZSwj7DneZt/nbP72ng+YLONQ9Vkg5t3PRtE+H2fgUw7UFwAA3W20OxqLu
         ya1LOvyq+zzfOvzLw52C9VPmGD026seI8ZKZaUKWF4ZLtIAl8Rg/88ot81NWBQG8EqNj
         8zWinqa/WhjAzR0jU7DY9KMNQo/utVcBLiWPywZroXitBNX/Cwr8v7/Gr/t4ssl5nOVC
         0OnA==
X-Forwarded-Encrypted: i=1; AKwUvBwJlFwI2/noR9SoXFWrx70wrLpHdf8J/ekhuDMZy9CWYGZaX3fyZSI6F1lyjAlkQO9lUomwShVp90uAslo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYe8Q6ld0B5FusuWwL8kTb6DQAC2KuFbWOOmA6wFMJhiYWtlDV
	3u13OT11Ed5+AU+gxvKbhzf2PvkHTC9o596y5lTYOzLLE5DhejPDkxEHH8QKXvkK6cgNec9jNec
	ez+cVN6TKgjwYe8qZqa5P+CL4mHSSSlQ=
X-Gm-Gg: AYBFou0NXuw7kDf6o0IQf6S081OtO8nJdWsO21sF02Lm+bid7hAE2qKR83GaGHJRKFs
	i2wtKC7zx7oxmllTAvPAR7QGSxeS3gyMPBDqtjiyvJkkWLth0AqCCnx6XuaBS+MNzHOvKl62adK
	evXMYmIJmFSQZH3+T3e24iJ65cmLyFHEYEo9I6TM+3/KhhZ25/Jt4jl0a79ceCRAr+EctTjf8LZ
	bv/iDYWFIDKBeedpTwrOCrcLKmeKZvujz5Hb9gHH0MOvczjq6UJHAamoxHSBGL649WN5xUKQYMm
	xEl7N8WppA4UHqR7b/5u4nPFOAWsjvY4USsXFy1/TeftAuF3sJmARQMlejL/p0Eqwwf5yOi+dgJ
	Ku2Pj4qTGm0a4xxrmwxKnyAkZjWgieY7giwZcjN0uMfo=
X-Received: by 2002:a05:6830:6a95:b0:7fa:ab72:9df8 with SMTP id
 46e09a7af769-81916ef553cmr12515132a34.16.1790666760781; Tue, 29 Sep 2026
 00:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFabseTuRiyz2pGkc_Qj0moGDnY7KEp1qdTOqkw6gAL3hw@mail.gmail.com>
 <20260911183811.374433-1-aliamemis@disroot.org>
In-Reply-To: <20260911183811.374433-1-aliamemis@disroot.org>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 29 Sep 2026 12:25:49 +0500
X-Gm-Features: AclHuK-Of9yKGEJugUCKZw2ooiR4vfhfGUzCSb342ECJlyfoCnnZi-aVCEOTQv8
Message-ID: <CABXGCsMfJwgYQ6nToU2PkyZeKHZPD4K=ObYtsTx87NvhvM0xBg@mail.gmail.com>
Subject: Re: [Linux Kernel Bug] possible deadlock in l2cap_chan_connect
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
Cc: Jiaming Zhang <r772577952@gmail.com>, marcel@holtmann.org, luiz.dentz@gmail.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kees@kernel.org, kuba@kernel.org, nicoyip.dev@gmail.com, suunj1331@gmail.com, 
	syzkaller@googlegroups.com, Pauli Virtanen <pav@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 11:38=E2=80=AFPM Ali Ahmet Memi=C5=9F <aliamemis@di=
sroot.org> wrote:
>
> On Sat, Sep 12, 2026 at 12:59:09AM +0800, Jiaming Zhang wrote:
> > We are actively working on a patch, if the above solution is acceptable=
,
> > I would be happy to submit a formal patch for review.
>
> This is the same lock inversion syzbot reported as 74071deb, and Mikhail
> already has a fix for it under review:
>
>   https://lore.kernel.org/linux-bluetooth/20260904012028.77590-1-mikhail.=
v.gavrilov@gmail.com/
>
> It uses the same approach you describe, queue the confirmation and let
> krfcommd handle it under rfcomm_mutex.

Hi Jiaming, Ali,

thanks for the report and for putting the reproducer up, and thanks
Ali for connecting the two threads.

The deferral Jiaming suggests is what v2 of my patch did - that is the
version Ali linked - but that approach was dropped during review.  Pauli
pointed out that delaying the confirmation makes it hard to rule out new
races against DLC setup, and Luiz asked to break the cycle on the connect
side instead.

v3 does that.  The session socket is created and connected without
rfcomm_mutex held, and the lock is only taken again to put the new
session on the list:

  https://lore.kernel.org/linux-bluetooth/20260912100315.151674-1-mikhail.v=
.gavrilov@gmail.com/

That removes exactly the edge in your trace, rfcomm_dlc_open() holding
rfcomm_mutex while l2cap_chan_connect() takes hdev->lock.  syzbot's own
reproducer no longer triggers with it:

  https://lore.kernel.org/all/6ab100d7.71f81b7d.15fa6d.0029.GAE@google.com/

v4 will follow shortly.  It adds a check for the socket being closed while
it is being connected, which Luiz and the Sashiko review raised on v3.
I will Cc you and add your report as Reported-by and Closes.

Could you run your C reproducer against v4 once it is out?  A Tested-by
from your side would be worth a lot, since your trace hits the cycle from
the connect side, which is the edge the patch removes.

--=20
Thanks,
Mikhail
