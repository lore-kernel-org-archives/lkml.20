Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675709;
	b=cdswY+ENB2OdDu0t8ERMslBlLmsKJSTiAhthKI2zxt3mFAr7FCbTzPGPhhT5yXNEpY9e
	 b+g+n83RdQuny3yrPg0bpWQKnTNxmfAs/yN/K6B9F8cKUuGFY59lBXrA0RcMV3FUx/b90
	 7+ULAmPI97xx9EvOFx3E5LscWTy0TvilBEC73MM/baVBDJrSiY8POwYz2UfpWjyQ69TYI
	 p8AbtVt2MU58BdoNkyVRi0u2IMCxhSgAQkuaKwwGyULcqR6ETuRcehBemb9OyPP+scVsh
	 TGRnvZfV9WYw3qawMJ8Dqc9ZD8tjEjk+VD0dFM7zc6s1TVhTjMzJqON4UyvnoL6bL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YID1zHCHc/8I8+GdqG48jDJC2CXLkkHNB0CIfz+FMCI=;
	b=cKx+v4/SGzRssAh6isNbwQjWgPRknfSeL37zk8TaZD3+GBsOVn9j7yivFfnrrMNyz7+6
	 hwKa2eoTd+tZBGsY/REsc45nmr30jK3Ri63aMcD9OotlfDxAPMxE7SMD8jNGnYd7eudsq
	 HuTh5tF+ICPEt4jsPK6zUqfnaTOeuM4HntKqpq60WEalYFY1DPl0IsDzpmo0JMM6eRHOp
	 W6e/M9B7c4n1ilKjU6ukA/TY7RsOrsl2g6cIU/5yEKnCwhot4w4b53PxH9hCv8ChAj8cI
	 BYueDTBIsjVQWi+Ivoj5iBBZFHTR+qcH8l6bXmXPrtl6SEZxu7k0l7/7JczI6k2XFQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUsSctaH;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41CC606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41CC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cUsSctaH
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3228617eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675708; x=1794280508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YID1zHCHc/8I8+GdqG48jDJC2CXLkkHNB0CIfz+FMCI=;
        b=cUsSctaHMaPOlmnJzTscQ91XD7BGniQTf5aFSlwUhQY5B2Qf7bod9SniOfcOEKnVD3
         U7S/71NupBtTxfuqk4EASTFL3/2imlWTD58Y2cPp6Bp8INfSEsKaxTmxwSv7ZFUbOnBY
         019svzDWED0N1MmrYzyIErXHCQHKhuCkIEHzRrqwHZsimDiWVQSZOtZuPf36DR3vT9Bb
         d+ii2+6Mf6JRR2+huU55aZ1b2z/u0Hx7BfmF6IBfnJZ875b+dcZKpkOpMtRanP8kHF5n
         GIgmNmtMSFqTH2K+zjqP/P6reRxT1dslO1CL7mmTZganihDEBZfgfls3x4tTqXafze6V
         gz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675708; x=1794280508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YID1zHCHc/8I8+GdqG48jDJC2CXLkkHNB0CIfz+FMCI=;
        b=uUdpon0cODDTGll51AxpNxSbuIxihFVMDNawAGPus0S722m9Sei3JSOjenJMpMuSxz
         PtMTF5Xt+D4bvTTzVAH6E6f7Zhnm1OCeEWZ1jf9pP9DxjFxGB1Vkmw5vY966tWK/svnc
         ZdkoD7PBZn8qBoW/bFNA9A3wnpxAb+Os1RNt3nS/L/PdYNnGAYb+i0HibUKAQteEJGvY
         dX9xSXMCFGZecwEIlh2GdDw9Fxhc3kpzGBluPYGYvE/NPR5qNTXPvlRDJAP6BmTUzV6J
         4BP7jFBbTGdS9wrM7ojGzfGEGEUepnHd01Hpv6zaskUTSe2VWYJx6DkszZbsT5T1Cf/v
         ZO6Q==
X-Forwarded-Encrypted: i=1; AKwUvByo/cv5ptLGqTNMeHDQ7zK3U+mvzi3iQPT+EhQ4ZSGVSupQH2noQwm3sIK3URT7sq1uqMa0Oa/dKZk/rIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z89MhluxWhwctxWV/4JqVctPLwXRZC2BsqM0RxHGsTd9BqC8tWH
	ZPQHqvxf9I7rDM/A6zAUQSDqxD/MlOz0nUswPxS0EqbmT1VFym3A1FEegiRaVfozqOw=
X-Gm-Gg: AYBFou3XJ8l1u0/0A4a5GcwkOG9Pk40eH9/fZS7nb1KtMqe30bN0b1g23CQjtsz3xbB
	niFowRE6yGnL58oWovTfFL5/ZR6M6ljoeC6QGtkmjJP/6rkkO48NSzpD6dF+BzNY6M5/uAU3OQ0
	IKPKLxcm/iPkabxBE06c4vOC/OJYIXKcsjJ9b7qp1qdkk5d1G5JgJz7Raf/ljsrgFyM49Aq32TI
	GpSyLogh/nJhuE9MIKKeJrLB5YsqR7zhfUwkD5isU7eqXrtD5oGUJmNRflpnrDhU22Gm0j10Jcq
	siczTIr3xgFL518xUmuhlQMirpJ3oK407Atyyye8cSh+q2PbZyUaXRk9NMotggaRYe2hZqqTL/k
	LAZ20l6WwFc+tC106VPFJ65ydknamlB2HaGa0Biae2DqF+AzKN8h0TBcKdmL6zq7yXww+ers+3Y
	DySOMRoOwwdmz6ub01/EbMz7nzIFrnyv+FNA/MUl3s4mIcpufzF0uorzOPBcWBvQf2Nk1ZP1/hZ
	LHviIFj4rDtZYCfurlUMWPXXjzC7+uqEzN292bscsqZDh4A9vlrWVx2IxKfdWo2+TppjosUAJKx
	mx6HQEbkbz2K21Xr0a/V27oVXi6Gg1WVAH21
X-Received: by 2002:a05:693c:6092:b0:369:f3b8:2c54 with SMTP id 5a478bee46e88-36a423f0f70mr19413284eec.30.1793675707809;
        Mon, 02 Nov 2026 19:15:07 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm41090051eec.6.2026.11.02.19.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:15:07 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when failing to leave LPS state
Date: Tue,  3 Nov 2026 08:44:34 +0530
Message-ID: <20261103031434.14449-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103031434.14449-1-skalpesh942@gmail.com>
References: <20261103031434.14449-1-skalpesh942@gmail.com>
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

When rtw_fw_leave_lps_check() fails, the firmware has locked up or
failed to exit its low power state. Currently, the driver only logs
'firmware failed to leave lps state' and clears REG_TCR, leaving the
hardware in an unresponsive state where subsequent H2C commands fail
and TX traffic hangs indefinitely.

Call rtw_fw_recovery() when rtw_fw_leave_lps_check() fails so the driver
can automatically reset the hardware and re-sync without requiring manual
user intervention.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v2:
 - Rebase onto rtw-next.

 drivers/net/wireless/realtek/rtw88/ps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20b843..8dba60f3464 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -166,6 +166,7 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
 		rtw_fw_dump_dbg_info(rtwdev);
+		rtw_fw_recovery(rtwdev);
 	}
 }
 
-- 
2.53.0

