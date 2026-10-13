Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C76480DD4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862959; cv=none; b=qdv4lxqgyKr7HYu9radI3KRRnXmsZD3zHJdOmvP3N+Lg2skT72OnYckgzuhtB36Jvcvr9Os0Jy/+PX5etNcU2rnjz+sob+dVxJGGt2mdr/bKlzQYP/NS7KbI6ng+1W8XExkflfn9PGyarGCi0+W1rr5qC/NwLbixnPQAb8xU1bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862959; c=relaxed/simple;
	bh=9lnw1Fa7+1ai8yMi6EJQc7Ex1qH5GtxsH56m2SS0SDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PPfZW3bLO50R45siq9iDb1+sJz1z32bl9ey59Pj8mk/WwPI8ZMbLDdg9IqYoec/KS8rnCeWy0z4TAuze+Wew925bWoj5y9X2ZNWTUzM6K6ePV52tj3w+OOv0Wxgz0uAI+TZ9IIlbPFRanDt0NHF7Kbmfa/zb54XDBhh++f8gy5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEOJX5bP; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEOJX5bP"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35834f72d94so4458950eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862956; x=1792467756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPW6ypWLxPBPK/wnHCdzFVOHN9Lae0KKKozgNa5aJtQ=;
        b=sEOJX5bPJ9wDOYSoik+8biy/9ObTKHxxJJQq9BkWc+xvM2/zNZ454I3ak2+xEWj+0X
         LtK8dIO2iOuBgtdEAAks+rB+wAn1GkpedyTyDjcm4KguhUAL0dSPfNrIIrLH7mG1QZU/
         ux9xrkPs0RVsh3ASzK7/l4TlMEH35d1VFMwJOO4/rJFg77k5flyAhQsBVoAdLOdtRzIY
         MMfUou6bhKLl2ASG6G0pwcAe2met/6tMJKw3j4R0wglQmszeRxhJSt+vwugbL/e3bRHG
         1B8sDHnLf1F+LRO2vS55P9h8wa9Doui5dm4q469HjmyxLdgXVhwbw9NMcQGF/AO9bDDQ
         wU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862956; x=1792467756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HPW6ypWLxPBPK/wnHCdzFVOHN9Lae0KKKozgNa5aJtQ=;
        b=OW8Ykcy2tCjiXTMwZH4XP50Vbwkpi54PlSu7+ZAXvEl68hiBCpAP7tyDIlrnugngSG
         bBR63RkxdCwkybDSmf6HYhsiwIBhl8V8evo9WW+9pWSoFhuMpKn7a4a7hnjv1N189nck
         cYem2MaPYMNN8MsCRRrVaE4hPNsJIOhplJ+UjQeacE27m3/M9l4a/bWMIRdcJeGDcr2F
         TASQwzokS0jOSAn8rr8DCBLB40UrIrD0SrntZKUYawt1UkWMk0Y9uZelnyapJtUVow1+
         FUeU/wIwRoN1yjb4eI6/3F8FhXsp2kPjdOeOuNrmL6QNDItGlQsjB5j8C13W0Tui/L4A
         Jkiw==
X-Forwarded-Encrypted: i=1; AKwUvBwz7lzTaEvL+cfvcwiZ/GUbHycxo80rpIYpm8lsiCs1LhNrBda8bBR/K3U47wTQS+FrPYlEKxawtGn3S/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdAriTkEVNZW37LeYdxJUo45pgzen6PT9Xb11ewTKDFUuBeJbv
	mGk9AlH2iawxbO0eSqLPPvlhSiAhfUAfxn2kBNylD23hCUrwQ1PwvgCz
X-Gm-Gg: AYBFou213e0GK5lyTlahJh6oM0vEytvo85wENxx2pghBEueunCT2XpE1wOIvt+Gg4XU
	uJfb/pb5h+8oHFsPfMGFkDD45+8tHUCuqZTKNGi29S3U5X3IBViJUBNT5FdkZKrySnLTUFMU55H
	sCI+T7qFQuG3Ce/KJWf2m8sU+mtYvCQY9LW6v+2SvMgFWxffRCsk721AdUWRDxaN7oFL1zc2cY+
	MbUMSezRnoBO3wxNqlRdF6VzOG8bL3xd3RrPMUpd4jKvQ1mmyru2mfEJ1PnWCTjc3akrumvGW+Q
	1fn0nD/6TKT/OnM4/tqcgwI8zH394fdruzLMfX+hZPhx8GJXYG/DV26HKf4P3RcKDcQ4iFLXVqv
	+9yjOn4h5FwZrRNukHWLlJ0QL0H8H+/0TOWkmywey4a/lz+W+cHqNy8C6NRPgb2xmpanQdevkrc
	4ao7us8n9dN8lpdXL+UV97XugyRHS7rgSB4CDBoWoLQhaMFRbe8Bdg5ieAHPqROR/2mSwnkIFYt
	7kFwx89PQo4ySeHdQy4OzQlH0zEqjw+zX6HRVwOWVHbEOWysg91rQL1ui1sMdA=
X-Received: by 2002:a05:7300:f582:b0:34c:5831:8a19 with SMTP id 5a478bee46e88-3537e0493a0mr15617210eec.40.1791862955569;
        Mon, 12 Oct 2026 20:42:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:23 -0700
Subject: [PATCH 7/9] HID: intel-thc-hid: Drop redundant report ID
 validation in quicki2c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-7-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

Now that the core HID request handling validates returned report IDs
for report retrieval requests centrally, the report ID check in the
Intel QuickI2C driver is redundant. Drop it while retaining packet
length validation.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index 41271301215a..7a362a2ebe2b 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -160,9 +160,9 @@ int quicki2c_get_report(struct quicki2c_device *qcdev, u8 report_type,
 		return ret;
 	}
 
-	if (HIDI2C_DATA_LEN(le16_to_cpu(rpt->len)) != buf_len || rpt->data[0] != reportnum) {
-		dev_err_once(qcdev->dev, "Invalid packet, len (%d vs %zu) report id (%d vs %d)\n",
-			     le16_to_cpu(rpt->len), buf_len, rpt->data[0], reportnum);
+	if (HIDI2C_DATA_LEN(le16_to_cpu(rpt->len)) != buf_len) {
+		dev_err_once(qcdev->dev, "Invalid packet length (%d vs %zu)\n",
+			     le16_to_cpu(rpt->len), buf_len);
 		return -EINVAL;
 	}
 

-- 
2.56.0.385.gd3acb90ef8-goog

