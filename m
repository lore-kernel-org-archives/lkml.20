Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E1341A795
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219780; cv=pass; b=HVsa+mxkyEsJxrzG1x0i49e6d+Q5fpmEhnbiUWoRyqnRUjUxCk5+RRcICoWFv4qrnvUip1qMo29knV4s5ba07YKDGFbdJw2/9NZ6MOxzuKMKkuZ6V0UeGJVf4Yd8/YZvqUAj8DZhBJUbgeWHkbVXPL1sQIQ/FDT3IWdUFsBaE/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219780; c=relaxed/simple;
	bh=w65zAE5RQsKUX0xWxN0GNr/Fkyw6HDNWpiItWtCqaS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYuG+dnwlFmDU/c5oNSnQaXUhwP45foTq0mES5HuKRENrMxs8V3guOWw3V/TBXF+25g3jfzfvim1ax8oTKEKlTwGs6WcpziGQx0nFuJ86Q93HFgyyI002CzUcjhUVqUtJiBZv+ym5EKcGGnQQnqLDFjTPa3cBRgHhvldKqjvs+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q49XP/FV; arc=pass smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q49XP/FV"
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-7909e300e9dso1828058137.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789219778; cv=none;
        d=google.com; s=arc-20260327;
        b=BGe/TVmoIM5D7SqVJ1HOczbNfx7ZpAbEevupsLFg3lkg8xvUCu5YZtQ8WHCaNtkLLc
         Ga8Wlen9xKgJmygg8dRXTRFuODO85Nb7VTI83Msdir54iK5TJ7KpzZjbSv1JFTbmQBaR
         6DQXKymRDhwvutm65fv5S3F2p83q/FakHzVE/P53L8QThBL4g0hdroKCWDOxlaoJnbh9
         FoL/MtVdJ9PcfMBEITz43FkEWScUjyLBSZ/N6U8xuxqQiKTtOQh5xl4XHuUc/VArL9tq
         nYYkJgq5bJSLMIU1nJIvOcrbmC0JOc/KMO+ZLvh6SR7P/vIccsnCnfJnCvnYClSWpz2S
         6Hrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        fh=uMCAOjSEhpvljalU6/TCLHc5/PKdNj7KuFkYUq6wKxI=;
        b=phrMoT8NXmhQwbTVeJH1UGPLrgyDa/cJVY6BXjzibPKdZ/J1LzOGHmFCGEOdc6tB/5
         RfRF0NN/o6XynykmtFPaoTCQ5uPPuH+Q33yj9LpJp4aF7ylhMhoo1aVdXRlEgfTy1Y9k
         c+g5ui3msvWxJdYzy51YCaxeN1jiUdlQE4DuB1wJzqztKEyucaRtrz8mjzC+gikZqa5K
         A5XMimaGAp8aiqzolNkTRSdl2Zr/ro/Yej8QfnoSdZzaqNjpqkXftdFgNKl0nojh6slR
         U8sLqkZ/lpbA/ulnSiPB8UXOZFdtehVpPC7I5989FeWcNpXDnhjsRom1PKrWfb5bA0cv
         S72A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219778; x=1789824578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        b=q49XP/FVF+TrhmWvlVGouFMAHQgPBggDvmAd1QTfNVGlnzaYVrcKG9rmf0m0S+MUe8
         brDY+m2mtDM1OXrrUcDAFmgeRULl2ZJ7cfzlTINzM3v6rjdci6SUhE/YGQkp4bTIlUck
         s7kaOzuZkumhXR6xnuMD2zsaiWmJ/RHEmvy7n+IYSPM3BGwTc9S7Oo4wb5yaHdo6pnJd
         YX08HstWpijLP29/3hw7GDNn3gR9o/LTYx/wayTMSc/9M3F+igBJJY5Wmrsz00WU9ZQw
         zUymXyW8bRMuv1Oyz92JoJHJW7lkNX9jHorLFbsMShPYRH9WsSCK+cSsHHZIZRql7Asf
         takw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219778; x=1789824578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dLw2loIG/Pp0pl9OY2tY1bLAD5HMO+AaOJKL7LkY40=;
        b=hYB6MzujRabohEWkbY4j8h9eOvyYEWhUA29HczLtZYnXOrRQd4ONf/THhPtNIuHT+N
         TVxByNpkPGvUeheK5k15hvAEZlC1aDRryRnSHrRtQwd4dek9YxZL+c5mjzLCsx4ERvH3
         OaNsRqkIezA0Pjyb3mvWyrmiIZq3Wj2k8Pwq3rAejEf20hcN+V8vd8389Oq2PqPsz3U3
         V8WRsFJ74W3u9x+mvmG6KLLOuiv4fENOYQuRxBlSb+nWuVDvNWgaPDSOZebkvSD2gp3J
         c+mBqFdumHDz+hINYGHTvyoUlt+AZNe7gSTyl4V9lP17yFVQWbwzgaq32fEMwqdDUkZx
         68/g==
