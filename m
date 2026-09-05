Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96614A619
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788641382; cv=none; b=Uinw6NpuI4TICxVqnL0b2Fg6eEBbpei4xnQhxtfGa+Fx/80eo33HMArJjOhsUwGkeb7KZcaTWjYwTV9h195iA68TM5x2FMBuJYOom64d78lXwUBiIfB9yZHhzswTPGpMsyqqGSzHFZ4naK3DMkzyCbI1knmjQWFfdg+eySJukaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788641382; c=relaxed/simple;
	bh=bzBfY2U99bji2bzfGJcghtKL+JKT7yCb2Y9gyWo7l/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VOk7ARmeVo97GqUBmPT3ntfNddyNUeZnaIBeqYVWk7BvtfGHRvW2uaNdkv/i/1O7ELSo+eVRFcuzPvfDCCVX3mz+V1B1cHyUhsHizcbM3pMmIGn/ChugmNqHsJPa8E6odMuqQ9GzGxa+J7+KjvlLFJR0YL25ZZxmBNuh7QhFoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9CDBieH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9CDBieH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9A21F00A3A;
	Sat,  5 Sep 2026 20:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788641381;
	bh=GA1MDr+we9085rsZDRQkgn65N4hwRmPg+KPojY8w7Jo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=V9CDBieHdd5/cWRBeNdr0Zb6Vxl2w4N1XND3GEjH/UeJbep4m22nb+3ZhK2zHT42p
	 ykpt70QR6qTIehOD4HN9VqUlyeIqGWJQGwY4sHnvuIdIJ4DRvhCx4uGZhNurnhmq8N
	 /CBpM7hao3VMj0pkj37DmP3xksBr+MZVo8xi/u+xiSHLq6DceV2cg4Hha6zP7p/uwK
	 kNKo+why6vg63rm/W6MQSkH8rUWOszSwIxsi1gkAEIye9dBCXSZXKDCh/ZwB46HL26
	 JYOW4YF7k30oc+j49KBKLCckrrdRwZprdY3uscFTDJOU+jLFwDt9NWSsyW4BQR8X21
	 l4yn8IO8tA3CQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, thomas.weissschuh@linutronix.de
Cc: luto@kernel.org, vincenzo.frascino@arm.com,
 david.laight.linux@gmail.com, zhanxusheng@xiaomi.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] vdso/math64: Add and use __iter_div64_u64_rem()
In-Reply-To: <20260902033801.2912699-3-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
 <20260902033801.2912699-3-zhanxusheng@xiaomi.com>
Date: Sat, 05 Sep 2026 22:49:38 +0200
Message-ID: <87tso34e59.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 02 2026 at 11:37, Zhan Xusheng wrote:
>  
> +static __always_inline u32
> +__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)

What's this line break for?

That's unreadable gunk. You have 100 characters.

