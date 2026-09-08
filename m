Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B3329C40
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834005; cv=none; b=m46VsTp68bXhvpb2WYuEa4J9ZRAL6iRnmTka1jEkl9yEdYmaFI9kByEw6UU4XBpDZ3dCG2lgqQfadpK7I24ahbYbinqkhFXjtJsoxGMI5TxuWilDHh1DrfSqOWU0WF2PXOTXlzxk8ZmeZIXugx/FP8cIcCAHqb116PQgqLsgsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834005; c=relaxed/simple;
	bh=5pbDnxDIH0qmbdfsGAHNMpoph9eK9/0Z3/l8TeWzN48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIkBvWUNcoIxWcY4SEj4JLzESzV38zgW2k0t31l49NW9hrZVGyj5JKqv32qLzJYdoWRP4C/ANeQ0p90amfDtQONqbAzwz4UUtgKHdB4dtAvFt4r6cSrXnzD/U/aMKIbOQObSk4L/vsOiFU/MaQsbihRVnnA2MPgN4zZvKc4nG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b36bZQMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b36bZQMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696491F00A3A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788834004;
	bh=5pbDnxDIH0qmbdfsGAHNMpoph9eK9/0Z3/l8TeWzN48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b36bZQMdwqoSg//jcbxKou1emB9sxZgNa3/6gMD7EjdCcbrUEviVAfuORht1rDoIt
	 GoAeVHKdV+5CuQL1K2hzdimUbzCcFCAvdwdzDUGlGMlYaTcchnqccTcWfUi/Awr93U
	 0H+ijLxSeW4TEIboZiJAIOtoWoEvkCbhpu/4xhnZQa0iZo7Yn8GcJ+fk1K3NOX0fh8
	 71/LazsGiTiliE/Xxdu36EN8P0+QrNjyoajKtKTkse0fqiONJnlInKJnCb1I7HUAY0
	 fsRzEdjACEAsu7fqrEkTYmPy3Achkb3Qkg9ZRxxAgTnUN0tC630twK+NO2CJciLxfj
	 M0KKa5hlJsUHw==
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51bfad59921so50935711cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:20:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQAmmIvEj4RLvDrrdeKD5xGXiIeUTBSL0OzJxYLMvaiH89nXzyyv5XeWxv8YbpAh/RxjgmETRtFA8A+Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++lDqSFP9wxyNiIGxKntJoq3W40IFVLPT1VLvEVaLZGIIGcMNX3U
	KlA0OdIR2YHo78OOWXy20lq1f+Y0NecR+cOVLultDEYmne4PohNkgvC8uE5s3W/4qR8ir7PV7cR
	V45WNpOmZvLYThcdtzeak/cPMfo4awUI=
X-Received: by 2002:ac8:6f05:0:b0:530:4310:5399 with SMTP id
 d75a77b69052e-53054a43079mr311383871cf.49.1788834003745; Mon, 07 Sep 2026
 19:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <06e20ef4f603a4ffeafcdbf623ce2936281457bf.1788831480.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 8 Sep 2026 10:19:52 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yYu42Byaw4_e28DcyA968QQNJDraen6TjBwBMrZhGjfw@mail.gmail.com>
X-Gm-Features: AcwNN1UbPQKd6ZVAdz0uVWJMqoHwwYO5PYM5oZ_iCNVu-78enjJdQsACpWeO2Cg
Message-ID: <CAGsJ_4yYu42Byaw4_e28DcyA968QQNJDraen6TjBwBMrZhGjfw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Baoquan and me as MGLRU reviewers
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:42=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Baoquan and I have been contributing MGLRU patches and helping review MGL=
RU
> related patches for some time. We will continue to follow MGLRU changes, =
so
> we'd like to be CC'd on MGLRU related patches.

Yes, this is very welcome.

Acked-by: Barry Song <baohua@kernel.org>

>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
