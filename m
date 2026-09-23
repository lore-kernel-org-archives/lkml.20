Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF136F915
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129582; cv=pass; b=MPFQmWiMGMUamVxmkY0D4FFwTvy2TvYSgXmXLxpRYd61CHD9/LZYt5CjlgVdXWCG6gcElkxijP3eNEjS+sAWiLq5EmYVYMgdAh1+DbB9XxTHuB0dZ8QmPWrstIDm91yDiUFUa3NY4XQuBi0Rny+/HYLVNHTsnWmr9Lcb7BpszvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129582; c=relaxed/simple;
	bh=JueReRxXF36/Y6Fa8OTRaKAq+634SD8b+cgAtq1zZgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM3icpnXxvoiEsj9iSaORAVjNEq0lyL69lRJe85eYRhdQIJubQrvvRW0t6OqP4a4jwxu/bbj6tytpHB+VUN1LdNBjF1nOGxfeeronbo1ZgYwCNkPO7NltUIPWiMPPbgZLAEzMn98Op75nliSY5SXAE+TCvWJxbiGTAas8FDb1TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fasheh.com; spf=none smtp.mailfrom=fasheh.com; dkim=pass (2048-bit key) header.d=fasheh.com header.i=@fasheh.com header.b=DScMIfQB; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fasheh.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fasheh.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fasheh.com header.i=@fasheh.com header.b="DScMIfQB"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so5097571cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790129580; cv=none;
        d=google.com; s=arc-20260327;
        b=nRxQm+YEU6MNQpIK4V+BMJWcF73pgYJmDJ4VWesI3cGUF0AZ7F0vJpqf6fb4erqAHj
         wheJsSszH+Ya1Dl3WqoCwBrYnBCg3OffpFKL5rGnO8brTxxQ+0ckE1VjhGj9G7JTJLSA
         6z5ah6wWRE652JUCWtyAM27MDgT+PKhIPvwWSPqGTTmcgZ8+I9QAQ0+1u/dkFxMpAjt6
         eAJVUccqbwUsaI8ReixFeSYkrmrt0IJTZpXf3DFM6gS8CtdHcX28z5EcsykeLo8hjTVq
         oJEK4Xr+TYaHuuBxMupkwnYwNrZxaWA5WVhNiKRVMQJjiEx7OenbDIJp1C7sOju3gwDa
         MlBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8+NKsnMYUdtlXCVGR3Ho4DQYC3dNIX0jhxzsZA1mWNs=;
        fh=RxWVhZ2mgjoK0DElfyRDLoJvKeJolhSTXECmh7PhLTU=;
        b=PsT5cBwj7kfG8WjKzfK9F8qqnYncxr/DIFdNvP5E4dECMQrGLB4rqT6RwyGfvrmZgR
         khF1Z+DF2zSCsOEfg3PS29lNwzo/3unmNEZfshGoxE+brsl98i11xaqVbbVIk1G31j2j
         1VXktaR12jAJA3Sa18d+r5kMVpB0bHjN+7zCtye9CAJh+ieTo861d5azJWh6OXUL2pf1
         xmYKE6fHgEMBVrB4OHI1aIlu/IPVWpJ4LYwWAu2Nja10cxJDMZza7aRipylVbhS0DkJ/
         2yIP/+eNv0QhK0yUmc+br2FHESnjFTKmfc0lfdmRc4sEjX1643d7Turc6J85s/Y3V2My
         4cHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fasheh.com; s=google; t=1790129580; x=1790734380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+NKsnMYUdtlXCVGR3Ho4DQYC3dNIX0jhxzsZA1mWNs=;
        b=DScMIfQBY9HfnjlqwDkzbjwGfpnpI51RyPKGbIZnGvE1SbjdFwTC7nuEbqMnyJHiGC
         Urc1uIVuzDrw51E1Pj/BRR6RnFovhOgXiSCgxpVl8Pxj/uaW84AvyR8Ijd289cQrY212
         a/u9XaM0ztIFPfLYEcsOSOfRlN8XaeVpeTpBx61P+/s1Tb3uLpxrJXM55EM+Iiucqu+2
         VY+crD1C3B13Kki1XWABNBtVaW8qSHl751xyNID3cqGo1EDTtDu8GsiV1K/k+4gknvnN
         A6QVKQOYff5w02Yie2kA2+sQhCbT8AAnJuheW1lbvXe2HZ2Kk9PDI/JOtIn+iBO7IWms
         MAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790129580; x=1790734380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+NKsnMYUdtlXCVGR3Ho4DQYC3dNIX0jhxzsZA1mWNs=;
        b=SsOByXFYyoKK0UAAXqOd7t8eoHJEn4npGnjAhzyvuNL4qSmMEF4/We5PXEQwZ5xDcd
         tKWdrOBgSNsnk24ocZU3dOZMnppiwevwfDM7DDoIbfca0S2arAQ7LOH3X5zI2MZEZxDO
         PqlVvteaiahS9xHfX7IBs7j4qVa/r/2cv+eF5M5PUNowBHC7ckGAe0EgU1fvyyTU+9jI
         59udyggYQP4aep97rfvcq32+KkSLugnjHRSBBWcXxhr0tcvd1TtE+ThmKa9jq/qq3nGq
         p5kZjsuccVNtRAvI8kFZEPgMHSe4+fLf/V/RhzH5NITkmCmMOuKM216imtK6lbOeQepZ
         3MHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuN8HdIQjCnRShn7LmLqZZdBk9/eTmu7e5Tnn6Crfo8FybbD44fjtW6LASMDV5srr4oTUUGWXubbHURVk=@vger.kernel.org
