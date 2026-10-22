Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703474;
	b=uqQIrcEU7ZD3DRbBQ2AgQ+PGoQVV0tK/2ZD1+m7TCnWPqu0l0tDeMXQzr4ROh60cV6zk
	 9XjIW32wjxB5F6kpxl+HvOo2EX3G+FUJxjm0mJrhZPFm0OYfIHO0RdeGBVAvgdDCOcVzC
	 T/TzNKvznaM5ybO4AmFZ/QFgtW7LD0XJTDpsh8ucPkYN38BQxmIOaV4U0seP22DHHxBRx
	 k7IxdIx60OgXSszAMPoxf08GepVeX+L6CHyH2DHNH9JM3K7gc9JH/Qf2iPFgGqYxwhZ+k
	 N4YnMs9rEeUQeaxA7fHbLxmHLRpznT3h0iUZ2AEV0FNRD10B2WhJaPwvObfbHmjYPYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703474;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BvPfE15rcDGb+/5gSevpWOZiRKwhynGG1M3ty0d/vIk=;
	b=Ntdh2kAU1Pzb6kZ+pRkmeIVqOswQFFUb6Ep8eNE9JNlQfsz8g1G3bHvLx8a8L4DK4UUN
	 ilqyMUDgy+L86Ca6TbjHgGvNyKrkrlb1hbP4wVQqYso+l8zCcB6cT8NL67J2E/A0JmGl0
	 LSmI//D5mQ7HqyPM6HKGJNIrjDqZr35fS/8ynBbcuK6VXhek9syfM1vgMLzPuDVNEvjQ1
	 aHPA4lABAisvjQaqz1iqG2RGMQqNaPOwUl2loKfvTtHrZrK1dNZyyIUkpMWCYb5lB+gqe
	 dCTMCCecoPUrtOmaZDE8W71e+Q0BMiBQH3O3xUxUM9oSLJiKN/+bToXwyRXwhQjOM+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E9bFqGc7;
	arc=none smtp.remote-ip=74.125.224.99
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A25C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E9bFqGc7
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-675617e81f9so306765d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703473; x=1793308273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BvPfE15rcDGb+/5gSevpWOZiRKwhynGG1M3ty0d/vIk=;
        b=jZachvzjUEWumAw06jq5ixLHcstqIiql/OBzKPW9lYdYcng8qzJokGFy+8tarLXJHR
         nEIL3Ydvok0f8cR6lFDzux48SxlZ4C3C2YAZ4l+zyFN5cnicRG3vu3YxvEQpsvM7mY6Z
         3xxjYFzXjBD1GY9xX5ErbkIcvTf/88U4Xydw4GtR1mTg80eqnfnZ/oZPLolFhZM2Y9GW
         Og9tHbNoPMD5W8VRNDX67ntfqosY0/aVTC+I/Nm2fj9rzZhdiia0WRQpbLo3ZYmYTZfj
         0NoRRQuNv2V7Wu3AAL3oeLR+BxGikXR/xRNvsbJTBUq8i48Rbn+sgtoBywcJYkovFQqb
         7fCw==
X-Forwarded-Encrypted: i=1; AKwUvBxkqvxtXyIsOtlYI7N8XGW92Cd3JWpbWa7DN3RA7k9AQ1AGsIpAZxPqoCwjPumrwblZuuKlag1go73rxA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLF28uBCIIRsAJxrCWXoZvCa6K1/PSQKTNMhiPDqGqmP+vv58Q
	apz+Wr5soPIpS+KdCoH9Z6QQ5Gsl/g/FxS6VXIi5aypS8mc0YQl0z/V/hMxYiQ2ecWQQr/z0Hkw
	9wBCTf3Bpj6xHlsZHzvxZzUOy+fxXaKGOdmnJqc/FfgWOaJqcK/cgzHhMZOYjN8jiQSDWevu9Sw
	5s7X504MSw9YIpVsO3nTpE6CwyH57EyHXMeotHe2hRZdjQZl3umVqxu8x4KOEkv+bg1nu/Cf4zm
	BZVvZbUF0OhFuvaxD/ldQBP
