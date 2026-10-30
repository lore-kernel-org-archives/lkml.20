Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.241.95.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393687;
	b=GKrBQtTGrYSNZG06sMdLaznA7qRIzc84d4umYJFT7UoOt04ob+PY4Vpt5h4cY2VQcFlR
	 H/PVnWLtAZmdhJIWRYPjk4I2l98+s6XBBqmXelKBd21fVCiUff8xV4RGSxXnbF13H4Qv8
	 aAMGkrKwlHGjaSFzn8lCpZnbBtM1fWCL5tbBA2gTjam4F/aRjqNXoGpyeTgzdLpCFNlG9
	 itvhQDig/KwW4f2hEjRODm6eOUuJ5m/bY4/nOcMDvTTmVN45XZ2fdujEYhx9zqvtuubjb
	 MUIvYAV0Ncd46iTw/W2Cmq1pkNYRmWiD/f2WF7gDYKr+DSVhgRpOFCcoa5M1WzCIOrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393687;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=iygEBjuLTEpiry3mQ1K1xWS/WUk91BUJpXuhslscvwI=;
	b=uw4guLJwFW6F+/qtw2WpTaBzXmmq9kTj6GWx4I0djHRuTCEFDH+G/7Y4iKaFjyYSVXIV
	 YfzS8gQq/TIm0ISKMLrBwAFMybXSlAreGQ1LKBN6z6C4WTdohIYB/LDeEcGLaX/6W6BgU
	 om5DmahMiMWbhARW89OpCpcisgguM8wLq62FrZbQm9xnAfBFtWI4dp0D074Re24r6+Fec
	 0Oa9mOlwQV1Tng/j+6hnJeYQmW1Dg1FVUVMQbPdkO6H23VgY0g4S7dKXCM2bZcvBpprP0
	 sIgNy61bKryOGBHX7nupilBPDMLviHDItGlp39Uqbc5jYZpDXxTkNQlT7eEPmt9VmQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=firestrike.de;
	spf=pass smtp.mailfrom=firestrike.de;
	dkim=pass header.d=firestrike.de header.i=@firestrike.de header.a=rsa-sha256 header.s=dkim header.b=mv1tE7g9;
	arc=none smtp.remote-ip=93.241.95.223
Received: from mx.firestrike.de (mx.firestrike.de [93.241.95.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8A3606A325;
	Fri, 30 Oct 2026 20:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=firestrike.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=firestrike.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=firestrike.de header.i=@firestrike.de header.a=rsa-sha256 header.s=dkim header.b=mv1tE7g9
Received: from pmg.cloud.firestrike.de (localhost [127.0.0.1])
	by pmg.cloud.firestrike.de (Proxmox) with ESMTP id 18DFF160F92;
	Fri, 30 Oct 2026 20:54:37 +0000 (UTC)
Received: from mail.firestrike.de (unknown [192.168.28.175])
	by pmg.cloud.firestrike.de (Proxmox) with ESMTPS id 00E24160E71;
	Fri, 30 Oct 2026 20:54:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7562123F89;
	Fri, 30 Oct 2026 21:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=firestrike.de;
	s=dkim; t=1793393676; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=iygEBjuLTEpiry3mQ1K1xWS/WUk91BUJpXuhslscvwI=;
	b=mv1tE7g9/6PyeDhlZm3FZrUEXFqqwPQ2PNIf9JxEPlMsux8aW/4/vd4+dXvr/DEqQOcMjv
	kU9vVfujYkRceWdmtC9DhpjIIpXMJVYI40QqgIWtbH1oUTUnN/Xwi3br8/DlE1xo1tYq2+
	AbkJcF1S9AUf2aNG4zxEF2YCLdMp5inKIxEsLsKAwUPfKneJC9HLvbGr/ab7/lsdXsSets
	WUBC9utfiwNIdd4+/IFryKMuwJmyAPwOUHchJnMQt+tdFGZAcWWHB7lLaktgLkFjXVi77z
	xt6vGhc6MwMy0ngPck8mNMxIXRY5fzBKwOssRPbIWrqbpxnc6/gOgL+u5Tx7jQ==
From: Tim Heyne <tim.heyne@firestrike.de>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Heyne <tim.heyne@firestrike.de>
Subject: [PATCH] media: i2c: ov8865: Allow fine-grained analogue gain steps
Date: Fri, 30 Oct 2026 21:52:29 +0100
Message-ID: <20261030205229.9309-1-tim.heyne@firestrike.de>
X-Mailer: git-send-email 2.53.0
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
X-Last-TLS-Session-Version: TLSv1.3

The analogue gain register (0x3508/0x3509) has seven fractional bits,
128 being 1x, as already noted in commit 3fdd94e2bfa3 ("media: i2c: Fix
max gain in ov8865"). The V4L2_CID_ANALOGUE_GAIN control is however
registered with a step of 128, which only allows whole multiples of 1x.

The control framework rounds every value to the step. libcamera's AGC
raises the gain in small increments, each of which is rounded back down
to 1x, so the gain never leaves 1x and dim scenes stay dark although the
exposure is already at its maximum.

Use a step of 1 so that the full precision of the register is available.

Tested on a Microsoft Surface Pro 7 (rear camera) with an out-of-tree
copy of this driver carrying the same change, as the IPU4P ISP of that
device is not supported by mainline: libcamera's software ISP AGC now
ramps the gain up to 16x, and raw captures at 8x, 8.6x, 10x, 12x and 16x
show the expected monotonic increase in brightness. The mainline driver
itself was only compile-tested.

The problem was found and this fix written with the help of an AI
coding assistant (Claude); the submitter reviewed the change and ran
the tests described above.

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
Signed-off-by: Tim Heyne <tim.heyne@firestrike.de>
---
 drivers/media/i2c/ov8865.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5a59cca8e..75fcc4c9b 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2528,7 +2528,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Gain */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 2048, 128,
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 2048, 1,
 			  128);
 
 	/* White Balance */
-- 
2.53.0


