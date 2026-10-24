Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845835;
	b=poqThLSPsfXjLDtXi2yxcg8Vnld6v/v9UUTsJM0aKa8rw1cOpEpL5svsptD1HFFP6RkJ
	 0n1tJKs3Z1AdnnQajDLkYHk7C0o8jq7sLwH9xgJ74l7rDqInLmCtHTYYAbWqRjaqMAFrO
	 LS0Cf8+l3wY7oVNQ0Y2vbJ/tptkUOUHTNpGwihSa+xJbcOvLb/QCR+YUurkcmYJ3+9m5Q
	 g+0BJXN8fDAQdlhWASbipdEdAILz2TRmDQhMptd6iZ8nhFLJuS2w/1m/Bf4LqcQewsvF4
	 uc+zcPlfsByzrKHuYPrdm8ZfHQfwvKuKotO28yOCVdv5zZ6T4OjsK7NqUNEnGraRYVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845835;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=d6062e6bSUUlWddrIbH3NOj/DEf4lofE60bI1EY1rcg=;
	b=GZ2dWHvsCGnDBWeawf7kdA0IQo4NyP3MvRRVshwMvytYADUh1/3B+kv6wrck85+Z5m/3
	 qpz1Z8cSvBoqjiQOBwmbA91leySdmhoTigW8MiWh0JpY3ri+Qhla7nAgYeMikn4MfgsmZ
	 ttWIHyErEEWE905XQ90rDmPwluwdL/ZdZl3QBYjlHhMady8nCYW2X7Xnyw6GE0VvvkIr2
	 2LEc1iZu+oFrs8DW45dPevvksZN3HkDxf33BNJGlRF1rd+2Z7GkNHLrg07VnYELFKNwa1
	 EL9jf7Ji+hQuYlp5fe5HL8nlgiAvoqh0WsytzKctpjzfv8GvTZNmRe8Amy27vooa5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alepacheco.dev;
	spf=pass smtp.mailfrom=alepacheco.dev;
	dkim=pass header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=Kwi1OnjY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KCvRy5sk;
	arc=none smtp.remote-ip=202.12.124.143
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E1606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=Kwi1OnjY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KCvRy5sk
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 72BAD1301AA4
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:43:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1792845833; x=1792849433; bh=d6062e6bSUUlWddrIbH3NOj/DEf4lofE
	60bI1EY1rcg=; b=Kwi1OnjYsYBA3LhNh1OPBqRHOxBLjAJNexDLkRUdsc+kxu3M
	bzljCRBsgc2KhxvDbwgYQjeuIgO8mYJ+lUau7PyfZF20BuVlBfIF71b/7TGbrhmi
	k15agGdVxdOJGaJJmMYwEsA2o7MhfzmTeJ8p9LhkT8uyePGm3ITWC0v2gug6SXCv
	RucloBdGIugqv3l+Skzw+bgsHYsntH9SU+SgB762gvQwy3aGAhjNsEtrL+F5w7CX
	fVpYnOYaKxc7gS5M86PIW4vDKRr06ME/qVIEWiXQTn5XrTJROqwjBF4eSNf/PdSf
	ao48nF9yNpA6eroVtaHBE+AyvnSqUF5LVIDtEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792845833; x=
	1792849433; bh=d6062e6bSUUlWddrIbH3NOj/DEf4lofE60bI1EY1rcg=; b=K
	CvRy5skKXz7k5CR1gS/ojoGvYp00V730xESRcQF7UBGLmczJiyphdjQ7lkIZenUw
	RHG/mnwPSNj/H9ARUrwKdx9RWnIkKQRLUKoKxdI5rGID75MEIHV0cwDE8VU6mG7k
	mBL5oBYNlL1PFEgQMoU2sQQ9Hl+5gdczQGQP55OqORb1YbaZonAy6MFna1h6kLhl
	I+478x8M5g3vP1Orghh6ZUiiJgyYatVFjuUP3amO9TUpsg7mQGDcHZJiLb3MInKR
	A9b/VLL+P3irsYb2hl8hHsPnEN+V7e8l19NPP7qxN2QJHvG08GOWs6sp7vhJxVJa
	X5bU8L2nNHVaJKLNXrXFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845833; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:iIzbu+m1hmxkJWJDg7L5OYKFoa9lkMBhYSMGTaJSA7iDYDJ
	qEPOkB1r3lnX1JB7Yz6V/G9hI7jm/E3VkGSjLt382hXd7kV3L6I+r+By3JO3mmSX
	rfBxqZACeyLuZ2YtJAcxq/FbUr8g1NC3UGP5ns+q4wShTbynpnMe3ElUv2kYe99r
	Uo1S1z/S8rqRjiZn6WUIN58J7mLR/+Mrf2QSRKpF3VuC/if4JsOhsm4eY7It80//
	7tK9JUVIgbWTLYxxoO41wrTamKQO6jsFCUlkiou5X7J9Jg/uHNSysE3PjAkv64sV
	mLPIHQZSC7GmIgnS7DrdiMAIDwSEWpoIsDsCyew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2NKwsGw9d2A4hAoi0ehVybY+9PD1JyRefv/FD8ljako=:Gi7oEoUrbrO6bmjTMkQZehX3dOlLmjscyksLkR5ot4k=;
