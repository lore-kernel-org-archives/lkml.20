Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749827;
	b=xk2It47daXiunQK72/N03EBw+NOy5dW8ugNurc5f9AqeoaoIJfhaTll4vVs1AoMMeOPF
	 N3y7cn23eFDQRiH+ADn1bIIAlaSGcdwGzxFpEYI6azYZ5Rh/TBJ/XKKwzde66aKGBFvhh
	 BkNJfTpud+1LLHjFlOqSncm5BqfSE485X5RvDrns4QLD4j8iiee9pXrMjCpOXYxPfK3z/
	 OxbnAC918YQC9Yu8O/LNQQJsnIwDjpIna3tmp7Wec6lOs88sP5XrwKciDa04h0BpvCIM5
	 lWYEZgq2YA0DDUcCm3bDcx+dsfzI8HPSqpErzzwaTM9bjjqSlSWzgTUslBaLfTRUfvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749827;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZjUnR6+QZE32A9/LkuFUZch6nPwUQMRTjQvKArmo6yw=;
	b=cfmu8gnoMhx5yC1+o+Fbx8s3QLbqV/5JBRia6/4wiQNBcfhCCT2pEZf8cgYRtI9MZgqH
	 WuqHnS63haPXpkq46GIivy/RfQsySSTJalUtjv+MYwjd2r4gbc4u0Ogf5man3XLOpMPVJ
	 cpdQMFsA7QhaJwR5wmkzWxi5c5H9E+O2Id0itS2YnnFUDAIBXI9SavFS+Ijj7eb2yF7jz
	 MPwr3O+VHZF2Y0w3wDXFb6cnmLjLT0ywVnNJyU576qH/LOm7gyZEN06GplslPNOXvsNdB
	 3vAW4PtpdF9Im0wbPG1SQW9c101Ob1q/aV50TpGn2CGypgV38zM5ffNIp24LS6iKNBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=loMOBnUl;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E139D606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E139D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=loMOBnUl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZjUnR6+QZE32A9/LkuFUZch6nPwUQMRTjQvKArmo6yw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794749823; v=1; x=1795354623;
 b=loMOBnUlGAnQX95XrWH9zMUwvlH9+LXJN3Caqh/yxJkpPCND8kw6xhUZUl5RBpgPODpLXYwx
 S4n1ub03UP7kUtASXIVfj5q+AS+VIiX6PlCoBoLo1U8S1jqUvfjZE36TlI19QuZd1qq77UsDZry
 AJd/TGnNdxCg1Ao3QcOSo2cg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34ee1f0318fc7712;
	Sun, 15 Nov 2026 13:37:03 +0000
X-Mizu-Trace-ID: 34ee1f0318fc7712
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:36:58 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <20261115114336.1739863-4-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-4-hjf3108@gmail.com>
Message-ID: <CF096E2D-CDF5-4A75-B4A2-D050B78B44DE@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

One more thing for this patch.

On November 15, 2026 12:43:29 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Make MU and SU capability flags each depend on the chip declared
> maximum instead of setting both flags together.

Could you also describe the problem with the old advertisement? As far
as I can see, both SU and MU beamformee flags were set regardless of the
chip limits. Explaining why they need separate checks would make the
reason for the change clearer.

I think the new support_bf check is worth mentioning too, once the
runtime behavior from my earlier reply is settled.

Best regards,
Luka Gejak
