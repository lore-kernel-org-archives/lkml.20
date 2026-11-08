Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149948;
	b=E8M0SWJ7HE8hOS5YzDKQVKmzc7KiDPdKPL0DQJUO6165X+AQf4WYkuf7+qwwPKb8DM1a
	 WZMS0dm1rVJ6eECMQhuenihZyD4RRzWJc08xGcKReLiCJWUrUJR3vYWtWJzZUZvtv9EVg
	 cA32CDyoCqCrip5bXFAntDTZiHK0nfQEYyDEq4Uz/czBpuuHWso9rx35wWXdYwOnxmwwe
	 Ms9PriP2tAgdhvFHn20Uk/Q1Lj8k+i62PTYTddOaYce0/iXkWBFWK0mK1VH1AirfS2fbx
	 gDa5HsIkCDX+QSzskz1/FJfFgJPHD2c9XH/BzzgeN114n2r7paHi/kh8KtxffXhFUXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
	b=T+Vb/iVb/gzn5f/JhKQ2VzA7cg0oMWLDR12E9xmeDmi+TaHwRsvvrKFqwtLlhR3bHiMV
	 cgiZm+2XCOsYNw/sU6YusGF2WOMOwQ+ZVVPinPCc0PIEDAn2UmIBmGlQ1WKWLlxo5pTZG
	 8zZIpmtn7vnFc4ZYd/XGRkbi11l0dRI8HzebFBzMdAAltcPS0SuiN1uVwA6ytzF6iybEZ
	 ySwIwkDLZWYOG5pPZjeRxhqH8nbmDAfEWeQNm4BW0MGxEj7LW4VxAyEl93GXeawgGUwPY
	 xAYWFJm6/SjM1aIIBYpiwkgLwtWP1wU9PK3aS0yJeY7WzB6mbjjHwKKd0RkDIwdy+iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+mgnbqn;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47865606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47865606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+mgnbqn
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso247191eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794149947; x=1794754747; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
        b=I+mgnbqnq8NSHuqYlXQCBRsCwEE4OSEQinRr8N0VZR0arR5lJW+qfCv8UvBUUbAt1A
         iuNEdhaiHT5wbCtr0NgDNbh48EXeKcpGcaJZszJnqmKYY6z5U3E7veLLoAjgfQmxcYbI
         JmwYZwMdrk6PAc5Yq2opy2NeE8Ns4p9GNTn5qsxTBDmYfYaVZgbenDQNJpseaGv71hEL
         IzcqwNqVhVdURUQvExrPOvJSU09getdEEbZeaHkZ//MDYaHZJZh758RQ4kLPXtqv0tlB
         c0JPbzbwIdq925YL/RhIsc1eAj6H9AHwfkKLa/2RLe2lI/PDG6FNJGBWO2PgUC01qL0i
         lWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149947; x=1794754747;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46GXHeUALtpO4O3TOALhIC4HG0bGJ4xyjvuRvhuOfq0=;
        b=N93213ZBNtxXBKDqnnWKCxREpqFDOENE0EFH+D2Bj3FKyd0t1w6z5eipy93IEZ3Kr1
         B0w12DlqvliZfnJwaA8LJkwbgceXkYF9Yz8q3M5vH81vPD6CkGnv+MSZfR2RH/MdVSAr
         TZ06TSkSHTLAp/bPJT/iekzQQP7F+YXQ6x8rUTHKJE1BibpUYdM1QsBKxF7w4x9ELYUF
         P5odhqX8qiLj73EdCJl7+k5rMBPopj6PHwWPADerO/wuEXsn7rQxZJ9zq+Uu+mYbJ4hy
         Bu2PC8nvT3cGgzQwvhahNf0FI9SmMoJQsyVNvuhD+B7S1RFVGNikLAzFKOKAULHII438
         I3Ig==
X-Forwarded-Encrypted: i=1; AL+hErEfKFqFIyiUhdN/LhMXZkNOAYG+2CK7e037iV83Qbi3p6pm9ww7EIYmbQH+2YDRf7TqW4kN3yeRsGTVwLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pLDEBxJ23UMpKOedHd7pt6zWeAz63U88qBxDPYc7YzV21z/1Z
	1cOU8lYQPS11RiQvN4OEY6xFa2k3OKgIthV0MQIYNKdh9OQrxHyluevk
X-Gm-Gg: AYBFou1nTwOhm2SjUBqcd5tARE/1VrZZOktgfeDQCTut/jIT6kp5j4yxoLUKTGFg3P9
	eu70+e4NyewVfc2jiZrRhd/EDJfBA6zFZ5w6dIPYyfADbC4ome3Pw1Qw3UUSkGHOPwXml1sag/S
	7F946UiTRtY72bAXvERLAWxKpiDydvW3opnRgR/Chq0NRvPaaU1bf0dKC9DtWmepc96qFiiN2kd
	lDX4/Sb7QzBqqG2+29Tn76u00yEmtELyNtpgg1WfDgn7W3keCRhQOzymEyOLdcNc4EdzSCjTrfp
	J4jpCkFNWr4i2p85FxDoySdc0klR5Wcw8ylWA7TydnN0AieR6PViTpsiTVGYYsM+035VnH8/aoy
	7+7TpG59ZpYgt5PXeJfHmVs2YMFnDWHvMFi3WoeUMKiVbSeTqTrSQF5bX9ejX9/F9G7gZn+FM//
	NZ8Ad/pmfikZM4sMs4bq6WUu4BPodVJ+ilMyPmwJ45/r6AX+VIV/g72s5jDVqv4wVXQuMY7jLKX
	RLwbvLmyjEV50BYbP2kyfekv+iBIkY9MXAS8GixcgvS5l43DAuIHStVS9ccVPOaxacdzU9ZVRkW
	8xF85tgiyDqi+n+FsDp/XbswmYFi3ilWOvS8O5coS+hWJm4q/mI9kJO1rMJzXQtbJw==
X-Received: by 2002:a05:7300:680e:b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-372575c63fcmr3296545eec.36.1794149947219;
        Sun, 08 Nov 2026 06:59:07 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c06c61sm5679879eec.14.2026.11.08.06.59.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 06:59:06 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH net-next v2 0/4] tcp: fix tcp_base_mss on passive
 connections and test MTU probing
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <179414895487.488859.839196891969031483@kernel.org>
Date: Sun, 8 Nov 2026 22:58:50 +0800
Cc: davem@davemloft.net,
 pabeni@redhat.com,
 ncardwell@google.com,
 horms@kernel.org,
 kuba@kernel.org,
 kuniyu@google.com,
 shuah@kernel.org,
 edumazet@kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 panweiping3@gmail.com,
 netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6A5F2D50-D257-4F6B-A1B6-BE08489591F6@gmail.com>
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com>
 <179414895487.488859.839196891969031483@kernel.org>
To: netdev-bot+sinfo@kernel.org
X-Mailer: Apple Mail (2.3901.100.1.1.12)

> How the issue was discovered
Hi,

This came up while adding packetdrill coverage for tcp_mtu_probing=2.
The test work involved comparing the initial send MSS and what happened
after the first probe was acknowledged on active and passive IPv4
connections.

With tcp_base_mss=1024, the active connection started at 1024 as
expected. The passive connection started at 1460, and its send MSS
dropped to 1242 after the first probe was acknowledged. That led to
checking the passive setup path, where tcp_v4_syn_recv_sock() called
tcp_sync_mss() before tcp_init_transfer() enabled MTU probing.

Thanks,
Yongjian
