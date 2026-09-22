Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9E53B5F3;
	Tue, 22 Sep 2026 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077220; cv=none; b=KtCe+0+c6+rsGr386dKcvG1kBlB7mbj8XD7JjAMgY2RtE700uZWdKAIDVjIGcSbdbu8A/2NSk+TY+lyLf6dqdnLns4g2Z9EITZDfVk+JqENm9v94hc7d1Z9MM0U9j8x6FDm9n+QlzM9o18iA+jj9G5q3WJl4U467JkeW2ZFX1TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077220; c=relaxed/simple;
	bh=IFfZ70kjB90+zj0QtAAYEQEl82esnuhwlzrSu2ntQMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EyG7ptH5olOTDTWlc3TxWZe+1UWb1jqF9ynKi+rBZi9bPuiR4Bp2AYKeBvAErEPwYTrLM7MnqYJ6Qt9X9FY1V1mMMZaSAZnfPHW5+n1upP8qojH3RSSgdQkH7aqwkzphw/ZDxrMKvrQF4yNdHugZzhPzC6Qvp0HSMxIVWSjxnM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XGB5oRF3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XGB5oRF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077208;
	bh=IFfZ70kjB90+zj0QtAAYEQEl82esnuhwlzrSu2ntQMk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XGB5oRF3+j++jbJ96WMoP4+lbPftpA7nKnIh6w74Ou5RlNua15wDD5eOZrRcopdPQ
	 GFaknc/DSCXWjmVoiRqPMqqxgfTVMQAEPUjlprskzJGXkv+Au7gfT0HHhf9/24pwLi
	 gyRqasPj4lwcUtPkjo/u9gql6EFCI2MSIkre+j192Ir1v/35qcThA0G3QReCDgdJSa
	 kppQ7EOHKLOssNjDMYdt9P4kFvFUF1nBC7SGik0jBdTccmXxup+CJVtsacJrTqFzr9
	 3ZzL5/EYwj5Mn7eIclrsREP3orDNHYhDWRjd34I6YvqXFDZtUM7b7p0U02eJv7BOkN
	 Ao7/62ai5wUFA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ECFE17E05F4;
	Tue, 22 Sep 2026 13:40:07 +0200 (CEST)
Message-ID: <99fc3209-ec8a-414d-9838-3a92e133d63f@collabora.com>
Date: Tue, 22 Sep 2026 13:40:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/12] media: mediatek: jpeg: fix buffer structure
 size and layout
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 11:15, Kyrie Wu wrote:
> Updates the `buf_struct_size` in the JPEG driver to use the correct
> structure `mtk_jpeg_src_buf` instead of `v4l2_m2m_buffer`, ensuring
> proper handling of source buffers. The previous buffer size led to
> mismatches and potential issues during video buffer handling.
> 
> Moves `frame_num` in the `mtk_jpeg_src_buf` structure to align with
> other members appropriately. The first field of the driver-specific
> buffer structure must be the subsystem-specificstruct
> (vb2_v4l2_buffer in the case of V4L2).
> 
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