X-Gm-Gg: AYBFou0J7lUQHdUJm7g6qn0qQg3QoIK0c/wSb9Boy18foUSkpxrOfLNk1hIt7mnZX+Q
	xPgBF4rwLGmNNABPSDnYIC+HrN6e7AsZ53sumz+o66peetWREJt89uWZdofXNnwPBEIwHHKpt86
	ZoTkR1YoxcozlI8U9ZIuyJxtnEzj9MVK6XMMOvS9zGAc9Xm/S7/mAqPBK01HEBfpFiZsGspWO32
	za/ExIsYE+YCKSF0q9Y6+pFL6vqyJoebhzkgzZdegSfh1c73LmVVLCtdJxmc6EsGDlAfFJkbgFB
	KUgiVJmgq6EFlUbfmoYZ4B3rKjhuJXPbY6yoTaDmVLc0hsr5rDfR1xIYJwQOxthJZhHVGNYR0Yn
	uQeK6WoD7o+uE3oUlPV8O0gK5hYQ+As4lAFJQ5DxULGktosPYxlInSzwUGmd8FYbeF3iogHw0zd
	XUBIc8D42gRMJdqNvn3/pWhEC2z1omvHEg/fduJ5Ta
X-Received: by 2002:a05:690e:1508:b0:679:9a1b:1f71 with SMTP id 956f58d0204a3-67a35bfb298mr169398d50.56.1792703473357;
        Thu, 22 Oct 2026 14:11:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67a34070376sm17423d50.33.2026.10.22.14.11.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:11:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5358515b4easo3458471cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792703472; x=1793308272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvPfE15rcDGb+/5gSevpWOZiRKwhynGG1M3ty0d/vIk=;
        b=E9bFqGc7GOl1j3T5ONjEtofVmFuNInJvgIFJWwZtKghnG5Eezh8QTfpGpOOkw6jnVm
         FPbVfhU6tnVoK7Q63vlW/ThRI6nog2OsroirUUXOZhbucROb28tvuOwugbDZdSD0o6XZ
         cY6L+U7fSgNVWge7SZDxh+eiyRRV2BSjIhRKw=
X-Forwarded-Encrypted: i=1; AKwUvBx3/xqWJyMcBDekwTAvyLb0TX2v+TfGuFbR363YtwqFZ6ZNUwKzx1fId6ANuT/s+bZlXgZ4qpw29fDzJf4=@vger.kernel.org
X-Received: by 2002:a05:622a:2307:b0:536:6572:58dc with SMTP id d75a77b69052e-536c284a964mr1645611cf.29.1792703472490;
        Thu, 22 Oct 2026 14:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:536:6572:58dc with SMTP id d75a77b69052e-536c284a964mr1645261cf.29.1792703472053;
        Thu, 22 Oct 2026 14:11:12 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396afa91sm2472036d6.11.2026.10.22.14.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:10 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 0/2] Fix TCP retransmissions on NS/NSP SoCs
Date: Thu, 22 Oct 2026 14:11:02 -0700
Message-Id: <20261022211104.2091128-1-florian.fainelli@broadcom.com>
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

On Northstar and Northstar Plus SoCs we would see about 1000 TCP
retransmissions per second due to a rate mismatch between bgmac and b53,
make sure that we run at the same speed on both side to avoid dropping
packets on the floor.

This issue was found during testing on a Northstar Plus reference board
(BCM958625HR) while running iperf3 to a test machine and noticing
retranmsisions:

# iperf3 -c 192.168.3.1
Connecting to host 192.168.3.1, port 5201
[  4] local 192.168.3.204 port 49856 connected to 192.168.3.1 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  4]   0.00-1.00   sec   111 MBytes   933 Mbits/sec  915   99.0 KBytes
[  4]   1.00-2.00   sec   111 MBytes   928 Mbits/sec  909    109 KBytes
[  4]   2.00-3.00   sec   110 MBytes   925 Mbits/sec  1097   99.0 KBytes
[  4]   3.00-4.00   sec   111 MBytes   928 Mbits/sec  814   58.0 KBytes
[  4]   4.00-5.00   sec   111 MBytes   930 Mbits/sec  1187    109 KBytes
[  4]   5.00-6.00   sec   110 MBytes   923 Mbits/sec  893   72.1 KBytes
[  4]   6.00-7.00   sec   111 MBytes   929 Mbits/sec  843   67.9 KBytes
[  4]   7.00-8.00   sec   111 MBytes   928 Mbits/sec  920   79.2 KBytes
[  4]   8.00-9.00   sec   111 MBytes   929 Mbits/sec  1109   66.5 KBytes
[  4]   9.00-10.00  sec   111 MBytes   930 Mbits/sec  1055   63.6 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  4]   0.00-10.00  sec  1.09 GBytes   933 Mbits/sec  9742
sender
[  4]   0.00-10.01  sec  1.09 GBytes   933 Mbits/sec
receiver

Changes in v2:

- make it apply cleanly to net/main

Florian Fainelli (2):
  net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
  net: dsa: b53: restore the NSP IMP port 2 Gbps mode

 drivers/net/dsa/b53/b53_common.c      | 10 +++++++---
 drivers/net/ethernet/broadcom/bgmac.c |  8 ++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.34.1

