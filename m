Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1B396D1A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471820; cv=pass; b=bp2Y9leRsJFMtMRc3tlIBksol0FtHkFOGFdeywzH2H2SAZp+EbPCHh6JInLyjoKudbHI2fmwaJdSIuQpHGpeFZ3WyV/mMcPOeHeNAQvhzVWZWNcDREGK7dudmeDZhevel4o+PBAa6xJA+Qjs44ctrl1krxDQguO+MpCu5LIOqIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471820; c=relaxed/simple;
	bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2W5desd2haAeCFj2fqcG7hH8WLidxgTgDXoKvQ0c2kR4Cr96xQhYiTyM6am5SWyEMfBVHSRE52lAkwfJY5hssP6czMSbBaXaMAtLjh4nq2yvA6xTJawzvw8LZ+ae8fTQCOi8NGbJmgaMWhzGeUCHeCZ6D15orT4njW3PtAbJ4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llbUV/Qe; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llbUV/Qe"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e610bd325so430673d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471817; cv=none;
        d=google.com; s=arc-20260327;
        b=a99pCTTI0dX3CkTYkBodcYTPygS2jsFyRYyX6PeP0iiSgkWBCkCGnIQ1ixyCEiDRt4
         VQE1BAhcu70PnmYfE62FzB/XrGrOAuvwXC7+jcNrPnhJyPyR+dgTRsNtVX+qt+oxViXV
         Mze8CScIXJvUtRaBjOWlbpx4ZeZhJWPHyHjqojMOROwmZsCOMHrlnjX5rssgmDbxzvGJ
         BVmNLH6uuSOST56G99Z6PKU9x8nki6zw1Bwpgvv5f3DmRYCgNZcvqYBqmvfnpnwbKvuk
         Vm7kd04fsRrLGQ6tNgqpjgCq9Se+FStsbZ0uwR7o/GUT+iZ0OP67Kr3UmrcNVVRclRZv
         cXxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        fh=Us8CHvUZa/7OK322IvafHZN+spJ7L656egGVPe4Myug=;
        b=pZbKnaLAPvuFSqJaskEBDXxcTkAGlt0Z57klz7ftXph7aAPr7SQjPH3sD3KVPR5nNN
         xsgIOuSvcSBl6m+hbYpl6nmjTApMPe8uyhAPbBFr8B93ckz9Fi55Euo/rRB+lvXaUfOW
         oWNOBXo+UvbdZtvDB5s7m1Zf8ZXYUkDvXjm7HGfy+0jmDNP7UQhBmAlDzWo4x5WlYeG7
         VrcXCxKriC9ObY0HmLnlZ48gUyV4dHmURHV0eISKROEttLwcwLnc77p0zpRPn5kv0Egk
         4Z0VvupjrhBFjB916kWExRr+0UXNiQ6bcayoMa7YbYBOUVRIgzY4Ri2mJylG7E6jqgCG
         K7WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471817; x=1790076617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=llbUV/Qe/21I2MRiJL560Pr7jqUDuY6QgOFqdnbeOiDNII5TXqOIsFB0Drca94j2JA
         ZX2CGSuGp6B/5CYysoEQ1P+k01FCMqiimSqgv3LyVjXekjDtRD+qB0rZ/msX27+x4lUQ
         5oaQ3EfFdNbaehr8sX58+5tTMliH5IV5ttCCneFc/mPH7O1t9B+hM8zGMx+nUH3y8MkT
         i6sDVEQjlfvZ/x/fKsfobl1hf8xQ58zUaPZHdUBqReJIJ63ApIQPZOGyB2heKrsDixz/
         d5aOKSkbKSQgNrXmwLhpzscvQjNKob8T+UNttYn1CMXHwwvKckSfGsDlswjwzYTSiNt5
         xuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471817; x=1790076617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctN51SscDl96yAfOoCtwrpkHTXHsrI3e9yoxIIut26E=;
        b=G5mrJ3rbHQGHW8tP9GrJME/AuhPHO9UaoOmf9XesFO2Wu3Tv2rY/TaRjJaK+5Rrvei
         P+ehF0saBjxewSnGbkU7fJz4qfuSSzo9vXW5A1fVwJDxJy4QYuFRRQKdS6vcCTu8Cwxi
         V7YkTlTc1VaZ///ZDpBWcX/wH2Jyo/HUmfiqmWBYigGOlK0ubLIdUu0v/AK7Xun33HLY
         G6rZ34mJPRhmjkkmfxANSJawTrx3ZmhOjfm7yDGoPdzKxefOYqmxAsQkb3LapufAA7cb
         UtOU49jB69PkT7TPLonXxDpPiw/BOr0yxj7r6Em0XroVvg8kUxukFfV14YScP2fJPCrR
         6IlA==
