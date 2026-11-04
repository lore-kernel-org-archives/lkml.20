Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825820;
	b=FwtEQp3gwt+grOeJfUVKMolY+yQs48wFVQXGdIfAlvyFHV3zvF4LafggwDRAMocuAKAS
	 +COgaFR3H2GrUYidiPXCLQRvNo+U3LsLs9UlDonnV+YEhqNDwSe6BVEOYpc7B5LDZkePH
	 Pb/AqgQjXXBM5YGvIjiyH04VeTYihFzf0mFHi8aETM9E8lruwYTNIaDjXUtMrnxA9BR3Q
	 rz7/nvm1daL33ixeA1JB2oAyr1jmtHd9UqAwR9fUW/0xvMtAoRBopoXS8IWLoQt8k+Z04
	 uPlHXhSMtnNsQZneNtpbX29HzHA2U/dy8uiLoLdcLES262LPIeWzLJ/KZ/alL9FJutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825820;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=rMw5cU1WV1dttzg9SVcRoNcLD6ZZn4EZETWLqKcoFl0=;
	b=Tr/FJe854IvL5zFvGW1zZSU77jxliHY7w0rVeIKyiyaKURd8Urpc+dU8hAAoewfGZ6JR
	 7IBdMfZPTzu/TBrkCxjrOygjGjeZk0fIvqckhGiui0Wq5equm5e5ik1yWJ0UiS4I+A60A
	 tuobetIWNIcwG784IDkIgQ3BNa6sAVnUgKuxDY1+O/2vhZGJzh5G8/t3XU9hqe1WXpYzn
	 KhEUA2QpCtbS1BC4+GNIxvahJR5LzEc0o2EHqwnEvLLtQqOnwSQbRYg3bLBKTnku389+K
	 vAddWZwMS1WzyKUdLF4JdL7smMilXNvdF3o23DrO18utVBgsLuH9OPd/aSJ0qEwIHxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WSQq86a0;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="oX2L77/p";
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41B609C040
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A41B609C040
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WSQq86a0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oX2L77/p
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 287CE1D0011E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:56:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 04 Nov 2026 15:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793825818; x=
	1793912218; bh=rMw5cU1WV1dttzg9SVcRoNcLD6ZZn4EZETWLqKcoFl0=; b=W
	SQq86a0v+GfwBCpnCs4YL+n/g219Yct5a9OCq37jdGCifQpitPkc57NFDjpubwkv
	j+2nSuU0c1CJe3aImZrFL82V+2e2pVfsxU1vObPqTV6mrPx0BszgusBeiG66/IU2
	2O27zscnIfBHiGkCQjvXlJCER6hQee9L6RXX0qRs1hShpT5QVsk/LI6meIf0WVAb
	lGU+yct+KpmQ8kmtQUPP1st6zeFwiT17Q2yJ3uHNCoSW+W/UDc/w/1AnvqUrd5SW
	n+xxjD5B3Uy1ilUzOw7PH7aQ+vWZ0YT/sBzCZiuOmNZHX1hwNCT54vRZ4ax9xvqA
	vjjMPuMExcBMcr8+iBO1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1793825818; x=1793912218; bh=r
	Mw5cU1WV1dttzg9SVcRoNcLD6ZZn4EZETWLqKcoFl0=; b=oX2L77/pVympditGW
	oxSI+lcQUbcr1zmvFcmfMdd4JfLVtzpoli2jhNNPo1zLHXpxAn3TpLrIW0XAkiA/
	LNsf+amzFTZ6wk7Jq+X0Ag330Ki+UoSdEvLKLTZMO8zuu6w+OyCsLzrro2BcS1Pb
	f4RRIf3ODn4d2xl6/kyWeg6nZBDOjUVGYTSSgifX6xABciGvqrWCl6H1riN8nZHO
	nXehm6999lYlwfuE5FZUzZZcDEz4I40WRx7xLmx908+Bm7BfHydnN6tBIdi3BScr
	U07ZjzeftXz2LKvb/Ltx8mNH0Est4BoZ7L1S/RCktSdB/y8SFvdfCrjoAwxX/Xfp
	zXkHw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793825818; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:hcW7F0VZ9glUv0AsL32UFF7LHOkEJKt7W8DIYdpcIQGqJFO
	JvF6mxxe2F9KVdz9O6JoCXT1pyIsxFcLsVhaO4h3etOb8Qf2G4cLgvhP2nzdAf20
	k6/ZaPCqqEZ63i0bQGaFeJKhIoi30O70HKu8zjHzs/WqoTr+cSBi0FbjIi+nE9K0
	lGPA4iIGAIhB9QtP2T/VSc5FcFRDzEkjXcLVYBmSapaaBCQ1GXs8XGpSONuOnLye
	9gpdkYEZylQ72l6aNVgp2JKMNi5Dv6w/iT7hUIxjpadVdvCHtE3fKFoPyMEyTWCQ
	obz5JHbSkiI29g+s+Na4v5tYQWLzDvpg1puEQbw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ADX16sjgJ6CUGrymMjsglwd+zoCV3Zk8VV7jGRtLbxM=:vHr4or6bQPH3vpRpfaj2KnRm53mHKnCkWbxyxHcRfmI=;
