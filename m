Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394987;
	b=K0O7H6OFmQXaSk0hzZEWD4kFxIjRfjLfXfZ0FpuejWvwHmQ9oXRPP+XHifZC0+FgDYxc
	 ymvw6zgIt2rqgTf1p6iDe6D+i18hspUTz/cW6rtSVQIulYgFdrroz73xLxbD9rAcbGGjt
	 WaQ962otPiz0/hx/TW7TdQ+MvyVTm7cHDJD6+2MOw0mHC0nFQ/bWxdJFsQYIRwp6xg8YL
	 775jolmD5bKr3U9nyJqbNV/go0nKpBnuyUG1tJBz5/cDqqL7+V3VFXDTBh6qHdzM+bJlN
	 bJSvF/EpQgqqzCktMcaldABsKBYnDy/aMQx2ISClbrVdSafjCUZd+t4TeefOUT0q/5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394987;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
	b=DTyYQVvqLE0mZU7JHkNsLczxdjlKk+vozG7or2+96vajKELiGofiWzD38LG895zIsSQm
	 wTpRPgLWxSmGBeYiEe2aU/VStXYHpFMSyl1/Y/PZkx7qXhEAudHGHl7bh3KHvgm67TQzv
	 zPMe5+yQWZ5rUNxiPKAu6K4Pq3N5xQy5N3K1aKwmqNjvqq3qAStTf9lkt5sw0+yZrweo9
	 YXjZY4QljYvdXPyzqawguL17tVe1y7IkP8OtfKVgz6nasS18DJwxHFmfc7W37sga0MqCr
	 LkFHU8WTnakL41ec0Tw6bUcAv1UXz5JkZd3+INA2syRj0dFqpbt2s8d//LueXoyt7LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ADKylezU;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE6F606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE6F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ADKylezU
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f3c8958d5so132036585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394985; x=1793999785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=Ofl//IfZnmeqcSmq3yav1MQtjQfXOSWq7oRSaFHJah05Ymzm6dKcYj1RaPcTeQZmxA
         2F7QkG5E2ywYAJE+5gglAM/G74nbux5PKrbw/3izZp9/qTCvqz6xCsk7nWLwAC3DWUxI
         s14F7PJ6gyXya06rlpMxjE37lXmDBeuCiMyoXMhCmfDmJgX+TbX+YxbpM2U8HHmAyvfo
         qS0xjBYxRVCoDmlwPWIC+pLk0suHR39NYt4/Yssn1GF/Ckal6OOvvVWU8BbfvjU63XoF
         3FkU+Rs8d83JRPju5lJN2oBnuNzJVsLrGF3SqAOhGoS8dUMtlnc3MwXomQqO+GoyHsiF
         oeSw==
X-Forwarded-Encrypted: i=1; AKwUvBw64e9oe5OXKSK3SkzGdkyg2NE926PT4UoTX3S6cwsk3tj4AhKfl4Po8PsqKAUEVAN0zxLHYgfPfSi1bpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXVWED9TxOum7DkvemHifptCuThEEhDPPooW7GB7w+0tdEmwaS
	CNg6r0QTyTZlI7x/wcIn1f6wBYFBzy+ptY7ZAfL3VIfOYnIk3wzkeZTZJtv4gHOwQHc9EHYStCb
	E20pml+6UWZzWp3ARlEz3+kj/5Gzoxuqc+h5/zN9wREOi85h4DeVvnVMSD8jR4lug7mGi0hZxRS
	tNkdVBLB2ltD6YQM/j5qFuKJRa0DYoDQvBa65iNIwzThnQNwLOjYBYRHOaFo1QM4ldRaJC7H4Fe
	G4ArJWp8z27jZObF5SlF7pAzRs=
X-Gm-Gg: AYBFou3rLgpWQLu/9V/UfsZ2cNECnW7aaQjofK3M8gvox1Im7poscYHVY44iMzcdnd4
	YojWCRObglSb7k2NPf8DXpAYZwEsPl4mdrgDmGMZ2TKUzy9lGrtW6wRN3glJB1cbGZ3TekeeQE5
	YedWd5JhEMwsMgFi45McWJONcA38kf6yhZ2BG7NdC1ZpERRJaB9+uqSaZ+WGCClBCnjGX76Jx+C
	v/VeiA9urX+ijzIdT9nvqXsd59OU/9Fuusiil/6uQcZZPfUAF8MbSidIPz5cjmxbQxloB+vVcAK
	a3ql4GtEJvgd4C3c9HuAOovRgx0NjpFdYLCnbJ873FK8KksJTqZL4U/tROGDt665CmTKE+Hcaa1
	woGs5Pm79O0AjP6XelHjked3jrmu8q+kKq/aS/41T9BchxnwLlXxqybTcVWdqXAujmJK6Vpzoqp
	Nhv8du7vv8McZlSCMM7m3ridU3nlkavvld5SeqSmQF
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr591808885a.40.1793394985376;
        Fri, 30 Oct 2026 14:16:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944255e44edsm28053785a.7.2026.10.30.14.16.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2637323eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394983; x=1793999783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7/S1yrh0Xh4BzOz3EN4N+JMRy3rpsmCaRVhbCsIs9Y=;
        b=ADKylezUDFkCq32MDfzjf6B2x24ZDyzS0nn4boxR0RmhV02ebLv9mF3LIWoQjvYTL2
         y43VQLcMmQk2pO7PS2kcCo3M6yWEQH+P6gEL/sOvfnOothoJGlxVjZ1cDkyqckXfvmOi
         SYgGcTduZhDmSbeOeeb9k9RvJM4NJHc19Vkxw=
X-Forwarded-Encrypted: i=1; AKwUvBzf0e/7XraKDrm2anKP7Wvur/9NPJlilC/iYJhdBpXnp9jFRwS7W4WL7C/0mGsYzRu6Ndk5Pn2lHRic6WQ=@vger.kernel.org
X-Received: by 2002:a05:693c:8811:10b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-36a423be72amr4997309eec.25.1793394983112;
        Fri, 30 Oct 2026 14:16:23 -0700 (PDT)
X-Received: by 2002:a05:693c:8811:10b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-36a423be72amr4997261eec.25.1793394982323;
        Fri, 30 Oct 2026 14:16:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:21 -0700 (PDT)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 1/8] net: dsa: b53: initialize the jumbo frame size register offset
Date: Fri, 30 Oct 2026 14:16:10 -0700
Message-ID: <20261030211617.288562-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030211617.288562-1-florian.fainelli@broadcom.com>
References: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

The chip data specifies both the jumbo port mask and frame size register
offsets, but b53_switch_init() only copies the former into the device.
Since the device is zero-initialized, b53_set_jumbo() writes the frame
size to offset zero instead of the chip-specific size register at 0x05
or 0x08.

Copy jumbo_size_reg from the chip data along with jumbo_pm_reg so frame
size updates reach the intended register.

Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 0880310c9ce3..559d4b360c82 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -3109,6 +3109,7 @@ static int b53_switch_init(struct b53_device *dev)
 			dev->vta_regs[1] = chip->vta_regs[1];
 			dev->vta_regs[2] = chip->vta_regs[2];
 			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
+			dev->jumbo_size_reg = chip->jumbo_size_reg;
 			dev->imp_port = chip->imp_port;
 			dev->num_vlans = chip->vlans;
 			dev->num_arl_bins = chip->arl_bins;
-- 
2.53.0

