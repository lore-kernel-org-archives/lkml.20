Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221C42E424
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343199; cv=none; b=l3zBAHVXmKAqVXmbLnsr2x2uEhoCAI+rcW8gZyF37gTx6fQiRwiuVxRPHv9r4B1xBatb3bwcd/YBMIdEHFKVEhqcwgNOS3KiFkSg8/iTMrpYlkwhozyEhKClOF6mGsUXy/8Asc7LaswL+YA8SfNMaHYsy74Jq5GHPKSgRKJHXaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343199; c=relaxed/simple;
	bh=I40ty9yglW6ETiDTNrAhmrRoixlM5bIx3S9RD4G6+Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9UxGZlwWqfCIvQEAP97arfNhEeS6LOzhUflL4cROa+5MkBOoG8AY6zwGASS/8P05q8M5btZ5QVYUCeKPIdtADCUieIMlaUV15Fm79d+sBe2nsaqGu/pI9yhkp0V3t6dyD0z3FQz02umREgj8ZulxYogqju67F/onjIsyrh71gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+x7Zp22; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+x7Zp22"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e2b290bso149598f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343195; x=1788947995; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I40ty9yglW6ETiDTNrAhmrRoixlM5bIx3S9RD4G6+Iw=;
        b=n+x7Zp229ip0n0Y68GUjj9CZHciOtj3M7J10Yw1lRJuUg+N7NSf9ENh4aI42vs49jA
         on31SwW6mEL7qt8nL0T5bhF68IZofqnJ1s27DKYhmzer3rddcP7zTuFW6H12/9G3E9+C
         s6yq+1QlpKzTD3Zirgith1h/jtuzP4X4If8XM2L/l11sz/IhfGpemfGtka3+hJlNRTTX
         okA9wb4/tAe95M5zVuReEPelqmimJB9trpQ/ob0wANz7R8WvGIJD0VbP0IqeL+PIsJDz
         kr+RVhRvROaQr9HqGB6Cr+0kCqFjA0IM8IwpCeh7qpkYtkesGGIr2vFiSuniXi4CCta0
         8ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343195; x=1788947995;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I40ty9yglW6ETiDTNrAhmrRoixlM5bIx3S9RD4G6+Iw=;
        b=eugfOK/f6kY7AbcwFalm+ZxfS53Fv7Oh4GDjliMFh6ETqYyEbdu2OojqVnrtjKR8h/
         jD4rh99vzlRZX1VDVu22x9ATKNSl2ddppcegOkIz+ijzhLxGkkSnLuQRWFOn4zzQJjzP
         j5hfPmQZpcRCKMkHSdBqCGr1eqjTVOJ44ny98AKduKbWXrWtfKrGRPKB4rVL7KKHYRoV
         XH5yX5nujMsFlrBriC5H63RzEnBgupNBuIAHDiPl06UaBnSgqdQHlfFDjwgwc8WCZQRQ
         3tN4qzwX/HTXHs+B9RtgspY4w40bB62LOFDid94PVRr/mw9CuNLJxhR1OLRUoR8ZbEUk
         FcDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdAmkoVD+mK9AewTl92bYv0fHybP9bE3ifGAeY3aVCbiZp6Fc+HkGaZrsIKYE8nYl7EY2HaFsgTp2346M=@vger.kernel.org
X-Gm-Message-State: AFuF++niLcjh7L6F87atc3Hg2szGobxkD0XTuVQTpFZm8rwlyHDoWbrU
	7XOlZ6bSKGUvrn4KhLBUq7SXoCeZ6Fy/Q/5JOtP7csnIfVxawNw+Tq+17trRoLJl6wo=
X-Gm-Gg: AYBFou35q4eXaKaqbFk/u4j5M9aQo49VKKMENyQVANs0yRKZOGF96RlQPmgveuPakxO
	hUuV0HRfbdqJwTKgYb5NE6n3MicnUvkMhTfe9DAZq1JTFS0l36NZ4e1NUqC7HzJBm3jfC3jstFh
	Wkw6swNJbql60cxZJS3a8Y2VZC+Cwvf4ZZqiWNlQpFAywNvnC7HAah5EaGn2jrpup5CCNJNBFvN
	7ltNSUEtYL3WvYwqIfB1feWbUvtypGVqemrSuGPAnewlHjqtqPlHWVEmx0EB0YJbtw/2kx7/2+j
	y17e3kU8m1e6+RQL1zVoIpBowya0oVrENEXYwDQ1mZKiLn2/Y40Xl1AAZzxz/nSn7a0YExJ3iBN
	xDOi3p2NIkdhUCfwxqpOsQ6rNklxdhww7i8iAYEicssymBltmDGwMgor6AXfSc0eCMwVgejmgTM
	FA9xMfh8QFqjbHiDad7qq5Go7ybD6sh8A7BBBrCR2BZfxpX2cFQ19qLeBQTXywNy+khx+LgQeqy
	AG/LBnK+vaRrQPDa8/4/rZh8qITIsHahxnC3vVj8KVgJarD4aeFOdx9N/N0R7eMAcW6PCm/Qple
	YhxOEDWOC9Lo4q4xFmKLFPM=
X-Received: by 2002:a05:6000:2903:b0:484:3313:a046 with SMTP id ffacd0b85a97d-484914f1683mr3231063f8f.6.1788343195303;
        Wed, 02 Sep 2026 02:59:55 -0700 (PDT)
Received: from [192.168.1.144] (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e736a6sm5127715f8f.5.2026.09.02.02.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:59:54 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, jacob.e.keller@intel.com,
 syzbot+372a7d84708b07f64d9b@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org
Subject:
 Re: [PATCH net v3] devlink: use direct firmware requests for flash updates
Date: Wed, 02 Sep 2026 11:59:53 +0200
Message-ID: <178834319365.3590598.1559493927150458484@gmail.com>
In-Reply-To: <46ae913f-39e8-4041-b15a-8e7363cd2fd4@lunn.ch>
References: <20260830111700.1799255-1-miguelgarciaroman8@gmail.com>
 <20260901123819.2035064-1-miguelgarciaroman8@gmail.com>
 <46ae913f-39e8-4041-b15a-8e7363cd2fd4@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks, I've resent v4 as a new thread.
