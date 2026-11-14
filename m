Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660138;
	b=bEilQ3RZw+JTA7Htam6yNjOPqtDKTVnrN9y/FcFEgnkSy+Pkom/+TGyhWbFzY8CnFTh+
	 jF9ty3kFZjU0qNo0jUBBmTl0B1tOqPZje2ia9acYE9rHwxG4Tl2bsQTlILHH1ZxVmHM0s
	 xlhp+DqqpPdzyFrTEsMvB6uMSsxS0GyPkjpYv5T2yUV7DIvT+8vTuvfUdExJvMtj/2Aa2
	 ClIA2BpQSDr1SPor00cE0xjD1ZWYnJFrO2sQoBmydLBeGozvjb+aRmO0B+w/KP15b/OqI
	 /T3YPMQY8QaZX+v83j1/SdqLcp9kHZ5aWGU5gGgk6eEvNCJrjx9WAHmt5iasksBVLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
	b=0tbUDShpB/9QY3lJO/CaWKi4uMA1HprRK/oczqVvwRzCqCRo43OMKvTgQ5aohcbLlzEl
	 L8VqgHu0KInmyG0BSPnxv4tdT8Av5ni1kE+lJ3B00WR30443FyLSIb17rG3l8dN39PRqS
	 7sGbgJDek9gXXaJihpwHtoeoR52njaL77yrGvkHkNpFkv7osS2hGRUAzZ9OYida2yfEC5
	 8UVwBhLfqyZlCdtYP0NiILrbfJxaXesUZvQkrxi/1r0HFlLJZpJjqXztRgyMw8NVLTdKs
	 buPPSQqCSDJrv2tJuOiRVAH8vdx7dWNe7ooMs22/PrWqbkRTh76TMoJQn+R2a2boumg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRgsCuA;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3321A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjRgsCuA
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1408978c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660137; x=1795264937; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
        b=QjRgsCuANNFrlvin3D92M2sMsLDO28F5Rz/dFNYzpImcK+hth7ZUAFAfqgm2cDEOTA
         rHSWlbG9Pmgd4pwMUOfqFwGECGjIHM26mF+laqI4pBszc9MjquWfPH7/7540zzFa7cTD
         amzn5sF3ezrYD/7TYUp8lAoijwqHCjy9OUhzzjHDX7xJ5OlFmMfB7RW+30WDAro/5VN0
         1IWOVigmc/lOGXztMhFSOGsTLUC+UuHNf1RM/7zlUu4wwvrqlQJfW8X01u5EgN6cWvtU
         eaKPdNLR4puGqIWdL5aRH2pAx20BXITPiS+bSQeu57eHzPyOoG4x+9wddO5Qx2PnFLKz
         tcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660137; x=1795264937;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4WPmCztPH+KoFhzb/uCAJwlkmrIRFMhr6hpJOKutGM=;
        b=KU+6TpBld/dXXTEQ0QC5U6n4fTOA5Dm2NZQ0XkBYcDhSn0/BT+fwebZR6scsWxJELb
         2q5NTna2/u8ykSPKDJmGk+1cVW1c5iydR4zCF+8xvRPUWP+Vhd9wQmv2H1iRgg+LnQZF
         8kbGYsN6FFEuFFCFEWvACK/oiAOmBaZDD0GDc1GgXgve1+V9uNDQZ1Nxgfh6lDxqcldU
         0e2EbLDgouV+Ewx88HsSMtBaDpRsA5MxSptK0xLPEbrT+eUXiCqE4GL3DprAVHii91+G
         bx0Fh1bj9x1UcZPM3doN7kD/7lyVl9XGbCWW68u7rArm/4r+nOTyFewl0tjxBb6AGmyr
         swVQ==
X-Forwarded-Encrypted: i=1; AL+hErFhAyfg12v8e0lEQZ4sqJYrnzZqi99ZCufvn5PClEtJSnjKyeVLbHqjZIiYSD1r8mRseEIlnHd2pQ9C1Q0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GQUd5hqGGmjpGkFvuI+orm8t8mTqI3Ay/TTs0O+UGdH9djqy+
	Zb6T7Jc13OgnDUlmmcYsDeFpfZ+UDc1LY8KJxFvUGrgkVJfeqjQtZ6R7
