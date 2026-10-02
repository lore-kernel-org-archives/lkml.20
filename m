Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83741E6A9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970637; cv=none; b=AOQfB3hTwTTc66i3L93tIskTiPfqMKmTQ7Vkv3eRrf+0RVFbxp/U/SWsiatnpZmzIHz5VgdFBbmZu4mpl8Lgy2f7zYZ2pBGyuTmuz4jYRgyVSGwu5WpyIvhptM9qxyuKQ3dDBIp8r/cxOwHYLXfgQxY7g5JGDdP5/vey6jmeL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970637; c=relaxed/simple;
	bh=jPry0ZxZWH2qI0ULrUX+JCx/FGm9iZZhCbMohyCfLZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foWEg0WI2H77pwO8niFKS8cC8KubKtmo9p+8d6hezKeUFB3n6P8gN2yL1BfeBQHl91++uM+Z+R7hWOvu6dY70MX/XFbOqdxrnUrObaQ5HWvnFHnOP3Cil46kFvYHjIHYKlZpgQL5fh49I0DquivCy/TfIAwtG29R25Bru/+cgj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=iPKS0/3n; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="iPKS0/3n"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14c81805d9dso45602c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790970621; x=1791575421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=iPKS0/3nt/yps11kzkBCV1f6JgZy+m9nq1oaXe/hF3tlSfPFM5dO+uLlr672/tPl91
         m9ScaGSftrqg4nbbGN1R6CwSxYW/9uqbTwVzBIebRSuHRb3uzuiBWFiNLgshSye7VMM1
         p7sNOnQkyr3gmXnPxJYvA5CZQ2GdZ6juSUqdXrPqxxhwQnT3vhX/l+lC4AmwcRrgIyuD
         p/s9Rzf6BbtVe/mcrZLVa/Wp+wyjaczK0QndkgwvoxTcCf8NqcvVFsK2GLI1oQBCAOP9
         wzEAY851Ypjv6I4EXUGWwkdFQNFIehnSOClh5y72uqmDFaN+F9+cHRh6wsPWaLVYLgyI
         Mchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970621; x=1791575421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+Pr+0S1JlOBX/miOeDu7Q4SuyRTaEP5yuhanTP5lUc=;
        b=cxzePg46lnlnJ9b6XxKv2fBhUMoR6UQZBJpyqtuzVywhS12Pem8gbGMeFjNvNN7pZh
         CFA7KgOtgfduRJ1RDvvpQpak6ZwL7kqQK3JwK7L8Zhzc1JVavUz6jHbbTk6xVRwr7qUY
         TUVTgmLYddziEMZk+xeA3Q+xfroVNY9KPUjC7b7z2t6H4Zq0BG8GLqdGYQXeXT++LyIC
         N6/TBbdvLspWGQE0THSPjC12lKzXUXWLNgM8Ob/+/fO95BBYM8hzRMQu3UVhdBY5i2Gg
         IntfO8kbtHxGXrQ/bZjKhofewMpDsvwo5axP9yF7B5Nuso5uuF09wIvz2DNth6++ekqr
         f5FA==
X-Forwarded-Encrypted: i=1; AKwUvBzYT3ULMhq1cm0rheoD3ZCsHM7CCPgrF3aYtJRR4uls5oUOjPfdNV0SXTWWWX+ei0eTMstMjiIPHB8T4FQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n5+Fz3M/lS18pVNOOweRuGx8oPZsskwT0qye5d5v8plHK3FcXQ
	r76QuWRm0WTou69nOJbWBk5uRAYVrf819HKRUzblnnixTOZYvbZFUU+gls8haJt67tw=
X-Gm-Gg: AYBFou2o74v8nwqV0PFY01pDSAvj8VFkwORexuPdb0BilyxrocumVYFndf3TSwU5zxG
	ujMpVDXqeoqjC95zrW7ALSAPnb9Woec8+PO/MJhSOKJfnAsCIcCCh9lzcoNt+EAmLgpAJJ8QBYb
	MHMoeFuf2JfSF5tUskEZLp3hGLsp9mN8VWFl59/nGO2jGnCoyqSDtCAPAwHhCpx6yeSnswBxWce
	CqsTGfmHOjrJ31BcVlt65fpIL2RF2lEe/IxYpb1bGgarxW6Hl9ZS1LkRfv3zYUeSqY22L65uIz0
	agN6vYRQwHW191ukP3wwN348296HbFdgOeyJpZN89Kb+TZEYVo/7FcJiCkR8DPBD7lXq1nleEMX
	rer+nUpZb+tGUeTsJRFhx6XAd+X79JagnE2r8snZEFJieJycdeId4Sjc/wENl/UhA6h2YDnPMNa
	r/QdIVFLFvd4mDsepGFWh+l9ZMZOaVTPOsPUYr4mO7zYxm4b4ucPN2GKVREyMkBuh54oi2LvZR5
	09gY1tiHwy6Qtjw9QdMDLk9ea9tCbQz8KFNWIZruHy1hPyxDNH8PsI8NTe8/F+D4Y1H6Eg=
