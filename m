Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792556659;
	b=3C7vdLwWR1WHzid4VWhpggeGQHU08YHBjqTP5XAvLAmX9z2MR8bbSzJKHofMa2Sl6RYR
	 ClVRCM77XyBSrMPUdEZwWckUpmsU2eAy4ecen0bQd89VAZiT02Vo7aPBNHWEthAfUV07D
	 RHq+w6QkI1zC7we0v4GTD+DyzlIezMBOqg1L7DeIzBE89m571CmC91zHlvfJKDnbgEhsL
	 NYVud5UJtwixJqPkZpGxtR9kurzaag9B8btOCC13f6LCUfr9X09WpiI/GIsvPvWhi0igc
	 Iw/tz8RHRv58leyH945QuebMPqmDLQQLlmtBsNkskSACCZYkLYRIfQYGDmu8CF0HwqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792556659;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A7l7G7i+k9QsTVZdhBJhV0zpS6MyADVD/+C82vITnO8=;
	b=0komEz5OAod5JnbzVBB4ujzjH8maT46iQVoQm0rXyouHoZzgOcKP0bGIOYxIuKMMF+Um
	 XaBMWbcJ96ei/1FBrauG8KcXMC3jBxsZ4WSRXz0TiTV5ucphMu4EQXXyyCUIpfjXInnSo
	 8cf5bx6FtnmgBU1wmvRuj2IfUYSERw9BxNxH5f4tgU5YVUe/uqqB721pa+rHye12PQLrV
	 DELg1toVWNyjoleDXmIWTIeEfXc+lDshtQvyGAbU39D6P+K3shmYs6owFkjysv0iZB1It
	 GBQllWMmfAg3Fwon6QWptoLLm8DWP3YJUCHIgv5dqdtj3Y7/DKhsX4Ep3o3xmgR0wkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=t5YMvVRX;
	arc=none smtp.remote-ip=202.108.3.163
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4450606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4450606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=t5YMvVRX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1792556652;
	bh=A7l7G7i+k9QsTVZdhBJhV0zpS6MyADVD/+C82vITnO8=;
	h=From:Subject:Date:Message-ID;
	b=t5YMvVRXjdqtHz2wS7zq2Zmzp0pOmQ7ZyxkRXDOl6xtqtvTdI+eUR3v31xDSMl3R/
	 IqTcSG31ZyowG+anOl4ZLTlmXvg7MFcGZSK4pW5YtFZTHrr+jtkwroR0/2QNGRUOZa
	 Vn8/7+PnzGkFX9tmBcNkxs5b9xq8gobq+r8ZvBp4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.254.2.239])
	by sina.com (10.54.253.34) with ESMTP
	id 6AD83E5F0000427C; Wed, 21 Oct 2026 12:24:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8999416291657
X-SMAIL-UIID: F14EAB6385CA47FAA0CA6358ECCCDE05-20261021-122402-1
From: Hillf Danton <hdanton@sina.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brian Geffon <bgeffon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Date: Wed, 21 Oct 2026 12:23:48 +0800
Message-ID: <20261021042350.907-1-hdanton@sina.com>
In-Reply-To: <20261021024236.1787884-10-senozhatsky@chromium.org>
References: 
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

On Wed, 21 Oct 2026 11:42:19 +0900 Sergey Senozhatsky wrote:
> Split struct zcomp_strm into separate compression (Write zcomp_cstrm)
> and decompression (Read zcomp_dstrm) streams, and split zcomp_ops
> context creation/destruction into create_cctx/destroy_cctx and
> optional create_dctx/destroy_dctx callbacks.
> 
> This decouples Read (decompression) and Write (compression) paths so
> they no longer contend on the same per-CPU stream mutex (Writer vs
> Reader priority inversion).  Currently, a (low priority) Writer that
> holds the stream mutex can be preempted by a (higher priority) Reader
> on the same CPU, which then blocks on that mutex until the Writer gets
> to run again and releases it, which can take a long time when there
> are other runnable tasks on that CPU.
>
Given lock like mutex, priority inversion happens from Monday to Friday,
but I wonder if you are inventing some wheels in 2026 if proxy excution
works for you.
