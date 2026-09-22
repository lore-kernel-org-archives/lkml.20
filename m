Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9E352014
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790040431; cv=pass; b=Pzjotx4VIRzBwrrHceeAhDjd/5HJQENtv/yBg4r/ZntY+WkLL60FMr4GrFZxnrZFM9Eh5fB4wWa0ML3OoHyGLU7f5TR/f5Fs15DB8eQgjOiFAMmeCSzUnI3PVYKFnEA0UuVapcII0MIXTG+J01XwzXs9q/hmCbTeYuO/MuJkwNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790040431; c=relaxed/simple;
	bh=mGJzwjWcciFg/IdZoQQK2Ap7EfoWAClw2S1eI36ylWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/WQHAA7vzN9F0s2GgKC0Tcywb9GDxc5pwp2wgN8rsE2aGFyUXI2VddHiZmu9TWsXwGLJGTc3asXvd/aspQWldL/RROjQA6lhVKXAFJTGmiyG3ryLVZX1YONaVhbAagj+R2Z9IyVeVfRa92Rx2jgQ9i1CKCYplApAHtNADPS8FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhUziFZv; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhUziFZv"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so3219709e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790040427; cv=none;
        d=google.com; s=arc-20260327;
        b=D0/X6tqR7w7fFw71R3XctMjonf6uCCiT5Ry5pVX57z68BnJAPLtQJvMP5Oag8/Ri9V
         vtLetCcfsMmYwqKBEFEdD/5UvkYrKe8N/itR2/z8dYOVCuoVNlqlb3brTRoU9NDkDmVo
         k/qQPXyi/EakxbL1eIJF/gHBsXuj8w/jEdThs30sVo1SrW4lHwyKgg5vsqLjmUCHQj9h
         iJWuQ75j7Q1peHxZwOo5euOcdLTZeTMJInMKzpa+iefYJFm9+60IVrsVhw5FEZv+t/r+
         rjoUm/Svrfb97djVcK2VRFvgx8ZbMPHxGAswyOlsanGdzCoNpq6bk1fR2jhcvaQ+AKim
         Itow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        fh=OiJuLDwUBy/9Ur/YhiTabfgFrg8wfNPKAbwLqYj1F+Y=;
        b=V8gvG2xSEtytlfk0MigLI0b9W+sF91NTamGj8OIGliK8kpOgKBRqpYO+nOHL9cpQFh
         b3F8EeyJyGGu0qbH6P+vnGdbzeYEPd9p8hOKxMXg5iqM2+u/95XSYhsm83EI7TOoqCnW
         7B7Q6XwxlUZlNDZ7Uq1NaUCbnVUbPro1v3RFZfy1fTCC9PHr2oyFbDFRejuC5RHARwJY
         194aS0bLTvCqyyBlA2TNmFyOsfGcrcIYNQd3qssUii5qGnxA8rmG6Q9+xFKXCAofUtul
         XMWX1PPeCE8zWVEhzzbcUKOi4xHX2AkuLIPT6xH5CL+Zt8zi6Owni4ZsWdTXP/DcuQe0
         8jEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040427; x=1790645227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        b=hhUziFZvaq2cZLpbA3hOaTjGjcqUVUm1v2MeoK6PYUkSCcAzT+HWh87Qwjxwc9aptb
         RLSlhN4mTIh1cLfoErwppljbeEonUfve1HGh3T79FH0+vxfWpp1bxxghPTKk9Utw8nYt
         TtS1gzI0PyRMPuwa+NzPHmxvy7cPFTFjJVtDkv3u2oD+WJLn5pcWWvgrvacAh3ZS6GMj
         on5YJP3LJGIXBlHMMjd1EPWGAGU/u/Ng3aI+tTXYqk4kVCrB2LjV1GBxVcEkJR3TEvff
         a8Qc8Ek54//tJM3pAhwGJAApAju0WQvmUeC2FIfLyG2wpJw9Wpldhz3hw4fDxXX1J1MB
         vLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040427; x=1790645227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BANAs9OhClkxmYfYq7iCdVo5PmXyftur4GxG4QYIy6k=;
        b=JUONjy5iBaukAiISdV5FN82EeIe5K/EetxrUmDvBtoSMmOqnQFTmF8kPe3m+rhlfdy
         JYt9jjakqWcuRvaCda2HPEtvFa2ataETBWKAYSRFi+Bcmf57vgBAz6I7jQUP3iJycyjT
         RQFVLnBLOrH6HxZLeHg/Jd0aXX9jNLsibHN2F9R+9WeE+WPXZcU13cRzfLwaLDim8o8m
         N17PdmP5xLg2VAbdT68ufkTBt4LaJmr5WXxDLjP4sGoqHivkfj/cwU2cCaxFha9H48tj
         ik7twkQQ6rA72lz0mNgY7oOCiMnW52yf4XPvg63RAkmIz5K/B5bHL1uA9Tf73/kZ1EsV
         UpHg==
