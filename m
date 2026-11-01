Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575989;
	b=w/0rSIo3rMpFxF24lvNi3z/yDmPhmvDIUiveI/weZs8aM5gr+ej861x3AoZBxVw/M6PE
	 ul5dVpmebwxMhTMw3rnilL7nzWO4ZCPCBmQ8DWNCVkMJTOJ5ypubvJgbGA65OKFf7ia/U
	 DfiSFgJ2T9hxR+UU/khgsGlgLEQm5M6aE5Trxa8eVnbEf47DnnIImlOteRAKztbOUqIQf
	 FYj3sSehsXJMO4Xy5I8Z7Z+h48IKPCNVaFo09NdudUELvFDZUi1eEIYj90F7No5Ep6BNR
	 8QkhcE+QUs8fJ4siMqyd3lbQAEWGIvn8ywIPF+556Y5ZoNaZZ8kYq5vXDcwzC7M3BNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575989;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=CU857RkNXFiUlImhs3x0w+YO+7ijE+/0FlI8FzDWia0=;
	b=Jd3gaU6hEd671dbyjUd+hBl55sJNat9hf68XUQ5ytx9nJ/M1XLhtA/l1D++g5heOcmVv
	 9lGQXbA2oRF6aSHMAhYs6ND+dimlzGZdqPVzIc5qnqXzWgFw6IN1pIxqS15r8409KdBxw
	 3WdqpFpt+peEZJmV/gVhDbU88gHuETW/Y+82TOSnQ5jJ6x8rqKysCkKT1TvnS/incwa3P
	 GOlWzigvs/Bd2IQ4osDbxHpQWt63uL2/BAFh421PuGt30dSDFoDk9XVvN8Q6SEblhqzbi
	 N9VDuows/v5+l8Q13k7FkGLfIoGsMIFTgN/i6QbVbySP1mjsz012IKFPqwhOkCtySYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=kGZaVjX2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xL7DYj4j;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302A1606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 302A1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=kGZaVjX2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xL7DYj4j
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 7017BEC066C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:33:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 01 Nov 2026 18:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793575988; x=
	1793662388; bh=CU857RkNXFiUlImhs3x0w+YO+7ijE+/0FlI8FzDWia0=; b=k
	GZaVjX2zd7I4MdoLM8z0ccAEykxJPH3Cq56UcuzwNGfaNEpjVfPWe0fGquZkc/zi
	9F0E7E6YNnYcA9DCC5iGNuW/F07RG7+oshBoQf74H+UFa6m6tz6iaiw3YRbR+15b
	U0vqjDZ62Sp03aSdgduTyY3fn0qPioz7bsUJAirG4H8o8/spWcdwuWA9dFDMU8lK
	26KfDPZ+mwmDTaUCHwDAFvwq3RfShGXR2Lf60alDPUBYbR9ctR5DkfxIA7A+KE1Y
	4mroboxDFt8Ne9o1OrznrZBhRcjQ0nvcUft0WuTbvZ6PUFp6KriVH6/z4+tkPcJi
	6te/h9Cse8rmdHi8MVDGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793575988; x=1793662388; bh=C
	U857RkNXFiUlImhs3x0w+YO+7ijE+/0FlI8FzDWia0=; b=xL7DYj4jgMmcwj3GT
	p1cqeB0EAyOn5AKyL3kMAy6SH9yXRyugvHnQXfvdBP2BfSRmlhIucytHTWhWetvi
	isq9bYjopXzWspExg/Gr7ZB4tKqZaG7MS2KjN6xeZieLQv/O+9Hk4rPjqhFpHnsh
	nvwLBDuAK8qwq3dkLUhcXRhCBsR1nNU1mTHIAEIZ3njoPhvoNGHeUMzd29Ovqgcn
	i9Hlmbqb6E83Tl6mF6ySU2Oi3CNNLfs70/+hTgCR92WF0ovpL9AMfZP9Wv2sRQ5W
	8cvGlcqDwWCPFv07hP069qnbXMHIP7UwgfFfBAXZ50N7Vae/ILypAMefyTc3SRUr
	46LaQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793575988; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:BNRwNm4uwQqbeABla5MR1CWCRaQwoDKkmOcYU1pBzWneQnQ
	rCcBvi8sEzBXIzzKnUDfoenGlIqtoO6cKFwVVuGf7XYldtFpAx8ycQtPX7vEiLIp
	a+3Z29AFTpx//XhzSiUl4bWJ1st+nlfNFWgJg5OjTGKSeEwXv9YQLQu/rO6tMruC
	Ueqh9bkS0vG46LdbSt6G5QtrmVK4E1SL4sAqVFT0378jvsDRAYab1tFH9FnJwcPS
	/N7ojduBcsE4MDJF9SwYiR37ySn2OpZ1j2qnPOLDjnBvdh531wofvMbtv4lwAee/
	X1YluIYJlOf4q4B6QZgWRXvwJ/n2LLocpsoNVZg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:EXlBjEXGySvaLh4BYfZhiaZTgprnR5kkMSCPZ3OEQYA=:GVEYCoC7wpb0rgn9qG0h6JBPcqmqm7AXrzdAZLJ9ujE=;
X-ME-Sender: <xms:NMznamijegt3SydzWhn-_-l7y4LP6KT-dA2-UCewynFzYc5hyP2lwg>
    <xme:NMznaoW0uIMi7ugFcYCsoKFsRXaP45UQQP6B-DQ1v1Baef_j8TOAC0FVAsB3ppMK7
    DkIkAK4vKFewUP31IZYfoQatgTIqkye7iXjADdpJYt7zSVxzCKM_tuE>
