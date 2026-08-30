Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557154763
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788125300; cv=none; b=nsHva0nI1aXANpqOfCpiA7Zi7vJaPLVl3VplqH9Cap0loS0X2mvWRtzZfxuxskeJ5y5zoCXUSeVmu9c1ySFa5IoLbMTkYFcR6beEmIvgfvUYCEfeRW8MdmSvbEbQffaHqGo6aL1UkJUOja5HSiFdJ0WPUavdKtKGhVuJRupd+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788125300; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYFqRBeh2Pp9zWzsY4UooBuBLi1PvcUnZF4czKAgIENGAl+Urw/5WIzpt3QkqnYftxttoZSRzW5VQNV4JTzxGWtVGvvyQk+heYeylzkGT3r5u7KFc9xsnCTO5d4msYsH3gdLrHr4weo7DKWo9NxzDu+JF+QsA5hLKPtv0BbRUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso38261365e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788125297; x=1788730097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=dSGnxEtKP3ALVPax38w85mti2lfPVj9FoHBPjFrW+njBBTn+qiZZ0ahsfU9lZkLhY2
         ycS5kzDWLlWISjspQHgdpBXC2wE4IttvTmmpD6PJ+QNZJH5Zi9BEjijt7ZxT9HBXfJCB
         FbdGwDs2xhxFYNhw5IZpSma089JnOX5t258Rba4Tzkz1A5hgUUVVVGZ9QkicQqh8QIha
         sgBTnLC+1m3n3NMZbVUFYeuhY8y9Ee3s+JAOeRrm1avJOMiqjUT0+UJ7zsgm8owH2fsQ
         gRWiRu29s+D3AGIWxX2ytZB29S3WeKHr/YztW0Tys2BkfOJDaoDx6s3VHN7d9wyD+Yp2
         MXNw==
X-Forwarded-Encrypted: i=1; AHgh+RqjhwfP36oCf5EwcCHEmQ9tUcbkIeAAPCC6dm4dytAReEgj0PEahGWfO9HN8G7b/1KwYtdQyF99ZGB3tL0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ0oYlTksTKkCmn/z1CBi7V62z5RXiJ76SYrxa4kqbpduepi1O
	F/m+CI3xfnzM8oVZQqU0oxWkXnJgEiPUp2EtU57nWyyWWTCAGoUKx423
X-Gm-Gg: AR+sD131X+Z24t9ZWB/IdH+xK7qtxUa0My8UfBHUUmbs6C64jg3XA3S+RtV4Bp+GTiG
	MpuC4EoN2c6J/Dl85CukWomTNX7grJA/DULncLeg5KVYnpsiKRFZM7zx7nv3IbIrxmx8Bpy2RMl
	nvWZeUUKFjDd6tC02+fsM56ml3nFkjo4DQ4uwAblJBX0gKRU23Ni4LyTqR3A3xeo+BaETVfwgVv
	v54zP4F7ihiyzdCWZNzP2CIQftdQYst8ibn3XjSkF3WqKwE9juVCswYtoko/Hy2gPqikT8eq1JR
	VWqhI0Ftu1yLpnAyuKuvBnDc6f+rWDyqg5vPphwqnaKS+MBTZFU9muLJKNnkTiX5ttX1ubUnD3c
	WfSNQ1arB1Y27+rhV4zGL9IeJpy7h0cJ9E4TSz6mMaDZtiQeW0RpVYbnMeSLWW9kSRFcH3du/cb
	28lynpKRy/5amIx5xlc0ZmX9/sZUgIuSVdpWhUgnz/drYjSwA3eS5Gyg0may+ydzbWbitvNjTFA
	OoUj+2VCE4hx56pg4gO1w==
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr140900095e9.16.1788125296808;
        Sun, 30 Aug 2026 14:28:16 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af45sm9074554f8f.9.2026.08.30.14.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:28:16 -0700 (PDT)
Message-ID: <62abbbbf-e0ea-4e06-af5c-1e1854ea6295@grimberg.me>
Date: Mon, 31 Aug 2026 00:28:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: reject namespace enable without device path
To: Seokgyu Choi <tjrrb0313@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 syzbot+f613f9f010ec98eb9d86@syzkaller.appspotmail.com
References: <20260827075221.312935-1-tjrrb0313@gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260827075221.312935-1-tjrrb0313@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
