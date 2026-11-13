Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604577;
	b=Jak6mYQ1rlJN7WdxgxiMd+uIaJdLffQq/1p5YjbXrYjPjFGtBrclVTQU2xSoPEeQTyA0
	 sDHHHtAyp280Q1ADfm1okHVQuLLX+1JCNGOgiFjGCd64YZUgIXR+uG5dm0cdFbbt7R7Tz
	 IBRuQxXcxECoz6TG0koSnfQEKBygywVGpVSTvGYRECUG3HryHfWw+A6vyUC1th6zVX8EJ
	 kxi1cHfgn7TM+Ef7k8mnCdUjWuXWNhgNoICw8Df7gDDE6QVkPLXp78G+xxrQTgS9nDlpE
	 BK0kIzOBZBrpqOlX8YX97e+Z1jyg0Sm48+SQf2wz0Pu8G85KWKzQUcygF2AxXSPlTqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604577;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=C5wMPx9sA5zj9WmQET0KQcjgZNiCIfRUlXOZjuWLo7k=;
	b=SCPClqtCdEIhx8DyckSeCB115nRXxcq/vkYq5LNakh9DvhCdUQiUNBAYvUZeenby+3Zg
	 5/L/5quDGNVBgB/do6bq2efXaVXR9NtKml1Hu5JedKDxXgO6qRjSSPtaqxs6p6wC7CnP+
	 iHN1LOSNp9aT6o8qep2488K6+IOD1ALpm+EfrmWhLxIuLFiiXPiaBtQqUyKpFj7GmDtSO
	 O4rWL5+f+NmO9JHniGQnWFc/X1+lV7KiZrJFJDUaAHZtPv7Q86rVwlgDf2tFAOz8T1iZ9
	 kQ1U2znlNeQIXgWxozt+98BjWr9Z87iVBWR6B3mjE2DTEbWlYjFy5q2kHQXakr1wr0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DJ4iFce3;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C883606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C883606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DJ4iFce3
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cddc597d062so1248011a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604576; x=1795209376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C5wMPx9sA5zj9WmQET0KQcjgZNiCIfRUlXOZjuWLo7k=;
        b=U6PJ953TzFQsiNF36+lho7WlS7AD3aMrLQGv1VbV8zmlX9Sm0H99XkF6QGBIquHliz
         mJokwwy7Op0yceyWJQBKX/o5KLq6UvL/k4Rbc43RkTybb0tytEM9y4v7B93Pr+eUteQv
         vmzrcAjgvqhDEJ3gnkFiBslBJ3sZbpGfdO2DffmVb8i6aqqxQPBkqQX4shKxJPZuy0xZ
         1CNWOH4zMsg+pHE7qyd4J/CjYJC4+8S4eQYSk9hESOy1wXLiu/2GTFGWNRqxAbOZFqu8
         oWFTNt7USReKrTb9YoEKE0FNxXesHVRS0lV7juodUhDAkcL3giN6BvUB77UPuAFV1Asl
         YdXQ==
X-Forwarded-Encrypted: i=1; AL+hErH0QWRM6bRcXUdB02cqa2Z3IoxZd1StJ3SwXv0Pbj2TZN/aFKkLD+wix3W/YZV4hGH1y+Hc+j03C6vUHLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qLap1EJeGDSHxUH+P9GIafoNdhEIN6LwKTvmFcw5kBVxrL5PR
	17cCoTaSRdFq/tMD2ajkQnG6EZgJCXPPduNxwU4Mjt0iSMt94qAyxNgxmni9VdBJ+55xSZmQtYo
	X0wKy9CIHv0MuUGX/PucareeLJL66tDVb6GCFCcovcZK/WPd4gJa8HiPt0Qm62WzoCrVGKHhHqx
	Eu66JS5hSOiOUgYtBVZ/4mdCGwA4yhiOj7tXY6AwkaDiOtx3d6MxHXDtBl7nVBbfphmOqI600Ph
	HnbJ8IsGmQVney5UHFSJ//D
X-Gm-Gg: AYBFou3kuF4bxahGYwy/akWUaAaFfBCsHxnOt0jWfMt5/EtnZHqo6jZXxtB0tOZETuH
	2o2Z44c/+5ERLS0iODX3Mrr1isDUYc3reJtI9n0R1jn9zPmP6XAm8FxgU2q8KDqg9YPbGQsWBVl
	xz67804yd4dGDUIdxEZvgd/397BJbrl4d1uaIYgZDcJq/aPqY56AeS1E3hRSymdHOMmMGCfulHO
	MA5pCM5yjLbsNWi4ZSvgTuxNvAzFj4SveJA/ai4tgDz3GWYtWX4rYNE1vEYgsaMyCIT7Xs975Ey
	LWaGR4Mp8mZX+4DrJHzpiKCt6kNrqOmtva6V0KoSkF0dG37fSw1Vbex6M5PA7ViNEtPkMqwFoBM
	HATVxnJVqVCNZGWnTkg/wPT9zuCPB3MVvNAh8rroD8MaEF/eRJFreSOwASvYvf6gs5mVbEslGfu
	hWPZGHDs7qHxSJdY0zJDcFNysrzFOCbPm6iaVRvxwE
X-Received: by 2002:a17:90b:5107:b0:3ac:9d83:885e with SMTP id 98e67ed59e1d1-3b1b0d06feamr3486342a91.52.1794604576406;
        Fri, 13 Nov 2026 13:16:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cddc160b0f1sm126634a12.3.2026.11.13.13.16.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:16:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eee6fa56bso15840566d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794604575; x=1795209375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5wMPx9sA5zj9WmQET0KQcjgZNiCIfRUlXOZjuWLo7k=;
        b=DJ4iFce3NEZZhAkSvtxAjtBGRbTgVsfwOUUNc6dkjFqtx6w+adxRsGr0iuMI4dIaDQ
         txeMO2pq6rdSDI/c7CbFw8DPJNZuRO0N3HflY2/tnBtTpVuZ93z5X7Di1KG9h6FwOvNq
         cBgcsuPSDziQiPKESTVU1nmgVrPsbWIshRJGw=
X-Forwarded-Encrypted: i=1; AL+hErEgPgcN2CsExQVsvz2CbbHqKzfDbvjJU3ep1P1s07yPjaEmyNI0AdULPya4PHQ8ghiYo7io3nFtrGMr+xE=@vger.kernel.org
X-Received: by 2002:a05:620a:8398:b0:93c:ba88:cd65 with SMTP id af79cd13be357-9494b9e13damr645597885a.7.1794604574912;
        Fri, 13 Nov 2026 13:16:14 -0800 (PST)
X-Received: by 2002:a05:620a:8398:b0:93c:ba88:cd65 with SMTP id af79cd13be357-9494b9e13damr645592685a.7.1794604574387;
        Fri, 13 Nov 2026 13:16:14 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm273474385a.40.2026.11.13.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:16:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next 0/3] net: mdio: Clause 45 support for
Date: Fri, 13 Nov 2026 13:15:51 -0800
Message-Id: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for Clause 45 MDIO operations within the
mdio-bcm-unimac driver. The series breaks things up in this way:

- scope the existing defines to make it clear what is C22 vs. C45
  specific
- rework the polling completion loop to be a tigher loop
- add support for clause 45 operations

Florian Fainelli (3):
  net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
  net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
  net: mdio: mdio-bcm-unimac: Add Clause 45 support

 drivers/net/mdio/mdio-bcm-unimac.c | 130 +++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 15 deletions(-)

-- 
2.34.1

