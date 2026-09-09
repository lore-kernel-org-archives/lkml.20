Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A73BB9ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988110; cv=pass; b=uxB+Wga7+BS7zEICKT5oOL/lylf7Ogr17+uIccrbXe1zS2fstjMzSJhuoVZgqcblL4kM9mwVB6lBHZ6gpmvKXpBqL/wmSAWh+1qS8kubGGvPiw9AsxNdIgyRtB/6Cn0F6bCWXsFaQ7rZaSKbLf4kvmtfYEiizawkcQMzu7y4EM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988110; c=relaxed/simple;
	bh=SbebQYBskYmk15YhXlP1oZDZH1VfyAjkhtGx/zAN08o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqWkX/qQSEyrcJTThFBuxJGr4/cxoc/lNZCTDPSdMdE3ZRXxvGUyBSoKddfN+Za8vHhZnzno1OLmPQvIeWM2+p4VN35Emax8QUFWl/IPJnFbmGohj8jP1TX2bhmx9iQNM9iRLzn1xmvZjNcng/Yl89cYAg+n12YNkdfd9+c6cs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HILpjDVU; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HILpjDVU"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so9169431fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788988107; cv=none;
        d=google.com; s=arc-20260327;
        b=ALkFT5xRdEWmcxLoBpqSmDbe3h5TvwUTxbUjgyJijzkElQ4FTG/0c2P9Q/OB2Py/Is
         XMM/NGavsVb5Tw1ou7BiOAbvEoa8TYC9WMPjA2tnU39ZkpZ+Q48Ly206QTBuHonYEhki
         Wbe8jGZKkdjkchwQH1Pm6MJNDzCc1HRWFpuL3QLoxGxgsQJpg4+3aFmQcQwwoqT4Zjy2
         j2/34VQGpifAq84V+FyshJgogmYjXawOKT4+h7adbxryrHDgrfHfXoqZ8L43H/itFrFa
         2W00fJHuPF0F61k8bgrpgq7mlVIOVKUHnUlIiGqwhVj0Sao+j52fMV80NUWYbiZ4a1Qx
         ilaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a3kjeMoPbPYK+FlEK48cN5+JcIoFn3BIfOcaWDPNgZ4=;
        fh=XgtoAyDOPbgz4lrAnZJpNXMF7aFSE3xrGpnPt1xt7MY=;
        b=NHEm/tX1XvSu1Ll0w80SYOXDM0TVBM6IrM4XXBMKgESsQHvZb+evk422gv/qm5E2wQ
         gtswfZfBgL/MN00Nddf/7mxMgvu7ZOssS9/FoHSrhtwsv8OCQmtS5LVXTvFvpxBfVUzL
         92bShgaLwjUcJR2masTTnVpcZwd1zAPTsNWC3Ns+WxDZnQ/4PGuJAKpKrIbilrlmwYc4
         CL+T1+ZVQZbqUOtf0LZ3OEPvZI/olkaVDq63IhSaL3vznRrD5rq+vgcd5VNuD1l2xImM
         lGHbgaxzTky+VdCcqhSeDygsjwZloEqPmttEf/A2UZAMzsBRZhB1j04A8uxJCXwj6ddo
         q+Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988107; x=1789592907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a3kjeMoPbPYK+FlEK48cN5+JcIoFn3BIfOcaWDPNgZ4=;
        b=HILpjDVUwNBwDgiK3nO5xDEsJb7vqHZMh0PIgDO7+VBxi4wW9suhh13Mp5RFAbpQDP
         M5I92DrcEi5aebrJqAUjBLj08TADcQHConPJvnyFoyDlnRpI6/9joYHDNPiIHoUn/oj4
         7LxY9fU2IQllzibViYfm+jCGDR/r0nUzP0C1vkpbmbHTsJTihUVZ6p7IJfi4ceInftlM
         YdSFz05fPB1a0wX4p4ArWzUzAmq5USY/RtC1P6f24DaCCc8QysNjT3sO8ec+FY7rG5iZ
         WhvH+PoRg6aTd8N3MyuYOr3R4e6FTOKhVg5CXhA1JiGYLUEc1Z/dRsDn3yGzHEcQecjS
         N16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988107; x=1789592907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3kjeMoPbPYK+FlEK48cN5+JcIoFn3BIfOcaWDPNgZ4=;
        b=otLwTLRIL4VkPsBTtDcB+kYzyRdQej9rrKJ4JTBk0ewTZfHRoEzmpjgb+x7iOl0qpQ
         2pzCrPsyNOBHESjxnsdd8qizUJizu4CfWC2f3ltI4j8w7rNB3Omcp0Nck7ihN5W0bycL
         M7ad1zTI6oxAieNJsqEPyU8YUqTFuPH2l6vpO+P8/eZ/7SBLnQYLFAE7d3W7LQsYfBe8
         pg3uv04M5t+8zZFz66vZw9C9Xke3HyBeOoURkq/4o9R82rC3rKVmwphkcwZyAPbAt9FK
         KL8ra0Tsd5VjH38FLLjMQmpF93ShF7/SKVQEqjABhNuJ0xQNgub9SGd3UKdBeEiIEFeg
         EDXw==
