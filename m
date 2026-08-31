Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F08F3E1218
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175855; cv=pass; b=EOkAJSfiB9PHbx+chRZx/cDkKEsM2INmT7WYeInpcv2F2/2+NxST8QHd2gOIvOf8WeHnlOo/05bgS2wp+4LXKhe/2oYv3H7sv23nd+NDfBtArNRCKsU9iIp6/yW46Ae0cZjX6tdkgEW4AcCAHkZN3RA9FWrpppso/hjkzT2gqbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175855; c=relaxed/simple;
	bh=VN2Aj2uRjvinb/wuyWmk90q+RPHJ/JuYj+O1pcR4530=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uxiz++m1tPNx4g2HrqINXvHxaHzc/9Vaji4LbNc8WzZrlgc0agX3P9hGLdGT8G9y1VGxvzlL+84jCvtgED0TrOnUh2AzE/O1kSSrPitSdr13KWUikAE+VZLngP6ekZ4B/VteEuTz++AIre49sKje48VjUedyplMJOjdPbqFfnzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3Xz9TDG; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3Xz9TDG"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66d23c88af0so1265116d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788175851; cv=none;
        d=google.com; s=arc-20260327;
        b=szyImUoCISRaiYRGf71nN386EAVMjI0KEyV0TEz1PZUYL2klZ8jmKm/v4C4M7PZ7bA
         DZCnHsu0dUHZxi8zVCkwJNpz6gTuVAIYAxvtnwJCDhzdl4u6JQxZVTJVIWOoqQ8xI3OR
         RkBugMKjrWkEg870obrP+a3OOXi2pCoY0eVto+Pt80sV2fdKeDkj9FzbLGo9mLKqHPrz
         2o48Lo+EFWicHzBtnrFuY7JTRGpii6aFoxSmfiCt3hB4+VUBbcgALeVQ64dYj28uBIIS
         UGKTVhrJ6czt1eL2kgYYFihAwWjPlaRU1sGTUD21jcv2b97U0GnrYoeWbE3JsnBdhz2b
         L88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B62KGiNz54kxYfvsaX6Te6uL5bqj9S2a+691iHGSfMM=;
        fh=Z1DaRhr89R3oBCJvZflbSqWzBKN56rJCEJD9paczdAE=;
        b=SKIHdk/d1+a9QQWG+MUShI7m1CweKWrtVBNvAWszf7x8E0XFXfIw2fBCzTI59CsCGH
         1FFo3AZTMkURZ0VszYJLThEFDoBS1cqh5W7/sYWg4g6n4ROhSma6yz8y8lFeZSaWPDXE
         XTyzpMC/Q+krAsITO/2ozfbpSP2B9pZyN3Np+qDG02DIwLhZ6ngyEQeh9MMTKfQhkFAP
         R/JD7guaoblKVwnAPBovpOu1X+jf1U1+QMsVJ5HhBwDbAAogIaj48RTLAAPBzk24TqlG
         9Svrr3VGS/u4/USSe+KaHwIiTowOhrEHjLOuZZE/scXXM3Enfg+CG/US8jPtn/rnXfoH
         j5Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175851; x=1788780651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B62KGiNz54kxYfvsaX6Te6uL5bqj9S2a+691iHGSfMM=;
        b=c3Xz9TDGjFbTfDtndG628BHmyyqpbRKAeHCPFRcv7ruc4yK6Mw4hgPHSeMvOTlH0Lj
         bYy4VJe0L+vh150OoN4RPEVPnwRAfUaFfXxi/OZnQcJMRhP63vnfgu3w2g4te6KPpw+4
         fSqX/1xogxyPED5tYxy04XQJI7vokWWB2xy3FSVruvY0aYsQ4vkNdfUDuVOtrSLWhRlV
         epMe0vJpujWG7qJrTsf3v6n+5jnA8CsEJ9w0B480jFnlDfw3qaJLyATr3YipepSRjSgl
         dxkOW5a++a4l8x5DsdpUAWH1LXcjt+p6yxQp48Y7C6NyWs2XwKGZ5pUPM0xxJyaPLMJW
         d7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175851; x=1788780651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B62KGiNz54kxYfvsaX6Te6uL5bqj9S2a+691iHGSfMM=;
        b=CpolHSCRqliIALVNYJf0k49s3RAcmG94J6NzI0U8vNHmnxvGwQiWIjDjaS/srH9Q+m
         UQxZKdHQucs+Tq4ireExUAI1LSPfp99gqQ8ANBNk1KaBvlYHW1GBV1WBHWphbki13/lU
         7Ysu/m0ce2QsY0zsQLvkEx/cEA2w2F3QAkjaHiy5Z2e/1zwqGnip+IfD88oiNy4G8qDZ
         v+myu4Xmvu7kTfyCbcOPp4VbtohLkbEQvlvxhatPuj49lPgohOzt0sFuZwkmwaDLqLav
         M9oAec5TEv9K857ojizS+HxUqyVGML5AljF9RlFVMZOSufDfmWwhgORvOKqYISngITrT
         P4ew==
