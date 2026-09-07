Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC583C5DD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774840; cv=none; b=AgrVzVAViZmMLwGUHJGxqzAcsxeDXqjc29hr9oSvk22J1XBWMS+06cigO1hS/Gyb6cabRkE3utIVaXNf7mKpASjmfctRA3vDPbJsaYdnOhSF+AYDnMz33QJL+bM1egyDmFxYYBR4rPpWiMkF0CUhhadyvOQH7F8hTPuH+b0TVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774840; c=relaxed/simple;
	bh=eeIpykqHn3v97v6Vn5NBMhwy/4B4kc+s5oigMCXgBFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2fJyNKunFy5xxPO/G5QxBps14qDHdQ/z00OzxzxlY/w8VPNddgk2n58gzw6CiKaiIWpHtrzOdHHyveZ5DZSGHo+7blaUryoD0aSo8sJf7JRtvTRKUcoT+6kxQIFgMEST6xy7s1rbFIjmk6QqWRbMf0AWogjVCpvVzn8hPz6DXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0RuOw1Z; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0RuOw1Z"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2453512a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774839; x=1789379639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvhoiELaoR7kd2vY205ko6ySCRXz4bZekivzye23j6I=;
        b=H0RuOw1ZFHgxbb/w9fEZBiBOdB4eOcpf1z/HCrUJ19j2GoD03iUa4gqY4y5Bbo4HwQ
         SlwLELBXKoJZR7/npOoI0dhhdkNRv0oLeWj/Sk9Ipnp4tTce+WESUR6wCFHNbrAAURDT
         9L4eXF9HAw+KZ+qZs3TlTaHkszeMec0BujEeNco9arYoLOZAhkML+ijN7tfwUsO8Rf9x
         DkuQ+x5OY40slfKnJjKpfSg+XBeK/9fIviwoitJ9RJg1D58UAlLP9r6qlQX95N3/MUtj
         2poIGmguXB/ce86dO8BlTQA0pwOd/5ij2/Nq/P06rYKQ1omjNmo/5ht8TcsrPy79Tdkd
         j8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774839; x=1789379639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvhoiELaoR7kd2vY205ko6ySCRXz4bZekivzye23j6I=;
        b=KC7P3uh8lcFp0vDxVvzuVCseUkjVd1slDXpXS+f59mznGtdSU6nhLjO3XZTxkPK6YL
         +2AILPqdXpwpeGS8NwyqplGJMivTIhsc1j/zhUGBrVaEdJwkIJ3X3UX3K25mWmNk88sa
         +filK5OpPHLNsqur61pu35hDZ6ExkzD9qQqsoiH4WxH09U0t1M9UkjZTj9GQkRYaP3DG
         Fw1ik0fXdX/hVAVWMzBTkGO2HiHkCGDVmWRBiCxmy/PkGV2sMZZwHDiFmbkYoSoUPnfc
         Xng2HpWB+WkhwfL1u8uR7xdsmY5gQhfBOm8Cpr7R2cgz/mFHvk+kW44P/WfCCqaKBiUW
         Kz5A==
X-Forwarded-Encrypted: i=1; AKwUvBwYa2LTrSGSvwFITi2tkVJfWBlrLdMARHwbzqEy8p60phPeFEvjJaXGbH41zOCWzFTfqU0cGPpv6YKFeTs=@vger.kernel.org
X-Gm-Message-State: AFuF++koX1TeeMOFxfOuBXrEB/jRFMOBnlAAyZiRz7XTUvhLpXZrsD5O
	qk5VawR4zCcsJTy02+Tb3IAKNnttz7G07Gu1DIJ7axdIOOuMN85XFzAoUdjFqs+jbJs=
X-Gm-Gg: AYBFou2DUR4TiF7jRuZoNp6iQOPhdpWrBbaQngtZITlFnG4mSR7E2pOj30XQYDXoqCx
	JPNygtdJ9GGGcWXMKTGbk9hO8J9XC24TEHZVDwr3b47QrthslhEQZYTErSSzdOVrb5mHaw/jtdW
	qtsU4gk15bm5sOy48avAYx8dkyw8TzoWb/qos//TlhYuKFigB+ahSUv8Op+1+wJm9T4PUwuWUmL
	RB77FsbFhHawhze75IWbjOAPIsqLSYygXjMQa4Ntj9PJimuG2CtyFkGyOpdWjtIQJxSV26k0adt
	rANPWwOMV50RIhYTX8MAIXTQtZ+Q1wH4LgyCJP6/+Pe8WJTQmVgRQnoQQKFgjQaEFp6I5xZEscC
	DDxTR6iwJ6EM6yq9G8mNekJsM3WGgrtoWenXIKO1AVkDKvTDg79uylp+DFTzoOmRUOmH5v+Mu0j
	MYtw0ia88eP8rWFxo0KOBmco9w/DmKrMjQsHLegBEqN6o3CH2HNzmmuOm+mq8bjvBOTNKJAqHHw
	qMmrUF/Z5bVjg==
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr35242453a91.19.1788774838738;
        Mon, 07 Sep 2026 02:53:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm30377066eec.21.2026.09.07.02.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:53:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 3/4] wifi: mac80211: fix typo "capabilties" in comment
Date: Mon,  7 Sep 2026 15:23:47 +0530
Message-ID: <20260907095348.26094-4-hemanth.selam@gmail.com>
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

Fix a typo in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to wireless-next and use a subject prefix naming
    the component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto wireless-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907061417.33729-1-hemanth.selam@gmail.com/

 net/mac80211/cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 23f4f9ec86d0..0ce7a7ab769c 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2870,7 +2870,7 @@ static int ieee80211_change_station(struct wiphy *wiphy,
 		}
 	}
 
-	/* NAN capabilties should not change */
+	/* NAN capabilities should not change */
 	if (statype == CFG80211_STA_NAN_DATA &&
 	    sta->deflink.pub->ht_cap.ht_supported &&
 	    (params->link_sta_params.ht_capa ||