X-ME-Sender: <xms:GpzrathBFhS__rIjsLRXvHFY77yChGvu01NsB7pOtKQTq3ESHyoJ0w>
    <xme:Gpzraq9yvpMuDzYFZPMa4A-ngl2vI_JDQbnNPEO2JhccHAbeNND5wu6IBZf-CtKbg
    e-6-RlYHCY32x6anrNcId8HBNoI6Dq70or78feCwb5gX_QuJu42so7P>
X-ME-Received: <xmr:GpzraopWrdSYsyFfBU3BPWPOsEEiF4TskeBvYB_kYk1cJpyicmwPeVKEYr8vEw>
X-ME-Proxy-Cause: dmFkZTG09vig6B3J8GwV51NnVDBCR3VPaumhAJstXVtP/DCbPSa/z48iAGU8w9ZHxQukw4
    r8a4pgmv/tLQHTg9GXz1Eho56lzlf3sin5bgd2uUNW1h5ok+ypqv8T14xLQeXh+rk2Jh0G
    P9DtZASJXBGzZDlp/rExvzC4haSXtqKFaVNG0GFrsiyFSWfiZDBtzEA4YypMSftVrMpTaK
    YAB0/BLbz3SOH0WEkIMUrEFVuv0IedCVlv1ZR/I7E1cXzltK8Q4/z/3QDjJh6Bs4K4Bn7G
    gXWZOrKOJ32C6C4H/BbEqtAVubpXCMAGwiZQmI/5g7k27JqpqFHwxz4FhaoG5zgXM4AtHw
    339CKNYJt6KyuDsOx54vi2UL4W6im2OwUojJkeofUUU8R5bVvbsIIHcAnMW7vXDx8/znDL
    x8deMu0xLtj0g0X8aH7PADTstybxDWnk+NhuvkLY2dXUTPsQYRz5zRPWpPj//4NTQ+pCAO
    kMoe2S/ry6xu7OGGFCwQHyY4QgI7Rtox9sobsMXpen9aszlweu5ftCwEoYMdchYBzE5P9r
    SzPyy+dH9Xy5weq/1HGYelJQ1ifbcbVYOjmzcjhM9dmZ/lOTyXmKOAhLmBoU3EXiaUFPbu
    1Hz509y7cnSyNaere6dH3BSmGE1mnURULzkwydFyr7HAWy8xihjKgsqWQiEA
X-ME-Proxy: <xmx:GpzraiUWN7TIKFXAFbL8yb-ugiR74MKMlHsvVOjDmr7u6bXLQo3P6w>
    <xmx:GpzranAGOQLnxiAQppQRsYo7yEkgiT5KFX62JLNSIM2oB3kQQ59ckg>
    <xmx:Gpzram3NPSGYRa2lhC_KMS8qNaJqWmcWjnW6W9sEooLDo6Z-gJS4zg>
    <xmx:Gpzrap000voYnBlsOUSaF0zBCmufjPBM-fspfjJDQHn7xKGmMX1nqw>
    <xmx:Gpzram1hjBh4rD4y0HxLILO1MU1d6iLMjLH3HFtNkJ9Gs4K6VBmuV_Bf>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 15:56:57 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: Retry if notification enable timesout
Date: Wed,  4 Nov 2026 15:56:45 -0500
Message-ID: <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
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

Found on Thinkpad E14 G8.
When UCSI notifications are enabled the FW does not ack the enablement
itself. Future commands will be acked correctly.

If this happens try enablement again and confirm acks are working
correctly.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
 - No functional change. Rebased as requested
 = Added Heikki's review tag

 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5aab8ab9f013..6633ad6658f2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2095,6 +2095,12 @@ static int ucsi_init(struct ucsi *ucsi)
 	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
+	/*
+	 * Some FW may not ack the notification enable the first time.
+	 * If this happens, repeat to confirm it is actually working
+	 */
+	if (ret == -ETIMEDOUT)
+		ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0)
 		goto err_reset;
 
-- 
2.43.0

