Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4041DF98F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788743521; cv=pass; b=aq8MkNHjd+tLI5KIkWyDMDoSddMUOj9SzIpxeUzXp3AedUjuf++bjO+3jXq4X0LSg4RXcZAQIQwNSclD7HQcM2W/Yw7IPYo5Fg+Eejew/OLHGa+0hdPc0vNt+u8I3KistXMdPHQwBdQqkAMbqupe1mWoCcRvns30ZPJxUn5DbhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788743521; c=relaxed/simple;
	bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=J+3kNw7Oay4MOAm8bDJhNh8cPEKntHgWNtyQTpRtZYgtp1LKdLKwI1wYsKfPujkPcijfYULWeAvFtGdRixXDEcqyMGcdxe5QuXxKO9p2TJN0XtCxcxZcBUAMDg9J8K/FRlkO4HI3F4XanCPbbE+jxs5lUHEAHVW3eTn6/58C3VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwf6Gv4T; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwf6Gv4T"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4a46a53abc9so2687785b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 18:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788743519; cv=none;
        d=google.com; s=arc-20260327;
        b=VaexE60yfit52Tgrj0ZNTwQ1rJtHUBlMqyppE9p2eQ3ZJey6gR9Vmyt5OtYWS76Va9
         4s2Jn3dGU1FzziGK3qJu28h/4/o4eYOTUcbQO665k408t8BAsN3/V1VEPpQ9ANqEaeSE
         9YZlCxZ04/13/s1MlEPUYAjufwmjmCIkN5HbkALr2gCwRnO1UgpDNrnWZ1+wP9qb10GN
         RpLZa25Bi6LUFn3fEDya+4vAUldd1ktDs0MlOMwMEK7FCViuFZCqqePxmeI94n2WDoIx
         Im1dQaY7KqHUCaJTxUDcWVrjBaryVJl+DVT31LdmzAkKhui/a5N69c/tOralxct6w3ug
         PqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        fh=k2CcFIVxhMNX2v7IUx885F25s9jSLFtNL2GBnO7tjtE=;
        b=ogr6HiMser9R2bNBjP40PuMXIVYKRaboNCgAMHksZNII807wi8kd1WfZiQNDKIqYce
         +NoUFa6OuXoHiiNMrA1LTaTi/NS3ajXjZGCztku/qi13pDlf8s6zqZFjm/5dzS21q3Rb
         Jh1JgZJ72o3q/svlguxRWo6Clco+3aiOIacc+X6Ymdv06xql9HIGoxL9VJe10C+y4HM2
         2EApEoccQ3T8gAj+GM7JyT2cgyvTufCbQd+Hrekv8gMifn5DzD7Cz1j4vxyMLltEzbdO
         +IzjJ+8z4R0MtJlAG0/fR273mH+XzbuZYyQzhZD1+B7tCuQfw7+rBeZYAG9KXQBm6Ct/
         a6+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788743519; x=1789348319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        b=qwf6Gv4T9fkp8O4C5CzO/nJ7OJUED0G/kc39pA3A0flFG0Z1MB2zfArk/O8d0Jan2s
         5ek0fHZHD00M33/cFQd+BIlBxkJA60pjl65ns9CmHoX1tBCsxzS5FaQvO4Gse/RTK6RL
         RCCgm/aA0RF4quNchMEdbm6SxMtezOMoOBfujN6Lk+knNaQeMjpffC6OO0aTCLbByOtT
         GPT9KL3E63pp97db88EjzbqBgos1Pa0QBtInhzK9CnufDcep4/CQvJj35j5xawVLgcSx
         KDNclqI7YvwZPN9gFjtTwOATPtDQbTLoPzZ0ECOT7avChibAjswYFDPxnouCJg2VOE3v
         vBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788743519; x=1789348319;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7V96YHpQ/UziaMZvPPIkht0HHd3decCbH3O1UM1inNc=;
        b=HXSMvjXyDqNs1SPiuFkjnGCsgunuthY6FMEYyD5QJ0XvFzS39yzLq/d5+pJR0m9Z/I
         KZTvosGP5f2+ks/hSFE9ktYyOZJF+fTeXaH8m1vLD6r+mDELVEVJh3Cbj94nUsfYxvPb
         t6rZD8Zla18BkR1HHolASqn36hqmAMkjlyxKPxG/MDSHr/MON9YOTB+Z0mNxsH7Sh/oA
         pgWSIa7JVzHPRT6UI+D/mx9kR1Jymg5KqeY8fOIbTkZwly5WkFhChFUcGz8xvEkZMFCQ
         JiVBg9k/kJVULxrKrEVbg9IH0cDRKBpSRbL4xZ44cKQgLe+j/0Q0hvF300m1UY7tbrgo
         6++A==
