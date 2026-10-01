Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF184EDCDE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850462; cv=none; b=WsttR3eJL1KF02O4PGE8DLAeO9MvRZzr3piEK1Niqmbh4yYT5O8Fx+9hclGM2B3t6WJdd5jJBM1Hi429mVbN4XPEMF2TtbtKzKv6QgCuqRLrsEhWSMVv/qUtgMfgYhZfSo4zkJUYM1UwFtR62hEzrM7BpXhIpAmZJIMxbWnZSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850462; c=relaxed/simple;
	bh=2y4gEjNzgA3MrPbQRg5Ifw5WWUUepc12pSJtVJWCuNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD1Unm8GrnXwkJ6iHV0W6dE8lkKZ+LGP8WvUZR5xNHD+Vsawd9wJBQ9igqDfW+QHt1gksfahAFJJGCSCMKGsC3wOXBlGXZXvgn+1ibEa7XywN55yEhzwjF4pOf8S3d/fcqjMrx+9MBxPe/McixdB25diA5mW1X4uP8T2l9ZSQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Js8hr/gx; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Js8hr/gx"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so3017856b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790850460; x=1791455260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOoZbBrkeSpdFA8vWrJINhow0mO467LA30uvn4Xle+I=;
        b=Js8hr/gxkm08MeaRvuDgNr+iPda5i6qBPBSUP4g0y9i+FDF8Z4TalxCSF+ZgmaLVo0
         mCOqmMVQS4iQ5wfblzULoMqXCcV6ZJzCQ+w3+v1UOngMbAcD/qhk9emqRnzCBxPKAff7
         qJpaxxjyfXiO9jUjTRt1VRr2vv1ar9O8NF4ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850460; x=1791455260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOoZbBrkeSpdFA8vWrJINhow0mO467LA30uvn4Xle+I=;
        b=tNNmodoAiOaMosMdCXa3SrpSD/DVvxj337nsAf/KlLkjIoeDqz0DqqDp9lN7TX+Mkm
         G7hUl9WwOwkjs1ohmgOHlCONlTpmc3RIpitZyqeTOUYpLUuiIrWb3dbbrGG58MOMrYW1
         ovqheyiWCQQIYJY7MsK7wGDG6kJe12Acc0f7oS8wk+nnseYTJ5ln5DhaWlCwHN5Iy17+
         OE3hK8qZRvqhiY9LBel3LPICJx2kcjiZzsOOEAu5ahidLJYw3gZT0sPUliAwOGBbhhbP
         HBHP1qDH2t9zUGqOZP8pfeN+tXyesWYbwGH9stXqLBus66Ny5IJ7GMIn/0YaDO4L9vd/
         aWaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLvR2eMIhS5RPKXeEOH/vzNy8Cadckl2KWN4Hq1BC+MIeVjOu8tLdNbe5aaceQyCxwAhFGrKcdD65XY/s=@vger.kernel.org
X-Gm-Message-State: AFuF++lbo/ItM+QU4sra7R43saFK3OHHOM1ZWnRJztmoIjiUZsMWk+GF
	f2F1s2R0pPrf2DFnflHC4NblJpT4rze2WZ0TNpKuhVO6h2S7XMKR5KHw7CcFRJdIcQ==
X-Gm-Gg: AYBFou3KnldUYn2ih5CtZGaZmTg1Rv6pBpchtgFYh/3fexrlHHDDATchzhB+KVb9k+h
	T0j7WQEs4MmeJh0lP0mrYlqrIb9w7dQ69MciGYKFKjHOZoBi2MPsUEzndN0OOEXGqOD+VGYaHLd
	tXuapoDdm8m5EG6BUIz68KQR+mBaAEjsVT3UMM8pFQwiBI1sGsbz/3ngYwJs0SDMuPUk+O4M4TS
	MfuZR28URyvbU/JidBsb753+ZfljKvaEyVKgAsdX/vy81QPHKbpWydUgBiaGlH+/gt0QylGuNmI
	ZMD+xcljriuHudZfMaph5rfeiy5LVF48DIkvH9pqY5i1pjkVuAPwBMoHY1RXdI6BoroSu41D5BB
	Tci7ZFjfrT4tm7NcpBRX08m1WDW3MFTWD5TNoXCbBMnrnB95G0AvwebPjwd7tH+sP6Mn25mZ8fy
	dGt88iAKEtWmWhWu9/xBRJ5bbxA5ENpPCKRRNf7TJniGWPDzH1Kl5v+Zhl5r7Wcy/dGgYhmXUIC
	vpVcyyn14TwDTIApNspQg9AG/kbwZzHjWGPeb8=
X-Received: by 2002:a05:6a00:b81:b0:874:705d:f64a with SMTP id d2e1a72fcca58-8874bffd4e6mr3058007b3a.44.1790850460353;
        Thu, 01 Oct 2026 03:27:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:d042:b5fa:ebeb:ace6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818719cc8sm861475b3a.16.2026.10.01.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:27:39 -0700 (PDT)
Date: Thu, 1 Oct 2026 19:27:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ar4070oH8lRCJMRw@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-dramatic-hasty-pug-68ebfd@quoll>

On (26/10/01 10:51), Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
> > Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
> > zram can expose qpace-lz4 as a selectable compression algorithm when the
> > QPaCE driver is available.
> > 
> > Compress and decompress operations are handled via the QPaCE urgent
> > synchronous path: each request DMA-maps the source and destination
> > buffers, issues a blocking hardware command, and returns the result size.
> > 
> > Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
> > ---
> >  drivers/block/zram/Kconfig         |  11 +++
> >  drivers/block/zram/Makefile        |   1 +
> >  drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
> 
> So entire qpace should go here, no? Why did you create this entire layer
> of indirection, singleton management under drivers/soc?

qpace seems to be standalone/independent arch/soc specific, and can gain
users outside of zram (fs compression, zswap, etc.).  zram's backends
potentially can disappear all together, if we switch to acomp crypto API.
