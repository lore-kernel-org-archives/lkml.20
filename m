Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E83CB544
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152632; cv=pass; b=WyZVssTphqAwG9koO8vUULd26Ao9GZceR8RTpaEUq1U5jDlS8kCbvjuajLv8v37R9blz56AcMAWbNakr8iYnDnvMtfhraAL9WNr450MlfJ8vldd3yrqbjhocTWanzW7M76IBBfjXDuisEN0y/h8G1KFCYqnHSZpT1eMsOLmgIxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152632; c=relaxed/simple;
	bh=3KvOhxNm0CE5YxCoN9gJrLaYGWlZurxjm2gpi9Iw+PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUD4/8FbNkJeOcluBW+zOK74yNyq/BGS6jDfL9pCrvxxiYNVexo4uOe4s76Or1Wez6NyWR99T8p27LI1cVZkJ04q+yHEfuyjNA3JCHxQm4I7JBhKvqD3TftKyXqHu1FhHPZ/C7LNg2ooCEubc4sbEA991EbgvB9vEAjwLdC4aTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZcloMXJ; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZcloMXJ"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso83273241.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789152630; cv=none;
        d=google.com; s=arc-20260327;
        b=SWYhtO5YpCy1qNkD6Ut1V7EaVGUlj8DhtgPfvKB6jwFC+lrMZbYscmpH/3n46/oVtR
         a11BjXDInh8WaRv6zbs9cCQm43Aq9XB7XASGXQWNKsSURGBlrpY3uXM6GTHWc+dz1Go0
         74OUsy/By66RNuIyAAAZY1/pu7evSOR/rnFRovOCim/kh77HuIQ02PaWyuPpOkIHMWrC
         SUlNEEHQNy/C+bgOmLD2h+yp/Y1OzBaQAJpY9Cq/oBIbu5fAG4R02RQqfbIomyQ+rCpr
         gRfypMnDAHbtd3ik+9e8vfzZaCFz9N3css/CrGs7dCzwoYRsUeesWlvyOoNsTKP3cmzq
         KNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        fh=MikuCCyhqdGn0hyBfSXxfHflSbeD0xYQ0hjhhBPwXFY=;
        b=npKWq2QKm+SDoWqABT9H+IfDNTXLI8hN3XpGBMVtSj85tQXSHYrUhkBSWR1Nv3z6xn
         F3KxA0I/TlYIMPlamVCHzfypsRhwPW2bNxqVN4JXTK75fItNQAIvWJm8+07hnTrA6BTt
         CJnKk/23V0qxTIb7V2B7/Ppg2L7U3nRD9KQ1++ygs1JXvxvYnZyh0ohXNPt5uK86XHWl
         TnDuX3QqAm0ceS8p5nUgiQ5SGgRHU2N2Fsc0Oor/4KSDNRIWyo2fquQE9WDZlTULTuzu
         HzUiibuIebXh9iAd6XYyeTTDS6UCSAPCpbWy7EKkOTaCJ9wDOE5lcA5UTKj90i4LNiAR
         hF6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152630; x=1789757430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        b=pZcloMXJ5cYBatjZ7UI3RpDFcwmwg/j9oB5lzU+swftc6TNlFcEov+VFfK4BO52FGB
         ea0TL+hj+TrhIap2vr0AHzjV1UCYIrobL9mzh/UqGlAWxwAkUVtaSwLyJ2fwj9vLcL3i
         UQ/lvWkSKfYryv8fQvZf4CFIpzNXCgZ0bbCVxT1xOC+2XcKn1K5cRPGXciVb4RAHF3Wo
         anIqJjnkGdB0c/Mehidmmgko4QPbwip5jGQZDCzdq3x6a0plD3E1O/rr0+Q8VpRGgAXj
         p7XHn4eh7qikh9Gr7YJOIf9aduOA73ko6yu+NchWjQJn+1Knwazk1PFEqeVtN10++Pf7
         lfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152630; x=1789757430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        b=hBxXncUxYWLNWuOWlVGqSuuTj810VVi9BhSBNgpQDAQfGZmY+EklG/1XhOOYGpGDZK
         vrxXZvlTwRhk0mO5vhBXd6HEUytKm1DtYqxTnsDfJBCCeF8GIXAMLdnSCPdOsETjQXtN
         QnkdOgsUBNXJm3Ukucm5YS0x1cOt+3uXKjrhPjWmvajbLv94pzbgHVnxGZOifRUw1NfR
         0x/NnPiw9G5P5tNEL9JUx9MJWkpg/2De+BPTYtI6M7f7ehneAAgn3d/NLkNUM5xB4ufO
         HAOk+7ZBIVVZIHMItl7E4nyHDgJJ836CQdpAQInOlbDZrceyj1yUmOxxw4DQa31yNTZ/
         JMNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNULrVbb13GGC9axNKgpKWyKdC9mkD+q7ZglUraWFZaHXaVT855iVD5yzQO5/7ddvDikyQZsF0ZdFVOl8=@vger.kernel.org
X-Gm-Message-State: AFuF++mZrPjrtKui7ywQcLee6tMt4JoDbyapAnpspbLorU2WWCY9B8xb
	7GIVixd0tfy3+vxP9h3/HEdXWv2jok8tQ/JWlNtflGqf4HX2WjPQVs2hmPtlcT2JNvP1X6xuY3n
	d7pffkVRHi+CF00UQjO4hjmmjiustuDk=
