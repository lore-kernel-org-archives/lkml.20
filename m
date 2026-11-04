Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819073;
	b=4Bz3lobCWztPPkcpDjgeW4FohQdQ6JDMoHOC5Tb/iiZJGTGTI175kTeWowSl25p3N3VD
	 JnBcka3b3l44CbtDIqiITJUd3/3/2bKPWWnhmOjKfCbC/nX065mVwA4WEgjdjWAr0xH7d
	 RL+r8xX3P8NXFUo1I6ivfs4lYT4zyu5A1RHK16hGII+YCMwXq6TqK8pQyWWaUGzqafd3Y
	 VY1QEhsVwqPV5OEFYEsQ6imTF+idbn8sRcaeaf85ivVie1QB+WDJVUj7tk3T1R5Z1pT++
	 SP3EnKnsEsNBVK1qRS3v8zGq368pMyZiB2pOucIbiq5hSXRhXJVGAykshTSfs6/BClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819073;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Nzlx94xCXsJ45lxVe/+sVswON2gOg3rsCW8+XOQD9A0=;
	b=xMCmVb3ViVnsWMb3LKtoqWkbWbk5Wui5MYjMObOqM0MoV7g9rAO5cM0GdpyC28NOxcZb
	 NCStfiJBZo0gM0G9xvVp4vOSJ3e2l82W6E2ihS1wNY5cli+AI7lGmWDYgeqe+NoYKg+rU
	 EdZnRg/80utvAnBHTNaU7jEe/peyxaa4NxnE5ckRD1xrLYOSx04DNbK1KcBA4TGqN51dA
	 wAZ9lrn7yUC8C8wPQfpB06oEMBl4BQ0D/aFSy4au+yrqvGk4oD7dRmnLi4n27bd+UNYbm
	 pPP40ZjvNLpKM/rPkwwYi8/mSWmOf/Kt4BRCQNNVN4zY480Z84IQOX3qMuJywRUykqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UJpToFkm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE093606D80E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE093606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UJpToFkm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5D91650;
	Wed,  4 Nov 2026 11:04:29 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 479053F673;
	Wed,  4 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793819072; bh=mxmVvekXUus81W/rKLQ1g8nPXVBK8Oe3f8XNM2lJhl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJpToFkmsbrCWHGQ4OO6XfuXp18FpfQiAbVggcwq5rAhdmorgcuC/SS4N3csUrCEU
	 3AuXANYl1F/ALdK6dcyc44JIptZqqvZOZG2+gClGyUBCTindQZA0PbySwWwvbztaUD
	 7Q999ciCaob6yEDdW8s3FM3byFrMdr+z39sQjy2I=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
Date: Wed,  4 Nov 2026 19:04:23 +0000
Message-ID: <179381905165.1379866.9924392772428731758.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101171030.87343-1-zhaogongyi@bytedance.com>
References: <20261101171030.87343-1-zhaogongyi@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 02 Nov 2026 01:10:30 +0800, Zhao Gongyi wrote:
> An arm64 syzkaller reproducer creates a FUSE character device with
> major:minor 1:1, so opening it uses the /dev/mem file operations. It
> maps one page from offset 0xfffffffffffff000 at user address zero.
> The next openat() with a NULL pathname triggers a synchronous external
> abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
> panicking the kernel.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: validate /dev/mem mmap ranges without overflow
      https://git.kernel.org/arm64/c/b0958b1397fb
