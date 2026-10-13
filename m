Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6594F85D0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894745; cv=none; b=CuyRiA2c4AdxbDmZH/D90bnLxG64irmP0a1GCo684VLIwNxQ8tcNKZabtqyQxXitSV/Urzw7645Y1fuyZA39sq2UKm16SpqYj8sTPFOhVdFLMRwKQiiWcvJFQvSh5uP8fNID54oE6gCaubByAtbwoPjk88jNbqemJfMtDUFySwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894745; c=relaxed/simple;
	bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyU9OEsWkiNl+3EU04+Tj0+En6D+yd7mQ8WdbzR55vMOefPloe3lJISp2VePwH9Mg8gYcylAwYdG5ytCuxym7Vf0QCv8m+A2HX0+p0gF+nbWcoha0bQAzHEtSkTO4o70QxpSojhO485kmowcVLbK+/QWx1Ag1WdP6vTyzkCUus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=WTLNRqKS; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="WTLNRqKS"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53504882980so34867671cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791894743; x=1792499543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
        b=WTLNRqKS5Bjk27sYdnguTWsrEVQN0XkLA7bWCvEWhhNworO81LhjACRwElyAvmP05z
         CkNdrWcQMs8EtCqsr2bYNb23sQrMfmvscEsWpRT33SseOvMzqkz0e3amx2qUQ9GLeW0b
         fov4AT5RxJk8a2/90qChtb/pQCVNZyfHKNe4W1DiMBfId1Aw9I93idZ0J7QdXyK0HT0w
         FQdJjW6oe2P/QzkKuWR0rEVah6hThY9KVuiHjJ8y3DXlA75L3BmSkq/1GFrpao+Rpi61
         bxbDhQ5BzpXB6wtmVzJwADyH0SfeLpOCFC+WybBjrgZPlEmjfVCFDVOJzGG/i+g3MIAR
         MoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894743; x=1792499543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6ZK6uD24oa8sSVk1mSTsDl4T4OvwIA1Q5oy5fUtMgA=;
        b=I/oZi5suYYiQAax43zj9akUa6FtJehvOeZaAUtN4CQb3suNZcqsf7o9w6hzf4hkuCo
         O2EQBbq07X5/LmMkCRj9aG5grh93inWJVFMsZmnrLEdI4iyHbyT16/JsPzZAK52tMq9j
         ghukq/aQVDqCMNM3kQeSofQ6g3F5YlOlTN6DWGk7hZMU2eyf8eeUWbzeGs4tHTXdp+pa
         QhtFfnXsFAYckTkITw9Ta5bQPG6XBxyOBDuSi3IPbKB3W4Bas9K6LESsrW3zEx+Dzb3b
         o90LQGizl4QiqDoWzGMzHgNNct7K8TiebM1JNCs8zGmuwKfeo+kTpXy0HUGk7C2ZmOhI
         ibEQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0+D/JiGKFa8vSDWeLJ0/L0epDdS9ZfA+y2cN8WS8miYMsnKQ/NnkvRV6bgZxCPNxqtcUR3qL6szbPkmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgMxrw0DOCD70E2hgKdW6Hc1Ad0fPPJEXKtNoQX1VDFhXNWt1p
	e/wQ8ZBs4QiwoprGCLbF0NKnZqJ5wOTir5/ZURzoP49y/dAxfvo9Z3ng5DwNl4bRn4Y=
X-Gm-Gg: AYBFou3hD2fp46J0oxuta1iYtgWD2qAa6a51BzqCgxSZqbxm/bFB17O3jUbtnslDJVk
	1QugDID27TzpJ7cDvll2V+ox/12FX5ncnEPLdPUpHrNiUFpr1ynF40NwW5R6aRqBEodUbOzIDKZ
	1M9nVWCN9See1YIv8Xaqp+cAweNVIuHhE8L/4x7oQ5HfBsgENCLGOrINo4ZjFPxWlabNtppdVk0
	X13ikP6D5NOYVXEskyQV53nRZBwp83oWpOykYOMbtDska61uVUTc3LqjYNYGHl4anNBLhcFzlmM
	95GLv/5atLyhR4/NGFYER/cjDXPV5ny9eW3l3+PJC5sZHfAwOSgGMjSOJJBAYI/3FOVt2+BKXku
	2hqUb5l2qrco+OP5L2KYevNhwOkQ7xGzUH5lh79WJIyRHAR/mM4Y5qqAkSeE885mCrfjj4Fhp7L
	j0CLcmWKR7fEY11a3ll9x1v33qNx+tZciqPNQCWPMonhkckGbcspL/7ErpTooXJXApB9D7eEak8
	G1xA2krE+81nvVg9bcxrL9Wep8raG5nhDkMauiSW6QidXdlWDFHp27Bm1R0QF9XPDTO5fPy0lxv
	ZD0PQ03r0jXEaMCPKhp93pdzgXg+ycPXcuCc4FLvmPP0BcL4g/wX
X-Received: by 2002:a05:622a:4c87:b0:533:983b:e53f with SMTP id d75a77b69052e-5359fdf6878mr201808461cf.59.1791894742961;
        Tue, 13 Oct 2026 05:32:22 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b62225sm24417606d6.19.2026.10.13.05.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:32:22 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Ramshouriesh R <rshouriesh@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Tue, 13 Oct 2026 08:32:20 -0400
Message-ID: <20261013123220.17716-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ramshouriesh,

Thanks for carrying patch 3. Two notes:

The staging/ipu7 format patch mentioned in the cover letter is dropped
and not needed. With the ipu6 driver from media/next the sensor streams
Y10 648x368 at 180480000 on Panther Lake (IPU 7.5).

On the crop: I would widen the crop bounds to the native 1296x736 array
and keep the default at the 1280x720 active area.

Jake
