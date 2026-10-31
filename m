Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481574;
	b=AeHZ/Xx9fFR7ca2CTGHt8DKaOHuyHXIxc1VsvcHBSjHs6v9S5qVO+yD2PJ3kGQ3nt4Iq
	 s5g4H4Jk0CJURAO+ASpZZK3I6gpkHdF9LgD53XWODnUhhxmhaloratUUtPQVaY0l8PC/j
	 CLWVH5gyZoFB0RkABnFkBvQW5ekzFWoM82UjCjRhnwkBDhPjNNgwo4fYXrXl+szQxvd9b
	 aQeQA8OtM+xi4LR8uFm0VSQ2C6FvqzOoGKRiyR/+VsKmmuyeeJ7WVXfQNy9Ei4WeZQU9N
	 7tcyuoEWDahs/b0nFKiMcjMLJ6sTJH19fytMWX4kNTC4y/s/m83SjW/z5KUW/Ewynug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX61jLwYDYv5I+j+19UR19HppQveJQd+TQJZ67BiwVU=;
	b=EDz4pql5yK9LX0IZvyAW/iaZqZ1IEsOjP4GQ1RpPYDULB+SHyr5OyWYjBBBZgoLboCgh
	 Tjo8E3DYdxj9uEmgd0+VNh9dx+skAn+Qt1rkdalxboAnGuSrtOrvME1Kgtx2ygHgSBrb1
	 o+owg3gUDvZSrR3ihDa0zEkHAKg/2QcacgbhwNy0I8Zg+CWqLYt1ZGM6Wn4/fESTh6zeY
	 5txkRv/VnkC2kr4Umc9pv3svWEtjuWX5EefKlItlLNB4AeFpL/edqEIdrQ8b2W08Vx4q4
	 qpRy2QKVKXA3Q+LDcdWwVB/e8CGVYoj8TShVzNhzioa72xtTO33mFCdEKv1wa5qvUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4cDSkjb;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD60606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4cDSkjb
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f3c89594cso122226085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793481573; x=1794086373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX61jLwYDYv5I+j+19UR19HppQveJQd+TQJZ67BiwVU=;
        b=U4cDSkjbhP/C6t+3QMtMsthI+MoUnZh7Ilqj3BvMwF6vRdxw9pacKHfwUw8skNvtZ5
         Xe3SE8axPbqUDwfO9MPwuWVUPNFltdaZc43y/GkXyxEAN3fM+OpA9zjyDGf+hpmBjX/C
         oL1hqLY/MirKszjdQLyjp65Ptap4w0GwmuV3lFi5tqIIxwMZLP6dLEvkQDOvpGIb59Uj
         eiBEwOne70DcEJWqtYMaeMNzbDBra9so9WkT32UydkfSL1d93C/iHIx2HZXTOpFp4qRl
         0m1ItZZfsIv/muACqMNCmAcdlKOme+s6/hiF7QbhJ9+A+87CUakhS3ZlUrhcoraJ21wb
         i5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481573; x=1794086373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX61jLwYDYv5I+j+19UR19HppQveJQd+TQJZ67BiwVU=;
        b=cVzcfsimQvKVVIRS9IzQ3N4k+ulrBJ80Fn9CcWBarXL/qJTbU+ISz6wSlLxMnki+/o
         gYVPUTCwirJ2EVrufRFy5VpSNvXLBsRG453qa8yiTcnULRKzTD1VwUmtudULBXzhTHcy
         oEAeHg/jdSycrwvAcoqpkHOO7BJ6Mh36a1/+s9W6w3nuPzCwh28g7SRXPexhzcxRJzDF
         QPHShNB56qiuV55fasMHUw9FtNBcd+rjZ8O2MSMbfUyWz36wLdSHVHYJkjIbMvJ4rGaX
         b5sR5khIMAlC5FAB+yB2eSigcCnWeZsFYC4RGxH0Rqzj9rtnhnhqKGTuAZTh2PNVkh1P
         78BA==
X-Forwarded-Encrypted: i=1; AKwUvByYAs5odzuG7/MO+nTrSO5tGabsIvceF4T0ni1d6glX0E4AIXMdtEMHbORVDzz7osKeEtQsxkitG5UDs/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1+PCN9szZY4m6bxvDRcj8ix4/kgGOawMCtdT4obrMg9LVwq2b
	GJlm6Mz3sGTeLITaUD4jGRkkL3GDkanePubOR56m7KGA4QQyzKvYe4b+
X-Gm-Gg: AYBFou1bQGXn3eoo1kW8q3kG7pKuAtIPdhcfxk4BYkRTX1DdfSYCH8+0BjF0SMztrux
	h32Mrm9ylRc162YdHX0apcSxa7Ddpu22oXvkTpBOLxNadnll+6QGXtLk2BRR11UrfYBVtGVKkO+
	l5rdB1ZeQZNf/6Y2hesKuNDFXS/+ZyZWJncYzj34diuMrx7WxeAchHtxbBtDoxOG9IdBZYH2yPp
	oHQR8tAc80ul1Dml+ThPErOB4EfgCK74BGkflfr0jJw8Fn9xQiY7GQgnw71n0H5vB+CMXWe0jP6
	G6Xv263faO0U7iMYDxLarheujN6hS5/+BdB1N0bc3jTd5om40ep83mckzwFsed6a1hpEDPC2V+8
	GTCaiYTcUmw3c4UrvR4dPqy/LS303puv4V0HiU+Jyp8ePyZ4aTwbI3O2jMX04EU7XZL4erAruVo
	uxkYTqw7IWyGokDv1EVz6ilewl4UGj6A4iVh3Ut1zFzA1Jl8GPt3l2K0XH9HZfp7aWXww6/EWOD
	TecT8LJuhcco6QQYC8V+A4ERGWw6UM9Bd6+IrlNTN+Ob/mIxzeOWHq6OcCVQyOoXPWASVB1JQSh
	uo4YWyP2SoEsVyBoUUYsujnvgYPG1DpAHr0=
X-Received: by 2002:a05:620a:17a4:b0:92e:bc28:5479 with SMTP id af79cd13be357-944214d169fmr1049948185a.2.1793481572859;
        Sat, 31 Oct 2026 14:19:32 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca807d8fasm49629256d6.41.2026.10.31.14.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:19:32 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v9 2/3] wifi: rtw88: support channel switch in AP mode
Date: Sat, 31 Oct 2026 22:19:29 +0100
Message-ID: <20261031211929.3296373-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <7ea86f5208f259f01ce8c18b7701f2a3e41e0fca@linux.dev>
References: 
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

Hi Luka,

Thanks for the review.

> Maybe clear csa_vif again at the end of rtw_core_stop(), once the mutex
> is taken back?

Yes. The USB chips never start the recovery, rtw_fw_c2h_cmd_isr() is
only called from pci.c, so I started it from a test hook on an
RTL8821CU, held rtw_core_stop() open for 3 s with the mutex dropped and
started a switch in that time:

- before the cancels: the countdown never finished and the next switch
  was refused, 3 of 3 runs;
- after cancel_delayed_work_sync(): the work stayed queued with csa_vif
  set, ran after the power off, and the restart then failed to download
  the firmware, 3 of 3 runs.

With csa_vif cleared again after the mutex_lock(), the switch completed
in all 6 runs. v10 does that.

Mehmet
