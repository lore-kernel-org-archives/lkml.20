Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247782;
	b=XxPivuwePgmfNj8CHeztZo8TAKvadNisFBtOhVBikRDZ/ESJouI8+6AMfr+6f8b3Xoob
	 hzcntOd/do+71H/Gnbi7KkGRQ+lVR7/7Fvgios3WLkPhB3LqbyM3KbZHafjcmE2WfBcvi
	 skHn70ti22DXL3LVIx/GepMqpAffH/q+OyR20t4lY7qpcW/HDLuUVI1yYffwh6E/jAm3i
	 OKv8jK29BoPBnsCGKtlbApJ6bxPm9E6ItSWhnvnKnAkXDIPEHKNsjjrvIm3B4HeTqSomX
	 ZTqNXzEraTBJ7HXuU29tmtudNUh6Urd1yHSZNi/NSZecaBxi0EutksJxmNPp4BYt2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eSVM4UdbxQEAgAAhFhVlTTn7tui5ZWBcWAnIAXfSeOU=;
	b=3ICPbQez0BoOpwyt9+66YL0mU5RZxJpTGCmFKyh7sgrY0fGpiqodVbj7fNfdde/GVxGw
	 Idmyt7EgdhYSuBlysFXvsfg8RiFgqG73SM+9heCuSwL4lfzSkd4mK1ppUoswfjSgAdWPw
	 0x7YeY9QitastD4J7BWCCeMGCMv+moaZonsHNa6qlu/BJE+3zGvQZIe2f4rzkW/EVKuf3
	 +UT8YQhpPuMVh4wHP1bVxG6ADmXE6pY+tIETkSPSoadT0YaH4j2Xj3lhZNl52BOhB+YUX
	 Hzz8jA9hAnUUNPIFpvvKXhO38wy9ol+1IJISvnDBJuEpQ9qpRSeV6EaWfpiGQRMPV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgJUx9vJ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgJUx9vJ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so817001c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793247781; x=1793852581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSVM4UdbxQEAgAAhFhVlTTn7tui5ZWBcWAnIAXfSeOU=;
        b=YgJUx9vJ06xniI+mXR+7ovjTmGyo+6gBZdNaixZ6LAwOW1u+lGyrjV9ABqnq5WE+yK
         M9UTRirA4Qlm23cfuD9r7dv8GcQRhQl93IjZnh3YZ/Xk0ReSBzppIBVsLFlveCD6R01a
         VxPKPgoTWt5riVBO9rcnfO8bIojuiv0y4BXKEX/i1QRSJrvOQoCAX2bqurRZGJJxY4q1
         UNi3Y7tEbInVyCtokH9MBC3AngET2whxQy3D+Y38xu6MO9cM1JfK89whwbhfnLMn8S7i
         lwUmvw2tucMXhoEiDizcXYyZzZPZGo/ZgIDykYy+cTpwrkhu/bQ+Xv7h4vZUlNGBSK8m
         D8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247781; x=1793852581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSVM4UdbxQEAgAAhFhVlTTn7tui5ZWBcWAnIAXfSeOU=;
        b=Rz2QCf/kBDDAUYQPmqIdkGXtACtN7OGL1EiK7rqHEJzJqnuTefwZ6DXfUeLERZQf7k
         q1bwN9BZvVixcYQHNTM5nwJUEPsZEBsNUT0VQ1GhJIGc2iKhEshCu1mUQIZlGltJ+hFG
         zLzDyiEVOrwY/AUkiokG1jaPBZuBoqZlQ1CpSRbrFxd2WuTBt26tDoV6lQU8pWMOR7gv
         2Ceu/uMholDJvsC3rDRBlAtzOffwYKtrCkdmGia2jKndHzPjS0iSrro34B5CByKk3iK+
         OUYE40vcCheLfs6dUCGErGyAai4v5KKdSthI7i4IcrYEAxQlfKkuicZevIxdwOEGQkCp
         YSPA==
X-Forwarded-Encrypted: i=1; AKwUvBxn5XkMyKayX+f/n1USSdxvBrWtjYOVcqSXpIh2lfETtlcAOsAt33NaXZHUlxjP/13QhB6hDdd+ZR5aQOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiX6PA+/dRefvnRbpMcBfTp8Vr/Uv6ClDfvJr+S9gqjBCHzAX5
	VwM3fdvaurxHJO3mlejWxGwyGNTV3x4BcriYeY5u8nB1BBlvAOpe1aIN
X-Gm-Gg: AYBFou3FRKDfUeEAtto1/9Z63Zib9dfrqp57tv1GMdZhH59s/UqhT4QqejzJxr5p0m5
	kLcmk+h08YE398XasWgZNaksZxrdzFsH6hHaxix2Aiiu2mXyH1P1xzFez3kVGoCthV9+s/xfrqU
	qt3upN0GBu3II7cwPDUXYr3TrAvFDsVdSOPJBIMPg5lCVoibWoOLkFluf+J15wAPsmUlf/PjUyY
	qfsE4VnUaEIHJNu3lltTFDgMdqiuIBBYbDJ3DRO4EUJZal3+Od7lG7jFS473MfbQOy2GATrO+pu
	b5tBUNdX78Ggmwxsa8Fhukpet4KizRrTEQw7dgkE3wwesU6Wl8OY9eBDoQlno8+RXOi87Xx6BQd
	kY0UZsyYVDlspzSSjkQl8peJqyrAr8jfhNOIAhLdejh4L+z+9zzpDb3Pe8IJRPhR+et/00bDqnh
	qa4k5F5xQ2ZKfs6C+muLcNs36Zu8Yy/Xc4zCwZjoLd/tojLf0qveeQKdM41m04Do0neX0jkgb9U
	T9/PbVICt+njzpOUt2+y8DTBeuVfPusX6FqZyE2mwK/u6vx0dn/jBxhhXT5ks/LdLvIiwXD4fia
	kui2fcLB67TYUsMGK/Z61At3blgEkufK5xatZIhZNyqtw9TJtLMngDuCqPrhaJ9/z9fuY+jSouC
	x2WxLqphyKj6t6z0YlIPaFfYF1K9w+s/gg21fNRGS4gcHPseaB+dSdTXmV1617ngkMhd4+mazTq
	lhplU05JufE36+Ckpio+c=
X-Received: by 2002:a05:701b:4549:20b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1a6c800e40cmr6244006c88.3.1793247780458;
        Wed, 28 Oct 2026 21:23:00 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d85f23dsm9418601c88.11.2026.10.28.21.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:22:58 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] gtp: Require 'CAP_NET_ADMIN' when joining the gtp multicast group
Date: Thu, 29 Oct 2026 04:22:50 +0000
Message-Id: <20261029042250.3341738-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261027130623.3136658-1-anilkaushikwireless@gmail.com>
References: <20261027130623.3136658-1-anilkaushikwireless@gmail.com>
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

Adding Donald, I missed him on Cc. The patch also changes
Documentation/netlink/specs/gtp.yaml.

On Tue, Oct 27, 2026, Anil Kaushik wrote:
> ---
>  Documentation/netlink/specs/gtp.yaml | 1 +
>  drivers/net/gtp.c                    | 3 ++-