X-ME-Sender: <xms:Cajcan224-b8X83JoBxeclrVi0tLE-xQKrpie8WEezmDucnMir4RbQ>
    <xme:Cajcag7Vs2GQNGerWu_Pt_av4bOmT-Sn685afAJBGClhMH1AT_JiISreRhI150FCb
    hMw9BZNyOVc1RAmYwc847wjI9w0vmkWeAAMzoHG8HipGxEZHRajy5udxw>
X-ME-Proxy-Cause: dmFkZTECxb5QEdLpBAptvAY21mG1tOFS3Gj7uFL/G/PKyc679LOlRSC1hKjgX8OKgDqZuv
    F3aKuj859jGiV/CInLovKdvDY+6y9rZ5ZmgR7pSm0BYvKEbrIXj5CvawsRpE+pu2yrB3ka
    ZgctS0gmRPIDAFWh7MJWap35G1Tml8mWJrWEqp5swIpB2Dyi0ZqOsPlae75pUu/LvJufAz
    uGDGHgiDxzusO0rEo03XREG0ln55JUogdm8v2V/EKKUz/v2eCjHlIzTAmhU+l9KnrdDTSR
    u7DxrslXlaXxIwGIseTqtTww+A7Z7qt8lq7YvQlAL7Ut7ldsF43rg+pfmhC0LmqP4egbPo
    Ki/xNC3rgdd80fB6SD46VAdYwsRcNIFGhCSzYbaZDwKIQLWSsCpyunkSK9t/cpcbSQAn0q
    VtkTKQkpDCJcBAzpkvvXsm2B/SWuKl+Jqg+NtmjK5rSDRf25aXWeEmCrTpLG+Q7Zi3OJjd
    czj9mwfgeBHcy6Pqe9RWmsMP0e6zzZevBbd2jHkF4zZx8TiZZ4BFmvPFSRa9kozbdKYcXi
    bkjMQ2jXjK2fvNOw1m06xsH+S7u1X/RNxMIyMvpx3uu8zQ8dgDt4AzCXY15Sb7V/fRKWnB
    K2JioCTxI9LuU8SmKgy9mKVBCTpF0QcD06nWQ2pXXtqmEfG8eB/zwcIKDUzQ
X-ME-Proxy: <xmx:CajcasVkBU3mUFZZJR-N75uNZUyyfygeeoaf4xLt4CjzBqNIaEszng>
    <xmx:CajcargEoe6GouN9MqBEzLC-PXG1bdKeX52a37JQ1zvBQVbkwbCN2w>
    <xmx:CajcavbIdDztRrrebiChjNJuYtCyCVjGiO-rj4XmXsEq10LXc7J2Ig>
    <xmx:CajcagqZ3D8DwU7wVaNvD8FZxNJ2uRr9qSEQoDC5IzDO5eWu10SjIQ>
    <xmx:Cajcaoqdfu-xn9WyNHK6BzReDuMxoDB8PsxpE6cD0POo7jzUT953Not5>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 40BA770006A; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:43:53 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
In-Reply-To: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
Subject: [PATCH 2/2] ubi: Check the data size of the last LEB of static volumes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From: Alejandro Pacheco <ale@alepacheco.dev>

For a static volume, init_volumes() takes the data size of its last LEB
from the attach information, av->last_data_size, as vol->last_eb_bytes.
When the volume is first opened, ubi_check_volume() reads that many
bytes of the last LEB into a buffer of vol->usable_leb_size bytes.

Nothing bounds that size by vol->usable_leb_size. When UBI attaches by
scanning, it is the data_size of the last LEB's VID header, which
validate_vid_hdr() only checks against ubi->leb_size; that is larger
than the usable LEB size of a volume with a non-zero data_pad. When UBI
attaches from a fastmap, it can be the last_eb_bytes of the volume's
fastmap header, which is not checked at all. A larger size makes
ubi_check_volume() write past the end of its buffer.

Before UBI comes up, check_attaching_info() runs check_av() on every
volume that has attach information, to check it against the volume's
record in the volume table. Also reject there a static volume whose last
LEB data size is negative or larger than vol->usable_leb_size. Images
written by UBI or ubinize are not affected: no LEB of a static volume
holds more data than its usable LEB size.

This needs a crafted image (the VID header and the fastmap carry CRCs
that catch random corruption) on a device that UBI attaches at boot or
that a user with CAP_SYS_RESOURCE attaches.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 drivers/mtd/ubi/vtbl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 06d87a3013a..f1bd6e1e488 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -696,6 +696,12 @@ static int check_av(const struct ubi_volume *vol,
 		err = 5;
 		goto bad;
 	}
+	if (vol->vol_type == UBI_STATIC_VOLUME &&
+	    (av->last_data_size < 0 ||
+	     av->last_data_size > vol->usable_leb_size)) {
+		err = 6;
+		goto bad;
+	}
 	return 0;
 
 bad:
