Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E034E9C2A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560112; cv=none; b=gaqXVem9hRKnzqiK5oov/Hlk6iP1bUfNzNI5cQj5NHoorP50d2GR5uT6JsDfqCjLp9KsJXpQo8gt0ZE9Cc7demrsgtP1+WkirsDD34+0BLYkBMpSBd/FfHUlRtAhKPrXgMQ2sHAh4MaMQorRjYolgU64B+XLCW7PCPVh8Kohd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560112; c=relaxed/simple;
	bh=kYmjZGeN0w4y8NG43q98oiGS0mYHmpdaIhezqvgUstE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAuup8KCrbtRUodLkEipyLPnmiRkQws3kjH+33ySI8CE6Hu6g19cpF7gJePYl5VPI8qGHLvpivm3Y9iQfFHY26aenH6pdktf5t+2KnPIV71l3/HRa5VeCPb4E6J4o3aUymzKqGNv7JFjltct6w0uk8bgf/mT3pyWIz4wnu1OYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpT8CQeC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpT8CQeC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso2793030f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560108; x=1792164908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwdmhQS8ZFgueY5Ojwggbm3jZbWLTZqDnE8+y1Tkabg=;
        b=LpT8CQeC3meBNpwn2esLeYo6kRylUABA1zO6BxWZmsTNqH0VRjp56MwxrHRcTkBtZQ
         y4ls+rpl+TYPov0RzIQ+wQwY5d3yzrm7LwPwkhizCaGpcD5uOlOx8UhDKnV1jLdFCczI
         qSiFR+JfTUTnJCpmWzOFtRhSUNhg4Jwtr6F9qGuMJsWtQFnmow0hL5D+XavxdpY+UEkI
         qTzswuro8lSHMvgOBxG8sFhV2eLYLx4t6YC1lfQHXmqfhhQ5b4Tgz/UIqh65ivLVartP
         3s8YtKweIrIjNIqfs9xizvVXiC736kumInWI/kjVpPx08xRncH9XTq5dhTzfgsHuwhBY
         YQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560108; x=1792164908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwdmhQS8ZFgueY5Ojwggbm3jZbWLTZqDnE8+y1Tkabg=;
        b=QLKLBCtKhzk5bOQ+Xu1dHAfuNdcxdmxWH4feib/deSnWk/WLV4IZh+sTbvEuhUvUmL
         I/TKgYCdsfRv9Y0DopFr7i1NsvrQLVyJpLsWBVKQmQG2GOayNw/Idx/SPHA4AeyITYCG
         Y0rguNt0aWCfzrBQFlQBosxbf/K8d1ULfKEImrAFu3/i9nzPDdA5Jcva+WOSYW+lVo1c
         0TkL7n6z4vGymypWlMshi21pmgX8PF5KJ4XdUqxSWNrWufyaeOSh9IpRni7ih7QCEWXr
         qotDhFKh0o/zQdoRMaFsbC8iL6vWmX7PQrqPcRarqUluBFEAaH97929HyIy44wQ/ao65
         +1Og==
X-Forwarded-Encrypted: i=1; AKwUvBwF5o0Oz67jCpiGFYHXDs87BZvJwL3iL+wdga4N4HzHGA9Fz/Z7pErNSptEn39mF7kGc8RiW5qtY6RP/lk=@vger.kernel.org
X-Gm-Message-State: AFuF++nQR0VdBZBJqYwEfAzAmBp2wkwEM72lj6PKiKDLjeV5EQwzu5Y0
	RHV28K7pEsdCjLZ01b9YQ2yU0v7qJe6vwm0tIsbBxKOTSol/7UXBPmdd
X-Gm-Gg: AYBFou2JFvrf4ClWI1dxbn0180qEQSZSsDwrHhKbqgVSpQPfQ7ASsGrLeGrSM/2h/gp
	jChWpOlqKutRa8Q7WqgY6P4po5FIsUCOLdWz7gsCaF3aeBXmvD4Mvf8vJ8FVVuazp2ypoaqzxHQ
	VIiy8wiPiqE5n4rlJTZKhvnl/w25IlnydGPBBdOJD10MkUd7XjoxQnUg0YFADkEtTbmkG7/AIxz
	kZln3gpiPLMey0Trs+YGs1etff7WX5g9fONAPdHuaR1uTB0qxoJHgUPLHcqvuSkhUTzPZPRgPFB
	63rV5/QkmOTmehAppCt/shG0KA6O3kqAPBaH7QjEEu3sWzo0Rdt5C9kPgLLVNC3MnNYDeeRJO5f
	YNDo9ArWn0KfVbIzdQcz47w7iYKUPrtqmWlximyrOHtWbCKiWGuzEoq8sxifWYzm2Whz8PkT3gg
	DWVPd3r4ZiSnsfn2d0EgdO7gf4qhdSOtUKOiJ1OEup4l21MYii5j74b/4bhuzsmWjo4qBWbd1VY
	KI95pQagxgjX8hgfVM0gfCuZLpvbaZvtuZvXeSWZJXy4ecckM1Dt9+a+w==
X-Received: by 2002:a05:600c:821a:b0:4a1:7ba9:da34 with SMTP id 5b1f17b1804b1-4a18e3ee7afmr45269765e9.0.1791560107596;
        Fri, 09 Oct 2026 08:35:07 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:8516:411c:ea75:bb84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm4598278f8f.12.2026.10.09.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:35:06 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 5/7] HID: asus: Do not send feature reports larger than declared
Date: Fri,  9 Oct 2026 17:34:32 +0200
Message-ID: <20261009153459.124752-6-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009153459.124752-1-p.pisati@gmail.com>
References: <20261009153459.124752-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The keyboard backlight and Fn-lock commands are sent as 64 byte
feature reports, the size of report 0x5a on the ROG keyboards. The
Zenbook Duo keyboards declare report 0x5a as a 15 byte feature report
and do not answer writes larger than that: the control transfer times
out over USB and fails with -EIO over Bluetooth, so the backlight
cannot be set, while the 16 byte handshake goes through.

Cap feature report writes at the length the device declares for the
report, when it declares it.

Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/hid/hid-asus.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index d8a931290c9a..9e80a2bb54c3 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -618,6 +618,17 @@ static int asus_raw_event(struct hid_device *hdev,
 
 static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
 {
+	struct hid_report *report;
+
+	/*
+	 * Do not send more than the declared size of the report: the
+	 * Zenbook Duo keyboards declare report 0x5a as 15 bytes long and
+	 * do not answer the 64 byte writes sized for the ROG keyboards.
+	 */
+	report = hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[buf[0]];
+	if (report)
+		buf_size = min_t(size_t, buf_size, hid_report_len(report));
+
 	u8 *dmabuf __free(kfree) = kmemdup(buf, buf_size, GFP_KERNEL);
 	if (!dmabuf)
 		return -ENOMEM;
-- 
2.43.0