X-Forwarded-Encrypted: i=1; AKwUvByOLq4lIa8oHaj4sS40yrnks5OsIWzq3iJTCnOVC/pS8zUPDFoyFXsDygzzolr+fonbMC8FE9ngTODqAx8=@vger.kernel.org
X-Gm-Message-State: AFuF++ldu95Jk3ZocvTU8mRGTzB1UIl/uvPjTRu2KvXYtX7DpfKQHf+l
	Dlf8hsyjYwe7s4s2sLIAJK15YKzeOIqlXDOQWR4yLzDyLWfnN1eaxaPYFA/on84XQMdoGJlFIRB
	N93Rs0h2tO4E0jtWkYsvtNNdUWd48knE=
X-Gm-Gg: AYBFou0A5diFHhD4ilEWoSuJk/u75wfK/JJloO9J9ryGhC0qFAWMO/UfjUwyZbWkLey
	kLnHmJ1mJfIR7prwGft16l3lqWP/DeEDbAGRBqnEIh8y00JbxEJM+JO+TdoyLIYqAeNaVwaZ75r
	Qlu7nMbgh9I7B2lKdUIviOd28ICswX3ZMoH5LsSYDEXX+6UsmCCDGnHeH/N2r9ntuZVYYqzna+d
	Rc387cwH+X8HnBNOFu3X/Q1wbJBETC1eIL5z44WQUc11IHCTkRPo5H6rEXOHlLXss8lDa2HmQcX
	anThnb52z28IYVKQ3Ow66swVlaz/m97rfM49+UQGS+i7HQymlfO5ELwi
X-Received: by 2002:a05:6512:2396:b0:5b8:bc5e:b576 with SMTP id
 2adb3069b0e04-5b8c18521ddmr3616977e87.46.1790040426727; Mon, 21 Sep 2026
 18:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920025955.31209-1-zenghongling@kylinos.cn>
 <04255390-4133-4e8e-81ad-4d2402498431@163.com> <CANFS6bYLBPr+FmE_MVWxBBMw+Qz55EFfy1u6UmBgkTak2CMyvA@mail.gmail.com>
 <4e70c6d0.7644.1a0c34d327f.Coremail.zhongling0719@126.com>
In-Reply-To: <4e70c6d0.7644.1a0c34d327f.Coremail.zhongling0719@126.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 22 Sep 2026 10:26:54 +0900
X-Gm-Features: AcwNN1Va4nHWDaoD6YaeJdDBsOK1DZQvNPVRpGTAPEu1genIzPZ2AwReUginLuQ
Message-ID: <CANFS6bYMbh3oJbSFdFzEOp4NpZh7YmagqamYXTw8iHueFm6KUg@mail.gmail.com>
Subject: Re: Re: [PATCH v5] ntfs: mount hibernated volumes read-only
 regardless of errors=
