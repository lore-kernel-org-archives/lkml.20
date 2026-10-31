Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442357;
	b=x7MNK/pjgheeTgmZxV1yrGrS+sNB9IapD5vx77ZXRV/cbxEnsQbeFpEcawiFhDl1oHPj
	 nkBhq32shZOMmFUZclhUOHe7zuFWH93t0JvuzRyot5G8BxFgoV5TKJEB9SEuhA75ig0TO
	 TUeWWR1emaYUZSddu1GCTBnJtiQp6EPXwaMjma80GSglqEo8shApG9vRQFbGg7hijnazj
	 49j4uE1jGu1J0ILy2+ZzjgKgj25PLmCPq12WfidSGyUm4dUaB2MdvWB0wdXA0GgWTx06s
	 w7+SZ7H61tG3SPLdCMQxfXPVw2TP+PtKt9kFrvBcQVgDHsTjUuot7/1vFeoJcjUMiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vtSAjOIAbDssVymEX9DGLCScFHFuvzma6NQTXOmdCRg=;
	b=PTxH3uoD/pPq0W5QHsalfzNCDv6eCmhDOlis6lBnYUBnCuiFFahyexZwJwzY4E+WXCFr
	 D7NNotjw+2TuDW0ysiH4JolLjpTjy+4akp9FcBULFpy7w5amLIAc8Y6iph8n/Bg4uNvEk
	 +eP8UMjDP9Ov3oi+Mck0aDMmTQ5z7QSgUvuZalOpRxRLHOaIAc6cWTzx/1ESNsdveF+9h
	 d+gmqR7it9pIkVOTZKaTF0QUgaLFVa0sOJ3j7fi+d9e1q7a31fz8u4B5dMBOpUiNvI9KE
	 1EFL38qXxZqTn33PCPkq36uZuV/Wr/MmINoQ38j4xVIgCnsaLSE3OfReUZ40qd0p/6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUqRNiVy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DADD606A325
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DADD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUqRNiVy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14747215e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442355; x=1794047155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtSAjOIAbDssVymEX9DGLCScFHFuvzma6NQTXOmdCRg=;
        b=UUqRNiVyTsYQypnn8L5NEyHxGAyUxeM+mTTzxSi435mapi8rPNsE4dNsA3yr2ad8gq
         g1ptiL8jczjPMT+7y3mt8ZuTP+YshLzUVbDjF+GjELDuNU0Sp3QdJjmQha1AginSYVt8
         Gx7McEAiXN2IbcC8viM4yJPj42tsRSSZuiWP3Lm4+p8jptajx6gWAvk4OEtcp/n8Ss52
         TNg32G2QZJEO3Vlm/YegK8wrQ2wjAUeeisCww/6N4v9dQ4AbvCn5CGTM6VoJuuTeBX1X
         ercOsg82CGI5Pu3x12W7m/CsFrksqmgzY4z5NTuyqWEpWd9fccehIMDIn55AEb4D+Nfe
         eQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442355; x=1794047155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtSAjOIAbDssVymEX9DGLCScFHFuvzma6NQTXOmdCRg=;
        b=bV7tyud9panBH3Q0ivcow31NL+kX6hs6eX/NMCOQwOmnwK+czZAt4hwgalp7pGp28n
         9KT4yA9W98PuZuD+tR93pwnowFhznnRLCHaoch+VnTmQZXkj9cwDrRKanf3eEQNpTqUd
         aZDrk2um04g2me3wPvLyDIp9cUa7GO0YkhvPMTkkWs399a+7Reodza5wsS7EHpSNl5uf
         EOK7r9OUVoHWHBkJ6kANdRy+MH15GETchIIjzNq5UEFkJgorHZBlpfshSLLU1LH8WCtV
         H7QGx6ouJDK9TqMz5pxL2tloFgTVl3mAIFx3BruEl6SAwZMjpgwSzcwlIcSKRGhhndzg
         ztNA==
X-Forwarded-Encrypted: i=1; AKwUvBxLrYAkYzY4X1qPu3ZjnWA2mCRjVwvCZaCXAFdZ5BR9XtmSNEirIb8yoeDIEMG1RCcdHCb4RshuKTUY3EA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW4RGZowIYQUXHNwfnH4VghR8hb7CPdbaykFW9zIVj5aU7TUBv
	nfSKtMxI8btuf4WEXV/LWY30ZmLcytGyBVMofBgHD1dlJ5mZlRwaOqcpKbb9DitsWAuMrw==
