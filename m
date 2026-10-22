Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660053;
	b=ubCsXWz9+PWORMnAoGUsPHbSQaRuZxhVMzpD229xq8NWWUjzrIugYoKnIJYQ+XO2/ljB
	 2Zlxafsch3L6AFLjwaC83LCxC8S32wY8qcRoyNVsMwOFCgd8icB5tDNlXPpJE1ICUG7VE
	 zciJxQU2cZACRRX6JdrgObMYPkkCl4JhC9EtDUj17t3ZTUrGqpoA5CS1WomdjHZCLsdu7
	 N8HG+zt9371NV0EogVtIaS3BymuQdGmcD22TRY8jIw8avzwmybSTzH/J6kxZM6SRE/Kad
	 1XADEewMuatz1K063azQKmFqLX1Epv3Wxj8Kt1PZnMgkLA21GE6X0mRGNW5+B741lYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9URtOwr/J7TkzlGgRbYmOknzNQNn+Yi2oYcy4B3bLaI=;
	b=IURsm6Ih/WTRtqQ1zbPM4xu3SfdE88tXI+rpibXvJxUjO29WrmzzFq3L6MF1h2x2rOdr
	 4X/mM/bUais6pLW1PFkomK38o53AXi2gSlKplzq2eVVAWnUxquRgc0P0GIcrj22U/aMyf
	 eU8BlwKhH5UWkGgTS+AmhRC6EvvZDusPOhlM8ND0umC6rEnUrh64R+pRzOEpH2sxt/TtI
	 zQfr7WdITIw7dtSstZc+gPS1/Y8dXjwlfApktpZxwaFxfhUSNOQFvCVkCBRHgZCgy+oj3
	 ko6EnLuiUEOLrhxJj5dgLEbKGKud1V9HFXoFuxuzl3B3BLbYljrITYGKKxMzpKPdQmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVZKXgHD;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13065606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13065606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVZKXgHD
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so815079eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660052; x=1793264852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9URtOwr/J7TkzlGgRbYmOknzNQNn+Yi2oYcy4B3bLaI=;
        b=HVZKXgHDanhShJw8E0d4K0w2QBiQl9RZpmkaE7rsFczVEtf9PEZWSAU8H7xlKk/bCI
         Y/H3DcMjWnGeNo9exCA77hEiGIqgV1+Tv7vS09h9WlWiSXoq4Id4z8VIUn/IttRTk+5W
         ZjKKyzsFnrFK0TVXtXlpuwr7QHLkMrbDfTo1fcFvApSf+xqBkOD9IbTNgF0ifBFq64YZ
         fVmFJ/Lfe4Fh7HL9tcPQ3bwmdyaEooLhB8O3d3otW64v4Wzj93AJ9OE6Z5F+v7jscfAY
         pXRGWjOB9VbCdSvhkekbX85xNroMDOjw+Tefs5SrqMhGSekFBqLslmeWArJKKFchRT3h
         efZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660052; x=1793264852;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9URtOwr/J7TkzlGgRbYmOknzNQNn+Yi2oYcy4B3bLaI=;
        b=JDsgMDte4qgS3YEG30xCLDm59Kw1a5lUUH/uvNU79wqLYBt0MH7qK9uEkNSUno/7s+
         4aQRiRVqIc+HFpedKjiY6ZIGtb7PL7jrNZK4waI4l6R3Bs3295LazlemI766WHmRUpxT
         4G3wkcgZsIuyvdaK012DuCib3e0Qg2no7OFrIJDWz/7R1rV9XvVXdkJI5CRwtK/KEOf9
         zN4Nx82j2tfSqX311fJXtBV+FEpGaSpmIFbnyJmPKiKuXd5qMU9Yl+Nz6Q+n/HRSeYMs
         bYoRrwq48vjCSan7YCzASaTrCXa9h3XZ6gYJJRlcYEWF9YAr7/gqEj2JPMWEce9b7z8q
         v5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwuCKS00wJlw+JN7BYtqGHvi/xZqfjGaJ+PDbI7HI+4N+cNDjgyw6vnStWVAR2IqEd6IdxPjx4zXdYnNYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIrKW82c7NjCKUnfrrO9n/d0BWdp3kN/33QUGZV76i4XAHZV6v
	8nNHjQEkrXuEwWRUA+PyMgW3a5VyyfLH7elcmv107f0xzCx15IKQfkMn