X-Forwarded-Encrypted: i=1; AKwUvBxGVo34A/DE1+fy8y3FON5gK72H7EeGB3xbAr2rdASsdphX2kK6KaasCpX3mpJm+SMZzfK4ZY73bsHzZA4=@vger.kernel.org
X-Gm-Message-State: AFuF++kdU4XaGuob6Opu4WuYgqY6FlPGa3LijXkkCfhUHBe1GZZu6rQN
	GBtozXpa0Cl962qYZ/mW9QLpYQzfn6HqR7NWrxNZ29KWEggSMLaffFK0H4EWAxpsQecK09k6OlI
	sv2U1PDYgnX346VbLVvGhteymjciKLzc=
X-Gm-Gg: AYBFou1nGXfEnea3gNDexjLNfAMymqmvEo8P4UQtieZs2nXN/rMD7Jq52aTD6mvt89L
	z0mhtCd4griDkXut4ldYMBKZZqQu3GUfMU5XX2GOhPFgQtGbxa8IPWDjuRyj3C/imEPFsIqx0jn
	VBc6oFllWJeA1dHm10KyQ0nzkOOT4r4CRgUdYEqm/v0p9mkeBoJfNIUTrDUtfpFwAC0L7U43ypD
	/VcAaSNKR8WLq5MUBVHl4+fxOZ2skibJvT9ytakw7tS+Xq9GigftGWhcbrfWaKujwqKsHiym84G
	3ly8t5wSMfR9gDCQC+bCGzF7BiBCMZtzLovKavvyTzmc9ipD3sWYFz9s29TGv53fkVZC+Y1qVtb
	hW2vTDHmE2sPPXMmQL2HY938nGleJjWTKgbFwFPhgGF2X
X-Received: by 2002:a05:651c:a342:b0:3a3:7681:6d5f with SMTP id
 38308e7fff4ca-3a3768174b4mr46131301fa.23.1788988106455; Wed, 09 Sep 2026
 14:08:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACOAw_yjqS5DDUxQdiqbQZLdXW-fQzHmVPHf32bdBhwth=kLOw@mail.gmail.com>
 <20260907101238.2475724-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20260907101238.2475724-1-zhaonanzhe@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 14:08:13 -0700
X-Gm-Features: AcwNN1X8zzbVYXyx30ryZjm7jh8qFvwK56OP67Zmg883Ne_Vke-tHsLdVR1kB_c
Message-ID: <CACOAw_xat4eD_WW+r=xtZCxN-HyVgyFQCEzx49UkJYxnY47_hQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 05/14] f2fs: support large folio writeback
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:12=E2=80=AFAM Nanzhe Zhao <nzzhao.sigma@gmail.com>=
 wrote:
