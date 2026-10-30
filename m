Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347299;
	b=JabJfOImzKNDT4ZeXC6xbemvVNoOmlXcxaCf61dIDTw9yiBqxWg3jx9enoz7p4LY846J
	 Sz/rALwKirIJxFZEIHzLsPO5bmq9vTG16Hy/Jfa1/yXdZM+8O24EQf6azgI93omJnypkN
	 X+Kd70FaLiFgD+aOqzlCM1LabVaZ/XnfKIPE4JrJvs7Ut8xSzOFO+5LL3axkET0Ziw2YM
	 R2Jtz9e2kapPIHkY9gehAS5aOyriBP7PXJR1lMlTXymToZZ+dkxJllD/lLKqdcriJ1x92
	 0tY7DGNSzSSAwyyTi/9+TTb502/0iUznPFCABR0VoRwsYrfn9qgzKppJXgfIF2YksfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=uP8ou9OSrhsukg4Hi5jjDWDyb900vCyqUrqKeXYl4uw=;
	b=oQgL46JxJ/lI/lQOuKhi7p9uGLt8QqdmH5UobKngfIf0N29aYg/HH8O/2NwpUZhdGMWX
	 pjrhU43YGovp7sbg17f9P8oDEoA29/Mm02/BvaxrMja1B7COMewEChVC3OQAsrN+8Tkzs
	 XGBBaOk87Dttbdk4bHZjHErvKTcK/n2b9+g70uqheXO7SqINSCaLDkzSs9VRTI+iLnbaj
	 5UcgaptTYA2NvPtCudga0OoDg7BVMsifjV3gPcwiVJ6Cg/2l/zqVSe0b83/RIdCZY6b0N
	 5P5h8VUYL5ZNAAkVtZfHNHjEQ19TADQPuKDjqzbQM59z5pIIBTrQuvlAbdVA5orenJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOSfpZbH;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD31F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD31F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qOSfpZbH
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so1855265eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793347298; x=1793952098; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP8ou9OSrhsukg4Hi5jjDWDyb900vCyqUrqKeXYl4uw=;
        b=qOSfpZbH6RKU9AuDFQPj0DC4UuEbfue3MUJYD2VptaDUszoOQuhxWPMnLMzwRgDlRy
         rg1CoeEVPl2ukcKiOYxYI67Ijm8dUgLOmNWDib/c1sZ/o6xxIGqDxifqoPqY5JrNZLt+
         hk3XhDUezxFarHxAQj1fzy26vJinJr7rv4RszQgd1hjmhnJboWrZ5icP2m7ZV2EWXbsR
         Xq7RfvY4FhUmN796j+wB4ilaQbmBWxS1TuquIGXdX4rDVHcES7+Cy2688Zl1PqaFUbhV
         AKdkbla4aThXOBpdZthhBdquHgvvIE6e7cJq9R0OoUEHmeJ1vbfyTu/WaCsJV3Gz8s8Z
         t2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347298; x=1793952098;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP8ou9OSrhsukg4Hi5jjDWDyb900vCyqUrqKeXYl4uw=;
        b=Z4u7s9llVx6oYyjoFEMQKNpnN29JAGmJ5uhLqJZBdjPNsl1AN2dfxLVdC9W7Vdq5R+
         QrHnIQsU8882ni/azDbAl3p9TNl8n8XSZWs+S8higeD5n3n3FvrEv8wk1h8az5x7xPcs
         tgQdjIZTcFhHdoX1wcIL+ZiTD3GmKwQI8Pk4l+ZQ/3QV1iTWMpx65GXbY5KcAKKl2QTH
         7c6dPI72OkWT858d24ztbeDUXXEa3QVKvCwUwSVPNWNpcvNHtTbAmR0Rvw/dB93qDxyP
         HEhv7u6zgvmCim67TIO8F3tFfqL5/zT6kodR9mYpyJ0qsfNetIv7XMeYlujsqpR32lRr
         0aqw==
