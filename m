Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146007;
	b=tghldmJZXIpIT1Ju527u900V4Ow3oni9oyuZXoUhaVpC9Ok9tpdxSEp0qNENaz+2Fk7x
	 CGpzElveUXK0bfSlST/ijiiqxtntPzJ/V7KNGBLLadWqJW8XpsXxALSBffjd21lmpLlFg
	 i1IPw7umitvMEpPwQhQF1LuHXXkoJHBhlynRMalxChnPCTNN6MDl9GSdMXU0+hXT8HTE2
	 Oqg9DnNm5AFm/r2jq9No/ATOykz9Odf5BZQw6wLJsW5aqdSOkYvTdrRayeUOwsN70HXPh
	 XbZGbt6m3pe3XYsgr8R+0g9y6ph24T/MxZOyo/78H77O2IIcJyyGxtwQqCbeU7DYB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146007;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AgMSu6TdKh6U7Y8sdv7sFhn8l9yH65l6rGLNFCOtC/w=;
	b=GwyU7PvG3ItkIfjP3E55yOALXURYY7edV2vVlEn6FxyY/U2S9wxCszuDedL7r6UwhB9N
	 MgFwghmhJzfXo6EMNwZgpdKS4bOgzuzTJjCbeRDxbK/qiQH4clnstphPMGxJJjAOIgecz
	 ohYpOqmExDrLFTm/37SDhIo0e537nRCjX+M1CPwzlK04vPuLc3Qx0IoFb6xEBUOKFl4jM
	 GM8MVSZEJB7Z21VbRcb0yTIHUR3ZWYTxXWAEE1ZMkzijSlmSG2RG/0iYkotyBthJalloB
	 JrPxYKJ5MlNYm6lREzgrJ+MTBDRnAHTER/yjhWyfCBwyG1h5WHarne4dUigbgKpeSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t7oVpwVQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD482606A320;
	Sun,  8 Nov 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t7oVpwVQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580791F0089F;
	Sun,  8 Nov 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794146006;
	bh=AgMSu6TdKh6U7Y8sdv7sFhn8l9yH65l6rGLNFCOtC/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t7oVpwVQGB/Tnw2NzVZLyS5fcVY5k3K8wAz4Mnj3m9zxXedKsxF/BaECdvyzkCa+t
	 SwExIi/AZWF7sOCd7NULl6Glltzpc6WQTD7Xu2pqyippiBU6Q8+hIQ5Cfwx46eE226
	 KkN0GmvnFlGN7LXBldeuk4yqiDuSfH10/PWJASZA=
Date: Sun, 8 Nov 2026 08:53:23 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: DelaySystem@tubot.lat
Cc: christian.gromm@microchip.com, rajveer.chaudhari.linux@gmail.com,
	error27@gmail.com, parthiban.veerasooran@microchip.com,
	shyamsunderreddypadira@gmail.com, marusik.adamenko@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: use atomic_t for channel state
 counters
Message-ID: <2026110810-backside-hamper-106c@gregkh>
References: <20261107-staging-dim2-atomic-v1-1-6eb4e8f1f63a@tubot.lat>
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
In-Reply-To: <20261107-staging-dim2-atomic-v1-1-6eb4e8f1f63a@tubot.lat>

On Sat, Nov 07, 2026 at 07:14:42PM -0800, DelaySystem via B4 Relay wrote:
> From: DelaySystem <DelaySystem@tubot.lat>

THis isn't going to work, please fix all of these...
