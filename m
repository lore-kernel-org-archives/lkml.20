Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487542;
	b=QLdc1gr7njQJlXbMjNviCsCRV6KQDy/WzCmftGeE7/r9HMFHIvjxd8A2HYhbwdttcKNW
	 F7mCDKAl6SFr3hGzNUaRC7soJwumrT9OQf5lpS5wipOzwvi4mkDQYzHqwCQ+/ppqxsCdZ
	 9TQ7ybNQ2M+YxuPUnmp5FSRq/tgHL1CCfxX3vCQ3tpQWF4qKNkQy/5iaQFb33oAVnuUl+
	 XCnmbYy7yyUyDbA7lI8hxtqlCsUOPWH5hYBG0YEvbUSYIhlWCeYyF/dYgUCHjHERpn1xA
	 bQoU29jPtdMTKJejJmvrgLXbxenyPFhRjmB2eHqAo+HE8PIABGZA0/U0C2H3cg8Mp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=VpCk+/HIv7Hx98swHySrIZB8KgIMpjiM+UkgHDX5AIE=;
	b=k+egMEU9v+7HimPAUYAUR2UFVFuH1LgJACWkQmaM0D0V1RxYs+u/n1rKI0Ka45Op2hHe
	 Y408aZlV8AUaEq0Kg0kSFubOQl0as9T08Z3AFWJTsijoOEIxF/1mjc7y0Jq65eQzmKy7F
	 q+RZaizkq8EUGw49B28Amw2wFDCGKzhoq6Gb5kJjKD3x7h4t1Q5ROAlMYdnkG6fOa+v2I
	 aZu6e4LpwqMCLKX+uC2rQMZN1sYKPErAciz0sKeRPSjzIM92uKv0niV62wGh0Q5EhjtnS
	 zSge9Pt7akn1gq7LO7FyC2eEazsOVyP4HCvkVxxufET0YuXTYFUtXtdHe/MpHxCluSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=el1Pstvy;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62976606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62976606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=el1Pstvy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so5160916eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487541; x=1795092341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpCk+/HIv7Hx98swHySrIZB8KgIMpjiM+UkgHDX5AIE=;
        b=el1PstvymrHEPDC9SiZqcfcg2GMycCDVyoy1Yfz1FY9gLV3vyp3xH2b+xkC7K+ocym
         BRB/jrA697aEgziZUleZXMR93U317+MS938mfxG4gJLwSwR4R1rzg/fKexQPS1AbFFOB
         aUQ5WusHQM5kMcUuqmt9NIyyX8XLRfGilsEtx7tZqAB3PoKkR1J/RYxtmxNx7053dB4L
         mCWj6ybX5ExaMmAnf7ni/24o1RSZGG6mrZ6cCk/2XD97I3u32ToBeYK+wbp+P5kG5rs5
         exby4RpBUN+gGBn5MHgwHrQ0pDm1zq50MZ9VHAFr+pyI//1eI+rcyNz921oZMQKXqCPj
         2Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487541; x=1795092341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VpCk+/HIv7Hx98swHySrIZB8KgIMpjiM+UkgHDX5AIE=;
        b=PoDishiz0MVuQr8A64z2LwOduA1+zNAbdfMZocLxRFcfjGRdUGVbBOqiE/1YYxWuan
         l3/4IoQSqCAoNAsXaZlhSmQ0TpCGK+u0Gy228FNOI/IGbPlxeC8t/5qSx6gJeh7OuyDG
         nW1A3az610bTYt+Tybv4hxPttkYS2BTNir/Jn8XfC7VWIIZyLk9SaxJwWYZdc6TLwlJP
         NmZDW+FMV72eQO1VY3ESzUF9hJ0aGfIxQBNBqLMAx0utaDVSFrNiYpBqtG6AKWc+f6cn
         tvbaGpVFoQb/B27Cuv0iODh92s4AY0L2hp2eqm5C5KaY73p4sHxfiWDHPKQCocFu5/Za
         tPyQ==
X-Forwarded-Encrypted: i=1; AL+hErFmyrhDboISBENlYoB0EqnHEvALoMaUeLSUrtVbP1arr8Y7dijjwfqqtWohvwb+Xz5yITvKhwsI/yQF2pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sxTa1B8+Pg3m47+sTRNmJrvJ8I7gz7EuvBHi4+rkkAwWvdfBC
	eAQFbJIniksFgiFK/G/xvLQmlxqA7u5gwCvMsQ+2ZfdT1AHxEY7J9Ur+
