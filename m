Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D3A356771
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791715185; cv=pass; b=ujN76Pw3IMcSrrIm2nFyjHNcEsU+UDRgjmDD0DObT//5UUEhYFl4XLWb2HSHX4/sqtUbKoSgik19LxlBkZ0EEjgIO15/FNZODnAelBSrm0DQ0NaQIybwarwW3VTMQyltO89VhOLEyFCgqc7ri9xUGZquO2op/NGY4Pmr1jtXA0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791715185; c=relaxed/simple;
	bh=DdPSjqLjwJ8SWWsAFmCsKUMaLl1dkxKSs39Ol1fJe3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGHNeEylCQ9n/EhbkQd/lkldrNo0yJl4AT+EoQRfSvobe4LJMKyLH20V+La25ArMWakbkhWi5e33PbzBWfNnw0QhxO2LwlcKU3HzTyjjYFvsBu5rZjYVg2iVBpLniMO6pUfIz93CNV7mIM8QJbn3LunJ6dhD29nutVCYToejvmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHzZ7LvL; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHzZ7LvL"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a6so582719d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791715183; cv=none;
        d=google.com; s=arc-20260327;
        b=SVGi84KdLvE4xG7Zu7m55ru8w1+ktGOxxNS03do2fgPaJ7DwXL7ViuZM/aFOvu5SQZ
         uTL49/0tIuNj80lc0mf9pnlyLfXBjC1oKL8YAlpkx4KqkmUTKqk2FdioQnRBaufMj3Yg
         2rh0QoiP4F6dNyu6Fw0MXlcoED9+M3mAc5yuRjEnhAzXnEuYD3yNyXNDPYOOJn/Q2U84
         /DU4qgX7yyO7O8EO1jLNH515dWMBsNEwX22bAEyl+AqknsVi93HBLdV2lN+SP1eZzcFn
         RB5DpGLdCszeMZMciI/+YDXSXVRM3xNyiT0FosJT86g3gXiFHx3DQM0+3aNP56h22nbC
         2jqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DdPSjqLjwJ8SWWsAFmCsKUMaLl1dkxKSs39Ol1fJe3E=;
        fh=aAt5VPhsr7mwe8BGC7Q5JuUb5YQUeD76bBIMozfjGNQ=;
        b=IwJHBOrCU15tOwYqvMGbT7nI6tSiYG47MW4E5jnik8mkhhOEH0H2mU5apV1LL+lTXg
         /RUllV5qCW2LhCaDHlhciXSU07ci0qC7rSEGF4/FUuyrHeRU5NTwE/Gf734XUVJe0MBo
         pdvx0b5IzCEwJ2BNkLZbEcJjtuP6MXi+gRKTla8A+4p5UM61FuHAiIqevNfAuF/kyqza
         ZbLi14p0w+XaJ7pwCJVQPZCAy9J+4HQ13ul69t9if2Vcmmz3yetWRa4dk28EPltf8EMI
         kFJ4v03cJmwcBb3RRMAjH10ffpqpit3h/CGymLC6UTHPMIdWrJ6/envr5V+xDQ0BaYEH
         FDEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791715183; x=1792319983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdPSjqLjwJ8SWWsAFmCsKUMaLl1dkxKSs39Ol1fJe3E=;
        b=CHzZ7LvLBXdGdHlAl0zEo2buFw96shwuI/4PCbHNZdblddrOfjvMrwgqxHbQ3PMmN2
         XRAB7ATLGbw0Hba7LK3Zwk0GsgXHBAsU/jfZy9zOyPHvF/1PlgsZf2I7IUrT9cmRewRk
         b4yjyP41j9zyF+0yDGr4kEARTPLhFRw8WKP8uk515qnQBKcP1pq38t/ZRc0jiluJHshj
         xOQCDlZL6sl2Vrw5gYZjVEtE/h/PyHPR321wxkaCwl2HKKvLpzu9jYYHL80PD8N7COX0
         tha/G4lkw2/NfiJVI0YBYV2lvZ/pHVsxPQSNLXO8lMaWbvPWwtnViXspdQ2zGeWZvICI
         1eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791715183; x=1792319983;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DdPSjqLjwJ8SWWsAFmCsKUMaLl1dkxKSs39Ol1fJe3E=;
        b=jFjdsT0Q7nmtAA3h0k4VQ3nSJYLZ/5pN1itC9iKuI9XannHtIVTUrgLdLd+LazO/6k
         q3BJfEr4nMVHL9OXsnzsV5yPByWQqSZV0w6PtfewnCGLIobzJNKObYCd9qRc9hFW44OC
         T+vjfj6PiLTSkjnJ7DheEhxbjGc4CoyHMi4KIlGgoFPbFYTpmfSPUE4BujcW5B2EVCpN
         Eh4K5bDFSgW56qqT6CjRLT6GJrpXwLHiZ692VQXLhFtBKB5W7jkycRFHezm5bTRjAdUA
         WDVX9CUgFEldvo6blcHQtrcSwPTHw1V/1LMiQzxG+JrKSbMlshgrFjcCCgec7hEMkSWp
         gHAw==
