Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265ED4DE72A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605892; cv=none; b=P8PTORlvKfUZkA1rplP7i2xAW3HWOz86FyYgnUo2th6m3HTx9XMVjrRdiG3nx3AzlcbBJHZnqIBNmFrPjxCh6ecVE17FbOeiE7t+Zbx9LwyYDF5nnqizvW7a08nVeq6NZnq4XQ47rFKAGa8uVSMCeW4lmchDIgAzxLHenX4Cs44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605892; c=relaxed/simple;
	bh=ttRLp5uZBBXIDZVrjCp1/B/OT2B3HDt+3d9o6TVjSxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rmAVWX0I1doZEAdtnRMhCg3GGIKAfQJCrVs/s1r+gB95Ttv3qpoZN5Xp8I8byHtNOMWAl2wlNDT+jt0Pz/+ykpE9n+U4L0A6PJ0St9Z727xfPgHZv50cSBnCshM5i3S97BbN8gzo3zgHIFS0Kx8BYgF1M1qBTbyJt9llQL6etFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=cCvfrCMW; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="cCvfrCMW"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342568a5b54so1268264eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1790605881; x=1791210681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjEI2w0L+wVlxSuDV0P7eMrDPKELPiH3pO+YDTZIuR4=;
        b=cCvfrCMWtzK/r95NE2TdZLDL9vVOGEUnR0e/8U5i4KeiN9qic5XMPyQA2oZrDwELoo
         jdScsgI90nEkv8qdf4BP4GSojsHdp1HR282ON1+rHX5hI9F9Qfye0w3tpIRexndB74g8
         wjh0aDhHc9tyMmeOHrX/+Y7igxtEB35viPE+KQ1feQNi+6Xnshrdf4Wy5EUt9my17H1+
         q9BPGCcIMP3G2w06R/na71/tHnXysv1lvwf7b00k/htmjGXXPl/1AimDafAgUw7bR9Q7
         Cf+G+zVY5Q5ltsBzaqhDga6swiqa7DohJEjbBE8/TYWxjPP5MDt9mLF14YI8awWygDhX
         dxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605881; x=1791210681;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjEI2w0L+wVlxSuDV0P7eMrDPKELPiH3pO+YDTZIuR4=;
        b=yGLrNLo9Er65UZiDJAWlutIp525ZQcTUBl676u/KN54VA1nOonsWrvkqISUzwDQT8W
         urBcAU5mBl1v7qyxq9B3d06ALjEJ4fIxluG36fIgU8jqAqxmWMs1fzlYOqPoqklsCFF9
         izx7+EDhJR17JmK6wsFiEyxtf+9npymhG32IFU2CIe+uhDg87HQgP5NppRto7yX7Fbsb
         dNK7NbRPNKtkVp2RrYS/u17CJNPmcEp4awu6DtK3DOe8AvsEdtGt24s7cNMhxjTgmuNq
         ULx4dDZ1kZCNY3BcrMtn/YhNckAsm1zj9fP460Q5doAsHB6gxtTXAPn7qQiAqyFeCli4
         pzLg==
X-Forwarded-Encrypted: i=1; AKwUvBy8Hg634EQqgxA569/w4ujSGrEJekcP+l0/qqmrBW3Dcc21JaEaJwmeEWrMfUolsDySwy3qYLd6OOfysls=@vger.kernel.org
X-Gm-Message-State: AFuF++mIm7WRNVe468xCwwd6vVV0aLYvBFGjYIE4TGaRcw5rE2cwefUK
	0xdk5fc5zpYAA+JhBgegbp1VOO9727sOYYOw/ai/jUos0xCzeXz/195qPnW32dhGcW8=
X-Gm-Gg: AYBFou0Yc1DT/Css2X61rBqIFkPbmro2m71xAgH5+l+JpZDvpeNQ9Ms3uQHhtUDp+38
	X5b+4jZGwifpndgXaAqBKoEg4nymHfzKzPdwMb4gFEsp3S6IUXtrD+hjbq0CJ0JrxUYzIxv9aPZ
	r/5XLa7jugYw4xon7174FOApyBRoMUZ06LlnQ26wOUfNdS825qEirU3qHlimmFEv4VSbi8Iy3Hq
	/5G0yY7Iwbid9BOccy4r/QADGOUXcBDmcU8RtoXADYYIXAy7/l+CIruJ5W0GvNChQ+w+t13jdSa
	8c7r5lWS3qBGyH9oCvwTGsRntOI+YcwojlAxQHBNv2peU5UMYQH6Vvzc/M4qtkG59FA2Xp/O+dO
	QEhLfXSZvRmhaEuYy4WHGf/HEK6PQIE/GKyiVKZqaxKcRHxG7Sqj18xTTEUk77uOY7Y18ODqwy+
	cPMvXgXymHZviyiBbeqPbj+KO3QZIBzCSBKPQMtlc9Iq8EAN9CuyT4sn4k67TqqRA7RybMWhA+/
	J7dFR2MOhwQf3umhcFTgNbx7jcRujNh1KBoVolvUQvuKUH9Dsl5kqBbeQ==
X-Received: by 2002:a05:7022:6889:b0:141:517e:52ef with SMTP id a92af1059eb24-146ce492c9fmr13591875c88.17.1790605881108;
        Mon, 28 Sep 2026 07:31:21 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm28616577c88.13.2026.09.28.07.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:20 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, Junyuan Feng <a@lollipopkit.com>
Cc: dw@davidwei.uk, io-uring@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
References: <010001a0cd914529-23df2f94-bbe0-49cd-ae5d-05922356fa12-000000@email.amazonses.com>
Subject: Re: [PATCH] io_uring/zcrx: requeue multishot receives stopped by a
 local resource
Message-Id: <179060587969.984285.7352315513863005103.b4-ty@b4>
Date: Mon, 28 Sep 2026 08:31:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 23 Sep 2026 09:20:44 +0000, Junyuan Feng wrote:
> A multishot RECV_ZC can go idle with unread TCP data when a receiver-local
> resource runs out. An empty copy-fallback niov freelist returns -ENOMEM;
> a full CQ returns -ENOSPC. After partial progress the stop reason is
> lost: io_zcrx_copy_chunk() and io_zcrx_recv_skb() report the copied
> bytes, and tcp_read_sock() drops an error from a later call once earlier
> data was consumed. The edge-triggered request is then not requeued, so
> it cannot consume the remaining data until another socket event arrives.
> 
> [...]

Applied, thanks!

[1/1] io_uring/zcrx: requeue multishot receives stopped by a local resource
      commit: 98ad5b63f5041dc354a6e694f4a9436f74e0681b

Best regards,
-- 
Jens Axboe



