Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426693;
	b=CrOPfwl+LJwfxNEhbunpL9Qk/OPiGjxiwd9AVa3pGK1Dg7ockixARbujyPzhpFpFZcHS
	 CrYap1uKPsMBimVvS2pRD+GuaEqkYE00PLTBsrFxq0YgH5VPW3R22oSZeSkPhCOwBhGuu
	 hn64RMFdXqgBFZONgrbZcUwjW6UbgTz9xnKw4qnLwdSQfQhh8oM8zh3jGfs86Pnx2fVgR
	 eZHswz4GyNE+um3CRU9gzs1YyV1DtTh76D5rCItHXPRuB8PwgcSxw1+3fRmdNo8lLJ22+
	 IsJnx38Gt8tfhvH1quUDnmutAmULCIfPxZcRxq89RyMEewdXfHrO0f6ZzmcQaewTMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
	b=oGQARmElQbT0lOP21+hKLD0/L5cA6IoR8P09ULaznaZ7udeHwiKyWIWUqw643FnpcYPP
	 G54dSnInFxwQmWB1m1tAFjllu9pHUIqUtxSsnlKGCYG9bwsog36tPF6JxePky/yIfX4go
	 LdFjjf+DZxj/MusOd2JkNPaKi4CnOSqaaaWUq2KMDp/qyxl1oBAfgEKPM39TQRIvMHs29
	 lFwo0YoKjt/H2i875suaIi2qTsfPxhlg2jlwsK4h0Ysn1YUNm9dWp6OLIswCAg2lLlFxZ
	 HQHVSG9G48jz58xU/OsZ1O+f3t6EH4MT6Tt3MzKFi6JMUCmKJk7fwcT/Xlxqj+BYFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A3606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A8A3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso4427036eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426692; x=1793031492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=NlghLLUF2FbNboWwLud4VJ9BQloVK1P5Z2CdqbcQVhDho2r5kJ6nuKmYD2aZL9lSgs
         XUyzYjjjAJWcpCFbC2L7wWmGJ1bFk7fZtKpmansYVFVyVdjhcuxFTq6Crym1jiqGsQ9J
         FQBjTcuqfrizyKhzORa8P4iWbh9/Y7y/7IVE5ay/ZGzQri8bQfODzav9KGpIwmSlWGLR
         RyuVHwcQKGhVzV5SQ61QFz7pE8CfLm2JeaT8beVGh6vi6F2qSlanO2cXcbAOFYavlFT4
         bz32NgQe6uyP+9PGDwiSYq0APKnYZsxSvyKkH0fE8hwEJg7LgbQD8CANBFqDMHZFpSgd
         Mm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426692; x=1793031492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=x4rPBrJRXu/yzBgS7PzT5c6dCa/Ghx1Q0LnmRB57ZF2NJ4qQ48guT91KIkh61TwNpF
         0aoh0iGKaJ6bx3IEiI1UaqXgX54rq+RcFfq694jPPACnyWA+amzcA5f9x3EBz//uUhvd
         j/ObonuzCpaBo0BL7ipNvn/BskkzvGin0fn8X8hddkm1dWP1rSO0Q1WW31kGe+8LPa93
         hgXt0LDxrl00wiGr0Rw1U5xBAQyZA5EhF6ORMeAg6fEuPT51lA0wZBU5pNeA0AKEmosi
         1U2VHHp89MJRXzjj8QVeNmJR4GOCaWP2tfuhRlni2v/O7ikaeEvjSe6ymQFzPP5O88C4
         ZO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbqvSBC7PGLBlq1EgH9ClWHkNUQJkoYEJUuEj/oKj+AOFweygCGRx4ei3ulSVZp+ednMrIYHkyl056/Mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKK5d9IHMIrqzksoVw3vxGCsh/k9I/y1z0Kb9eKYI5nbwQ8JPKS
	luvHZjBOw0SvcgcwE04uan+I1xn6s5+vQ1xA1Dm6ds53Dc27XBkCizyd
X-Gm-Gg: AYBFou2jRxLfcW9Jk4NRkzhah4mqdOAK1lMZ7i1D6tqhzUWPj+Dgyuv6o22/SmDbCIP
	s/HqNEuKzOk9oyc8k7HPCNAoHFfjcEaPmXgeKW8ibmy8bz3BnOwxc6YRNAkHiQDp37P9UVEmmNp
	94A7xfEaLGVjR/eCqG85OBE0KC3yubu8EbPQXnsdajvO1vyNhaESI7+ueeh5dVn4g78QVc9W/Sk
	uorXW6jt8/msW6G3ejDv84sX5tYATt0LTJqGr69WUBJ+ZL9SslhXIQ9Pa0vfOs1h1ki98IA3+Jp
	jYNCzGgKbDR1EcTBqBbykq9lHf6pUPabVY78Zq4kKQr7syeK/jLV84HpUCFPr/lQnEq22JMX/vB
	IUKCtkcysrivnwe0IQXBDKf1IJPLn9HVuwvgcduD0+sI8yUR8EV6UoSexjeIL8Qyz0Dm4nYj5VX
	4vutUTF/IEbBD9YQUO5BJ9vKo0RWpSfQJAex8GHiNJzqdggpgqGWSTPEMj2syw8I8BAW8mZmzrn
	sNq4ikRmcHMybZ3kh9XTw==
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr10294813eec.11.1792426692027;
        Mon, 19 Oct 2026 09:18:12 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm33412914eec.25.2026.10.19.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:18:11 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: Fix the wait for SHARED_MEM_UNMAP_REGIONS
Date: Mon, 19 Oct 2026 16:18:05 +0000
Message-ID: <20261019161805.2427-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
GPR_BASIC_RSP_RESULT, as the result opcode, but
audioreach_send_cmd_sync() waits for the result opcode to match the
command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
so every unmap blocks for the full 5 s timeout and logs
"CMD timeout".

Store the opcode of the command being acknowledged, as the other
GPR_BASIC_RSP_RESULT cases already do.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..379b15b7e503 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
+			apm->result.opcode = result->opcode;
 			apm->result.status = 0;
 			rsp = data->payload;
 

base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202
-- 
2.43.0

