Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130439F190
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087889; cv=none; b=E0wDYW6Bznc4yOHIMCX8U4kguqf0KsC1XyN8p7NdNoA8i3QJrOp2CXAZEpGDeoDuD3/LIyGO0qYRuiiwsjMFtxGNjkw7LA7IGmqqzkthbp33POYhBt6/7z4FqowD2j4k47OoPic6kKs9zk/6TANRDL6lCwnzBDsxi9+JcLK4yoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087889; c=relaxed/simple;
	bh=HCuB+gFmzl0g/zR4cNGVTw4/bKbkM4diHu14JZvhNVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUwTngNjDZR+/Q7ayOR9rK8qhGy4nwISZHHnGaKjhkUunn2AVKRtbdHvm63QMKLlY/1kXdIx5CfocuStbqyUHpQ8L+ioZILe+8UuX8q9IscZwpIE2njKFrm7vmQb8RaIeNkQVeEiiymGqY801OWSt5Tayj9lcTFMRnJyGPAq0Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpRU2gAB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpRU2gAB"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304784so3732659a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087887; x=1790692687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5WbKNwwi0AYMaZc+AxKq3GAWdEMgZbscVdbl5Zw1Yk=;
        b=BpRU2gABcXysqVKgWWLyFEnFt1g+FBXDuuOqumMIKCdArAtK2wLYru52uM2URbIhCt
         HAhxGaXNOqrdZv/R4Vvmth7+LGdhBcwgXOaGeqbsC9FInoqSydfqGizkzL0yv3x90nOu
         xBTu15DoigOtjC498pwO+Lgb+UyZ4Oq936YV4XbvRh3CYzwXxRqkxZbyw6Na8YRdKCn4
         lgdQTHfonjvFNWDRjUf/7H0Bj7qzV+IZcudE5eTtvQp0yyQuODaEJyP+RbuavF7yjcLT
         nQfOL/k1WyqNPrMzoGKS0KjmLAFVHc3ic2wPc8NP7wSN4Ga2jdQJORrWZpBNYp1343cT
         WexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087887; x=1790692687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5WbKNwwi0AYMaZc+AxKq3GAWdEMgZbscVdbl5Zw1Yk=;
        b=QldHonIG0b9PzD6XbFToKmVadQylu+ZBlSnZ8BnYAbF+mBIwgFuyQyno5Pjf9frm+s
         +TfJTCphx64xA2TZb6rgj5SGiPF9qwnI8Hc6lujSC82YcAKy4o2u1SuUOJhzTJ7jEcdj
         r6RPbTzufrH4dE+Lwy6k9zPJII33tUR+OcGfgC6NT1kximd90BfeA8NbbvUVxdWhrX6l
         G9xhj1NtA0uB4Rp77Uo8Pn9dZ5KOERBpU3lU8o3X5XZGMD0dOzGyV035EbmTj6x9Qjz6
         YCJRdrJ4Hz+H70OXDvObp1bJYYSUaYLZF55IbEYZ8zqciosDIvEeinS7ekzDhqgipbH+
         M92w==
X-Forwarded-Encrypted: i=1; AKwUvBzUneIF1MEIhi8koI2IUvuab9vAHGCb24ep5ikuqX/MgGX6HbQeNPSjrOdizazZ1j8rJFVtr0HgaLho3yM=@vger.kernel.org
X-Gm-Message-State: AFuF++lycHlJP7JTbOJATPeiGY+qLP4ip9tfdk+VH573vXy4eRMkSqbW
	uZT2uMMnmGyjR1QkmWmQ8+Fvuq4ZlgAlWyvrSduFiRUBdduTHe1srLTM
X-Gm-Gg: AYBFou02eLdw0THfDuuqcAWWhJrZ4xozLL5fvwAOzR/Z6xPWwGRGakvSON9DaAQ9sAR
	HEn5gz74vZ9s80qpAD6lHql7xmrPTIRL7NRjAZDidJtIzo16jsQP0wXUFUzN9fZJNeCv2eWJb/G
	OBBDJsilN9VFDWqiw1qd5FM5spILAXPWFHoo4WY3GS+Up1Cc9V3Mwr5ZZ6Evf1rpH5gUVX7zeUn
	PqkOb/k/rgDRhepQOQLtSzIChg9x1bKjrb2QxRYwmE1PS364ERhjK733hy3QdAknvuCLYSlhVBT
	6064IW9UshEBxQfYus8NaVI4AoBQk9SXc2QxjCsbu6xhvIraimeAtNcyT2qusD7O+NLdp65OCA+
	rsVxy7a2yqYYLTcncxWVN/ZzW+eyC/7HYAOUOCQdR+uhAMvSea10iD2gRDKKiy0CWqlddp78JVX
	y39jSd2iiWaxlGTlskefS6OYGM8GKjvHhEmd/LQ5o/58JFrCFzPANQQT3n9dTMq7E=
X-Received: by 2002:a05:6a21:4903:b0:3dd:a006:7b38 with SMTP id adf61e73a8af0-3ddec802498mr1827982637.55.1790087887162;
        Tue, 22 Sep 2026 07:38:07 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a1d386sm1084658a12.10.2026.09.22.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:38:06 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: ipv6: keep room for the mac header when growing the headroom
Date: Tue, 22 Sep 2026 23:37:54 +0900
Message-ID: <20260922233754.2241064-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <11c3ed15-9694-4b03-832f-6c49abd742d9@redhat.com>
References: <20260918-seg6-maclen-headroom-v2-1-4d370af55b2e@gmail.com> <11c3ed15-9694-4b03-832f-6c49abd742d9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 9/22/26 15:46, Paolo Abeni wrote:
> Since all the existing dst_dev_overhead() users are touched here, I
> suggest moving the max() computation inside dst_dev_overhead().

Thanks, that is what v3 does, posted before this mail:

  https://lore.kernel.org/r/20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com
