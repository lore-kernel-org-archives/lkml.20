Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637013;
	b=IB81YeuhX3/+6KxgjSf5A2skAJgfXd8OKMy0RoYxKfYEROPJEbmx4tvHxO2VCnmf5Z7t
	 apESTWpHgvcA4n1j3IrjDrxUY2E/1r9SOeP8WWHZ6/JTE+aG9DAlMqVHoPo2oPCS7Shyo
	 ME2P62WlqhpFIZGIoWi1DAI/qD66EJqA4Rk85rJsg/ZvMHrLUSn8Is+IDUUXDOkaMJgc4
	 BdpSjX1vrznIubUsUDZ0E5AHO6YGQOH9XmaQgtvNtjYG6fDRInVfrzM7VH8JKFX4AXdgQ
	 /bp+nPOV+OOsBpFdiHNS09ohyzpzkkXGgGegegfMugQLnn+wzqkiHpdJtpNs8LOlCig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=u+ZLLWZ4r7BpZicgUhx1wwDWmMzDYFFNM7vGJnHJh+k=;
	b=rxhCmUl012vHfcewj8+8WS6TXhoWXDuPONTI7Ex5MWYBLIOgjxSb2GzqWfws43M8zixl
	 n1Ilh4RwcexiU0ebxpkfmkltlIbBpYAFIBCbsUUVMhaGBgdpuaAjsO0Uav7G2qwPXlrjB
	 n0+eD8ql3K7HDiwTTJ9eOU6OJ67VB8jamFa5gMDcQxkdx0N3H3/dyO+7/++68sHZCKRQi
	 QJABrx0YnhDi1ClgBxvnO946Pj3gWFrZal+GUAYGYXLdAeKwMz/mRyZc2MOx43ppezI7p
	 8gAC0PSiW4fwfae7obpRyPtrXfVsps3IPABG8WUteBWnButVyA1PMpzEp60f+Pz3QTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFUvlfXr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5836072283
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KFUvlfXr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897AB1F00A17;
	Mon,  2 Nov 2026 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637012;
	bh=u+ZLLWZ4r7BpZicgUhx1wwDWmMzDYFFNM7vGJnHJh+k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KFUvlfXreI/MoxmoSkPqRVVzpDpd+uTzijNwa8+nsJnOKBxyUIALDZfVL0WBbBBPj
	 apXZ4IRU2ZDF1FKiRTg+XpBv6d2hZgmbJC1YCGAk+9XspdFs7Flf7LvAb4XbcI4dEt
	 PWQ60lvtUmio4oCfst8VG67gqd4zA8RKAK7PfnEMfZVaHZDLuXxJ0GUXYOfnhio45C
	 YgaewouNkMZK+nFuScSYlySYr4USY/Ny+3YTeKLGMbHpNu4JbHhRjA3aUq6bJaPucn
	 ptwJRYNHzt9h4z6cDQEAdCXo515zsTmJx9W/kbzkYhhTz5vLzARb6mhFLL0UADkRx6
	 mP4H7FRx2rsug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D265380821F;
	Mon,  2 Nov 2026 16:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [f2fs-dev] [PATCH v3 00/17] f2fs: support & optimize large folios
 for writable files
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <179363701099.39295.7655811180545281360.git-patchwork-notify@kernel.org>
Date: Mon, 02 Nov 2026 16:30:10 +0000
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
In-Reply-To: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 chao@kernel.org, baohua@kernel.org, jyescas@google.com,
 daehojeong@google.com, Dev.Jain@arm.com, David.Hildenbrand@arm.com,
 linux-kernel@vger.kernel.org, zhangbo56@xiaomi.com, kaleshsingh@google.com,
 nzzhao@126.com, lipengfei28@xiaomi.com, Ryan.Roberts@arm.com

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat, 10 Oct 2026 00:12:07 +0800 you wrote:
> This series supports large folios for most readable/writable files
> in buffered I/O paths, including normal files, block-layer encrypted
> files, and atomic files except for inline-data files, compressed files,
> and quota files.
> 
> It also extends f2fs_folio_state to coexist with f2fs page-private
> flags and to handle large folio write path and partial truncate of
> large folios correctly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,01/17] f2fs: extend folio state for large folio write path
    (no matching commit)
  - [f2fs-dev,v3,02/17] f2fs: carry subpage offset and count in write IO
    (no matching commit)
  - [f2fs-dev,v3,03/17] f2fs: support regular file buffered writes on large folios
    (no matching commit)
  - [f2fs-dev,v3,04/17] f2fs: support atomic file large folios buffered write
    (no matching commit)
  - [f2fs-dev,v3,05/17] f2fs: support large folio writeback
    (no matching commit)
  - [f2fs-dev,v3,06/17] f2fs: account large folio dirty data at block granularity
    (no matching commit)
  - [f2fs-dev,v3,07/17] f2fs: remove mappedtodisk flag usage in mmap write path
    (no matching commit)
  - [f2fs-dev,v3,08/17] f2fs: prepare mmap write faults for large folios
    (no matching commit)
  - [f2fs-dev,v3,09/17] f2fs: make GC migration large-folio aware
    (no matching commit)
  - [f2fs-dev,v3,10/17] f2fs: optimize small block size large folio read
    (no matching commit)
  - [f2fs-dev,v3,11/17] f2fs: support partial uptodate large folio read
    (no matching commit)
  - [f2fs-dev,v3,12/17] f2fs: handle partial truncate of large folio dirty subpages
    (no matching commit)
  - [f2fs-dev,v3,13/17] f2fs: wait for folio writeback before ffs_detach_free
    (no matching commit)
  - [f2fs-dev,v3,14/17] f2fs: fix zeroing paths for large folios
    (no matching commit)
  - [f2fs-dev,v3,15/17] f2fs: handle block cloning within the same large folio
    https://git.kernel.org/jaegeuk/f2fs/c/25076e575f0e
  - [f2fs-dev,v3,16/17] f2fs: allow large folio support to writeable files
    (no matching commit)
  - [f2fs-dev,v3,17/17] f2fs: make compressed files compatible with large folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


