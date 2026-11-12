Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448613;
	b=NTcvtT4h+T6WnAG+F4yunaGJnSPk1QUkK4E084A+JM7TcedAw178Ok6T0dASdn/ZoiNm
	 pIgWCdxl+gfl/WVEhslvHnIjJlGK0lrEVeD0Mb1VPSsUVFkbV57wCmGBNdACGzQhi5uwP
	 ZzqTPS2XbvNqB8B0s1iO4LIO50f7FN2KY1hJUIFbDcFX1xiHs+4e2mbvyAwiV5rHNvT6M
	 z4kQagpVf/nKLLmfhwMH7fd//+3SJM7lUCjFh+YkLBd+ucmpLiYwxHkdivnwkD9R8MUB5
	 WCVTrNtqCV6kzvB0QphoJ6xjlD43YJuAD8+pES9mTWmzgoUCZUtyJe3xwrGee/I7amw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=vZqO0In2n5tOz2hnsdR3SO6+3JMhXipUZdYYnYL8NEc=;
	b=0dgGNoksbGyLo9NY3hQx/kL/8lDIRQIP5850lnTeGgJPOf4A0+w6n78dse+i39j7s+jp
	 vwVAKtSfmTJpi3JMLGbhVR2z9bVyX9g3iwhX8nDMg4+rWLyV/EliTzkMZS7wIm+SM9Svi
	 bohcaVf233IuP8NpJqto9+DmXGRM59fEAEEO7sbXw+FpfEyA6u+GJeLCcnfG5kp3RC1ES
	 XUxhoZOw72MLbJARui3c73OboEaoX02SfDUTJYEqQ5rxYMwvM5bq2vFzFJHbbllFHPJPF
	 MnwRTpXYYTaJQl+Q75j3bwZGOE8oeyxLlEzHjBCo+01S4k8VDDzmCQXFcfoaQMEfM7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk0kM9fR;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42199606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42199606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk0kM9fR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37198ed3727so499719eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448612; x=1795053412; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZqO0In2n5tOz2hnsdR3SO6+3JMhXipUZdYYnYL8NEc=;
        b=vk0kM9fRQhoMcC9QiMfLW4K7xPOuCg/X8XmsXYEmu3stw1OxEyle4Z+xNpQ2dvjG1e
         RdxjOUpV4aM8kZZowTz1yGKr93mL3c3Dq57yD2iohR+0EchHqXD99fAGXGgcu4a75qRK
         B8QNJUe1aP1AEwLAVz6aaU8u/lvgdusTyLhFmdYaI1xkOCMMFFp5XRVtunj3HbdW77ZZ
         H4RjHF8g1QivxHLjo7T1dU7CVKJeNiKQt4P8nLw/Hw/wDLrJSEqzntzZB02fm0GCYiyz
         QUe8yDbWiEf37aDUuZskHYfZfsG5Ii4sJRBPpHJk2VFyh6m75F/SLPTtIJQRn4H428OK
         1LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448612; x=1795053412;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZqO0In2n5tOz2hnsdR3SO6+3JMhXipUZdYYnYL8NEc=;
        b=Y2FtqZwaPHQkVLJY65v6WemncJInOf38zWQHM5N0jqT6GK7QEQNNOLWDFGKLn7lKUc
         fTD3waJAD1QdTpMCBdCpNG+sV0XldEI4r0qMNslayghNFPFQ7fm4bsqUzPvzkKXL1tIZ
         ZE8u4owtkraM1feN2vsb3KIa7xBPuTt40eUOrffUCiPc3ViSK2vghJzCmJT8ZZkk9Tt7
         FHyWOJfsD4TeU1iq46Vo1E3AvVb6Zz6IYm3+ccVFmYLs0zmxuRMG50GGZHzSC+4ylh7X
         QHZJ/xDmAyCMWHgzsVRfQryRF0y5X+ilgd+H8zWBSusbOiZoSbpaSxg8ZcfVKsrAmz3g
         8AyQ==