X-Forwarded-Encrypted: i=1; AKwUvByRbVTWCROQxKy9qMyT1m+Rp2AQQmdkOn3mvixXgVWIwDR8IxGdVKhqPIjYLXBY1uoJb8JwmzZFJFqB8vE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2VWEDOzsL8zTjF8Q+EBQ4jOHnsrZSLQ3JZpZy4TI1F74zLR8A
	suSRepoU+JouK7wJVHVcQg8s4vd/rpfQ2G6i+ozq8/DwO9KmgfaXoWVORtYi0xH74XmQjw7a6zk
	YXm/Yihp1cEsDBnDY+Z3m+fi96THOF0c=
X-Gm-Gg: AYBFou3xhNSgFFMiL2VCiTrgoRtu8A9UCh3kiheeH/geH9RgJUmVJdYijDCPrzmDRZd
	t7cMiIBUwQdKXdhkS4KVFlBVddYrGDU/riFLtxdJy5CEpZ+MWwKlZxuj03GoBpNy1LvdNlwxB81
	7Qzy2RUS8Do2n6hLZdBocE1yl/EWu+6GLt4cFAkinpszgY91uJ8G6lJuVUnhY0PY+4ZsJ9cRjwN
	8HsBPvKajX7ra7h0WW97LPTIHs0NKdNrtmREWiWur3SANb/j0BmD689TOYiOe9B5fWGeR2rSBfk
	guVIHbtz3rU7DDzM4O9mEExfiFVtEY9T+f+1nYDjnd7fu8WUjtbaIfTn
X-Received: by 2002:a05:690c:630e:b0:870:48aa:473e with SMTP id
 00721157ae682-88d19058869mr28240767b3.0.1789471816696; Tue, 15 Sep 2026
 04:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-2-itai.handler@gmail.com> <20260910190139.BF6231F000FF@smtp.kernel.org>
 <CAFpOueRqaQ=C3u+br6AsCDPeeFwqVUmCG6JSCu90noowVCfd=Q@mail.gmail.com> <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
In-Reply-To: <DLEWE24XEKNU.1Q1JD8PFVRJML@kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 15 Sep 2026 14:30:05 +0300
X-Gm-Features: AcwNN1XZV_KcXpgrsqVgDP23cMB0wTyq2Xl7FjPYm5C4oFYJ8HJyICxhmV6sUvM
Message-ID: <CAFpOueSTBSipye_1VmJBBJSXsn-KBYoKUL=JTA4Ker3nMhFPQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
To: Michael Walle <mwalle@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, pratyush@kernel.org, 
	linux-kernel@vger.kernel.org, takahiro.kuwano@infineon.com, richard@nod.at, 
	stable@vger.kernel.org, miquel.raynal@bootlin.com, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:31=E2=80=AFAM Michael Walle <mwalle@kernel.org> =
wrote:

> So is this now two AI agents chatting with each other?

A fair hit. I do use an assistant, and I should have said so up front
rather than leaving you to guess. Answering the bot on-list at that
length was a waste of your time as well; sorry for the noise.

>
> Sorry, but please be more precise and on point and drop that wall of
> text.
>
> And please annotate your commits with the Assisted-by: tag.

Understood, and both are addressed in v3: a single patch, a much
shorter commit message, and an Assisted-by: tag. I will not reply to
the bot again.

Thanks,
Itai