X-Forwarded-Encrypted: i=1; AKwUvByk5z6LfJY5FKXCMjuyp/XkvjUsvgdL8krXkf6i49KCVTOQlYoByJAg320STVKBipqNmWFdTT1UtBdOPyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3FYd4C+GKqO97tRiXzyuW/YBF7E9NodkOkYdkSKa7OKS4PFH4
	D2+ZVUOAT3qycF1hqGcAhAMHDjx1w8pOXUEq5H/euARWfCN+pLVNZJ/ZUEkwmnYZEe6DYUpyPuv
	u84bTlAk3Iwnmzcy27CMvNE+NbmHR0esOAkzv
X-Gm-Gg: AYBFou3n8ocpnJTzKOdzKTagOwz/vqeV4Oi5aNsH/nxx7dJlE9C60DgTpp4Y8H6U+PD
	H3b7lrzxuNTQerzNLuM4DmlAd+7Wo9TePqx6PqaWavMXz3ZXGjQG/jVfCinc7N5VI16mYFMuVDy
	d7wfpzTx/5QMozMj8nQK4op1Uslo4zPOhd2px2uI728faNdAHwIpwH7WtlqX8mMcXFF+KurCvSt
	PrHguB4koqBUXmSK+BAd3nxXcDeWX5Cw0Ko5suHQMsMnbXUvsFrzwQAZYJGvhzdWXShFI2YXJ/w
	VmphXpmLU9jkkcqVCuo2xois7FxiqaR5HC8OLxXYL8SkWheckv+U1UtT
X-Received: by 2002:a05:690e:b86:b0:675:6da9:145a with SMTP id
 956f58d0204a3-6793604eddcmr1958398d50.45.1791715183421; Sun, 11 Oct 2026
 03:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004061007.7433-1-jsjlee1020@gmail.com> <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
In-Reply-To: <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
From: Seongjae Jeong <jsjlee1020@gmail.com>
Date: Sun, 11 Oct 2026 19:39:31 +0900
X-Gm-Features: AclHuK9A1CW5r1Ejg6ioxpv4j5WsstvSHKyrQo_qEu_linAEn3hxGB5yZ-jeS9w
Message-ID: <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated blocks
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, yi.sun@unisoc.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

> Cc stable.
>
> > Fixes: 81ffbd224e5f ("f2fs: update_sit_entry_for_release() supports consecutive blocks.")
>
> This commit didn't change previous logic? IIUC.

The discard bitmap handling already existed before this commit. It was
introduced
by a66cdd985532 ("f2fs: introduce discard_map for f2fs_trim_fs").

However, 81ffbd224e5f did change the checkpoint accounting.
Previously, del was set to 0 when the cur_valid_map bit was already cleared,
so se->ckpt_valid_blocks += del left the counter unchanged.
That commit replaced this logic with se->ckpt_valid_blocks -= 1,
regardless of the del value.
Thus, the counter is incorrectly decremented.

Would it make sense to add a second Fixes tag for a66cdd985532 to cover
the discard bitmap handling?
