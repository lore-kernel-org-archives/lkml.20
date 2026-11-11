Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432566;
	b=iB2hlGM6t0oRg5OFTEEvCpgOv7CSjU6ddr7tRsrgrwLKG0sXhhgle4W+7Jb9rBl2eVDm
	 9gUd8dkKTvNYdZW0Itphsq7qDIaBB2ecV++nugBB31wlCk7CqLkCeIaUPMHZ1p+PwxwKI
	 kQGtlOGihKXCqCi9joTsSrVs/UuV5AMO1FT4WrzXAu4A271qYc8pRfhsMcArcYMr/7zZh
	 svxDhlwYLAWK+6jfrr9MrktxnILZZ0EtDhsXx7JlvQZlvqHIHfawWANd18jLgWukehaQs
	 9BALe0fe+/a1x+D0KkJaF5/En4xEHNFsbfBlCq0dKbdRuFHisQFu2Xmwv84hTtuXOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
	b=i0XqftOHDTQMrR5eddYVkKM/p75RTHtzT8zi69x382ozpOAFuOPQ6g2hYzw9bjJi+ums
	 K3/YIR+KkVidzTBS8LrwaRaRT5vIXNRyKE0dlSj3rP9xTzs9bPKIJGVoXZC8vJ3y4mYBd
	 rk0ZT7xARApdmrW/k56lPbG3p0lo3CXr9k5rDpdn11Z1uwdjgz9m7dL3lTugw0f9t+ZBn
	 /k5duPh9rffx0subO39umPRne6o9i1cfHnFqOSqF5IzpuvQgxMqugkXjPFszhUCu6jWec
	 ine6mLZOSybyNfQCWwbGfP2KSIkT3+JhscSFvJIsSUpizCB5+EXl8fQhqKWCTdw34uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTLKRFfn;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F77606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F77606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DTLKRFfn
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso125991a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432565; x=1795037365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
        b=DTLKRFfnZ9XydDu38dZPgAw6wPK7MFh60q2ondkRQNEHwW79dfA9HkFUIRmzK3Y5Oi
         PGm+TIDXm2T6nMkuod/Zpsn9U1PNw8FKBL85KrUaX8EVrwLELcWAbre/q1Hucbt8EJg1
         YRYeVWyY2WiyNt2rNckOeXwp+t7pd+Snfm0CLYczNrA7Uu7DyzQxn3Y/EkaUbyGU3LEe
         wl8jsQ0QL6yg2J84yiAQBEHwYePRMvZbBKRO6KPBcR6SrlTRXzFfx7kO0UfTzBpWPQUE
         DGVV1JX9fPru0sahKe0OJzSofVJOhOqMrNPYPTAH3IimnCbhWTX7J600ensH0AqcjZaf
         71PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432565; x=1795037365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSsMUUEQnXB3GC+EEMSfP/z1n1AfARRtyZWyBqYvQns=;
        b=FKTe6ossivrK5xLRPFQhV1M5FL+MrS9bQ3f08371r6pLZGVlAPZjQG0RQrPlq3oZj+
         fNfgPnSFJtQEcc4vlGjJv+BUm8sWO/XOKO2C7QZl8CdjdDLDNGEyudDY8Y53q+BZG0zy
         3o5tIx2CABHoDwjYnsRojBgAooE3dfbn2k/8KZObPbXXsHIW5JxLeTubB/ntXB/UbFeI
         vyE0JZzzjVGFFRN/nyakaxvAMTubziZzDi/xkk9fV1LhsBv9k+O+UC2W/kQmkkarOGNL
         jOqjBw+F62LfdBv7+CpviZcA2g+Zudr71MBylhLLpytRsn0GknemPh2xdayYNYIe2MsH
         YOmQ==
X-Forwarded-Encrypted: i=1; AL+hErE9fJCor/sijbI35O/o4zxTKyA/X2eh0nttkj09KzIXY0r7Wp5IHfHd8Sls/qO2pslVL7p8igArmWUSN7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AHw5Rq19OSevfokF+QiZ4xUI3EGceQVr2EiQOHE4QLcUj2u35
	9tLlKczL9bChAFxYSKhS89LdfYqMkfUrV2W3RZtc/CHVTlkg2QFhp71q
X-Gm-Gg: AYBFou0b9nZFgSMkcIYOX+UzW8HdmgcPZ55AIizOSv46NxiqpqQE2mOf7rhueXdbMzj
	+KIHd+4abzXgBMYTY7/jCdoQfZCdNzK/pGX8NKfQDHPIP5AcR+McUFcPHgQdnJKqsdEdtw7Wgcc
	fjLCZ9ZH0lsWPMeS7zxaeQ26Agk/gW6E65G3XjnFLGgB8Onr6HYc5jsvLxVfNkQzTICxyIRYvK9
	HRhKsNj/A3ArS6Y8P4iZ26WqBJ+Ng+llpngAtaEJTZEDaTkQrcsRJbL25aGiED7uQ2So4XOZrXr
	cZx/CkbkNI4M+blfxxKAMP3YZrzrgOsu4+161cXUFKAHRe4VxEcEMPCJrN2RSInArBkFsE+iobh
	IztuBdRgsPfMzH97l32V4uupgSaPKMR/9LEg0Ye9GzHhSlJrJ2SCWN2EKvUpbP375felA/8i00v
	AXPKN60Sv0u17n6zeiIMF4o6aoSAEunUf+C5X8HfHyx+ZIq3KoPlIlaBEqgkmyp/b4rBc391vm2
	7pxK95H1/gGdZjCZ4BZ90ZP4M7cI2h8//OJ3xkuPlUs8mvV6YOsNgmiPSKrydp0B8bTZs2wcoz7
	9l0wdbFatUcjNKAq9eRoKqeiCEg4s8c=
X-Received: by 2002:a17:90b:54d0:b0:3ac:b3c7:de04 with SMTP id 98e67ed59e1d1-3b197ccc66bmr418449a91.34.1794432564906;
        Wed, 11 Nov 2026 13:29:24 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e0ecd3sm2310465a91.3.2026.11.11.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:29:24 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
Date: Wed, 11 Nov 2026 15:29:21 -0600
Message-ID: <20261111212921.290857-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
registry.

This prefix will be used by upcoming Devicetree bindings for
Casio calculator hardware.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..f05475072eec 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -303,6 +303,8 @@ patternProperties:
     description: Capella Microsystems, Inc
   "^cascoda,.*":
     description: Cascoda, Ltd.
+  "^casio,.*":
+    description: Casio Computer Co., Ltd.
   "^catalyst,.*":
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
-- 
2.56.0

