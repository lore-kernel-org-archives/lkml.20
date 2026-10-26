Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030071;
	b=PoLzCzTP6eZvOexisvr6WO+fF4V+zerdjR0xCTob+RQj8n5NNrzelZhdgtsLmnnAbpoU
	 MsNQoilqrGBuw0Yq3Tbnqu8WXSx5noSUdyP0TJ9eq2/fi3ouPENSWuvf2bc3+tVFx4Gec
	 6G+wQrh9WTSCZcfPtWSH8AtLCcwH32jOTZ6MTlI8iH2Io//7tyYd8R7eI3vxjSi5rIcsn
	 iD0xqc1Gsyf7Msj4vUseqXFYRyZxWnlIISansyvkLIRq2RssMtEEPKNYXNPeILGMBmq3H
	 GzjYEpFb3kzEOW80jEi7agnk2sjSnv03BGXibKrsDOUkqCActpLv0LWxSpKqPJ0sxmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
	b=zTgpHcTyS1yD4qtIOO5Brcbon4UNreL9xyW07dTQJoVp56Xil6VuCRxbOrVhv45muyIV
	 S8A/eFjFM2rrnQlBOTF3ifqemGfKtsrBRweLXaQcmL2ise5suPVTq9cgyocfEBZg9gdYs
	 hGD+R9yPuY+ri7CedtXU8dXcz+eTNHOYQF0yn8WYV7IEDBkJR0tH8d2rRwp9SNCIwHmo8
	 8GNLb8UVqlthON+htgk/ZrVd9NybELWw55AzXaSns6mmer7zTMXeargJyPF3/PhAQi4PG
	 GrtXEJ9d+d/qfRT6WSQ3fMWXm+drM0CpxJWax7sz77vWfs701ZJejtM9QlZyaIENFBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyaFVDfn;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5D1606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5D1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyaFVDfn
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so10687525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030071; x=1793634871; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
        b=oyaFVDfnJhNi0xtZL8JjXLPR/BF85zCb9JkvG2KlyL6QWoiY73Ez0mkdKjydkDlCmd
         2t4leyL/054cIB31SHTnLIbCVGAs7RaNU/wVjBwywj2lodtohWE4LxdRORCLEicTSMQP
         paztEbO/z5tA3aJxCfOEo7C0SwKWn95TcRy8zRWC+01IwZlj9yIQx+8XxBtuuc4juFdY
         9mTy2b6FfFAkv7BXni43NoF7XhtkU2vBEFg5QsLOTrnFfh5fGNyGb2KJdgEpqroR+8AD
         2AlxjB05Ap+zoVzVOxHje880MV4cS95L3CmB2TlJrQ/qvjcUzHk4e6ANvyv3ILZBDVmE
         r3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030071; x=1793634871;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
        b=OPJPGPVdFZyJBctMc6Lw7MM1CyTjgH9lXPIQMN+dQrKoTe2+12aeQLtPmayN0lpAex
         7tD0saTM23IcbzpaOx4MCA5PNCwM/n2eZ88KdLNrqwm4cl+sFHFSleiGhz3N9WRI/MD1
         CpFGSSsqLdxj2mQus4ELnGSEBzFaV7OIGxOH5OzpZpzSHUSjfPg4vHTCTSpMbJaTaNb2
         kBATmupmcATZnKOte4eDHL4FynzsjwyjnjB7DiLBDEW5NjOy0aR3czwZo4Cjk7mhJ5ts
         L8rpwm76JFx9rU8J0DIHVVYL7eLEqTbwKAYy/SfPg47wyqk7IgTHrDLRLZKl/PhmCqZb
         s0ew==
X-Forwarded-Encrypted: i=1; AKwUvBzSTFaHdDoVf9BLKNDvITzGG7kBM/InXc3Rwk+bAy7Srpup29UBkGwXj1QakVbV6VN018cYqqTY86CbrT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1wSpw9OKJbXLaljQIT6AJpZtSWrFr0Ry7Rths4nYHyar2Bfld
	IY/W9HwqyrYv9q1pcHYyWG1i121DdyxhSV9NP2J6bFlxgrewSmazeFE6xO2get2BUpfadA==
X-Gm-Gg: AYBFou3fktbULW/pCVAFturI+c/mJE/JBS+/h0aW9SI+4a7/7m0nYoZp+aedHVFUheY
	u+g8RwPWH6WMlh5GBbiPNTtw73PoP6ac0Cu4y4QMjxcdZB7CpYwUVBSIpMZHNSnvLtIZLanC7b3
	1Adn/Bv0FgQHHoTJqWzDYY28MPdyE91jA/HOZZcgVLCo7hwTVy7NOSPE8dgc0CR8KOu4JAzyF7F
	KYj/5+1pdRKviGI6VfgIBydIES3FjZCS9WKSZDupxcwt4WnnHaaUcCZoo9Qn482jfCT4SwT0o+L
	Gz7MrcU+Xc38liLNRs1jEP8ZvXrGC5YeOylfEW+g94RCy81Yuw+hlg3V4LALpOveu0tTcs5Lsld
	fu6JsUESEKmlU7nOpontgZsoOSwWdtI92Hvv0Nyyc5MP+YS2Ig/xJXtVkixf48FbA405hjYDtUg
	RiKqjuIXI81iBIz12QVRaL2nOYHWTueWJtR8q6BHzcRTxUd/JE6l/14egTqcK/LA1OBVTmLpmho
	jh01kGbiIgVqFlMKvYu1o3q+zFmBo40ICFbUZa36eYK0OmAfgpqKBOto9qrDTJz/gik9+Cp43Z4
	GmRnuRa9bMez63q76IpYk8qEA4bmoB3YQiYjGq+vEKDTjMuhp4Q1
X-Received: by 2002:a17:903:988:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea9c6c82f1mr52579075ad.23.1793030070524;
        Mon, 26 Oct 2026 08:54:30 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b221101sm19099555ad.71.2026.10.26.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:54:30 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/8] Docs/admin-guide/mm/damon/lru_sort: fix remaining grammar
In-Reply-To: <20261026144451.150560-1-sj@kernel.org>
References: <d054b7a2653a2ff3d419b689a50a53290c2cafbb.camel@mailbox.org>
 <20261026144451.150560-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985414.2.11997096580844017569.damon-docs-reply-04-lru-sort@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:44:50 -0700, SJ Park wrote:

> > Yours isn't wrong but I would make it:
> > +this scheme should automatically be activated and deactivated with three memory
> >
> > Choose as you like.

I feel my wording reads a little better here, so I might lean towards
keeping it.

> > My choice :
> > +Below are the descriptions of each parameter.

Agreed. The plural "descriptions" reads better here.

> > I would go for this, but I'm not sure:
> > +Number of times that the time quota limit for hot regions have been exceeded.
>
> I have no strong opinion.  Aveline, let me know if you have some.

I think "has been exceeded" fits here, since the subject is the
singular "time quota limit". The same applies to cold regions.

Thanks for the reviews :)
Aveline Noir
