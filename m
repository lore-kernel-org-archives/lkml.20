Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51D336885
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021378; cv=pass; b=Q3P37D4G/GeAzWrkk39M7fBbLR07nudzxy8/hYsaYbo4YNrOM0qnPVJdu9WSNIzYxdZIzCPdi6QALP0LP7W4yxvDaewee8m6Ep20D9Lp5kFqQZuObKOP4odN8WpaVdCnYaOqPbIlSazHWxn04nm2qB/LgpfXt7a7KGwP4YCwlvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021378; c=relaxed/simple;
	bh=/AHnFAHcZ/XisFRf/YAi+UxjJLiaFOISzjcop6LQd0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ugx/BODVK4ivhXUI52ArP97WQZvpRIubhaQL7acrhykSpmsREFHLaoxVzPwjRx6b4cwnQGosOJ3Bx6ansVB34jlpNh00gOWQZmrFb3Ce767rSnynxe8F7Z6omU3m5LmHeN3Kwr4qTeKAp5p8qxPLDaRWXwCEqh4lGyw1boLje/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ob2ME6DG; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ob2ME6DG"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87cc77672so930341fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021374; cv=none;
        d=google.com; s=arc-20260327;
        b=ZaHbNJZT+lF2wPTXUovwJuj42QiX0TlQNgYsw3LUUUkcMBjufrutJJvac8+PC+hoHo
         duR4XGGUXBu3xwzyP9LbE9+Xtk7Upvoa4jxXd/MOoQ9TVb0LsD+JGFR5nnEz3QHpW//e
         wKdC1YZP5oa/GvoNWwoj3lsIuNS3lNqOGEx0T3XrNA4RCpWLzg1j/Gyj/eT9Wr1a7gzH
         aiYCKT4URvV4o1Dtj2t4l/VOMIF7id8he6CBJUijmxGKT8LP5a4mGsKN6QL4GlB4fCMn
         DWfouHGtzsHoJnVJxLJ8g2L6cwMXiEyBgmoZ3+noq6EGvjaKvkjHdjdSqzPGiJhZZuRd
         anLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        fh=cwW/m4piKiN3qIYABQd1mPNEElfsLS/WWSuzU1SBAfk=;
        b=DrPL9+6uc+GZ9fzfocizn+Ar1U/g+LSj8zQ8LR2W0OnM9BxB7SwPFR/9mXFWIqrXkP
         DZ00AI94zDkC9T6/OYqXnwnqIbSk9ZiP5AXLEt7FEp5rdHCDpjwQmAnHewA9dW8l4KEC
         ryXPNi4Dypi6wKrESMcaEWIJjrkgco2EzLEVxkVIZkl3XTgvgau+1MJYOfHjiZ3pjQ2U
         6kJnoMfHmOvI3lAWNGtxcx4G7ComnqjJ6dbGB+3OFkJL5s4mrLD/z0bibE6rXkWaOsDt
         N/Oi7jHSY4CelRD7MBerc9OQSp6WPGtLrowLswHLqn5nriKwHR/Ptup+chhGKYhl/rIe
         A5ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791021374; x=1791626174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        b=ob2ME6DGzzEZ3sJT/VwZZpKiZzkQGrAtFE2vvpG6oUxa4NxSGqf4A+peysjnDUHc0l
         R1ZmoIQCnXSjcl/CvQVHH/Goo8e/QyXIn2hkK4TKMT+3dCUO47XbgWi4xnuSGS3QtEPr
         i1ELal9JQ4Uk/oktQT+nJsFC9zhbA6ypreMpXAOkUl57oYlvM0+S0/IfTTg+VM5k0Wfo
         Y9O23qG8yaUGDhsGB5X8ks4RqFyOG1cVOwCCcuZ0lMFCPc6ZFbZNC6TRHRooyV1uNmUa
         KeSP/W/IvPU4egZUM485fIau2C3ZgmgOmVp6XDNJESraZmAL8XaMw9b97kaXC4aos5Ic
         RA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021374; x=1791626174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQkpbNNEsN71sAfq8SY4oa/9xDoFJzkXgdCKEiARGdA=;
        b=zUIZAmvUc/S59zB4xMzjqdZtPWVMXun+/fBg1Pm8fMyU5xhDd3UeALHpAHEovSXFaW
         qrR3zSZAF8/aTWTveaUbF5KFuE/GgRaPg06jMtOjFGx1RwiUsiu7YzdCoKilStsuywAq
         8Z5wZaQgABy4RgGAIzrVRwe8mNzDPLzQvGSk5niTa/un0sU2NkdYEoH/yJgGir/8beoP
         sS3yooOzhi63GKUS6qoBbI5KTX+Lqe35DmVvo4rRrzZBTVw2+gEaUW7CJKczPspQbaNJ
         wsFUHwRL4ihIFSoqJRNxMAsRT0BRToOBMF8nSRMvRr/mMRZBZf2zHZPrtCo9LTMT/TP4
         /2LA==
