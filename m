Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793234999;
	b=fP0P+TJQ1digSB94yftwh6F2+3+Kco0R3SzIaGjEIic6vPIA9ZGlnWUCAjmzRbECjEOv
	 WEeJ9CH2LzpbtihCCnHt60LLReKQWO5FQzJ0UdBBOSixj3PgrAx26xQ1cZBR7ICTU/Of+
	 D3XRSLACkxRSZPVCZzCrgAodFN8jM4pCRyaT3I22Z+5cZnpZtl8lnfdiop27JHVJqNrsz
	 P3AHT03aCFg2JEMXim6ueuArg3ttinWu6Qq0Gkt6/lD/8pX8aNs+QiOlyhhE38eIQTwLN
	 FEQt3j7Af4wfpoRwJiruIPDGh4JLuXyhgKqWvZjsSJXBIBw0jvozhLsM5UXSxeIMFZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234999;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zMb7KePVlG1NjbN5pBAGqS5NP3hS34WZE0E1IMzOgXU=;
	b=coS3phYaLQXExHd5WOCDDgS9GLSBvLN3lVOH5UhGLltOpGh7Jgtri5Cg/s4N69oREKge
	 Dh9RLbazfpeEgmxoQ6o0/xbkLGA1U403fvCnX6EtdVo3C+3jfu1ZoPRhQY6sH/NPmV4/e
	 TBBuMhQ59+p65q9wX0pW6l1l4xfp7oxm+KRhe7KuCTGJoCa1dZjxblW2CSaNeiGM6Xmwp
	 VG5iaPZh4Atico0Mu3suoiheMo1f3OEHiez3F6UeewhItW/Dq7sC7a4K+54Km2qtZXFQ1
	 GJiM+9nBNQKyUxq+GyU7T/nNhlqw2Ic3O+9axZ9WiaJ+ZrfcZoheWxxL7RHAeqIdKCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ipbTufuG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B53B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ipbTufuG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25D11F01825
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793234998;
	bh=zMb7KePVlG1NjbN5pBAGqS5NP3hS34WZE0E1IMzOgXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ipbTufuG+j9FU8i4M5D1b6ojxf41xOTajFZKD62wKaKIhtUZeGeN9h1itTFD3GSDd
	 DRbwrBgM9fdpAA39bWh4qOJ7sQXQScf2OOjHczelfM0fMo4Lfhxd4tzttfHEIxfe6B
	 poYJ+KWwJdOXGiqJij14ei4gOFiidpNxBccKxFLAfDd/A+SRz7yy8XBBs06MSHVL65
	 gop32jjTE75mZIOkaICfBF4xUQ0PyEDya9/2f7JSR3IaSQpxYJcrmku4MKSi3Eo6vl
	 C+LtJYpR9Qplhq9GCCHTl1ey1Z+UJp9NTUHMywLEZw2z2oL0Gvt7NP9feaFfi49p1/
	 JwvD5KRRIov2Q==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c49c32650adso179902566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:49:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwuG6YT5H/vKPS8wi2CAW8oyggY89OyKgd/8o5nzEZlXrz2FcGku2XneCwgaE1ALujHCpoGO9YuxlmRPeU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIuieKO7ZAEspGWyqPdGNKdLSUzL3pT42p8gNf6/WBAoK2Xki+
	JDsRVsyFwmGaRZcxK1GRMRooaIvT6DKsW9p0zBb7RrglJAmdW3Art5CbJ7yTnQ+wbB81F/M6DQq
	46PmiD8pq5QFW/tsdd2GTmPVYoqPn5BQ=
X-Received: by 2002:a17:907:3cc9:b0:c46:9876:e9b1 with SMTP id
 a640c23a62f3a-c49be039e8dmr335804166b.43.1793234997622; Wed, 28 Oct 2026
 17:49:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026222600.17323-1-pali@kernel.org>
In-Reply-To: <20261026222600.17323-1-pali@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 09:49:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd84MA0R+3Xd-SPq4jWqcQR7+Wu5voHAJWKOmVzdhwkRYw@mail.gmail.com>
X-Gm-Features: AclHuK9fso8DR_4lTSfxfO6FLki4UweW19Ce4XOKWt1DRcLoIEIgc48dhENJEs0
Message-ID: <CAKYAXd84MA0R+3Xd-SPq4jWqcQR7+Wu5voHAJWKOmVzdhwkRYw@mail.gmail.com>
Subject: Re: [PATCH v7.3 0/9] Various changes
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:26=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> Rebased changes on top of the v7.3.
> No functional change, just fixed 3 oneliners from Sashiko.
> Link to previous: https://lore.kernel.org/linux-cifs/20260825230622.24617=
-1-pali@kernel.org/
>
> Pali Roh=C3=A1r (9):
>   cifs: Remove code for querying FILE_INFO_STANDARD via
>     CIFSSMBQPathInfo()
>   cifs: Remove cifs_backup_query_path_info() and replace it by
>     cifs_query_path_info()
>   cifs: Fix validation of EAs for WSL reparse points
>   cifs: Validate presence of EA $LXMOD for WSL reparse points
>   cifs: Check if server supports EAs before trying to set it for WSL
>   cifs: Extend ->set_EA() callback to allow operate on reparse point
>   cifs: Create native Window socket file compatible also with WSL
>     subsystem
For patches 1=E2=80=937:

Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>

Paulo, Let me know your thoughts.

Thanks.

>   cifs: Add support for parsing WSL symlinks in version 1 format
>   cifs: Add support for creating WSL symlinks in version 1 format
>
>  fs/smb/client/cifsglob.h   |  10 +-
>  fs/smb/client/cifsproto.h  |   1 +
>  fs/smb/client/cifssmb.c    |  43 ++++---
>  fs/smb/client/fs_context.c |  11 +-
>  fs/smb/client/fs_context.h |   3 +-
>  fs/smb/client/inode.c      |  98 +-------------
>  fs/smb/client/link.c       |   3 +-
>  fs/smb/client/reparse.c    | 257 ++++++++++++++++++++++++++++++++-----
>  fs/smb/client/smb1ops.c    |  11 +-
>  fs/smb/client/smb1proto.h  |   4 +-
>  fs/smb/client/smb2ops.c    |   6 +-
>  fs/smb/client/xattr.c      |   3 +-
>  fs/smb/common/fscc.h       |   5 +-
>  13 files changed, 287 insertions(+), 168 deletions(-)
>
> --
> 2.20.1
>
