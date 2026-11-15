Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733613;
	b=BOgqoZvPTkcpr1cCD14t10TlLWePoB9pOhcxChyzIPbEu4jT3lrOTa5Ur1SOEndTIk+e
	 tIAsSxP77HnEOEcZ6/AoRqJjWqe04NhCql+FuqWp36AHzZSegNcMcTAXw4gxOxB3NsdND
	 DoBCd3tQH+mrQ+3x0RsaOMbJDlhJlioc21G19yWcquLewrK97oigBwln5Sk+IhhpWzpcI
	 Jp+DuflP3XqozxYpFDpZxGVTPzTSdQVtyYolj9N+KYMswd0Yist8RhvwLqDtporijFhPM
	 v/1e4rSvjoxYW7RrOsE2GAe6LZ4cpe0EljLMYWTW2BYRflq6pl4tWVsb6m0IXbdqu/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
	b=sg7W6ULT4VzGuhfDB3s9seLF2IkXeFzb01kikAO6T3ZFllVjCSozCDoYqlQHLi/das8f
	 zegfpyiSsUNTgRsjVKSImu54m0CKZNh3p9Zs+bpTUM5w78gMl6zrybgEwf2b1/8xGDAs7
	 3sQL0Azl/OS/2mY4Fso+8sSUOievW2eA/2cQQ8ISbpKRFWITs0uplx0nk1LwbL8+MV/9+
	 oNvs1GNsUcwOUv3ebjd8SFp9pew+e4dKDJqB72yiXrV7UgYoMxI4ZzzG+cijUZOvTzrZS
	 9yPbsjj/hxTZI0OCfJQFNcdmZWsdmq9J62euhjJGiQkHU0PAwXaGVZ+GVjz3qlJ/RBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxwEZ3l+;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A954F606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A954F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bxwEZ3l+
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-70b875f6f1fso2970620eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733611; x=1795338411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=bxwEZ3l+gF3hhrgfZPruRh9xtsNxw4gVNyQRdUeu5/jVXQVHoqWq5IMFVu9aYO1yrE
         SpmZBUHiRDlzitE3jlCpVpHHfx3Wc8q/zEnZJTJ0+cHQfe/l7DQ9Gox49Oy2r6zgXnBD
         QeAunfrnrw+iAdv6tI+9zLLOjvY+D94U7wNJk0Cj8eqSy2lKcLjUW7WfTjQobOljNVgY
         LOW9fl8ZWiYFNK9ZHRLkrP3fRLDQj51HRyFvQg1o6BJe6MkFMP/fGE2VY1x5tcUYhiWH
         8hZZMs3xd/qvOmZ1PrHw7Kz8dVVISQmBUFenYEIQuQ7UIkbYmliJ+JvEFIxmNAYT6QaM
         60+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733611; x=1795338411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=T0eRKnwRwBCFkMiPZmI96KqEWDz/upyGX4RzARsFKfigtC2Zai7wG7Kde0ifSXC0/q
         a9H2k5rHUFfRDwd1UkccbMWdYfd/4wbHPs4J6w10jGitwzuKIvCzYKxpYmbtU9dYYpqX
         qSXC9h3gSo9vkgBXKwBjQCcyuW8h4u2rhMCxAg4BybsmmXFxzOPJQZQyQKvFdwd/53OR
         NsW5vBVWoJJv6teVWJpv70005vV/hT8RLVScFJMzY0duMLaOTOtIFwhqTxgNrkCA0ilv
         re5xrjlCgpUnLhKhq+nwO5k0RMO8/wVXwDH5lf3cprHAohMxLhp3S7kC3EHLectKVQCJ
         tBGA==
X-Forwarded-Encrypted: i=1; AL+hErFsBJndi9YByV6N7QMcLLie81dqXNdsNYAGy270ax1HUmWBKSNZblm3HTPZIbFWSd97JXCCRxFSqnwxwes=@vger.kernel.org
X-Gm-Message-State: APuU4Z87EY7el3RlPiitwasyzdwqAWrYodiGUyUCTwVPgbmTshC32RMJ
	W6Ns+xLLoOL9VIBn+KyoP2IT9D5iEX4L4getXU1Yzp8BH7RveJ1O4fcf
X-Gm-Gg: AYBFou1aqNlW+wtvdAkQSonNpm2524Q3nGC+d/zvQUDM+gYt/3hjwiYpunpM+GH1NMo
	bX3ogqtZmXxM21ivKaXFMEPXdt0j7NzYXGVkOxy31xZ7S1DgIod7PnjMNYGqjQthrYgXX50ylSP
	jy/AV4uAgX5PznEh0gR4UVgQ8Tx992GjBkJ/qB/cw9tZr1ok8OHG5VuA1RAxo3u39ol29plyff4
	tMEAv+3B9OsD+IY8XiV9DfMrWnrfrUXFkH1aBW/74ng40EGXm1Mb6mcYn2ZvwmJMTT848uL14S/
	dZ1GVB4iyGs8WfuV1iBFhRZQ/ClEU+oF0Jj/q6979E0VTgqACRMn2Nmxuk7XEjwYSTsLYVgjWDd
	6AvuRz67TylvT6Ky51HhbyjkyN6Lj0/QOyfjA28g9L6hizHyDddQT8cvwJvcDZ1OTS27UDAWU0W
	D309rTWCI2jOesyy8u1/Yb0pxO0p6ZB86F7HHvA3GncZGJ6E+QxgBCfy7seg1U+n5cRbETJJ6yp
	1t3HbfQdqQqw1rHXdsRDh5Dy4pbYfx8202UYPbrcZo/cvgx174o3/snpk27TUaDAJ/D+Y+hxhuf
	2GZC43Y2verARkXFiqb0+ZLL42+x1VzvBYrATwin4U0rCyydgVUxyAGkiaay3AmraG75MxTzdDd
	Qq5mux/PNyJrFBWFu6SrT5Wl4YAorftitQz8hICZKlO8z1BOH3hClscIConbra41NdTcJJYw6QF
	ZABkUXRjhW5RFMWve8/Ln/24s3EGpW20aQHvKkGVFrYtLHGSRmXXcL
X-Received: by 2002:a05:6820:418b:b0:716:c34d:c2aa with SMTP id 006d021491bc7-71ab509ed1amr5396398eaf.37.1794733611590;
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:34 -0700
Subject: [PATCH v2 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move all channel-owned descriptors to desc_terminated. This also retains
a cyclic descriptor moved to the completed list by an error path, without
requiring provider-specific descriptor-type checks. Already detached
completed descriptors remain owned by the tasklet.

vchan_synchronize() drains callbacks before freeing or recycling the
retired descriptors. Repeated termination leaves them on the terminated
list until that synchronization occurs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..d3057fc85a9b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,24 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Descriptors detached by the completion tasklet remain owned by that tasklet.
+ * All other descriptors are retained until vchan_synchronize(), including any
+ * descriptor still referenced by an executing cyclic callback.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	LIST_HEAD(head);
+
+	vchan_get_all_descriptors(vc, &head);
+	vc->cyclic = NULL;
+	list_splice_tail_init(&head, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +250,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0

