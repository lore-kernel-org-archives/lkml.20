Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046502D2385
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519357; cv=pass; b=KBqQd0IrMIxjLSJeF8sEN0ROzXLW8fbQDeS9AiMfg8nZhHPi+fodirc73uR/4Qnso3LfEJyDLarWzOZUd5aZCC3qyb9XnoL1Oo1ZMQ7ooNEzFsh9fkZftuymZAudrD1Jfti3W97emtX3DDLgZAIcrgOZDb+wvgVZ6mGtOs/q/To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519357; c=relaxed/simple;
	bh=PbG364MPVENhjhJYeI43ydcf+vQglhNA+/tpam14g5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLhJfw+704PI0VeKpAjZn8xUNmu82ytXfYq2K4LlnXMCIdOmEjU9EHKVnErOTHt6BsoBR/3wPROp7x1atYYhT2ROSdOYmd3oVokomyjBdmeSeUUMnTzP96mMMF6oquqIb0Kh28AF+0BwJ6ueIOe3CR5akWIQz1yUzD3iQ5m0OdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFvhxqCw; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFvhxqCw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so1214682e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789519344; cv=none;
        d=google.com; s=arc-20260327;
        b=J5M8AV9+yKyNpzqtRoI6ZqfwiKPork64XVXhA+DvLeuFmo/biQQmJfWTNAjdAdMVCh
         cnSqsifJcaeT0wD1Tuzgl/w2cb1ECAuLhdWZSjpCuHaZJqrRZ6Gsiji+Aoywv/bEEB0w
         nTb0c7XkhdaUF6EE8psL36nhfsYszqP2ANvMU3IeevdLSIqD8/p7o19Elrx12GoMyafd
         3XkyhIPR24YCGZgmfAS7aJzGxhug39iTXioha0xQywV7NPmekgciAzIthQCBK2SCgmez
         /cwWHuWU6pGA3SH6lAXpVev5QeREy5eafhtT7l7pC33sbymlAjAuRaCd5UQUd60yiKJ1
         9q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        fh=m/41YvP/I2Q3ZwIduSdSG1L7df+fdI1BqwVLhYkKDjI=;
        b=nq0I+IJlDbYUDkTC9nfvTXE7SrCgG6X4S+D4rKU+aM2TJ+R2CR6HXji6cpPPUJ4Uhl
         ktV2I2MyVqHXWneFrsw4HbdR48JOdbREmXztqABnBL9FF3TucIdkdSlV03+7NGYOtbGT
         D+ZATrIs2ONhHRlW2jqFIEnf13ay8jjNXm1h+MkXfhQK7Unrpdhrlqgf3g0JUe5GFmnX
         YeSunrnBmrfWsXByncdof9FTomEhky/V86N4DWNKwxPESy3ZGq6muENen6E5dZzfQ1iI
         HMSeDxchgUxNaFhQR2oIDJq/PpClR6w6GYL4aUAi2eUBp5qlMXNVfIndCSJ3rc+d4Jx5
         yNvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519344; x=1790124144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        b=tFvhxqCwXTvfqj7EO0huLdD/wu/UuRjcBmMuWy5q669r4wk9Eco0XKrJob3lfgGzVM
         co55jgH3XcJ/6KgQjNKpWwbPoEv0YsBn6cpaA3TWK1WSSt26fG0/O+7oWZHpZ1yC4SHD
         /hW8h8riu1IsOIHk5yw7rQ3vS7tw+NXlNwbt5EKef5fVuZOlRZmADfehN4bweqsBOAz5
         PcCQky1J4xb0bN31ixpHz+19N8iK2kVuEr7gnwh+1XaBaMgS0fbZpvlBN57PhcjZN85M
         3/l30hS9zOaOjKdDMOEhI8+z5obWK+OIf9RyfHB9EgaIHCejw3sKJrZ5Lk6+FPj46/kM
         c5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519344; x=1790124144;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDbGCTIpau7yhm3u68hmiwG3pOJLS1rBW2yPgr/yNE=;
        b=NVd2FjYXKIjo7lj0TEveXXpJNDV/o7XXF7GYxDNp9PIrXd5uFL+e/126erFMRnFzzM
         VK5IlqtTjRTYWVXAx5W+J5tsUNkaynVahZVMSH6n2dRukpQ8GwwCMhFBYGTQ+qjGXxrl
         I6cPnvntE95dB26iQekjHCsbu/aHb2IfGozYBEY1HcuECz/uvFflf06odXyIiTGsrkmB
         3oF+hlx6ae0IAgNLj/dHem6wOo4rOv71okK7/knLtVno7AXns1XyR3k19gqvmdhXd4qN
         VrL+VpwHPKAtKiNCJo8fR8llzGFDV9ju8wxZedA7YrkU8psFZmdxVo7LouqZSwNSFw5s
         pmBw==
