Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D73CAE74
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486998; cv=none; b=Nm6dL7+kAaOQiWBNnm5MBmspGFR37r5uxXKxuxENd8y6TT0f/1Mma/ERtyAeCbUEr/oELHj+nuzkyO0zHCKaxoPyDE9gEXo1bg9KGmr9Ycl7+Bnxc5OY6uA0fg5SoYXJnx3ueJOfD3qjICN3RpCFxTj0q4jQkySh4AJUE9REdrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486998; c=relaxed/simple;
	bh=+Oha/BDktDBvSM0qKOsrcxoAtAeACCyuZWbGHvWchTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2CNhjJPb2Ovf0LmRs9GeMlY2kBo1kSLusGtvn/0sgWEr07z3W+tIfbboI63IQvF8g874Nw2LwZOQafIOycB6Iw8O6VSqdGmCoYPMjJlwG3ax6T07h8LYl27jYcv9VAJI4JypMhNLHJUXqiCYdNf6xldmxKmpo4u2IWKO8tqPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=Mc2Atbnb; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="Mc2Atbnb"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-34bb8b31647so8756704eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486995; x=1792091795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=Mc2Atbnb0fJjJ5xSmjpqTK0q8pSBlWFH9lnGG/Q8u1WZOUAUXbgVcayVdOmEnY5OII
         IAM7GHq0yawIIhW2ysyPMcuOsJJAtf1uX5pdBE0cQ6jJUU57Ln6NaVsq88pFyrz2Jrnv
         XRMvaoqexSheSdMsjw7rSDJRH6Dmeans322HDim4lem/9DqPokwwS3FwmahGihpxqmv3
         g5vXP9Qm5QbsO2jd6Ecve80GnERSCMgfbYOKdz+JDEmt14ez3cZa7W/Cuk6f5FUbYT3t
         K0DaUrnBFUI+eOOCz01MxFkP1gZOtY4TuwxwU1wK9x/mM6H/fDvCIwuCZ1cj6/FiMuhD
         F44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486995; x=1792091795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gKBBoh6HIExyZfgEBELC4DDNErGf2q0ik6xe/8PDlI=;
        b=YVwdQSg6o8B0AcXto2fwH6slqIHb6gMBqys1XLdFDvYTyEahHRVKlYULBhirUCJbXm
         UDuCNwL/BR13zB3kP2DztiQEgjszJu6HlusoXjgc8vyYbDPvL5AUBk+YKwk2SE8uC1l3
         bid3ri9qM9wjUXOWidW+zwF5aR1VOsFrU/co35kjD1VbXNAEV33/wdJuejZIG4ypxiYf
         yyQnbuxallmKXCYnEYZcCF8a41SoJnoN3sCsT8qH7Czv07k1qnf2erhZ+aa32JHfiEFB
         f79r6g1d8kSOgMQjFXosiYhb+ZEmt+KNvgqXXyeTk4NEBpnbmcN2ertY9C4UMOAUsmWF
         2MAw==
X-Forwarded-Encrypted: i=1; AKwUvBwEvHV2SCs4kn+jU71qMVsNx/uuFVcagglBNRRtPidFxw/eHgVNlhQ/0JFKH1HMhqT5V9h0MDS5E5H6Ujw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNnWkdCSEwCrTh50HqanRhLdMtEE+PWnZJ90qOtSF8XHmQ/40g
	k1y/8cW5Fr3Jo+pN0JlaL3neS/wXtROhYburXMwwkMNDwebi7TD31/tir6Gi/fwwFlQ=
X-Gm-Gg: AYBFou37q45z/TuYNgkxqH5F+O1bLpnb8gAAhFt2jjmHTjbk0fwvpi2nKqS6/YFc5i/
	syxOa42Mr5GZgrJOqEygw6Dk4oKjj/l5uB03/xAT34R0Ov95GkcyEaOq2G9+XVZ/dAvbOiBAVNp
	xPNLBD5B0TVAYjRMqHNuoVzBGumciZLAAkMU3UmmvtbKeeoDTad5q8mU5K1xdYFHX0uMCixUV1j
	XK6QLSuB/gemmSxcjxnlonAnGAbkh+eNXAH80wYh4yJCBB3T1eJ+vyoAsq1yl//6f+GLMNyFSfo
	ykIyc/ohAJjqQtEtySlKva14sWUH99vbFR1hhV9Iy5y4Vd4OLQIoIxqjHxWbTlnOTbgR/FKucgR
	4CeJT2TQrqrslzgnbBcBhbrF61Z7WJrce4frVQBoInWISr3R6n8JhPJBNhw+uumWPAj7LpHAI9Z
	8igQRkv7Djufw9Mk55apHbnIA5/SkpZGxQXlB2i8lvy1wX1MbBEuBIRrA9eSZ2DPmmV27Qz4Ea6
	BXQZ8vryYDKD2fgH6VRCj/5a2TxX0qzBflN2kYC3UPEA2cVExdgdxcwemVRx8xXaavaL8Y=
X-Received: by 2002:a05:7301:678f:b0:351:5af1:f53e with SMTP id 5a478bee46e88-3515df405e2mr11468951eec.29.1791486994632;
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org
Subject: [PATCH 6.6.y 2/2] firmware: arm_scmi: Unwind TX receiver mailbox setup failure
Date: Thu,  8 Oct 2026 15:16:21 -0400
Message-ID: <20261008191624.98532-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sudeep Holla <sudeep.holla@kernel.org>

[ Upstream commit 6f7c06744d53dc8e047725d411d7f915d9ec35ae ]

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

[ Backport to 6.6.y: apply the same failure unwind to the pre-transport-
  split mailbox source. ]

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260714-scmi_core_fixes-v6-13-3afe499d46e3@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-93083. The receiver-mailbox setup can fail
after callbacks become reachable; the unwind has real effect, but it is
safe only after channel setup state is published in the order fixed by
CVE-2026-93093.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/firmware/arm_scmi/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index 80b67f46a4d1..a34a3c693e15 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -230,14 +230,17 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
 	return 0;
 
+err_free_chan:
+	mbox_free_channel(smbox->chan);
 err_clear_cinfo:
 	cinfo->transport_info = NULL;
 	smbox->cinfo = NULL;
-- 
2.39.5