X-Forwarded-Encrypted: i=1; AKwUvBzZzcVEyIdiIE9QUJTyZ+rHD+ow71LHN/s8Xvag+4RMrmE7Aasnqf450qghFFV0HdUVARIZHAMuuRhkFKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqi4dH9TZmSLxVcn6xXX4hGfGm8DgK9LkfTAaAbh/QJg4j9qr4
	MTe/a6y9Wk+Dq5dsomybsj06D5SD4dIxmMmuvAcNQcD++oYbT16AUU2lWwAtL0+rktx7Y5qolSR
	pzMzE1MM7e3DvMGEnjDanH8H82gXAZ3w=
X-Gm-Gg: AYBFou3OJMvSvuLBUm/Nrwjza4ZqNjFPW8CqGYst/AElTAcprcuK5jQHG/vbj1A3taK
	SSxoKGDY3lPmshyZpW6bnpjUf4zZT+NbMctF9JigfYubPqIFoQZpyL6zBnChN8fBjM2+U3F6IRZ
	0LhXDO4P8H+8RsaPc6OBSsn4hMRPdqqYBmuIu527d/8G2zJJSIfEmzoGt+V0/fkyEh466hk7+0b
	EPbvxY4/H+kjoQsRUQEsOD3wRDg36e7ijqPZDuyARyx7mBDEqjexn14INcRVrQIGH3e3A+668Sp
	NZs/m8umqnXXQdyAQbVJH1zFtZLyqD6qUCPeTtLkl75yXbpb1KjqnI78SoC6n9o4L4WxXkHjxZ1
	6onvJBQ53l2uQif2oqoYtY7SHC79D7N8epWZx9R3wSwDwuw==
X-Received: by 2002:a05:6102:3313:b0:790:235e:4209 with SMTP id
 ada2fe7eead31-792edf64392mr4768111137.12.1789219778089; Sat, 12 Sep 2026
 06:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911124517.63714-1-jaeyeon.lee.dev@gmail.com> <CC87B3D6-D5BD-42D2-B84C-47745ACAD0AA@nvidia.com>
In-Reply-To: <CC87B3D6-D5BD-42D2-B84C-47745ACAD0AA@nvidia.com>
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Date: Sat, 12 Sep 2026 15:29:26 +0200
X-Gm-Features: AcwNN1Wq5ZTrxV3k1NjhhPK4dlwMKgsnXpdc_cmQ2xjSE7CLbOE09_kryz33d1Y
Message-ID: <CAD+X6aA=0f8mLN0j-h3tqHCRAq_pi4Xp80FUA6GcZVcZa142-g@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: skip khugepaged file tests if mkfs.xfs is unavailable
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 2:06=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
> This might be more robust, since it can detect mkfs.xfs and mount failure=
s.
>
>   if grep xfs /proc/filesystems &>/dev/null; then
>       XFS_IMG=3D$(mktemp /tmp/xfs_img_XXXXXX)
>       XFS_DIR=3D$(mktemp -d /tmp/xfs_dir_XXXXXX)
>       truncate -s 314572800 ${XFS_IMG}
>       if mkfs.xfs -q ${XFS_IMG} && mount -t xfs -o loop ${XFS_IMG} ${XFS_=
DIR}; then
>           SPLIT_HUGE_PAGE_TEST_XFS_PATH=3D${XFS_DIR}
>           MOUNTED_XFS=3D1
>       else
>           rmdir ${XFS_DIR}
>           rm -f ${XFS_IMG}
>       fi
>   fi

I'll send v2 with this, adding a Suggested-by: tag and fixing the
Assisted-by: tag format.

Thanks for the review.

Best regards,
Jaeyeon Lee
