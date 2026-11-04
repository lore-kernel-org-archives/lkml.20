Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831519;
	b=4Muf1vXs1D+LOPzKqVzWuKmwAmmtUbPcyVG9HJqZBCGjrF5215vLTdxwbW+FswjZ6QFD
	 G+k6f1qBIBZ+7AM5Gy4eI+tuZXVLS9+wXz7/GZrfV5d04kzpGulJq/ziIocjsgjjgg0tA
	 g5a1cVZmM4nSlObPVkurbzAWleh5t4Z1jBvbdnuP1OyAbkwceyTmu1wfp2itYBJtC5Xmi
	 x6kqhadNMhamyqrhIxebWdADcF3/P2vc/lE9bEIqGb6A0EROrPb4tILsn8FYw01VYxtWF
	 K4rzuwkmKyoJaO/XYxY2VqN2qJBrz5yjeUUSmFWmX5CzDHn6PM/Fiw3BIx5g5yUxLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831519;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=g+xepbYobvw5vKQfFSSpaPgM/Qgx4foGgeCYPy3uXXM=;
	b=rqtSdpDditkELjUoxen2ieyGVPi1k+QUZ5J6OsI7l/OGyvtkj3TlsVooN3yiM6QlTeue
	 1mCsYTF6BTwgSU4D37cHYfahq7/H7e3rQAS4OCgsrGq4rKHysusl8id6WK8snPV8OiLqf
	 ky3ApGuLPX+ampuComEeAPE0BmWhN53ODZd249v0WW3bdZrq41g9fV3eyoyD6B33AQqj8
	 YzQ8/r3HST9C1GtgklEcnuvDGvRcnWdt1PxKwwCtSq+cEDcEsLIlQHMW6b8CDrkPW+8UH
	 vEOvjZWHcnG+qx9smS9FRQgHgFPhH+88skPV771FukvXOuB2mrQfuVh5k94IrPPNNyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72C606D80B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA72C606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793831516; x=1794090716;
	bh=g+xepbYobvw5vKQfFSSpaPgM/Qgx4foGgeCYPy3uXXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Om1sDMvdnViXTsZYDcTxREC2MSvjcqffLmLktP3mFc49/W4dOs9UywhKqyn0IJZZa
	 d6VBQ0/A+DBI/udbEK+VPjg+43bw4NEkbvuU5YSGZztrIWStb6uryl0XOtrdyZPPiT
	 Js/LnMp00sNg0jHa1rNeCHL+MRENNZQquAxlzqfsyxIKnFxdMVY4hP2w7DcKPmIkau
	 FKUn1yKNgRObjgBCAhMsnqTX5CaGX6eFmQnsLx7OF3CtFzUkWQU15eNIaawDd+T3aj
	 LeTFJnDlY2Iob7yZi7elSlPsu0G2dOjoqrYwupLz2Ex0rf2xeB6O5U8d8XLfcRcR6a
	 Rk6+6TSiahAVA==
Date: Wed, 04 Nov 2026 22:31:51 +0000
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Chad Aldreda <ca@modelmiser.com>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Nick Faro <yux50000@hotmail.com>
Subject: Re: [RFC PATCH 0/4] devres: warn about managed memory still held by open files at unbind
Message-ID: <20261104223146.4012287-1-ca@modelmiser.com>
In-Reply-To: <20261104220749.GA3976471@killaraus.ideasonboard.com>
References: <20261104215546.3990950-1-ca@modelmiser.com> <20261104220749.GA3976471@killaraus.ideasonboard.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: bece6ae7414fb4b7eace742cfa8974844978129a
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
Content-Transfer-Encoding: quoted-printable

> Are you really expecting anyone to read all that ?

Fair enough. The short version:

A struct cdev, miscdevice or video_device embedded in devm_kzalloc()'d
driver state outlives the unbind through any open file, and the next
operation on that file, usually close(), is a use-after-free. It keeps
getting fixed one driver at a time (44f3468a0aef, 7d6358ab0286), and
cx231xx in 7.4-rc1 still has the shape.

CONFIG_DEBUG_DEVRES_REFS, off by default: in device_unbind_cleanup(),
before devres_release_all(), walk every task's fd table once and WARN
when a file's private_data, i_private or i_cdev, or an object a
subsystem names (patch 3: V4L2's video_device), points into an
allocation about to be freed. A debugfs file still live during the walk
is judged after release, since drivers often remove those through a
devres action. Cost: one walk per unbind or failed probe.

Patch 4 is a test driver: unbind with its nodes open gives two WARNs,
and KASAN then reports the use-after-frees on close. vivid, as a
control, is silent.

The open problem (question 5 in the cover): the walk holds a reference
on each file it inspects, so a racing close can leave it the last
holder. It runs on a kthread so that release goes to delayed_fput
rather than task work queued behind the unbind, but the delayed-fput
worker is serialized, so a release there that needs a lock unbind
holds stalls the ones behind it.

