Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308606;
	b=eFMunFn7elf3fhybyPb3AHswrrQUdZ/ci2F0yKWMmg++63/fu271iOtygaNHtvyn9f1A
	 iyd882Mnk5rA7gXj6CBLWvC8kkw89wYPQW06HumqhLjEZHvuh8xFMrFLE5xkpd/lrM/lw
	 CHTBkX8X5pqEfjyMfZVOZqh09SKPkuffBtI9LmgQpUAbyUAbvccVT5VQEvVm5hjfqP7zk
	 c56/HEXvGS2EL1aNG7m6E5ahK8AKKvl94Wv95/2Vfwj9lBKMigkBS+gvnYP/01MGJ7fuy
	 vbjPHgzUpmY34wlOFpZj/0HSYqcCYUqZvBoVZEOxvPu9FKX3Hs1oXQIRz1pJ8PEH80w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308606;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=XcVbxki1OSdrt6E+6hFIYJvqQHCNUIOiEZn4LQ0BcbM=;
	b=5rduarpJyKy90ZnAGfo9k1S0ka8NF+NLFeViEwWxwiWZYOMKt9Ae6uKo8VOS8Qnp2hEO
	 hJe9zI/nyPBgfb7aOeXwuvC30uWIzQDNHIMVZTN1ADv07dVJ7bte/Np2l+b3x/xMBTwv8
	 n+L36j/S2C9aGJ3IY1P0ZdxJpAsacQtV5aaAse/o9M51coLV68I6d7WRCX7gCRRVzNrnS
	 WC/tSRh9fDssshr0JoKOr2o9cZFLVYkkcu7ICWRij8ZISgtuc00VX+1iQIV+8s71WUVcg
	 2GgXgP0jtsytbaD0kFGnnM1o5G5sr/QJQyyrWiUz8GNFRRfD1XRYaKFm7QGePD4LEWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NPNKWNrG;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26060A262D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B26060A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NPNKWNrG
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f259cdc86so229134485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308605; x=1793913405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XcVbxki1OSdrt6E+6hFIYJvqQHCNUIOiEZn4LQ0BcbM=;
        b=ltXqnI28UpikCRG9Lyhgl4mIp0GGmuK/EPTO+V0E4ZKETVS5zWmI8lwgflfgufZRUa
         mw2Opg8oViY8qV2xqeVAsKMLauPLZkrY6FoRLuVnJ/eVC6SeWOGRFJtLCUyLm26O7Upk
         LogkSBSyB1pzTKBwYfCKX0Bri4z3HrLHrrkCbj3VUIRCXys4cz76cWgamuc7J0zvJkOf
         MTVlvxLUedAG+6KEwaCHCM/KOdBVrYl2BZ0XN3Rxv4zi1u5nknQpam79JtIfdn44MojE
         96hWToxEYFVbiwNCr/Pr6FqV7p3iEvyEFrtv6zWGk0wEBS8AIxkhBjDnsdFYZOIMj/LK
         +q4A==
X-Forwarded-Encrypted: i=1; AKwUvBwcFaHSZxA5nstdtGkGlFN1vPJzSWnU5m/SGQgrn3LfSEMdezGQuuZ3KSWCAQW0rtk3KPqsKrFL7gk/VGI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU/vuQ2rztqYcCL0MYwev4dkxriZTXuRbGlpuAY5zGHJXpltVJ
	wGgzEWngckczdAm7+o599cPcYzGXZPP16q6/+BbaVLJGpP6L726UZS0a4uvjsAEckzL/hPF3Whu
	knKkewMH4T8IBiUB4muZOthD4zVwkO36ROnoM3LKw01PeNcbJhyWmVlKwNDLcZuP1e+3W5Ae12c
	I+mqxtV5VdlErtjsIAXdwBMbaAHx3ZtPREi2aAL0ineIzWCfbA9BM/plWGN1oSrjSp6LBPVdsXZ
	eyczx4lVlUAY3oqUpvgFsDyvdI=
