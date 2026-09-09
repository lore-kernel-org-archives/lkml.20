Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0A339365
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965988; cv=none; b=UszUqrujvWXWFB7vNzEo+2HG08Hp0Bgvi1VBJWSVnjCCef4cCSJtvPaUB808RbLvzfzkUgyX5zd0PZbkWdsn27Yml6bLUpNs0v/7KeUePIYvv8YdkOZOfXTmixI7FVEGLDHTobjgd1PWfbhcwiqUxaIdphvpIH8fXABq2FkI6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965988; c=relaxed/simple;
	bh=fLRXqGWckPH+U6knTsv7AHeld/2Isx4q/vVD1Jl46Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pp3eEXiAfce/6cW5EwsptG8PS7m0Gx66yjcGS3sDPpW7oJkQDMau/VxrfSCaBZt+vIi52562hkh0FWoKZz+CmGXOYT0ZfupmDAc1ldcoNuOpRY8344fxKRdZYtBLdPfa3qh8ireAbwAISrlA/8uzR3TxuhFqaPplqPGNly5zMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAA0vYWM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAA0vYWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B191F00A3A;
	Wed,  9 Sep 2026 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788965986;
	bh=VXeTxeoX9Ox9InCXdOlij+Tonj4wDtZlVKruToc6sV8=;
	h=From:To:Cc:Subject:Date;
	b=VAA0vYWMu1uDCwaZG7Hvs/z/10TmCQuIeRsC2qEYZNqtTmju8emTpaTRRz+ZM6D7y
	 ZvAc4JjkyE5tWLb3fHu02oW64xswP6mOpq+C3lfk1RVoEjevmOBdxTDS7/4X+qfCrO
	 nw8udZia/kErxneny+UqytDocVvqJUb15WB+7tfPt7SlVvGZvf1BtM1eVBCBOVHFeK
	 OY0hT0uDgbC4Mh4yYFKctzmTJQwjE1m720SrXwvGaROmYdr6oy1uAXH6rCeyMAZe3i
	 EGOqpV3FbzjEetRtkegaSim0oKeRMiZUdZRvjIXnq0DSBmKO8Qe3fIlWNRdzH4flgR
	 qY5f0YuF7QGcw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] regulator: mp886x: fix two issues reported by sashiko
Date: Wed,  9 Sep 2026 22:39:55 +0800
Message-ID: <20260909143957.9284-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two issues reported by sashiko.
https://sashiko.dev/#/patchset/20260901043123.5401-1-jszhang@kernel.org?part=1

Jisheng Zhang (2):
  regulator: mp886x: check get_voltage_sel() return value
  regulator: mp886x: fix pontential division by zero

 drivers/regulator/mp886x.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.53.0