X-Gm-Gg: AYBFou2LgbJahaL2ejXpMZbfoi2QponPMSQqbgTbLWiWRFoluwE0eo61r7i2/4s/l0F
	DyP6v7qom14B0seUJ/kX92tBLOVNZ9eG/46mwE1P454hHpsc5YhnOHjLhKfu/d4ZaUBeYO0egrs
	b6UbzUUnblJnvH5Dpq0KyThgKdFZLgPhi9uBpyk2D7Hv4iC5cEL/WbDmNPwPkVPJV9NeRDuRPk4
	EV7b2HNJ/PKILKqFAlygN6E8q3e5BOYtCX/ITzOCGgRUxw5icjufNc8ibccKVgKSlY2PzVGySRF
	LckuMXaN2IqPXwb0VO2gkYRus4z2QFQZxtjbqmd4LEXX/vvLjYdz24zQcLGruInk99diUR9be6/
	Llk6W0STO67ySeJDzoRMQ82iUbay/GgXJfOr726QImWGgxfoRqdMBE/mJGT/o2yxDaSkg0T5lFf
	8c3oymI1PDNjmg5ixaYm633kfU2ezh2JCzWNJ1pPR56ByeGIcrbFA8BQL912ShvK6+wONqiftOT
	is/2WXrbIn3AzRmiGyPywpMFKApT0VKBf8+KZc32LPC/OrxgJ7AuU3uBBAeamMW6X6/VBgHvX4W
	JbeDh3oykJSUPX6kKZI=
X-Received: by 2002:a05:701b:280a:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-192f03cb940mr2225519c88.16.1792660052045;
        Thu, 22 Oct 2026 02:07:32 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-190e29381d9sm11175412c88.18.2026.10.22.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:07:31 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: failed offload leaks busy hwdoms and TX refs
Date: Thu, 22 Oct 2026 02:07:23 -0700
Message-Id: <20261022090723.3644079-1-teel4res@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

br_add_if() can fail after a switchdev bridge port has partially
offloaded.  For a bond over DSA user ports whose LAG members report
different switch IDs, the first member successfully reserves a
busy_hwdoms bit and increments the tx-forward-offload static key.  The
second member returns -EBUSY, which aborts the upper-device link and
eventually frees the new net_bridge_port.

The br_add_if() error unwind does not call nbp_switchdev_del() for this
partially offloaded port.  The reserved domain and TX static-key
reference remain with no bridge port owner.  Repeated failures consume
BR_HWDOM_MAX domains globally for that bridge.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1:

  before attach:        busy_hwdoms=0x0, key count=0
  after one failure:    busy_hwdoms=0x2, key count=1
  after three failures: busy_hwdoms=0xe, key count=3

After every failed RTM_SETLINK, bond0 had no bridge port and
/sys/class/net/bond0/brport did not exist.  The bridge port list had no
owner for the reserved bits.

The target bridge and DSA code were unchanged.  Because the VM has no
physical DSA driver, an in-tree dsa_loop build was exposed as an
external test module and a second switch ID was supplied through the
normal DSA identity objects.  The reproduced path was:

  br_add_if -> NETDEV_CHANGEUPPER
    -> dsa_user_lag_changeupper
    -> dsa_port_lag_join
    -> dsa_port_bridge_join
    -> switchdev_bridge_port_offload

The failed br_add_if() unwind must fully undo partial bridge switchdev
offload before the port is destroyed.

Candidate BR-030 is a distinct packet-suppression bug caused by a
self-match and hwdom 0; it is not this resource leak.

The module sources, harness, and full logs are available on request.

This was found with AI-assisted source analysis and fuzzing; the exact
resource progression was reproduced in QEMU.

Thanks,
Cheng Yongkang
