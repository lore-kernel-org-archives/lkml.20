Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443746;
	b=zIIfSxqewKGDcv0jSyH8FVPAUvJWetP17WcqUiK3/UA0CAHLEJzbe48wVolpkS1REoRt
	 UVQRi0OT5C6f5jZPSnlNDQkm9WX/QWqTIG6QdoXoTzIBZgyvV/KF6P8oI4yE3hj5WCEan
	 +J4kBL/pqbkmCFug5d4r9YHhlE3Q8Ol2q27lWtLxf7c/QxYlbgKD+c6MQ8NtFUjXgHYvg
	 zMAAJq45GpcE/gOca+OteyCzp7bHEAIn4qlT6ivgci5O/RUBRGmd1a2JbmYx5nHZPzZHs
	 Tl9fVa2kkad182NOJ/jH5R+b2LOfSoyiji7JrgZOy7+I0ShYUt1zUri9N4iDWHZtCWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
	b=P2C9khSRsbqPQz6nSNTL/2OpkMrjuB4vKK7Rt8aWbweYOURHrbzDlTQqg/oaRKK3vmc5
	 Qi27bSlXilZq9qWXnaiLWlnnimYX1u4U6rmU7BirUfmAVWcK5yAnMjoVI7vkhDS1IP9MG
	 vc6phKBSNzU/BjtLl67lINCVudV1lWdbDyng8SpAvIUu0155zEjZ/0Bvc0KpoOWtKspCM
	 wyyVR0Ny+m0/WMG7l2B/FdzxWNRpgDHJPHW8pCnNLhIV+meIRTPKExsbL3AmX8CIRpU4Z
	 9YsUJmTO60AWpvTJM1rfSpC+W37t5oGjK/VX/P/XkcZsp/TGRRszv/H4GtLyesEQRyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kzCE3cRC;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B886B606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B886B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kzCE3cRC
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-845788309b4so919706a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792443740; x=1793048540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
        b=kzCE3cRCAcbtIW4yRA5A/bXkTE6gZIcNvunsk0rodQ8EVufDf6aBlmy8FRNDW6GEYw
         R6HnTKj6v3hlY8F1mD6C2NRdfBXeRhPcmRRCKUtmb5wYIeknOUoGGa8Bdk/p2rm/i47+
         1uCIBbzY6eV5wppGndMmT6jy5N6v/saHL9pK0Hgvk1TFlKC/2cjW3IQAN7gxIociXuVJ
         Nwp+a1o3C8nFsGj6GxRkRkr1DTg/MwdGnFUZIECzXondNRQKK5jtUTp2qsjG3pqOeF+q
         dqNYJU7f/Sv58iQn6iN+88e+JR0SninqSkvaE/FclJq/UvP/QNRy8dzOUyKQF1VP68z7
         sIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443740; x=1793048540;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2154pYa/nGznymeL1dNEVNOLzCWTpusHheeHuDCF6w=;
        b=BHDIiLErriEA2RELXNmQHS26W2DnT1woZhqlWfMzwevwq3Z3GPH4R1++sAPltM7iLR
         PRQxDJ6y4n6NhR61DBvwNkrlEoFk1fE3LOQjFyxZVr3/o1/jR261AwFddjp1xkPlAKaq
         cFr95djGVbFVe7BvXSkafz6ROn6M/NzLLkoKBE7k6/MVJso9a/7YPew46Rdu0xA+9jDe
         uXin42VgQfyNzmneOYCvkD8G2/TQXoupVdvUd1DKbddTj4fWMHOAdzm0J7wJfgalgGsX
         yw9S2Tmna/Oo/z4edDCgzfT/WqENrRXf86cDm2O19HInvwT94l8gNAEy33gp0RAPijaQ
         2BkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNtMehu7EhuZWcQR3uuAhPygO2MIEIecicfQIpwwAZODCRZxfjLPzSKu4j7wOXZlpmNs9CcWMOJCs6ckY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu535gfJkL7425dy1YcyPb7RdhuHM64A9ud/3wxqRA+2Bued71
	ChHlVBiO5nCERcl06P8Qd4JtzbBOqoKJF4E7TyAI7KvpvNsJ0Hc1UmPvou3owo7dWlMJn5EU2Eu
	alU2l2So=
X-Gm-Gg: AYBFou2CGtGwPjv18rf5dBDPrsog431lR5k3De5Tw8xBjbAG6I1KzJQjsnVvcnVDJvd
	MnFfCQl1hQ9TVrz4m4KFFoP3QENJ5UK027kIjXpp2/StM3nLW2Xfe8txJSXqbr2dsm0cgrctgsK
	1xqNdlMVY/4Z6JQglwCbiUti45LCdgDA1/i16VouP3IHO9RY5aOjzEiG5P97W+QQEH8vxPMeQ/s
	VN9i4sulQdYbDzXWFJyJUHdZufqhLjNW2umDxqd0705K316XqM60O/TJjFNPUo17mkAhhc4eZwA
	joLbTCeUjaWTpRaipdB7cf4PwdVMthB1araO6sNbXjTOVJf9Zk2GdmPM71/hvm3rrdswqk7YBlj
	CtE3CvmS30Es38lT+mcooAjfeBpsp1TbKz9wt9mnS0n44BgeJdGdBULMgx5ZOTrY9HhPcqzCfzq
	xmSwAI5r9P9cA3kmoQVMCiqmrNXvB22RRHrYEuNwdMCHvlwlx3hBAjpi65m55kgG4pG+YEeDCqA
	C02qpQsMnbesIWY29WSwT05m4KBtSoiutwF6Amyk2d96aIZBG1SkNK3
X-Received: by 2002:a05:6830:6aab:b0:829:2af1:a07d with SMTP id 46e09a7af769-84500787b5cmr8125774a34.5.1792443739705;
        Mon, 19 Oct 2026 14:02:19 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a4a00f15sm9832413a34.8.2026.10.19.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:02:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Christian Brauner <brauner@kernel.org>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261018025824.799245-1-nickolai@csail.mit.edu>
References: <20261018025824.799245-1-nickolai@csail.mit.edu>
Subject: Re: [PATCH v1] io_uring/waitid: return -EAGAIN for a non-blocking
 pidfd
Message-Id: <179244373775.3230223.14647393317404465560.b4-ty@b4>
Date: Mon, 19 Oct 2026 15:02:17 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 17 Oct 2026 22:58:24 -0400, Nickolai Zeldovich wrote:
> IORING_OP_WAITID on a pidfd opened with PIDFD_NONBLOCK completes at
> once with res 0 and an all-zero siginfo when the child has not changed
> state, although WNOHANG was not requested. waitid(2) with the same
> arguments fails with -EAGAIN. An application that submits the same
> request it would pass to waitid(2) and treats res 0 as "the child
> changed state" sees si_signo 0 and si_pid 0 instead.
> 
> [...]

Applied, thanks!

[1/1] io_uring/waitid: return -EAGAIN for a non-blocking pidfd
      commit: c82621eb2c9a00b514a459951609e04843d467bb

Best regards,
-- 
Jens Axboe