>
> On Thu, 27 Aug 2026 15:39:19 -0700, Daeho Jeong wrote:
> > If f2fs_write_single_data_folio() fails on subpage 1, jumping
> > to `out` unconditionally clears the dirty bitmap for the ENTIRE folio
> > (0 to folio_size),
> > and decrements the inode dirty pages.
> >
> > The unwritten dirty subpages lose their dirty tracking and will be
> > discarded cleanly
> > under memory pressure, causing silent data loss.
> >
> > Fix: Only clear dirty bits for successfully submitted subranges (`0,
> > pos`), and redirty
> > the folio if unwritten dirty subpages remain when an error occurs.
>
> Thanks for the review. Agreed.
> My change hunk may like this:
>
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> @@ f2fs_write_single_data_folio():
> -static int f2fs_write_single_data_folio(struct folio *folio, int *submit=
ted,
> +static int f2fs_write_single_data_folio(struct folio *folio, int *submit=
ted,
>                                         struct writeback_control *wbc,
>                                         enum iostat_type io_type,
> -                                       u64 start, u64 end)
> +                                       u64 *pos, u64 len)
>  {
>         struct inode *inode =3D folio->mapping->host;
>         struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
>         bool atomic_commit =3D f2fs_is_atomic_file(inode) &&
>                                         folio_test_f2fs_atomic(folio);
>         struct inode *dn_inode =3D atomic_commit ?
>                                         F2FS_I(inode)->cow_inode : inode;
> -       u64 pos =3D folio_pos(folio);
> -       pgoff_t start_idx =3D (start - pos) >> PAGE_SHIFT;
> -       pgoff_t end_idx =3D (end - 1 - pos) >> PAGE_SHIFT;
> +       pgoff_t start_idx =3D (*pos - folio_pos(folio)) >> PAGE_SHIFT;
> +       pgoff_t end_idx =3D (*pos + len - 1 - folio_pos(folio)) >> PAGE_S=
HIFT;
>         int local_submitted =3D 0;
>         int err =3D 0;
> @@ IPU/OPU common write_done:
>                 err =3D f2fs_inplace_write_data(&fio);
>                 if (err) {
>                         if (fscrypt_inode_uses_fs_layer_crypto(inode))
>                                 fscrypt_finalize_bounce_page(
>                                                 &fio.encrypted_page);
>                         goto rollback_no_dnode;
>                 }
>
>                 local_submitted++;
>                 set_inode_flag(inode, FI_UPDATE_WRITE);
> -               continue;
> +               goto write_done;
>         }
>  ...
>                 f2fs_outplace_write_data(&dn, &fio);
>                 local_submitted++;
>                 set_inode_flag(inode, FI_APPEND_WRITE);
>                 trace_f2fs_do_write_data_page(folio, OPU);
>                 f2fs_put_dnode(&dn);
> -               continue;
> +               goto write_done;
> +
> +write_done:
> +               *pos =3D (u64)(data_idx + 1) << PAGE_SHIFT;
> +               continue;
> @@ f2fs_write_cache_folios loop + out:
>                 while ((r_len =3D ffs_find_dirty_range(folio, &pos, end_p=
os))) {
> -                       err =3D f2fs_write_single_data_folio(folio, &subm=
itted,
> -                                       wbc, io_type, pos, pos + r_len);
> +                       err =3D f2fs_write_single_data_folio(folio, &subm=
itted,
> +                                       wbc, io_type, &pos, r_len);
>                         folio_submitted +=3D submitted;
>                         if (err)
>                                 goto out;
>
>                         nwritten +=3D submitted;
> -                       pos +=3D r_len;
>                 }
>  ...
>  out:
> -               f2fs_ffs_clear_subrange_dirty(folio, 0, folio_size(folio)=
);
> -               inode_dec_dirty_pages(inode);
> +               if (f2fs_ffs_clear_subrange_dirty(folio, 0,
> +                                       (err ? pos : end_pos) - folio_pos=
))
> +                       folio_redirty_for_writepage(wbc, folio);
> +               else
> +                       inode_dec_dirty_pages(inode);
>
> Btw, I think the name f2fs_write_single_data_folio() is misleading now
> that it writes a dirty subrange of a large folio; would
> f2fs_write_folio_dirty_range() sound better?

Hi Nanzhe,

Thanks for the updated hunk. The logic looks good to me. The new name
of the function sounds better.

>
> Thanks,
> Nanzhe
