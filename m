Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402309;
	b=znoqug20Lx3vrfXdRUR/jMPufiPLw1CADOIJfV/hRSOfsDDyF3sDnDZR5B8B+ncq/bZs
	 1PQ8mGCF28S9YazByvKN9/m1GsZolySIIZYVNimHLMvvY/Vl8MJsqQAQiwbHCQIcznnDD
	 yI45F/8krAdwbnN9yk/aghHWD3t+JAqoFuYAKVEVltkaHqel/YvJmqNK+dOoz1MuB6zRi
	 Tb0Xc52+wLuIMFwYshi94vkO35kV+fx6Bxc1p0a/VrOdAu8x9VOLqiBOftNFVqDiuQ1UO
	 4ZqiBd8NvL1oS30etHlRcEjTutCi+8d+oaJQcZKSa8YkDl/9sf+Eg9TSjFDNs4anIrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
	b=B96f1Iew5aGI2VQU+dwOYgc7TOTghNsigfP6CDgTfGOsPJAA+fo+EcYHPn5suRVNM3CG
	 kHuyERsPurJCJS7XbXfr/fcsSA7Lb2xQ1bxp3IJzKaq/waC8b0xoHkIU6kgyTSN9z3bIE
	 VCrBN1XAexZdNr/IgZm0UlNGvzC85Yjg2jsMSbutMxu03kWE1yqeg4VVu9nmRO6sCI39b
	 GJno0lIWiUdh7OQ3Zf4Vmj9KDivchhL8waFfjlBHM/L3ZV8K7ozzkUhyEbHHS+nH8E/yz
	 eV1f8XXOAC9r2lDTyB3RisnrccLCghf3+DEKEFPE2inxvRcusKU4Q+vsJS4rK5x2/xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJRvG4u6;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B4606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B3B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GJRvG4u6
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso1536561a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402309; x=1795007109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=GJRvG4u6JmnxyKRunZJMpN5W0/I5srjqR/vnnk+FNmYkMf8T9fU3sM+5nfcCjaaJh9
         APVO577+MOvBRkZfYP35NuRjmVjLZcr3IwUa4CQfzVsXD2+ZxN/COcGckwERwXG5QUS+
         BsQIHbWdILe0Ew7RUOZaCvEPNl630qLxkdeczLRrHwzPAGvrcuSyHddvuNUEo1wLGwMS
         08MdvMAxLF0JXzK34p9PG16iNsIx301LkCJu1xPa3OD3G3FrjWUg00krj22i3ncGa/nX
         gYYgw8IbMyyt4R+S7OU73LTMewRyXAYJa58yKsjWmQ+R3X1pf07FkulvHFurQCo5Vspo
         g/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402309; x=1795007109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bABV6fQnxTbYBuOpfvxRsB4J5GPWk4qJ30CGSqwapjk=;
        b=orATQ0U10vbVHYGXmjVZLH/JYMemukZaRioOgtdPpcsZwGwxFIXuLM3CUM24ie0GI5
         99iFmjDsy2DEOjXoM0hZ2gif4RDvIlc28p0r+CQ0u7Kn45Kl3Xj7oyWQrXGlmnzTIjGW
         R3nYqnq7WXyPmQgsw1hqChWdNBPgx/6gSEMC/6NzaYlp/QA+lv2l9KaX/v6NdnHwG3vK
         c0jkyNbKjhjx7Wr8Yr4bMN5sARGWfLGm2ombW1xLAgySbCGhw5iKEmN/ag8v2zhhYzS/
         aJGaRGKxz2VFAhWj+P1IXGufRKOhdv3Ob2uAxfuJfrf9O/y5Gub60O39CjT0QlJ0QFQJ
         3b+w==
X-Forwarded-Encrypted: i=1; AL+hErEBI3Hfavp9/mc0cqoTmj6x7i/nC6crWGaQ09TBFhMUn6PXcs5qu2wP6P0m6mL/KYcAiDoV9JFX13jRXqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mmyplFEoQMfRNs1U/rRvZesvzvK2KRaM8Lm9bd6dSEr/Qj82L
	TFmrgQ1xVGn024wJvIXzKFzTLr+BmzJlq3BEClD3XGpB/y4/P3gkPtvt
