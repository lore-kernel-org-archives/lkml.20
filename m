Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06354A3D49
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865160; cv=none; b=tVQbN4uvrIFPsTr4WZzfmAeh4oQmszoRG5On3LSafgl9N0SRnPMrcjCugo9NeH2ZvNcTuqx43ga7l0WjnKPqMgLyMlvglZGb1vB4KmZIlmE8XGUAATA44HKsdCS/DSsVppG4aPkBSUJCcaUaxG0TnkcH42+c5wLFDCDx9fPhZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865160; c=relaxed/simple;
	bh=wzzViGtuG6ont1dJ14oM1FNYXdtgFlMYQZlw7fnaS6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onRI8G40EFRBOgTQV4hQqnu5k95ISBm74mG5OqNC0j/FcofN3gvKfSV72hwdQj0lgr1SuAxOf0+gzZHc9gy93DiYVViXQebbGhYbFZOxgfoCN2My1ZsuqoI3ja/psX/nqyDFVORVHXA8H2VtbKnxlUSeuQR2irFGY0OPrywS2zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsZn1cOs; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsZn1cOs"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c0da0145so1175494a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865155; x=1791469955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzzViGtuG6ont1dJ14oM1FNYXdtgFlMYQZlw7fnaS6o=;
        b=QsZn1cOsGW9gJSBEr3AUiFhi6dDv+lG34xs3Mef8LiBafeYJX+skrBT1NBhIXQBHYU
         jj6xuMT2tnJjwDESvv86Uw/zRnqEpEafJoeH2K+xv1hper6uzTKGj1f4bL6FcCpfTGd0
         EvmA2hfwBKytksucyYSD16iM6S8wtFJL25V5FkbDM+tHGtKJRt/slN7TnmiqxYxjtEwe
         Aroktd7xX0WaeBpkrdLqQNtC1matuazrPpiMuSAnxk5rAWXCrHCszGKMOSI6IAY6ra5g
         vwnLdPqafMdKVpNxDJ8dtR6+BvmPgvh1Gx/E7/CEG7/YHPzbVreCoEpLY9HVmGM1uoZb
         z+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865155; x=1791469955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzzViGtuG6ont1dJ14oM1FNYXdtgFlMYQZlw7fnaS6o=;
        b=ZTorbmUYVs831/dL8vfJtzKea3A6N5oKkvNaJvjTsKp0k+MnIVoomPtdpxV4xA8bgP
         GcKtmj2RbqGOyAJdjsCXdOruAqQcyYmQ2fkmObCL/L0+o37b/fXQ1wxosWMrKUpH7Hvu
         Bh7QekmrhZ6rzVVbqU2bLN8L8e9P/vblRJIfcv3wUhidx51uS34GLHVozMKJg6AGZmd1
         e6E8MqoE9sDJHQniqOHLMDev/+xvUls/3K7WabxuqNlRu0ORJwKb70eD0ehrSgA5qQ0o
         FoFBcS+jmAd+zCjQvXuN2YIz1DHRUt1bimxSt9KU2sLe6nEELapopVvioi0B9hVr4cIx
         pu1g==
X-Forwarded-Encrypted: i=1; AKwUvByZQkRtqWq2ZvUKKsn4/uXgmw2hwmMUFJJXJzIVG2JXOETOko7/LQEwcvzVAXfiXwSP1jpFIQeHTyBTreQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgs7B2cM7OmmGD32kte+uDf3AnKOFyXFfpW5sfm56OCajCDI0R
	jHNPV+QabRu6QelX0cMdwZI2P2qxNIYXxmdl+zmkUveEQZSC6e3eknKb
X-Gm-Gg: AYBFou1KTwa+qEKnDdd+Z0jesW51wcfsYiyOxDkAznLMJhHgmDB9xP4UBwZD0NMAWhl
	wK9MR2pHaJp+hvxrQwrp+m8CY5lB+YGuY1r/7Y0uk0vshFdld9RM1j7twZLGt7BMxlDeKGzJgnT
	1GTN2S6tAi46vR+BuiwUz3/HF0AWHE03kBK07pJw6DFZ0+BARQMzIY36TKB/eCTAoC+vYmIkwCW
	K8RcLSSY9mO5w2RUuGPvs9gHt1qeEl7pofYCVbMiMqg45YPULsaHEuWb5/2foGYjQcMEY6P94dv
	Z+/PTNvWy5akclVCm97PQb/PpPH1Vezndauf/3mjv2F15x0WrJ9gO8VrwEZYsTVvYey32tC37jZ
	CCy0kMNvrGNRXsYuSaPccg+EYuxsj0sI79nB8JNWh8dryBTajPSTk9qDRWcDsITmRWByY7PekZt
	5qxORJkLW9/APYNDRcIDddBWoGBnmwlYzwB3ehg81oe26yNEQcIxaEHM5zS1l1BKy2MkbI481hd
	LwhphQL45g=
X-Received: by 2002:a17:90b:2b44:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a4d1509d61mr3979683a91.18.1790865155377;
        Thu, 01 Oct 2026 07:32:35 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4964487a91.13.2026.10.01.07.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:32:34 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: stefanha@redhat.com,
	sgarzare@redhat.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: account only unread bytes in read_skb()
Date: Thu,  1 Oct 2026 23:32:21 +0900
Message-ID: <20261001143221.3856511-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179085716831.31693.13222203434770065965@kernel.org>
References: <20261001121541.2983379-1-4ncienth@gmail.com> <179085716831.31693.13222203434770065965@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks. I found this during an LLM-assisted manual source audit of VSOCK
receive accounting while re-evaluating virtio_transport_read_skb() after
CVE-2024-50169. I then confirmed it on vulnerable and fixed kernels using a
connected CID_LOCAL stream and a real SK_SKB/SOCKMAP verdict path.

Thanks,
Daehyeon
