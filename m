Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925399;
	b=ZyOq3pjUtkRYxosDSpy64q4emhN59W/KjIcagL73AU/nsMjUG0P+5D9m/BVvdAk1RRfv
	 Z7h+nCr33qwGDFJexLzbHoHXA9XQOUndmIMqdYPjnWyfs+h1w8lLzBLdfz06Qv78pEwAC
	 O0RpKM1WbF7DzCcAx0dImwFGZ5YrGn+ijGh7MlL4D4TJPYZ4Q39kIJ8MPm4zKf9jQ/Es/
	 eQ/PGxVutkv1O8Gi6jPW3WFxhLp2kOI28tglvehpYypkfwyaxBYZ5O9fE/qFMzCAqL3ck
	 2FrTNFl9GpJU/xP6rW8v3EI/0BVCs9ETBJk56kvjjCjkJJyYIM6otRwMdigrFs4O5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925399;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=viHK9iF57V7j82GCnAJohyxrrXvsf4uMUlYjZ09Vx9A=;
	b=q+1F3KZlr1ElwumrwkzBrSfuQj+lUVSu7ZkF5R1K6juv8XOqMcdT3KReU5j/ObiwEuka
	 UZriQDHqkXaG4AF4L6fzGHvuV+eHKieAiITMx4UxGlgxyMdZkS3h+digB+e6XFJq0NSaJ
	 /VqUfMCdGZ3WOTwNv6zdlxuMi/X/lHgTkXcqiAZQSRSfRqmSXkGkiC7yCCSG/eyi1zvae
	 LsUxAAmJuKo5f+Nep+nTo+vRXuiWuRMRhqkD0rtPkt0n3gXs1BTwFNW+xWJipylbJG9HK
	 gQqacXKstGyZQpFCRd6DkdDrxb8ruifofE1FNGBBlgUh0creGE2KaY5zn2ObUrCv/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p0sD7NoG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFCB606A897
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFCB606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p0sD7NoG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9669B4E415CB;
	Tue, 17 Nov 2026 14:23:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6349C5FD6A;
	Tue, 17 Nov 2026 14:23:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E617211BC0041;
	Tue, 17 Nov 2026 15:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=viHK9iF57V7j82GCnAJohyxrrXvsf4uMUlYjZ09Vx9A=;
	b=p0sD7NoG3+N+m+rHm4OmSbfjAeNL8g9dq2xD755iIi5d2nT8+UR0tox+ItlUnJYAG3jN5S
	1/dxGU0tUoOheTAphw5op7Xfb8yi6k6SDHDcySMGRQCg+ap1T/aSBwn3FiJGrI2/gGNxn2
	SMMnngpJtq8IBFxvrIkSZ7908RdhCHlrq3PFSu1h0F5JdqkC1BtKRtTfFdqXRMrCSyb013
	aY0htAm9WUXtGNSmPxP7rMFNgxd2OWAWzx+pbFx3mRyqCCy66PhomSVhv1EKv+UGuG4iKJ
	gcRmlxPAgfhjolU6j7IKrKbDWiW6w7fDo4lqUrwgcngWDk8vzddP3FvivYbIBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Yige Jiang <yigejiang86@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
In-Reply-To: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
References: <rc-review-20261029-ai12-12-5b57d6320701@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: omap2: release the ELM device node
 reference
Message-Id: <179492539586.2259780.1383274942721957151.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:15 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 29 Oct 2026 20:03:47 +0800, Yige Jiang wrote:
> omap_get_dt_info() acquires an ELM node reference through ti,elm-id
> or the legacy elm_id phandle, but never releases it. The existing
> put_device(info->elm_dev) releases a separate device reference.
> 
> Register a managed of_node_put() action immediately after parsing the
> phandle. This releases the node on later parsing and probe failures
> and after NAND cleanup on unbind. If action registration fails,
> devm_add_action_or_reset() releases the reference immediately.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: omap2: release the ELM device node reference
      commit: c46b3c1c28fb34b9ea1abd5e5fb4219cd78aaf34

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

