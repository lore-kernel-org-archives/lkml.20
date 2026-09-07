Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6216545A2AC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774842; cv=none; b=XZ/ESBuTSK2GLqhQQxIKQ2ko7/qpsvCVVwrzK8eixEhhNOfSwtrnphCMRqHwx3pVZCQ3cojPdB1k3IDHQyZy5klR+B7MrqyZrw748P6qkhd1/adlcUf9gddejWOKiM2eLsZjjf7g1OoRe+ygmusYOVtdOmcEW9si7oeJ1VDlu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774842; c=relaxed/simple;
	bh=5a9kc5qSIDnqccQ4eYyVurMLT8GhriRY12MQ4NrIJX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZ7zDOze43XhWRi3ZvP6r3YMIl3mFAPUQjaxZmlwNseHReTxaCgUZFr9Vq+v6ZbSQcp11CjAg84WugmHESi9IEZZUqwl2bIXdvrwbT7lt+i4d/sNsGG6LsYMT4hGDDkrAXrIyUGBZ5aT87KzG7SzID8Nl4dJpfh4J/np+ipzkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDJ8vpO9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDJ8vpO9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c9879395so2268648a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774841; x=1789379641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOc33BWj25QL1XUvLm7489jtJxEZeuSgnZvck6W4yKg=;
        b=BDJ8vpO9DaLFXvqBGE2+iflarQLk8zeguK1tXj4+TgbfT6uKUJZ1GqJyHDHLuK3uVQ
         nCQAqi/VXdzHrW4f5jJRbDOE709wowFALcnhP6JKVdn68VpTZHufdbTBS8H+zu6iXer3
         /PHFjg1yRyR7+R3tMk+1CPjbAiZFHDRCB9PdaKkvzC/NSyC+q+tffN8UqRuWxIV8r0I/
         f5SHm4wlLeGl4gz5RKd/GIiVPU3eFe5vQABxooPMJb+B1A0TSyUaU1TTk0A06K+0zRcs
         ilmlsCAhbNlNoecuJVZqJR/Plq0h5EwGebc5Ml0fu22CspWniwuWVP4gQRmMpI4Kw3j6
         +dQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774841; x=1789379641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOc33BWj25QL1XUvLm7489jtJxEZeuSgnZvck6W4yKg=;
        b=c869dfOhntXSeihQx78HnPS+hxn9gWAwofJDrOal97rHEGi3aoYCjWYw5jL6Xj+hPp
         tdRnlvpFkfeeEaOGitVR86f0PF/FNyFwVL8D4N55CyM30ANTMFXxr8z0gjKA+laBW+lJ
         jJwn8UHM5qVamS32V9R7VfpXPutAf7GjRzF79jZuyXeQwPK+Fly5jY5IMQXqwqZq3KFn
         isp5C7LZ3JfmLbUMF6NugHziZiq5v1s0ijcN48DiEnWMAt63zLj9My6MuLd93EWAF1FM
         AaWcsmpN7mWZtSonZkaKQpXofiMChvDvdl1j0PL+D09rmly3OqV54ovgG7O5l1cFGHPj
         kIZg==
X-Forwarded-Encrypted: i=1; AKwUvBzfglIYUlA+N2K04oyT9idgETdpCXQgoaXNxYnTTVQt4Jf07ISio/vQuPv/38e+jJlOELesZAYu+KnKpe8=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Cp+k13Z3sX6z9gSaD/vGUONDkMyihi2y2vV8uBRScp3DnSKY
	w+inXTkYKc2DGAexmFEBTlPZa1MHD7UeSFtk8v1FdaHGSXEDZPZZpIZR
X-Gm-Gg: AYBFou07No4Q3hpZ6QM+R9kieVaFDllagZ3Cftwa873XdIsdv1oMHUmH/2lBeNNicLl
	NeHfbsKy2vgu09wSPQUqCcNIAXy5HF/29N1BJdVL1n6PdKiqU3J5jUqci56/Z+e7gDnKwfN4pxV
	7iihaU1KCxZrjszfpLn2LKltlTBHGPBE3rjY3F0X8hBh07lYluuThPJQbjz8tMWd+AYMY/BIQ55
	xTg+Ki5fSQlRYXIUtV9OKFFxvZGEgY+1V+dw5i63ThiaRGtvQCK2cBh0nzGV2GN/nheh31WE3Cs
	59+UUkZFAHL9YrlFui5JMmIwt2UZZcZZLraP2GZ9TaGh2nKdRrpDuTWXnaVSZag9MYeYRHS4GI4
	vqahfAVIXNEOCG4mvD8NONReUSlc4hb+a4j7flqaatt+emo9+v9QUVkMjufoX5CI8kjg1KFKOqY
	ysHtk3GT3xIZ5jHSo691np1p8v6/icxFrwxLyydMHrqwNJDT+7EMNKcVAWxhDJXwW9WfOZgjWVk
	QnRUxtCab1v7g==
X-Received: by 2002:a05:6a21:e082:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3da39eae841mr29919850637.1.1788774840751;
        Mon, 07 Sep 2026 02:54:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm30377066eec.21.2026.09.07.02.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:54:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 4/4] wifi: mac80211: fix repeated word 'used' in comment
Date: Mon,  7 Sep 2026 15:23:48 +0530
Message-ID: <20260907095348.26094-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095348.26094-1-hemanth.selam@gmail.com>
References: <20260907095348.26094-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'used', reported by checkpatch.pl as a repeated word.
Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to wireless-next and use a subject prefix naming
    the component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto wireless-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907061417.33729-1-hemanth.selam@gmail.com/

 include/net/mac80211.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 7bb4618065b6..9594856a23e2 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -257,7 +257,7 @@ struct ieee80211_chan_req {
  * @min_def: the minimum channel definition currently required.
  * @ap: the channel definition the AP actually is operating as,
  *	for use with (wider bandwidth) OFDMA
- * @radio_idx: index of the wiphy radio used used for this channel
+ * @radio_idx: index of the wiphy radio used for this channel
  * @rx_chains_static: The number of RX chains that must always be
  *	active on the channel to receive MIMO transmissions
  * @rx_chains_dynamic: The number of RX chains that must be enabled
