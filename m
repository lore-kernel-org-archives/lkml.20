Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797168;
	b=gV37lZ7xM1lB4FvS0g/8pFgZW31LH1fT1mZnu7ADeqwePU/6kzuGGsOMqUurf/utgTcn
	 SkE7RmtfNVlR7gapCENCgXLly9tCI7QG7peXns3aZSIr7xyzkhz56w0ymvF1iqM8+jqaP
	 4hs1t+yxgyVF6Z5h6rBQpyt/hUmJIvRjUMCX+nCo9VR8/g/gX70svfvySwYDmA8KRBPFv
	 hGWcljyeWytefXqXJbI39LMHOfZw9v2xkC6AoPAIcsrOrQN30PU/ECaT6O6duFcjXv0ei
	 y4sz3Kg9AJA2Nn78I2SkdTb5g0VqDtI1/RNVdtziYIgl5qy95+jMkytrrixmtF+4vpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797168;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pNxgrMHWVSbBxJj3lxfx9KSjiconvC2KNEq5RdZwjAw=;
	b=aiMysFYUKomImU5/NA7hXuORn9NzCVxysS90JTYABnyZRIIKIDAisgrQ8Hlri+/BEvt2
	 j7JeKNxDuDzYcAjQE1CjtlVTqJJFzMK5UsS3F2/3OrwOHApvE4vgAScaMxhZM+yDWaW41
	 Vi6nH0ZfmM2EIOug1h9+DWlQVnWAFpsRHX7Ahsmm+RnJAOk6vGcw0G8+opqrBqE+TAjjo
	 ty6s/6zOWLD+sEmdy1KHmP/wCOZ4v3XOpuPvjG5L5CutjKJRdy1QRcNcnpVadZL6ewoaY
	 tEI03h9Cnd07h5dXq0RMSwSY/ZbwVT1KZVve2awayhb5gjshAfnxIOwR468OaF4VJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XG+KLW43;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B35606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B35606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XG+KLW43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793797166;
	bh=K8BLkcf/SQbFI3BsLcfZZ5IkoqAFtMgOjn1kywYClq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XG+KLW43Aafh7ugqxgWUYrZVN12y9qQORQ4SP3Jcl93vPJijrwfNKhSSAQMNI2qVG
	 xhwH/OlCGhdhTxSJCzRgSY24/J8p8nYrnwyfJTyDVqW3ZFud8WSqBE41IBWdiC51bn
	 oWohAisBzh+C9Lnw7AEJqt68wZ9WBJLgf0ddjm62oRMIo9ZuzlnIZEK7bSCYKM42S2
	 NC2W9nk94kLMc+E80xofYiN11yBNbvQE+XxZwqgG6IxxP/qrFkCl+JJbjH751W1apd
	 NTZGnHHUJ33JcItd/hYFAPnscV4hxSRwnu7gU7Ay3YppYv1YCk0S30nLlqr3vJiepM
	 U2wHt2ULrdatw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B345A17E0418;
	Wed, 04 Nov 2026 13:59:25 +0100 (CET)
Message-ID: <b01dd5c9-258a-429c-b223-ecb329aa8409@collabora.com>
Date: Wed, 4 Nov 2026 13:59:25 +0100
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
Subject: Re: [PATCH] mailbox: Convert to subsys_platform_driver()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261104113324.1634161-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 12:33, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

