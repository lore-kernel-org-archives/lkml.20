Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170833A1A3F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320394; cv=none; b=t9VB9JLm/UdFsMHKWHtbe0rFpwtSN0bSMDGIfgx2rs7o5ZnaJ05GPDuVf36Bz8tD8gjvHl5stc1yFpPHhtqf7ImyJ/cbyyt4Te9Q3LeThstEiIMxGNp6h5Nb0D449kF+skVAw0VSCrsH7g5BVvzV/oBeib5VO9OLyaW2aIOxN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320394; c=relaxed/simple;
	bh=SQ/SYrXh+5CwEvrwpxtX23+FbGxGlYtGDGs1ObPCCVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAM6KL+1mfEassZ3W+ZigpCaPqcZ0WiTOG1YjBRsL6BhVoMgQXIwgjILXyy2J5myf3qk8N7Al11xYO9f8Sggw0pnQI3bhKiCPk9piRieAN1TY7J516mEM+/p3LlBaoHjSiftVHHuriTSS8+T8ugxz5ub9enMeBaRCF6LqTdOvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OibLzQWa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OibLzQWa"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so901924a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320392; x=1792925192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3dVKKN3DPlm8bXuDignnQ0HmpnRMQ+D7u3OnuhG2rs=;
        b=OibLzQWaL0sxmeyFrEvLsDzlVKemXLdZeCQuQFPHTnGYElO+6bQf1FqHisHrRIoCQJ
         1L8UcVPU8+t0I/ehHhAex681Sh8Z2CwLDO8K5s9S1lTylCYUMdJ0DkV4WB5zLzxG3Wvt
         JYYaxSJ3bMjJCGS0jZSjmRYN42VtJYV4UEQBhRVB3EE02bwnpgycbdwHAws9l5ELv4et
         q4TD8muxM2va7YHfgFW1qonMei1ZL6LZ+0kr0DWI3FOSH3jbJgprEUNvTjP2YenVUXGv
         bi8rkvItU2nF4AYcPPcS0EQrPnkgvf869Rv1bhKseNkZSw5ZhvMq4Xoukg9NXNq+SWwc
         ZZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320392; x=1792925192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3dVKKN3DPlm8bXuDignnQ0HmpnRMQ+D7u3OnuhG2rs=;
        b=zhGislIF2IA/lTAaHArUZ/KkYDOYXNzzPu4/Gts2pkkPdHjUUwCEmrK4ZDjDevuL7s
         YtfP3bHtLbEdqcfo3GNn9WLN9yyJmbkabtkOpqoc3KD7suAHzbyvYIvn/er8hVBuqfhg
         pBwZw5gYLunbzy418clN1N0XLbcsSKyBQP+dF2CMfyUqqB3adfmilQ8bOwA8wuEla2dw
         xQ+75vbLH+a27z4arB80pgHGJlRNWBOgB4nCYHTdFN8jXLCXOH8K4uuNy4aljaDr1gG7
         XMc6QYzYOc40oph8yb7U9qxpTOeUURvwXkUm9qHfB3iYDMbIAIzKDQDAGE612JSLLjtM
         t0hg==
X-Forwarded-Encrypted: i=1; AKwUvBxM0zadD3wQun1cbHpXnJXppa60z3p9WNZTiWMtAVtoQsTaUSVO4m7FH5xJ8URB6t6UB0NCUzICAXp/ToY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1YD38rz6ApDXE1Awty2QFP/Zdh9KS9W8qO1JWQcFdOHkbktmu
	SQe5O9AuBaIEmCG6tL7cS4f0mR9dA+uD5m5TMf7p59i2j0BFT6MCEOQZ
X-Gm-Gg: AYBFou0KmnqZcXwxZm8VtKaPqWwTO0mq+5x7bnDRJp5vQQvEM7iHGEYrtZqz2cPg3lr
	KVziIzr4gbkh81DczM1JNx1iixsfO9tArFG03AKISHJ8ujPr4G1oVaw7SK1xyr3GWOHsomQLYaL
	Y7T0UKzIjraHb7R1q2fV1LLsbL9wxQYeh/KCC2rVbRLu6hhbq2m9FL5603HOJt6zR5rFISRs5hg
	57nBXu3pQo+3kotiJkalYpMWXhKcZAohML9LDmpxZLUbRREruQfX2blvnweQor73XcO8OCO/uog
	8IvnSxYpfxmYOelsDKAynFMLsQ6rsqV1yvHzPqiUH2DStX0qYrTdxy6wHGglmoFX4mgW6/w5F/1
	5Y1TP7AbLYowoswEZK7XfA+vuGby03wqAoi/6UR0bWRIYREGmoNnK1Ug4bM/8HRKEw/cNsLE47A
	PJswYisI151CUL0yMstDkocA6Xwg1g6VKehef0unRMqiAa15Xr9EriLtGPtZmgNvjNN67zbq+Sg
	Cin0kwGCJ9l8clR69nzBb4=
X-Received: by 2002:a05:6a20:cd90:b0:3e0:d4eb:a9b4 with SMTP id adf61e73a8af0-3e2263d3801mr3823884637.45.1792320392419;
        Sun, 18 Oct 2026 03:46:32 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a33681sm2949085a12.29.2026.10.18.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 03:46:31 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	jinmo44.yang@gmail.com,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v2 3/5] HID: wacom: add NULL pad_input guard to wacom_intuos_pad()
Date: Sun, 18 Oct 2026 19:46:15 +0900
Message-ID: <20261018104617.743771-4-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018104617.743771-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018104617.743771-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_intuos_pad() uses wacom->pad_input throughout, but pad_input can
be NULL when wacom_setup_pad_input_capabilities() returns -ENODEV during
a successful probe.

Place the guard after the data[0] report-ID check and return 1 so the
report is consumed. Returning 0 would let the caller fall through to
wacom_intuos_inout(), which would misparse the pad packet as a pen
event.

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index aa08afb3c5ef..acf24360d547 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -578,6 +578,12 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	      data[0] == WACOM_REPORT_CINTIQPAD))
 		return 0;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pad_input is NULL\n", __func__);
+		return 1; /* consume the report to prevent fall-through */
+	}
+
 	if (features->type >= INTUOS4S && features->type <= INTUOS4L) {
 		buttons = (data[3] << 1) | (data[2] & 0x01);
 		ring1 = data[1];
-- 
2.53.0