X-Forwarded-Encrypted: i=1; AKwUvByoxbbiuIBDiFXC5a+BwUOTvtjudRqM9ZJZcowids/5vvFqvEaIJmkRIwr3AdHAfy6nHceq4pJkHJypJxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mHQoGtHnP+EyMHSmzpJ94wGygLkQkxRnycdso3xTu5EBANYgj+
	XpDyYN64DnZa5GVrBbVXG1Z8lm4j+Txqcy0Kfq1SBHt6/Es0349483qvzaF9+lvfkdSRhhZxnA5
	VqokLNk1bDyWiqglJvjz3VXQs916KGT0=
X-Gm-Gg: AYBFou2V2SJz6+W80M6NZVeSyLY8nEiVNE/LnHJAJkhSErAvKVbsGhdXh4CS7hmvrAq
	imPD07WgiSNuKvTwcvhD3/nweK/8AXeuRJdotZzA78GWpxiPLbFnyd3CGjz4hdz0S1W4xtYQouE
	Lof0+b2fZysJX6XKe+VRwz90vVakVm+ZMd1ZuGXdS1/XD45Dca8YOJnLpKxvtk1w8WidxMstw1x
	XEybhmkW036kzRgpX+aCGZlsVgl6BsrSMH8xZeJSbIxRQIG7MH0nkvVKxPnBitnpfH+zxeuBSYQ
	gIODnSOyKkgu09HLtOM7mtaaopPPgMIWW9xdNZcFoRWGaOjq+Pga7go=
X-Received: by 2002:a05:6512:3a95:b0:5b5:e8d6:8870 with SMTP id
 2adb3069b0e04-5b8b2a4e2c0mr1448356e87.1.1789519343344; Tue, 15 Sep 2026
 17:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915083252.812126-1-zenghongling@kylinos.cn>
In-Reply-To: <20260915083252.812126-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 16 Sep 2026 09:42:10 +0900
X-Gm-Features: AcwNN1WK_IUeViOVCbm_pYd3k-reY-hb0BsKmeEqIXZ3EebRYR8Fe7soTkcW8yM
Message-ID: <CANFS6bZAR-=acwiqtM8iWGzCHaTTKquKMdqbDfS6ebFGxa6Uag@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch set looks good to me.

For whole series:

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

2026=EB=85=84 9=EC=9B=94 15=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:33, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Hi all,
>
> The fs/ntfs runtime metadata-corruption paths only record the in-memory
> NVolErrors() flag, and the dirty-bit persistence used to race with
> ntfs_sync_fs(): a volume could end up with a clean on-disk dirty flag
> despite modification or recorded corruption, so chkdsk would not run on
> the next mount.  This series fixes that.
>
>    1/6 makes the volume flag read-modify-write atomic under the
>       $Volume mrec_lock;
>    2/6 marks the volume dirty unconditionally on metadata changes,
>       dropping the racy caller-side checks in file.c and namei.c;
>    3/6 derives the on-disk dirty bit from the recorded error state at
>       the persistence points (sync_fs, remount-ro, put_super) and never
>       writes a hibernated volume;
>    4/6 persists the dirty state after the final put_super() commits so
>       late errors cannot unmount clean;
>    5/6 stops ntfs_sync_fs() from clearing VOLUME_IS_DIRTY: the clearing
>       moves to the quiescent transitions, a recorded error state is
>       still persisted at sync time, and sync now reports writeback and
>       flush errors instead of discarding them;
>    6/6 checks the dirty-state commit on remount and unmount.
>    7/7 ntfs: fail remount on sync errors and keep the dirty bit on
>       SB_FORCE
>
> Changes in this revision, from the review:
>
>   - 5/6: with the clearing gone from the sync path, a recorded error
>     state is persisted without ever clearing the bit, and
>     sync_blockdev() and blkdev_issue_flush() are both called with the
>     first error returned.
>
>   - The IOCB_NOWAIT behavior and the per-operation $Volume mrec_lock
>     acquisition are outside the scope of this series.  The series keeps
>     the unconditional ntfs_set_volume_flags() call to preserve the
>     ordering that marks the volume dirty before the metadata
>     modification; a RWF_NOWAIT write still blocks in the marking when
>     the volume looks clean, as it already did on the base.  The
>     non-blocking and contended-lock handling (mutex_trylock, GFP_NOWAIT)
>     will be addressed in a separate follow-up patch.
>
> Hongling Zeng (4):
>   ntfs: fix volume flag update races
>   ntfs: set the volume dirty bit unconditionally on metadata changes
>   ntfs: sync the volume dirty bit with the recorded error state
>   ntfs: persist the dirty state after the final put_super() commits
>
>  fs/ntfs/file.c   |  20 ++---
>  fs/ntfs/namei.c  |  24 ++----
>  fs/ntfs/ntfs.h   |   1 -
>  fs/ntfs/super.c  | 191 ++++++++++++++++++++++++++++++++++++-----------
>  fs/ntfs/volume.h |   4 +
>  5 files changed, 171 insertions(+), 69 deletions(-)
>
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
