Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792466831;
	b=n5DYMHdVLwnG1H1JW2prhE+nDXA2f5LAjUHr+nQ8xyGJZhLBnW3/ryN2Yjri3BuMjlrd
	 1bYjegjkiURbb+Idx3OaV9DnBz2mE+6AdWvnpoUbBQkQppIpLOBkWHtv6kt3CRCHqRYk1
	 gjcJaFxf8qSul+eG3CYWEN0UvXlzwyAbI8atgtsGwPGvACYNJ6zEPoA8SIZGyxTjgTteJ
	 /iaDSGrZ9JeMl2iMsLY9ur3DLeevZqka/e/eDWZPG7+z5KoGPI+8y5Yp7NaUAmbfPpFga
	 5jLhOtR0gx4B2Mls7yep+/cRpcs8VAqIGYXm5OjJelzykdsjpIfSocI+JTiFroReObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792466831;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4w9/IRTlSdUFM4eKGzHhFAJAzIG/+HXl+BMueeOBb+k=;
	b=aRL0LgkRrQZrKcCub8c6fwZTMc+8/b7mbqO7n+S9Dexu+albqhCk7AES7PoRuciBFEgh
	 3+cO+QGjty/9mCbxP55FjanZoEkMpVl+nnEWTc4qsG5V7yQZ6GD5U7t/7eYLV7EzqBKmy
	 Cbhkvk8TKsWEykUTA1FtTvF5spDUQPTy/f7/CTODT3d+vRwn36r+ytYOlqk+QsDvdtxPc
	 7BdG/0xRzQj65nxXalmWS3nC0wJXltk6mPeoysTXDckZAR+h7CsHScVYdd28FSORP7LbO
	 51J4DRog13Y84vk61g9szHJxzSXiHN54rrmZLmaYeDOXCeYy223OoYWyMGCro31WmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnPb0YYh;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB9606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EB9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnPb0YYh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4w9/IRTlSdUFM4eKGzHhFAJAzIG/+HXl+BMueeOBb+k=; b=bnPb0YYhHJlEUFNXxgfqMR8J9V
	I21z9hU7fDr7EfdIrhwCQy+PdzpDCI/8RlUfPaYb3a0iKEloCWJVFaTtl2xNG1RYlPcCWA8PIB5Kk
	Ssa2dcGO98HbSsCpL9kmOpGgH52uyo/CA82TrUO/wslsOTwGTJzBx6fC3KADGHgWtwyxooj1C4TCf
	RSxv4JhhxkMBuwiD/Euexguz9UaY1NL0WpvqtSGtmbVprFKOOU1DwOm7l6KeAE9ulBlVZZF/HpUFn
	mqWNI5r9TCqmlhLgyfV5SwLiY+rniZ8ePoa7afy1jfcvDBU1dePNq2LitfYtXUGfJZNbD89Zm2Ylt
	ng8lndNg==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0VG-00000008n2g-36Yk;
	Tue, 20 Oct 2026 03:27:06 +0000
From: "Liam R. Howlett (Google)" <liam@infradead.org>
To: Fei Li <fei1.li@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett (Google)" <liam@infradead.org>
Subject: [PATCH] samples/acrn: check posix_memalign() for any error
Date: Mon, 19 Oct 2026 23:26:52 -0400
Message-ID: <20261020032652.1920998-1-liam@infradead.org>
X-Mailer: git-send-email 2.47.3
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

posix_memalign() returns zero or a positive error number and does not set
errno.  The check for a negative return is incorrect and a failed
allocation goes on to copy the guest code through guest_memory unset.

Test for a non-zero return.

Fixes: 32118bdc9471 ("virt: acrn: Replace obsolete memalign() with posix_memalign()")
Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>
---
 samples/acrn/vm-sample.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/acrn/vm-sample.c b/samples/acrn/vm-sample.c
index c61e0f91456e0..0f98d2d75ae7c 100644
--- a/samples/acrn/vm-sample.c
+++ b/samples/acrn/vm-sample.c
@@ -54,7 +54,7 @@ int main(int argc, char **argv)
 	argv = argv;
 
 	ret = posix_memalign(&guest_memory, 4096, GUEST_MEMORY_SIZE);
-	if (ret < 0) {
+	if (ret) {
 		printf("Not enough memory!\n");
 		return -1;
 	}
-- 
2.47.3

