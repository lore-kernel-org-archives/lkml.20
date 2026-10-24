Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866089;
	b=zybbjCjOSXX1CnX6mi8ZRgjoQGi6RWHpNROiqlWPRuejPA14obD+qqmdstfTgmyDLAMh
	 x0/jpRLSj11UTC8TOMYseoEpA3U6xd9Ltv89dGrNRm70VlYAjBUTH9A4IqE0+ztQQ660+
	 Ug/z7dxIxtVzhksTsjoiG1Tm6V4L8wi8pJ40gSQhWgGQxPcImYhB5fN0hPY0jyGl+ntP5
	 JYAlXx/NlWYeqggQqBI0DuBaRv8tgi11b2mQpDJk7M06teT62Wt0NjqebajjRaVBZJsX3
	 k3emijldO+82fL8bB0NBJMYDRbX5KUUzZhQ/R+ITJsRuSGLjOeYdd0qaeUdFy1ZUx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tnWMP+dPC4jAvQQAcsQzyieuynX50OBlfcZb/HMCvdc=;
	b=QdeRo059eBHN+bbu9abW8KkB7PCoCT2hqNjPXZY0KhhQSmBrVUhsDqlDda7jMeCwS5BZ
	 u+TMDqkd8sBYHxt3uzseHn+UJN8+FkJifIqeOr8eWTmsE+COlp7ZyiAsZQMXry4/Om1Zh
	 3pisYpYCdnAJziauk6RrY00G2zpE3np68D4wUr81rZw1CkBnmNpG0hapkU319V68QYJZj
	 dC0x4u+uUY5xcRDAxf2XBM8yNli8E4hYKOQqUvPBTzf13jsvZKLSG1ZTjtbIGh3/AWl0b
	 ypPm05se9TaAkaXKAgYaxBvDVlsQJayv50xtPp4FQ107JhP+0uYi7JT0RpUSh5rQ4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnrmlxZm;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2115606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2115606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnrmlxZm
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so3102438c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792866088; x=1793470888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnWMP+dPC4jAvQQAcsQzyieuynX50OBlfcZb/HMCvdc=;
        b=EnrmlxZmo6vlijW49ATP7KLoUG9bEwCrhuL99N4Qx5LWAiQmTJFDrg4x/P7hJxSiki
         JqjtcOqezLBkCyBdeW0aAqNN6r33SSLuhUXEADTOxrwn/xkPJ5A5PkcVNSN6wSEPlkzx
         eDdMH996EuWyZoUjMYkTVofhSk00izOTAyTv2+VVZ8gy+cLmFmnS8/CixMIS/ftejvlx
         v9//BsLUOVlbR/j3SsSjak/cI953bu6qe8JUmvoYs+4sBgkXcAkfMwtuuZAj+Cx+Kxn9
         JlvVaRqk1rqEdzN8Xi4KQ6QCYXsUn0hhnYpdufqMF5tle0+F3VbesQxA24/mIiw84jNg
         p3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866088; x=1793470888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnWMP+dPC4jAvQQAcsQzyieuynX50OBlfcZb/HMCvdc=;
        b=kyBII3JLMyMLLr7gBAm30M2Ig7L0pxJBjs6jbaXnaOZHPVod3nswGOIRHdzL5GC6ov
         7OazO4/QE4DzllapRl/832nAd9eqamTL7qw+EV9deQopVEwuQDZi0DwkiWOon4Smmq2d
         QBvc0/RqcLPZ4Qbup+gOBRA9EtexYLMi2JbReFEeWNRkRUiInvqXXKImaTiEDkIS90tQ
         NzlWzNwwQsVb19RWnvkCG8rlEc529X90XbBm6MsmWBKJ4GsxjYxNT7cjpUTGoks5O6Ok
         Y/wTDNQMiVEYNOTLB9tTUrlYR1vDcYTERiO5AZh/YtavcVw5R7uwgt4xiU0ZfNjZrmwN
         YxIQ==
X-Forwarded-Encrypted: i=1; AKwUvByQjFp7iVPN+Fv1IGNCSPqhSZc6GbRNGvW8zvb3dQJ0UYxADlpgjIb96IkPQGI52unDf+NhVYaxk5VkRJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3KX3tUrTiRkv5nlb6/L6G3VpCvmUIQQLttY6C2220EdsyKLEc
	TrlPLP0IO+ltOjlwFxkUUBy/t+wyTBw/5gehaaLQt1kV/TafzYDNx7XM
X-Gm-Gg: AYBFou2UrBLmo1xyPnCtRThrFtV4ai7OXXflmzkTAl+Yxjg/VR7a6naSuqFgja0CCu3
	13U4tIeLygrkNrcsejahO9Qf4thnwvGgR+gKRAFXKPebDUWV3CN0Wh42Qky0qZg1g+HER3bscve
	znQn+WYGx9Ej+IXGRSLG3ZAv7CBgOubIvIcAcm9oicL68XWZqoAJmz1hZDkv/vGoQB7KA+Nky/L
	9o2Hu1MDcXAsxngfK9uHexaXqTkuwAztmhMtIghp7hGFGKqzDECsUeVVyDNMIhb51FnNJxSpJPF
	duEcZDPRaHn37iFPE9yHE5mQQbEfgL7NDjk7vRgHg0xI8syZmkMiaA88vUGzFE288N3QPkOhQNl
	kWPoq/i8iyZRyA6bwxhUwBYG2XOhYjqheM8zUEIdo/g4zY9IpADsF4r+UVL+64ks8M3rMgR2clO
	hgGolroBFodxFwGWPBLAiunRfVstTe3Ex+QVUK/mPKOMaKOelIQ37l3ehe3raFK7gBDT+PgMeTi
	hFL7Wiz8B1FNWae8HFNyDFG7/PQugQG00wUCZERy3IyrPxUXw/kR2LM6Xx+CXSGP1ZaNRdnd2A8
	xA48dA==
X-Received: by 2002:a05:7022:7e0b:b0:143:2982:1043 with SMTP id a92af1059eb24-1993639f0f2mr3810907c88.36.1792866087710;
        Sat, 24 Oct 2026 11:21:27 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm8174893c88.21.2026.10.24.11.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:21:27 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 0/2] net: dsa: mv88e6xxx: 88E6171 stats fixes
Date: Sat, 24 Oct 2026 11:21:22 -0700
Message-ID: <20261024182124.296988-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

These two patches fixes statistics on the 88E6171 present on the Linksys
EA4500 router. These changes were found during testing using a
resurrected version of Andrew's dsa-tests:

https://github.com/lunn/dsa-tests

Florian Fainelli (2):
  net: dsa: mv88e6xxx: fix 88E6171 statistics snapshot
  net: dsa: mv88e6xxx: fix 88E6171 statistics type

 drivers/net/dsa/mv88e6xxx/chip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0

