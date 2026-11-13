Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561991;
	b=5tPtNWiXJfoSMo+EJ1v7C00nnzT3iBcW7LDNGhaduxkJtZyllapi16V/wjOUxzXTGnAr
	 o76PuexbCWwvitIErFJ3Yhwj+cNygq3Hi1ZVW29ujuv8Bhr8k1extqSJ9tW/DJGt9aicf
	 pfMF73NNNPXMdLr1vPu80dOJ3NU6aoU5S21D/53Pj4oaNcHS+mpvPKrxjEfEdJt2bpyE0
	 g3LU9SgaTjaJ11h63RS63o78UTiCgUEImh3Yk3nE5pnV/uwmiP+qUGWZhHziXfCO53qWI
	 wJO8v7TYNe+o62/kWzN+RMqf2NgP9FV75oKJzyGj3fHT06WCuykJpZ9iPczrbdHV03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
	b=NP7BKNNff3kZpQO9dgkk/vQH45Zfv1/ypa9Mbijj+jRtt1GhUH1aMe7FFakUAgPnKRTZ
	 SnWRgwWPhPrLcOhLVpDCAVEtsWxa38yxZtsHBGkjyDPwhnDJQgXD5+aqlF3HpFCn3LLPA
	 jAfpUCxteP6hgGtuLfr+4RhRodGaNq62o3tKAVBQZc4OZs8a90HfeOJX2V+W974Pfi0KZ
	 70SzXyvGOn+q1aeVX/XBsxwUNI+le73Z7zC7dDl8uaRG/kxg5I40dd2eUhYfHm4JSRFO0
	 oDVaSBqZ7n+Grc2LyAGa5Zvw1Zqj+ECDCtAUIBNEuaPvhlbIdRG2gQGTvP/eFtYb44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0APHpw+;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC83606A899
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC83606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0APHpw+
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so1786264eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561990; x=1795166790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
        b=t0APHpw+tV8WdXMrzzJp48ybd+e0EeU72fhK+PPB9RTxGEMRXZyvsnljw1arSnPMZU
         9vZqfnK4SJJbnXJfIUmVwmB/W67ZD6OX6SwsTdpBjs17+z+uZWeK77zcKEDBnwdq/tJS
         oQMDH6sUbWfPjdYNv0R4sh7kH2OYq5k3TtkKEHgzOJ+SH24VGJ+3l/KDNPzUsnNY2Tla
         Mno/hXe+ZPjANVDbCu3Zzo1ra5sHBz99sJ5GC+YV5JpLKW4HqcouXH0g5vUxKo7ygtgQ
         o3p32WBnkwFNQLepju4esIRk5owebghasebaupnoQaSAHMmRrCpFMPM0z6zF+O6VnQbp
         6nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561990; x=1795166790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=679sas+zR3mHyWdjZLnxDeN5FJpisEUo0YFV1RY5cPM=;
        b=eDdtnDohmvidjOszR67wSFPycoTRgEUz3UAVzRbi85aG6BEbNxg+EQ9hnVJlHc1AnO
         OzmxqEKPXthiBC0/b70jly6AVxitivVaqMeCtedY/gZVxnZI8etUVc5iYum96LDTWTfb
         2fFLKuts1ycKB0GUMuSW7GTWm/khNYJVxtvKI/iNO2MVd/7U93mQHsDRU9v6SBWlhbLF
         SXjChGSOEiU1qig+vWkm2BRnBxQEcFD6KacgM2dLLvEN+8y4ZXHH86uMMhmfAvjn30xn
         rwZOH6pJUyz7swl59l8/sAf8io2x89XMxRJrtHE+uHkPXSI5dJNextjdoRKSYWhBesBc
         7hcg==
X-Gm-Message-State: APuU4Z8wuOfs9HxyQAjo9MOp4bWxhyj9NHWKpdbB7YdhXBhkBSchOIuU
	yt9/9nAkXpOm4YayBBT+OL4jVTm9U4cgogIq7pZ1IAIH1RhnBh2PZXKF
X-Gm-Gg: AYBFou3w3boWnpcReSXdbg4+UsmRfgFMvmmpJL1eGvwjCEff+JUASSqsZ9pttb9AZw1
	6oXAFyTN8JDfwAUxBYjyKODdtttvPMjACrXccOJqww5HJuy60/Emq9YWZblwhPNZYKjD64hwmk8
	HgUiF+S/jeKJ8kNL5bl2Aneazrxr7GBec3AYKoOhs7hWvj7/NxBvWASE8QpkiNRYs8oqEI70AEH
	CYrW2Dmyi0QYomOidI6pbU+GZWj4xcndd62jlMjYAvYwL0JFXODEnq1uxAGGdV4z87adgQ1VwYr
	XWtU9B0EFYWtio5CePOOvqnH2voeoBXLjgyZC/cj/xJTPOQz/ny7joGn6WtGE0owk3/6nYrJEuZ
	gmAyL/XNxuZ5o5woMbKKd2SrBgu7PBo+L69ydMBvNLjTpCSTG/XqaYKQ81BYxPD0TMJ7r4Hc6p3
	/lwg5TwrlmD2WJxDkBjq0VRbDacCcCg9Q4URDvo70ob40uwYCavrJQgvAQxQy57ucjSNAwQG/OS
	nXT8m03N/bhtKSDb5yequamR1LBlP/D7pqot87E5kwlgQjCfwPj8/g2oezosn9DAJSXaQfAwivW
	ivsJ1LdZhGY3Zpd2Xd1/oyWZZMhx+ilbT2O3qbYVBaeNAaXkqp1E
X-Received: by 2002:a05:693c:60ce:b0:36e:8410:ecf6 with SMTP id 5a478bee46e88-37966387d74mr1963510eec.13.1794561989903;
        Fri, 13 Nov 2026 01:26:29 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm6098717eec.7.2026.11.13.01.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:26:29 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: compress: Set metadata_set only after successful callback
Date: Fri, 13 Nov 2026 09:25:59 +0000
Message-ID: <20261113092559.3283-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
References: <20261113091159.2954-1-sreekuttan2156239@gmail.com>
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

Set the metadata_set flag only when the driver's set_metadata()
callback completes successfully.

Previously, the flag was set even when the callback returned an
error. This incorrectly indicated that metadata had been applied
successfully, potentially causing later operations to skip metadata
setup.

Update the flag only when the callback returns zero so that its
state accurately reflects successful metadata submission.

Fixes: 9727b490e543 ("ALSA: compress: add support for gapless playback")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/compress_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 5e5e0f78f26d..9b53282e0192 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -796,8 +796,8 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
 		return -EFAULT;
 
 	retval = stream->ops->set_metadata(stream, &metadata);
-	stream->metadata_set = true;
-
+	if (!retval)
+		stream->metadata_set = true;
 	return retval;
 }
 
-- 
2.55.0

