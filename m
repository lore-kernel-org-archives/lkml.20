Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A7357CE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753534; cv=pass; b=kAUOt32k3SdKzvcoTBrdBk+I4jawQnHCpjjFIfX132wwuvVq7ttGnW79z6m36njBvRZv1+pNABbvHZ/+ravgSbf8n5LmBrgNj/3vRcwcWwxfRRBRGx638DZ3YNaMu1kmw6ze9nRDZiyey9BBvrQJcpXpK0fe3//RnAAt4swFzJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753534; c=relaxed/simple;
	bh=OcRV5X1i+/i6BPsiFF/WTNvCWpQjVOHyep8EFqKQ+nM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qKd4Cx/lWaLnON0ZH8eI0iST7MzdrJOa/Vq39P4RutrCjjDDkzgv8e/YPbzL02c2kjPNXklk40KIja34f9dhJZkMO4I/UaDAteNHSjkI37xtu/PS0rzZwBFUI9D6MSYGVZClixEGy+AeD76oSmEH8x7861fFkXzUc7mVfrvv9lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rhxmfk5W; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rhxmfk5W"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso3884890f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790753531; cv=none;
        d=google.com; s=arc-20260327;
        b=B1cZepWBqRF9h8WNA5NFhjoSJSKdsZGcaRRfosInTvQn+f3xTkJ0loSBOaMPz3ergO
         cpjtkQjDEKua/80FXAuAzzH5juLc21+thSGTG9TlJWztRu5pk7UEgq0TVRlFs4IRUbWI
         dWPiVP+Ncs+g6Ag6fQWP5FHIBSD4N7/TlK50YrocKIl/AIoWz2Q+x5T7Ii9+VojV+cVA
         QlBOCaQiH1H6Oafa3+Ngj3Pbh0YuVx+eyb4Q40kZ1ztELZHD3I/I3FcI6tiSXls63dsM
         N7qv+4LpTwMVWjiiQbJGV054q6HBBAP/FDNFj9Hj/5TI9Pqg20qj862muWW7ec7eVz+q
         PHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7UHKtemaDh5k6QZjNYDnU0Z2lZFOwhsdK6eJ32qycvM=;
        fh=0lHlLbqKtavgnLFhzobox0kPwiAxHDHwM0ViNFD77uw=;
        b=jyMhFUJDZum7zbD/mn26+cOV+aFM0yI6dMQ64rRM6p6IWXw1bIL5vROWvzuQAURX9X
         Qi0g9o5wJ9bPB50DJvyevttuNNQdRpoPMnG4oKoCTieGvt9XDu+GW8T0T0NZTQQUTH3u
         9MYNUj0Fx3wvaygKbN7LXbhVurZ6aMLxKZeKuoWVECmuBkmy7tG9ih6+ihtyr6CuZTQW
         nFN4P1d1GILG8Oi5earE8+92lIrceglFPzzDTDn4z9zX3iSdtGhlpR8qtWDh0yr79gGR
         fiZqcF8TJUpeddrUGwSKqJBTuH7Jg1IcTg6Xgtf4TlE92hc2lVfi9WCGtTOOsX79wxcx
         sOag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790753531; x=1791358331; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7UHKtemaDh5k6QZjNYDnU0Z2lZFOwhsdK6eJ32qycvM=;
        b=Rhxmfk5WMhq1GH4beOcUbcBHP4QrN7q6c34q8hXRBlAxHiyIKw+KuiO4ZZgbWjkRuE
         Xxt72Wv2QuDG6HV6/2QCKBIW0wQ+GEDAyzoh8n+/6ot5VQ0KUdgawhlYQ9tsIvsF/nxU
         Iy8QXq6TaH9ekCsHKisyWSbT3iv12ZxtUdUledFsMmRGF1LpkD1uKhsplYhmdumsE4Mp
         S4f0FRjy20qfqme5yEd6KyabN4AYWRnG72ezie/VegYmUmnFL0DmYcqUKSAozp5Mk3zK
         XyyPKpFkfiPoYUpr0e4ba9xN3ILbDby3Nyk6Y9Mo8UMzGQgKrkXLjoL9UzBwQrtM71pH
         8oRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753531; x=1791358331;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7UHKtemaDh5k6QZjNYDnU0Z2lZFOwhsdK6eJ32qycvM=;
        b=OEBKlcJVe1pUJjMTdHn/h5Ss0YS+Oaw41oKjFstDmw4qubUowrJxXRE4HGnhjQAV7Q
         TgQ34kTdMaiVzr45zyBdd+uj/HJNtOIvjsBTyDQK8GXDtWrbTjKcE98wOJWTsZax1fX/
         dib6Ng4vj/DqCWMDuNNhZsOvFNdTh6p77i43JPidWDz+bG4mOxHJBztTN1AiqFJkkjEe
         3WMhbCyULNS8SMJqY3kno8z3YmptF7DEZ3mfbg6xOQ3MX0HXSVUMoZAoJhv4DO3v3AQ7
         a0ws+q9tDmdgDOrGCjTuHkqWFUiOL7WQVdETSl6xIHNxGymthsM3fg7qU3LUHgldgWxo
         3sXw==
