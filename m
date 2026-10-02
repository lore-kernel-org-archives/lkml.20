Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A3414410
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972577; cv=none; b=RFDBYIMK30z/+UBHiunDkLzvBx2pC7tqI8wZqjR10Y2MTC4H3UnVdpvYCe9xC+jddqHIiW/UFBKGV9WxD3NZYhnxIx+TqaM8RHxnFaOyiOsErg7NLqgSTto7cEG6CjPCN5QbhNVMq8crFzE6WNYbIX0e8ZSIKAP7AHr5ieF3bd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972577; c=relaxed/simple;
	bh=1zuKCeX4ubKsHdgFEEDZASCv9P97PZ9/9qgb9og1SDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgOFG6X8VPsYf3SFXQKJS1qPJCwopBXE8JaDVSgF6A8ESSgmVkZB9iFEpws2fAwDjUiaHydy4ocroX7AHbcrYm42JEsks4AeAqANATJHWXM9lj6ZZPjoadaVik83dY772B90LmPPr9YE8CXXV1iA3ur3y5eTcN0eCzpvNXehNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbCm341R; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbCm341R"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5ce99149so694788085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972575; x=1791577375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxbnn0+HyLrQHSw5N5vcj8DOerEWS9jU0mk7xDwdzyg=;
        b=AbCm341RvLDwkmK/S7LLO03iuarUsWKqjvRSx674cm3+gptpv+rQeQ2f30UfVWWZF5
         YmJ1dun5ajVItEBWyw3VOsnJvCOz7p/s5zJy6v0xH3lvzWAYFmCmarBD4JU4ryjYLGrK
         z9nEsVgN0yvPS3S/lDfXNQxkfKQtxN/nNmIUnLCmxAzWp883aNhSBujpc+5u9dW7N8x9
         Xfjiq3wr8f8uQmsCc1qHmmIZ7L4xxo+MuZW343D4Up5IoW+u1rtzxSzThxWKkqTgqScq
         Xf3hvlpMUjItdqKnSrhAquYe9YMm6/rwdh3zWBTvUqGM1x+AeBOPEDZyGaRTjV2CP7N2
         0pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972575; x=1791577375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxbnn0+HyLrQHSw5N5vcj8DOerEWS9jU0mk7xDwdzyg=;
        b=oq0z3t771ID4HHV8si8+oajK3QEQeak7iCDrhKYDivCEkugdHNFjYAShzCbhk0xiWJ
         3zcUy8OViORZ/BwPvmPFM0twrPamY3mxCYDq3iaLbRFNMKcfFixGnP/EP+67i0OL0RUt
         lqYEHi6Wzcqv9PxvSKd1bCiGh9/+wnYrGR413K40p4AUnttxJscrT4ixQ+sDcejA2t4j
         oY6YEp19djPK8daPBXkLlY7jlS1mJ/JE13hKoicnVWd6Z0aM71n6N/ZFaI77hzOT0u0B
         eoylJyivUYAHVvRvv1l5p5TaUg5XzTcTSJNuzONjLJQUbsMTCmr9eFWNJlTulS4qeWnh
         BIGg==
X-Forwarded-Encrypted: i=1; AKwUvBwpHI2+XEebOjXnlvKQFefTE0VpgEDk+Nh26uguN21T0Nt5XAFooMzvT/+lemzYMyXWR5PCMmlEx10M9J4=@vger.kernel.org
X-Gm-Message-State: AFuF++mYNy9+c0OKKTg/sHkwH2c9nJMpjwsS0bSr7cFPLj/MkrVhXOQQ
	rm/o+almLDoCoPAccEiP/yd9Tv+YzYqjFWoz5JVZprJSPVDxQCPzv3yH
