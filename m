Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9171D3E7BCC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143574; cv=pass; b=qQ3vp3yOnkCrEaT6oBcQn6d+K7DzoYf9Go4XO0t1yGEhpfdkk1uTcO84PFJuif3/7QLYoM7T4x0Ru/xgDkJaQ6Oio9YgLfIq4x6Et1ORMdwXuViUCRYUbXraDGrH4BiL7Umqz03Lb3SGinzz4ptNER5iMav1dFzvPtB5/PlsqDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143574; c=relaxed/simple;
	bh=ZjCCv2vHBwi9IOWqvGjy/7XdqWbDo0x6Omk32EfPwq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBPLjPUTePssm7ZitHOXHptx/Lqknz9Egiy2cZ2BE3gIYwd2TqzE1w/AgS7PCttN4h6b5bHWNMd0AvGxg4g5JElqHck1ThvTB3wEy3mh4ciWvTcZL9nFsrSoAM5k1Np3CmQRlsiz707LLKKzUBwezifQhgLrrsb7wcEJWUt+Kjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pG4nQDv1; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pG4nQDv1"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f036b17easo2179340eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143573; cv=none;
        d=google.com; s=arc-20260327;
        b=AtdL3WEzsiyUoaa87j9BC7J28KPZwi3Z9G+qc6IJ6QHeC6oJlXTwPEm3a0zJJb35LD
         Idn/LJH9VREPFh5g2J+OkLSXbIwtHVJ0aydXkIM9hpcP2tW/jNcHM01+0RXHQ6YXGb1i
         R2UdPMVcv3rYRuCWrsPPQetJjm3xMdGIj1IDV0XGSiUilaS+9sn9zfkQhbL7XFyO3NvE
         cy2YI8SBIGGvnTlom6h6HHljKC6EBOQbOT309EPA+2+PrkTBmzRDTJ9faMzyzR5BDAWt
         8a3h5dHn7e6GtmiY99uTnupZxEeevKcf0BcBWBzDvqpLk4D3PJHJUWlcKEcaOiuqnOnz
         mCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        fh=jVyehuuyFAjx1Mg3YaDEwvj8R1DFAcZ4ejHWt3bbDN4=;
        b=QJ7EzR6YiiNZJTcSbp9SA/up5uROok3BXv/yeVl3nMEJrwqSF+wFDAyAlBpUIAqsnS
         kLOmiqpZ6u5HhYd+nemx7+005ttW1yVglbys/tU5i/LqTSkTS/ydAH6o1Naiw5fNN7KO
         rHDEA1j0NYVcGgI7RIJRSBABmjaWVdq6zwygqJ2awTzNR/VA3M42I0c1ibla2vHWUzDf
         PAcWL4GLtPf4olE3xKCs/r0IEoGxCfnB4ZIiqyQKWdFHiYUwj41pEj54fBW7TUyGKbSS
         0Em2T8BN9NpI7djPpI+/16YPy2zldVOdi5Lhkl1+8x5h8DmBAWm4FM4e6LnbkmgGpUX/
         OECA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792143573; x=1792748373; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        b=pG4nQDv12EahyCrQYEQrDkAydQxgNrSRZfZj5+myHy3cwyK7yYSfto51Jw9r2He6Ed
         38fNDs8UC6D++3SZ7Ubj2N3ZnRSvGEb7iex+k81vQw65I5fRmR79oZUQcz3gj6iq/cqd
         Wd67T/dEanOU/JUfa0G0Vj5yOzfmeoRFMs+z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143573; x=1792748373;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        b=j5mZdf4tDVIrbQXcUx6N0UShfVDvgg+wU0DKBUOy/2Tyox0UcYb6Y88Q6cI7BABu9a
         oCsimD/0pI9tvCe4p6edRs2rmjZ1csF9ZGwtLOWXePyxeEfa6izeAlnm7u6DvFIX4XXu
         INxQjOr1+hQ29dM9eCBL4+rRDCgBkvGeAGSKI9azsdDr3hH0xuNi10wyL2WHZ/v57THE
         xOzD4tGiVYO+giexYUHT/hgNM2Us8lTH54aTlSxLWINHXftqRwSGoS2h3n5QIe266asb
         QXcGpU5bqkkz0m44hU4GfSXWaB2t81hGgRsM1I/MunRsE8uLQuhVGOhCnPkjCQcGsU6q
         jnyg==
X-Forwarded-Encrypted: i=1; AKwUvByJpNXXc5wClH2rI/LMi+whTlSvQI6WFl0yjW5UN7XWls2RaiG13EbJLQH567+qXWo7ysjReSqHq3vzD6Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBIJ3Z3YJNfcPOgL6LcklzKw5u+2jS1tlc1Bwyl84FihVsgjak
	bmNE1JBRPXJZRwMZ4GgDOR1korEgaqPZ5nuHKL343w1zTzF097nV/Yq2SOLhGjVqoS/9oA4CmjA
	dbkp4iq9WJqATDBn5nRv/EiuWysGu46irCsu1CmSLrg==
X-Gm-Gg: AYBFou3ebiPGRW/9DoePtmPBTPKJUcmAKjAqgN+PeIML29BirTTU5iMuVlBaO1G6UIZ
	EQCtJ79F7e4/OlskdRVesAyTGL08Jq4uYUuracASuyUMUp4tfCZ1PbRyG27HnrYCSvX74RyRR3e
	fWuqCRUfovYm3N4oUmZkH2pk40qAm0HUb0J6QJAt5rHqBcluU0cS96FaoF5NnHpstroL2xLKtr1
	ztAYb/yZHuSRNj/7hvxqtSjnAxETbnypIjc7KY02n7i3ZkoiKgGWN/jQ2UfvSbkxLu5QrKNcn8t
	Vw5+IsO7YDyeAd5o7uCxe63/PSIGpeuLhwRpr3HPOiuLtG+GLF+lpPRsAgKEyqIqTzwLTfTwBIW
	aCeBw/Ic=
X-Received: by 2002:a05:7300:55a5:b0:35a:29b6:b466 with SMTP id
 5a478bee46e88-35a29b6c486mr18778429eec.30.1792143571660; Fri, 16 Oct 2026
 02:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929032927.1451259-1-neilb@ownmail.net> <20260929032927.1451259-3-neilb@ownmail.net>
In-Reply-To: <20260929032927.1451259-3-neilb@ownmail.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:39:19 +0200
X-Gm-Features: AclHuK_HY98FdVFdI2B8_Xyq2_mR-0nCvi6kN-LGNYhpYxSjTYAUSIadCJthF2I
Message-ID: <CAJfpegtG2NGxbUjR-bifU4aWmswocYwZaxpvTSFooQ=F-dcWBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Use d_alloc_trylock() in fuse_direntplus_link()
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 05:29, NeilBrown <neilb@ownmail.net> wrote:
>
> From: NeilBrown <neil@brown.name>
>
> fuse uses the results of readdir to prime the dcache.  Using
> d_alloc_parallel() can block if there is a concurrent lookup.  Blocking
> in that case is pointless as the lookup will add info to the dcache and
> there is no value in the readdir waiting to see if it should add the
> info too.

Need to send FORGET in that case.   See this sashiko review:

https://sashiko.dev/#/patchset/20260929032927.1451259-1-neilb%40ownmail.net

Thanks,
Miklos
