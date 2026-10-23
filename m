Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753361;
	b=vOQfAf5pr8P47QlTrPnAN01ZsGGRrYxxzjzD75q0fXNQ+PdPY2ZDMPyWa9X6akcaKXNB
	 Z1f9fmHBMT/NywgBzw13gPB2UJ1NtSjonGmn7QmdrUAzVrgSL+bsJUEJwTbVnTU/u34z7
	 BO7975zeR1ZVdfz1z/mlpwyLNnarIMXPebBIB6ZOqGogE2EwZoCD9+YyNP0iOp6Y4YBy1
	 mOklU1jlPN+06k93xRmFiBpJ1GORTPB2l05SGjt10lXgcTYYS+k3MTeYARq+fkNC2NOYC
	 iDVIcBJ8Jq8u4/bY3uEW1/KH+IqyHRDpMkoSbOYtYk6dFAusYBJaKc9omZpMK/uS/jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eJC7xNgQLQutWHHXkZ4X5MyS9ZRK+CGwoz3uAzjDsLI=;
	b=pXUmf4Qa7a7MkmiwrOeSTL3hEQs9RiuYMg1fI47Wdl/CNB8sQYcmm1TXRCxeyeF/znIi
	 NM0GfyCf7DkqL9OQAqVpESu7CEACA9l6KAS0XObO2tH5XNgb4V0k3JEy0ChLoabrVT+iM
	 8XeUV0sULzwrv6sb7xkX9fOXuIDxITLkG5IySTG/sXDA+IoW4G6KZA3Tvv/M0rdD/cu4O
	 HzLvHGwgAJnCJ1QpwcKbRRch4xTcq9EkiXmpLj3ufwqkJCH/v5k2bGXZlzHUGkJ3flXv7
	 U4xZ9XzpMU6b9G00UnLKEpXM3GeHHgAgK/wter1De6PqXXYuSO6NQHrRFo6z/awvq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeaVoIN1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F39606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XeaVoIN1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-487049569b6so414462f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792753359; x=1793358159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJC7xNgQLQutWHHXkZ4X5MyS9ZRK+CGwoz3uAzjDsLI=;
        b=XeaVoIN1AsdgxiXmgX/39WBewj8KDsevg1v+JNoSl8CfcUaq6UcqC5OiYyOJqWFuEA
         V/TJ/acFlfwmM3CjmgDAjNgD4Efm376U6KgKCC4KQOTL8OO5ivmqKdDjkcRtQ3HrTkC4
         8KAvznjfZv8uo+qPuiQmH1LIIP30qIn9cFiEZ6/XrH87dWvNAnlOHPUSFZzpUgz5sEmc
         O0Z19irlBe6wyz7jU9IjWP4HgerhEG/nVWTVCbe6Ng08sNZ9vEYbNXjguEoNbJbdTQSo
         +i3Am+sqGGt1AO+jszQWF7cHcNA0tZh0medTKbbMXrLkjZ5gtp4bKgxHN7KH4jK6s3ow
         q6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753359; x=1793358159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJC7xNgQLQutWHHXkZ4X5MyS9ZRK+CGwoz3uAzjDsLI=;
        b=Ua5ixX53mzONw9QBgydoWJGld0J5K1fYP0pKDK87p9Fm63s7Ulb2WWlDkW90Fmpn5n
         IFiyhGeMO0gJWZayW4iDMSSOrU2DzhIb8hxhcbz94aGnEH05ZeBpvCSQeBMvUhwrVnMp
         cPHKL0WaKNyPBMI9at+tSFlKHY5qiiqg8IVCX1glyaUXg1z5GXImCA96QYh/tPi36x5h
         HMfU1nJLZDewCHOJUG9rGaOw1pOEJMd/G2O6oDsVcS4FpQg4/9+lC2PY1DQAOlG0FJjj
         /D6yDOz36RWYXm/JB7aLsMM5g0Ayxn3UzkpMeyDkBTx5p+XucrUyzJD7aODiGpkW8Bny
         719Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMvyQ3NqZ3wRWbbidlKEIbdWYQSv3p1w3kG+rjK34/xoaK5hTVEzEevHCM2zDOrYUmmnMXzAskk8OrP34=@vger.kernel.org
