Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268496;
	b=FtvjlfJI/qTznhOTrNYmOIIShMdNjX54B5jLVnsGecTymCkqIp/xPfhrg2T/rliykKa5
	 lz/PU/m0tN8KY9zLm/NRz4oOwaBsjSUtsN99x/wYEaBnJV1TFSA/5ogvhcOBCqs+jxd/f
	 kNQFSAWs5dswHrjA0WrGz3NVlZrjXSrUGHttLx/fXiKQv2js7KAd/V8HY7intaBDdwGSm
	 MA0T3PipK6JdFCj/5+aNv4/3QlKfshEn/Sy64fmhUCd0WWbwcXdD75S+Ceb5z1TbHAUOL
	 yOyVRiuZ5V3hBYhpLqCi9jigajz2F2e3cq0mhhDamCIokWj2GdW9+42TWI5wIFHKv/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YqJZ0P7+7fLRIuROPGM5CtyVNeaoNZ5CLQZzkAwMRGI=;
	b=rDFHE85fETpwWS40roHkFpT4UdIB1lCMaiDi81gOSIW8VvS1l1hTdGMarh1zS4oaDTkD
	 BMLt1rsHqH7MrgeKN1CPwNJ2ydRvMk2kqfgpLnTowalrSKcoalj9r34/zTxE+TC2pknhE
	 u44L4jMuT+JtZuSn4jY9ymLU/FuQmlHtEZJ5r4uct8mA4FaLdaaVoJYKqWE+gUwoH/R5N
	 iDelJp3iKBMxc9Zp3lVXaxqTXOjbJt283Ma7I8PwV9MzOEbbsuMRca8fza1sr9kxdI43Q
	 doCy5HTEXawJnmuLBDskN0JU81n7cae+/nDvEWq2reCuCFh6TqU5GUfvghPjIpV0yPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W+1f/+mm";
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4318A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+1f/+mm
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so2028446e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268494; x=1793873294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqJZ0P7+7fLRIuROPGM5CtyVNeaoNZ5CLQZzkAwMRGI=;
        b=W+1f/+mmtUVeicMuk/ydwLlfIFytKQiJMmkoEo3ynnRRfaKT7HiLSfDiAd1/Y+PwhD
         8cfrCfRXamJpaAPt+sWuYsp7BdH5yz6uF3NU77u0Zj7LMibQRIglvylRCLJ0Qntw7rM2
         BbzvZSf5xbOzbQHuDIBrzREi0Ymns/KxwgPqynRUeTyJI+rxoHwyStZYDt7QrGJ2Hegd
         WwS3AFgQWxpcrih0E8/Dm+q0179BJUhZnSNN0Lgaw8UxVWfyauTB3/Q1gcCe4/aTuHXP
         DI20dQ62MiGtD07UdkgLwuEEcMmCwBlFxBXbVPyL2eFRAKI1y+W33XmqlUpXNupMzcss
         ws9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268494; x=1793873294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqJZ0P7+7fLRIuROPGM5CtyVNeaoNZ5CLQZzkAwMRGI=;
        b=0OaQs2wCJ/GkEtYWUrtGkABBzx9c2xofOfe2s3Uo67APW0yR8GJUTECgOSFv8RyS2F
         d/qUM/I8dHsdDJ5bTTbDN8HyV4iwHs8M/xexS+JewdWFMYoIW6yjOb/8x2ZqcgfHFO1P
         L20HvoH0jLszXldwvigPLg2CwzliNulqL/loCcygIF1hcpsGLrC3TEETxdpcMdu2N+FB
         uJJGd89fPmRyLUmnU/L4Ydl0ZvWBF1PPcFdTdyS6D6W+FgkCVrWnxFtl7bZwXtdxY05S
         YBsfrB2jyvcZeXxJKuq8utD4KLRcFdPVpAC7MJDSFqWlZHAeofYZsik7sCPfU4W5W7M+
         30YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTI8vZoUxhRo+Rz0HB6QovlZ+WCRR/n3phEVlh+AOm7AXxvOgll1QQtB+9t3I6oia8Y/aSCrrdN2CNYng=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXw2JDxzk+DAD1nxIGa4mrmRSIz4OcFCcZuFgj3egPheqnT93g
	KdQWKxoqiY1AHMfohMcO7EbbJNgYyYd1mkHZ2pKzH1jicDeLH+thV+Mg
