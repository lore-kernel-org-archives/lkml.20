Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823947F78E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183053; cv=none; b=mTiq8oVreevBvb/nqlE34viUK6zWDsd1fMUNmsR5XimVWskcrGPAadbwg3bjsLNxJN364HbJ2ZGQslpUHRZoldo2BLVcfayfk+wktBplknuR7QIR/qhk6RKq97ldt/HQO3ZBKWdFGmd87jjiNXo4FoVHSZtk3/nOuWcetotZrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183053; c=relaxed/simple;
	bh=KxGHdtuFcz7Pa/useCIWe8nQJkpYfq606H0uzQpEUW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnqvZ/jZMbSp2JKjZD9XQCj1InPyFweIy/u/9OhKz1KwvWa3tBm8XU+YgURauoYMw72ZtJ+JUDLwGNqbB2sAnll0lkUNEwOZdc60Z/+PorArA0xl6/534y+CgDFP4QnTKcMMDV8JxQE948Qc1VmN6/zSzF5eLxI3c3Fr884P/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUF3BONO; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUF3BONO"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadea0so73238585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790183051; x=1790787851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXAKuSszj4G6jEUdkMMZJ69gR7K+U4AkbT4uBZF3+cA=;
        b=mUF3BONOohbmSvGqf7nrKL9prcibp2HGiSG8Eq33PQbaDGp18lyLbDKaHyw9xFw6+X
         tiTNOa8W+MMpRUe6nZIfQ9CnWY6puvffBDZRiSMGREqI8PepKRSlH4sjiJqJ/nnIV8S+
         uQvWKae9f8YF81Wm3ZHlO/3gfI6BgLWoBBid392uliOgD0oItCiEnLsm59UDyn4unk4n
         d+pe+ZHsV6mVh+0heX2soQ+TdnedKV/aXvrkOuvi+NzBPpcya6VH/7241CGe8YYRxNIK
         zQFzWOMZ0Hz7WWyJ9cz3erxGeBLNsubNRYjz8KfRF6IRy2sJ/1Ifg9MU6vzBPEfDyBL6
         st7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183051; x=1790787851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXAKuSszj4G6jEUdkMMZJ69gR7K+U4AkbT4uBZF3+cA=;
        b=pDVl3qbZx8NPfdM+jNzB8JycW2BktAlYhvi91d1FYhW3T+/dszJilPuKAqVNobu878
         SQhncBMht7FYS5UylqPRxmzX8saV6OWyGb0/Zq33GNhQecguE01U6hrmR6Z1b00P0C1e
         OQd9QcebYr3o6PYsYctVfy+RWUZyxutIpY306bS3VFG7IZ4RQGm9AKXA6pOfrpr7KXuq
         7uqbXhtXEGCNRy3qaVPfM/JaBOtpapO+pJs1FayBzzB0KmjRJoLsVsw/S7mmWTPCR1Gh
         tLt/DEBDqBBfcdMqicH+G80zSKW8gzaIFxrWAUmL7Hm9l3h4ZC9E1aBkROEpUOsVhD/T
         2KIw==
X-Forwarded-Encrypted: i=1; AKwUvBz/NdUtR9qsyaGaM4+eAIqwChHTyn73bY+3aCQT1g+lUZr0aQl+8SyHV8vNRB3O82HFzHUSrjTwwwKjbB4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2gFVtdygDHs//F7EZF0EC/UI5O41luTTe05btL8b31gyrFGMi
	G1YV/Y2k9jDfDc22O+JQOpwcCdoBIo08h9h2oXo7mEFJmhDo7CoO92Zd
X-Gm-Gg: AYBFou14zuzcqHea39c+JhetVVL9+qPQQkMK76HyhPBUsq3JFmT722Z7mqIl/kLWlUq
	KmRjEf/QReTcKWFQrijvh4PHkY4gsMbqnfpqW8+oTZd2WVMkc2hyBvbrMMJ/hbZtNraueGHzyok
	DSSUhkBtTlD/yUyrSH2kYsTdGgVhdtirXU7gAn5I9bXJXSWae9QPdMv0LQ0sY4wtZPnCMNMHTT/
	6+zpHnMrI6J9c+CTaMVkFE5Ad1uTMJeYaT4z2YVGmMjsaVyjG9cLn6ysm7p+1VEDc6ikJIqVtL+
	gRB05HIzetIKaNVpMdIOB8lm3rNdE3CLqvbqZiOUaJQq8E3eCHffwaFJhcNs+C1yru0lsVS0cEV
	Nmzf1bVUV3Mp4t7u/BQe7CRl7T5CY3GM9uiUVKs8TlVIAEM4iNUBqRdkD4oQmazdFLceTC5YZBO
	FfA774UbAfUJQdoXy21aFBwzB0DY3/9nPZxebicIJNJ71nSzRsBMiT7VtxmMGVZzTpuOwERohxR
	D41x7byYHBXRbDpTTLSOxsMhXco3MHjFoKiPSdRHWf1fw==
X-Received: by 2002:a05:620a:40cc:b0:93a:273:6a41 with SMTP id af79cd13be357-93c250ce492mr517107685a.29.1790183050431;
        Wed, 23 Sep 2026 10:04:10 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.192.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2482302fsm265902685a.12.2026.09.23.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:04:09 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Jun <jun.li@nxp.com>,
	Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] usb: typec: tcpm: reject type-mismatched source/sink PDO pairs
Date: Wed, 23 Sep 2026 13:03:02 -0400
Message-ID: <20260923170301.415666-3-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAsoPpX1NgzMKJrvTdNp0heM0AMQAT0_t_2+AJdZs5fsZNpLOQ@mail.gmail.com>
References: <CAAsoPpX1NgzMKJrvTdNp0heM0AMQAT0_t_2+AJdZs5fsZNpLOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The tcpm_pd_select_pdo() function matches a source PDO against a sink
PDO using their voltage ranges only, without checking that the two
PDOs are of the same type. A source PDO and a sink PDO of different
types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
be matched as long as their voltage ranges overlap.

tcpm_pd_build_request() then combines the matched pair with
min_power()/min_current(), which apply the same accessor to both
operands. Since pdo_max_current() and pdo_max_power() decode the same
bits (9:0) with different scaling (x10 mA vs x250 mW), a type-mismatched
sink operand is misinterpreted. This misreads the sink's capability and
weakens the min() bound intended to cap the request to the sink's limit.

Require the source and sink PDO types to match before a pair is
selected. This keeps the voltage-range matching introduced by commit
53fe0de9a35d ("usb: typec: tcpm: pdo matching optimization") and covers
both the min() computation and the mismatch branch in
tcpm_pd_build_request().

I found this by static analysis and have not observed it on hardware, so
I am sending it as RFC.

Fixes: 53fe0de9a35d ("usb: typec: tcpm: pdo matching optimization")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2d6b14aa2085..4959872050ae 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4514,8 +4514,9 @@ static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
 				continue;
 			}
 
-			if (max_src_mv <= max_snk_mv &&
-				min_src_mv >= min_snk_mv) {
+			if (pdo_type(port->source_caps[i]) == pdo_type(pdo) &&
+			    max_src_mv <= max_snk_mv &&
+			    min_src_mv >= min_snk_mv) {
 				/* Prefer higher voltages if available */
 				if ((src_mw == max_mw && min_src_mv > max_mv) ||
 							src_mw > max_mw) {
-- 
2.43.0