X-Forwarded-Encrypted: i=1; AKwUvBx0K0xbE0rm6Dh0pwI6WA3QioOGZITR9JzHrlbU1kZMaU9zDDIsLrEI12I996suEDzzeISB5qiicM6R3co=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAKFp1wZXfGTLB7Vwbh1espT7N11gKklNtx6ScGIfZXYjjb1Lg
	kOPjmZi3R2tUCHxSBN93rSu6tjs36y83iwoSOR2MJkTyCbibtFCQvwD1pADqUK6LUnBpTwMNLuX
	s3uSXRHckrAJvOGv1fr+1ez7uqzkSvsz12UgX752TX+lfWSjEmrAZjrX0Vw==
X-Gm-Gg: AYBFou1rvq5EbEFv+WJjzXJCluGDeIXWDi1jzb+5meFcdutqjUZkXJO097ral6tj349
	fwIJ2hVrFu7awCxE4Kxt3I00uhKsZL+0hsDe7MBnKVP248iIubTzjm4wk3mPThEH3+9zbXCpfl6
	Wpg+e5UJuH7Gqr2PpanCrdSCuC+mSNGeUHnR5POwrAgAMfiqpiOCDnIVJNVGDcIJ/OWSgBGdZSw
	XE0WHMbV3RIO3ic3djD0VKJH726l/zzye5v7wo9Ik05R+MQ2NQGp8u4O1AZPqdAMN2A4kfPwdol
	0XLkvWetEUMXRddNr472zi2HRnvg7iNXdmy2xvULFBluDtgMwQP0XNApfgCDLUDjRnT7KZk8geH
	qwjPaeCkzBr8FtcuMJoQsn3HFD9Yy1GA1C+EvGrZ4/21XJG1eKl3D
X-Received: by 2002:a5d:5f81:0:b0:488:78e4:5e34 with SMTP id
 ffacd0b85a97d-48b024c2090mr1252183f8f.9.1790753530980; Wed, 30 Sep 2026
 00:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 30 Sep 2026 09:32:00 +0200
X-Gm-Features: AclHuK9guMIrYQy06CqCkfId_AJWmOwlAHuDQRjITZGebPbqz1qdSxxLbTNUfmk
Message-ID: <CAPjX3FfJCH-JnjYTzSTB+6z3KfW77EExH+nXBT7F7ayZe+Odqg@mail.gmail.com>
Subject: Re: CVE-2026-97415: btrfs: tree-checker: validate names in ROOT_REF
 and ROOT_BACKREF
To: Greg Kroah-Hartman <gregkh@kernel.org>, cve@kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: linux-cve-announce@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

> Description
> ===========
>
> In the Linux kernel, the following vulnerability has been resolved:
>
> btrfs: tree-checker: validate names in ROOT_REF and ROOT_BACKREF
>
> ROOT_REF and ROOT_BACKREF items contain a struct btrfs_root_ref followed
> by the subvolume name. Several readers assume that this layout is already
> valid and then use the on-disk name length directly. A corrupted item can
> therefore make those readers address bytes outside the item, and
> BTRFS_IOC_GET_SUBVOL_INFO can copy too many bytes into its fixed-size UAPI
> name buffer.
>
> Validate ROOT_REF and ROOT_BACKREF items in tree-checker before any reader
> uses them. Reject records that do not contain a non-empty name, whose
> name_len does not exactly describe the remaining item payload, or whose
> name exceeds BTRFS_NAME_LEN.
>
> For BTRFS_IOC_GET_SUBVOL_INFO, copy only the validated on-disk name_len
> instead of deriving the copy length from the item size. The ioctl result is
> zeroed when allocated. That leaves the existing trailing zero byte
> untouched.
>
> The Linux kernel CVE team has assigned CVE-2026-97415 to this issue.
>
>
> Severity
> ========
>
>   CVSS v3.1: 7.8 HIGH
>   Vector:    CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H
>
>
> Affected and fixed versions
> ===========================
>
>         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 6.12.111 with commit 9154542070ca7eadb3c764a882f39a127677854b
>         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 6.18.53 with commit 74f577c722c99248d804eca18e7de7c5e47549d7
>         Issue introduced in 2.6.37 with commit 2ede0daf01549cecf4bb0962c46dc47382047523 and fixed in 7.2 with commit 0af37c217edf15fa21dac1c40822086df356c6bb

I believe this is inaccurate and the issue was in fact introduced in
v4.18 with commit b64ec075bded2 ("btrfs: Add unprivileged ioctl which
returns subvolume information")

--nX

> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
>
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
>         https://cve.org/CVERecord/?id=CVE-2026-97415
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
>
>
> Affected files
> ==============
>
> The file(s) affected by this issue are:
>         fs/btrfs/ioctl.c
>         fs/btrfs/tree-checker.c
>
>
> Mitigation
> ==========
>
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
>         https://git.kernel.org/stable/c/9154542070ca7eadb3c764a882f39a127677854b
>         https://git.kernel.org/stable/c/74f577c722c99248d804eca18e7de7c5e47549d7
>         https://git.kernel.org/stable/c/0af37c217edf15fa21dac1c40822086df356c6bb
