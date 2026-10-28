Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160703;
	b=Y59s4ZtBaz16TF2DC2G2w7xO5YH4DUqGf3VKwRu7O1hyguXMR3qnVxjW74GuaVbFMsKf
	 huo3AaimkyTgJ/aNbrNTK1V8jY7YzMwPEESN3tNfKd5WePwq5jfBlxWL2Yu/L3NduCZNk
	 vXAFySUHpY4mWUHoXXsXvRcuOW6NFvF722usVzhOYpZLi04/bgs76OoniPxDeg0iZaKOc
	 HkfqleI9DjjcJSze2rzPSBCT8RXOEvim3qQQCmalwurO7Esz/A8kU1PYg1hks/MYF5nti
	 Fmn5q1s0Skzb/yMahVpOSWeBMgZ4T1gABTPnh4nbEvxyhbknCvqL39xpi5GvNzLd77A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160703;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:Reply-To:MIME-Version:Content-Transfer-Encoding;
	bh=s5SjjUi/ZVlMwSasSkYfA0uEsuHMg3rnpf66UCpaQzY=;
	b=zwj4Q/8x0yt5Il1RZzj+C0NMqdNA+apeVCx5IYWa7x/c3UQNLBPJUvBR0GaSZoIYOhcy
	 n+YjIs2xo90VkxraYsWm+E2ketSk3rtkGvVjjNx+JJnBXpX7BLruwBtCZzzc9cviO8r/r
	 LIFTIqHJ48adFVIe5btIbSMX0npo9HltZfgHZ3NpKYJ0GpP9qIWNBnPYJA6t+iXfZFOf7
	 JAHPE4BnjmJ9aapStUZ2g72TUtugYzuxjbTc/58xz5eWFRqIGrNbbtGVcUKLR+KlwnsUn
	 5t1NCBg+ZjGKSM5WGQUifj1xKoYT2TC10xOcn0XXwf3r+d7lazt1AFEsDx6GTst/XDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=UPSjZxPF;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NdBzTrxT;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABBA606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABBA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=UPSjZxPF;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NdBzTrxT
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id BED2C1D0017A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:11:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 28 Oct 2026 00:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to; s=fm2; t=1793160702;
	 x=1793247102; bh=s5SjjUi/ZVlMwSasSkYfA0uEsuHMg3rnpf66UCpaQzY=; b=
	UPSjZxPFhjVqNfUZQFKFy1BOmUjVnDoxioJsZKlyojnQBGlVl8wht4Z1To3+zngE
	7A7ViRMewRXnhmuys2d82S7zBHL7tJ8X8mhm7zFrUtrvgOrxqW0OW3xCTSHGcpOB
	S+AC5OHBagOK5bhbamrnroLEWXyZ6Wtwnt3zdLmKkz9HjGn/h+hHEiFgBjaHg4N7
	SKOdQ1KBwXbm+Bc5mFBj68qhsgcpnGQzcbHeNdIjTxiVczkXtILv7yHaTUYpaYmJ
	lftPhCqrZ3f3rwMfEfxvEqEONOxWFXPxplToQapN1UHiOq0DXzFzOchxLZNiBGc5
	jJSecYCvLt9LLF4nKg2JKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793160702; x=1793247102; bh=s
	5SjjUi/ZVlMwSasSkYfA0uEsuHMg3rnpf66UCpaQzY=; b=NdBzTrxTx+HsS8vQz
	ZRSisboaK39TD4wCMqUm7gE6xyiYkpZMxcd0U0qLCqj3+KbwA9gb3qdQdwwohCz2
	4Mb75B6L+no5kn+uBnjZc13vPQgd19Fgbd2lQ8aum9ozpx1zdrvimn6DyLLypK/q
	5jyIqTeen7EXmb97nAZwXQhX7PEVTP1J2o/Ac34rTcr7FOWy4HyUR58q5m69YA3b
	LgvYpedBNssRh5HvhgHn5/wIUK+aWLB4HTD5yo59WHoQB3pknihlGBm8cgpI5JLm
	UFW1pZee736msAqOPZAEtXvpcQxBFExD5SM/BQCuOGdy2tx0yBNFI7KMOiw/Dpef
	915Hg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793160702; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:lcCDM+Ayktwxy+6Ilx5NQQi9wnWk17JAOhExarh7Faa5uuF
	SeMTWNIbj5CTQL8iLVqONRtnuo1HCyoa43OrBVqCP5FgwheSHZgtY8LFze5DzDhC
	U8YYbuM0Gy75GHn6TUQqZdoJY+3fzlx9jBlfMMOSMu23fvmhix3usPuy0tzpKNeL
	U+ByMn7KAhzqTNOqhgHyIOVuZWRxHV0vbT7gFlsfNl51xAzaRCrHfcl9in1T+TDa
	o4inAYzP0AtBtZdFmnscgAQLtwPqGkoYB4++gDtmJB4SGntpgo0xAvSpBSG2ZJBW
	sXXdraU+myPgD4U4cN5y7hh7ndcUUVIDXD0k5nA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,reply-to,subject,
	to;
