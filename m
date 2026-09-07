Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB92309B2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762581; cv=none; b=UBCsAjo3pbnwMEgxFezG6mqF0icyub3V6Qzkq35sx/qdxJxym7klYKW/moHTEMrMeTBI+zM86aCD8458cuHYpRdlLcU8JoyDRZZrIN6W/bhXKYIvs2dC8MJT3+loj7kE2T5FXlh4cjVNgtglqCfhtPw9PdQOZhQi++sstdhChRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762581; c=relaxed/simple;
	bh=m16ToxJmWoIxsrQEcF7hTXZXCv5JSF4tDG55iChznYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6PqBl/MdQnz8vqrQSdPLEqRQJBugmdvVJquz6pLLNT8tJv470EyIOb64GJ8I2X1YNx6a/JoTHFWREiMb08ZKtxXodO1S88XT4suanyH/ANJKv90dITRsxzTJ9BW2tS43w/phYScCg/42cAYRYSWjvzMPHw8+ov/miZtXKb2tcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQlhqHzL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQlhqHzL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3964e480f76so3818645a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762576; x=1789367376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hRMrKvD5zd28iXJb4fJ8d4Yox7o3xWoOBxDTEiH8DA=;
        b=MQlhqHzLOkOuy91QagbF4DK1RPxmfZEY2Gc0J1ajKrN7jPyYKO+H51CHajzJkViHd1
         p98l+EjgIk0KlD39XtChQvzhWBa59M5rezFnU1h99t6DBJyziuLWEf4ImnDgBRVVHcER
         HgoexS8oJZqyBs9u3Fc0JaKgI0pc81guwGUSOD5KCB4n1qCHTlIN/3eVUodBlSFCRwMN
         Y+AdW/5BDbMyGZN7tYTwccphRJW3fqNftMtN6pjPV1Z61sTB4jS+D/ZiDa0J4PEjhZc5
         ZiZxgbyAmBr1pFue3qq6XFzha85hPOBOf47oPUKEa2R7BVKgxjJlTme1Dgezecr9RfUH
         1qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762576; x=1789367376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hRMrKvD5zd28iXJb4fJ8d4Yox7o3xWoOBxDTEiH8DA=;
        b=GHUmREU6L6P4EBO1EUTQun9e56CUQtg1rAdq5QGVsRyO4gOHNRBEWT+uPOBFLPeZmb
         jaJd61zYVgKZ97kFEUQ+pm3xbpniEYn7xn1d8+TacTbG23/Yj+tZdU/QfsYCpqjN4YFI
         nshFhiWP3ETIYBQPKCGP6Wudhi7yvTLiXWLovsTHzpMDUa86JMer3nzG7jVXuoxTC3iz
         zrWEZRjVdc9CEaI7nMYesRiqAojh+S2XRBXjOgxdE60c+TQFhvNeUE/UhPHBXzfC0YNo
         rfKfjim4/E9Rz/hKnjOExx4iGHXPxdN0tiUdzMlHasQZcIo41PXVAnGJ2BSrfBWXEAir
         EoTA==
X-Forwarded-Encrypted: i=1; AKwUvBxsVp6J5Nz18ZVwpqxN/NFTuPLYyT3Ip9XyJBz6JlQg9Qv9/1Jcl6WFxdI92WUxOGzDTdvYVBcPHLlngAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kZi97BPfri5nGwnOLBgVKeaB7Mk8f1Wq4Lt9h2g7xiQK5w941W
	/5F2PMg4ORiOE/3I29+cKOU/C/K7OX1A5Ao0oLza5BSzwuwJ7CdlmZRR
X-Gm-Gg: AYBFou0j/ZqQGr6lkmeQ+JDr7lNEAMKCJdQA4BfPu/BpC1h3TdKd1pM6mSoNQaSm6wp
	9GRxSd3JK4W0+ZSdLkpssvk/ToXznyP9V78eX3AS0twx6J0yUa5teXPnJuwPdwVf88qW2+QlYYa
	otjVMPJ9ajJ+uI1F2pDme3LG/0ulAWsdcm07LXBNsSWHWtii5f5752b6wmzn6K5mk9E9JBsqx5f
	PxCMbmafhTuRWpTsHit8hI1HZMj2z7GOb/yxGquueJZLTLvaSadF47wL2y7JoLLCL0k8/kuJsqY
	6uXgg5v2BRxiYQrGcHmROT4TaKXcJIohyo+kxzSZd4SVuNGaMcr33cjbV7v/7iPH/1sE96VJwUh
	NTGx3BK0pW2bU2jMxsbVOVM8+VX/VhNqIllhIGJhkWnaacjt0QFKsTuab39RqWtw7PJE3BDxUNI
	foiYXalW9KAq2IvmjdOiz/UQSwlVRFdgQFAPIfVIDvrl6KM5o6gglj95L4zsPaXG6HJaO7/SxsJ
	eHM6FJkNA+XeQ==
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr31897898a91.4.1788762575676;
        Sun, 06 Sep 2026 23:29:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm20423987eec.4.2026.09.06.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:29:35 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: fix repeated words in log messages
Date: Mon,  7 Sep 2026 11:59:30 +0530
Message-ID: <20260907062930.18120-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the words written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soundwire/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f106a877d7b2..0b00fcdcab2d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1571,7 +1571,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 	if (stream->state != SDW_STREAM_CONFIGURED &&
 	    stream->state != SDW_STREAM_DEPREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1655,7 +1655,7 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1742,7 +1742,7 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 	}
 
 	if (stream->state != SDW_STREAM_ENABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1848,7 +1848,7 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
-- 
2.48.1