X-Forwarded-Encrypted: i=1; AKwUvBzbi5m8M4ZnnwXa4t5aoH9H6lYAsi0/v4pOQabJI6s3Hw7rWj+R4DW03V/FAZWpz8XjWceYqGR//LNEuNY=@vger.kernel.org
X-Gm-Message-State: AFuF++mBUYNXQQtDAJrr8ZJDdRcKQUpgLnu/Mx2VDEIpvWQedebZQXgI
	bZmOsrNFHNWv2wo5NdW8aaUubq+XFX+iem68t5LYmcZ5G8rg2zeTS1nQrbg9VfLKoAtHhgjzlA+
	RCjPeL/hWuoEzVONlYcO/BtkUX9Ym53KAJWCa
X-Gm-Gg: AYBFou2nKPgva1PtsNuqAJlWBNlbmuxy224MiBXdYD9x8Jwh/drpHedgBy1Dw7CVs7O
	sCuRv88pmtwVg9XKfQMaH9Qv13olUjhb2j5ntUcanPzYLEyeSFvm3IeqyekfY1s3dbCWrf04P+H
	0XJsfCrfsbUH2H8O2dPzH2ZjlSNCitX/h23E7bPd7hHvxuk7f2WS6n6pnUvgIv7oGG5b+gv0NEu
	pdPz0Ac2KTWaEzIB1eS5h9uADCDT50T0zUMRJU12TjQi47eCEUVvLiALGszWqWhIFQk0+YMnOMV
	P+jKvfozmLUkEc6n+l6rbXOS26XA5IyEwORwA4krRZiGsitBmEp7
X-Received: by 2002:a05:690e:12c4:b0:66e:6486:e809 with SMTP id
 956f58d0204a3-66f87597547mr2148d50.30.1788175851291; Mon, 31 Aug 2026
 04:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827144151.486192-1-ekffu200098@gmail.com> <178816183737.3691663.7482057515031348878.b4-review@b4>
In-Reply-To: <178816183737.3691663.7482057515031348878.b4-review@b4>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 31 Aug 2026 20:30:40 +0900
X-Gm-Features: AcwNN1Uqx3mPqCwuwqOkUz_hqxHT3iPOElbh9dodPcQG9GTSKkZdXkVBQFWRaI8
Message-ID: <CABFDxMHQjXUhbkUs_5Ki7Q6ZpQkF6Y-fDCS+LfxERFv09UgOrA@mail.gmail.com>
Subject: Re: [PATCH] mm/mm_init: remove zone_absent_pages_in_node()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 31, 2026 at 4:37=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> > zone_absent_pages_in_node() returns 0 when the zone is empty and
> > otherwise calls __absent_pages_in_range(), which already returns 0 for
> > an empty range.
>
> Right, but it loops over memblock memory for an empty zone to get that 0

Indeed. How about adding an early return in __absent_pages_in_range()
to avoid unnecessary iteration? I just want to remove the wrapper,
which never uses its zone_type argument since eb0e5b61369f
("mm/mm_init: don't overlap NORMAL and MOVABLE zones with
kernelcore=3Dmirror")

        unsigned long nr_absent =3D range_end_pfn - range_start_pfn;
        unsigned long start_pfn, end_pfn;
        int i;

+       if (!nr_absent)
+               return 0;
+
        for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
                start_pfn =3D clamp(start_pfn, range_start_pfn, range_end_p=
fn);
                end_pfn =3D clamp(end_pfn, range_start_pfn, range_end_pfn);

> --
> Sincerely yours,
> Mike.
>
