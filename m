Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCCD3F9F50
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789232272; cv=none; b=YZXX7Xvlrs9iwWUMnMlz4NW90Kh7M9F0gN93s9Tsm7EIcO9PDAWab2vV/xWqRUqeI9nbKNUwSPXX4QlVSpy2/A6qS6GV+YPP9dDtIU1K06uzqS7wMvNHNEoEyNaRVwkkDo4uwLR8Z+iaOk3iaGbDSTk10DeEp5c1FTnyT41HYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789232272; c=relaxed/simple;
	bh=LONZiyEPb/HzepShVjxR31znpWvVg/eEX6usx8DFrtg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=Z+LyrkPGM8kVvVxr5iQLFmAOuGTsq4yi8umcqpt42g2717QaYXo7n0EHUuSB/9DzxI7qFe/aPq/28mZAemWuDgZedsrEKypZuBkO0YSwXNcu9Ut5m0GlnCy3EmW2gYhKULL5zHSmWoiSvPMcn2BRQxnogs8G9KJmirDVDMiDibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=BiVToeZy; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=G2EOWb+q; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="BiVToeZy";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="G2EOWb+q"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789232259; bh=LONZiyEPb/HzepShVjxR31z
	npWvVg/eEX6usx8DFrtg=; b=BiVToeZyKZXZmhoEr0YIY2sKRe8fiZRVQG32QFTVNrrE5BPQ+z
	ezLwLx359x/34So+f4hHeM7nqytVg7DzdfCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789232259; bh=LONZiyEPb/HzepShVjxR31z
	npWvVg/eEX6usx8DFrtg=; b=G2EOWb+qRigKMR+3OxQcm0eLSlRBVIU1FhoDQ+mPWJ+yPz/Owb
	bY76ogyPhXkJBV5YqWHxMpFIucXcNIoAcgLaiBNS+vc7wyER8hHEP3UXqKTENI4CrYek+UTkiZO
	fLFuXVZ9Pz1TNvpG+62E+vJ0dbbTPGhgndPVboAry47lqx80zAWY0awXF1hmKDC+3X26VDvfTPf
	7CSOJXcrIeEJd8VxdUNUzXlgujvjAAr1D0YEN2s/ejavRJhlWqdnnoGlOOttvh0QVdaxfTVc+Qk
	6q5fnWloCh8X/BWK88zim6vKdIPcN2ZXSDC44MIK3SOPAPHLIlHoe7uGqd4I7MSHhnw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Deepanshu Kartikey" <kartikey406@gmail.com>
Cc: <dwmw2@infradead.org>, <kees@kernel.org>, 
	<viro@zeniv.linux.org.uk>, <linux-mtd@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, 
	<syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com>
Subject: AW: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
Message-ID: <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
In-Reply-To: <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
References: <20260823152648.23136-1-kartikey406@gmail.com>
	<CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
	<mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at>
	<CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
Date: Sat, 12 Sep 2026 16:57:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Am Sat, Sep 12, 2026, 10:00 schrieb Deepanshu Kartikey <kartikey406@gmail.co=
m>:
> On Sat, Sep 12, 2026 at 12:28=E2=80=AFPM Richard Weinberger <richard@nod.a=
t> wrote:
> I feel the patch you are pointing at fixes a different kind of issue ?

Well, different symptoms of a common root cause.

Thanks,
//richard
