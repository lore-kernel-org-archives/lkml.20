Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510563;
	b=X4Uj21T97I6Mn89+ExhpYvzMyJg3Kw4FhT1071opZLddE6xX4G+Zwo4dsuD4bdIyzVc5
	 24nsLN0/Ep7aSj9RozEjyBBdHqA9LH3rHhl9XqAvTCjlHtMljJBap8eYFyiY9zTC4622l
	 W9Bi7AjAihO0oVfZbYp+DikdQwgCLAW1ELzOYfvbrEGZJF1b74orafkg0H9NPV+YgQU87
	 uC9lStMnIxvys2p6VIcQzm2rXE/bKqa5K4f83HR6ZCbwbuEYY7xXrIVt6xVXEUG87pN5i
	 33UGTrSRDVgy4vc7COlPXLdwsP/QYzGN2ouq7e8xdN0jWpw32yfkdb50TeCY/M6Vyzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510563;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pOwLtvBNWYcPUXh0MDKShRbc4hIk6nWsRpW0T7LlthE=;
	b=WrCU1Qfk/HGzdHxjvgAO5V5sQXTy4O0ExEP3L/LKGbPz+TrA3vxFSbAWsCRyZPUCp69p
	 pzg0Q7DYhJxxq5XgJVe9XDdqe+0bhAKYAlMdj4vbLy8XLdAnCwCiGWd3zf8ie6cb2SICc
	 Q/bLL0mb3rEztCFYN+UytVTHdbzmhwW5r4d436LyJuwYhwu+ssFwpobImvahGobrBBgFx
	 I9xix9cJHjKazM8fAwWnXaS0UU49jQiFURZz1MllHpFJzgtVSKO9f1VuaRQC995pMTZ6L
	 /INfF3qRjEe2pH6CNojxS/AqU8bVxFt6QWVHKenhtEA/b0bZqzT2uxK6ZcwD79sdW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tFpqJ0az;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F6606A336;
	Tue, 20 Oct 2026 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tFpqJ0az
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475461F000C5;
	Tue, 20 Oct 2026 15:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792510562;
	bh=pOwLtvBNWYcPUXh0MDKShRbc4hIk6nWsRpW0T7LlthE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=tFpqJ0azLNADX5d5UDjN6PB0O2z5IXHbXR5CodntOysND/cjQKab5wRv8suBNW6BL
	 FkM2lo4Fv7WBIAx0BkFFoPnFEfW7PF005V08DWU9IxFiKr6TBStsJQGRbRDJZKjR3u
	 lflyhI9Vt7IK4BAkTGJVfXggRoRR9a6Qx31xpKKg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 20 Oct 2026 11:35:26 -0400
Subject: [PATCH v2 2/2] docs: submitting-patches: make LKML a list of last
 resort again
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
To: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, 
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-39d60
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=A4Lp7gFeUfcf3p09zbqDUXS2edDiBqlXcq1mBxaMvQk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKud4W+LGtslvii+FzHWEYyV0TJfJW3uPoRqfreu1t/r
 GHieyXcUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCIffRgZzrpwMmUn9ocf2Hh6
 Y0/T6mnHxVK3R326NCdTYndCvYaLDSPDu0uWmc1zVy49vH3TOufDSR/V+juzfdfynLuj/eLLbvM
 VPAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
LKML") changed the documentation to say that all patches should be sent
to LKML by default, because get_maintainer.pl always suggested it.

Now that get_maintainer.pl only falls back to THE REST when no other
matching section provides a mailing list, update the documentation to
match: send patches to the subsystem-specific list, and use LKML only
when there isn't one.

Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 Documentation/process/submitting-patches.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b4..b4a2750599a7 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -239,9 +239,12 @@ patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
 maintainer for the subsystem you are working on, Andrew Morton
 (akpm@linux-foundation.org) serves as a maintainer of last resort.
 
-linux-kernel@vger.kernel.org should be used by default for all patches, but the
-volume on that list has caused a number of developers to tune it out.  Please
-do not spam unrelated lists and unrelated people, though.
+You should also normally choose at least one mailing list to receive a copy of
+your patch set.  Look in the MAINTAINERS file for a subsystem-specific list;
+your patch will probably get more attention there.
+linux-kernel@vger.kernel.org functions as a list of last resort for patches
+that do not have a subsystem-specific list.  Please do not spam unrelated lists
+and unrelated people, though.
 
 Many kernel-related lists are hosted at kernel.org; you can find a list
 of them at https://subspace.kernel.org.  There are kernel-related lists

-- 
2.55.0

