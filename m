Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8581D43F4B3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954411; cv=none; b=VJAnQOQ9glJFq/ESN4xTlukPhKdfx9R8xpCNsRuA82N9fK20G9fHR8vFfJyXOZxFehli65pjoIgA/Qtpqdc1Lm5unmx+15C9SKhah0zVAxuu9/GAc0ASFoE493p70JcU2Rp1uXULfwWexzgdM38su3YtbFwMAbBvtq9uN20zhfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954411; c=relaxed/simple;
	bh=/ERtdL7Gbn2UEcmCAicOL2oG3iKCG4UiwrEeoTqqEsw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JK/d4ZDoqjVXabm7w+TvpfUdU+0UZZ759OdMOqQHwxISLTasW1N1vtGtRR5kNPdQMAwY2kGDWzoAoxtYstATTu7Q+ct5vRUQucr/RNo/fwcbabnErypa2//nghscUDj2nCBGBf9n0v60Eps8cw0hy2wsLn343LK3k33aUaI7faM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=j+5LNeBF; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="j+5LNeBF"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28db31b89so3281714b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788954407; x=1789559207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdSBvbVCMly05/MnJatDjpn/i3lZQCfGuxvHm2Q3Abs=;
        b=j+5LNeBFkVFY34F3Z/HuUAhPUAy+MGF/O8DswfhcGTX3zfuBbPSKoQNjPSys4gYKMr
         BciHeQRa9ypBjihd9EQEKYPXIItexDoWvKLQ9fDN3fxBJd7tKV2ZzidsNn0DtcRxL/eV
         Yuf9ZOyA5aEeM8EvjzT0QuX13UWer8mPgu9ryxnuYRItj/eepljoRN1d1PsKgQmSr++t
         5cwVOQJe9+NvDXN7m6nR/L8wnG4N6OFrxkY4k9bI+mBg+7WllFksEqthSziZqQRIjKeu
         aQRSlqgUzULhLqMvSAh1e2X7TxTQkcEGyo9qJu8Qi5AGqYIj43W45Hu3Zve/75ouoGTX
         GCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954407; x=1789559207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EdSBvbVCMly05/MnJatDjpn/i3lZQCfGuxvHm2Q3Abs=;
        b=pvUsA6dwiQH5tSggC9LZbr560XEsef07ZhwMqTQZdshcvSicxGHh7EYfiukaEqrMsn
         mmssljw8IasPftV1sYtkVoikatt/fHSDft0sBX1zRPZ+pKcvFNBQRjKpKaPfQNYmQNd3
         2O6Swi/N1XQx+5FwjR5x2DSeRR2m5QOFgr8UtpGLmz0m8Cuu+S6CDi6xs8kSpVtrvS8A
         TTlbjH9OazlSOb+Mb+Nx7ViqsawxuASBf/c/QvLeu9A0bgMTHYsuLX+s7Dp3L84qyFoR
         Qj7dSR1WRFrE9JzG6oFU41Yw2U2teQt+oqxzRq3UIMsVS4O5x6IIRvkM4DONoqGyYRO6
         o7vQ==
X-Forwarded-Encrypted: i=1; AKwUvByG9Iw+RxpW78UKwSWxJYErL1sKnmAyxPSp26EWubsJ4DQ/hrBwgHM7AlzgtyOM+FJGDu4f+t7ifFOAAnM=@vger.kernel.org
X-Gm-Message-State: AFuF++mmD/yOMjQBRJu2vb5FJFoTk9I7yCTV2bq3Nu+QUZmT9DfKZXnH
	ojMDmqG7y03gd4HVeHxD8I7hir5E+uIt+16iH1vviajkcv/+JD9bqF/k9es8FvH+QMw=
X-Gm-Gg: AYBFou2UXRPTjE5ykHNa3WzBVJUCeqJbR7yeZmNr/egoZpDE4vXb7j9igTgZco2UuAX
	4v5xlf4L8e7m+flCaVFhEcgOzJRKQhI1zeHrQQnRTJpI7Hh08xmLGAPbqGYlJs0ki7gZcTCU7gk
	YSTcSWUTgXQ4M8ysXGXNgyPr6bMc/r/HStUpdaD4vGtbnWakvPuvrvBVY+J+OelvnCNdXZZbF/W
	CiLjJTTQ4Ob1xBTCbpMcYkWSx+Z1usdWXIgO/zqw6EVhz66tciIPTaIBuENlCJTTh1peZ/GdYZ5
	vmynxY26sn/f4AbFpHf9tHx6Yy8SvpR6mliMRUFMaE9K0CrKvL7EBQrbj3QjPDuEonW8uEaLMUu
	xsn7JY9p8sFWG0NPAglL577mXir0mlw9byF4fmwXvOjFXZQVAZlUJI/cTOfA8huRCb+wz7WeyKn
	99wm8Vpf1TCAiEVSmnA/NRdUc9JCvCJC5SLsFowWwZhrV/Gvcqf8GH9TAIF98i3Q1LLj3uZ3dM3
	Ww6XgFOjfvf5w6+gYL3W7/UtkTSyBsWgX0WEP2ABXxcQaBwNqlKPPrc+A==
X-Received: by 2002:a05:6808:10d5:b0:4b9:e6ab:d083 with SMTP id 5614622812f47-4b9e6abd419mr16647584b6e.35.1788954407195;
        Wed, 09 Sep 2026 04:46:47 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96eaa508asm16532607b6e.1.2026.09.09.04.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:46:46 -0700 (PDT)
Message-ID: <05177a9e-111c-4595-a7ef-d3de398f0a85@kernel.dk>
Date: Wed, 9 Sep 2026 05:46:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
 <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Language: en-US
In-Reply-To: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git syztest

Let's try on a new base, perhaps it's a mainline issue keeping syzbot from
booting.

-- 
Jens Axboe

