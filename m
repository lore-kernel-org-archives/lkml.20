Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831432;
	b=eFJdeZ8O/d44ZrgU1MkBhO+GQZzNvvzfnxLqJBnR6B4thzURa0WiTARhTM/N0PKqH/99
	 OrLKPaMqh1xCEwj2QpwpEX/UTb1Oi2zcmZ8DYjdNhLvu4WX1lo8sS3DSbcj7v/V/MwFm0
	 OV715FE/vIicG+Xiv7hXzxdyoYeVnTccM1kXEzKki8JXU961PGOqApgwGmtYgWTXdI6KR
	 qKogIN6bjFlJMi1Qu2DgX88oznPMGPOX/Zu954tUKUo/gHk4uI2GSjm2ysk2HzKBRCxoX
	 gfR8WB00svP89d9uU4zVpjWru91LiGkuWGKXj+sLgNq3Ilrpp5ZZQQsI0PnfsXyINEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
	b=E0Q5d2T4xaDVCzTlSSBxy4Ja9FxcEoLsu4Nc/HTWxn2DFRuGWihGX8pzamAI8t9C9dLo
	 LGtYMnDWg9hRbnylvODM5B3okNENWOcb1YazVpl+gL0rH1seCCrPjdtAvqq1GrIkuc0Bk
	 jsQR6Mi/SK5grEcpyuHzoRAbX26a9p/RO0s4Q/l2ujSKy1tFxPPtq/pauE3diL4yByxpH
	 NXMWE+/dD5/GFrIN0wbALIwUUhel1nI1zKpYckJzHvXQT9dHeh+fOmYtonGs1OpoNOIK7
	 alorYGMoyrTPSmtveXmUuJKhN/bUwlojp3Q4aM4dsm2vXrraLpTtUTmCbCDf9Ne8MWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VmCDTdmf;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B0A606B385
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B0A606B385
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VmCDTdmf
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso665859a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831432; x=1794436232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=VmCDTdmfDiEtr9yM2FdmWCc4yMP/1y8DakkQBlW45XJJe9w+jmKxKqWx4N4uoWJW4N
         PFBX2dF3I+8GWGgm6IMacs6RY5sGxuYFaH0QAgqo0mK53bpzKMXunQ9id5HxqTpbOs5b
         VU5noO1GKyjU9lMcQwcxSupOZiF7GwtdckoYSJyXREY8s+YeNEHkgptPyTvPQi26P5dD
         CXBXYBmWj/xyW3H2FrfElD4s7U2eZUu3T46zVK3b4XsLLAUNzFBCOd8MArf15SVBCcB8
         AmTF1a+80XpZ1vAccIK0mKyOSg8ZONEP2q0MWLQ2bTUtAU18LViRqzWzDXzepgYN06Hj
         4aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831432; x=1794436232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=H3yzaChrzFpTb2ycZiZWA7iFXR7uAdNzxmc1ny+9AdivdJTWrmOR+fmDkL9avBkSVq
         3U/r/RUzc0NXV8YvOOP/YxyqrThr9IKRtK9paqTRT6y+eeur6PgcWRyjaDwHI3OmFUGr
         UrknBqszNBNrbgAzaedK8gvJPhdK+rYMyZhW5Hcc+uLayW0+6JAv2qeDkihE/HLNxkd5
         idWZwyfL/rB8MZicrn5szvS8nwzqRFOWpM+xuOFATIg8GH+l5BvZ0O1QUR17t9bOmDBy
         Ku4PxD/JSfrRGdJU+1TiSyWCRegJd4+rM+yQzkDT3aDwWgLFEc+Rlj/a+jI27SJID5zr
         KgTg==
X-Forwarded-Encrypted: i=1; AKwUvBzd+k7AbBO4p0wVPkmK6SaHMSTa4OqSrB2pcPqwZmfxKp/NnduLrIzn7Y/qyk2625M6Palj8PKa0wn+PjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z82bfI7lLqahOam2bBVT4PzPSxEdOTP3iJ84McbHzb1SQsLM3cb
	a5scu1Vjfbtbx4QJQGPtrdH+KGAV58SqhW91koqSLIJHhUdjw3OaOKaZZtceCv0QZA==
X-Gm-Gg: AYBFou1SD5iIH8CyQFWNM7zejmvPRva2bhVYCoCcNVyp0wRBsnIXOAQ9xkW2gR9Mjry
	84DNZ1NFmWmtfwPtMl2ZD/saAE2kXU5IH9RECkyao27UxiUhxsmeBZ5aKlHW7ojeHrFOfxMOMUm
	LaGiyTqd8W7UxfQtaRp6N3DHur/jqKvNzPpnxiGsrEdPePuzbVCdi2yIBgL/iVGic7CTxUQ1PSZ
	r9dMlxQjE+ZrORP6m4f+oP/T/AEVg7zDqz6eRMq9ibEu/jeQESCz/ECcwL3D/J2Cr4ExDuNGUg6
	gwcsEhSdu+4ArKjVdWqsQsDBx77Bnbj3MtmZWFNAQcDx1H2OBNzhjnGOKPa+ISPj5ynoJP0XlVQ
	HTvLJcWsinmm8cZninjCvPdQ7bhHH60lXvUt9ry0/gcqdEeWn/qvVOdFSZeJHyUvbRhuRSyFqYq
	ZNWkr9bbZECE9YZ4iV8vAroYMjoQpNl8uDln7MQocTY98lqQm3LSnEzGSG9HuEFPZx09Wy4HW3C
	+7EAWhVwJQoUrEjEgx5HHl8i/77tGePRBY9XBM5nEqZ8oK329b3yzEKeOHCF9kL3S3dSknvrhAW
	4cYaynUbwAvGoxFxO5r8hMrd5J6flW7YPOVu/U8+G/I96DEpy18MEH46t4/97xHh
X-Received: by 2002:a17:90b:3d8e:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ae8979a140mr13152373a91.40.1793831430846;
        Wed, 04 Nov 2026 14:30:30 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31638fdsm743618a91.8.2026.11.04.14.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:30:29 -0800 (PST)
Date: Wed, 4 Nov 2026 22:30:26 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auuyAseOISaOWwbO@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-8-dmatlack@google.com>
 <2vxzecd0k1dg.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzecd0k1dg.fsf@kernel.org>

On 2026-11-04 05:27 PM, Pratyush Yadav wrote:

> > + * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
> > + * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
> > + * If the file can't be created, the retrieve fails with the same errors as
> > + * open(). A retrieve that fails before the preserved contents are restored can
> > + * be retried.
> 
> How is userspace supposed to tell if preserved contents were restored?

Through the error code, like Pasha said on patch 3. I'll reword this in
v4 in terms of errors instead of kernel internals: errors from checking
the argument and creating the file, e.g. -EINVAL, -EBADF and the errors
that open() returns, can be retried after fixing the argument. Errors
while restoring the contents, e.g. -ENOMEM, or -ENOSPC when the contents
don't fit on the mount, are permanent, and retrieving the token again
returns the same error.

Thanks for the review. I'll address the rest in v4.
