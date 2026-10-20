Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474154;
	b=BjJXZ5XLtcAjBGtB9gVbvmynkYXGYzdyOx87QeVyflysSEcWbksZReTqJLVV20pZF3qv
	 ShgwGgHAuwX35gXrT1utp/vs3gNFdrgEcd662Xn1Q7RoWu2oTEppVHVLBvEgSAOk7Gi1K
	 YoO41CT3UZpMqGd0FSgKabMcVe8+ppG5xi9qFzewKX7bwP7eCdAOQalbbVpdtAamwJtb+
	 e9R6r66n3nJCpTd1N4YJymN0lAXVWf6cpktt5G/QFIv6Zalfm9iZkRGm76RUhaHW8rz2O
	 vb0Eavafv66R4zupfIV9YJZsQT++dekarXWFnFQIFBzFIE4n+CJ1SK7UW55v3+U5toA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
	b=ho1tLYCStRTE6t51bm9K4ceIVgVOtL4Q6RrcYmD3JHc86I8FT+wHpvvVMe2Dke/kkfIz
	 YjmAL1iqBtTofFsn4tMfk5tRO68PbgNpMwNI3GZKi7beTwHWu6/0tdwV+LFRVG8/z8EeK
	 Yv5hN9HkjXvhSPoDEiS/FftP9EBbL/0CZ9nVGq7JUnCx64+gjAZSLrrgPOu0ktwW/cPl6
	 q5hy9LKsIEgnvxZ4i8MvEiAEPAB4VGZQ9NB44A3vVXEhYR8kC+fIuOd93zuli1Qmy7GGg
	 bSJ6NII6qJHdY2+yD/jwqtP7QH5/kFC1+1D3TQ+r0r8u6XwIGng0azdQ8TpBO5arxtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQBUBur3;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34C3606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34C3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQBUBur3
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a077aed337so146657b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474153; x=1793078953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
        b=IQBUBur3C3ooYTg5kvhTecuHSB1BGpjp7yAA0mIKn1KXQvvi8yjEcRmkxmKnWdeE7E
         0wnTYdvYGnwAqgAO0varwi/dIYQYYwS3hLf3CcXVW5HdtDxHqnKocb23lWaeCrUyzVkJ
         V9ibknii+z+WI7x7BKoDF/F29SvU+LcIdoAmsK8L7WcmZWt1ZJB/VGooD2EisfUsIgbL
         XmWCcBxoRhup+qP1okUxUbtANYOkhCdiB1wdmC4hnz7h0xaFqxHtmI5p13UXlGNVD8R1
         P6ePeijdS59iYgsFsWSMB8pgwiovwod371lTewAs2HI3HiUZMDA7nQOeT12z8cOB757r
         9ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474153; x=1793078953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9R77y7CmEav0rC77XG2mhErQJ4vnSWiNFq8rafLmTg=;
        b=fy0ufAC7jlbc9lHMhrrdWmPvMKocoEbEMJehYM+93q7PuXGxCazBDX6Uo59UarAUPT
         paIN6NWSIH4+BxEghvtnXm43VUJWtWwsT9qE7tAl2c01kUCXiVPdN8ZKJYFBlVI5tkBs
         HtRhPQ78FDKJi874MyhisE/FSBYkuQyy5zMZcuDnmWNoNaZiWhxts8muo7e7hIszqphK
         GPylM/Ox87cWfaxj2N+Ur1hU4Jrk690hJUZT1BcantGnOWrrszyyyNUe6Vc4ufaYgfiv
         PdmZpyk0gbPmm4jpo3NPK52dM0RE6O5XhhD45vVatsFrdhxJH3S9GtvWDsHqymtJrgBL
         OKgg==
X-Forwarded-Encrypted: i=1; AKwUvBzbsJW8ov0dRSkOn4WVIHnmrBtXxtgxY1nGv1AeBJj5Ea4sFmIuj5RHMsbL6d6/oAVmkwtebiAz0dflO6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK69Yc/87sLa5VwZ5ioMq1NjijBOmzdUZnufHTGi1K8XdcWMfaV
	g0HXfwltDOeCEDt8eaoSqK6Sg/3vh5LJkHvv45r7PQyigc++iMn41wbZ
X-Gm-Gg: AYBFou3ZNZUJnFWPW9nSwdPvpOetEes+HWqpnzGVShf2KXIIlaX3fbDojXAFjNj4jHN
	Vg93sf4xNBnwBlR7GfgGtmbSzWd+b5f7Z7jMbQepuqgabDrAosQ4nGvXe5xpZDZT+asCrBYGUTY
	SalbnaQgFhNXdh4Msgm/UdwMkew9GgheSv2j37LIcoyX5rSMDqWnuWDV5N14CqTeIOCvCUXbJTQ
	pkUG4YnU/ML2zCaa6VZzklBFRsNgtFYXfG4cAw1s9nfkYyBiMyq/Isg0sVmMoiUKIj5X+MVki3n
	Kwt3sAfLNnVqj1tJ/onvTFX7KIXPsXE5nlVHe55SwfeSsl7/M3ZF6oMSgefj1Zgtf3W3jUhwwx7
	zmvr0AQqA0EN6XCW3UcMJod3Bisb5MYLLsWUxHhaBXc6NE3qLNVoiCazkUSfMEU/sK3qJFiYqYT
	WDnzPjmkeuDBbgVBdPp6DmA0cDPcl5vg8mPDvuSCqPcVEDZK/o/QZ7feGUTYcTKTQq4L+koAtns
	0Gc
X-Received: by 2002:a05:6a20:c885:b0:3de:57da:7fa6 with SMTP id adf61e73a8af0-3e26fb93cc3mr773371637.39.1792474152912;
        Mon, 19 Oct 2026 22:29:12 -0700 (PDT)
Received: from hachimi ([101.5.175.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654eaf4e3sm4406759a12.26.2026.10.19.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:29:12 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: hamzamahfooz@linux.microsoft.com
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	tzimmermann@suse.de,
	xlfylawarthur@gmail.com
Subject: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Tue, 20 Oct 2026 13:28:47 +0800
Message-ID: <20261020052849.9241-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atZjtSlZAocUWYBS@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <atZjtSlZAocUWYBS@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
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

On Mon, 19 Oct 2026 14:38:45 -0400, Hamza Mahfooz wrote:
> I actually have been working on cursor plane support for hyperv-drm.
> I'll post a patch soon.

That will be great. When the patch is ready I'll validate that the
problem at hand is settled.