X-Gm-Gg: AYBFou0I+BLOjndi672CFMBviPR7b/MxxVKJO9zwP6U2UGRvmJWgSnXLW0sAOoSr0i3
	4WSzjlNHk1pHuqtM9U+QQJtYWtOOrRSGau8x2sfnLJeH/5Y9Opsjm+HPWJbIkN8CU6ViX0nSUhV
	JphSX4tkbrR3tyP/biBisrhqnYbdK8fkwjg8EGO1ao35gObRNd/QbFhJzVM/nz7XnBpkNgXLATM
	wjEEXXcd7fgudwQn815aMzpbRwWvwgxiYrpitD+04cd+LPekaMWRR293PtNFBbP0sX7tT0wONhq
	Nnvdijnu3em778dz29n1wZdVggjwzoOHwD+H/SiduCa4uDWYJrmTJTx86m5VGP28jYOyBJjZNlv
	zzbXS3F1SF/9v+HOhD074IgdDQ17M5GAr4k/AfpoRpDsLPA0A/x/R07sBnZVYcyCKN3pMIvgP0h
	J+hYxLenbRMiVht1XMX579VqCrXtuoNV/1BuJcVugjijxHSnPThKcnc62hluESgp7XZcaQ3F2kG
	j6R/pOj1FYwktlSmiSvmnjxxB3gxesNdCQ3FzZx8gV86IjrPjcGVYKiocafxfcISoV/3ZS4W5bW
	BX/PhLCIx7uhlZxLSMg+UU5PndW+DUOvhHfbQEhczNf4TN/tawPspwE=
X-Received: by 2002:a17:90b:1c02:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b182eabbd9mr2501115a91.22.1794402308782;
        Wed, 11 Nov 2026 05:05:08 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7fc2dsm4448216a91.13.2026.11.11.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:07 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: sdonthineni@nvidia.com,
	james.morse@arm.com,
	robh@kernel.org,
	ben.horgan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on DT platforms
Date: Wed, 11 Nov 2026 21:04:57 +0800
Message-Id: <20261111130457.4143667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com> <f8911f68-ee78-4eb2-b7e5-1e879224091d@oss.qualcomm.com>
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

Hi Yin,

Happy to share more details.

1. Our SoC is an automotive-grade platform with an MPAM 1.1
compliant MSC on the DDR egress path for system-wide
bandwidth QoS.

2. The typical scenario is preventing memory-bandwidth-sensitive
workloads from saturating DDR: isolating bandwidth between
infotainment and ADAS domains, and preventing background
services from starving latency-critical workloads.

3. We verified on v5 (with the top-level memory controller MSC
node as a direct child of the root):
   - MSC probe from DT (dmesg: MPAM enabled)
   - resctrl mount with L3/MB/L3_MON resources
   - MB allocation through schemata writes
   - Dynamic throttle change while traffic is running
   - MBWU monitoring (mbm_total_bytes)
   - Monitor assignment across multiple groups

Usage log showing the memory controller MSC working through
resctrl on our board:

    root@hobot:~# mkdir /sys/fs/resctrl/group1
    root@hobot:~# echo "MB:0=50" > /sys/fs/resctrl/group1/schemata
    root@hobot:~# cat /sys/fs/resctrl/group1/schemata
        MB:0=50
        L3:0=ff

    root@hobot:~# my_app &
    root@hobot:~# echo $! > /sys/fs/resctrl/group1/tasks
    root@hobot:~# cat /sys/fs/resctrl/group1/mon_data/mon_L3_00/mbm_total_bytes
    1314

    # Dynamic throttle change while workload is running:
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff
    root@hobot:~# echo "MB:0=20" > /sys/fs/resctrl/schemata
    root@hobot:~# echo "MB:0=100" > /sys/fs/resctrl/schemata
    root@hobot:~# cat /sys/fs/resctrl/schemata
        MB:0=100
        L3:0=ff

The bandwidth throttling takes effect immediately on schemata
writes - verified by observing the DDR bandwidth counter drop
and recover in sync with the throttle level changes.

Thanks,
Ping