X-Forwarded-Encrypted: i=1; AL+hErGnqAFTDRYDOn6i7BxytTjnBSVuaJF0m58UZbAqY1xK+PsccaAxiTAe92pGPrE1cYk4wpYJJV//eYBAD54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q4J6aOph2riY8i7NYZ6Ez7xMOYsDd+xMzEh7JPb1vHX8Kge+9
	F/cGk/R5MG1kMjQJD2Nz1VROOp2jMF5a9Z67cLbS3Z3O0Jd+yIvhSCq1/bXSwnps
X-Gm-Gg: AYBFou1Nd3k/zNYnltOvxH0gnYRETt5vqshCVIK26Np9k7tfWDzpDDedKGhI4p8gzRP
	ghmXstkWWNlXA+6QtTQs4ntRGYh+QutLEnXz9IQHmFDwzRn9mDrpnqFmzmBcTlLptePp5oN0hvd
	2i4Q083O332tkILUJ7ESSJcM8ila0UUVZDwJ9KKiuE0cZe6YXc2qOj6f/WjQso3G5+vaShdQHGY
	Nn6F+d7aNtOJd7Ax7RjxUBwCaTNKvEDUWGj+n8l662PFqtE8vHmkbO5PRDWK2qtiEoYE6tviFtS
	e0yK8yTnsO5Eg0rTUofAsz4LpwL/8M/nCRU1Ltp5YpSaeCSFVpuoHbvy9+XlyP7uXyV9XqYdCvR
	TdPS626R9XVyEZKXB6YxFKH9WmkWAfDSRbwrGmqnhFRstQhnBJQvZgm+5d25CkByHzbUVCK4Ucs
	3g1EizIetoa/BhCbwgaeGahy/6EYOJTbVb4MOwz6rgFtqKtq34QXgUwKzQ3b3eWuz651R5nL3JM
	JGwvAt+hMyTnXqYiYkxTmtBQsixQLZYai7vrNBz7cDFjSTsDHhcCa7SKD6zN2qf4FZVFt8TYSWz
	n5i54dPDB5mcbXBDAyySx3GoZbejAxwE6RkyQlS1GzIQcHEUcmO59xNGl1tc0xFCiFni9kFFgWZ
	W4FsYNW4YC65z0BlMe4Lc1WmWYrU/Uenz00K4XkZ3teU6lQ==
X-Received: by 2002:a05:701b:42c5:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b4f5eb2338mr1128050c88.16.1794448612207;
        Wed, 11 Nov 2026 17:56:52 -0800 (PST)
Received: from [127.0.1.1] ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm21032435c88.9.2026.11.11.17.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:56:51 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: hare@suse.de, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de,
 sagi@grimberg.me
Cc:
 mkp@kernel.org, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: stop asynchronous event work before ANA teardown
Date: Thu, 12 Nov 2026 09:56:38 +0800
Message-ID: <20261112020000.1003.yaohan@gmail.com>
In-Reply-To: <508595ec-0540-4534-afd4-44ef8ee01da6@suse.de>
References: <20261105114149.970315-1-shunsheng1218@gmail.com>
 <508595ec-0540-4534-afd4-44ef8ee01da6@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Hannes,

That's a fair point. I agree that we shouldn't submit new AER requests once t=
eardown has started.

The case I was trying to cover is a completion for an AER that was already ou=
tstanding. nvme_stop_ctrl() flushes async_event_work, but a completion can st=
ill queue it again before the transport has finished shutting down the admin =
queue.

In v2, I added the final cancellation in nvme_uninit_ctrl(), after the transp=
ort teardown, and kept the separate cancellation of ana_work before releasing=
 its resources. Keith has since applied that version to nvme-7.4.

I agree that stopping the producer is preferable where possible. I don't thin=
k the final cancellation should be treated as a substitute for quiescing the =
completion path, and I'll check whether any transport can still deliver a cal=
lback beyond that point.

Thanks,
Yaohan
