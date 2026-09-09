Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F783B2FD9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981836; cv=pass; b=CcTX79pGZY4UCRai8PFYu4PZGpRF270cuzuCskQx6eL8pc+eVNxwZopbyNjGr9PLqLU04A4GYKHMym3PbtRnVZgwtDYqNsyTCQoub52mRbo6DCsqG42bVkqkuZo5/1R8exujtVBLDu5E43nC72Pe/H7jQcbBnQU75S63h6XGSEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981836; c=relaxed/simple;
	bh=ZYzMItfvZx4mEK7bjd4sez4FOL2n4oCIU1L5QhytUE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOT/p5WsPfGOJOj91RHynMyvNqJC7fdalrSyTjYOadTn9xkHgnYIZuDX65U7m8FRRVyvppeqVAYXhMW+pVvPjSoZ3OnzA4gmy3iA/TUpMNBah25m/teZzBNwIxrnvEvLEZE2PPl2XKfHeMM54EWN3MK45ssKGRceVs2Y+EculPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORHJrD1i; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORHJrD1i"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f18010so649749e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788981832; cv=none;
        d=google.com; s=arc-20260327;
        b=gzcDu6pwAaneOunghFdDfFBfGneGnJywVI/8BktjpVvZsV4fSttvi2ckr64spASBPS
         +58TA13UJmbMIeOLEgreNAuHje9RY/TMpHC9tWbcw946uJ/wtW9d7T2S4UW5W3zTy4/L
         0DcdvZr333ceZ9zPJGJymcGF0t1Vsje3Sz30dRQurZQoP7iVnSSxRrSyBuZeAnipHccB
         BuvxKLBjEfcqYtJZ0QfLRH5MBHUweYxsBrka1MLxXBEKc1xqJX/oWA/z4tP8WRztvYgH
         DQCvRI3IpLyzjr6AujF7KpxciM1e+3DVQ0W7EcF6nbTG6H99o/gYXzo9XhU6GkWM4G/f
         DdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYzMItfvZx4mEK7bjd4sez4FOL2n4oCIU1L5QhytUE8=;
        fh=D0vab8zdYDSFjcEwrxLemN90wzrWbnuQZhEnan7r2gs=;
        b=cjMZNkydjfUOaxzCfLNehN6HOWc+ngfni+l8otPOtu1+K7W8Q5fvBZLjCvrKXSj2Nq
         NKTk8WrfU+pwZ9sOaxOCw1mVGi/7spY+VF0Cgzru3QHxFBxPZO0vRMvg1oL5eWV4PXJY
         4AeeZCunXvjBNwulYlCADIGQPQRWSVwJZFWRvN2vnQdtcOlKOObOLus2T88JBRXhR/Sz
         9Lrmd2A5JyWEGME321kG6n1OX4WAXqD8y7wfag3FBYiDTjd6jRaE6gTZplhT7ctUZnG4
         cgEyRiKwKmIwjl5lp+nTMft/kZMPPScCYanpxGTSn4+XCIdZo7xz3Ee2uqLbaOtREnZ1
         0uxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981832; x=1789586632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYzMItfvZx4mEK7bjd4sez4FOL2n4oCIU1L5QhytUE8=;
        b=ORHJrD1iQbDhoOUGd9zjj7Nb3TX18uab3D7hLe/sYINGOz6+kaL7sgvq2GtTgmNS/Y
         JOMsbV682Cj+CKMZ+DhEQMorE3SeuLxJgxvyaMUPFqwdeGkaM+UoUgp9UsyTqc2YT+Vd
         drLB0k5ESLMkb6P2tF59DhhxplXpu3fswl6JvkzwfjWpqNk3Y2KLgUb+2769oLOeicH8
         woszhWiwPxF10llCQj4L1oQaFo2ga035+zk/7EqO/CuRkiRpCUxzk/hIXK7r38FoNqJz
         Yog1DZhAPGh8GHyomhvwcy/iIQcjXMzABlqzcJbSqV0ZiKUhM5YWps34UjWgAqV9P7Zw
         terQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981832; x=1789586632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYzMItfvZx4mEK7bjd4sez4FOL2n4oCIU1L5QhytUE8=;
        b=Y3twO8MS1XkP2gdIhGQ91in/OamKKxPXYHd4qIyVKD3i0eIRyheThwoV0krii3MY5I
         5kE2HqOMKEwKCSKGZfrecbsWhnLnTEs/8rMGI5yrfDNl3GMI8kFdUTl8i+LOcTH4EwPV
         /TLDbNoVrQ2KwT3qlDHlfvBj//3f6VUiJyxxKdQqxT++Be+Y0seQORDqoD5rmz9/bQ6a
         vnYoV6Lp6RpMK2I2TM1moE+J8pv/+lcKK5ZBPq5csVKPl4e1OGjn08jE4Zlqf9CQ5PTp
         uteuQzj1ERoPTZff0M2KX2YNkUcjT9LXKV0K3fY6ilNwh51zkVy+EC95gjrgI9j4T1/g
         qZqA==
