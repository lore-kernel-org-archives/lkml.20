Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C323321AA
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127005; cv=none; b=D5YseL4lOzulFIdov+jPIX91/1nPmN0ldplK5SaYZIquoG5+vC2znMfA5YdBt86NFslafOVhCtmKZ11jE2EyNYp3mEKI/g3s1ldmnrxuQmzRte9yOurkPe8cEiGSt1KUXRCH22dZp7Jlx4CPDmvX4UtYcSVE+hqoqISCb1CJ5Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127005; c=relaxed/simple;
	bh=2zN3S1e3R1V630IVtUPoqa5EYqZJXCfdR3IfWYtLFaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cse0Ctq0pQvvA6j6i2UTS59Mg5w+F8xMISitvieXGHphsgh5fQobG3YK7+oVPkZQHndOprrOnzothRIYsw0gA8ji837z78CI1kq8YrI+AW+iwwC7zwIy5/OFwMICfxSmjZsB4bXnXRusm8AMEf7zeiu0nGLMyn+rQIbbHKTcQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b965570d7so25216245e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788127002; x=1788731802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuJOe3GXp1yLi6HGLhOGLcLd6ROOLjMJGjbmgFBkKj8=;
        b=U6TsFQADM9bMegEUy6Sx0JHoiEZ6tjfitaniSfxX5ikQ7dCrU9MK9Ur2RwDOKqEIlG
         gAUq9wvEY/lKfgEBJo1PWpl+ecArsMVzI11x9Ea4Xaf0PeF+tQsHoCSLCJvWt5HF7Jza
         N0u5UJ0xwgFflfRGsC7RnlUf/2pueffRAzKpbE5kDYbvFQzfen/mAiIoYSgXHSdNAopJ
         Pa0UN+UoRCNWpPuph6OTNEQIuaXna4ijLYAgXnWZJQk4aBk9UbDhRY+IZVX3OKzWEkO9
         TNfJLk5i6AX4Jv2TymyxPk/kAHxzhV/GlD29snJ/DMfqkyE0CjoPZsoj/379uWLKw/9o
         KaPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMlt2MuVOmbu9culqfPDPaDapgE58ndgr4n1FqNhYJCKvco0iZ83JWjuRY4wLlxSS7L/oyfmDimQ/e6EE=@vger.kernel.org
X-Gm-Message-State: AFuF++lRZj/5Bpe/vFtaP357goWs/Kg1hf3/uCctMNrte/TQUZ6Cmly4
	/ydgw/PKPUZcsPGT/TaG4n0jSQmTDE5OqnGHNyi3K4MOieL/om2ZHzqF
X-Gm-Gg: AR+sD12swbOxm5uOh1d0P2o71ta2t6U7hykbltt1N+Fu4H3+CJf9Ji9eLvav091907N
	uSJUZSAsCRQZ951OtTlnHr6z1r4ujMN3Bm+s16kE3ednX/1dVn57Zj9gRAru7JnyVGOkevGLZsA
	NM7AXiaXF9qMLuQacCFX9Wu8CD8Avryl9wh2mJWwpiUkExeGG8Bxvnk+kX3r4DEbZKVfHCf6h4V
	ErIlhKSrOsGleCcHwoibZQQq42mk8U4VTU1HAIBJ7cse4VmZxGGy2CsnXZsdzI0HFzDYwnCR2vj
	FxYc0fQcb48dh9IyQCzt6G9lOeVjhvMqna3XIuM7DbTJIajoTKbaGbnhYDupFd/UWHpGHbAWHZE
	HyYxjt7aYHXniZ0n8CX61idYYeoXMyTzRFv3d4QrW+XsBrwY6y5IOAkpkdbl/Zk5q3mXCuvE+AC
	e+H+2fLeTSxUJXwbcEPFx0EV3igra103l1ZSHVQmiVEHyobvKqdJhwNedM8wImS2fhyADu9a255
	sQp5xyktHZJa4QTWiaWfg==
X-Received: by 2002:a05:600c:c08b:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49b92027118mr290072615e9.6.1788127002421;
        Sun, 30 Aug 2026 14:56:42 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm237392705e9.7.2026.08.30.14.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:56:40 -0700 (PDT)
Message-ID: <d55e8223-44cb-42e7-bb41-d659f206d573@grimberg.me>
Date: Mon, 31 Aug 2026 00:56:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] nvme-tcp: refactor I/O queue setup path
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-2-sgogte@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260824225648.316962-2-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/08/2026 1:56, Surabhi Gogte wrote:
> Split the I/O queue setup helpers apart so that the individual steps can
> be called directly from nvme_tcp_configure_io_queues():
>
> - Queue count negotiation moves out of nvme_tcp_alloc_io_queues() into a
>    new nvme_tcp_io_queue_count(), leaving the allocator with just the
>    per-queue allocation loop.
> - TLS PSK validation moves out of __nvme_tcp_alloc_io_queues() into a
>    new nvme_tcp_tls_check_psk().
> - nvme_tcp_configure_io_queues() now calls the three steps directly in
>    the same order as before.
>
> Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 5fda9661bdb7..354668ad29ac 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -2171,10 +2171,8 @@ static int nvme_tcp_alloc_admin_queue(struct nvme_ctrl *ctrl)
>   	return ret;
>   }
>   
> -static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +static int nvme_tcp_tls_check_psk(struct nvme_ctrl *ctrl)
>   {
> -	int i, ret;
> -
>   	if (nvme_tcp_tls_configured(ctrl)) {
>   		if (ctrl->opts->concat) {
>   			/*
> @@ -2196,6 +2194,13 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   		}
>   	}
>   
> +	return 0;
> +}
> +
> +static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +{
> +	int i, ret;
> +
>   	for (i = 1; i < ctrl->queue_count; i++) {
>   		ret = nvme_tcp_alloc_queue(ctrl, i,
>   				ctrl->tls_pskid);
> @@ -2212,7 +2217,7 @@ static int __nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
>   	return ret;
>   }
>   
> -static int nvme_tcp_alloc_io_queues(struct nvme_ctrl *ctrl)
> +static int nvme_tcp_io_queue_count(struct nvme_ctrl *ctrl)

Strange function name... maybe nvme_tcp_set_io_queue_count?
