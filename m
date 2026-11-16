Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862427;
	b=bmXxQ5ar4Cvd5PESO44ZNaytG3cSrFSZ8N3nDQdjaQZJOw6ptsh4ZlEQGWBWcnPU+L3/
	 TnQsf6GUt9B3y7Sun2oLFD7We+uUNb429UQmdSYnG4qQyskF+MBUHRE+YTNHSYctLKf9R
	 dV/bxb4clps+DvF94ZA+zZBOoG2puv4CH7Q9NmpY6J+oLgrRYGnWcIzoVTe19zHSBcURt
	 M/WB6MMdUDQ9l82PVN49+C1sqAfQJQM7Tqq4w2z1ziqhZcc4FGwF/XBTxc6xaKw/ibt+C
	 gVQYam+hSolHtazVdLGTPk7Rl3wf5yLR179LR8fQkh2VJt1TlvAoXWlv/QNzjtK3oDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lERwLl6L3SB+cW2u0pTxZJmstnyAKlq8LHXRUJrT0o4=;
	b=OpqAfbGzSOIpO+fY12z2TdQj0QSvDkAVcvJSq3cwrq+I2wwGLrFzDKowUTxbPAJd+Gdu
	 fqHvyBct7K1FglQfXfwGASewB+NZ4Kn4hbTkra13eDjdY3DNLroP36YZsoCxcNcl+0mmC
	 Z0aRQ0FVjEPDrijrx0rWZ/8Rp+VLJos/tN6bZkmPC1TdONMyu5HnY6+Ng+OtVX9QB+kOw
	 gwuXIC3IYnRnRMWCtg14lznrcdPlEQHNTgXHPjAnGCiJPZ8qmZJ/DGTsIn9D+eKRSMAci
	 Q2sYTnYdhrCY+XgApDi1uTBIjkNra15qWarPh3Ko3d65wy1Qhxc7eNANYgaUYVmn26A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6sTjwj4;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EB606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 877EB606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6sTjwj4
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso4689589c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862427; x=1795467227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lERwLl6L3SB+cW2u0pTxZJmstnyAKlq8LHXRUJrT0o4=;
        b=n6sTjwj4rgk+1fS9VfWSzK4SVhUEPnjiU+zeYTildALtOMi9u/kBGtcwgu9CCmANDD
         N+Z0pEU7LWaNBrvKNNXPd8ckyhIrRWuuhVaZYStJCWAzQdf7RuBegp3UXjJAQ9xK8Lid
         h6TwCvLCHX4R1CJ66H1sGaZr0uzDN+lrb41UgwgUumh+2LQivp6QmSHftQ8CQXcrdbm2
         OycwRc19yNRBFD/8IB/6GcZjqsW1YYm/gn6mmz0F/dTUxg32GAcMDvuYJkaeQgN9jTVb
         yGKuJ6u2R+MXPMksmyZB4gepvv+kO3uas+dfyBvVB39OXa1pXJmT0qL23VIfKgw9F+J4
         ipGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862427; x=1795467227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lERwLl6L3SB+cW2u0pTxZJmstnyAKlq8LHXRUJrT0o4=;
        b=XczDtoPfAu2BjKcSSnq5Jr5ODItvbxn8AGRjR1z5hRg/kNRjF6vtjcCtEO5R4M6e1S
         XYMx8Y+egt0+Cw29XTOuz6DyisEYM+65oPFZRz3XiAE/+Nk1Y2QtRKCeuxTHa/CEDSmf
         Y9Lx1LXiL5Zy72Us4+E0NyFCqOks58AQFpgeA/ZtvyyXxCDdOGklrvjREC4RANUpOXE0
         G0WOa7TZfjaTTWVGOmNizMd1OX8eUqatRvGNOWy0FDJwjMciDiW0vQN9CeT+o5d8Fa/y
         X3z2OAz25a8xEKOOC+UZjkWNoetnvVboo8NmfS3OTOLIRMbLtjhnJybrAmVNrx59RA7j
         0OBw==
X-Forwarded-Encrypted: i=1; AL+hErFr4EqwxvIKecESd65xufuzcxlZlauZzGz3cpzDRuxLJXsGdrDFburHNl6T31NEZ/xinNJOE0GRQeecTOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RP2MXMdgXSrkS0lvTR6q0XPiBrpeD+v5t2HWMxuOI2t8L/bAj
	BRexpumi2fjGvc8dOjvnV/OK0IDoKtTt+lbTtC1Ep9SeHXgIZbs105CT
X-Gm-Gg: AYBFou3bSE9KMtBaplfGDZ4uhvgQ1G5VT0VJa62rhAaNZ+C0XEtpY6Z1KdxMDh2M4UU
	CqvZvlZFsA/tMoIbCh/bFYlKNOvTHJehOOIBEMh2LyHXciKrAOcAWs/ZmoYszF0hrm9ug6uIOEz
	J0OQ3Y0j2PiiWxLatTaD1ZuXPmui8hW9zE7bTZibqk4m4ordCqDc8SsoWwxFRyc1K1qPPukjVKJ
	brCk22+A8IxLEsz7yzUX0nSFZVXrnQKL8yex8joJEDwEQcV57G7PyHxTrMAsZY9AIJ4H4jD9HLE
	P1Ew+OHVRTNURwPXRIcplsGgRDWH+82qWlQQi3CBumvTCPYgXcRKhzsCqR205cxKTCKB8yhb+CI
	NTHO7s2c2uyrmNMKy2w4TYzMyaCrc2jGsI29xb2XVPEIS5XWDu/k3Oilb4bq/haRlUj3TTAZt8K
	YiGSlLWG8veB2vXjiC5zam5qFyuSrnGouaJfXvp3NA0cmj0Kh3uRdsIWpnr1QHy16HxETg25kpA
	QRQAoBqwdTN8GjtZh6FkMTri+Eo0kHEP0xVWs8fYQHJB76R9AkUkcifp8O+vAu1ehUsp++a+V5j
	k8kUT8dnEll1xiPHCv1Q8gYi+utamVjfs7kjALHxOzcD5Y6rNGZXun9TwyQj9URK4S43JnC+Jgf
	SltKADKLatxsuFvTF8QPgbxmzYxiUYwUcRI8p/IDAPsss34ctibUM5o3FMNclkxz1AX6IMzTnKE
	IFrChVpiSGy/y+DFRgULJCsyil1hsOHI4DEAl5Iz8hzg==
X-Received: by 2002:a05:7022:3c01:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5031007b5mr9815178c88.24.1794862426641;
        Mon, 16 Nov 2026 12:53:46 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:46 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 3/6] iio: proximity: sx9324: reject negative hysteresis values
Date: Tue, 17 Nov 2026 02:23:11 +0530
Message-ID: <20261116205320.26070-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116205320.26070-1-kapoorarnav43@gmail.com>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com>
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

sx9324_write_hysteresis() copies the value into an unsigned int before
comparing it with the threshold, so a negative value becomes a large
one, passes the "val >= pthresh >> 2" check and sets the largest
hysteresis instead of being rejected. Return -EINVAL for negative
values.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 39760c92552b..9b7ac1d56e53 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -638,6 +638,9 @@ static int sx9324_write_hysteresis(struct sx_common_data *data,
 	unsigned int hyst, val = _val;
 	int ret, pthresh;
 
+	if (_val < 0)
+		return -EINVAL;
+
 	ret = sx9324_read_thresh(data, chan, &pthresh);
 	if (ret < 0)
 		return ret;
-- 
2.53.0