X-Forwarded-Encrypted: i=1; AKwUvBx/JV0G62HQdCRrEmLCR+sB4zlTBcg0LEzpc3yXRN1r6vADfD5UNJ0WYnuCxFFmhHTzfid8nNxv297LQjk=@vger.kernel.org
X-Gm-Message-State: AFuF++nVHQeWiVzrkjp9h4AXgR72Ys1puA4qQBItnYfcHEA00X/Xe9v/
	EIjuOpj9V1A+LKdAtB5pDoc+Qz/Osvr6eDMT5UipHMJlGyaHGvpOhi4NW5ceOEOz8yT32GffH8t
	IDOY2ERpvKYiEhrXU3n/enVMYB7BC3z4=
X-Gm-Gg: AYBFou2BkM0f1G4ecEyf4ZiCJVVs3d+JfUITtEWEeqOXpeGsI+Vi4MmaKI7Ud7bgSFe
	VOi/9e0/pxd+olfYBk1o+8ssZlY4B3txLF3kLR+lNgTRAn324GjFuo1golv2XijJ0HE4iTV/2qz
	DC5pLuzNT0ri8F2s5fssUy//0TyPCDOdO3LPK/KEz+7igY9dfNtOIyiHfUTMKZSGtiPdVhZRZK0
	p3CRMbvKi6vBRGc42teJuWgPK45bRBuA9lDFSZw4FvVBIc71arfdsgOfClGfsbOI9T45myPnjX9
	4Cq2Zfpwn4mllu7BBHAQbZJx7FCR6OCoCBV9uIc5ImzWhtc25nCRVQgvKk44rB1hsKIsZnkp7fs
	q0jtcj190x5VpXesbH+Un6V+xM0wDubmOADfXAmzJBmJz
X-Received: by 2002:a05:6512:b28:b0:5b7:651b:1cc2 with SMTP id
 2adb3069b0e04-5b8980b93a1mr670838e87.6.1788981832445; Wed, 09 Sep 2026
 12:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_ybFr8thjmy3ayzB0u+1f5vSFnR8km67J4bkOE7czSyYw@mail.gmail.com>
 <20260907063342.2300274-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260907063342.2300274-1-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 12:23:39 -0700
X-Gm-Features: AcwNN1U5VkqFiMoVvDZffZUiikt238FMeWd_dqJeezEdVeG8xHgapBFftAlD2rc
Message-ID: <CACOAw_zZPUNNEM_Cdi42ik45S6qA96+igptFZL4ZLrg6tJ-7ug@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 13/14] f2fs: allow large folio support to
 writeable files
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 11:33=E2=80=AFPM Nanzhe Zhao <nzzhao.sigma@gmail.com=
> wrote:
>
> On Fri, 28 Aug 2026 10:44:46 -0700, Daeho Jeong wrote:
> > In F2FS, newly created files almost always start with inline_data
> > (`FI_INLINE_DATA`).
> > Because f2fs_has_inline_data() is true during f2fs_new_inode() / f2fs_i=
get(),
> > mapping_set_large_folios is skipped.
> > When the file later expands and is converted to regular blocks in
> > f2fs_convert_inline_inode(),
> > `f2fs_mapping_set_large_folio()` is NEVER called.
> > As a result, almost NO newly created file will ever use Large Folios
> > during its lifetime.
> > Fix: Call `f2fs_mapping_set_large_folio(inode)` inside
> > `f2fs_convert_inline_inode()` once
> > inline data is converted. Also consider using the standard
> > `mapping_set_large_folios(mapping)`
> > helper instead of `mapping_set_folio_min_order(mapping, 0)`.
>
> I'm concerned that calling mapping_set_large_folios() here would
> violate the specification for enabling large folios on a file, because
> we would be enabling large folios on an active inode. Please take a
> look at the comment of mapping_set_large_folios() in
> include/linux/pagemap.h.

Hi Nanzhe,

Thanks for pointing that out. You are right that calling
mapping_set_large_folios()
on an active inode inside f2fs_convert_inline_inode() violates the pagemap.=
h
specification due to the non-atomic update on mapping->flags.

However, if you look right above that in include/linux/pagemap.h
(lines 408-414),
it also explicitly states:
"The filesystem should call this funliction in its inode constructor...
 Do not tune it based on, eg, i_size."

In F2FS, inline_data is essentially an i_size-based layout optimization (fi=
les
<=3D ~3.4KB), not a persistent file property. Virtually all newly created r=
egular
files start with FI_INLINE_DATA. Tying large folio support to inline_data a=
t
inode creation time violates the rule of not tuning large folio support bas=
ed on
file size, and permanently prevents almost all newly created files from eve=
r
using large folios even after they grow into large files.

Therefore, we should enable large folios unconditionally for regular files =
in
the inode constructor (f2fs_new_inode() and f2fs_iget()) by removing the
f2fs_has_inline_data() check from f2fs_mapping_set_large_folio().

Thanks,

>
> Thanks,
> Nanzhe
