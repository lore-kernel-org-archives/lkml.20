Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690308;
	b=gybOCKJc4zj3Kiq2ddSUA+EmxwosjO1rux1f3fcyxJqbmDe1BUCBD8X9AQh2enpgYIhy
	 ig1v96XsH/u7DvjcVnU8yLQuBM8Hcs+WUkINafgoypkZe0V+yQKWZw2YvsjfZ/0kqfC53
	 q5+BegjvqBxdDnB245RK8W1M7ymW19Xgo/VkbTID2AV6I7lecMZDBhuooOQGKwj723tOP
	 dKY8+8mJPvzrdwbiHQUYR9NHCV1ceopTX4gfzzSV0q/JebJ79TVZeItl9CG6RXpQo8NDx
	 g8W8ohURphS//xwWzn3GlqLGs7Wzdy/LP3iyO0JolW25UAx2TbM2ZUh9JHrrKa4BTZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
	b=Fruo3yeBnxPQAsEfWwxb/jmPzW93kdm1uwF62Esm3/LpKpN/m0aRNuwdhQrbXEWp4n7c
	 X6TcOvrZnXKIP3+OtNSOO9xiD2bMQplbN+bucqGTik1n9pZ2xaj4512tdihVbXjopHxum
	 LmrKECwF+kGzHOW5zaA1vrhqY106SgGE+tXSvy5L8lAcdFlxNtrW7Ybu/A1zJIr/FNEzb
	 RD8GDUElJk6OXOKAJCHbl83ECZtHFp+C69MlHbApAkT1pLTIlXpnxnKXNB697zLuyDmMI
	 nIugPkaAr2JtveopIUkH9k+CKOv2pPZQEwoNXE7hgoKXziukgLsINZTQyRCGX2YaYTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89905606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89905606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so2782851a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690307; x=1795295107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=Fb5v+9t5HQpH99lBDL6eSyXCd561d6T4RIG3tul3obk+hV+lLvqwx2E/a53VBrruzj
         C7QdCNRUNH/J3utrvpe2c/geGqZ5Sl8S8ROXMNSnD6HIxac1Ng+Ry9w9h6KKx9WqPGRk
         nL5/soLI9m/NrOZQjEKC8IeWYL9z0hSTP62ueEx8glDPxYjodiB5UKN/us3YZ/pjLuiy
         jR7DawCFm/DODgpczCGYTo42aYB6PExJBlNnAUTnFQ1VK90sXBu/fB3nC7A4lv4SEGbL
         FCfXgTsCZXAhHYy7HOtrxslAD9W2+jbfWDGJdsvIuv9xo7so5tZou4C9uFbhXQelwj4a
         ryLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690307; x=1795295107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=hMq0ARnd/nSPhqJs0+ZCc/kKFv/50mZqlAJblUZ7enhffnAmDT8gigurwaPQFlrMIm
         broF/1dpQj9P7Evxh4nDKYGCYNlYJzmhLFRfPE8Pjpo8GwBQnbO0GiE/OgsozHtJLhEI
         RLohl3bU5NCnZ/kYtS0u3j8oNOlOW7VjUcOWCeKwl+6RP1pq0HKNYULK5dMGFIIVe9U4
         ibQ2xJiFxIg9vJhXjdmeoIhFHis3gkKoeTm8+hOvDCem5WVjcKFHMGQzPz81XJL6AgAi
         BT2gcj/BeDEeWg30Fhd1vkg4iwG6AXojeDrqdz2YSDyylSAYuhxwt8xzUIwetR84SxOP
         tSZA==
X-Forwarded-Encrypted: i=1; AL+hErEao2jLUpKV5DZwziMmehcz26HTJzYW2CxWK/8iYv4Msyxk2gJqh7SvZme+Ha+Da3WnT83KSUaXllgPMoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8KNOiRAUbbeOlwAmgHd9k5U8zUvkvF6RkyKhH6VEf5kMIgY0d
	0435bV+DzhRJSshpR6VjzLQccByhGPZT9TGrYHvNHulZ+t07oYaRrIzpJIKE2JZT1g==
X-Gm-Gg: AYBFou2c1EJoN9zwOA1C/TygSUOcM3I2i29f5rxQIrbLTof2bNRtfyYoWgeGftcd8XU
	r366Cu9DhptVPQnDei1k3Pae3zCwzkZw7knsK5NZQxMYrg8NkMzGfwzhikriEb0gXX36KBRJmQw
	YF6M7lhvs1k7TfuQ09cnUqcgVSIHKbmAB+Y6v63IUnYBukTpJzNZmrXDvELscGl3hKD8TjKteiF
	1dcYUfcSVBLRpl7SmVEvs+ipxJenANvCWJ8K2hczzZT0KJ/GkXwrvQpxxr4buv1J65lxAGghVVj
	z9kGDg57FKjtk04QepdYMK2QXcdRF36j8GhUMwNkMzhgknrSOhb6bLXEiVriHMannJtRsUtTQtf
	MzSAsb+kYlESI+08i/CnqDhpFUDTbNHMv0YN6tQSxgWQn2PhbETTMRyuP/LnsPNNeDZd9HbvnR+
	Ad6wXsia+3Qq9mG7Q/WlaNYAdwUiJtpcXqqjZHpe6reC5x8czOqHQTQb0cyBOxras2UkZNnvFCf
	Vw3kgW6h0TJ6d9n/1jkpSq+4CruXi9OQiSvsEIKWEFCjqSlK9e8XVd6g6LrhnAxLN1raXpR2K7e
	M/k7R1/7FQjWN8t4+kk6UGV1UkJeRpFoPTERRH3jcn02dnf6T5nitcrXZnosR812+N+FrtJg9Kh
	3rWV5p/olaiiRdMhVnLrMrY+OUhxZxGGRxsOJq8p13QgEwrHoj7PzUQRa1BZQGnSrkAXucQBrPs
	r7Nx2AIpdgslRvFgftKnVDhmRCRU9ejx/hbOLSZYb335rmKeiGY3BGLTsxk7b1Qa/n06Eer+ctg
	BRwsitKXs9FFJnJu1UyF12ofY/mVYPavtmIGCUSdDGezXuV4ZOkSXN6Y8ALq00PVpn/Sey3Q/WH
	4gx7/Pom0WvoKPc16rHH79HH
X-Received: by 2002:a05:6402:42c7:b0:6b7:eda4:e136 with SMTP id 4fb4d7f45d1cf-6b7eda4e281mr1321653a12.41.1794690306618;
        Sat, 14 Nov 2026 13:05:06 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361280sm2705836a12.10.2026.11.14.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 22:05:02 +0100
Message-ID: <20261114210502.787195-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179468119953.2168702.10813567320493574993@kernel.org>
References: <cover.1794139176.git.julius@bairaktaris.de> <179468119953.2168702.10813567320493574993@kernel.org>
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

On Sat, 14 Nov 2026 18:33:19 +0000, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Reported by the hosted Sashiko AI review of v2 2/3 of my "ipmr: forward
GSO multicast packets" series:
https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/
I then reproduced it with the selftest in patch 2: on net, 6 of its 18
cases fail in 2 of 2 runs.

Julius