X-Gm-Gg: AYBFou2LbspL/+x1OVRu990lEP55DR1zM8cZ8EKX2Le+iMwVsdLDPtfxfj/IsSL8Dz4
	jHIU9SIXiBALkPwQqL7kRoHs6oFokJ7c5gNsqFWlkzn/gmlYOh4bMDbJ6O7twJGdQ0kRLAJFoAY
	HmMDhCD6gghz5EoQtujtDmWYP1b5NxaXZEyKUQccMN1Am94ndcj/VMYNxGwEfs6V7I+P1Ji38he
	eHuVU7dlm/tmdsTz1qW+x0aaWyp+cctMI6ZQClhwOUTwsmwyEtPFgT7KaQXriWtDeuZ3OlJzOPl
	wPJzhMjKRmaJY01cvnCK+7HIP5LI6Luc8tAQdmmjvkfJrR9/JtRqHYiwmHkwDg2fWq6xH1VpAPN
	jFkc+VTieWBKy8ubOlidzCTGggg4yZJz7TSC8uVI1H0FiK8rkPnGeYzPUgPRq33YBHPFuTYPNm1
	84xuDZKnrU6XWFZs7XxMDSI0gmI7mFxteHpbgXD+Q+AvfTwldcrX8Q3f85JbDn1gFxHpqETAcng
	NHKb3UA6yjzNgWfZ8i0TRWtBqFiiacb6sESAAPAe+jPiO1DUekWhYk5LjSkuE66bZeCgW1CPy7A
	eiNkaBVku/T8OaTjyjZj+F0LGFI=
X-Received: by 2002:a05:693c:8349:b0:36d:b933:675c with SMTP id 5a478bee46e88-376858969c4mr6125233eec.17.1794487540338;
        Thu, 12 Nov 2026 04:45:40 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm55246175eec.16.2026.11.12.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:45:39 -0800 (PST)
Date: Thu, 12 Nov 2026 20:45:36 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>, 
	Vishnu Sankar <vsankar@lenovo.com>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avWzauR7nGj90S13@sapienza>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza>
 <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
 <avRttU9N0EZeq8nY@sapienza>
 <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avVPRySmoH_KKHa6@google.com>
 <CABxCQKt9o--KrucZ-jcG+tb4AGtrBnPY_mypqX64ojWRpoO_yw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABxCQKt9o--KrucZ-jcG+tb4AGtrBnPY_mypqX64ojWRpoO_yw@mail.gmail.com>

On Thu, Nov 12, 2026 at 04:14:35PM +0900, Vishnu Sankar wrote:
> Hi Dimitry, Jingle, Yuan,
>
> On Thu, Nov 12, 2026 at 2:33 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Jingle,
> >
> > On Thu, Nov 12, 2026 at 05:26:46AM +0000, Jingle Wu 吳金國 wrote:
> > > Hi Yao:
> > >
> > > Upon inquiry, it was confirmed that a black TrackPoint stick (0x07)
> > > underneath the red TrackPoint cap corresponds to a vendor that is
> > > compatible with the Windows ELAN driver.
> >
> > Are you at liberty to share the vendor name? Or should we mark it as
> > "Elan" or "Elan-compatible"?
>
> Sorry to jump in; this is Vishnu from Lenovo.
> I have now confirmed with the component owner and supplier that the
> TrackPoint reporting variant ID `0x07` and firmware revision `0xA1`
> are made by JYT/NDT, not ELAN. The physical check also identified the
> corresponding button/stick as white. It uses the same ELAN driver for
> Windows but has different FW.
>
> Therefore, the patch should recognize `0x07` as the JYT/NDT variant
> rather than naming it as an ELAN variant.
>
> Can name it something like  [TP_VARIANT_JYT_NDT]          = "JYT_NDT"
> or something like that.

Ah thank you!

Now with yours and Jingle Wu's info the things become clear now!

I will respin v2 w/ TP_VARIANT_JYT_NDT to 0x7 and "JYT_NTD" if no more object.

> >
> > Thanks.
> >
> > --
> > Dmitry
>
> --
>
> Regards,
>
>       Vishnu Sankar
