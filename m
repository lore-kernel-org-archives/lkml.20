Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916864;
	b=L97TZAgatfzmNyiySV7OHECcWXPnsa7dvRksQodtMT3rvRLzQWpJAiL4TvqVSmIFdnqd
	 2T//D4qEc2z/sMDCpIiaNy383H4h5Q8MY+q/UFFUE3NV9OU6Z4PZzlrRutrWjTsP8W1si
	 S+d2Hr0DGkfXo3QJJORqB5gxEQn7mjvGdGUO6FZP6SVjbd/RKofYzBmvcPkmKFJKc/tAR
	 dMw5FUuQw+k0GkQSPWTIimMeAMzD+yK5LIrDxoXW99bf0ydOvw5YXs2M6y9bE2hNSxNT/
	 RgTQT2RavQ990e2DSvwDxAM6cxbyigu9bSpWOgOyzzthnWCdRgkHAHesVdex6YmzUnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916864;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=a/73MrPa83q5oAyGtHK9/LKyewHpBJcuxNmYG+P39mI=;
	b=JgEw0mCELXtB5e3QFKN8ziJOihnG62xPKRx2vrKkZ57SOKTyAnvJcnu52OrLSQqOlY06
	 lMff1HEiKYBP4b+UzoyUrjmuqUFH820XGenxW0eyZz8xNnZ8taDimicFvuQDmrj6LPtch
	 r/Z2cmAwnSDtEZAqy5ZMp4zM2nVMrP98WgAGUbolsloCTBri2uRL9H5wqR10PkoDGZhA8
	 5A1sLcbo4sX0OSkCkYrbi6QmIAs0zZalzupYVOkLVr3c3UgOly0siqaVHlWtRAk/5DR+N
	 kvuSExsbEqR786Z2Zt9KB2Hb8uQH7FyMQ6j4uxUpC3SHvBXp5H4CTk+ygyvItp9SFBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qOWDJIyK;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0874606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0874606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qOWDJIyK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916862;
	bh=yr19dYIzWevwtOPD6EuLHrVZjpQTApuyfHArd4dpnvk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOWDJIyKzkSw3hMEhIDFXEn5vHffFFfPv4ZOjxaEA6nTLU1rjmB/e/k3uFLhjvJ45
	 q32xTUrOt6qktXXc7q9uq2Mx257xUdwjbdfHRrSCd7T54Hcrq4qoTF4tF6Eg900vYL
	 cLfsRy4C9VVNzzpB3DdSd2a6rwxYAJQqUq9yBCA3zXjbAMYjaZWrCQRzxqHaexxONI
	 hJwJPxoqogcWYXCcRWPcEYIiCSXPQbASyrwshcMrkUDvjmbBSefkcNYvzXhMHpPUvI
	 X5vQMxWmFeeT6mWG2apGVXTptt/KClBW9jiQAwPa2KF6m8rPeby/osr30UclnasK8E
	 NolSjC4ZjDD9w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CAA2C17E0406;
	Tue, 17 Nov 2026 13:01:01 +0100 (CET)
Message-ID: <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
Date: Tue, 17 Nov 2026 13:01:01 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261117113402.728183-1-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117113402.728183-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 12:33, Luca Leonardo Scorcia wrote:
> Some display blocks can be used to define multiple-output pipelines.
> The current code uses mtk_mmsys_update_bits to clear the mask bits and
> set the desired output block bit when initializing or disconnecting a
> pipeline. This breaks multiple output pipelines (only the last one set
> produces output).
> 
> Fix this by using the block bit alone as mask for multiple output route
> components.
> 
> Also address some unfortunate copy and paste errors in routes between
> OVL<->WDMA0, DITHER0<->UFOE and DITHER0<->WDMA0.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

This misses a Fixes tag.

Please add the relevant one and resend.

Thanks,
Angelo