X-ME-Received: <xmr:NMznaitfn2OtQ3zF228UU7RraNnsWZXDnspgQsb3MQ8PtL94ZFus2iEBHqB2-Ou9qxn7FWbURItlkMSnp4Y>
X-ME-Proxy-Cause: dmFkZTFmoDtzSQBOTieiECu93lSwXaoTrIalHnMw924JDK/PpexZISxDeN20AjdZwjMgvj
    2Q+slC2SlzTeWaOFOoC/EGqh7wr412mvOyLmPG7dZBbRorTdFY64nT0KZGbWqpGHIuEgHF
    iJRoiQ5kjHqYDIbe9HFMF4a8R1SCI9z/t9+K8H6e6SbBi81jn41euQ+G4JhHUfKRncCiOA
    Z6ldHzkijo8MVimkez068DvTvvSeLR/L1Nf+jL53WmnJXStHWxDfF1p+dxRqYI6A0Rig0a
    /pn5vVl1Gxto31tYVS2VbPw4riRvronEz8oXx8qWvMbcNqcBKWGdMICVYMdMbmtlzZevI2
    AYX0BqUIOug8COOC8fT3kk9nzTdGrwbFaVmSfTd1zcjznHy5WVBOaLN21ufmB0s84prq+/
    zQe/hJ9kjsJRZOUWaH6Wx03dmNLDh+Sedgilt3tYz6Agt+lP6655OzigvLt6L/QCaps9Bc
    8vgInUTxT1BEAZJazC3mqcVkoFcScJONcH1Lz3Nd2q/QUArjMAKoNZI17WzMgBxWIlc9n0
    DaavKDpTCedSKAxKm3wuJ+WFzSXtehRo0uKHcKpPtce6qHKi/23girKznkuf1MaZ2IHmBy
    UE3R+NFWpG6L48/LVh+0T0FiXR3RFLZFKHOPKW88QXjRfZlYU57g15CsVFJg
X-ME-Proxy: <xmx:NMznah_Pu0r-3GOagEEm0ToewVTMSzwpvTVeuX8xVoYYOQGr8YmY1A>
    <xmx:NMznaqunxqYD_TQlefbhGDqbcJjl0-8LVUvVNVzmWhgzqQMQ2_WD0g>
    <xmx:NMznav7MSXRfoEGFaYXeMVs91imvpZPDIdiSEZPVG6y_WGE7vk3NJw>
    <xmx:NMznarO_fuQVHU1msGFEUAYlzxToGGMLA4zxGTQnpeNaRlS9B6BLYg>
    <xmx:NMznausBiTa3GdkhYtR1eGiojg147SC078kI-Rm9Hg3oeIizjo2d1L_B>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 18:33:03 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	tglx@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 1/2] hrtimer: Add hrtimer_forward_safe_from_callback()
Date: Mon,  2 Nov 2026 08:28:28 +0900
Message-ID: <20261101232829.593680-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101232829.593680-1-tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

A hrtimer can be started while its callback runs. hrtimer_forward()
writes the expiry without the base lock, so the caller has to serialize
it against a concurrent hrtimer_start(). Otherwise the write can change
the sort key of a queued timer.

Add a variant which does the check and the update with the base lock
held. If the timer is already queued, the expiry is left alone and the
expiry set by hrtimer_start() wins.

The first user is the Rust hrtimer abstraction. Safe Rust code can
start a timer while its callback runs, so forward() in the callback
can only be a safe API if the core handles a concurrent start.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Link: https://lore.kernel.org/all/877bk3ixp5.ffs@fw13/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 include/linux/hrtimer.h |  4 ++++
 kernel/time/hrtimer.c   | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index acfc5f93d967..f3c8542a2dbd 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -317,6 +317,10 @@ void hrtimer_update_function(struct hrtimer *timer,
 extern u64
 hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval);
 
+extern u64
+hrtimer_forward_safe_from_callback(struct hrtimer *timer, ktime_t now,
+				   ktime_t interval);
+
 /**
  * hrtimer_forward_now() - forward the timer expiry so it expires after now
  * @timer:	hrtimer to forward
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index a9dc2d53aa92..9869827585af 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1121,6 +1121,36 @@ u64 hrtimer_forward(struct hrtimer *timer, ktime_t now, ktime_t interval)
 }
 EXPORT_SYMBOL_GPL(hrtimer_forward);
 
+/**
+ * hrtimer_forward_safe_from_callback() - forward the timer expiry under the base lock
+ * @timer:	hrtimer to forward
+ * @now:	forward past this time
+ * @interval:	the interval to forward
+ *
+ * Variant of hrtimer_forward() which is safe against a concurrent
+ * hrtimer_start(). The expiry is updated with the base lock held. If the
+ * timer is already queued, the expiry is not changed.
+ *
+ * Context: Only from the callback function of @timer.
+ *
+ * Return: The number of overruns, or 0 if the expiry was not changed.
+ */
+u64 hrtimer_forward_safe_from_callback(struct hrtimer *timer, ktime_t now,
+				       ktime_t interval)
+{
+	unsigned long flags;
+	u64 orun = 0;
+
+	lock_hrtimer_base(timer, &flags);
+
+	if (!timer->is_queued)
+		orun = hrtimer_forward(timer, now, interval);
+
+	unlock_hrtimer_base(timer, &flags);
+	return orun;
+}
+EXPORT_SYMBOL_GPL(hrtimer_forward_safe_from_callback);
+
 /*
  * enqueue_hrtimer - internal function to (re)start a timer
  *
-- 
2.43.0

