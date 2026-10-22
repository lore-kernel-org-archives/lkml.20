Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692954;
	b=ICVZUOhcqrL03oDbeoIvRjnkMCw46SyNaaCoBEzdft5NfAlxM+VRiuRqitVMM4XOeHQo
	 tSeEG5oR/oreXIVyAmszflk8M+WEa8FsRnHwSuAV9SB6ZmzaeJ/qXYfWYU9l7KmI0eCzM
	 J5gF7l1ugxD52wDRG9KRL4TL7P2l28h/ZAUIyMvDGWpP9Wqchu88z2oZ5FLJtcwCj3k5T
	 mCc8k4Mo5cjYNY/XIQtpAIxr0cGz/PmGR6KljwkBjEKhhvY0LEGURQaNjGShhJ4wixrye
	 OWD8KWzRp0UARn1sr95dAR+RVfYtaHJcRWKK7GUI1hTVNmVy5I358cUSzMb5KHeHg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PaN8bw/YeTmYvJNsbSyjovsCwKlcPndZnsf1s/btpFU=;
	b=AzJkQiGfv7f5kUAPx6FIhqZ2icAn6IQKj+1WNIx3pGDgWsjV2Gv5iAdb3wKARZlcCSsp
	 ViyRaN/zXyW4r90Zul4CHAxY0/hfTkRX7T+iwzcAC2WLD4gIBaNKKqnLz+IVx6/0JzBwD
	 KDD7Fx76j4Sy9jFzpUtNFFw//Wqr8mBOUkVO2oVBvUAmQKRoF7jkN4xT48b82NqiosJ9+
	 Jxgiwikase6UOufx6kwrl4WDIlijD5HdgriDSszaDoXcbReUcvDdc0nfeYc0sADhhoGA0
	 5/zfXcHUTO5lcDMD6vWM/TnNEz9ISFD2dwEUEmeEzPxr7dhzdlUtkax9VH+3JoKOkjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=HUdkciLA;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF5606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9AF5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=HUdkciLA
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so693925a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792692952; x=1793297752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaN8bw/YeTmYvJNsbSyjovsCwKlcPndZnsf1s/btpFU=;
        b=HUdkciLAp5pcrgIMeGlsE49QqY4c/gj8GGPVNzXjaemqOnDMlsMfhrFlrzH0TK9E1j
         M/NMp2TN5BE5twQ4b6AQzmZ7l+6ZJZgEtiWVLZknISktkyKaWT7sTcYlVlV25yu+2lRl
         nFDgf1FQ697hKc3Gs96cp0ZT66kdn7EQ/dURcm4cV24EASFIOs0hdzq8tNHG1CevRc0l
         hGVt2EW9JdQd10jMH8Q1YGCVlbe1mFIRYICPJ2D2EIVNSULGH6qnSa6ubh+SgDkBur6v
         cLJlxp/p7/9O6Vg7ndjQvBalbX8MvaL/AzPh2gVkMOYnmKdV5Ey0LVL3LB3xf/4Ejopw
         nINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692952; x=1793297752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PaN8bw/YeTmYvJNsbSyjovsCwKlcPndZnsf1s/btpFU=;
        b=twP/ZqtIQIIJTQ5qTh5SyzVz9ONtf4Ecf0NPluuRX6m71F/zaG4jlVmpf20ZCPDb+C
         733zoQNB2wCfH43+FoFzo5HYuEnlITiWRZXVC8mFaJaRsn7q0ftLWOZTSNmn1AYMRqvi
         PjCOusiMfGaMEjdgkIrxIWlDdmQvoEzHgK26CsRtUZYGsSzzP5qs0rFpFER0E7tdWQla
         IWZrznTQa47xbo91tp/cOq6BCoIFH5W4Zb+ZG8ja2IuMRZDS6jh/j7u/VCcZE4i0y/Rj
         hwOcR2j/29amO8xD/KYgtXSrVZUh2E2qSAJH9+f+OwYQ50AlEsj12zdnbeiPlgLWKN9G
         vXUg==
X-Forwarded-Encrypted: i=1; AKwUvBxSs00FW5rAqJAy2/cDEirUk4SdHpOnZp52F+Yl4mHc/O3R6KkXIF+9zMJektEEsZzzt75U8GDJSmG1OgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmYOjFbhiErzGj7OPZAwuhQDM5WLDrf6ONRfbigP1DheR2aZDI
	U6g9esCYDtA5EMMPykvh6YCS2TFs4x0h2ceg6widTDES3/7Qh7nVCPMfMsx4HAmOmcA=
X-Gm-Gg: AYBFou10p6shCURcuECREnJHz4WuficF/YSxrXE4cJVvqDT7uNqi9Bfef1KIyeIvHBp
	0u7f5dm6p6sQ64BFkPcIosawkgWqII8PQUUaIEt2mnmsgW24akrMDuX+6vdfC9hajbaT/BGJIk9
	ICc3PlNoS66srE+/lq4IdWgwFPUBI9m57k3sHZi3m9xz7UTtAm4CkfMoxfpTKW8lFm8ONWU9t2B
	7btF08z++B9haJtKkxdR2Q2LmBy1SUgDIoREf24My0ChLTSdYlPS3sKXQOKSdOha7IUscHuE4u4
	mIZdHLGfC6A5Htv1+tFb45sJTSTfcNJdZL/iDeexX9VcvnA1fTn8YxmKW7a2WLsWAMlW7i1V/YB
	aOaWqVCIS/7RhL26pGqtqXBJhnfv4fvCjr1oxRtQoL3pmekFWc9dDQA4YwUs5d+poW0FNTkZ1kQ
	7YnHBnoMrVWYnd1cURi4hDaOG48at85Q69LcyLQDtxxk9lMuXMoSj1YG+0rss0NTXVQoRttkct1
	mBT8fppbrR7lwAtTp9vc4dJBeZeEE2GOzSCH+8CkGZ6XZSe2WPyTkqwD1GtiLsrvQoDyrlMnw==
X-Received: by 2002:a17:90b:5403:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ada6c7e603mr1884805a91.18.1792692951864;
        Thu, 22 Oct 2026 11:15:51 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([115.138.38.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adc8ed1b23sm176638a91.2.2026.10.22.11.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:15:51 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 1/2] RDMA/srpt: bound the indirect descriptor table to the IU
Date: Fri, 23 Oct 2026 03:15:37 +0900
Message-ID: <20261022181537.3002021-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022143901.2991062-2-yhlee@isslab.korea.ac.kr>
References: <20261022143901.2991062-2-yhlee@isslab.korea.ac.kr>
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

Thanks, I will switch desc_off to a uintptr_t subtraction.

The room check is also wrong for a short IU, as Sashiko noted and as the
commit message wrongly denies. The division truncates toward zero, so a
byte_len one to fifteen bytes short of the header gives room zero rather
than negative, and a table_desc.len below one descriptor gives nbufs
zero, so nbufs > room is false and the truncated request is not refused.

v4 drops the division and compares the span the table needs,
desc_off + sizeof(*idb) + nbufs * sizeof(struct srp_direct_buf), against
recv_ioctx->byte_len, which refuses a short IU with no reliance on sign
or truncation.
