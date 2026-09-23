Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AA4218AA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185941; cv=none; b=I7dEa7HPLd+oBIIN3b87Lyqq84efw40mxXAbl1hvRzPMacZ9V3owWiBlVwsxq47B7uPRvqSo7NATMUvC1H7yo8xudJZDmx69B4cgibzzvtDZTAJtSLlKkxGoQys/b+8WBktJ6Z2mnYSZOVP0vS0yR7jMfNvLMPt8OaWSG4uhVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185941; c=relaxed/simple;
	bh=9BF7nwsiGUqrF3NEL0NmSiFpbxcBBQWY7qrXzUs5PRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IC506h9wNFxEz9+9JmZqxpLSsH8Fg95Tn9xbDhzdfoQp54MS/SMUaJjqtvaFc6Yfipb8HNstU3PdLi27yGi55Y7REjg882ohJ9KWB2kO5NPW5tYrZV3uAaIHia558+PBFFEePmswc+xYtQlQjXrF+9nzrU/s2H6QkMsupuVdLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw8SCuFL; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw8SCuFL"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so927369a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790185939; x=1790790739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntejg00uo+ObrghLjhgDMWB/RSF/FEi7La0moj2PhdQ=;
        b=gw8SCuFLIddmrWdZbSWI5+m/OviPU50b0c2TFZrl+Y7WFHb/ZUDsdAY1m+TBDuuhvY
         8eDTrcRK1tx4d5btl9M5YqR3YVvoWjEgbB83j/GgnxdCyr15XsMlWk4I5G4jIZMJb+SX
         7a5I0EX/2b7t4r8Lhgrskno3c0auQr2oN+1RA8mYllzjvrzrLLOGNIXbz3xYvQKvlfTr
         hDW88Fp4YUnzs+aei+QMybx5FY7aPoSkNG5fcrrXncE02vlnbncIn/Q8PObD4XCGswct
         nvtlspj8zhN7y4oa3brjAzhtfqwngY6IOkjedrC9joUIJ5yvO2I+pNYTUKp3dxwE2IV9
         2cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185939; x=1790790739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntejg00uo+ObrghLjhgDMWB/RSF/FEi7La0moj2PhdQ=;
        b=exSM721RNiCpx4IzVRJ+ccWKZ1Ag1KjspAJMseoUo0yzLg5mHXcvnYUzkzTNOCzfiy
         qyxyilX5helOBhroXnBXUY1IALCBdUMkd2i3ttZvSHPAydw7In0TMIJfUrApjBX535fI
         UPFMDx/1cGrRgv1wCR69oejujqXkUnSq9eT6iyv1/YdV6NOXA5UDu0nGhn4vjZgq1udZ
         uF2bOlC+tnWa2vxrCxiHxKShaArIdbNQ3g+/Q0KhBkVN19Cyr8s8U0tclNhWH+DKT/M1
         hd3jRw4F5ooJvfySU9WOLUOh4dgjcKd2j/eRRIxoVV2x8+kVk+z82QTxv1d2TAEm1o4z
         39aA==
X-Forwarded-Encrypted: i=1; AKwUvBw4j+CabFpCoWtJe/gBZa8MJzS7H9W8hvS6rQVbReD1Ek/Qyk1Sjuom4AprIj6H884k5trJECa5cuVAHG0=@vger.kernel.org
X-Gm-Message-State: AFuF++mo2dwgAYSqdkTm8p/UpYzOG/wfgCFZ8S7yOy4Sj6TCDjmQ5Zez
	Enrl1YipxgkSYf/5QIoXcX82Un8lErwfJQHV8wKzaHJKYeU8mgzsLjd/
X-Gm-Gg: AYBFou1DRvI3GirmDz/4fVR42TuwGVG7QqifqVOjjTLNS+JcYAvuM8KcWxQuZq8C0Em
	23KZ1FlDN3HPJPUCxC18OxZ079hPlB1mZdwepNcwXhyFz7+Av0VBV+t3ZQsRMGuxL6USH+7hhGn
	LuDVC4SZJd5w392XOXGM9hNSdWEH4upazyEdYmeEGLqdWbhVtjQXRM8HdUAvwEtUdgfq8M6Meik
	iDBQE9RR0hy9Kfbu4xHSsIBsAGtWO+rPbF2VUgjuey2nGDmqihcrpa57zucOzQAuzCZ/Q18AL5z
	AikLS6Xc9+TCwhO9pdhCRGu7PdnxVQTXaf1sNa9yQqtc1I23rFuGhIFQnp0M9O7pgm4EHENezjh
	bvrqSYSKDRTw7i8laoGP6AbNzWzk+dFPBqyQ4MHLyaiQq8NjyrlggtOi4v5sfGs94YzqDFwtWzC
	4YIp1/GVkp2ku2TLJq02q0akoQQV5TnmUSXx4bbtPj/NXKlbcyFL/l9+SQ42qGDqMeW7/zJ0wX+
	FGl9BV1vWqY3Il9ro2PbmNfOJCYtXLtZqnGDOI9Bhf3mhSPTRgXN5RTFsCnJZlX1EW7pAJO0C6x
	wG6U2aNXPwL9CleynL096HEf69LSpot+3KjtTeNXoppW3M5JXhpD/DV8R+gzCdyiyAgQiu0Z
X-Received: by 2002:a17:90b:2fce:b0:3a0:3881:eabe with SMTP id 98e67ed59e1d1-3a07e4ee868mr2866614a91.5.1790185938673;
        Wed, 23 Sep 2026 10:52:18 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fdbsm216755a91.10.2026.09.23.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:52:18 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isofs: reject short directory records in isofs_read_level3_size()
Date: Thu, 24 Sep 2026 01:52:15 +0800
Message-ID: <20260923175215.1577791-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919222553.3792320-1-benquike@gmail.com>
References: <20260919222553.3792320-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

I'm sorry, I missed your patch when I sent mine for the same function a
few days later ("[PATCH v2] isofs: validate directory records in
isofs_read_level3_size()"), and Jan has since applied mine to his tree.

I did test yours, on mainline and on Jan's for_next, running fs/isofs in
a userspace harness with ASan and UBSan: it fixes the three fuzzer
images that made isofs_read_level3_size() read past a record, and I
found no change on valid multi-extent images.

The part of yours that mine doesn't have is the limit on how many empty
blocks the walk skips.  Without it, a run of zero blocks is walked until
the end of the device.  On top of for_next that would be a small
follow-up, and if you'd like to send it I'm happy to test and review it.
If you'd rather I send it, I'll credit you with Suggested-by, or with
Co-developed-by followed by your Signed-off-by if you prefer.

Thanks,
Matthias
