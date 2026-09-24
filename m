Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9FC42FCDB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266298; cv=none; b=iC4MK6YuqYokr9xbNm/+DdgVKABo8HwOGWFpYWdeZL0BvycB0hK1kf2RqImuGVdtw+HkF9zj7D8Q9eaUiCznRHuNpG0cKLdJDaZNxCntqHv5QIc6G+8QDqvPEiz79QLngfj88Ew0r/+ROEwWkiVTsLCqWhWdkVVCSgxU6ZRyGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266298; c=relaxed/simple;
	bh=5ZKMCeubk2HNsKlNKyJ/zydm/g5ZW+aZOdH2bMTrgcg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGF/k7YAoQw903QoZw43TOPoLaTawVHJ+Gi2ZhgJ0uBNLCXFNwt0rEYLj6NWruEgq5ZmhPguinmvLj+i7eJKvZI3LK65PW3tX/wJ7ftsAYRk+z3DOKITQvk2B+lIy0aJz29zlusHZZki7sPfJ+GkrzlF4WBO6EJ49Jj34NkE/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=CKwjwpaQ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="CKwjwpaQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9Otb6zuyEBZINlapWeW9EeZO0ay5u9oRpGgKAiyNCSw=;
	t=1790266296; x=1791475896; b=CKwjwpaQoEGaolAJKjLtHPqo4hIcUdMoEHuTofKDTkbd23m
	QSBTQ6kATmdYtCbEMhNmYGdTtoMLoxSZRwNoSjyS8fKjS/dSpf+F5MWS0T5B6I2jiRRUgMJE/fFvk
	gh/qHdJdo/XL6OHpaWKfAniGcm01qpq/L3UjTXCx2U8/99Qrlxiqp2bB+s4U1WMInttrUZvy7nBDx
	/cspIV3H64q50iQgaeRLlUakG25pBXEG48LNLionUFHAd93Dv2S7WFOXrZPoMKJinlb/mLMrd4tNs
	/IqQySK4xGzYYrrIj3PqzxOSvZRl+5J/taakK7b/EKd9ga1qC/5XtyHarXegs96g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1x9m2m-000000099JI-1OEh;
	Thu, 24 Sep 2026 18:11:32 +0200
Message-ID: <5da91b32a633e82d89a4c504c06d12e51507df3a.camel@sipsolutions.net>
Subject: Re: [PATCH] um: ubd: perform the flush the block layer asks for
From: Johannes Berg <johannes@sipsolutions.net>
To: Mykyta Bozhenko <caudadragonis@gmail.com>, richard@nod.at, 
	anton.ivanov@cambridgegreys.com
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 18:11:31 +0200
In-Reply-To: <20260912223932.2941631-1-caudadragonis@gmail.com>
References: <20260912223932.2941631-1-caudadragonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Sat, 2026-09-12 at 18:39 -0400, Mykyta Bozhenko wrote:
> ubd sets BLK_FEAT_WRITE_CACHE, so the block layer sends it REQ_OP_FLUSH
> requests and, as Documentation/block/writeback_cache_control.rst puts it,
> the driver "needs to handle them". do_io() does implement that: for
> REQ_OP_FLUSH it calls os_sync_file() on the backing file and maps the
> result back into the request.
>=20
> That branch has been unreachable since commit fc6b6a872dcd ("um: ubd:
> Submit all data segments atomically"), which replaced the single
> per-request do_io() call with a loop over the request's data
> descriptors:
>=20
> 	-			do_io((*io_req_buffer)[count]);
> 	+			for (i =3D 0; !req->error && i < req->desc_cnt; i++)
> 	+				do_io(req, &(req->io_desc[i]));
>=20
> A flush carries no data and ubd_submit_request() sets desc_cnt to 0 for
> it, so the loop body never runs. The request is handed back to the block
> layer with error 0, i.e. the flush is reported as completed without the
> backing file ever being synced. Guest fsync(), fdatasync() and journal
> commits return success while the data is only in the host's page cache,
> and because no ordering is enforced either, a host crash can leave the
> image in a state the guest never allowed. The error path is dead too:
> a failing host fdatasync() cannot be reported.
>=20
> Measured on a UML guest with ext4 on ubda, doing 20 writes of 4 KiB each
> followed by fdatasync(), then one fsync() and one directory fsync():
>=20
>   before: the guest sees 22 successful flushes, /sys/block/ubda/stat
>           reports 16 completed flush requests, and the UML process issues
>           no fdatasync() on the image at all
>   after:  the same workload results in 43 fdatasync() calls on the image
>=20
> os_pwrite_file() is entered 131 times either way, and e2fsck on the
> resulting image is clean in both cases.
>=20
> Honouring the flush costs what the flush costs. With the image on host
> ext4, 400 iterations of write() plus fdatasync() in the guest take 467 ms
> before and 2007 ms after (medians of five runs). uretprobes on
> os_sync_file() attribute 1.597 s of that difference to time spent inside
> the host's fdatasync(), the remaining data path being unchanged
> (os_pwrite_file(): 19246 calls in both). A 64 MiB sequential write
> followed by a single fsync() goes from 278 ms to 362 ms, due to the
> periodic journal commits. With the image on tmpfs there is no measurable
> difference.
>=20
> Users who prefer the previous speed to durability can disable the cache
> per device:
>=20
>   echo "write through" > /sys/block/ubda/queue/write_cache
>=20
> That is also cheaper than the unfixed driver, 326 ms for the same 400
> iterations, because the block layer then completes empty flush requests
> without entering the driver at all.

Yeah, you really need to not let LLMs write commit messages ...

johannes
