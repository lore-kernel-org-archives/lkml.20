Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638904756D4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270569; cv=none; b=ZuFcInkyN64e+Lp4WWmR4fyRc8YuDwwzN0MUNPDZJFPzMO86FW4CwVkhkNQyEojt9kTh0ir2yErjZNRyK1YCsvtnJztLjIKYeRCpVIbL3irk8bxCzHzVO4/EuWvjX3LKl3LTj380eLmW7KbDBCVq8F75h57CAsjo1K919rthtyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270569; c=relaxed/simple;
	bh=SjKX9sTXwz2ut/h6O2xnuMaCyCGtGNClcvUcOouqPhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gj60vSuRw4Ihtj3fNbg4uEEFBEHF5IS5g+SS8ZsNjP0g6MFJtIkUaEXybPdMeuMRio1wsMAPjHT6K4j52PIHjoB9QDMa9ChVFbrbNs/kqa1QVleNR5F5rQuLPXxIvdAVQ2LpxEtcL9Zpc42tcdOJ8F5YEg4TtjiRyRh6QktoHXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=u3Nt6eEr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ou1vbeiN; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="u3Nt6eEr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ou1vbeiN"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CB85EC017E;
	Tue,  1 Sep 2026 09:49:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 01 Sep 2026 09:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1788270564; x=1788356964; bh=Rw520xsl7v
	KOsSdNaWhpcfGBoEErTWf7w/EMGC0/QcM=; b=u3Nt6eErZI014vbwI5MK/XBuTv
	aFKVObzPH8Y0+96/Cp07AayGKtZXagDXlFngba48rdU/qPXegTguWfoWXCf/82dh
	D2z2UFMd+knL0UrCstg2CHKpFUpHW7xyQnSfgWWIHAAL/x1oOvXbl1m/NCAWIBcn
	tMKnclmN6V4TgfftPMYvEHok5kRZArFqWVkVmRty7t9LAbkWhU2uvG6qzWCeY7lY
	1KhFDjiGmxAKmoFG5pPNQpqeF9Y8PG9mptzWZrBU3FXdWMGpp1gtXvOQ2WjzUwO6
	uHnMHGAIX/SXFI1P8zYa3lhMieswM6q1R6Ni9Mbz60Vil/ta29tYwG9iJ1HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788270564; x=1788356964; bh=Rw520xsl7vKOsSdNaWhpcfGBoEErTWf7w/E
	MGC0/QcM=; b=Ou1vbeiN9B9/HbU89UQxLo/MM/fpTVGiQ6v8igee+TpyHRxRBMk
	ZBy3LQ6G2hW1P8xmHIUGeaVTD9MlYJorSmfSLXl88vTqBGryK7uKnPG6434MGcU1
	N0HH1C8Z/UPt+16RvGVI9VgQ71+a1iMjemyJtN3EDdD3V68AQUdYmt+vbLnEIGwC
	efKW/fkSXYAA4hqRZzwLiuC8tLNObQgjEe+jRP+tcJW2o7r2U0Gmnk4UrJzIiq3B
	n5LfBACZ5Mudhdgp3YRZr53uXMZkFwxGljBoa87Z9vlf/Z2qxYdD1AOEyqW2y5mk
	onwiplkyrv4jodHLJs66e5mcAeJdxLABVsw==
X-ME-Sender: <xms:5NeWampKpnOWb-mLk8B32zrSrZqG3_ruNFOEH9bELYFb5e5ZKER4KQ>
    <xme:5NeWaik0O1ITpESFdQer0O6hpWWo63KYJ2uMtbMQVySs_hts3krS-E4lwAvrj8CeQ
    _M34OJBpC1zpBD-VdxZXRrNvyde_HVtlM-jFuSdnnXI-L6F99nzY695>
X-ME-Received: <xmr:5NeWaiyJpMFUcH0XFz3pcK3-FpHWtCd7VJbKAvpJsVvGWFLNFDGjVC3EsKAlVTU3JrF8Bwgw3OjMXDON0edo9h9bXa7z909yJNAc3W0bXOE>
X-ME-Proxy-Cause: dmFkZTFXzn7K4IBs0AWjSrBi1tbDLqn6FsjD8REj5nY2iBOsmJjfU3X2RVJOVPSr6tvI6N
    2pywvJryIh6VWDcFn2Psxxy46x4iX/JXqIMck4YkJxS80Pd641e7UecTacmQXX8p4mO2e8
    O7HoMXyVkYRSDIQcDx9/a295NAnSfTAt/B826qrjb9ohqI+Q4lOOPdixq4WheWtbn5QW8U
    1IAtneHXj0cMlXdDRVre5HPv9Rm2oCaXNS+uhO2mOXPMiCj1FZ2bw1+Ilwh2IVjIfkAhNh
    yfDXrgXbjaCYOnWWDrEYR/63u4lxqJNHti6k2tsKkX1DhtsK60cX8dpVE/Z9DvqyTJGneD
    eFAS0N/pl1fYRcjFgg3De8W4BCjt6so+IZan9TEjXfzdM4db63wFKQAXED63KGtdb0E4Hv
    7QWVCOlLvn2z9jTF3QKjXan62ZUrPXk7Se41F/Hr5Wqg4nKvrZj5Ghj8b5uKlaTZMG0cgD
    xTSBOgLiej4Zh3OowPJYVwMv16Sb58c27wZyCYxaKaVT85Yf8ctUE0PmgJIFfpmnIi2ZR9
    +5sLh2G6AinjT7hZpvdfCYWQEO6S8Bndy8Io1TS9lRKrhfEE7PURG9Wpdypdok3ysuII0I
    cNL/Onq1CnRM+8pUN3MkblhKrz7SsUBomv8BJHbcTqfzpwImmbwDL3rMswQg
X-ME-Proxy: <xmx:5NeWainbc4BRxmOZbMfIcqVA15FYtcDSRQ5LqB9muzU3bafPgEsVPA>
    <xmx:5NeWajfZmzuhnCRJ5LKi6M3Hm_tncgWEH_mvrNuOFAzS2wvIpPZW_g>
    <xmx:5NeWagreCAn8NQBU0NiQ8ivPyVj8xvGA9buSfiryA1yQ1D5a1oea4A>
    <xmx:5NeWap6O-WGL9VYX8dpAzfSnDLXxxl1XPjpVpt2QiS1e-oNy194jdw>
    <xmx:5NeWate5tYJAnzT7qPk2SDeqjP3LY1ioj7At6zAWKlLqNOp2VMqikxA->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:49:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: fix wrong git hash in code comment
Date: Tue,  1 Sep 2026 22:49:21 +0900
Message-ID: <20260901134921.2386739-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When refactoring device quirk code, the wrong git hash from my local
repository slipped into the common header.

Fixes: 5a43dc9f4ee0 ("firewire: core: detect device quirk when reading configuration ROM")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/linux/firewire.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index b41af502bd89..7fa1a3fc8ed4 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -175,7 +175,7 @@ enum fw_device_quirk {
 	// See 10389536742c ("firewire: core: check for 1394a compliant IRM, fix inaccessibility of Sony camcorder").
 	FW_DEVICE_QUIRK_IRM_IS_1394_1995_ONLY = BIT(0),
 
-	// See a509e43ff338 ("firewire: core: fix unstable I/O with Canon camcorder").
+	// See 6044565af458 ("firewire: core: fix unstable I/O with Canon camcorder").
 	FW_DEVICE_QUIRK_IRM_IGNORES_BUS_MANAGER = BIT(1),
 
 	// MOTU Audio Express transfers acknowledge packet with 0x10 for pending state.
-- 
2.53.0

