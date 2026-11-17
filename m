Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918947;
	b=WWrn/fg9NJ31bbv8KLjo93TRXSTFdmvL3Nj2gWHZxzRCayhzJNJ7xikpawSwWYkARHqC
	 SZY2tIYlcqtvWgdn2wRVw3CFNk+uoe0l3dBNnv/cfNJBOIonl8LpBIMFAL00DaxeAIDLb
	 3KbM9ps+QBvsgpAq91aq+a2X1Ao1J6GEK+0jRZtb0gLJzn+oO+jxmScHarsD326dWKobF
	 XNnbvlriyGQbZxRxT7cFpOZAvyF5fUTHNrYDno0mAcX5YoN/8Bps97v/VE9k5hSGc4RuP
	 WBzI+R8XEBnFjD2PqSUx/jb+MNTEGNPKuSnPMHCsT7OirXH3Vrtm7WCh/x8weHbiAOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918947;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YL8ck00cDH5clCeBoNi4M8yBuopvmAOesKBY0fZ3cFE=;
	b=st3JEb7FZ16zYLKD8n98BjWB9tDMgglKqkHXuzcfgW9YQ1FgbQN6Cvag6fT0GD5AiZlj
	 KAamiMi7ojMnn07Kp3KwSafsJe6zf/DNkRFq6+EgqM788LEJBkcLpX5aS9P2DaOTFRpwA
	 j0VvcVdFWNFULC+dG1jw706WaqjqU+bXTbHKihfJYX49So/KdkkWxbtXY+ov3MsjfFQSb
	 qUkkVtLIb7/xmXUm4x2z0cr7bQ05PqIlK5cfo51zEq8/83N1NJgMGdfh+RGmhSg59ggSY
	 Ir73MdZMR/0FUMyp+oVnqf65otNam/u9ZozGCikWOmYi2bvwIWOMzgYt7nuuSFqdK6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2sinnWI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D3C606A32C;
	Tue, 17 Nov 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2sinnWI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BA41F000C4;
	Tue, 17 Nov 2026 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794918947;
	bh=YL8ck00cDH5clCeBoNi4M8yBuopvmAOesKBY0fZ3cFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2sinnWIyIqJN+aAk4XcA6WZ7MkD+ZMu5+JK87ZB7b1wp70vTpIIq53hm+sPlDnNE
	 DWXsNsqDQNU9/i2mpBtVsIq+OUKqKtZoucj+3rs7zJGULbKyENV1TH7PHcj3o72bG6
	 NIoISA6LHjbDAbanqgEXtd3yjEtbcl2cqW3905Rk66/W9qH+jfk2sYvYbrBEHJCRqJ
	 NtnolcK2sKG0CDI5R6OjfyTColdM2rP5xaEJFJmT+eICdVYdgpKTOwVbsYPsLOXlQC
	 BpQd+fadWd2Bkif6QfSP29Zf9kZGDYPmTlbyi4D2Ij8uXH3fIyryqVgBUA9M7tPcvh
	 1WutVaHWokMbg==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTIPZ-00000004Lzj-0IVH;
	Tue, 17 Nov 2026 13:35:45 +0100
Date: Tue, 17 Nov 2026 13:35:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: f81232: drain work on failed open
Message-ID: <avxKISailO0PDLZ8@hovoldconsulting.com>
References: <B2303336BB3BED22+20261116051024.3330549-1-tuhaowen@uniontech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B2303336BB3BED22+20261116051024.3330549-1-tuhaowen@uniontech.com>

On Mon, Nov 16, 2026 at 01:10:24PM +0800, Haowen Tu wrote:
> The interrupt URB is submitted before usb_serial_generic_open() starts
> the bulk read URBs. A modem-status notification can therefore queue
> interrupt_work before a bulk read submission fails. A bulk read that
> completes before a later submission fails can also queue lsr_work.
> 
> The error path kills the interrupt URB but does not drain either work
> item. The tty port is not initialized after a failed open, so the close
> callback, which normally flushes this work, is not called. If the device
> is then disconnected, the work can outlive the port private data it uses.
> 
> Flush both work items after killing the interrupt URB. The generic open
> error path has already killed any submitted bulk read URBs, so neither
> source can queue more work at this point.
> 
> Fixes: 87fe5adcd8de ("USB: f81232: implement read IIR/MSR with endpoint")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Applied for 7.4 with a CC stable tag. Thanks.

Johan
