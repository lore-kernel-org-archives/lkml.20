Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843627;
	b=CHpHyqO2LpTw2ymoW53YqVYIl4O7EOOcKHTbtiLu4A5wTvZh/4AN0IGltwYiB3lPJ2aj
	 a0wwgY+iMHjh80186ZNO9mVYoHKgYcyhTYqmqYEsGmReA2WLxn12zhNJlXlNlNb8x62CN
	 UGrw2jDz1hvY0qL/06tpd5dmUjBgvOsiDfTfqYC2RnDa+oGiT5kRWgUDe9t84uPK00SwN
	 cAq2c8ui5bN8lnsz4c5J4t3+0XMuABZ2pJUmXYCVICve8eGax/ofVQ+yTBFVJWWJWHsXF
	 aRq+rEcp2LLMtBXsSPaZgQMKEezpxCk8/dO1ydXstq8hUcQ+jmjd+eVFdNVz3V9+SrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
	b=l1JpDZ1o93FmuCEFnZ0Ns7XgI2gh1FWtbLiyu3z4/psK2wL8W0B/Zb5oV1RF1Ek9Zpc/
	 7YY81zypHvnYPGZP7zR4WNQGsO2Z1O0EaIdHshU6xfMAL8vrzj/z1SVQnoG8TyTWsv2v7
	 K5UhVmljmrUeAQi6VsqEIBLLMCh7yyCt6EW6ExMKqLa9zCGYKvjjRxk6q3GwIVGEa4eti
	 GOO89TBtWRQQXprujZPb48RxJHtGeZwMlV/oEGjO5EP8cCRAOuXNWBNmRZgcDma7L0GAa
	 SlAbsHXpqadODSES4SBf3iWQSWuV6asmskAggB3N6Y5vH14/AVfPokWX88vkMwnp1Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSY6OdDC;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31A606A330
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E31A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSY6OdDC
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo3480955eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792843626; x=1793448426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
        b=XSY6OdDCSUlPOYv4PuPcxjInaUc3nzXMpvI8UYrp5Z4UXpyCr2KHLZRhqqkK3mbiGT
         EYi249un6JB5e4nmMahZ5NCubG4heReC1qXTKlOuJOZHZL8X2AnA56Qe1YVookEARxLG
         hfzgK1l9BzyWOBdfd21r/jlfhADCh1UJf2DzZAYn25t2pDyqrCVH6DxBLpST4JiGoks7
         RHs2HhOc5DFabGn05StfUXP7GRnO2A6nkhLjnjhzHLjcbOwJn6g3Rf3tchbuQ9ZNzVpr
         mIMJ5yCf3dpPOLs7SB4kWN4FCaqw0hiIlb14dGvdW7SPlHb9Jyp38OOazErINnS8VeAx
         MD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843626; x=1793448426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=os4tDb6Xj+U686/n75PMKZ7wN38a+tP5+DzCKnGGcL4=;
        b=Hj1WWxtcSXI5hg4R+KY6mzSYNWI4gh/jW3gxqxaiE85P1ujQCFvhs+i0x+QUWToxco
         nHr0lEqxQO+Aln/GFPtSoPlwHXLrjROQJLMFaQg/4SLXjXQFX85owUqEivZC06ee383P
         s5Suk0AT4H8yFlXEtFHyDbbNqOiB9ZXOjjg2YGfm6qLVrGJEtk9WkpG40DR1xRpdl0Gg
         Nz6bJcODPH3blNHBW9UdW/sxBMKjZHPbdKf2AYu+4YBUEUDaoeL5Isa2YCa/wiMwc9Ep
         pNjNMfSnvL9w7Mh0S9wzTD1FtjrZjU599/8iBEDkM6Y+y6Z2SdY2cNPT3qrlCh0IpbNk
         3rFA==
X-Forwarded-Encrypted: i=1; AKwUvBxSUVP0Yq61TX+2tWhabo+gk6cJkkm66dGtzqhsGNeWlXxeFuWBP19/OtnaZfHY55aOIYPWK4Y2/nuGNEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDb8pvY++JHDrzYkEM7AsR0dTwuWLyDo7Mv/6dnru21AFntXwD
	R+gggozWc0XPN06flt8GHQJqoPuHChJmAYPAKNKhAitk3Em0CYXgqyev
X-Gm-Gg: AYBFou0aXmarPohc77ERF9AdLcz/sD/FJWi8MOckOXrjsn4sGREIzF3uxtlES1XmK+h
	XpUx8pTqc0UYAje9rEqm3hufPwEIpRZpkSmJT2d8rhalBcibDr2uMQsN+G3fRy2OJ9umUunI4Eq
	LStXqafqOVn5Kwhw9S0Kb4zuQFucLPs+6TPBctlCt3lNmi+vtM23WuY4NKiY6FvbLXHyjAqKkFY
	XLnFGubxQ/Jcnmi25Z2+bSfhs8kPCmSCizJWmAeKAPHYJSC6YnRs78CSLUwa8MPMZ3gPgObw/Y+
	RLVzD2Jqrm11DNwPRwIvYfRIv1qwRS9rZ+kuXuMC/F0K67MvKT9Dsx4oH5oUnH9/OUkLSWdbH66
	qL8xlXpuq+uL7NTBglVJD+Oy8VZRWISLnHk9ioyPQcUOeg8KK2T7DPiv61RTwtmRF9XdohxqeS6
	sPm9KmnP7rCyB2sPbdUsONjWxWo77EYsHFeQp6hm6AaxYiv7s4GTij+SMS+ShVR5NHWntZAWbDF
	fQTZzGb3yahhl7CfS5hbfSoG5cSTdS8K32ocdUfWJ2ughkyb6rKJCR1c//xDXcXLeorGawsPnoo
	1ozBIpGIDvRAgDvzfxa5raQvVw==
X-Received: by 2002:a05:693c:41c3:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-369efd59d94mr691961eec.8.1792843626034;
        Sat, 24 Oct 2026 05:07:06 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d95e91sm8120722eec.15.2026.10.24.05.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:07:05 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/4] sctp: abort unordered partial delivery when its message is skipped
Date: Sat, 24 Oct 2026 05:06:25 -0700
Message-Id: <20261024120627.837568-3-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024120627.837568-1-tim.budding@gmail.com>
References: <20261024120627.837568-1-tim.budding@gmail.com>
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

When an I-FORWARD-TSN skips unordered messages on a stream,
sctp_intl_skip() aborts the stream's unordered partial delivery only if
the MID being delivered is lower than the skipped MID. If the skipped
message is the one being partially delivered, partial delivery is left
in progress: the application never gets SCTP_PARTIAL_DELIVERY_ABORTED,
and the next unordered message on that stream is delivered with MSG_EOR
as if it were the rest of the abandoned message, so the application
sees the two messages merged into one. Until a later unordered message
on that stream is abandoned, no other unordered partial delivery can
start there either.

Abort the partial delivery when the MID being delivered is at or below
the skipped MID, as the ordered case already does.

Found by an AI assistant while working on the previous patch. Reproduced
on an unmodified kernel with the uo_pd test of the sctp_ifwdtsn.sh
selftest added later in this series, which passes with this fix.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index f8c818a5533c..77fe0db5ff77 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1246,7 +1246,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	struct sctp_stream *stream  = &ulpq->asoc->stream;
 
 	if (flags & SCTP_FTSN_U_BIT) {
-		if (sin->pd_mode_uo && MID_lt(sin->mid_uo, mid)) {
+		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
 			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
 						  GFP_ATOMIC);
-- 
2.34.1