X-Gm-Gg: AYBFou05R36Tj0SxPceJKo7DcWqYlIDma+jESSbukMj1DeenB4TfT+aTz2zkKuCHOPb
	ZIVtvGCrPHfovdz5fwpiz/vazKMTzJcWL3GdaA5K05mtnTPccQM5fHaI6FfN1sTA1W1gG3TVrHA
	RqGhvx26vWfljoV6l9S2d2tlIRFeL6FpUM32ptAH8wN+kkIsxITmqiZTkPKOevXcIZNqOg+esk6
	llHgFRFB7rRQzQ0+3BBHBdMhinwzvlUY5yO8njb1pGUkiOkrlG3tiN05tAjxtX6Y19/6/owAjcF
	LHE+dOCxaPPqrPiwYNIHEeAAf+Eno/9E4XLBp2fpbGo0cWzTeGjCmnVFObjyJUwAN6/FeTMX2xM
	Z7am9Rqc18wNDRwwelljgYE9nvBW7fzEndsVBbCCodYLgFA==
X-Received: by 2002:a05:6102:330d:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-792ac9e510amr2037393137.8.1789152629798; Fri, 11 Sep 2026
 11:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
 <20260909002506.GF9053@twin.jikos.cz> <6a5c2d41-b10b-44cb-969e-b4a56d002ceb@gmx.com>
 <4c5117f7-1ddd-4596-8917-da47379506fd@leemhuis.info> <20260911182125.GE54722@twin.jikos.cz>
In-Reply-To: <20260911182125.GE54722@twin.jikos.cz>
From: Alex Romosan <aromosan@gmail.com>
Date: Fri, 11 Sep 2026 20:50:18 +0200
X-Gm-Features: AcwNN1UW1FBEQBXsPkjPpE7JnH1VnJKY_2TIGIr7JWZ82tYw8hH3-PTdsGDmOLw
Message-ID: <CAKLYgeLAXC5qbNAWnS3KNCijuRT9mF_hz4e1fUexx+D-J5Bs4g@mail.gmail.com>
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: dsterba@suse.cz
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Qu Wenruo <quwenruo.btrfs@gmx.com>, 
	linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i agree it's a regression. one question (and i am not very familiar
with the underlying principles), how do the other filesystems deal
with this? shouldn't the registering of devices be abstracted out
since i would assume every fs does it or is this something btrfs
specific?

On Fri, Sep 11, 2026 at 8:21=E2=80=AFPM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Thu, Sep 10, 2026 at 12:39:25PM +0200, Thorsten Leemhuis wrote:
> > On 9/9/26 03:13, Qu Wenruo wrote:
> > > =E5=9C=A8 2026/9/9 09:55, David Sterba =E5=86=99=E9=81=93:
> > >> On Tue, Sep 08, 2026 at 11:59:43PM +0200, Alex Romosan wrote:
> > >>>
> > >>> [...] Since version 7.3-rc1 i haven't been able to to a grub-update=
,
> > >>> instead i get this error:
> > >>>
> > >>> /usr/sbin/grub-probe: error: cannot find a device for / (is /dev
> > >>> mounted?).
> > >>>
> > >>> 7.2 is fine. a git-bisect identified commit
> > >>> 108cc873398932af589c295f78c348513b8d70d9 as being the culprit.
> > >>> reverting this commit from 7.3-rc2 allowed me to run grub-update
> > >>> again.
> > >>>
> > >>> this is not the first time i reported grub-update being broken on
> > >>> btrfs. i reported exactly the same problem on jan 8, 2024
> > >>> (https://lkml.iu.edu/hypermail/linux/kernel/2401.1/00596.html). may=
be
> > >>> the discussion that followed would help come up with a fix that wil=
l
> > >>> make everybody happy.
> > >>
> > >> I remember debugging that one, https://bugzilla.kernel.org/
> > >> show_bug.cgi?id=3D218353
> > >> Reverting 108cc8733989 ("btrfs: fix a lockdep caused by path resolut=
ion
> > >> during device scan") would bring back the lockdep warning and there =
is a
> > >> locking problem.
> > >>
> > >> The commit says it's fixing 2e8b6bc0ab41 ("btrfs: avoid unnecessary
> > >> device path update for the same device"), the difference is in lines
> > >>
> > >> (https://bugzilla.suse.com/show_bug.cgi?id=3D1230641)
> > >>
> > >> -       } else if (!device->name || strcmp(device->name->str, path))=
 {
> > >> +    } else if (!device->name || !is_same_device(device, path)) {
> > >>
> > >> Which gets changed to (by 108cc8733989):
> > >>
> > >> -       } else if (!device->name || !is_same_device(device, path)) {
> > >> +       } else if (!device->name || device->devt !=3D path_devt) {
> > >>
> > >> Each change is reaction to a bug, I don't see a clear fix which will
> > >> make it work in all cases.
> > >
> > > And I want to add that, the previous path based comparison is also
> > > problematic for namespaces/weird block device names.
> > >
> > > Although not common, it's definitely possible to map weird block file
> > > name into a namespace.
> > >
> > > Thus the path based comparison is not reliable in the first place, no=
 to
> > > mention the later lockdep problems.
> >
> > Well, but our #1 is "no regressions". And the recent change while fixin=
g
> > bugs clearly causes one, as Alex's report is afaics at least the third
> > about it; the two earlier ones can be found here:
> >
> > https://lore.kernel.org/linux-btrfs/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df=
4@gmail.com/
> > https://lore.kernel.org/linux-btrfs/018a9738-1d4a-43a0-9352-a56d1e54136=
4@gmail.com/
> > Plus a repost of the latter here:
> > https://lore.kernel.org/linux-btrfs/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df=
4@gmail.com/
>
> I'm going to treat this as a regression. And for the record Qu and me
> are in disagreement on that. My target is to make the systems boot again
> first, the fix may leave some problematic case (like mentioned, devices
> in namespaces), but that is probably a lesser problem.