X-Gm-Gg: AYBFou2IAsMk/cZPMXr0s6bWDKGlWokpnnNmGWDhXOkwePfscWCle6s5juz6Zd2vqUi
	GkWQp6/TMBzQBvGRGqe56aGD6YkRh56DriPqx/7/BgLxLlgWtmco4wDmmifmuVjtRV/TQAYkETC
	WxnedgdCyRYOBUSZItDn9adLcOnQhs1MTyEqp1U9/xc3VEXmvCAYnKGNa1T+V+5jiFjFJ5707ej
	vACiedjRroXcr0iguXez6KcSqSgYHl3bp+es3JAWuYKhpzsh9fSSnUTY+YoxMXmrn2tuIn3dNau
	CWXwC0p7u8kXzBgPCkxROWdIpAoTmAdT2hEON9QNiJCYq9ZUy/72y+bjbyI32s2RE6bk4AvNnU2
	xyCM+We6M6D9GM2ESVWTm3oWKQzLH/eswQy8uLQQFr1vUEYSDKO9YnojaHXe/aEEjbyBOefVCXo
	HfhQwFI2n0YVwg+y6Yq/Duj75sb8Od2QxfUb2IF9vdRT5IlNZ2QDlvwrtlKKVsvfIV/h2H//1kG
	zikEUtwrKhDIWQjIN23IIZayipYP0w/TA9BGRb5qj4H9iRZiOaeP4AmXXFr6vHc5lg8MSdaZKmD
	yt0VJoqPaTwNMcj/OJAsdmblVoMcCfNJqKentW5AGV2guoLGEVridPeI5mBJuiHfUB4X67VZ1iv
	CwdiP
X-Received: by 2002:a05:6512:2512:b0:5bf:d56b:a71d with SMTP id 2adb3069b0e04-5bfd56ba77emr273419e87.46.1793268494124;
        Thu, 29 Oct 2026 03:08:14 -0700 (PDT)
Received: from pc636 (host-217-213-144-15.mobileonline.telia.com. [217.213.144.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5bb57asm1109637e87.74.2026.10.29.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:08:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 29 Oct 2026 11:08:10 +0100
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "Liam R. Howlett (Google)" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>,
	Baoquan He <bhe@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>, Michal Hocko <mhocko@kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Graf <tgraf@suug.ch>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	Lorenzo Stoakes <ljs@kernel.org>, Chris Mason <mason@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>, stable@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH 4/4] rhashtable: fix vmalloc() deadlock in atomic rehash
Message-ID: <auMbCuecFeRmBFSK@pc636>
References: <20261028154218.1668182-1-liam@infradead.org>
 <20261028154218.1668182-5-liam@infradead.org>
 <auKshDXKQXt1kvjy@gondor.apana.org.au>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auKshDXKQXt1kvjy@gondor.apana.org.au>

On Thu, Oct 29, 2026 at 10:16:36AM +0800, Herbert Xu wrote:
> On Wed, Oct 28, 2026 at 11:42:18AM -0400, Liam R. Howlett (Google) wrote:
> >
> > Below, one CPU adds an FDB entry for an RTM_NEWNEIGH netlink request,
> > while another CPU is inside vmalloc() or vfree():
> > 
> >     RTM_NEWNEIGH                      vmalloc() or vfree()
> >     ============                      ====================
> >     spin_lock_bh(&br->hash_lock)
> >                                       spin_lock(&vn->busy.lock)
> >     rhashtable_insert_rehash()
> >       kvmalloc(GFP_ATOMIC)
> >         vmalloc()
> >           spin_lock(&vn->busy.lock)
> >             waits for the other CPU
> >                                       softirq: a frame for the bridge
> >                                         spin_lock(&br->hash_lock)
> >                                           waits for RTM_NEWNEIGH
> 
> I think this is a fundamental bug in the kvmalloc non-blocking
> support patch.  How can it be used at all if it is susceptible
> to such dead-locks?
> 
> And if you can't use it safely why don't we just get rid of the
> broken kvmalloc non-block path and have it always go to kmalloc
> like it did before?
>  
If we have a look at this as we did not have vmalloc() here:


     RTM_NEWNEIGH                      foo() or ...
     ============                      ====================
     lock_bh(&br->hash_lock)
                                       foo()
                                        lock(B)
     rhashtable_insert_rehash()
         foo()
           lock(B)
             waits for the other CPU
                                       softirq: a frame for the bridge
                                         lock(&br->hash_lock)
                                           waits for RTM_NEWNEIGH

Same issue?

I have a question:

GFP_ATOMIC/GFP_NOWAIT guarantee they do not sleep. Do they guarantee
not hitting ABBA dead-locks or they are not interrupted?

--
Uladzislau Rezki
