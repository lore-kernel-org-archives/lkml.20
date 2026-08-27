Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E93DA7D1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821837; cv=pass; b=S7eFAwaFCDL+Ol4Cdd4aarzLWqWImdt8dCcrjBSjs8NCt4PG1F6wFjNjqoSbyGjRl0/KL/rD6qo8ZZGfZ9dK+22z7aS3qQtYdTMGqnqzOU2B96QNqlpPcaVbicUT3OGdAzQ8toqqSwLLB09yFvDMC0+zY6iaPNBlLAIvDiegNss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821837; c=relaxed/simple;
	bh=ffk7yhkMn5yWaeiktxqoQY7y03JdGLhOcXTrnlS50cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeuMtD66T9gznds3dqfIoejnA0EsCe9IkGlHy8MSS10Rzztke4rR+6PUOAFy20S1ni65sl16BFD50zgVaEhQ4S4I1UXs1eythHbPkaglFoc+Cos9pS9JA+QwDrfLkXmyAqBMM/ampOmbmTsMKhb9LrZ9qgsl1dZtZkgEE309N9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VGYA5+mG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eZMjUpwT; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGYA5+mG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZMjUpwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787821834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2mD1VpOn6zsGqEXcVvc0XCXSBCkdT2KooQ2hM2MFC0=;
	b=VGYA5+mGRdLdVBKR7TU7ohB+NpXM/npPY0E/eGnr9Z3GZERS+nywDkPGEjUuBec071yKSx
	9QBxeYcXiwkpqhZOgLMhdTKu6ucMJundE+uIDk2BSGMgs29ZFpE+MBVa+jje72mMjLB5je
	0Ka/vQKDoiuBrozg80uFtEMQ0+4cEfE=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-H9xG73q_PFqh1Amd2XRMlA-1; Thu, 27 Aug 2026 05:10:32 -0400
X-MC-Unique: H9xG73q_PFqh1Amd2XRMlA-1
X-Mimecast-MFC-AGG-ID: H9xG73q_PFqh1Amd2XRMlA_1787821831
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c70f73f8dso1273972d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821831; cv=none;
        d=google.com; s=arc-20260327;
        b=As8b1mX/M9q4pTn/6rS7yvqYerTlMgsn//SRB9/R479TPBl7SWR75O3nYSD41eVxr5
         d/DJ5kEABvUsXZiMp2+QETPOd59r15M4h5ijN5M/dBHEbGduP/pAOUBElgcNPK3L0LQ/
         1JwdEgOTeNDJp4c7VXYsZ7OhPqCma8jagNgKqmjF0qFFUs7T8YrK7ThuhLcvqAqaMYor
         1kcFz35aFRtx8J5vISocj9fu1e+ck9r4wp6uTQpHz0HTZvNmWP+VwZ7wkpjIe7a1UmrR
         l0Emy+CC5rgRe2Nckh56EZ9wTvRBFdVfJCOc1Jj9rW8zokONWRlWF6eAF2e+m0t9gll7
         x7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2mD1VpOn6zsGqEXcVvc0XCXSBCkdT2KooQ2hM2MFC0=;
        fh=nrFhkHu0CavEOFnkappOsgHa5FDhGPQSS56mdMOoqFo=;
        b=JU10uwwQW2EnLFMvg2On60xxZmgSjaPNJQbABx39LYM+4lblZxGZj8qFByHFDRvRsZ
         1w2UdslTlMiZR4mobdRs45Tacgvzky+UxInO+fLPaD+RafRNksKjBPDyxg/+006t9/d3
         gL5NrWfG50uZ2rMg2k5EepwgAxPoq44oAXyDxnu7M19G32kbawE87pYHRH3zbqPJmJxf
         1gusFcHy9dX9gBikyfK7Kh5LtXxHstQsgyxijFBMGpqvt7RSslbdzyDbetotlntM6O8e
         BABGxoW5v23LZszRGIQ4hFa7i5O7wBiWU4lJPDt1h5U9d7G6vmJGQKXgxFZrXTrz9WZk
         dNcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787821831; x=1788426631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2mD1VpOn6zsGqEXcVvc0XCXSBCkdT2KooQ2hM2MFC0=;
        b=eZMjUpwTyQT8QxlQyMwn6Bkq1l1ArbeNL1kBu7q/cN/3INtustUeSti1RQSczIPjvB
         u1UcTkaSoO/5te6i39tUVmu0rx+eUbQuoaxfUQ4FBMJ79FFKOLYeYdrpLL1dX08XiJYC
         999Fp0LEt4fYTI5fUvB/ON0BtCD0Ha+vKHwRebLpY30EfaSTrbmqbdTyB4OAfjY9vXZE
         y56W6kZIkxA0rKpmMHU8lSuhXi9wbxdvxkQfdePlGraTnz3kV4SgUIR1un0S+PUvEb6x
         f0O3vJ5GrA8jii8mnB0Eas76FW3EeWqSHgxAHTqbHhPJafFogwex+pmW37JQQrJZCgRo
         B32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821831; x=1788426631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mD1VpOn6zsGqEXcVvc0XCXSBCkdT2KooQ2hM2MFC0=;
        b=UoFN9M+pWewfEU2IyFgjxXw+aX903cgvpoEY8d33+s+vYFyzmmcKqni2e1Dr6XDULr
         vTvQprtJjEOVerDwNtZOqV0rM/B1y5puDVUfoREO80VTChrZkAev0PB/QhKpa2LaKjZD
         oH7DuR2+VEzhjFc5KWAJso6uptQtbQb0CZmgTrmAP1/Yg0cXsBpNnYDbPj63UcdIUKih
         6Gjz85V88tx4X+jRM4/2i0M51YIgDuoE0Oc+YMstq0H9ESKojMcX4Ux193Azca69WY9q
         2TSE0Oe5JhtxuQunyAQAqUsjltWs95b6Z1ljAnt6g5So8Rxn8VzGb0WZsoLW8/eG8tqc
         59HA==
