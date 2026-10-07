Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8554B4915A6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383347; cv=none; b=O3WMclFHIDrZDzyNnhCvcA8A6BYon+wqp1BCjY8NGBPnLoTllmCFYHOkM04UntdEIRDUdj8Xgs60JjoKviaL3mnxdWRCj49t2tOwWpQPoD8HwS1hOp0elXiPqR93dMGzwNS6GYKa4/yzWd28MB3u+MNVkRuq4a6vNKxWFSpzNNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383347; c=relaxed/simple;
	bh=iYXR+WO4Xo6Z9SQO8O8Zw30mGsfc7tNwv58vyWm79Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUU3b8qWDpvf1iRGl5cuM/lPB29TtiAnwQfbGJg7NgQXvS/ix6dXYTknrLZ9KpfnZKpKF5tCiYvB14nDfbOyIFUwVBl+ga8t8FVWUtKe4nQSvmyaoUU/9+FTmX8Pdvu3bTkfAzrWnwu3sVzsE9zc34nKOscFPjv7HbLuWvN3hu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYU8NwUD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYU8NwUD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso22708625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791383340; x=1791988140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AoGMhCcKaJd+VLZOOK8qVd8ldhqESPN1LjxvOJM3Kqc=;
        b=WYU8NwUDfITFt3xvwX1fl3yTEXwrFpZ4I9SiLR1HuGdGD2aBJq1mYDgBSeJsrTn05J
         sYP6HqkAxnPool025BSH+a/bivm11lXhyaS2sWQo0IOCz0eYX6eTxws64CYdCJeGk8sX
         5BVb+FTstCWTWtH6s2ZYtexdOxuL3ypgg4R2TfYGHluyi0J9DNaeVQl8yOKA3WCGJAw6
         qqXHzWtYXsa6g7Abr47iM6m5rjZ487jTWYtqCn/r3mkg4zP5gl0QR23NymuHX/FqWJ+b
         6IOefKH9NiQcLVVak49qGa2bl2MQWyxlu3uPpX8AJ85/rE0Gf6B9HhCvUhqwz0NI592l
         U09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383340; x=1791988140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoGMhCcKaJd+VLZOOK8qVd8ldhqESPN1LjxvOJM3Kqc=;
        b=Ohi6Hlq2c1hk512ExYJxw+6aN+T/glTzf49UpuMkPdOUxe+3COPSxJBPVgfu7U0Tq2
         AKW9UT9rOTkMsLYwaUTG0dA9w0FQflgekV+S+DZ7XKliB2dw2+t8C9AgBZ96u+gkJa8h
         YtGvgMBJdRNs0y0EfYgUBYaKVtz87MvVrCzINW4SsWi4lS/pZ3CPH4zfboWyFnMEd8oK
         Dtw0O6f+Wc4si1yWvLWx47OeOWdQ1mxBYop3as/PBnbQprzZJb5dW1pkgYt/fzpoju02
         HNIgAhOuM53/+rTTqiDHzWvS9POz5M+PJ2FvFLncV/shIYbNsk94lpuIZU2gM8z9ADpZ
         D0lA==
X-Forwarded-Encrypted: i=1; AKwUvBxp+2I3RVpihps5EaxqG7y48JeLSI/b6BuhwYFZf8Cespcma6b5NAs+5rtuQcD+7AadC7OenLHSAOYy6as=@vger.kernel.org
X-Gm-Message-State: AFuF++kZvHw6ej3W4YVN5EZtcgImLFePLSZGtMkyQ+mX05uJcWJqSGJY
	CtT1hCH5/0GdOgq+4eLW1RzdUVLC3bRJMzwh0ONfXAQo4LSzBccL4DGR
X-Gm-Gg: AYBFou0kNq9Jpgo0Vwb33J0ZFnWfIA5BLD0B0yHhQETk4UyF/ze6za92m40w2hciSW+
	YncLThzgvgQ9fvSt4zeCf1mTRBfVMNInxGYO4z3swrf+z+C+ROB+Dcv9f+KJCX0UUhzsI6tcZMk
	tIayeil+NFs174U/WCfuWKwTPPQNyrcSCLt6Ap0/ow2GffMthAURw67z9QiuMcsJe1jjR72/B3j
	dwVZbX4wHc5yCinxduWEjeCaO7bJ1jjEJwYlginLq1vaDRtLzf5OjokRzQZ86qPOKS+aE54BX6j
	HN8I/YK4u0Q3jLCpVAAaSCiX7jfhS5w2wUqIE/eajJu54J3faM53M85ZAo7Y7j5C7rBqsTIe1rq
	3hKoNLBb0jZ+jXlz2lyeZ4lpmutJDbXQGoOEc0YGq6loxMKy7C9AXz81kyiDzf1RFO2iAVCgdDG
	T0VCvm0uexo2T43wI57HBpjj5RjLIPfKnZSP7J08D6vOISeZL1crujgeXnGM6yk2Bo8F3XwfCsO
	J+1VPemD5kAaKo=
X-Received: by 2002:a05:600c:8707:b0:4a0:1b14:d009 with SMTP id 5b1f17b1804b1-4a1800cb098mr46620595e9.1.1791383340243;
        Wed, 07 Oct 2026 07:29:00 -0700 (PDT)
Received: from linux.tail9b532d.ts.net ([84.75.40.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1272esm5654491f8f.27.2026.10.07.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:28:59 -0700 (PDT)
From: Eduard Zateev <hackerowskiy@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eduard Zateev <hackerowskiy@gmail.com>,
	syzbot+d0a52209bddfa0948065@syzkaller.appspotmail.com
Subject: [PATCH] wifi: cfg80211: validate WEXT station BSSID
Date: Wed,  7 Oct 2026 16:28:55 +0200
Message-ID: <20261007142855.1472524-1-hackerowskiy@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WEXT IBSS and managed mode store the BSSID in the same
wdev->wext.bssid buffer. cfg80211_ibss_wext_siwap() keeps a pointer to
that buffer in wext.ibss.bssid. After changing to station mode,
cfg80211_mgd_wext_siwap() accepts a multicast AP address and copies it
to the buffer. Switching back to IBSS then follows that pointer and
uses the multicast address as a fixed BSSID.

mac80211 can create a beacon with that address, but cfg80211_get_bss()
rejects it, causing WARN_ON(!bss) in cfg80211_ibss_joined() after the
join has been reported.

Reject invalid station BSSIDs before copying them. A mac80211_hwsim WEXT
ioctl test reproduces the reported BSSID and warning; the original
syzbot report has no reproducer.

Reported-by: syzbot+d0a52209bddfa0948065@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=d0a52209bddfa0948065
Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
---
 net/wireless/wext-sme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/wireless/wext-sme.c b/net/wireless/wext-sme.c
index b5914f3658db..3db73a0765c9 100644
--- a/net/wireless/wext-sme.c
+++ b/net/wireless/wext-sme.c
@@ -245,6 +245,9 @@ int cfg80211_mgd_wext_siwap(struct net_device *dev,
 	if (is_zero_ether_addr(bssid) || is_broadcast_ether_addr(bssid))
 		bssid = NULL;
 
+	if (bssid && !is_valid_ether_addr(bssid))
+		return -EINVAL;
+
 	if (wdev->conn) {
 		/* both automatic */
 		if (!bssid && !wdev->wext.connect.bssid)
-- 
2.55.0

