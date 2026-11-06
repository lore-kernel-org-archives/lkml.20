Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959990;
	b=OXxPtYGdAAt52/AFFzhdNpZf0YeSJfJ4JaBOfleW06P5rCeg1etHQ7a9ALB5BbmItB2l
	 wU99ob4ZWv0n3YJtY+/NSi9x88FUv10sSqp2U8q4+y6zZ/zga/uCh5X9VkXYLCFd1Ml+3
	 2GR6xgD8gGTB13vQ3CXlk+Lxxfdq3MEzlamgDFaySx3WcJ8tmFRKxErNKTWFfcHVVzFsL
	 yugKTTDf8Oksvv4X/WcNeOVenxd5u89LlMmBe3cFhawzc9EDsXLp8fzWirCqh3d6wLa6G
	 89aKF9rJdyANLuWO63fK2h01jdDaQutCo5urYSnx/GHXfZwV5iqlt1fqt4vfaZIjGIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
	b=3Dd/vkumC35SUtkQAt/vV54CY94NtldV2Nhsrm8hnc4zDRK56XLkEapKrNc/34+a6rbo
	 zW/oRM/FzLCwSo+uWWRO/E6A5o26BWEN21J9pUtkvpSvNKNVTYaqEeNkcGJPZlQWjqzG+
	 UPfB1yNRxWNIA0y4cNDnvESd51v7HzMe8p0mt+pHZ6eTJGg35hzljLHqkH/0NbHGVttc0
	 jV5JEOTwfjyp4gNcv8ure0+oEcBTf8YywmRro+C84T0RN0pjiBIhQMQAFeaopL11T9/5I
	 G4aRBWgN0ydDJTz6RuwQtykqTedgtdac4OuRmhN03TfyoZMLWD4igbQA/t7MzrhmOYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OE8SYys1;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F89606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F89606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OE8SYys1
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491d1f66968so58287f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959989; x=1794564789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=OE8SYys14SGEQ18Gg9x8d+GY94o1JNwz946nf2Bj2Qk5qyrAszX8A174fQSdt8qxEf
         s7EbG5bHr9mMoCJpYNHU+kAasRyUw26z341MyjTmBCGi5gCgJq5AqlHsQAfVRhdNa8aO
         bi8giI8VJgMN1grQpRT2qOLfTUGKQ4/Pcxp9c+QW9H7Mtec8AG33C+S9W2CmySoseSlb
         q4AS5y9Rkto39r++XzgPuGRY/5WdO3WLekcsYzoaxQ0Nk4yZX5U1VH80FiZSmfZacVeM
         Eh5b+FK+A+z2fG4ua5+L6IaCyLYlBYOX/3XdJ6FaMdJ3187BG46uin8XovpsQLsIK0iv
         yC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959989; x=1794564789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=TeyqrjISplbPyjQrUacWyYIkrAwkDfazFbnf+hqMIrwR4umtJqYFwH2jDTkOcEPhGG
         fWNZNpghnZLulpLoEStF2Veo96rs3TOVmv+iUqFvkbB+NVpQ6VbzSXYPbAPVdvj2NY1o
         MoTaVMzwZWelN9ndTlK+MNbiVlvE84kQFD5U2sFL27o8jgzuOLhNzl+ysFb/Rq84MMy4
         wYhQi7vpxuOZTK+8yunL54sZuz02oe9Q3m4XfmQUKhtYwQyTRxluI9PpwQVPWSNesdCf
         JihRYaz29HYFbWcJN+Jm9IKapz7farUuktwX4HKIwM0uZ9freqoCXR2nVKBlOX2r1EeN
         r/uQ==
X-Forwarded-Encrypted: i=1; AL+hErFBBi6tfE5qpTMnd9SHx79QzyIyGe/Tb+xGN8kOZBbOSpokjsSS6d3hTq1bEtMc2EPEuZOpM/nrfQo2JLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pFXI6zM+5MHvzKiPEZuuoYPDNFQmMbiH1mlbhpV7ZwGFF3DZ6
	I8x14hIJy7/wnkgtl6ATT9MDhv1VARlaJjg1Z75zbOFYlFfOvPZRS8iw
X-Gm-Gg: AYBFou27Px9TMvDhHqRJWuli//7B/xfG3hkI1nc2Owoi4pwKSgnZTTIlYXkx3N/z6M8
	O/u2UZW6tAMw/+5W0xUTmBkYbQjGRM5VYgscV88tQPXE9/ph3lZwnyxpuac+sawyqoU7NGGE995
	9h3o0dkrxCjNbbEecnEtoi4EpW7gXfYIS7iNiSvaIHX9jDHdJxIL/SEdq21OKxbzzVOFU2hS4JW
	31J8xTK42akFGU6rrMmkpDK7Di2Lp8EbNG92NQqqC3uTodJQ0RMB4yU18XZ1CRrY2HDcyUHAheO
	Xe+wjXj5LftJRHcblIg/qvI/yXtE+FLjQotR9aHhM5/DGygmgN3RQkw1PEWHYXJWNTw6oFxARlc
	Xy3Wr9wwH+w+SgqDtvx5Pp+CRnkIYOwzGMxpjJa1YOHW4bUvw4VvPTQaYDGiFcQYzxmOKKJhjE+
	zV94fufxbfP3aqa9kv83muEee+vKLYJ4mCIylnAC7vzib1Ux9kZOIemp1KaPem22+7tMIJ9GJ4K
	9YKlJ2U7zyggV2/4ZbidYMmQic22vynAvFiYtMQ51V/yBFl/ry8zQlca/eAK77aIdwvr8d/Vlir
	Z2XvnZw2UKQ6mgi6Jff1qpNXlmc1TSCtLg4WHxyFZPdb1BHcfa6chiBv
X-Received: by 2002:a05:6000:27d0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-49276d4d926mr3096819f8f.32.1793959988755;
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm2934846f8f.32.2026.11.06.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri,  6 Nov 2026 11:13:06 +0100
Message-Id: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com>
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

Hi Navid,

On Wed, Oct 14, 2026 at 08:21:04AM +0100, Navid Ghahremani wrote:
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};

My unit has 256 MiB. It boots anyway because with
CONFIG_ARM_ATAG_DTB_COMPAT the ATAG_MEM from U-Boot overrides this
node, but without it the kernel takes 512 MiB at face value: the
upper half aliases the lower one (0x50100000 reads back what is at
0x40100000), CMA lands at 0x59800000, and it oopses in refill_objects
once ~300 MB are in use. pp@5da00000 is then outside RAM as well; the
vendor kernel reserves the top 64 MiB, i.e. 0x4c000000 on 256 MiB.
Does your unit really have 512 MiB? If both sizes exist, maybe leave
the size to the boot loader or use the smaller one.

> +					macaddr_tag_1e: macaddr@1e {
> +						compatible = "mac-base";
> +						reg = <0x1e 0x6>;
> +						#nvmem-cell-cells = <1>;
> +					};

As far as I can see nothing in mainline implements the cell index for
"mac-base" here, so all five ports get the same address
(f4:f6:47:0f:42:64 on mine, wan included). The tag partition also
stores the WAN address as its own record at offset 0x36 (..:42:65 on
my unit), so a plain second cell works without mac-base:

	macaddr_tag_36: macaddr@36 {
		reg = <0x36 0x6>;
	};

Agustin