X-Received: by 2002:a05:7022:1587:b0:148:516e:53e with SMTP id a92af1059eb24-14dd07fbc16mr9332303c88.6.1790970620487;
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bcf9:6140:24a9:d1e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f410725e2sm7157041c88.0.2026.10.02.12.50.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 12:50:20 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.1.y] media: av7110: fix a spectre vulnerability
Date: Fri,  2 Oct 2026 15:50:15 -0400
Message-ID: <20261002195016.21386-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 458ea1c0be991573ec436aa0afa23baacfae101a ]

As warned by smatch:
	drivers/staging/media/av7110/av7110_ca.c:270 dvb_ca_ioctl() warn: potential spectre issue 'av7110->ci_slot' [w] (local cap)

There is a spectre-related vulnerability at the code. Fix it.

[ Backport to 6.1.y: added the explicit linux/nospec.h include required
  by the older source. ]

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and media av7110 maintainers,

I am working through the small CVE backports still missing from 6.1.y.
This one addresses CVE-2024-50289. It masks the validated CI-slot index
before using it in the av7110 array lookup.

The corresponding 6.6.y backport is already in the 6.6.y stable queue.
The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not
in 6.1.y.
The target-specific adjustment is recorded in the bracketed note above.

Could you please queue it for 6.1.y?

CVE: CVE-2024-50289
Upstream: 458ea1c0be991573ec436aa0afa23baacfae101a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 .../media/deprecated/saa7146/av7110/av7110.h  |  4 ++-
 .../deprecated/saa7146/av7110/av7110_ca.c     | 26 +++++++++++++------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
index 9fde69b38f1ce3..c2956c23d9c1e4 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110.h
@@ -86,6 +86,8 @@ struct infrared {
 	u32			ir_config;
 };
 
+#define MAX_CI_SLOTS	2
+
 /* place to store all the necessary device information */
 struct av7110 {
 
@@ -166,7 +168,7 @@ struct av7110 {
 
 	/* CA */
 
-	struct ca_slot_info	ci_slot[2];
+	struct ca_slot_info	ci_slot[MAX_CI_SLOTS];
 
 	enum av7110_video_mode	vidmode;
 	struct dmxdev		dmxdev;
diff --git a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
index c1338e074a3dc1..642af03fbac810 100644
--- a/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
+++ b/drivers/staging/media/deprecated/saa7146/av7110/av7110_ca.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/nospec.h>
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
@@ -26,23 +27,28 @@
 
 void CI_handle(struct av7110 *av7110, u8 *data, u16 len)
 {
+	unsigned slot_num;
+
 	dprintk(8, "av7110:%p\n",av7110);
 
 	if (len < 3)
 		return;
 	switch (data[0]) {
 	case CI_MSG_CI_INFO:
-		if (data[2] != 1 && data[2] != 2)
+		if (data[2] != 1 && data[2] != MAX_CI_SLOTS)
 			break;
+
+		slot_num = array_index_nospec(data[2] - 1, MAX_CI_SLOTS);
+
 		switch (data[1]) {
 		case 0:
-			av7110->ci_slot[data[2] - 1].flags = 0;
+			av7110->ci_slot[slot_num].flags = 0;
 			break;
 		case 1:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_PRESENT;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_PRESENT;
 			break;
 		case 2:
-			av7110->ci_slot[data[2] - 1].flags |= CA_CI_MODULE_READY;
+			av7110->ci_slot[slot_num].flags |= CA_CI_MODULE_READY;
 			break;
 		}
 		break;
@@ -264,15 +270,19 @@ static int dvb_ca_ioctl(struct file *file, unsigned int cmd, void *parg)
 	case CA_GET_SLOT_INFO:
 	{
 		struct ca_slot_info *info=(struct ca_slot_info *)parg;
+		unsigned int slot_num;
 
 		if (info->num < 0 || info->num > 1) {
 			mutex_unlock(&av7110->ioctl_mutex);
 			return -EINVAL;
 		}
-		av7110->ci_slot[info->num].num = info->num;
-		av7110->ci_slot[info->num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
-							CA_CI_LINK : CA_CI;
-		memcpy(info, &av7110->ci_slot[info->num], sizeof(struct ca_slot_info));
+		slot_num = array_index_nospec(info->num, MAX_CI_SLOTS);
+
+		av7110->ci_slot[slot_num].num = info->num;
+		av7110->ci_slot[slot_num].type = FW_CI_LL_SUPPORT(av7110->arm_app) ?
+						 CA_CI_LINK : CA_CI;
+		memcpy(info, &av7110->ci_slot[slot_num],
+		       sizeof(struct ca_slot_info));
 		break;
 	}
 
-- 
2.39.5

