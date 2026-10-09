Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5E3D0BE4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568795; cv=none; b=IAoQW6h4ZxYnXAhBX85s/fBLpVsn6XuK3kZXCaI7dCbg7OmHDU62sirIgpiJL59nlQsR6fTvR6oBsR/EEEFhzHQxzQGWd2veTsPLdOkMMfocWGDAGMc2GCKbCABNboRQ6hEE61tgUtM1yZ5BjY8FhLIoQSF991+nX3wfCVXa04w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568795; c=relaxed/simple;
	bh=rzbk2MxA3bmBuvl4Feh4G/Vzg97qanUbygWm4jUMOcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fD2d4veWI45kW5BMNpnLxMilI612fugRjyAKIapbpymL5MDboB3ps1JYzHV0Kp7hyVBJX5v7/RP5fsX2vUHTqFK++4FcGca1AfEFT943pTGI/saLihjcEykHVCdE1s795JXl/PAQqc6VfHyBA7M4ySzmXDbTIRh1mcfAfKK/dhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/lKRNP2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/lKRNP2"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd9cbb661bso36204815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568793; x=1792173593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VT+ejyWafsXKR5vefLCF5m4HpAS0Vj6O8SOoRARlLI=;
        b=T/lKRNP2zB5JLneN6JCpCLQ+FzrJhKB4jErDB61N3v23EeuLWnox+jZZshBs7cyuxU
         XvZxk6bubtQiBV+qOCAWRe5b9OQsL4OMcqzCb9sANCcfPiJ5J31Td4SHhaFUNSwSO2PT
         zWOjaO2VGCWgKIvAgwE6iZqx5J3bW5vFBES1ekCxO/3MBYn8PR12MquFGpoyvwKHAzFq
         rftgEmQJu7haP5EDtGvonNGOaRjSvDNTiEE3Wfl0pwKBb7J4DsszeGoeMrPhEgo9SnTk
         9cR6fRxIThvkAbDzwg+JdN4m97LcGandDGbAGZn0i0DCPy0bMGOTnJxegF0f7gCS+A/K
         rAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568793; x=1792173593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VT+ejyWafsXKR5vefLCF5m4HpAS0Vj6O8SOoRARlLI=;
        b=AhSPh3qAFIZdbTCaowGZ01soNoJoi6upaR8yz+mf88Q9NMoKzsYfX5DqgEZQtyxTEK
         JuQx/i/zhGVmbrzIeBnbjC+VkxZOf5JpQ/h0P1E5C9iNXyABmXDyD1mBM1NqbBkJehrJ
         V0IXqz+/pgcwNaP2TOGoxW8BMMuGJkSsKuuk667rNvMXsuEyGEK8InV5SKz5Bwl4eS5x
         ZI/CEAwhNlU3oUORGio0/cFmNcWpLaWtMBwG7Qz5W+2rQb6i2I9E4X7xRuQBEHauuRiD
         WVECJD//8YCY2mF092Q3JDIjokm+I1mHdzBH5X7vFM8HyojPcEy1g1J80ciDXi0EOGIO
         pP6g==
X-Forwarded-Encrypted: i=1; AKwUvBxnmaWmysxbsRw1CECWb33IP6zyhN95S1wVYIiH9o0u80jDRp4F7pcHQ7uflOaIasiQMwdgeXP/LBN+qQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn6YpcH2LbiN1uUMQhBI8OJ7Av7TckzygsAMUPcJzP6a0TOvbW
	HcNCx43nk25/O4if3QKelZfR9ifdHyJuTBRfYHO1/FP56UFSRPwpLaaz
X-Gm-Gg: AYBFou0AM0UsT5ddTkrAoNMZ6wtHIg/WvxSQgEYsHN4LxdnR6/moi/mkgzugxDes9h9
	ut1eyDgIKbnvbB+L+WkQivua3vtVQIDUW87cQ7+TJYMnJQLRT7McN6uBCNqqClaBj/9vnZOtSux
	FxrptQADd20jZyveUEvvVSunXPFfvrOW/V9k4tR3TPWsbkZ1N1FQ5lDK3lMJ6obu/hpe3PDl53s
	nOhFmlJqZ5+n09XKMCI+rJGUSEDdOkSrL+D6nyn+2VqHUUJZFTQhjTTyZ01j8UikrID7tMUC0RE
	nS2fUP3kuiSb33ljuZ2hzSVwKHzPg3EDLYZsulgnMXWEnUUDYf7BIj9JnRjoqgPniww0kdUzQot
	J6v8A3htbwdFdycXNveJVl9ObzbyUnrGexKmGZHpTxVtzhkffbI8YB+VfqpJmUiK46R6aSjZcjV
	NNZozW1WPyl6MsjGmy1u7HW0gmxe2p9EG5QdWjufxlKPsgQur8+gRPcLDHhpxU3DOdwVdw66+tz
	/6g/lUB6kHyabuUVXFAd7z/CA==
X-Received: by 2002:a17:902:cf08:b0:2e2:c79e:5462 with SMTP id d9443c01a7336-2e8429a5740mr24238575ad.10.1791568792691;
        Fri, 09 Oct 2026 10:59:52 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e74asm14167105ad.29.2026.10.09.10.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:59:51 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] dt-bindings: net: motorcomm: Add YT861x PHY compatible
Date: Sat, 10 Oct 2026 01:59:30 +0800
Message-ID: <20261009175936.428256-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009175936.428256-1-mmyangfl@gmail.com>
References: <20261009175936.428256-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The YT861x GbE PHYs integrated in YT921x switches honour the
"motorcomm,auto-sleep-disabled" device property like the other
Motorcomm PHYs. Add ethernet-phy-id01e0.4281.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..85d01690c856 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ethernet-phy-id01e0.4281
       - ethernet-phy-id4f51.e91a
       - ethernet-phy-id4f51.e91b
 
-- 
2.53.0