Message-Instance: m=1; h=sha256:JsyRHPmGnYAREVQ4AB1EWWADBCzO4KVaI4ixwGe/9Ko=:yMX3YBooGzqTZZwNHdCOdj+Mc1rORAII2DHM9hHa1m0=;
X-ME-Sender: <xms:_nXhapxVkG1XPVzSiewUilhk92d5-UuMr5qpP600PPztJylHnRxf4Q>
    <xme:_nXhanghp-mkqD_VdC5P5pO2dwPvbgQblUrNQtjjJxQVzEQ7BhO85BOv2Ykz-93Xh
    vimMdff0NjgSaPlCzezp2pxIIVuqIeBmJXdvzAAF3BRemPwBJs>
X-ME-Received: <xmr:_nXhaspTKYaB2w3bXat66UcAXSl0enWMe5mhMoMesGYKbIREm1HoTYnYv4_PiKBTwZCFU7YGtMeFs_JdIUiLZds8HDPrx8Q>
X-ME-Proxy-Cause: dmFkZTFqL9d6vtBCb+NcWzd/7SiNibAA9OzG8/8ItNoKhrCbp6apHJN0xGHTCiaM1Ns9eo
    Lr4mu7Y4yew0MDnBN6JXNQRuaqzU16LCUJ7ad9et0QcMvgBWEXRg1603Ru5AglHe2+TxKv
    ydoMFP7Hms9hJwmlbMuKnQeaW1uHkQOzd/uAKOtWzI+liIsbjRbrwDvwZz57yfNjJsYMfS
    GK3j7TzeoY+fFbVyhaDEEKjSfaVH0uPQQGvy9QSfC9U8EamqqN/pxHKYIXHw2LlfOVJIla
    6PTXYyJsCWjbbbyiBydX7EBzCiMYy0tMvaOQy2L3pkcXcIGHXyMFUhmiaWdxscS01qQePc
    JL/jbBMG2iKPpvdhOjzv7zrWNAxg5FMVApg3CJq5fU1Mo6leEcgKWhSewqYwG5dOEEVusZ
    +u8BY/YQYY92v9t9Ih+WFNRvd6Q5SyjzQtxFMLNFIzdVPi4ycj+/IAEPSfnrE1oDK7Vesx
    NouUg3ZkTmo/peAKqTVNjLXIMRaF90rEMCKmwXSX8JhOcJ38IldvKKB+5H/bj4Rmcy2ole
    bymt/uNr7MWlWZjwx0rcWXKPWASwiDt7b7udiNrMtty4i9tQdOtwep+Gk0/a/yJXW5ZdnX
    kiqqCXqCblkd7z19ZeZwNawU5SxceRGrjEXAoderlzns5QtkvazUKdQARf5w
X-ME-Proxy: <xmx:_nXhauj7_KHcC4EmjMawEAjqnGSJbaLiYi7x7nNZSfR_R2u_Lph_4Q>
    <xmx:_nXhauPMtHw8F_2l8_LkofY4LelaJhdxHoLeuTMHbb0tDFazyj6fhg>
    <xmx:_nXhaoyZhAFu5KQyMVk7QeEqYf_zPFDJMzTrAdELHUHlp3ilKuDXjw>
    <xmx:_nXhagpiyoTXpL_0xvf7zktYRQeAZMJDz8p_ILLPcy6LIYcEYth1bA>
    <xmx:_nXhatWUu9BoiEs9-omT_rY02PpOppJUw8TVk9h7pZRjarbuDIevWRX9>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 00:11:39 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] nfs: use d_duplicate()
Date: Wed, 28 Oct 2026 15:06:37 +1100
Message-ID: <20261028041023.3738553-10-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
In-Reply-To: <20261028041023.3738553-1-neilb@ownmail.net>
References: <20261028041023.3738553-1-neilb@ownmail.net>
Reply-To: NeilBrown <neil@brown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: NeilBrown <neil@brown.name>

As preparation for d_alloc_parallel() being allowed without the
directory locked, use d_duplicate() to duplicate a dentry for silly
rename.

This results in an in-lookup name, so d_lookup_done() must be called.

Acked-by: Anna Schumaker <anna.schumaker@hammerspace.com>
Signed-off-by: NeilBrown <neil@brown.name>
---
 fs/nfs/dir.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index 4ceab6209e4a..1a5f64ed26b6 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2819,11 +2819,12 @@ int nfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 			spin_unlock(&new_dentry->d_lock);
 
 			/* copy the target dentry's name */
-			dentry = d_alloc(new_dentry->d_parent,
-					 &new_dentry->d_name);
-			if (!dentry)
+			dentry = d_duplicate(new_dentry);
+			if (IS_ERR(dentry)) {
+				/* Keep using -ETXTBSY error */
+				dentry = NULL;
 				goto out;
-
+			}
 			/* silly-rename the existing target ... */
 			err = nfs_sillyrename(new_dir, new_dentry);
 			if (err)
@@ -2888,8 +2889,10 @@ int nfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 		nfs_dentry_handle_enoent(old_dentry);
 
 	/* new dentry created? */
-	if (dentry)
+	if (dentry) {
+		d_lookup_done(dentry);
 		dput(dentry);
+	}
 	return error;
 }
 EXPORT_SYMBOL_GPL(nfs_rename);
-- 
2.50.0.107.gf914562f5916.dirty

