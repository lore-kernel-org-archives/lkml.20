Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550A35E1C0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529405; cv=pass; b=U+DSIor0NRw3NNOpIYOGZWc+pfnPa5tH93KWIWmFxoEgo/E9bWST/WcFTrhiiwrcDI7fXDQbr+y+HtyWw1k8O0xUw2QgIEQhKUepuAKi4HwJe2cn7qtXaEzQPX2ytKrG3K8e+8NhHyIwFw7eCc+hZexXhX+nRNwqsdoEnavzmJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529405; c=relaxed/simple;
	bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icPv+/GCjf7AMH54ZWeiYMfVJfBf5ALI/bUAxFFX3DaSKOPz/HWmIyj1Kviv4pcg2m6nPhKXuuFtHvJp1sG1/6ATvXWnywhX4Zi+IWLkyUDvM4PH0cAlU59Pi8RhBRZVefhFeQ35XmJ8UlXU5uzlDESnwRuvR/sYdvN9VlmWa4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vbcw7HNk; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vbcw7HNk"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8520161fdb9so3957070b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791529403; cv=none;
        d=google.com; s=arc-20260327;
        b=n8WbtM3g+5oZkqS9E7OOr8OuJoIhJvTgYwts1pvd8+P2TSRqR5ZTNiqXTvoQdyhAot
         y8u1ZAF5K5Se5J4hcvfiIp/CGjhPsfp2T7AG6VyNy54OamJEIV981e7aglkdWcB/vMAl
         CbtKJoFBz4H2sCfrnQ0IkY+jbAA2mQVxMDkYop+U5nVNG2mBa7MVg31/qGNOWjdAZNx8
         oiF3Q0oNXqmD6DQjN3UY8kyNy4tq3v8TBz5r8yPrTJM0QbuX3TRXdZ6s9HDXQ8aMB81k
         sipAk8G6TQRL72JKsUWUBPogjjyS2CCiishWHJlguL2fcgWrCFJaRriNWurZsQEwllng
         E+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        fh=qz13iIcj5w9AM6so0u6FmikeBWb9iGpjHYd42KdGd4Y=;
        b=hcYvYUdZL9X5jImGv1sjPzig7JJ7eRwhSUz09l/v0P2x6L1bafF2xIzqap3hT5mylK
         TJ8cu/GTmj0qmDdaZ2ZY1Qo5hMR3bFzVNo6dkkOBhWbYeZHhhqWU9ZXcmM8aFGKYJ6ht
         +sKLCyv/u+wrzrGvkQR7Q3WWOH7DUasADBkQp4tFGMeiFUHPK38S24jDzzaqROcCMzmU
         qajhs2ICvuhIuKOSqZwrXK65x72iv2Hkad+UQjagG/PGcu+xgAfVygUvVKcbf0qhyRJR
         E0mEok40Nzsml5iwgexMlUVJ5JDWGyDE8LaktNLV2suEzevxVE+EAwfGFyRHRHkh+jqh
         vtLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529403; x=1792134203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=Vbcw7HNkUG9V3/2OGa1oAh7N5o2VWD9fCmIsYs/S6pGcEy4OrN6gJF5LwQo6GElKIj
         pTxELvnWC/3GF6CeVwS8S+kgBffAO9pSrve6/4WAYerMBbIISCLeWpzJFrDk5xM3JQz2
         vlPr9MhJRx3BWRhe+DDnuwkpjHfgs3+pqAjDzodMGXtNQYHYQTNhBVupojd9QrA+O8KI
         AtGNqHMQn1WdI9RxWCO1Qycmhy3QgPfe2N/nNaYJPu5nwReu5ZEAH6xQMxaYUJylF/AO
         4fKj3bEJU0hyhQ24HoIsjQcl7uct0w0qEdtHVjzSFA5OVBgucL6v6oBN9n9LWT+DQ8pn
         tcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529403; x=1792134203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/66UyK1G/RrLnhVcSi5x21gKzF8iMZFM8iJW73420s=;
        b=Jn1DbRoLqzZxhuHUWHNN0V+ilka2sRUPSmtS4wtQjNwVUA/ciKwE7++GdGRALDHmWP
         GgEsWo8QRVvLoznf9AciFDYGC++KIUGx7P/2nQMnsR7krR8JsB3dpk1brIzCp+lz27dp
         Vz4gKUtETde9K7x5EM473GoMjvI0+rhegTup6glGs9g5QstnTNR+MB3skxapVUX0jDQ/
         Bu0G+ppCLEfkFo+suiO3aCs5sWbZ3kvT7pq/YSVMD9t3kL7aw3MAysI/Tex0iyAAm04P
         ffIBQceH9MPu4aYUKHCx70CvOB8FWHnLaer2Ubu8DQSQq6+NLz2X1Em0z/SWNUid8SM6
         2QcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdVCYO9meWGqAs1t4r0EQSK1Vi6GIj/6RnKt/ifeIK0yn3LUnDeB/EOtMreqPB29IkeGlQguGciiQNOPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT/BBk012kuJIbcLg25PMrgH8HEtu6yibN6YsNTTBza3d4Wok5
	j1l6VS/7b6LudSjSzOXt4Q4krOHQ+UZXCzwz5pdCN9JW1kG7K9aFYB6Gc/bMazk46ERp+sdoRdm
	NgX6pj+fQ4p2RlbJLE+TV9LF47KusN64=
X-Gm-Gg: AYBFou2wjdkyA6gj+r3h5uJqQICZYvu1eIdux4NqA8PEJd6NJMjmWGaX1ygcG1JEgv7
	PnNGk7REXMKZNTG/aMZc9lBnJ8gHlGGlcalJCzM2bXlp7D13OU4ep4MpfCMFVD33hB2udy1CeKG
	Gq0Tdwv78x1BYB+N4rR3vskeWPOlCv4AibsRG37tb7uFue3k/KhuV6NHGDsGpxIB0ra924Ihi0K
	Dz4rb6LE1eqboxIEfLppGJAx8gxaC551E5kLTM0A2653dh2GHBXypaTJUCoZbsTMvQl6NOkjtRb
	v8s2Qm4H84b8F4kV0VchXM976qmweD7zT5kX1VnxMnCwAuTRoVr0kdafaYcSi2QSw6nXyiVR9NQ
	Y4Z3M0FAw3tRiAOEi3DYXw+ZJBib3GowLebO8yVotRXJWhBI2BWranj/0bmasJmIZ18DmAXDIqZ
	SVrQ==
X-Received: by 2002:a05:6a00:aa04:b0:885:fcc1:d55c with SMTP id
 d2e1a72fcca58-897c7ec5a0amr846999b3a.43.1791529403528; Fri, 09 Oct 2026
 00:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-2-phucduc.bui@gmail.com>
 <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
In-Reply-To: <56ca274e-5b56-413a-9fcd-9ccf1631d8b9@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:03:11 +0700
X-Gm-Features: AclHuK9K_mTmShroHQ2NxfLYvmjGvCBUVZdlzaaqulcpuz6FtNuEKnD6JjCP8qA
Message-ID: <CAABR9nG6RyjjmGhYKgMJrjbO+E5+UxBq5JBfeoG1qj1VxOZn1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ajay,

Thank you for your review.

>
> Should mt8195_afe_enable_main_clock() also check these return values,
> and unwind APLL1 if enabling the APLL2 tuner fails?
>

Yes, I think it should.

However, since I don't have MT8195 hardware to test with, I'd like
to wait for feedback from the MediaTek side before sending the next
version of this patch series.

Best regards,
Phuc