X-Forwarded-Encrypted: i=1; AKwUvByFy9/EGo1xnC39H/peps3SMnF1h621TZ6a4WnNtgKYMEZhXvwjzxeK6zdtwCiYEaE+sg7poOgbAFLpRAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9a/gVVJ+yWYBMDWzPu2+6Ij72G4jxiLWzlU6pvQwXG3J5H6HK
	sBlzUy9EbSrK+6asKy8a80tXYJ0gzeN3V6gw9pcPlPoxP2BCavsx9AyZjDWuonhv+flvtgaWe9Q
	jz78/MicdjT7LaTdTEqE+ZbqVlm9AydE=
X-Gm-Gg: AYBFou0pAYHStAGqPLUZMrEqzupwD+pjNWb/dlgMnQ1WgV9R3pf7LLWVcFpqlkGFLwT
	nRZ4a9euTjTIXpMY6Yxz+rqNr5jC13vRx9min99Ps3rjAPLNGnLJ+DfR/dKICUP9dGE7twZ3A5c
	yIDtYAs6E9NznN4ln8oVO5XsLzcn2H1zmrE/t4fWIxCfDOaNMqiFf+rhG9he3tmrY8YZrYn+adi
	CuHBO06jr/n88mVMuouDL5wkrPPwkQ6k1jhvh2mwFI3aBcLaeuHfeXMlckWyFlTt64g+WWPgN8Z
	vpJc3/MQweQb/Hox47fFdf4PojEmERQh4es1OuCZbmGk3zAF8xVRCqG3vL6fEOpOWdaolN9z46N
	8P8US2FxG7a/DV1NjA/I8GwbB6yzG86CZHksf
X-Received: by 2002:a05:651c:150e:b0:3a6:5cdf:d9a4 with SMTP id
 38308e7fff4ca-3a88755fdb6mr15688531fa.2.1791021374327; Sat, 03 Oct 2026
 02:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-2-chenyou910331@gmail.com> <ar_APS7UG25kXXYH@wyuan.org>
 <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
In-Reply-To: <CAKspUhKypHhegcJJ1DokVhUqLCBE+VaQkX4cMw+tt2L2p1FgYw@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:56:02 +0800
X-Gm-Features: AclHuK9jc09bWrU38UVJw-t1zRqljdvEpWFTPOkrnR4D1RSeuc2oEsRAxr8jYJ4
Message-ID: <CAKspUh+XM_E0CyrG8Lf-fGNFuQop0+i5_O7b+eRJ_Ghp0x6JZw@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs/zh_TW: move security-bugs to process/
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026, Chen-Yu Yeh wrote:
> The <N> commits since the move, including the new sections you noticed,

That should read 17 -- I left a placeholder in. Sorry for the noise.

Chen-Yu

=E8=91=89=E5=AE=B8=E4=BD=91 <chenyou910331@gmail.com> =E6=96=BC 2026=E5=B9=
=B410=E6=9C=883=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:53=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 02, 2026 at 10:31:25PM +0800, Weijie Yuan wrote:
> > > The translation has only had mechanical changes since it was imported=
 in
> > > 2021, and the English document did not change between that import and
> > > its move,
> >
> > Hmm, is it? What does "mechanical changes" means? Does it mean small
> > changes like typos, format, and etc.?
>
> Yes -- changes that did not touch the translated text itself: the
> address updates in 2023, the tree-wide character conversion, and the
> path updates that came with the English move.
>
> > Maybe I got it wrong, but I noticed that the current version has quite =
a
> > few new sections and additional content, though. Am I misunderstanding
> > something?
>
> Those all went in after the move. The window I meant is from the import
> (July 2021) to the move (March 2023), and the English file has no
> commits in it:
>
>   $ git log --oneline --since=3D2021-07-29 --until=3D2023-03-05 -- \
>         Documentation/admin-guide/security-bugs.rst
>   $
>
> The <N> commits since the move, including the new sections you noticed,
> are exactly what checktransupdate.py reports against the 44ac5abac86b
> baseline once this is applied. That is the point of the move: the
> backlog becomes visible instead of "Cannot find the origin path".
>
> I should have written "between the import and the move" more plainly;
> as it stands it is easy to read as "since the import".
>
> Thanks,
> Chen-Yu