X-Forwarded-Encrypted: i=1; AKwUvBwuRAlD6WN9ZUjVzyScNajD4Zp3Sg8Hf+sm/umfrw3DHa/Pf27C3SEzXmQZajYZo7zzpr0vD65pPKEj1+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl3DzmjQeLp/EuIuF6n/EVwmzktPUHAZv2Btjl+k3Wrg8Dp5wC
	uOM+98GmPkB6SushNBCJ7FrkKCZCeFDX+rfOZHoU0nmXES6+oIvKaDt/
X-Gm-Gg: AYBFou0vOS0vw53G4my+ufI7NFeDig0Jqt9m4xgNnZCXk+Tlkq9Ffa1PIHK3oVqOF9a
	28GvtuGTqYo0n/ySRV1kpS14GCc+C7+oRjN2ea2c5CvRPtfXJIYHpzUpWHFVUX48/qOilhrUmC0
	M1O3NBIxVYvWAEAWx69hKCYpW3RPZ5TOM3JmPIpAcnf8e7gzj9usxOXnudWOaiet7s0PZLaNGw9
	4NjanJ8kPo6UWSkR3IveqgJmRZCfLxlIEL9try+hnXbeNIY7zHITXjcf9ShyBzvW2Gk70p0AsAE
	N0pqdwwECUaGjk3wbBZpnl5WsEfyUt+vbfh1LgyovsX6SAwxrw5irk9zAWYQEJfrjwtNBV2uMj5
	g0N6+bkV4g9H7YBcybqqVoYSdD5yUnz3dZ/+edzpFf7Jl4ZS/hS1FdfueyfIus7mSkbhGKQlZSJ
	YmrQ2JJN3txaXH2Cq5nh1Sm3Uxqebbqjfcx8sKFwddVSig/I0DnleRaweMynLtVcxHwjX22rSEF
	smZlS1zNbOL2XRgg+C/ld9F2H1Wn74zGVMJLSnI36RP4AAgyhWB1Wg0Gcjcdt8x6Vz2n9HlY5vU
	rKqQnTBotaPK0Tv6/nNmqrb0/vfTPRsiWuL2ox4Thu6YelWaYzXo4Ey1cW3I7DyqJX8v5zBQ7Mh
	e
X-Received: by 2002:a05:7301:4683:b0:369:fa21:ba12 with SMTP id 5a478bee46e88-36a30009da6mr6910491eec.7.1793347297804;
        Fri, 30 Oct 2026 01:01:37 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm4986017eec.13.2026.10.30.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:01:37 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>,
    Chris Mason <mason@kernel.org>,
    linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: reject zero num_stripes in the system chunk array
In-Reply-To: <6ad220fa-d6a0-4b4c-a313-a0cc052b8637@suse.com>
References: <179328314071.648427.12527832319954042748@gmail.com>
            <6ad220fa-d6a0-4b4c-a313-a0cc052b8637@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Fri, 30 Oct 2026 01:01:30 -0700
Message-ID: <179334729054.2353588.12398743988940745859@gmail.com>

Hi Qu,

Removing the ASSERT alone is not sufficient.  btrfs_chunk_item_size()
computes

  sizeof(struct btrfs_chunk) +
  sizeof(struct btrfs_stripe) * (num_stripes - 1)

With num_stripes == 0, the (num_stripes - 1) term underflows in the
unsigned multiplication and the function returns 16 bytes (48 - 32)
instead of a valid item size.  The system chunk array loop would then
advance by the wrong size before btrfs_check_chunk_valid() runs.

So either btrfs_chunk_item_size() has to handle num_stripes == 0 first
(for example, return sizeof(struct btrfs_chunk) and let
btrfs_check_chunk_valid() reject it), or the early check has to stay so
the size calculation is never reached with zero stripes.  I kept the
early check as the minimal fix; if you prefer centralizing the rejection
in the tree-checker, I can change btrfs_chunk_item_size() and drop the
check.

Thanks,
Cheng Yongkang