X-Gm-Message-State: AFuF++nCwAnIhb6hqEBo9GxDGb5X71NodRbjpX4ch68hIosZoYJDpfUt
	nSc334kYCB4t2pmiNCfL/x8ts8v+4uFqXuUrTOQqj40fwXgdQ4nGIU4Oqh6c7cBZPmzywDezyg4
	ez5PVBR7NvwF0m54CDWe5upwfkWqb4EFfNHZI
X-Gm-Gg: AYBFou2iFrp9Rq2qaPV7KOIMcKfFkcfTzUDzYBYVRm77i7AQm1JDc8xdCHwwv5EpWuf
	cLCttajGF6NfbhY4G36XycUft9soN1vn5MWRDaC720HXJ/42hV5kJkH7LypPqvdnf+id+qVz1PL
	4qn7g/Rj4DjQ7TiZPDmQLseiDt48agBImcE7A04o23LiDTrUR7hShZZQ/xkWIYkhy7jqal7fVLY
	5JkYCNNAZ5DOZum357dzhn5lJB2aUxVYbhb+Gc7ZUXWIULck4WN88aMGRDEPmOSGlByheaN3oZS
	YGde3THy5ufEopsfG+Q/daTiSFkm5ofGgyJy0YL3vX543y0mBhS4q5skbVbm/ERoUf4SmpjGqCQ
	jrJUBX4sst8ohR2xF/pwFm73waD7K3QtgqvpkWclw1DOsQh46bB4A76+Tnh6gzEbh
X-Received: by 2002:a05:6808:251a:b0:4b3:17ae:16dc with SMTP id
 5614622812f47-4b9616509e1mr14411599b6e.9.1788743518709; Sun, 06 Sep 2026
 18:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TWFudWVsIEEuIFIuIGRlIE9yw7plIFLDrW9z?= <deor001@gmail.com>
Date: Sun, 6 Sep 2026 22:11:47 -0300
X-Gm-Features: AcwNN1WfCwyE2Thp24qJQjB-cmbXW2y9wnZ0IdGosAFwnibz2ilZw_V_6bfHbQc
Message-ID: <CAOXykpgCPMB7fGGJXD0wdx-0boy3vdRZraFRhegrh7azJiYONA@mail.gmail.com>
Subject: Dolphin (26.08.0): "Expandable" folders in Details view not working
 when per-folder view properties are enabled
To: linux-kernel@vger.kernel.org, denis.benato@linux.dev, luke@ljones.dev, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Denis and Luke.

I was wondering if you could help me communicate about, and get some
information regarding, the following topic:"
in Dolphin it's intentional (a design decision) or an oversight that
hasn't been addressed yet.

Environment:
- Dolphin 26.08.0
- Fedora 44, KDE Plasma 6 (Wayland)

Steps to reproduce:
1. In Configure Dolphin -> View -> Details tab, enable "Folders: Expandable=
".
2. In Configure Dolphin -> General -> Behavior, enable "Remember
display style for each folder" (i.e. GlobalViewProps=3Dfalse).
3. Open any folder in Details view.

Observed result:
The expand arrows for subfolders (the inline tree view) do not appear,
even though "Expandable" is checked globally.

Expected result:
The expandable folder tree should work regardless of whether view
properties are set globally or remembered per folder, since
"Expandable" is configured as a global Details-view setting and is not
something exposed as part of the per-folder properties.

This looks related to Bug 524626, which reports a similar coupling
issue in 26.08.0: the new per-folder zoom feature is tied to
per-folder view properties (GlobalViewProps=3Dfalse) with no way to keep
it independent. My case seems to be the same underlying pattern =E2=80=94 a
setting that should logically be independent from the
global/per-folder view-properties toggle ends up depending on it.

Could you let me know whether this is expected/by design, or if it's a
gap that hasn't been considered yet? Happy to provide more details,
logs, or test further if useful.

Regards,
Manuel de Or=C3=BAe R=C3=ADos.
___________________________