X-Gm-Gg: AYBFou1+rRvVcyTe59dZ7PuKE6xh+4dfkMNgFdTAo3V3dYuA+lBFZtp9NPFFeSFZmy4
	fKfjO+2o4J8KouuzFJ0iWiYVe6CSQ7LhA78+XlBvu68qhOSKcOzuh7C1S9wjl55B9hhC/FO3Vsm
	jccOu3FufGsFsvQ2BfaDOjK+rNUY4zBGe0+C61cCod8LHrzL3jEdXBcWhaYPgnlUbzotBFr1TPf
	1GUUxfFzHjyNNxrDLjhkhKKWSAQOIOQR0UcberlC40iL2HguIKDXfG4z6cb4IKJqm5qzVnf0+I/
	HUcV59id2Z6tejU57gRpDLfBrMVTxKp6L5IDf92ZGFUz17Qy6G0TFoPjYb9AtTlDpjXUcLLHZVu
	m+PmI4Pvg3EoWWdfuM849fFJmtv31maVZksXs5joNlfP2Fj8I/snbU/XCVVIPgOBK8aCB+4J6qA
	II+HGtJsLdUXH+wHPkgnx89BhPthy2SS9ltLKIGFTT+VG8JQtd63nNSVzAxKjBB7G3z2dMMpH0e
	wjwApYgG4+CBMSBiGhj7cedcPhFykLR927F
X-Received: by 2002:a05:620a:1b95:b0:93c:5dee:f04a with SMTP id af79cd13be357-93ce7a9de6bmr754544085a.7.1790972575184;
        Fri, 02 Oct 2026 13:22:55 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.192.96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm308676985a.45.2026.10.02.13.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:22:54 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saranya Gopal <saranya.gopal@intel.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: reject GET_PDOS responses longer than requested
Date: Fri,  2 Oct 2026 16:21:02 -0400
Message-ID: <20261002202102.599998-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092932-arbitrate-snorkel-3fca@gregkh>
References: <2026092932-arbitrate-snorkel-3fca@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

In ucsi_get_pdos(), the number of PDOs is derived from the data length
reported in the CCI register, which is provided by the PPM firmware.

The function requests at most UCSI_MAX_PDOS PDOs on the first read and
PDO_MAX_OBJECTS - UCSI_MAX_PDOS on the second, and ucsi_send_command()
only copies that many bytes into the buffer. However, the returned
length is taken from the 8 bit CCI data length field and is not bounded
by the size of the request.

If a malicious PPM reports a larger length, e.g. 0xFF, each
read is counted as 63 PDOs and ucsi_get_pdos() returns up to 126, beyond
PDO_MAX_OBJECTS and the number of PDOs actually read.

ucsi_get_src_pdos() stores this value in con->num_pdos, and
ucsi_psy_get_voltage_max() and ucsi_psy_get_current_max() use it to
index con->src_pdos[con->num_pdos - 1], resulting in an out-of-bounds
read. This happens without any userspace action, since
ucsi_get_src_pdos() calls ucsi_port_psy_changed() and the resulting
uevent reads every property.

Reject such responses in ucsi_read_pdos(), if the PPM reports more data
than was requested, print an error and return -EPROTO, so that the
invalid count is never used.

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Print an error and fail instead of limiting the count, as suggested
 by Heikki.

 drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..17beec16fe19 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -862,6 +862,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 			  u32 *pdos, int offset, int num_pdos)
 {
 	struct ucsi *ucsi = con->ucsi;
+	int len = num_pdos * sizeof(u32);
 	u64 command;
 	int ret;
 
@@ -875,11 +876,17 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
 	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
-	ret = ucsi_send_command(ucsi, command, pdos + offset,
-				num_pdos * sizeof(u32));
+	ret = ucsi_send_command(ucsi, command, pdos + offset, len);
 	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 
+	if (ret > len) {
+		dev_err(ucsi->dev,
+			"PPM returned %d bytes of PDOs, but only %d were requested\n",
+			ret, len);
+		return -EPROTO;
+	}
+
 	return ret;
 }
 
-- 
2.43.0

