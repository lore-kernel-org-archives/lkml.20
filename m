Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044490;
	b=Nk8XRgRvsdd4GlLnKWrIJt1Hm816UhGxLjt9Yl//JnjeOe93n87nDPmrEHFZu2s2rLbE
	 8yW2PJJFR/yAEEa1mNzZNzeSUjk32u1odei3hnO7jLt5EOd1cgiiUMnzyWCUG8Rfw7HNe
	 mDrNalP3VXc79/71g9sbnFcsY+98jYnTSR8SjUyX3PBavwd310E2f8FBySIX4EWJaJn0c
	 uw65TdfA19BhmCGjE/OMV66Yzhck8FxNpmHS4Nyq5PnBoAMx1xch+E7K4+QHPeOkw+IO0
	 WCL1CT4YEWpcO9ZNGw9UTpwmeOLrfIklM4OrI/UGNJ7NRVIyDAXaajhziWGMHs3VaBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hnz1gGcBW/BLbaqLHI+DXFHAqG4Qf4qDgMrLAo2QDNQ=;
	b=A+eBENzL3Du3OkD2W0mXtI4/Ce+0tT0HXIUc4Z+JAiLF5++XWFiDowBx/6pSnqsvymb5
	 JByPDGxF3LcBEauDO+a9MAKfzLsXhFd8awnRJQ7pdFzb4XzR2Ty5YWLTiHh2kJFQHyLf8
	 rvqS8sJCiDXNNd2xwjpRy909j1uiP+S06Nx9iyGjg+WUgAebcTK/IFy6OlVtdcmYE76V+
	 eXATM7iX08seMf21ciCsDR/5QQFKMyiULfEQBVDBf0L9dP1X6yI5tFsQ8bJTBFKgpb0e+
	 UkB0QGWM+O6hZdRcugJ88+eu/wvTMVOuQWFyvO8GKvpJv5ATRUYt+ymtg0BE1iBJy2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=0cebf4mD;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=0cebf4mD
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD48n4lr0z1XM30h;
	Mon, 26 Oct 2026 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793044487; x=1795636488; bh=hnz1gGcBW/BLbaqLHI+DXFHAqG4Qf4qDgMr
	LAo2QDNQ=; b=0cebf4mDiIHij4m4u0EwL02baRi2Ei0EDMf1g9Gp76qfAQIs2+6
	88qC8Q1u7+G6Eu7HfgzRuWzdYczD0ivVHq91tuWI3f5yy52o9LlTaBKq8JlcaZtv
	uRSo6eJps3t0r2BthuvpDViUUQqr7XpZiR+wDR3nfdrrjrJrAkZjCmCV6ggvLuL4
	Lq5+weJnpxe91QRjiX7e07fQzVt9ucXoJhxaPZeBISg3I0OdPyOP/rU51ksWXZcV
	KNc/eamjBaW1jwnX344d8UNIIuL+pMdYjmycbKQVfh7xmNQrBBRYlw1jEJx5DmOy
	3mh0e1gQ+SoukrpnEfwVEViYp8uXyRJ+/3Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PO44ncs_s4iu; Mon, 26 Oct 2026 19:54:47 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD48k592zz1XM4Tl;
	Mon, 26 Oct 2026 19:54:46 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] jffs2: Fix a lock leak in jffs2_flash_writev()
Date: Mon, 26 Oct 2026 12:54:38 -0700
Message-ID: <f7faca912d873560eff94cf729e6d75decee76bb.1793044478.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

jffs2_flash_writev() write-locks c->wbuf_sem near the start of the
function. If jffs2_sum_add_kvec() fails, the function returns without
unlocking c->wbuf_sem. Fix this by unlocking c->wbuf_sem before
returning. This bug has been detected by the Clang thread-safety
analyzer.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time=
 improvement)")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/jffs2/wbuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75d58..c8fb58513783 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -904,8 +904,10 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, cons=
t struct kvec *invecs,
=20
 	if (jffs2_sum_active()) {
 		int res =3D jffs2_sum_add_kvec(c, invecs, count, (uint32_t) to);
-		if (res)
+		if (res) {
+			up_write(&c->wbuf_sem);
 			return res;
+		}
 	}
=20
 	if (c->wbuf_len && ino)
