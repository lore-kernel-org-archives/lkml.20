Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794607916;
	b=2BckoRRsRnh6vFv2mSfG68HfYBgnQ70dxg3zuqFP5X7KSSigkcKJONlr6KKxTHxyfbAo
	 ZGDFlANoqWOKr4BxzMsV/RS12kQIS/qXZm1CEksTNa47wcO/bU40i+qyLQcU6ht2IqqjQ
	 JDnJKyk7Z9k8SPnRU3EaJGinpFkblkdWrzgCSqoLBtchEH6kE7Om6OP6irdb26UpSxPD9
	 QiUgJIx8iuGyev9nFTEHwNRDl+C37GrUQCOgQoRbJegtO32tRAb+6UR+ySSlaxk/x2wre
	 46yWMI0Wxld/5k0O1nwhoq2Wcj+0EmptFbO0yhGSM5KoPxRAk5aDQC99alkBySIHKZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ybt8M67biDsHhGooRRbdUNrCGrHYGM9IN8vEnin7R9I=;
	b=Rtv5JOPV/7+JnWrt/ksn9oiBeeUjqnI2ujJ1Gg+pYJ13QpzDYwF4K7EP/44pRA2ag4ob
	 ZOkI51fOZVpCp5Tw2RR00x9fRorV/j8KN2tVBY2+QN+QkfnTZvJ5LCfeNmjeUln5pcBA8
	 y1uHO2pZnpXXh8cNmjoZ26VlthpkOnBJoP3bAzrhtLzjUZEtK+VnUjUOerBPJaCyEc0YC
	 zEOQc6XU2PT7y+w6Y6s3CW5iL20qYS1Nd7/GPm3mPtlgCE2+VNBN+MnwOVvw1Qeg7ZERS
	 duzIYRge/Z6nbVLn9euQSfbH+Yu9UvDwf0PlEVa4pI9RGNgvJEuSuFBzHJ9QS/u4vJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fkKGGul6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277A606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9277A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fkKGGul6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c169ae1cb26so334893666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794607915; cv=none;
        d=google.com; s=arc-20260327;
        b=AvlWZ8paaRaK5T0nmPl29Hh+GYsZLRdrQrpRVSJCyk4zNNLhpCu2VK0K+YfD2+Peem
         Zvdc9brrZp986jiZbBIx9zoCumH+HewjVXWN8Duy5CjCAuaHo+wIUXiRozB9IV/i8vPN
         rxxOOkBSUbk+wv6YnSvbV9Z7DTYIAIR4lpHSPke/GXebsxKbP0AC6RI+D/noy64YHWEX
         /yMRLgFXiQA/SpJpebvIt/rY/ZRH9XUy1DVvB+w1lqK2rS5sBB/DQ528jePvRM7LFRh5
         ofC5/t1yyA1hKAfUnqGQjQLrdXLA7rUUsU7X6mDO6lVSDslDmp3ytWx/UO5g0EeIXdTQ
         W5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ybt8M67biDsHhGooRRbdUNrCGrHYGM9IN8vEnin7R9I=;
        fh=fwkatdIBQSVKb+eSQiVWBjXOJ1JKWJh3zWF+3mFygSQ=;
        b=ebyBroL1MlHttzjV6/iPPbNMblMzBnHHAwzZIbIjBbw00oB5YBtbf5u2v6gU5q4oOn
         P2pWF/de5RSBl/7KeQW0PBs9xXRzFaxesdgghbibDQ3gODgg3taI3jUlajPrl7Wp5n0a
         iNbgtr4zsbblAGeeysojMzqxflbK/IkT20uQAqwM7pO4zwlmC7DJTQSQuZCs0fbvoXbc
         oaxmrvPZ1/29x63YUDd1us//MD1+2zhTFTeayWboE0p+sFJ/KSnhiGu56FDXGo8oP7km
         hTX45hJwaZ6qrYanDosdJxHfe6SPI0SJeWhxAm3dzuV7lT2U3QLHXVx/yPTZqqBf6BvT
         gl6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794607915; x=1795212715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybt8M67biDsHhGooRRbdUNrCGrHYGM9IN8vEnin7R9I=;
        b=fkKGGul6k5DfHm/ywwJyW7SQPx73tf0+mO8q7ouVZBy4v2lrAFxYP4r91QXtNUL1mU
         irdELIE0V2E5fWF1wUnwTWRviflVxu1d0ac1q+8gI6A1K/9zdHoBEMmjLPi6Jiiqqx6i
         NmtRAgzjGp978IRelMN3Wyj0kHipRDzJAhpAvG2r8jOpTUOyfxGLBls4G0k/XsAXLw2F
         U+qfBJCSwcOo/+4LecrpNDbXQFRrVT0Q5GxyNq/UYeU+4nnfe5kaapWHC145/30E+EC/
         TYHjPXslM+ZoS5zYRloqlvyQg/hPfqS2ZyhiJmMZCB7j9md1jhBttd/Ctb0bS1TBgEBj
         fphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607915; x=1795212715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ybt8M67biDsHhGooRRbdUNrCGrHYGM9IN8vEnin7R9I=;
        b=x+EgSzYnIgo5zsF289NclP0eFLLqyCEC06am3nRc4CSNPZfRPto+NNCO2MvVHhq00m
         NirtwOjuOfdP2Z1bQaxV1oFR6vs51DfVIgYIgUrelq4TFt51mg+cYLPybETJ8BA7hzGz
         wbIKSUEJyKkqtjjXUxI6GM3hji8K4RukIYSJLfrDyza35M2AKc7SLZmL2I4+DMZi6jiW
         a6lwhqVoLUEA5fLHIa4yQHOShnoO9V6ZUKzZXmSPLrvRrdtF++e1KwasR/xJ7OqPGeNW
         4L231sdIh7e2AYRMz3itrSxtp3HAQnWo+dkAXaxzx3zqchdqWyKojTwGSLIck4VdIeiy
         iluA==
