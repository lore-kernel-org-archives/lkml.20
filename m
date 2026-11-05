Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854972;
	b=p4hTduHXf1un9HMa5xyNVQ57Uc2i1SOif5n9dGWXPJDrtXrvdl08jMcC9o25oMxQaJ+C
	 yhRre2uTzsDGuSO0rBBGriKcbtLowwa3lDoqCL9mCpP2Z2bzfD/GpGkDpcwSP5n526dx3
	 MHkJp66iGiF+FO3OJN0APOFClgIPl3WSH73B+k5l0PjGHqK0bpOlgVjxJ3/IWbLBqHD4g
	 +hyO4Jmon490xsCxVc8T85xaA4cfAkcL/5AXPYjonEQc2TUX8Gg7YqVxxpxAWjYCYikfv
	 OResjZF7293JbQaXxawhxnef8NWW+ITHGQFoKzVc0z0i7JLKBWl9V1sTmp1k0/5LzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
	b=yltR8jmUENVAHtyO8s9Dt3J0695p48KAqd4jt7QTgsLcBRHqkFFTjbxtXzdeuD+ZP/X3
	 iFYkSjPHFUY2oXebPLmgiQ6goT5zp4pEsBHljEGCQA631sbYY4I+JlReg2pAdBvc9bgTT
	 0/ociKd4nN6HBmY0ZIFty32330Q43SWASw5+787bnae+zOdU4QCylVqROYWJ1Ar8rncN+
	 /idlp8xnkzAZROLSW7xkRQ95WRbZhSTe1BzxVWkBz//AjjVAUUdqBQE/lstIFCRpyLEDJ
	 i46afVSEcBrq38euWgiVVXRZSg1bAokT9tnBtLPMP1r/8Pqh2FeuyqD3UWhr/YojfFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxNtRLI3;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8B606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB8B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxNtRLI3
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so1688754c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854971; x=1794459771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
        b=VxNtRLI3j9T/8JzZeBa7Vg/9x3/kswBzW6MPGKAqaXfVyJ3lITbV4/VITEAICjFfMf
         eMk2B5AHjHt7knwLMB+T5Dshpo8fW5iugQoOKGXGvPz3mr5TGAdRRLcJWqL3TK8DyxDq
         cnBt51+U0LBmPPBvJyvPOSnvB5X6rTiDbKxi4szD6gQ51Oksxy/4Bf9/dg7xdWFE5xal
         ezJPO7Yz6vgEQ03dSP9ltynu3OCWaAeHuPGbVFyqCwv9sIQRTT5BErN8iBOywapHneTH
         3W9KbNFG6O4UgwRN8R5O6iyiVcff28vJEYPlqlQ4lLwQII/aIh2g+A8eGVJPWgXFSnUN
         Tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854971; x=1794459771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
        b=t2HO1NlvvT1zAo/ldUzXF9vM2BvOozCrSWw1Il7WrnK5NL3aFvlkzKXmfrEl4pmq2c
         OC4k9uTqo1eo7OUb+QGFzrVbFKJTKqt8DrMpPOB8Tdfo3ripftyofOv0vVQm1JbFL97P
         s0tFLpoiqKVZfEdEJNGTPR3QfuKpLQU/fjNlHEKOz30fJy1FxSsM/cnZv096kWTwm1Yg
         24kFoPQQUetNawTy4WoBW6jWtPEa2LYECLzWM1P7BvNHxIqHe1VRnU5WCN+6MCmNBTwj
         JQK3VqDOrJ9yadgzSzDgl/iyDFebBk25FVjzsFaEcgK5y6Shp+0Akz42gg0ByQwNMkwe
         Imhw==