X-Gm-Gg: AYBFou30F1fYRzhNqN5Wh949ANyU2IFKj3hxRqlPJNqeUZotNb9rHkYlDHVoglHE7U/
	HV5zPBDF3qhxTtkibpWUtdHRBOnHwbjrpysGYtSu+DTXb8poipbyRv87eCVz9ePQ4d/tl5dbd+I
	dvC9gWME3EHwuh/MHrLXOW0cJKSPVJD4Nbm1SE8euNOe7Ty0U5hS/Mg8Yzds9bvoDFHVWlGLYQ7
	/NHtTU/tkrx05oH2Syh4+eWgUbV9AQjj5bcc6KXCSAyXZS+01VvFPgi2ys2bEZhmKZ5eFu3z4V6
	AHMoawdet1YAO/12eEpE3e2l6N6gD5qXK7k2t8iYs77pt+TZ63xEWGiG6fyedL+KxH2ylDcoJUI
	XPkiNlO7+8ZaJyN7rYWG4v5I9Vgdfn/mg0KDQFYr6DpX3AeWi3wpKiPx4bFAEv1b1noMvmOrQBu
	y7e5+S1K5GPzEwwgBrNMwQPOVfs6TrC1j2ZYZl8fPt
X-Received: by 2002:a05:620a:438c:b0:93e:c03c:c2ab with SMTP id af79cd13be357-94421744effmr74381085a.20.1793308604879;
        Thu, 29 Oct 2026 14:16:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94420fa6ba6sm6624185a.0.2026.10.29.14.16.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:16:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so1523566d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793308604; x=1793913404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XcVbxki1OSdrt6E+6hFIYJvqQHCNUIOiEZn4LQ0BcbM=;
        b=NPNKWNrGzmTIkJnawvrQmx2RJp4gksjXTq42Es3+RCh8gTsfEHaRtsRsMu1JU8cp+M
         uoyWUoMzpnEVIhIYlFM+/Alfb//NZBRySEBYMUbHKB7sJFOLAHDNpTTHtDZ7BJXEZE5U
         uv7yO1NBBMbPZysKJfH+OhSY5qeBrPZnmX7ZA=
X-Forwarded-Encrypted: i=1; AKwUvBzxWxA2B4HOLA4XaYHj2SUMlIJj4Bvefwam6QW1NogExnI8DzoqRaAQDN+6xRl5VCmDN6P8VtaDPl+7NPU=@vger.kernel.org
X-Received: by 2002:a05:6214:1bcb:b0:91c:7b6e:e3ca with SMTP id 6a1803df08f44-91ca4a14e08mr3938626d6.1.1793308604061;
        Thu, 29 Oct 2026 14:16:44 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcb:b0:91c:7b6e:e3ca with SMTP id 6a1803df08f44-91ca4a14e08mr3938186d6.1.1793308603468;
        Thu, 29 Oct 2026 14:16:43 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314f888sm6326926d6.35.2026.10.29.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:16:42 -0700 (PDT)
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
	Jon Mason <jon.mason@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v4 0/2] Fix TCP retransmissions on NS/NSP SoCs
Date: Thu, 29 Oct 2026 14:15:38 -0700
Message-ID: <20261029211540.4123250-1-florian.fainelli@broadcom.com>
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

Changes in v4:

- make the bgmac change scoped specifically to Northstar Plus,
  Hurricane2 also uses the compatible "brcm,nsp-amac" and so we need to
  determine the machine type instead

Changes in v3:

- correct commend in the second patch about what is being forced
  on the CPU port, it's not just flow control, it's also speed

Changes in v2:

- make it apply cleanly to net/main


Florian Fainelli (2):
  net: ethernet: bgmac: preserve forced 2.5 Gbps link speed
  net: dsa: b53: restore the NSP IMP port 2 Gbps mode

 drivers/net/dsa/b53/b53_common.c               | 12 +++++++++---
 drivers/net/ethernet/broadcom/bgmac-platform.c |  3 ++-
 drivers/net/ethernet/broadcom/bgmac.c          |  8 ++++++--
 3 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.53.0

