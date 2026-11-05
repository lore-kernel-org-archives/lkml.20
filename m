Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908661;
	b=1QGN+nLaJHmzVK0SCL1oGqG4X+130cRFRCzwqCsGzw++DlT50mNbEQAycdThtQotdUIW
	 sXkETQQUCpLrNYaJCXVE2GICVCEpA5d+WZKRi/CurGS0fk2OnZW3PYfEezDDP0yv9/eCu
	 eFk7tDGitUrjSoln3zzjyhH+LTPyKbmyHydsgDlZ3GYNIjYW7juruyk/+tyrHr60n33gU
	 bKSC3uAp08X4t1Vhw7PdUVwPB1U7AxrJzj10pLcHnBJ5Gwxg46CuxdES+cFZMjPks164N
	 1yLV+hZFogLsKDISpWnY2PgF6DARVoXHdgWe3zZTxsBOqwrF3iF9OQUiNW3CFMWsA4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=DaBQOBmOn2LdFzR8qRXliWsUS06vZ4v869U44kfu038=;
	b=r6d2mGbh/blBANhJS8bZpt1G4NHSNx4RDbM2I0ufOJv1NmPFYHJ1foupeuGWga7XSV1D
	 HmaPxmxI0LvXYMJRo/2R5tcbAJl5Jy7BxeqT9QZKtTgZhTCQDIOV8k5y1VLsxJ5FEcD3b
	 Hz8cqK98kxddFj7BuQglm/QkJDtyOCBgjvx/tUCX/XZWqljk/JmVBOrzPThGiIi0Z1oUd
	 IgK2ZO9BIPkwjWpnNUzBZ5dCRc2eGtcXUAf+mRc4uR+aWr2x8NXmADn1yCKie3OxoK5db
	 fXLrQkqCpMXw0IOX9s0EEQlTYYNqm/LMJft18yt75G7Zemr62FqYZ8Tir+Db/ch21Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzxLvodv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB56606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzxLvodv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA32F1F008A3;
	Thu,  5 Nov 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908661;
	bh=DaBQOBmOn2LdFzR8qRXliWsUS06vZ4v869U44kfu038=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jzxLvodvND2uIskc/k7mrbmX7om02LDQuTN4sSWT7U4a81zt4R49PJEN298tzv1+5
	 X1R6p0Ufs2Bn4u3FpPBRCD0eADffYNw3RhMutVANraXKdCTiyvo+LKEnBElWl9dNlz
	 pJMra7ovxSrqyeiHNlyFM+R4pERiF5I/o+Y4fHPExxDIsX7eXoC0cNueIqBIykdvaA
	 DTXB7bk5AsDHZUcWmUynQ2xbkZsJ9/wfwFzcbQo08UfiRvV/DdBLKBDeBzv9KPsuUz
	 bkWqUGkTOjsU8UrGbudJVBCTbKN6HQh4nmpsB0DWR7f7Tnz7+viD4lQ9qKWQGjBTvx
	 OM+zL00zEkejQ==
Date: Thu, 5 Nov 2026 12:57:39 -0700
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?B?5buW54WK?= <liaoxuan@open-hieco.net>
Cc: axboe <axboe@kernel.dk>, hch <hch@lst.de>, sagi <sagi@grimberg.me>,
	linux-nvme <linux-nvme@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	default avatarZheng Tan <tanzheng@kylinos.cn>
Subject: Re: =?utf-8?B?5Zue5aSN77yaW1BBVEM=?= =?utf-8?Q?H?= 1/3] nvme: Add
 adaptive PCIe link rate switching function
Message-ID: <auzfs1qAOkXm8i2W@kbusch-mbp>
References: <cover.1790134954.git.liaoxuan@open-hieco.net>
 <85a11a4085d04a2823c04059702630cf34abf6d4.1790134954.git.liaoxuan@open-hieco.net>
 <auoxH197kQfUJGaE@kbusch-mbp>
 <34801e0a-5d66-47c4-9844-7844363072fe.liaoxuan@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34801e0a-5d66-47c4-9844-7844363072fe.liaoxuan@open-hieco.net>

On Thu, Nov 05, 2026 at 01:50:21PM +0800, 廖煊 wrote:
> However, L1 is entered only when the link is completely idle (no
> pending transactions). During active but low-utilization I/O, the link
> cannot enter L1 and typically stays trained at its maximum rate. This
> patch targets exactly that window: it dynamically downgrades the link
> rate to the minimum sufficient for the current traffic, and upgrades
> back to maximum when load rises.

ASPM operates on microsecond idle periods, so a lightly used link spends
most of its time detected as idle. Your threshold only selects the lower
rate below roughly 1.5MB/s on a Gen4 x4 link, which is essentially idle
where L1 would kick in more readily. Do you have shareable numbers that
show a real power benefit beyond ASPM?

> So the two mechanisms cover different link conditions and are
> complementary rather than conflicting: ASPM L1 handles the idle link,
> while this patch handles the active-but-underutilized link.

I don't think this kind of policy belongs in the kernel, much less in
the nvme driver. There are mechanisms for user space to control this,
though: the bwctrl cooling device lets user space set the link speed,
and diskstats provide utilization. A user space daemon can implement
this without kernel changes.

If you don't want to tie this to the PCIe thermal subsystem, maybe the
current_link_speed attribute could add a writeable callback instead?