X-Gm-Message-State: AFq9FYInAINg0fXNaH4KxKFHFB7VdFA6pjU/j2dspMdTbTuK7cjFGv5d
	sd8Lzmvxd9TscbkJx5KmRxuEEcgV7eZaRJjbVXFSaJxYZFYhYxIk74uo
X-Gm-Gg: AYBFou0m1VAezpVOjL5uH1TgvdaU8Ov70vYS1f2D9QfvSQhZcxy5TWtO8pGELJ9WdKV
	Q88IQkbV7y8rbQogX+7AyfFvRZcYOgccG+MooKLR/0ude//bJAUGNZlbfjJVdOneR/V4JAL74Ws
	ibqLZJqz+EhlgEvnJ2n4u7dHe28BeiGxdIuRvkYFl8Zlox0OEzjgfqJBTtcgOwT3ij7y2ZlSJpi
	Ghe+oJdrEQsDrAryhoUWZDq6EExB9pvUP1u8rl5m0sFn2x2yQCW8IBRu1vGhQZlerTLfpavvIyy
	pQi7jMEUNxpCcq4Hg0b16/TyFBDlI2TIng67utRzSwyc1f4e9Hpl+ol/E7ZfURuD/hG+SXwwsde
	3ry7hljekeNz2gnZZTr7MLVLvh35wRv8KyOcRTc3B7fKMyjsN+s4BBShfJ7RpVhzSMmTvJ6EsyS
	9Y73F44OHDzswyRbGpwwHoNzAapgqYsGW4AAsnA/QJpXZqDvLrtwAcLGFaP/uBE4jHR/aQ/1diE
	m80MX/P6l1+kNqBlu7YxsRQ2bfnb2bRZNTlg6ctuhR7xzned2J/PV2Gl6Qmx+nJFtCL+/tQm2ev
	sZ/9KfA/CHWwOgYQjNgD2SPb5DgyU46Uv2ffX5DBWwcDBru6KvVSxalivaQP4wOpQrmWlYfOlUc
	m/A==
X-Received: by 2002:a05:6000:40dc:b0:48e:e2a:4093 with SMTP id ffacd0b85a97d-48e3859e1a4mr2854763f8f.19.1792753357897;
        Fri, 23 Oct 2026 04:02:37 -0700 (PDT)
Received: from omarchy ([2a02:ff0:1e10:93f:e71c:400:f186:eea4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38062dc6sm4189555f8f.55.2026.10.23.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:02:37 -0700 (PDT)
From: Abdurrahman Karadag <abdurrahmankaradag19@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rtl8821cerfe2@gmail.com
Subject: Re: [PATCH rtw-next v4] wifi: rtw88: pci: wake the TX queues after restart_hw and interface up
Date: Fri, 23 Oct 2026 14:02:22 +0300
Message-ID: <20261023110222.2804687-1-abdurrahmankaradag19@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <e9cab7ed7daf45b9b4c2294174f8c1a0@realtek.com>
References: <e9cab7ed7daf45b9b4c2294174f8c1a0@realtek.com>
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

> It would look natural to clear queue_stopped before enabling interrupt,
> since it is intended to reset. More, add a function to be clear that we
> are resetting queue_stopped, like rtw_pci_reset_tx_{ring or queue}_state().

Done in v5 as rtw_pci_reset_tx_queue_state(), called first inside the
irq_lock section. It carries lockdep_assert_held(&rtwpci->irq_lock)
like rtw_pci_deep_ps_enter() does, to record that the caller holds it.

> Add an empty line before 'running = true'.

Done.

> For scanning from idle case, we have an assistant
> 'test_bit(RTW_FLAG_SCANNING, rtwdev->flags)' if you want.

The case is real - rtw_hw_scan_start() takes the stop before it reaches
rtw_core_scan_start(), so the stop is already standing when the start
runs. The flag is not: rtw_core_scan_start() calls rtw_leave_ips() and
only sets RTW_FLAG_SCANNING at the end of the same function, and that is
the one set_bit() for it in the driver. So the test would read false
exactly when the scan's stop is up, and I left it out rather than add a
check that cannot fire there.
