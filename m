Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921019;
	b=rCS1JpRFrCwPbrZP5QH9HiomaJUPMtGdvpLCzgpt0NWFzxuGjVgm+gi9qCxwtjOA1Hyh
	 q46N4Dj+/Yxh7kljopeu8XoLN1lnckkteJ/Ug98L1C/Dxp83ZBfgbdVI60sxzZRSIwk5x
	 3uUsz3jFPwBds8VOu7I6tKF5D7yAikV9MNNhEFmiM++taMdQae28YlPYFLl+3PZEeYRda
	 lRvOltSf+ad05F6E9ntSTO8F/4UDqk17gEz9bmFPhhsVNKSkcZYPA8woUlkyJFAEXgwbo
	 cB0rvQpq7PAfSlaTNh9Qo+Ks5n1jLZ3mdjo6Q1I8QgvZIptLsMv9LtyGKfEU2Vc+4Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
	b=p5xsZnoFf0B57GskkyNTRjhE//kXQB3VYyMYXtpRCqbb7cTbgNFglgHmgHraoRZ9aZ26
	 WxdqE/oR2bK7w/Vd/WfQf70EXQL3uZPPeVfAabea5uqzYl7szpvN4EYWXpXjFPgxOaI+1
	 i8AsBdCNHkzQ4UK1aztXq8RNGmX+yu1HyBVMS3j0rLD9Z1VSVDqMxzFmuOfslRu1Zl7h6
	 qrFTIRh9lSavV+oEoQKMKFj/FMW3LLZUvKOmeHa6dB9WzmPVNt/pzTJ6H4umAY2xcLFxC
	 nY9gCHFiiPyWLawpyFaL046jliTeW5v3yup/Wl98wLyhC9hjFRp0Zh2rhrFBqVNChvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05BH1Ifg;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC80606D804
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC80606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05BH1Ifg
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e93e0d86a0so78255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921018; x=1794525818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=05BH1IfgAqLsez9XIudjSqdH3mRrhGMa7IGd3wnwRTamA6yvZNpV3HyDgbt3otDLWq
         UNfC+SS1j3nEXW0+UHNm3t+CJ3SZpigrD2hPsSArE50BdHyN7htfgMQRH4SjsXA9YwSQ
         cbpl2br80hp4M60gp7435pkWoBDibVW01Y+AN6ZDDL1IMLotQPpHQqPZQZdmiTA1D9V6
         fIGU+W7YfXxMabtW2QmIVN8dCKf3qJljckgHVkJgHVRFcJ5obkgYmmzky4TfN1Vmo99x
         nkZgQC+UCs7W2tTOtMM542Zoo53vnqhfcxhBxGh4xnTiQITlFCE7SaMf0mlOUGCeBQpA
         aErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921018; x=1794525818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rloPnHEOePgtL/g9wYI+1ZAXqmS3tU4v9p3VsYEL1+s=;
        b=KSw4xPcRkfxn87CTOtPhd+GL3QDZXyC9yy23gfLVzLxJkYqk9n6YD4XuRkAslIGYv5
         tsFJjRxGZ6qxfGopbwD5HG8WkcFuz45U/jXIJXI5vwC0y3/d2wVHQq24cBzUR0305Yhk
         Z0uscOClO1mSPekBj+lD2d8YoC6zrkga27vW47heLCVgO19VIMr5PNo8FW2xz6GkXHiY
         ayHoj5ltsLRo3LEoFrfkmUOuDzQWhHjaldUoF98ByVjUTxkmb64UqWBDn0bCOiKgrLn0
         uiie6/KsBqfpVZBXBYVga4ePQI/JcqNmioHBBJc5dUW1rCVSYXcfGNkLiGMwmqukDMCP
         BcnA==
X-Forwarded-Encrypted: i=1; AKwUvBxfyXOV3HFIQz2xCeXp7R4HkPR+t0iJX3zuQhU7Ssgn3HOHc0y9yd7tzaAiHO8patgR8sJx8EvPR6hMiTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CC7IE/JdzVxVyEdRir4i/5JiqyNQckQQPgVlLTz6rmRpuvzKB
	vcKnLMGHrAti9ZSwTV3rLmqdsjg0XRG1HO7veqWVLqvVgKRIQ0VWF2Ns
X-Gm-Gg: AYBFou1acVvBL6ry1iAT7Y9tdHdx7Qsfv2lCg3UAe5hO1nVV7+ky+zsFNwV3Vw1M77a
	bSrk4Bh3E6N/S1RpLuKyMsJUyX6nyLFTQbbvRcmD1TVyzTNiKBKcmq8qjdfDGqgHhf8tRUfGuyY
	JwAXndEOzykzbYBLutJhhNWzfEaYQGoSibf1WdDekpaDtBq9YcamMk1uBClsdPIoq6CB3Agu9yL
	GRMtH7WCf0E9HuJRfNtxUXaAQ5G59A5syOAI/G+uFRsiEZ1S6AFaf8KJ4Vf+lPoUmyCje4DUNKt
	MI5W41Ln3XkDCfkacBoSipcH0dPY6n8ubIOFSQBlPPBVXFNoaelgBIg1RM5RUd/D1rSO/cI9sEp
	KjcgD/0wCrlH/r8s3+pCMZcRQMqnx0ggK4gkypxwBRAL/61aRzb4DzGew0XHej6Mhe03bNgD0xo
	rPVZqzwTRilfOdhk0i4XhjaIVVt3jALoOzW98rMoj6vecXcnOxNvBF5LO1gXCibw9Clbpmy9QKV
	IenTIybITk4QsaFIG7bCkNRB36XjmCEK0e0g8uhyx7awA2UlBYR3fgFLjalC7xS2201y5qtwPXw
	HBhOtQ00KrP0ctdRUQKgJmAq9JepO4M2dvNlFneaAG31jNB9YJu9KXw4wB9ym8I=
X-Received: by 2002:a17:90b:518c:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b0db6e1fafmr885341a91.3.1793921017864;
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:37 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Thu,  5 Nov 2026 16:23:09 -0700
Message-ID: <20261105232310.385463-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
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

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../media/platform/rockchip/rkcif/rkcif-stream.c  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f2a24832a8cf 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,20 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		if (f->mbus_code &&
+		    stream->out_fmts[i].mbus_code != f->mbus_code)
+			continue;
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (n++ == f->index) {
+			f->pixelformat = stream->out_fmts[i].fourcc;
+			return 0;
+		}
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0

