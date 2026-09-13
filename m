Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C02343893
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314426; cv=pass; b=LVB6wx/6ZP3aCPFMZ0w7fqzLn7J9J6Iyvl7l+7MKBqx0q0BvcQnpehJuwTV398jfqb+sN+WQcgIZR1ie1pp9IZKUsqvCFNrPlo2tvv1EeEasVGe26jZ0B9i8aUldIPEjuuiTcQmsSmqRORw+wzF3LAkTtPIYePvkUNuT7Uv80NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314426; c=relaxed/simple;
	bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7KU+n3wS4x++ofxBUhl1z2UmwBdwq94kRBtlQ55RQ6kqlzLOVxPTPDudp4Kv42mPqLGE06ZdGuIMevmKA2RGOiTNI/Tl7Ux8seAE2zwWOGClH0y2+Gw4qjfaphUg1Chh16J+p0BNzVcYbhYLac9mruhYk1mjBBpraUjKSG5SnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4C+vwZ6; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4C+vwZ6"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1360887e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789314423; cv=none;
        d=google.com; s=arc-20260327;
        b=r+M+0blQrbECdiHNwGRqNHPmBoZwDLrHtb6WQ3jxyjJAxvbT8Yl6EJPKLfanF63ZYd
         mbj6fHQJURBYzEKf2P1d05KkgiCiyb9mPgPxGqMOi1dH/17232LtPx0qF1kraM//IVmE
         JSGcdPLsnQ09HNVG42LO1nCiIshqZwimF1MyxZjg+J4q3ZbtFKCRwDwCcU+jUmdSjzBv
         39VrZQMl3VAli1GARSZD/TGp382nye5DHVPuiGPRys284Dx85H2o5q7OY+ROxwt8Vl+7
         DtN0mWURzs/uVyPUFOS2hjmqNGLi/+WNlT/a3EYgVkbaCwfUC0kY27TLkf/MR3oryBZd
         cErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        fh=pmARY9yUEIa75pTK3nbodoiR6YpDizIrMoxVZ42xlF0=;
        b=n+X0Zoh12jw0S7stwYcPWOGSzaIctPMmRday+VW11LdiY+UeQfXN7YEHq5gyfRxsYR
         XOFqITA82r6iSWVIoC1s9q7DTvixo9+SyoM1aCXhdT0K9ALmHu5IsOAd7kX6h2zqUf3A
         T17k6wsgTOxxtQK9XRdQjIOi5Ak1Mb+bgAOLhwkMnrDxfdxamtGwc+oelQr3Sb/HwBqr
         wCxv5o8FeY7FBSbZ7IGZfvtzxU2bE7+MChrfr5DolxXXRg68iPGdYQuW6+K8FMofOuxm
         EYt1nxIOvmVu4lw/JAvnu05LY+FOqJLRBO7lNero32U1+MAzwPLA8RL6sq87HFrnb529
         Zp6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789314423; x=1789919223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=B4C+vwZ6TOxVZ7ImvZoKk5Hd10wiJz36mN6RVG3XgnpDSLdPs/zcyQLzzWbiZI6TQl
         yaFVl6djzq5UKT5MpXKBWM1xayrmauqFr0T4ZF4TmzjiXkkNtaWUoW4ERevaUrenW/VZ
         ue1ZE57SM5/+SAmsaxUMtpSd5XR322tLxrjiBDAWs/b3+ieq18QpzkRVvxT+QprI3LKf
         LrBerA2o/yfklNeFmLc5C71B9Np8gEvdCCvzbis7F8xU/KQwtzchU7BSA9sgzSPRHWzz
         2aKNtA0ufxfgz6Rt/gajkkCaNpMyVxasPPkcPmDtAV56Xq30iqcrsSzAsF7mA5itvH/9
         0Z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314423; x=1789919223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=eIhpYUKRngBZiiDYLJUvjVKLrVCdnnlbX5RqpirYxmBoZf+alBYaDeymE+LMiCgnSm
         MbZoE0sZPhSDuvUTALQYMy56Juj4TZG5bZVbDBUumTS8JqEBBeLMoKakD0mOgbk6xIiw
         yAalhBoehs9G4bV1e3vjC7raotvefMdYdZn7O5UDPwC310roVCqZAl9eFBzBgLJExpmU
         v03NtiYKTIZJn0UY0fHYpHhv128a7Nn0MhcaI9vstb5HcTlO+7jEvINu7NB0pXUjotlq
         gmR4EIjQN4vOnF70yJ+zvlXNrwqw7oXc4Sw/X5dVMdGedt+cnwyDK9VTyOWuM0On4umH
         zb3A==
