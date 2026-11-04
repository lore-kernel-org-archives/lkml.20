Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793813026;
	b=ugPKuOIjkYKREABbzko/742A1oejX36fvYhYswe/teu45r9vZZmgcsW+lqnReu/NQwcG
	 0IfrDxP1Ci0nAC0lTeVjuBIdHi3sSczZ1/xzyujQCbJw8phrVlVE+1Ul+rc01edWruhXt
	 1TJxogUzuRQtsDTqmmvrPChGbjRRunSsRT5Mi3+XjHpkZD2H2jgM+IVN0vFx4nSkVIEXz
	 bdHWIk706mw45qDR8FKH6R3t9Se1X1P/6uoQ2WW0UH2Lp+LOw2GwsysDkJZ5S62PDqb7v
	 X/E7yvik5EBBVDWeesD0kgBvs10BAv3YskSsgVBnl1fqgB00kVCW/S5zkRLV8SI2T3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fV8V1MxjeSoH0zVbQhUORe0/iwvgNHG47iPLCj2trrI=;
	b=dVkU+jjSUu8l97Q9417dNh6fME+XuAC01vyiSnorCiE/A35d3cOlCFSDfe7nyw2N4D2D
	 am3c4qqqnxhmniGwiR19d0q/vyyrulJnnlDEz6UF+mjtFsil2f452baQ4zkFZJ3w+Bgci
	 1H0sLiKk1I9ornYIcPR39H4S89xl/E/XXdhiRiCTd/SYUcrbqHYfJ1thG0bdE9Ptr93Za
	 5hZnyd8MEPOdRgQNZ3MCZ86kB4/SFhP2s0qPdL8RyXZAjnTpIoD7AGumH2PaQzyD8NCcI
	 LJ2JQECRoUKh6Bm0Ko0qQ7EsDK7z/bJIo9pKWvUqYcm+46W6IQ8lXpi1oKqsc7f/rAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=IeCsH8mb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BF606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5BF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=IeCsH8mb
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35b2c599f43so1960561eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793813025; cv=none;
        d=google.com; s=arc-20260327;
        b=qdlOiZQF1fOYCYYAA6P6CHGDiXyVMD7X3jIBp6ucGOoy1Cwx1acWzTkGbN/J3XwHMP
         8FyIyVN8dYwHTw8aQhqWXbUs4pQ3hf0U1RHC6aj+nZuMGtjZKZijVIgNmvrhmiuSM8Fk
         IfhCD5SyTc752dcR1EpYKzQx1becFUOFg51AlEOuYIujXOonIR9zbXytkywT4kTnx9mp
         3VBiYcircJ/F3g26LCCVSShSFLta6u5+pz/EX7XGtLUT4H8JQ63qsWeSVHNtTir2cbb4
         atN1d34Hxm5/FJBXYFSC24Y8OtSNAfZ2daX33dLfm2OhVkmItsZYrBG7p1E/FMLNN6mm
         g+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fV8V1MxjeSoH0zVbQhUORe0/iwvgNHG47iPLCj2trrI=;
        fh=F+oeCOr9o18maEXqvRM7FLo2B46u3pnJfk6S5edIP/4=;
        b=GQ8D+eiw5qH76leJn/NiYmop1vZyldK0xFTui5cv1malQdMov6HaRFlwmF8dO/oLva
         pcIC5dhIsN1BFMWdr32+Ceo/tlSF2NHquXTYD9bK4wmgzxA0mEXqTfjhkKMrX6Em8APl
         wOhkMVlVSNMhHm0/F55zS9vE8iC2Jikz3h5jl5vxS2rt1sMHVrVFDDdxgf7nsUlVmsXv
         EaAFCKQ9br1JRQfcKeo5krYf1A4k56UN5bX9yW83j5cbsDFYwe/ZSzuIZR6LnNZFSCaY
         F4eIQpNgifEGecUXUi2b+b4W3gR9kRyuFec9UeQp0ZByJJV31r+smLTgrYmnxwBjahlc
         GSeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793813025; x=1794417825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fV8V1MxjeSoH0zVbQhUORe0/iwvgNHG47iPLCj2trrI=;
        b=IeCsH8mblSz9+LSUr4igndTlZrDiypoMepmdDkcl9TOJ+foMzddVjTHO9gVodHgf9Y
         rnMQUPJv73OJwtTJCU0qy9VCl9pIMHWJLJYOT9pdIBTJPnsdStM+kDAz/bf4kFj4efbn
         LOXdpLAtSfcLf/9ejkoBU7zNo56Fh8Xrv5s7cvVUkgnG2qgReIFw1Y2aFNjShTS6Klc5
         vXt4RnPbETZOjxNj+C3uregnmJjvQltrNDLZTeNfmHHaatyXELB2FUzWKsaicBRKGNmV
         Uy1oYCt1lVBLGm7wq51RaJy/GEKcb8+RsbOPqctSr506iGZ7v1Nwdy+xq6TvwPdS2O1A
         QZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793813025; x=1794417825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fV8V1MxjeSoH0zVbQhUORe0/iwvgNHG47iPLCj2trrI=;
        b=Dww7669qO5YUZGILTJHnm8JJWy9v2bMslh5x8ZQRcIMzwFt+MzuQFgDSQitsLor/KP
         QyPswHHdHjaKdm7LhKVlNkB3ubp6ORm6aVUGvjGLLG3DMYA8j1Yjy20imqAXgezGD3Br
         bRee7bZW6d1V1SbLu9J0eHYBxfacNMF0CyI1uMkyUdhCDwp0PmLAqhMDZTBHrbUVCcti
         VXJzjtBmANoAhrjIqDu0DsklS73gBz9gfArpILfckDdMCGosLfP9z7c5DfEccSjerqbx
         XlNZ+RORijTM0EBMpFzs7WzQPSO8xu7f8jsjP8MKjb4xXb8ErDUotYB5srYiFyWc2lZf
         8DTw==
