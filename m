Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402827;
	b=K6Maaj83sddSBtbgckHQA3l09nyEcLMpLXesgS1sAwCTZRkBwrWApQr4Ca2ChGEZo/+t
	 9+wVU5xgE9p9iGDVtTSoL0lFHnVP9D+yRtE9RbeQaD4dpZSlnA/VceMGCvFVxEsB6JHxu
	 K3bFRaUnS22b/FQhpkf0cDi1N1BZ03/qu8hmeIsM1r9LPMBNmuxXgEDvLtTwTfT9dtFqh
	 HzBxtWC/zEg7X7X8Qm7LdbabG6/RwdzVhfJPrPJtoP/Blqp93yua2g8YhXHUum4Ortnfm
	 0ltQqXyplgfnzBq+SSZVJacSuMtNaolokck3VjBmghrQhSngN65Nt5zHjG5NeC6eb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402827;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6oQ25g7DZlaYzOZ2mtVDteOj26BCmtpM4iTBR2PfzRo=;
	b=fbMEDdHeC9K+OYlDQw26fcuNr4sYyI7AxjEqL5JIl3oZNWtNz3IfKHmGtDzYiXaUO/cQ
	 5OkiW4qcqqHNBsgfYkxOFNaZ75IDHXTRbhJYohh4EU9XHDdc2fcqqJFREIer7T7YnISu/
	 xo7jfKhAsI6wYF0HW1PEHcYC2OelpJXci6iwmWuPU5Jdl5Zn89mG323GRvtNlo6Zv+z01
	 9vnokLFpSdF1FeOHZQJ0NrbRMgZc9Brpbc3lfY/TjU4Twt0Vb2Fuij3bRdWZAH4mMkJOP
	 ao8QIy63lKKhnu+K6ZbFzlCN05bJ2MJNbTAVRrd37q3abc2rExIbD92+fQ+doo3976A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rMdpf9Nl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47947606A321;
	Wed, 11 Nov 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rMdpf9Nl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB531F00A05;
	Wed, 11 Nov 2026 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794402827;
	bh=6oQ25g7DZlaYzOZ2mtVDteOj26BCmtpM4iTBR2PfzRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rMdpf9NldED0r0lKT5V+ShIqsoviiyM0DyIVc+jUbHKMrnG1UV3VTNAYvEVBjFWvy
	 9RgV0klvMx9G/5q3uBp919PBmGjaocEWV1/SB9DflFef8zz5sftiLvnH/gHe3Vf/7r
	 nnqKyJhR3652zqtMYNoxRacvrraH8TACn4oY1hlg=
Date: Wed, 11 Nov 2026 08:13:45 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: mdshahid03@gmail.com
Cc: starblue@users.sourceforge.net, legousb-devel@lists.sourceforge.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream semantics
Message-ID: <2026111121-manhunt-answering-e622@gregkh>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
 <179433189678.152716.11457478975708955224.b4-reply@b4>
 <2026111054-reversing-gurgling-94fd@gregkh>
 <179440202172.231301.13877269286726215478.b4-reply@b4>
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
In-Reply-To: <179440202172.231301.13877269286726215478.b4-reply@b4>

On Wed, Nov 11, 2026 at 06:30:21PM +0530, mdshahid03@gmail.com wrote:
> Hi Greg,
> 
> I did basic sanity ,I build driver and ran smatch after changes.

So, no testing :)

> I don't have Lego USB HW to test it ,but there is similar changes
> in Xyllibus ,that was sent by me and Eli(maintainer)has tested in HW.
> According to Eli ,There is no regressions with stream_open().
> 
> Here is discussion:
> https://lore.kernel.org/all/24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com/

If you don't have this hardware, then there's no rush on this potential
change.

thanks,

greg k-h