X-Forwarded-Encrypted: i=1; AKwUvBz0U/JLD8ZdUtaZc4SW0z3U2Qvihho4oCBF36frWXnvV3r340kJ6g98nFQFLGpFFQ4jKhK30JpXwezWJ90=@vger.kernel.org
X-Gm-Message-State: AFuF++kA/6eAMhu8jJSPES0xJnnUUzenaT8B13nQ1dK8vGG7xJq6wJK6
	gh+LCQA3KLsUiPFRwZ3lX3v1iLVeTW6jU9sZ0quPKiRe5PiBKhBVREnLIkq8d8qqj3F35VfnxWX
	9Dcjb7HBtpJArbQv16ycy80WNMQBTw0I=
X-Gm-Gg: AYBFou0HGz5nvTuY/ciNaoMZIUgS7CL1VQUus0spNxeb3VFXlRqFgES+kJnlPkaHe4z
	GJOrOZs/alybo4NBWAH147KAMQijP76atAATm2vMWbNEZ9BA7vfxWXOXVJ6/irwpl2OUEzx8ia9
	1sIdSWRNLaopt/dD15UPyZtSttewiM/GgdbxQna27OWeRdkX98j3Jh8/HOFAOtrzu8bMxGbIHp/
	qiuSmaWzUcpfUfuqeoneQRuFLH/Rr2VofnnCBknbc8ZrZpPhduQP/5Py2Nh26Y2BkCF5TzX40+8
	IBMwTWnS4nJuGZjM/r9VuB5U/4oqVlP0WZHQchm+erSMRx5O8EmAxQ5uN7D/l7gzlLk9Vtz9R2B
	L3yG0ZWquwHHJqQ==
X-Received: by 2002:a05:651c:154b:b0:3a3:7681:6d6b with SMTP id
 38308e7fff4ca-3a5b38161b0mr10553231fa.20.1789314422665; Sun, 13 Sep 2026
 08:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org>
In-Reply-To: <aqa7KgIJYGgf7INk@slm.duckdns.org>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 13 Sep 2026 23:46:50 +0800
X-Gm-Features: AcwNN1U3jyA-1tSNpP-D9guvtV6T3al2eJNkQEtzf0t-dPsWgp_KnaGhqsq7NoI
Message-ID: <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jan Kara <jack@suse.cz>, driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Thanks. I found this during research into kernel performance regressions,
using a microbenchmark of cgroup creation and removal. This was not
prompted by a production issue.

I reported it to document the added removal cost and ask whether some
of it could be reduced while preserving the fixes. I agree that the
roughly 3 us increase per removal does not, by itself, demonstrate a
significant impact on real workloads.

Thanks,
Chengfeng

Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=A5=E5=91=
=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > I found an increase in empty cgroup removal latency across 507d8ce13f5b
> > ("kernfs: Don't set_nlink for directories being removed") and eea5d2bb3=
4ba
> > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabled=
,
> > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
> > The result held in two independent runs.
>
> I don't want to make cgroup removal unnecessarily expensive but at the sa=
me
> time it's not an operation that I consider to be a hot path, so as long a=
s
> the operaiton can finish in a reasonable amount of time and single digit =
us
> definitely is, performance of rmdir usually isn't something which is high=
 in
> priority. Can you please detail why this matters for you?
>
> Thanks.
>
> --
> tejun
