Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509200;
	b=QtW1wJpCt+VqU1AQ8ZG1i8XdPU/wqaiw+mLn7EUZKp5MSQ70/xEuHd7JTIH2xPbdag7F
	 qLdEwS5/IbRVN1ixBbhd+A8djrGmDLWu46ka1kFqQnCGOSFITNE46BrKAJD16b5CaCRXB
	 tMlFvHUcojYVxXGixdVLsC0F+Y4ziwsQ+yumhludeDVes25aeIVktQdipLR4bbh6XjQCZ
	 H3IEYymcIkNkhpzAdb9kg/u5yW+No6N4QlbP8SuC/uQDZn+5OP43FpcLPg7sfWkbV+w+O
	 3ayybqRYe1jWVvRcrhSo72MDj0fSXbL0Z/U5Ms+/wV8OK39Qb1PVOFrEdOjFnTBBzYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509200;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H2h3v76gfHtVHikUOLXmKivfl8RgxeQZwE9oswtNVR0=;
	b=NAG8S1BT2PVZkwerJxawgEu0/q1ByxQTSVoO1pONccfti24PhqkEaOJCLzI31HrRQ2Kd
	 r2RvakBgo9EyosIchdgh5lO53QA+4ojbg+HOyvzN+0Ot4utDddJ0b/hQ/4PRL1Ja2WgiD
	 UJ2P23lo7yesdJzCEhoxIDSZE8CGeTBOqZKM26osufbfDRS//QFps2qir6WQTOQ0JXxkN
	 s2sOaELbdc8vZPih1jrqj0inX7P9n2bjJj9yTCiE93S1lHgzTmfjfHpVvs4eM5sEqFs97
	 MxMsBAvgtbLp+Jdq4CdiohxX8KXD47kfcE7QS58gYHKqJPef0JhjQ9dm1LrebZs0fJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	dkim=pass header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=RQX8OWOy;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C260A2613;
	Tue, 20 Oct 2026 15:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039C260A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=RQX8OWOy
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 680542031C0A;
	Tue, 20 Oct 2026 20:13:10 +0500 (+05)
Received: from laptop-ak (unknown [5.189.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id EDECF203157F;
	Tue, 20 Oct 2026 20:13:04 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru EDECF203157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1792509189; bh=H2h3v76gfHtVHikUOLXmKivfl8RgxeQZwE9oswtNVR0=;
	h=From:To:Cc:Subject:Date;
	b=RQX8OWOyxWLmonu5khKxQSQZ+jAWUJ2qGVYzhGH85gCU/ShSpDEaJda1TtTxcNa38
	 MVZFTOUWocZudu7fT17eJANgMdWQb3v1+8zg6yHodm7J3RHN+wjYMz4IK+cMbXi1PZ
	 gQgxkKo7p8KvgVWSijjKEA3b/GZEyHrbikrWb/9L+a+VapKk8Go7/1z7e0ThBTLqx9
	 RKTbWiCKnRLduzf8A8peTUwICuZA93ccVWAWMy+FRZ1SaLm+M/l5hjdf1OF+l5atan
	 m/QDtJkuL5Q+jDcKcQPJ8/Svnotavt/UXHODofZY21rfohQ5yWz1U30k1KvjZyfCr2
	 5f/WLwNtpyMTw==
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
Subject: [PATCH] media: atomisp: check load_copy_binary() result in load_advanced_binaries()
Date: Tue, 20 Oct 2026 20:12:43 +0500
Message-ID: <20261020151247.441124-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
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

load_advanced_binaries() ignores the return value of load_copy_binary(),
unlike all other callers of this function. If no suitable ISP copy
binary is found, the error is lost, the copy binary stays unloaded and
the capture pipeline is created without the copy stage although it is
required (always on ISP2400, for direct sensor input on ISP2401).

Propagate the error to the caller as the other binary loading steps in
this function already do.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Andrey Karelin <a.karelin@ideco.ru>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 4a182dc384ca..3f3671ceca59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5459,9 +5459,9 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 		need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
 
 	if (need_isp_copy)
-		load_copy_binary(pipe,
-				 &pipe->pipe_settings.capture.copy_binary,
-				 &pipe->pipe_settings.capture.pre_isp_binary);
+		err = load_copy_binary(pipe,
+				       &pipe->pipe_settings.capture.copy_binary,
+				       &pipe->pipe_settings.capture.pre_isp_binary);
 
 	return err;
 }

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0