X-Forwarded-Encrypted: i=1; AKwUvBw2ZodBGYdEz4div0YMVXMAWhY2yv1P56ruLOB/Jnt2WSBfEbqpo3FbnqoQiTgKO/53o0xMkJwRpuVcnuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g/NkBO0mDYYDQgdgG8IQulQz/ueSpkg7DrcSaIMdX285xU82p
	XMoxAfPVBw6hpOQLv1sLiPRLoOTCPerH+6z4gWANicLB90tLTpkjPLBn
X-Gm-Gg: AYBFou1BgNnnEktvOX3zJaqauwr8DoqVm+IZSDTNAzvN1Colb3XVgXJ/pq/vcDKJkra
	hW2kH77i6L58RvI7BrilfMZpL+UOocxM6oCuKbj3O6OvXQL6Dry/xY6obRqRHNoHgPkEL+BLPH9
	1deL/SzNqSKYfkt8bGas3OGQnyNSk0QUGlPKMrrPfatwbfEb7Y6gClWtMuU6zfpz59uM1bxlQUv
	4k/+P+e/8XZivzktYNnYHEm3C4y6KkbgUODkZAn5dxt/fkmj1rIqw4RdKeX7hrxBOvaXer3aShX
	3hTUjmYtydKmkiJ7toX0nhUZDDLBAMXQO0b57au/RwlVEkjWe3+icJVYC+D5NoG2UX7R1z/JVcH
	Z3vIhpIhMnWQg39O3I0mvgYd4MGmjRT2YaVkcDwLWx8Chr5gCFgSZTHEHWiPiVpcQqdho3hoyKx
	BGs/OcllASTxWJZaZ0s9/v/VWbJvbIzfBsgFk+RBEjz9ORSiFeG9bZ7BymMm5ukaq+rX020RqEo
	9uvFVit00oMobZHuyck6dVbrdFNzJorNphnA/7fqIQSfNIkkymYL1yuhKfKawcbTI7g5JrjUp1e
	+Qlib9Tc4LAyIpRSDLOxbZASpoYrp23KggqTkPuIfSTHB9dtXKoR/iRgo+iXjA6B3PG0EvIS3D4
	=
X-Received: by 2002:a05:701b:2816:b0:182:94d7:f76a with SMTP id a92af1059eb24-1ac6088a34bmr25504978c88.43.1793854970493;
        Wed, 04 Nov 2026 21:02:50 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:50 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/4] sctp: report the partially delivered MID in PARTIAL_DELIVERY_ABORTED
Date: Wed,  4 Nov 2026 21:02:23 -0800
Message-Id: <20261105050225.49292-3-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
References: <20261105050225.49292-1-tim.budding@gmail.com>
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

When an I-FORWARD-TSN skips the message being partially delivered on a
stream, sctp_intl_skip() passes the MID from the I-FORWARD-TSN to the
PARTIAL_DELIVERY_ABORTED notification as pdapi_seq. That MID is the
highest one skipped on the stream, so when more than one message is
skipped, the notification names a later message instead of the one
whose partial delivery was aborted.

Report the MID being partially delivered, sin->mid_uo or sin->mid,
instead.

Reproduced on an unmodified kernel with the pdapi and pdapi_uo tests of
the sctp_ifwdtsn.sh selftest added later in this series, which pass
with this fix. Reproduction and fix done with AI assistance.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179293012867.3134.16497481637722705271@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index 869940001588..e239da686f68 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1257,7 +1257,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	if (flags & SCTP_FTSN_U_BIT) {
 		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
-			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
+			sctp_intl_stream_abort_pd(ulpq, sid, sin->mid_uo, 0x1,
 						  GFP_ATOMIC);
 		}
 		return;
@@ -1268,7 +1268,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 
 	if (sin->pd_mode) {
 		sin->pd_mode = 0;
-		sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x0, GFP_ATOMIC);
+		sctp_intl_stream_abort_pd(ulpq, sid, sin->mid, 0x0, GFP_ATOMIC);
 	}
 
 	sctp_mid_skip(stream, in, sid, mid);
-- 
2.34.1

