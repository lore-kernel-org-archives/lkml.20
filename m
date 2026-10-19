Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437015;
	b=4NtQ0KKRX30bXEZMWdbpA8acUo8qLKL57fzuN5N5VhMcJECIykBYvp+XhEe3FqNPxlet
	 pZ6w5+bPANnh1fHgRXeY9SlCnxn8kReiwPo1OWOcGsNWipN2wAeRti3YvkHgK7v/S6mOT
	 LIT9BywlQ5Vvkne2NR5Gv3rkA8O4mMxScFTDW4FPG9a+EizCBONvBYLgSW7GSdMksWYQo
	 /stIs7CT3R3oAK0pN/PX8bTYTNfS0HbNXiR8Xhk1Kq7Am+KWWmjjObhvEPicBKlRtKORR
	 PbLpJEhdCRm2Zla2wlEYJ6dJfBRD6NAFe7fP3k312F32IeA3DT4meNXegD6EaFQTrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437015;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+F1jhGMf21HkrZdOfVPXDlEI0r76P/F659njEp2hnDA=;
	b=lIhc54lE4kiU8Isvpfw+jQZMWry7Inu+qsIk9n6IyTcq4wYITVAWXrezpXT4WksVHL38
	 Rpt9vyaOSad19QI/VDkPjoR8Cfd3A1DkJMspVfAQoPsjn5mP0QNz4DecXjqE4YMvzxrY/
	 wtIeDFPmNo8atPvMtqAw7GfC3Xn0+lCh3olMsFaHKkW3L7OczdnvR4knwDP+6EeV9tfU6
	 LHGn21KeEVJXhPb/8EO+hT9mKYF3FkbgxEOI/tawYkxn9vqBeD3rBNe5/gGge/9MhCEPI
	 I2hQS2CAl5ph+n2Hw+4b+4qStAOjWu1Tekc70wKcY3uaRIJJcGc969OZ3ZHPpIREGOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=nuTmVBNE;
	arc=none smtp.remote-ip=91.218.175.23
Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBCE606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBCE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=nuTmVBNE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R1ooMpzJfDXEJhw31jjPShmqE1PQVzInQ4NZAiNJuwQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792437006; v=1; x=1793041806;
 b=nuTmVBNEGDtVR+8v+lL6i0GpT0iR40vMo7m7hMzNlysaobYO/4dFB264EVpiPCin6yQk3MkI
 7/r2eLt3q7ioTShFL3UVqZfsJUS3uBZAd//XkpMGTykmatZDe/XbRatkMuTW06Pt+euKlmJwW6Z
 +LujtVNywQUwkUC2A3fLZmd9W9J5zGE9SWRL32Xgfi31kzm3qrlq9xYvQrxGMWGOYj0guKWogkl
 IrqdoQYulUTvxq28RFhGen4rTk8zQbXFrrEeA9q+QFrxvWQ/qDwX2Yxu4edvilTRCd4qe1qSd7/
 17lkUVr8iRiq2KZY7+RsQ32L44y9+0OseXqUGVd4B+lkw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d5b732558af1ad71;
	Mon, 19 Oct 2026 19:10:06 +0000
X-Mizu-Trace-ID: d5b732558af1ad71
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
	DRI <dri-devel@lists.freedesktop.org>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	luyuantao <luyuantao@kylinos.cn>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Date: Mon, 19 Oct 2026 12:09:59 -0700
Message-ID: <20261019190959.799653-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atZBBqj4ON6kYWSK@sirena.co.uk>
References: <atZBBqj4ON6kYWSK@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mark,

On Mon, Oct 19, 2026 at 05:10:46PM +0100, Mark Brown wrote:
> This obviously isn't the right merge, it drops the fixes.

Two of those fixes are mine, so I had a go at it. The code that draws
the panic screen was moved into drm_panic_helper.c in drm-next, so two of
the three need to move with it. The third one, for the panic screen
setting, made it through your merge fine. Today's drm-tip has the same
gap.

This puts the two back, on top of your merge:

diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
index 8913c3d22e8d..385a07ed314b 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -513,7 +513,8 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	struct kmsg_dump_iter iter;
-	char kmsg_buf[512];
+	/* the size printk formats one record into, too big for the stack */
+	static char kmsg_buf[2048];
 	size_t kmsg_len;
 	struct drm_panic_line line;
 	int yoffset;
@@ -530,10 +531,15 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	drm_panic_helper_fill(sb, &r_screen, bg_color);
 
 	kmsg_dump_rewind(&iter);
-	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
+	       sizeof(kmsg_buf), &kmsg_len)) {
 		char *start;
 		char *end;
 
+		/* a record that does not fit comes back empty, every time */
+		if (!kmsg_len)
+			break;
+
 		/* ignore terminating NUL and newline */
 		start = kmsg_buf + kmsg_len - 2;
 		end = kmsg_buf + kmsg_len - 1;

I tried it in QEMU on drm-next, ten runs of each:

    after the panic                     your merge   with this
    sysrq c                             reboots      reboots
    one 600 character line              hangs        reboots
    600 characters, then 400 lines      hangs        reboots
    one record over 2048 bytes          hangs        reboots
    oops, 1008 character modules line   hangs        reboots

The drm_panic KUnit tests pass with and without it.

Thanks for catching it,
Devin