X-Forwarded-Encrypted: i=1; AKwUvBz0B4ffdCEOXpxgUtFrd6zptHQ9QPlL6/pMQUYl3Wdkl57xrTVofulsjIUsBU/G5DwLL1OZDpxSFePhm2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tpvtAES4otsEtGFsYGUpdkbzgBu0lwsLf/AOj1Ve+jBSh1Yj/
	BllUR6TdilYC0iSuXEsht+syCDYx12LEL3eVkCqYxllS2ntHM4MuJ8UWj2NPFeW8+V9KPuGhh2b
	kLTIZ0K2+9YtEbq+IHq9W513oFSIFDexK4fHSQTl55qs=
X-Gm-Gg: AYBFou1M0wQwj/ELEb0+bdz+PJ4l4az7e/qikfBDz9UPsXbMTUMtOGnKPjA0eTa4Dwm
	30F6GUslegHqVT3h4OSDtzCYfmJ7891PzzFmiR3+oainqvPODx+9Kd7YHckji9DiC5dD2LKMWZr
	w6YyjUrD2Y5H3wob/WjElfgwWujLik/bPtLj/byhm3fdCZFVSmFQEEvCYGLcS4gOvsWfogjBuQS
	d6/vigU8+gFQO9rIiBzabvhRsp6MB+zgM5TtBFGMsWf7GgdzFLKc0vReckVMOuW/14L9c+ppxsQ
	m9iztmXW6YHUM4GgQ5m06A5EeFQfUh5uxWpNA+GTIezqyopPxZKp/W+Z6jxR4oh0K13Ik+wc1dm
	Aw/i3k4sU0sDHWpytxb5w55NG3kzLda58cdyorfgJ0my424rVms0kwlQfNWAU1+IZsCB0uz+UPI
	tVD/l8sLZL3m+iUzaUKqlAuBU=
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id
 5a478bee46e88-36a423a3232mr29173437eec.19.1793813025403; Wed, 04 Nov 2026
 09:23:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030181512.2056056-1-dhu@x6u.co> <20261104075055.GL264423@unreal>
In-Reply-To: <20261104075055.GL264423@unreal>
From: David Hu <dhu@x6u.co>
Date: Wed, 4 Nov 2026 12:23:33 -0500
X-Gm-Features: AclHuK83olO4raQSHoJpMQkVWHs8sTlJrNh8bRH_U14zxtqke8g6eqmj0i5zA-c
Message-ID: <CABdL-LS6u9im=DsjnEJPGS3-3r1CFnoqL_c1gEM4qhTECWagoA@mail.gmail.com>
Subject: Re: [PATCH rdma-next v4 0/6] RDMA/irdma: Add support for ioctl
To: Leon Romanovsky <leon@kernel.org>
Cc: Mustafa Ismail <mustafa.ismail@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jacob Moroni <jmoroni@google.com>, intel-wired-lan@lists.osuosl.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hu <xuehaohu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:51=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Fri, Oct 30, 2026 at 06:15:06PM +0000, David Hu wrote:
> > From: David Hu <xuehaohu@google.com>
...
>
> I applied the series, but I have a concern: the commit messages are
> not useful.
>

Hi Leon,  Thanks for applying the series and sharing the feedback!

Noted. I'll prioritize clearer context and rationale in future.

Best regards,
David