X-Forwarded-Encrypted: i=1; AHgh+RoMvqSCrcFK0wsGHL+n1TInfw/17l3N4S4ZvFqtniyVJuHT12B0JzoXHzriUITkBBDNZvD6jvDCgUKWvPU=@vger.kernel.org
X-Gm-Message-State: AFuF++kOuXypSqhGJnlUj0UQKo4TZAaHpsMPPM0Lu9eYj9mWVDXyxeuP
	wKlcyGhTJU8F9pQAmmqKrBPYnpADh2kWSdktmlSt5XF4QKUHXUhZQ/oOAcjDdPCgEi4ZdZwc4l1
	xgCWcfOalCIBo57AJ5CaZb7cbixxD8TTEj12LoxJ3slCFhDNGF6yngg3pvjSpjTnYUNBKZXT/Z+
	nqPCoo1pVyS6ld55ySenzxCiqmaSFRk3iMNoTcVFUI
X-Gm-Gg: AR+sD11DABUqWcL+7ocmRP8ydHZiAnjt3dEBcpnCewfroPLx+YlpsHLL6yR+RHrppuJ
	wxEDBciwHEDQAykV4JIdCfS4+mGNnW8MtWaBCAGdm1iU11/9joIAn7NOp9UfFinmhqJyfySBzsU
	envd5Ozo3um7VPvshCWGjEcGJZZ9hA8PaiGJJF8/43paE1/b0V/lduDaj9aUFXdFvd/WeCJEpuf
	oj2dDt9hSUOWR4FkOh5KRJZR4DZHbfZgVjkui6O+QOL
X-Received: by 2002:a53:d00a:0:b0:66d:207b:a0c3 with SMTP id 956f58d0204a3-66d256f8603mr4641443d50.16.1787821831317;
        Thu, 27 Aug 2026 02:10:31 -0700 (PDT)
X-Received: by 2002:a53:d00a:0:b0:66d:207b:a0c3 with SMTP id
 956f58d0204a3-66d256f8603mr4641433d50.16.1787821830908; Thu, 27 Aug 2026
 02:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804023335.2682101-1-tao1.yu@intel.com>
In-Reply-To: <20260804023335.2682101-1-tao1.yu@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 27 Aug 2026 11:10:19 +0200
X-Gm-Features: AcwNN1XG81zp5CJlHewSW_-zrnsK3_wAdrPX97RAd3puwNxaVd5zvf-xZxXStos
Message-ID: <CAHc6FU7_gUr3wHY-78qcENsH28v2dd_HcpFttkzSqCfj+ORcYA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: mark the VFS superblock read-only before quota cleanup
To: Tao Yu <tao1.yu@intel.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:34=E2=80=AFAM Tao Yu <tao1.yu@intel.com> wrote:
> During unmount, gfs2_put_super() calls gfs2_make_fs_ro(), which shuts
> down quota/statfs activity and then frees the quota bitmap via
> gfs2_quota_cleanup().
>
> However, gfs2_make_fs_ro() did not mark the VFS superblock read-only
> before that cleanup. As a result, later inode eviction could still
> enter the deallocation path through gfs2_evict_inode() ->
> gfs2_dinode_dealloc() -> gfs2_quota_hold() -> slot_get(), even though
> sd_quota_bitmap had already been freed and cleared. That leads to a
> NULL pointer dereference in find_first_zero_bit().
>
> Set SB_RDONLY after the final quota/statfs sync and log shutdown, but
> before gfs2_quota_cleanup(). This keeps subsequent inode eviction from
> re-entering write-side quota/deallocation paths once quota state has
> been torn down.
>
> This fixes a crash reported by syzbot:
>
>   Oops: general protection fault in _find_first_zero_bit
>   KASAN: null-ptr-deref in slot_get()
>
> Reported-by: syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dcb79de2cc8b76fbf474f
> Signed-off-by: Tao Yu <tao1.yu@intel.com>
> ---
>  fs/gfs2/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 4d854556b5299..6b5457f965673 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -565,6 +565,14 @@ void gfs2_make_fs_ro(struct gfs2_sbd *sdp)
>                                    HZ * 5);
>                 gfs2_assert_warn(sdp, gfs2_log_is_empty(sdp));
>         }
> +
> +       /*
> +        * Once the final quota/statfs sync and log shutdown are complete=
, the VFS
> +        * must see the filesystem as read-only so later inode eviction c=
annot
> +        * re-enter deallocation paths that still expect live quota state=
.
> +        */
> +       sdp->sd_vfs->s_flags |=3D SB_RDONLY;
> +
>         gfs2_quota_cleanup(sdp);
>  }
>
> --
> 2.34.1
>

Thanks for the patch but no, that's not it. Instead, I've added this:

https://lore.kernel.org/gfs2/20260827090637.676820-1-agruenba@redhat.com

Andreas

