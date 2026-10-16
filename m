Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456A3148D2;
	Fri, 16 Oct 2026 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.56.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148185; cv=none; b=oq2eoZQm4LXQvI82LhJ7FR/b8g2eQKS5alMbu6h2cSCmwgfL7PcjK/xq9yEo0B+he9xdDNsyI3xAovuK5FrJPQvnn62S5P5+Q6BYky7O5ik8Bb8r9pp238y9/EAK+T/zjY1KzTNHRwJ1hDVGTXEUZ8LD/X214zb2j6gk1FFEngY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148185; c=relaxed/simple;
	bh=J9pkcayGNFvmgFAZpyUDfNK0PQ/3oyoN+jf3dqrCLUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NffVQLVCXrWYe/t1VHq+yvRadcLSERbnHn1DnNdjwyaABRdTnP9i9v8FS+SD9D3Vp332tFHQnZJ0DpUlSveYaFlEdH72Wk3eGRNEl1VWbrEgIKeGZFQfIGTBuah34YFqMtm6c+PwUEydOFRIL1AzXDdXAwfluk2NBAFkFhFphaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru; spf=pass smtp.mailfrom=ideco.ru; arc=none smtp.client-ip=51.250.56.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 831C220793C0;
	Fri, 16 Oct 2026 15:56:13 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id C15E0202EFD5;
	Fri, 16 Oct 2026 15:56:06 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: atomisp: remove dead error check in ia_css_stream_create()
Date: Fri, 16 Oct 2026 15:55:50 +0500
Message-ID: <20261016105553.346322-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ia_css_stream_create() the return value of
sh_css_pipe_get_viewfinder_frame_info() is not assigned to err, so the
"if (err) goto ERR;" that follows only re-tests the result of
sh_css_pipe_get_grid_info(), which has already been checked, and is
always false.

Propagating the error instead is not an option:
sh_css_pipe_get_viewfinder_frame_info() returns -EINVAL for capture
pipes in RAW and BAYER capture modes, which have no viewfinder output,
and atomisp_set_fmt_to_isp() selects IA_CSS_CAPTURE_MODE_RAW when a RAW
format is requested in capture run mode, so stream creation would start
failing for such configurations.

Remove the dead check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc384ca..6f8cec1f1d87 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8120,8 +8120,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				sh_css_pipe_get_viewfinder_frame_info(curr_pipe,
 								      &pipe_info->vf_output_info[j],
 								      j);
-				if (err)
-					goto ERR;
 			}
 		}
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0