X-Forwarded-Encrypted: i=1; AL+hErFYs+JBfbSndEiPhYw1jN2Tqn0OK6B5x8rdx+aCC0RN0zW8twRs8P05ErQpcDmHArHYP6dPxJvmrwgGXFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z//DXeBlc9BVyrg+R59JyXMcw6mIiRxeFTT+Tu6BVhK46og+fZw
	AP1Gyei8RbDRXJ6o9kBuCZgyyfbtx9uf+8KInFc1x+dXgRoBjv1KGJ8vQs3d4nXe4tPUhtkxxNP
	3Tl5/MWqpNFvc9W5sCodxi1fGMxSVZ26qi4IY6kgn
X-Gm-Gg: AYBFou2RphJLAVSuaEVZOOzSQLHwqI9tgfW2dPYsLkdnj4QddaxyrG1/9PmLZxWX7lP
	k9H7zYZI8o665OkEknXbPozlD2wcLQTilYlqFVq4tBlNiDWQGRd3iy8aocehjvVEWFoqSOw+QT7
	e+mQj0YR1K+KG/uWuBF7vI5gmcmBF4epalz7Gtjp/rAawxv1QB+/ZX2rj3/WeolfOrBBmPne5be
	qcb0xy56rJnEsgDKqqvVSc1RpZVMrQrD/B/Wp811aQ89vsecPXdmn61L2/fiYrACikpWCul5IvP
	5ZEQz2uni+tMyAvf4I5n6uKzGNhynDUkesmPn3oOi2G1IFPhwbNJOtGokIn1ZFXL+9PRoSHq0va
	gRGnZLH429B4b+pGPTIeZxxlszKJT9Pt713hsMRk9U88FD0EcyVvfi6R9cwic5fwoivyM
X-Received: by 2002:a17:907:9285:b0:c49:8bf8:a7a7 with SMTP id
 a640c23a62f3a-c50963173bamr342209766b.7.1794607914514; Fri, 13 Nov 2026
 14:11:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918025416.604297-1-dhavale@google.com> <2ednz67kpd2ikrnerrmnvol2mdfntgqhakuoiu7x4cnrlpiugm@ojqolvlfmpnj>
 <CAB=BE-Svy3yoG+nJ7Z6Us5GG2Rj-7dyCY+EMpR9Y+PtyXUKnCQ@mail.gmail.com>
In-Reply-To: <CAB=BE-Svy3yoG+nJ7Z6Us5GG2Rj-7dyCY+EMpR9Y+PtyXUKnCQ@mail.gmail.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 13 Nov 2026 14:11:43 -0800
X-Gm-Features: AclHuK-6Nfu6yXgfsqoXIuZdafpVDjnEAv-_a_h3e0B--jKTepPtMeiRqE-zaPU
Message-ID: <CAB=BE-QiSn5N=R4aAXSzqvvac7rUb95grTidv6DVfKnjha=drw@mail.gmail.com>
Subject: Re: [PATCH] ext4: fix race between inline dir conversion and folio read
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: kernel-team@android.com, stable@vger.kernel.org, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Baokun Li <libaokun@linux.alibaba.com>, 
	Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ted,
Can you please provide feedback? Looks like this was not picked up,
makes me think this slipped through the cracks.

Thanks,
Sandeep.