X-Gm-Message-State: AFuF++klEo/UfPT59UjHppRtg6WJdWtWwHhWeG2yNV9db/D0lZaRw3k6
	K8njwsnyoRFUfbpQthxazEbbn1Hto7q96/eTy5Egsc2AD7/4LlZknYH5+wxeA3gqg6QJgh844bP
	YAVXaxuqP2+LoAPg0eQimSy+uJTI0il9gk0jPYExZOw==
X-Gm-Gg: AYBFou29o3ue0ajicR9GibyasqY3y38LtjZrxGkw0js/aD/Fo72/DdDgS+XRgNq9F2o
	dFMGswpkzHmEz5fb+DZe3X+KqUXpgd+gzazy+1N+tcwtKFcGTEqeHiMolYnunAIYLbCCsHQ+4bJ
	TpP68VxNxV4I687zPCOssXd+vwxq8PDPOPPPc4V5UnCy/G0ulfn8nN7Mz8Z73DXb5ewq8vK+yTy
	ajpJInbsYCr5fr+gDw8p8twnbh0mNPcVx+dnnTSo7Y6tdZremZ6KliNWF//9II06CjDx74qR9Vz
	Q8ttoqeUzyi1TcvF10iigy8S1j8S4mv5Ag9r/NhL/lyTKBB0emLACeDI0VsTq48NNiuhKKYoghn
	c5xXCs3Fnwvde
X-Received: by 2002:a05:622a:390:b0:532:9ca3:a400 with SMTP id
 d75a77b69052e-532eac690d2mr24213961cf.16.1790129580278; Tue, 22 Sep 2026
 19:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923003920.2382398-1-joseph.qi@linux.alibaba.com>
In-Reply-To: <20260923003920.2382398-1-joseph.qi@linux.alibaba.com>
From: Mark Fasheh <mark@fasheh.com>
Date: Tue, 22 Sep 2026 19:12:49 -0700
X-Gm-Features: AcwNN1UpkX3jOorW0vjOas-FroH4RgfpD_GIVXXvNGML4JW5Y6f9y4ClrdqhKt0
Message-ID: <CAGe7X7=pfXetdZ0Yze_nFWpa4XqFoQFXWkCtH7qh0eRHC5drjg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Heming Zhao as ocfs2 reviewer
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Heming Zhao <heming.zhao@suse.com>, 
	Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 5:39=E2=80=AFPM Joseph Qi <joseph.qi@linux.alibaba.=
com> wrote:
>
> Heming Zhao has contributed ocfs2 a lot recent years, both as a author
> and reviewer. So add him as ocfs2 reviewer.
>
> Cc: Heming Zhao <heming.zhao@suse.com>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

Acked-by: Mark Fasheh <mark@fasheh.com>

Thank you, Heming, for your contributions!
   --Mark
