Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D183C09EC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142775; cv=pass; b=RXWvCtW3DjmmGLm1djJ9x8J1kD33JEjBury80Wt0AmoRYNKelrJZ6YmbVKVeUKU1VdcD5j3vE74OlbfX0X5DDYPgYzH2sUo2sKbNTm1Gy7uVo1ub7cFlMH61EaIkUgCUs/r2R5++ACfco/JaBvWlUddWlcSpvnlvOM6wuH6N61Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142775; c=relaxed/simple;
	bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUd3NySetYgJsb5Eu8ENTusQdYUS7FA4z1/vZpwnTorV/75lskkRc3wyoA0/gLxynuGnDEZbKvyI0f60eilbtWd7yzQ+E8u4p1M3BtBkgyOg56kYUd37FtYsTD9X7y0Wnq5SiumShwpc4nxYvdoCb0QuRPl9x+mGHmRJIJH2ESo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=mNMbzA1+; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="mNMbzA1+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so5436227eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142773; cv=none;
        d=google.com; s=arc-20260327;
        b=Hv8jr4jSkB0UjRvw2GpBKdAiz6rf9xYJYXe/OZ3C2ECqYmLrLpK+9MRMgub64IKjsU
         cZQWl/p+58YhJd2ZFh3HSJE8hsmyWKmRbHDPrZLfbgq+YjmCG5g0aJyQnZBliLp+V7sz
         AV62cEfvvcvopGrF+PhcMZ86ErWbCxgeZMXJII/RU4IIGbHwOPruj0Lxemalj2wfhjSk
         pcH8+qqKXOn33kCA9wVOpAP3LEbinwciIz+1YxGQXJk0BnDQvlhJN3mi4ISsAzyoLECq
         mUB8Lj9GU6nwO3DXK2WAvsUnfjmHmWFuHbVS7YTw4QeUmQXyGlZfA3YBcCv4gqowJBj0
         2IlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        fh=vcvhlH6w56az34tpL+gAgPAvY7c+hWFzEzVJq8TTxRI=;
        b=N469k7OeSZhxT3yc4a53COGDfArKRh3bP3NFDcRkAoEowBMfSE8calss5reCIUa9DO
         nvNHfKgC7KkkJdKvsQUBAuCo2UUZV0uyBSt7AckgXfztZCby29bHSqr7fb03kgLRJ/gP
         VYVnPoMjCfiNO0bVfbo6fuTE4hukeCr4UJmYcvGSVwMG04npXMIOkgi8iZ+9CZMaZLCA
         N+VF9BNIEL3eUxp/TClaB6C95oQFjgTOdNMFCIvh9xOnHkkhO5NstltTsAjVNtyxhzBn
         lyzjxAGl9r+Su5cTBbh0YLDSgWdWpTCtrCh0RwAyX2BuAQIrvDBdMQaHK5qJ3XE97yLS
         joYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792142773; x=1792747573; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        b=mNMbzA1+Zqvbf0u9roN/Yql+EP71awnfD0ZjHdj/ylYHcVuwu9zvVv/ELGkVutRBof
         MkgCJnDF5AAJVxFClHgd1r1ANoz8ihZ5w8N6FuhZZwqTvELpBqxBKX4epa1uVEs3u7HF
         8nmR109FHCw9cPQAEO3Qp+S6kfu6fnAHGx+V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142773; x=1792747573;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGoCw8arpCvJPsqHUcXcqUYXTcaAYS9oUg/iWN4NGJE=;
        b=AruKp1wvKyR7roAZvW5zksYa3auQWZnP2T8E9QMCtaqUjquVVNb5CztizZI6NkvG+/
         OzmPDu6xdOOX1QAKgulcvHB8fGKzPc8ajzqjatcTdWyOGLTUygRdPnjWPR8dufkiXJW2
         yF0t2bDvdCGQ8LBYjz3rZ+TDFdNqJoIRXweJ8ML2uFZQnbhxbv4vh/P8TvHvDk53ChM1
         NVBx1Wf7N43y2SX+YoQrO0BqQZKl030kZ95XTnpleMJKiJpi5VwxHoIQknlfqpjfNhpO
         hPB0cixk3NE1H6oZUeNzXfRxT8l3zIQcI2ZEsL66PEnTrHv/A41STA7a8brZyIFNiNdv
         qi8w==
X-Forwarded-Encrypted: i=1; AKwUvBxWsuvheKEFWpNctYdUzcfDe/UPV8Q8l4tK6rJT9p1ztTsnz1n+wxpllfi7tqlpsG3nsVeUH6ste4hNb+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHBNv0IED1Uh5ZH5tz6EiQdt/sole4OVUshPCFhfijdomzll6p
	qW9E4pxdyHaev28Zf2gQpraQC8jaHQDp7gE9FkuT/6LFvz3k9DL4LsC2WyUiVZ/DRc0XrDLk/Hj
	VAYU4oYVlUDn/ddQaHiPy0A5QdzG+UL1a7pnUQ2/kQg==
X-Gm-Gg: AYBFou1EQrM3vtYlyae8CeTpVE7Ibvfm3RD8YHZTikszdAKFNz+Hjw9TCXckbkfGnSd
	vaPOAHQTmhRmvoXYYphAlrugPu2YDxBGhIvzFbf1DefMbaDuICy296QilFBQG8clOKlyH//J9uM
	dgyS1SQdw6jIunCu7og1WTUdq6tnW0DC3hSoZc6ZFuMnVr4nNWVTPUuURT39ffHjxaBTv73hj3i
	EDdkWIjG/fuuUjMQcGyTvyeD+R/9W/oqrtFmvPJ789fufFWd4bVP3C4n16HtKakiLeizKQDmqv6
	9U4kbZUBvDa32KFusER9emZpUwVUpRLx5pPknMCw1FJjTe5MzTpoYayW1GXob0n2sPGPIZ/2cVx
	Zdm4tdYg=
X-Received: by 2002:a05:7300:b2a0:b0:35d:a0cd:d51f with SMTP id
 5a478bee46e88-35da0cde46bmr10124814eec.23.1792142773386; Fri, 16 Oct 2026
 02:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919221733.3707924-1-benquike@gmail.com>
In-Reply-To: <20260919221733.3707924-1-benquike@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:26:01 +0200
X-Gm-Features: AclHuK9BVEm1WCw4p4aCLcE6cjhyBLWI44El__CmqYM8k7kFJfihMOcJPeFeM9E
Message-ID: <CAJfpegt-XzXMkvVQZAYGc4KvL5pTFNBya5mzmLPfTGxBYBn+jA@mail.gmail.com>
Subject: Re: [PATCH] fuse: validate folio state before pipe_buf_try_steal() in fuse_try_move_folio()
To: Hui Peng <benquike@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 00:17, Hui Peng <benquike@gmail.com> wrote:
>
> In fuse_try_move_folio(), check that the pipe buffer's folio is not
> hugetlb, swap-backed, or already mapped/anon before attempting
> pipe_buf_try_steal() and inserting it into the FUSE inode's page cache,
> preventing VM_BUG_ON_FOLIO() and page cache state corruption.

Applied, thanks.

Miklos