X-Gm-Gg: AYBFou1HQHWIYOAKi5hA70j259RMdR7mP5dmyzS4CI3FXZAdAcNhBLwqN7i1Vbeq+Zn
	Vuy3XvvQ/BMSqbK9Mjw5uVQ4u3bq2KhBE0zCF83BXTyWAL2GjnccVzRFGbnwOnlnTKEVgO2JkWB
	JGppUpU/QBo5NXa+A+rEaZphVm3CCw81MRNeNfVoCfsV19SNbH/8r2dfl5E2FvtE/L7WHMXAPTF
	8GeGLUG8x69dfUZgQTlH3vqV28XZGifUcqrDHTpHZQ4cfZ4+RIX0lx1H8h36Q+GQhELPo+UqkfW
	2An5xO9iCnivmj7U8N0uq4WGYdWhBkfG7cSW5pF7ZswKJktyJNpszYBzsqH+o5Z9F3nNJAyXUd3
	ZxW3wo8Ep7uw/38Whmu8Pmt1nxRn641pXfSwcaCGS04j92R6UdoelbmiUicb+uGETCaMWgksUe7
	h8H6A4Zx5VXd3m/9nWxilDbSuT5lFk+Mp77tuXZhIufd6/jU7O6GdXD7ltZ6KbtDbNyqToRRLhz
	XonFfe+0fABdwkF0s0QqnJ2TSHyugbILysJtNhgzoVo8xquCMaGChm1fWnMc+4dT65DSGgFW2vg
	a79avu+tgLsdQz+T5idG3Q4+Smknt7Yad+LEAdscdLxp3iP4KQxm4WUh9FK9xDZyCs8mEcNtjLC
	88/uRmH8d0kDYLDY8GKx7TZuEae4kKTeBjy3RE2K3YYTMS86MoXCdM9QI4y9J1oa5nb2S6m48ZX
	daVZuHRLGSovgOOkM2jdC1SL4rmyjRBrUIg/ybE4jJ17vJo3VtEaDzIV+AYQ==
X-Received: by 2002:a05:600c:34d1:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ac1793fb5emr109362265e9.15.1793442355021;
        Sat, 31 Oct 2026 03:25:55 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-994c-f615-42f0-2afb.rev.sfr.net. [2a02:8434:fda5:4201:994c:f615:42f0:2afb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm195363135e9.1.2026.10.31.03.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:25:54 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] tools/bootconfig: Preserve paused histograms in ftrace2bconf.sh
Date: Sat, 31 Oct 2026 11:25:34 +0100
Message-ID: <25caf3642950b6c4d32cae945d034294bfbcf609.1793442331.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793442331.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com> <cover.1793442331.git.edumucelli@gmail.com>
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

The trigger file reports a paused histogram with a trailing [paused]
annotation. Removing that annotation without adding a pause parameter
exports the histogram as an active trigger. Replaying the exported
configuration therefore enables aggregation that was previously paused.

Add the pause parameter after the hist prefix before removing the display
annotation. This keeps the parameter before any filter expression and
preserves both the paused state and the filter.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested paused histograms with and without a filter, plus an active
histogram, in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled.

The original exporter restored the paused histograms as active. With
the fix, both paused histograms kept their state and filters, and the
active histogram still restored as active. One filter contained the
literal string [paused], which was preserved as well.

 tools/bootconfig/scripts/ftrace2bconf.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b63e04bf9400..31702be0c68d 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -114,7 +114,8 @@ per_event_options() { # event-dir
 		DEFINED_VARS="$DEFINED_VARS "`defined_vars $evdir`
 	fi
 	grep -v "^#" $evdir/trigger |
-		sed -e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
+		sed -e '/^hist:.* \[paused\]$/s/^hist:/hist:pause:/' \
+			-e 's/ \[active\]$//' -e 's/ \[paused\]$//' |
 		while IFS= read -r action; do
 		action_cmd=${action%% *}
 		action_rest=${action#"$action_cmd"}
-- 
2.53.0