To: dd <zhongling0719@126.com>
Cc: liubaolin <liubaolin12138@163.com>, Hongling Zeng <zenghongling@kylinos.cn>, 
	linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

2026=EB=85=84 9=EC=9B=94 21=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 6:30, d=
d <zhongling0719@126.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi baolin,
>  Thanks for catching this. I agree that temporarily setting
>     SB_RDONLY
>     makes it impossible to distinguish an error suppressed by
>     ntfs_handle_error()
>     from a successful check. In particular, errors from optional WSL EA l=
oading may neither propagate through the hibernation check nor set
>     NVolErrors()
>     , allowing the flag to be cleared incorrectly.
>
> Hi all:
>    One question: with errors=3Dpanic, a corrupt $LogFile can still panic
> during load_system_files(), before the hibernation fallback is reached.
> For example, ntfs_check_logfile() panics on "LogFile is too small".
>
>    Should mount-time metadata errors generally avoid errors=3Dpanic befor=
e
> the superblock is published? If so, that seems like a separate follow-up
> to extend the temporary policy substitution over load_system_files().

As Baolin mentioned, I don't think that mount-time metadata should
generally bypass error=3Dpanic.

>
> Thanks!
>
> At 2026-09-21 15:57:29, "Hyunchul Lee" <hyc.lee@gmail.com> wrote:
> >Hi Baolin, Hongling
> >
> >>    If you agree with this approach, could you please incorporate it an=
d
> >> send another revision? I'd appreciate feedback from you, Namjae, and
> >> Hyunchul.
> >
> >I agree with this approach. It looks sound to me.
> >
> >>
> >> feel free to add:
> >> Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
> >>
> >> Thanks,
> >> Baolin.
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >> >       if (unlikely(err)) {
> >> >               static const char *es1a =3D "Failed to determine if Wi=
ndows is hibernated";
> >> >               static const char *es1b =3D "Windows is hibernated";
> >> > @@ -1581,12 +1594,25 @@ static bool load_system_files(struct ntfs_vo=
lume *vol)
> >> >               const char *es1;
> >> >
> >> >               es1 =3D err < 0 ? es1a : es1b;
> >> > -             /* If a read-write mount, convert it to a read-only mo=
unt. */
> >> > -             if (!sb_rdonly(sb) && vol->on_errors =3D=3D ON_ERRORS_=
REMOUNT_RO) {
> >> > -                     sb->s_flags |=3D SB_RDONLY;
> >> > -                     ntfs_error(sb, "%s.  Mounting read-only%s", es=
1, es2);
> >> > -             }
> >> > +             /*
> >> > +              * A Windows hibernation image is not a filesystem err=
or, so
> >> > +              * this is a safety interlock rather than something th=
e
> >> > +              * errors=3D policy may downgrade.  The super block is=
 already
> >> > +              * read-only here: the temporary flag taken for the ch=
eck
> >> > +              * above is not restored when the check failed.
> >> > +              */
> >> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >> >               NVolSetErrors(vol);
> >> > +     } else if (unlikely(temporary_ro && sb_rdonly(sb))) {
> >> > +             static const char *es1 =3D "Errors were recorded durin=
g mount";
> >> > +             static const char *es2 =3D ".  Run chkdsk.";
> >> > +
> >> > +             /*
> >> > +              * Errors were recorded during the check or earlier, e=
.g. when
> >> > +              * loading the LogFile.  Stay read-only, like ntfs_rec=
onfigure()
> >> > +              * does for volumes with recorded errors.
> >> > +              */
> >> > +             ntfs_error(sb, "%s.  Mounting read-only%s", es1, es2);
> >> >       }
> >> >
> >> >       /* If (still) a read-write mount, empty the logfile. */
> >>
> >
> >
> >--
> >Thanks,
> >Hyunchul



--=20
Thanks,
Hyunchul
