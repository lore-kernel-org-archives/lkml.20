Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B07440A1F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792278861; cv=none; b=TxeYt5J3JJAkT9WAr55/zZ9vXMFa8zqVn5Ro8IfSnKLFaXaG0I14+rY4pq8XWM009qhfEhCteseYrscIjszF0z0gBeR/6pysJ1zc9gBXiQIWKo2lX65lysK0jdhJf5aYNI4ftBrDQuAvIZ6C995Uj3pbhPJGS2zKB8Ok8s2l8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792278861; c=relaxed/simple;
	bh=xU2ykx7xbCXjEuwytBhq1M/0qhUDWKvGv0I5pH5raD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EI1JbKQnMeREbTu4hfEMIiUtVhXrSd1Lw65hzDtcavSBrKe70/sglCzPwBgTPEYFO5r0++i+B8UI/WA4dlwKcda0dY6tge6f3j65bRbP0q/gTdqj/HzEZ1wYB16iKGd0cPYlgcTqd5gw38ysaA1jtE+BkgBaIxJL6gMlY66fiAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=awBjCuok; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="awBjCuok"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q+lMZg7+0kACDrdadkjvJfyvZj3KfPiWWzgAN6F43PM=; t=1792278859; x=1793142859; 
	b=awBjCuokOwxe+rw+mVwngjTNoUau1IMoUIl1sR8tGXgcI3HtwOBxPZtjlBS49leGz1BCHUjhqSZ
	cODTIe0w2y5Y6eWrpJSHHpyuFSh3QkFSvtD8mH+G8cv8PvgrYkpxVE1CkOQ6Qwiil+5IonuZTvKSJ
	aBhgdh/VQXpciaVqIPOGNL3I5/ic8/jyso5U4BqezDVCIk/+rIl9HqSL9QzjQKKQXaify15OCr5Vg
	eI9WhQt5fAgeaAFXRTTQa7C00gZwq/cWtqggSavn+FxdtNjynqz+u+Y5wPNkQ0ebcF30bm5KwIccG
	iuJFfx1bB3tmaE1OkH2l5YFjxR75uiYQ715g==;
Received: from mail-dy1-f178.google.com ([74.125.82.178])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIDbX-003knD-0J
	for linux-kernel@vger.kernel.org;
	Sat, 17 Oct 2026 19:14:19 -0400
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35c76e9614aso1825569eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:14:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzD7bfSQlwF9s+awQ4gwHIlFRKIMqySad8CmhujnSsFAy0kEAebmr7q6JclvSDU8EDAzZwtfgI2ySkIuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCxo8VAv+pPeD6Fj/p+sOYMYZtPPlE2OmycNcf9oYSmnjq55bp
	MHNrI+5sTz09PwFcFkJuGf0T54hGV95I7m5IT7Uj3Dm73QtWZLxrHXWPzYbIHHyPno9Mo4/5Dvs
	/fstVLwpPGMkqWlp5dqxPC86DtRI2ILI=
X-Received: by 2002:a05:701b:205b:10b0:169:9f67:a91b with SMTP id
 a92af1059eb24-18511eb675dmr5404234c88.12.1792278858015; Sat, 17 Oct 2026
 16:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017154120.795844-1-nickolai@csail.mit.edu> <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
In-Reply-To: <20261017125244.b2d7134fa9697b2982cb8cec@linux-foundation.org>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 17 Oct 2026 19:14:05 -0400
X-Gmail-Original-Message-ID: <CADGQE7FrnVVtP1xUrTOLYrK_OLbfEO=hOV=ViN0b97RaHwcuuQ@mail.gmail.com>
X-Gm-Features: AclHuK96zPFZbSfOt-kyY6WULsd5EQwS6pFByJIjbN3gQGvkzyBQSd1dAADJhV8
Message-ID: <CADGQE7FrnVVtP1xUrTOLYrK_OLbfEO=hOV=ViN0b97RaHwcuuQ@mail.gmail.com>
Subject: Re: [PATCH v1] mm/vmalloc: read vm_map_ram block regions from the
 requested offset
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 3:52=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> Thanks.  The Sashiko review is annoyingly embargoed for 24hrs, but it
> found a possibly-preexisting off-by-one which should also be fixed in
> the context of this patch.

Indeed, the +1 was preexisting, but confirmed that it's also a
(separate) bug.  Sent v2 with both fixed.

Thanks,

Nickolai.
