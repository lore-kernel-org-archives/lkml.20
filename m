Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D6230C164
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219133; cv=none; b=d/Eg+m85wWM3cVAEgF+8zYoXAZ/47Gc78ctcnlM/tmVUS+6co2COwyVh0abqYCSa/jONhH3JDlWuf4ML77LFUlh7+TEy2YX3n0DdzWLpXTaCnByQqjhOO4LVUY+m4clfqX1lM/qU8GyFW4Dj+/vuvLrLjG3aHqSip/tOVRUuaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219133; c=relaxed/simple;
	bh=O3dUzn3dGkaVAPpDFFLsE7z9koWPVrcO2nnd3UtUTRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cg8Vek/Wy76xtVomsHt7cx+M7UDZoGlKRB+0daQKRpZOX7wHjP866uIGJ2sl01yIdhfjGx+JCg3KeaSW04LHcTvhi+r/QIupjL2k7xZVogmrpkJHcjMqX157uQOYTabpNtFKad7ZuQOgdmExPgA+PBKI0nXiJc+mzBjIIUMmxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM9ggej7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM9ggej7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298131F00ACA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788219131;
	bh=HqSnM2Sf1MnAraFVDX5f+6TBqIzKd36nKm4xtyvhybM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hM9ggej7PlPuTMCDzgOh3zYet3jaCTTtvglzC/zYWOZL6KGj0BcKod4DB2KHZmpuk
	 9Xr8E5fI7omKEWAg8npO64Q4oxaIsgjG+ROJho52pGDM0t6/3xak1DlwmCvfeLGEq2
	 QgA1Yt5/MRFPTMRaDIUjwW5YGSiC2DurJZI45p7kp3NGtY4Qjnfuwky7WXn7o9f4Z8
	 wC4Ds6R9vHRh9IGZpDif5s6pgETlC/Wre846fOo21aTGBy8Pvwtz0uK2tMm6Oadwv/
	 53QRlUMvhrjqA91WlLKbIal6dENP3blXPeG/7/rBm3eOLTTcQXLTrHKYGeIJ/eD/kO
	 gZhLRtPK2lJyg==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso1093444a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGQX8/eBaESVv+/8B+4ZVax+tCwWmVzYIUn5hN6NQnAI8aUOiLWj524ldH3YTQS3DxMhiOPvaLdeOgwtY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdbaOqK7TxCeNpXKnIo6jtbPKXHBEqqQbzKCMMSZ1MavOBJKgG
	PC4D3cttQvSZYitgb74jtQgE384mRpTws8S7IvXTw2srMHNfC0k6SatV9DJ34ye0HwDM7Q2L2+4
	XpTPRMjPCDi9pG4FpEAIRtQGYuIWHc8Y=
X-Received: by 2002:a05:6402:1e90:b0:6a6:32f5:90b3 with SMTP id
 4fb4d7f45d1cf-6a663b24942mr2593080a12.21.1788219129658; Mon, 31 Aug 2026
 16:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830041901.2668-1-willy@infradead.org> <20260830041901.2668-7-willy@infradead.org>
In-Reply-To: <20260830041901.2668-7-willy@infradead.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 1 Sep 2026 08:31:57 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_zarKuogwNS=ZNDuyR4w_iB7yui+h+CqGvjZvzxPFpzw@mail.gmail.com>
X-Gm-Features: AcwNN1UvF-7AQZoHjsPGrrmMkPeyVFXaEcU2n-gcV41YpQO_AYBnZepzQZ06-b8
Message-ID: <CAKYAXd_zarKuogwNS=ZNDuyR4w_iB7yui+h+CqGvjZvzxPFpzw@mail.gmail.com>
Subject: Re: [PATCH 6/9] ntfs: Remove redundant FGP_NOFS from ntfs_wof_collect_dest()
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Christian Brauner <christian@brauner.io>, Jan Kara <jack@suse.cz>, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Theodore Tso <tytso@mit.edu>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-nfs@vger.kernel.org, ntfs@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 1:19=E2=80=AFPM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> The flags already include FGP_NOWAIT which prohibits all reclaim, not
> just reclaiming from the filesystem.  Use mapping_gfp_mask() instead of
> GFP_NOFS as this will preserve flags like GFP_MOVABLE.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
