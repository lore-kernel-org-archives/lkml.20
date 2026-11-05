Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879896;
	b=pB7b3GauccQVwIIgCGCJFBpMQRAmd913lEGgchADOBtJDn89WKZaP+rqNJ30Ie+GQ8EF
	 YwHr1GFzQpgdYBFANhyatrVeEwVHZW4m1ivSJO/kD+w8rY6JkVCnh9CL1TWvLfqRaQW6b
	 SkBiqbQNJO0njJFWxleu5gJjhbRJ6KMoQpDAE0LBzdthovrrxd7A7hni+zlwOZIOS1YSo
	 etzgTymEpIzVZUlLrrLo2z2tW+X2I8msYkLetlCEqc2JL34VkxCaAe8HSok5BjzdWfNfb
	 NwNfWlSzcDBwWb1qa/TUHvlWz7h9/ub5RrNtnniptSajS8jKLkdmoVrfr7UmQpOAQBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879896;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zBByXkNjVCE+LBHCR7ezhTaXQstt0LGC/bJIB+BFpQI=;
	b=uOTTRWAY1BsKHkgrQg/54XaVcvPO6cJ+WkvACEF2gz2lkpTnaK3MTgcrHjDGwp9MlboY
	 yPN+bwTL1675MxKZ2s5CauNxYPyZzzzAm0M8Uxf8ITnn5+A8yF02ESTy5tutnQY5Cl2kA
	 w5qJDPoKPxgwu21xHTmyARBy9c+a+G88fx1qlsJfx/F+HA/cX1gVoj9ic5FB52uoH+xQP
	 9iPUVDP9rH4Mkz5X93Jwhevf6Fh5aHYnuOb76TjqVCmMfymUlD8GwTbr1XtewnJ7bCERw
	 O4HyNIqHPA3WKmJMMQUgdZlj1DxjKthGexEoIWRfwtM3gU8ucimgxPg5mNinS5YIERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1ljF0wo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF30606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1ljF0wo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDE81F00A16
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879896;
	bh=zBByXkNjVCE+LBHCR7ezhTaXQstt0LGC/bJIB+BFpQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W1ljF0wosvH1izZK3HIyyKMPS5Nl7Fo7AEZF9nLeRoL/nKfwePwoGhcP3cO13i5tt
	 K+PUL4PFr4udMC83cGKKjMr95u5F6AzyCFfgXmQwohvdyHJOb8o0v0L31qd4X8Q3YS
	 D84D/iJ2MOzYNBOxKr0Ue6tJCGWdPu2P/UCDDOMTZV/DgaNvOJZwMu+TMhs6DWycs7
	 ywqAr7SoMLXbegyQGmA4NVfAa7Qez7SAqekGZVKKuCwHNmKGhZyAsiDoMRt/E3FF4i
	 HxNTj+/zd2QYAjKzHwfDFqMcaLp/u4WO32FNoTqPqpziosA/9rok+DLCoyDXqwC64K
	 0WBpB7ohqvFvA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c423b145922so254771266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:58:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxWTnBpHFcojevuaOetm53VteXI6vpbEQtRUYvpSGxkjBsSWCzRdJXwDrnPuKH59JvMpPGJoR5lfwIylq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/13wn0EOVB1guKn8CsjbrE2rmCcYNPgV//ZNT/jXluYXGYFmOC
	DXQEDSXkEh69HmlIqPqqFqWPc5uN0Ed+35R2erZTZFV0a0Oz9I34gpCUru7FtBv/+NdgUU9gLPO
	R+AtTfhWZuhQVh9r4ApFhk/I3RB2l+YA=
X-Received: by 2002:a17:907:c5ce:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c4ca7ae82f3mr1627888466b.43.1793879894694; Thu, 05 Nov 2026
 03:58:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104183702.192452-1-icb@fastmail.org> <20261104183702.192452-2-icb@fastmail.org>
In-Reply-To: <20261104183702.192452-2-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 5 Nov 2026 20:58:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-a+UH4q65J9K4e=EscH7tkHC+eEu_HC_oEeVzBdi0Kog@mail.gmail.com>
X-Gm-Features: AclHuK913ysvhcNOT2S1DOx1NkImFakA1bWuvLx5kL8RLaniHar89jBvPmRxZ78
Message-ID: <CAKYAXd-a+UH4q65J9K4e=EscH7tkHC+eEu_HC_oEeVzBdi0Kog@mail.gmail.com>
Subject: Re: [PATCH 1/2] ksmbd: skip metadata-only opens in sharing checks
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/smb/server/smb_common.c b/fs/smb/server/smb_common.c
> index f9fb3741ada3..920e94017bf6 100644
> --- a/fs/smb/server/smb_common.c
> +++ b/fs/smb/server/smb_common.c
> @@ -719,6 +719,15 @@ int ksmbd_smb_check_shared_mode(struct file *filp, struct ksmbd_file *curr_fp)
>                 if (prev_fp->attrib_only != curr_fp->attrib_only)
>                         continue;
>
> +               /*
> +                * Two opens conflict only if both hold a right in
> +                * FILE_SHARE_CHECKED_ACCESS_LE (MS-FSA 2.1.5.1.2.1 and
> +                * 2.1.5.1.2.2)
> +                */
> +               if (!(prev_fp->daccess & FILE_SHARE_CHECKED_ACCESS_LE) ||
> +                   !(curr_fp->daccess & FILE_SHARE_CHECKED_ACCESS_LE))
> +                       continue;
> +
Could we account for O_TRUNC in the access mask used for sharing
checks before adding this shortcut ?  CREATE requesting READ_CONTROL
can still specify FILE_OVERWRITE. smb2_create_open_flags() then sets
O_TRUNC, but fp->daccess remains READ_CONTROL, so this condition skips
the sharing checks even though the request can reach
smb2_create_truncate(). For example, with an existing FILE_READ_DATA
open and ShareAccess=0, second CREATE specifying READ_CONTROL,
FILE_OVERWRITE and ShareAccess=0 changes the sharing-check result from
-EPERM to success in the extracted-function harness. The open should
be checked using an effective access mask that includes
FILE_WRITE_DATA when O_TRUNC is requested. The client's requested
access can be kept separately for the returned handle. This would let
the shortcut exclude opens that only access metadata while still
checking opens that truncate file data.

Thanks.
