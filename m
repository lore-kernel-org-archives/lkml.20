Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDAD365A1D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536765; cv=none; b=oG9WimR2uBtSffjne8fIOnZg/xqIp/S8DeUkiQN485hCivnU6NLpccKndGm68Dah7ATIoA3Czi3P5JBDFHop7MBbRsm4ImgzdmPMYfmtV7xa7/GCNAMNQ6uJazMVqsW9KuC2uBGE0Utp2Tj7k95eE+9M9iOIvsdxm12J9utrJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536765; c=relaxed/simple;
	bh=vzNCOIi1olfgEhvhbO0JDglUaPJVxK27XljNJMqVEao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJOisyHFJ3ThAC3ZOi6wmfB6+/kxcAqTFEH8sDnY0JBjEMd0lOPnMa/H1S5zVzPBlXZQNVaIQ/mUmiRh/vej75DJ0VzoNs498Uqfkpv3/IxELA5Ugcz7TdN87JMhDT8yOZ8t5crYMKZDB/yg/tPEGpW6+tgue36hGFsNNkv2x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnoMBGi1; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnoMBGi1"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso4986601fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789536762; x=1790141562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqwyJ89Cq8s6pk+7RJQaTBkRy+ztlndvtZnDXNBJ3Qk=;
        b=cnoMBGi1GTKdCkATnr8T1hM1MJcZLkz2AIsEh7JB6r9DjdlNfjwgDBzBbH0ndBP7wI
         8gs+ks6ZgSqiGu2CigYGvoYnPIl7KZI8j1YdeGkjkqrjVZW6r6kjmof2Mm15iheTQ8W3
         rLVgZsad7Sb6tW+1Y9BsHtJAsc4sEPfp5C7mh40wvpNtXSNDFp37o+xfo1x/s5H2CuCd
         Zjvl+6LZu1EDLEXadz4KkKB1j3IJZH0bGEX/MPXXYM8wgRqW1/1fBGE3tbp96C6eAf4Y
         P797ikwouyMrpniKlqa3yr3huS8e4vV7P/x58XjLVN7KyngLsXVcE1Mjt7SxekATUUOi
         mkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536762; x=1790141562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqwyJ89Cq8s6pk+7RJQaTBkRy+ztlndvtZnDXNBJ3Qk=;
        b=uggpuxfc/8c2CyfNSfs09EGaPyhzkRsaXj5QMAgn0Y+NeI+XNqc8Ut9XZF13KXRSaw
         3ruin7J6cKcN+tYkH6SqUehNS6TTPH2wWNZshBqHEhU9Bh6RDZAlXa7ZZBdMR8sLNlNw
         2+WbT7UPLu+CTFtXSeZaY8C9gp6Ssu0ezPkst881waJCYtfYkRnpO2HJZcSUc4YkwaEr
         kR/RwWqulYjkeML2g99AZuAvbW3WdyPMslL3dKB99kN8YXEbc1wschM8ecZWDiU+ACKM
         4HRKK3WDcAHwOj3p70SMiEznmUeA37aOAIh3OnFlNoxVCngUj3KPgJZhvC9s7t3tz3wJ
         XaJg==
X-Forwarded-Encrypted: i=1; AKwUvBznFDP1Dgk1jEi6cPqxp6L3LfDpKjCXIXiFr/R6sNkdRTrl1ndu2zBuTGgT1fwytRyCRNqY2u2FRgQheU4=@vger.kernel.org
X-Gm-Message-State: AFuF++m3SqBSoVfWKzzUbvt71fv1Z/WXSNzMzuZ41naqC31VCffZ7blA
	7Ut7vBCYysK4sa7hfb84CTq3V01Y4V1RwOe7wFjS5BA3kDP7OR1DpyEf
X-Gm-Gg: AYBFou1XbHc/xHKQ7CLGZECW6UR5SbIo6t4VlN/+AY1ZJ23v4Of7sWV3uvFQ7dbU3z8
	lLYKKZK7QhQ3Bxq+83+i6MUb4GT4zhQ3ofLz8ME7J0Adt+oiPG/M5Ux87Ty/XBv7e7RbOTMxFxc
	2oli9Gw+YOmd9GVKDbnZRgxRqFEXZwiT2o8aGo2ljpLzQC62IV3TCWkWPp9lx9vUn0b0StJWYcC
	hWOI154ybfiRZvazdNOZJCtDsMzXymttI40MWt2etfv+LB0poSGWQfj9nZEFRe7t8eMTqxpRsAT
	TiJDJlX3QEM7rWakZDZ+LxYrHck0Ou0vydI14CnkO99uTf6PUcAGfFSdGBftpX4cfkqaNvBtBO9
	HpoOosVWOBOkHlOZRteHrF6uwyYfHCJ41u4UgBNsTmftDVyGB1h1/Pt+/VPBK8PrPvVU9j2FjD+
	YCCiPhsSmr5snuFcQ7nCwJdSp/HPxEyxDgFomfoevkdgWywfTAgwuXtOnoCSdFvGsC5T0uDoI6W
	jYNjq0kpaUUXZGj5jCKTifsMZs=
X-Received: by 2002:a05:651c:b2b:b0:3a2:522:c75 with SMTP id 38308e7fff4ca-3a5dc973345mr2045151fa.4.1789536761737;
        Tue, 15 Sep 2026 22:32:41 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5daf9519dsm3516911fa.7.2026.09.15.22.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:32:41 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: rtw89: BT connect state differs between scoreboard and bt_info on RTL8851B
Date: Wed, 16 Sep 2026 08:32:28 +0300
Message-ID: <20260916053228.10042-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <25270f2066784a02806daa352643be53@realtek.com>
References: <20260915122625.6341-1-skokovmaksimevg@gmail.com> <20260915123718.7239-1-skokovmaksimevg@gmail.com> <25270f2066784a02806daa352643be53@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> We found the problem recently, and ongoing to send out the patch.
> Please try the attachment.

Applied on 7.3.0-rc1, rebuilt the rtw89 modules only. RTL8851BE,
WL_FW 0.29.41.5.

The hardware read works. With RTW89_DBG_BTC on, during a radio state
change:

  [BTC], read scbd bt0: 0x40000013
  [BTC], read scbd bt0: 0xc0000013

BTC_BSCB_BT_CONNECT, BIT(16), is not set in either value, so the register
holds what the C2H path was already reporting.

status.map.connect still alternates. 90 samples of btc_info, one per
second, with the mechanism reason and the WL link mode beside it:

  16  connect:Y  reason:UPDATE_BT_INFO   link_mode:STA
   1  connect:Y  reason:NTFY_SWBAND      link_mode:STA
  70  connect:N  reason:NTFY_POWEROFF    link_mode:STA
   2  connect:N  reason:UPDATE_BT_SCBD   link_mode:STA
   1  connect:N  reason:NTFY_SCAN_START  link_mode:STA

The same sampling on the unpatched module, 30 samples two seconds apart,
gave 28 N and 2 Y, so this part is unchanged.

The mailbox reports the device as connected throughout:
raw_data[49 01 c9 00 04 00], so raw_info[2] = 0x49 and lb2.connect = 1,
with A2DP_active:Y. The sink was connected and playing for all of the
above, and WL stayed in STA mode, retrying association without completing
it.

Is BTC_BSCB_BT_CONNECT expected to be set by BT firmware on this chip? If
not, status.map.connect will keep being overwritten from the scoreboard
after _update_bt_info() has written it from the mailbox.
