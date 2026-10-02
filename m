Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23D745D937
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930156; cv=pass; b=elbjuHb9tlbS/xggIGk9YfV0siVkK51UZTjhQ4lvTCi5IjDUK0E7LQk+Ls3QfxPMoDLLOO8KDVh85uuUD2W6wpZBdnHDx9ceJGjzQz+nkXURoPoKODK/T+6m1cxgdDS0PB50YDr+cX3WSBg5PUgwOQMzfHrsL7RuS0V0CketqqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930156; c=relaxed/simple;
	bh=5Lf40F4jqAJa6SoZeleXwYqCtcr/IFf80+LzR5G4iws=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRiJlskfQasjxX8jTMS+6s2wRH0gXL41wx6YUl/GidcqqbG9oGDnllziYw9tYjk5fmRBWWxVBWGT6y/McGfBIv9UdfXbdK2HCFl30OWxyWRgaemOUXX4B7hz7lOvvQKQZ/reVRHKI9zTj1CZmJX/X2KLNYhcdi4AqmUQmjIlhBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srWGdLe8; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srWGdLe8"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d7a52c9d62so2845169eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930152; cv=none;
        d=google.com; s=arc-20260327;
        b=ajG5djlkTgSl3VyAcsKKC3q4JlAW5AAcIun3KT4jTD1CtKkw8FyjNDqDPKLbz1oiE/
         YelpH/WCjma3rcH2QNfRT/oa42d7AyQ01oh7ZNGgFOYEsT3/8PttmJnrQtqTjoP1HCMU
         WmyW/bt2HRcmHw4toWW1NHv85jxy8a9RDHd2TbenCJy4GxXKK+nLKtLZCJRJ/ILC6It1
         qM1N3p/uqnHyZ5cBnS48Sm0do4NqlllutS0e07dOVECvFZjUJyxn4ksiqH1pmnyOYrXB
         qdLxtSDZ0Zrgu1IruowNUDGos0KW1U06IQpNx1sRsBwTCwe+QOFs3TX2e/31EmPzHPR5
         4NHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        fh=hCBHQ9z3WKEzfZ4xJS9jQpg3DnbN5FwJ2WHUeLN5pR8=;
        b=WSjDn53DvWu2EjKZM98765zpoQ5P8b1eIG+6inclQTo0MxxAGgUb09uQoG1OIR9u4+
         4dyWXR1LLyDFNxVTC8AoDVd22tIU14kQ7soTIGCi3+9K3shc6tIE+3QY1cGo9cge7X0R
         oyythcFrj78njjRX+QkMjbLeFPgQU/cBsYGuT7/zho7tOTWPWvMP8NHN4HLBubxVDO/1
         uu1/MNepE7YGGHvREGU2CANtaZqizu+JepvCGLlZws+2cFTevbp96JfN1YCupNb4v4H5
         qJd5OM/LfNdi4gZvEgWOxf/1Otbda44zndpvtFlwDs1dDPnoOd7oOj3HW8Sd/x8wsnuU
         qHGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930152; x=1791534952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=srWGdLe8DMvzEXcW+sGIzUsf/fXdWLeKirPDmgX+Jl8+beCPrqZNtTacEVmd/rScqt
         JYTROg4F5J/o9Jo0erowSaqyxTgbBnEf5W2JBwm1MlA74Pmb8DeXj4YW4Nq8LbMmk90D
         DR9RQaKl0988QBo7Hj7HvYnl/M+rO+GTtBKtj3bPttZUOut4wQDXbxFgZn5ho01/Fp60
         f3Mk+x/F73cUUpJfZ7kYJYy4Rh/jHWAihZIvuD3u8PCyB9Ut0yfZELrDbTeLv0De+wmF
         MO2WrKz4ykj62tGH5eX5Fj/L+qQR1D9lDL4+KFnh6bpfyo3tba/SrhvP65AXfePaLhcg
         IEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930152; x=1791534952;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=cKw92qvQmUF/DnIVRhH9d7KiDJQa3losGmy54sXhCcjrOpOzNdIJQeioqsPeVWQdcX
         7OiDTHeei4HMToce1tQkUtA1xZN/0y3+RASPR8sQ0rN0HbVPA6mB2viygaqTAKVbHp9K
         deWOPK4Ewf0YY05PeNhdWzG3nm/IdAzbFQcQPqlbx2XLY193GrYGGgHTdV+TyA4E4U1P
         rOICxpvGelRD/jiDR5kTy/x6XD9yEvHrJ2IAseJNI23A7krW5tuLlIUuTKs3Yxt6Yt6/
         kHTizJZ27xyq+GJBr1+PLTfauDPYPrtOSe2gJwUXD+n5GoKdLu+pZjTC/inUdu7mlLRs
         YPjw==
X-Forwarded-Encrypted: i=1; AKwUvBzNjgoTK4EDg7+9QZIno99nHN+UVjO0hm79Fa1iXxSDVRG0tmoUeFK+f6hhy6UXiuP8L85U+knMhwqqQbA=@vger.kernel.org
X-Gm-Message-State: AFuF++lIYsB4ntfXol8QvV4yWF9Z7cZG91bUT3HiysrlFlCbVxh0tlPH
	Qt2lMEchaCkDAGmmeO+MqPelWPgnzTO+vU5vSCm51rV4rFmSRZpIkKT3jsF+T4w0UAjFImoaqW5
	NgioE6xGAzDWlMVLf9KwETk7FZogrW64=
X-Gm-Gg: AYBFou2s0FZPySJV8LRT0rvFZwTxkRZP+U72gPDs0zW+ZZpiCMU10SeZcPHwLNwvXNM
	GHOTH3dUZp3zlfHBCsLdQ0sHcE1l5zhfLiTkBQFyYFJrCFtfipbBGUojbszqqXJYgLKCpvmHyuF
	4gwOzbSjvAYg2m2/Cu6bTzPDoJYzeL85UYbkQ9wmcWStaB0/P4ptF7BXvhYBuiK1a1J+v4G2l78
	jruSotHU1Il5aWvbpn2KXVSVHlHV/G89cn7agqES+I7ONUN+RwreeVIOOJnOvemdnfn1fgMxT9A
	c1O2rBiv7Vqr0s4FqiTyZfe75ZrOqHzIYuJLC88+x1LT3uN5lfqIudZT35Gb5kBvO1eYP4dnvk8
	OV3MgC+8qVXHO+KH8r6mnNDDCe1FSK0oBCg==
X-Received: by 2002:a05:6820:310a:b0:6dd:6d12:22f7 with SMTP id
 006d021491bc7-6df2f405237mr1797235eaf.11.1790930152541; Fri, 02 Oct 2026
 01:35:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:35:33 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:35:52 -0700
X-Gm-Features: AclHuK_Rcda0jD4_EFdo0LBQrOhCju3jgDj291uhH9JjAg7Gq4FtplduwTl4fRU
Message-ID: <CAO7O_xjv==E+tOwY90AKpKkbLbbUBtaNmiW2MzERewb+8XtDkw@mail.gmail.com>
Subject: [PATCH v9 01/15] media: ov8858: Extract digital gain programming
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 0bfc4350a8c9..2a0e2b08b9aa 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1524,6 +1524,23 @@ static int ov8858_enable_test_pattern(struct
ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }

+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1532,7 +1549,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;

@@ -1571,17 +1587,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0