X-Gm-Gg: AYBFou2rbjGEsxtHzq7O4FOJ8AMziHFkDNNv04UlbvmL8CjwlqDwta4XAt8m4qpoYIp
	gIYZCad6+udRM3LK14gHjPPL3Eeb0vUMVgjEy9ZrjNM2X2lOsfLGtqrdBQHUCe97Z+sM9ia31XR
	0vFp9GsW8nlOqSUdxs1p0ZD4SSOvgevNu1jNwDPk+qg6d1V/dxYSPYD1n0TVuFRTMbrhBzV2EOo
	UCWD/Ne/QRK/X0CCI1t0owKnJaoIUuvRN91PyMcN7mmLhIQ06b1dyqx/pHyWPaRgII5vmDWgM2G
	EnFM8l0E1MQXA8Tz86FzFKOAR/Ho2xP+pyjc0sto8yMJHvOFC1GuDazVrvyTVy2afy2VSwO/ewP
	NLJr6iUI2Dhi2D9nntxq861KOZqwufhjACszrKU1WYi0htHKjEapCsTzxkuLXfRw4GBYqtAOVID
	aD/p8nN8TPRn/cT+I/fyuWVbMdVD/CwexI6HZF6SJSCh43DNzh4k/sApJNzos+NPdZs5RUzjBab
	lQXebsjdllXVGCuDhK8+SVgT0NGEEvQhN918jqt7p7MD1zJ8QcH/vA/aCICvhYob+hCKX/FF6nq
	OqeA/4sACB+DwbdKl77WPlAdejifUGo1ZLfK8iAzDD1UrCyDz7uQSsXeQzPtEbo/GiI=
X-Received: by 2002:a05:701b:4294:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5030990dbmr5086025c88.11.1794660137166;
        Sat, 14 Nov 2026 04:42:17 -0800 (PST)
Received: from smtpclient.apple (v133-18-180-162.vir.kagoya.net. [133.18.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm16550060c88.14.2026.11.14.04.42.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2026 04:42:16 -0800 (PST)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH net 1/2] tcp: avoid wrapping Fast Open blackhole timeout
From: Esko Mobius <echoowall@gmail.com>
In-Reply-To: <avVX-3s3AYwtxQe7@google.com>
Date: Sat, 14 Nov 2026 20:41:59 +0800
Cc: Yingjie Wang <x-professor@outlook.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "edumazet@kernel.org" <edumazet@kernel.org>,
 "ncardwell@google.com" <ncardwell@google.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "matttbe@kernel.org" <matttbe@kernel.org>,
 "martineau@kernel.org" <martineau@kernel.org>,
 "geliang@kernel.org" <geliang@kernel.org>,
 "ycheng@google.com" <ycheng@google.com>,
 "weiwan@google.com" <weiwan@google.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <EE7A0514-C23D-43C0-9C38-CF15CFCF8AEF@gmail.com>
References: <cover.1794325665.git.x-professor@outlook.com>
 <340d9f1f96e235642e8b47b5e7c836a18de8dd56.1794325665.git.x-professor@outlook.com>
 <avVX-3s3AYwtxQe7@google.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

On Thu, 12 Nov 2026 06:15:12 +0000, Kuniyuki Iwashima wrote:
> No one wants to configure 80 days blackhole timeout.
>
> Please apply a sane limit in proc_tfo_blackhole_detect_timeout().

When picking the limit, note that the product wraps long before 80 days.
With HZ=1000 and the maximum multiplier of 64, 64 * timeout * HZ exceeds
UINT_MAX once the timeout reaches 67109 seconds, about 18.6 hours. A
limit of one day would still wrap.

On 32-bit, time_before() also needs the interval to stay below 2^31
jiffies, so the current expression is only safe up to INT_MAX / HZ / 64
seconds, which is 33554 seconds (about 9.3 hours) with HZ=1000. So
either the limit is derived from that, or the u64 computation with a
clamp has to stay.

The same applies to net.mptcp.blackhole_timeout in patch 2, which uses
the same expression.

Thanks,
Yongjian
